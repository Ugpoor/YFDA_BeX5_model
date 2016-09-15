package com.google.zxing.client.android;

import android.app.Activity;
import android.app.ProgressDialog;
import android.content.Intent;
import android.content.res.AssetFileDescriptor;
import android.database.Cursor;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.media.AudioManager;
import android.media.MediaPlayer;
import android.media.MediaPlayer.OnCompletionListener;
import android.os.Bundle;
import android.os.Handler;
import android.os.Message;
import android.os.Vibrator;
import android.provider.MediaStore;
import android.text.TextUtils;
import android.view.SurfaceHolder;
import android.view.SurfaceHolder.Callback;
import android.view.SurfaceView;
import android.view.View;
import android.view.View.OnClickListener;
import android.widget.Button;
import android.widget.ImageButton;
import android.widget.Toast;
import com.FakeR;
import com.google.zxing.BarcodeFormat;
import com.google.zxing.BinaryBitmap;
import com.google.zxing.ChecksumException;
import com.google.zxing.DecodeHintType;
import com.google.zxing.FormatException;
import com.google.zxing.NotFoundException;
import com.google.zxing.Result;
import com.google.zxing.common.HybridBinarizer;
import com.google.zxing.qrcode.QRCodeReader;
import com.mining.app.zxing.camera.CameraManager;
import com.mining.app.zxing.decoding.CaptureActivityHandler;
import com.mining.app.zxing.decoding.InactivityTimer;
import com.mining.app.zxing.decoding.RGBLuminanceSource;
import com.mining.app.zxing.view.ViewfinderView;

import java.io.IOException;
import java.util.Hashtable;
import java.util.Vector;

/**
 * Initial the camera
 */
public class CaptureActivity extends Activity implements Callback {

	private CaptureActivityHandler handler;
	private ViewfinderView viewfinderView;
	private boolean hasSurface;
	private Vector<BarcodeFormat> decodeFormats;
	private String characterSet;
	private InactivityTimer inactivityTimer;
	private MediaPlayer mediaPlayer;
	private boolean playBeep;
	private static final float BEEP_VOLUME = 0.10f;
	private static final int REQUEST_CODE = 100;
	private static final int PARSE_BARCODE_SUC = 300;
	private static final int PARSE_BARCODE_FAIL = 303;
//	public static  int beep = 0x7f040000;
	private ProgressDialog mProgress;
	private boolean vibrate;
	private String photo_path;
	private Bitmap scanBitmap;
	private static FakeR fakeR;
	public static final String RESULT = "SCAN_RESULT";
	public static final String RESULT_FORMAT = "SCAN_RESULT_FORMAT";

	/** Called when the activity is first created. */
	@Override
	public void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		fakeR = new FakeR(this);
		setContentView(fakeR.getId("layout", "activity_capture"));
		CameraManager.init(getApplication());
		viewfinderView = (ViewfinderView) findViewById(fakeR.getId("id", "viewfinder_view"));

		Button mButtonBack = (Button) findViewById(fakeR.getId("id", "button_back"));
		mButtonBack.setOnClickListener(new OnClickListener() {

			@Override
			public void onClick(View v) {
				CaptureActivity.this.finish();

			}
		});
		ImageButton mButtonFlash = (ImageButton) findViewById(fakeR.getId("id", "btn_flashlight"));
		mButtonFlash.setOnClickListener(new OnClickListener() {

			@Override
			public void onClick(View v) {
				CameraManager.get().flashHandler();
			}
		});
		ImageButton mButtonGallery = (ImageButton) findViewById(fakeR.getId("id", "btn_gallery"));
		mButtonGallery.setOnClickListener(new OnClickListener() {

			@Override
			public void onClick(View v) {
			Intent intent = new Intent(Intent.ACTION_PICK, MediaStore.Images.Media.EXTERNAL_CONTENT_URI);
			intent.setDataAndType(MediaStore.Images.Media.EXTERNAL_CONTENT_URI,"image/*");
			CaptureActivity.this.startActivityForResult(intent, REQUEST_CODE);
			}
		});
		hasSurface = false;
		inactivityTimer = new InactivityTimer(this);
	}

	@Override
	protected void onResume() {
		super.onResume();
		SurfaceView surfaceView = (SurfaceView) findViewById(fakeR.getId("id", "preview_view"));
		SurfaceHolder surfaceHolder = surfaceView.getHolder();
		if (hasSurface) {
			initCamera(surfaceHolder);
		} else {
			surfaceHolder.addCallback(this);
			surfaceHolder.setType(SurfaceHolder.SURFACE_TYPE_PUSH_BUFFERS);
		}
		decodeFormats = null;
		characterSet = null;

		playBeep = true;
		AudioManager audioService = (AudioManager) getSystemService(AUDIO_SERVICE);
		if (audioService.getRingerMode() != AudioManager.RINGER_MODE_NORMAL) {
			playBeep = false;
		}
//		initBeepSound();
		vibrate = true;

	}

	@Override
	protected void onPause() {
		super.onPause();
		if (handler != null) {
			handler.quitSynchronously();
			handler = null;
		}
		CameraManager.get().closeDriver();
	}

	@Override
	protected void onDestroy() {
		inactivityTimer.shutdown();
		super.onDestroy();
	}

	/**
	 * 处理扫描的结果
	 * @param result
	 * @param barcode
	 */
	public void handleDecode(Result result, Bitmap barcode) {
		inactivityTimer.onActivity();
		playBeepSoundAndVibrate();
		String resultString = result.getText();
		if (resultString.equals("")) {
			Toast.makeText(CaptureActivity.this, "Scan failed!", Toast.LENGTH_SHORT).show();
		}else {
//			Intent resultIntent = new Intent();
//			Bundle bundle = new Bundle();
//			bundle.putString("result", resultString);
//			bundle.putParcelable("bitmap", barcode);
//			resultIntent.putExtras(bundle);
//			this.setResult(RESULT_OK, resultIntent);
			Intent intent = new Intent(getIntent().getAction());
			intent.addFlags(Intent.FLAG_ACTIVITY_CLEAR_WHEN_TASK_RESET);
			intent.putExtra("SCAN_RESULT", result.toString());
			intent.putExtra("SCAN_RESULT_FORMAT", "SCAN_RESULT_FORMAT");
			setResult(RESULT_OK, intent);
		}
		CaptureActivity.this.finish();
	}

	private void initCamera(SurfaceHolder surfaceHolder) {
		try {
			CameraManager.get().openDriver(surfaceHolder);
		} catch (IOException ioe) {
			return;
		} catch (RuntimeException e) {
			return;
		}
		if (handler == null) {
			handler = new CaptureActivityHandler(this, decodeFormats,
					characterSet);
		}
	}

	@Override
	public void surfaceChanged(SurfaceHolder holder, int format, int width,
							   int height) {

	}

	@Override
	public void surfaceCreated(SurfaceHolder holder) {
		if (!hasSurface) {
			hasSurface = true;
			initCamera(holder);
		}

	}

	@Override
	public void surfaceDestroyed(SurfaceHolder holder) {
		hasSurface = false;

	}

	public ViewfinderView getViewfinderView() {
		return viewfinderView;
	}

	public Handler getHandler() {
		return handler;
	}

	public void drawViewfinder() {
		viewfinderView.drawViewfinder();

	}

//	private void initBeepSound() {
//		if (playBeep && mediaPlayer == null) {
//			// The volume on STREAM_SYSTEM is not adjustable, and users found it
//			// too loud,
//			// so we now play on the music stream.
//			setVolumeControlStream(AudioManager.STREAM_MUSIC);
//			mediaPlayer = new MediaPlayer();
//			mediaPlayer.setAudioStreamType(AudioManager.STREAM_MUSIC);
//			mediaPlayer.setOnCompletionListener(beepListener);
//
//			AssetFileDescriptor file = getResources().openRawResourceFd(
//					beep);
//			try {
//				mediaPlayer.setDataSource(file.getFileDescriptor(),
//						file.getStartOffset(), file.getLength());
//				file.close();
//				mediaPlayer.setVolume(BEEP_VOLUME, BEEP_VOLUME);
//				mediaPlayer.prepare();
//			} catch (IOException e) {
//				mediaPlayer = null;
//			}
//		}
//	}

	private static final long VIBRATE_DURATION = 200L;

	private void playBeepSoundAndVibrate() {
		if (playBeep && mediaPlayer != null) {
			mediaPlayer.start();
		}
		if (vibrate) {
			Vibrator vibrator = (Vibrator) getSystemService(VIBRATOR_SERVICE);
			vibrator.vibrate(VIBRATE_DURATION);
		}
	}

	/**
	 * When the beep has finished playing, rewind to queue up another one.
	 */
	private final OnCompletionListener beepListener = new OnCompletionListener() {
		public void onCompletion(MediaPlayer mediaPlayer) {
			mediaPlayer.seekTo(0);
		}
	};
	private Handler mHandler = new Handler(){

		@Override
		public void handleMessage(Message msg) {
			super.handleMessage(msg);

			mProgress.dismiss();
			switch (msg.what) {
				case PARSE_BARCODE_SUC:
					onResultHandler((String)msg.obj, scanBitmap);
					break;
				case PARSE_BARCODE_FAIL:
					Toast.makeText(CaptureActivity.this, (String)msg.obj, Toast.LENGTH_LONG).show();
					break;

			}
		}

	};

	@Override
	protected void onActivityResult(int requestCode, int resultCode, Intent data) {
		super.onActivityResult(requestCode, resultCode, data);
		try{
			if(resultCode == RESULT_OK){
				switch(requestCode){
					case REQUEST_CODE:
						//获取选中图片的路径
						Cursor cursor = getContentResolver().query(data.getData(), null, null, null, null);
						if (cursor.moveToFirst()) {
							photo_path = cursor.getString(cursor.getColumnIndex(MediaStore.Images.Media.DATA));
						}
						cursor.close();
						mProgress = new ProgressDialog(CaptureActivity.this);
						mProgress.setMessage("正在扫描...");
						mProgress.setCancelable(false);
						mProgress.show();

						new Thread(new Runnable() {
							@Override
							public void run() {
								Result result = scanningImage(photo_path);
								if (result != null) {
									Message m = mHandler.obtainMessage();
									m.what = PARSE_BARCODE_SUC;
									m.obj = result.getText();
									mHandler.sendMessage(m);
								} else {
									Message m = mHandler.obtainMessage();
									m.what = PARSE_BARCODE_FAIL;
									m.obj = "Scan failed!";
									mHandler.sendMessage(m);
								}
							}
						}).start();

						break;

				}
			}
		}catch(Exception ex){
			ex.printStackTrace();
		}

	}
	/**
	 * 扫描二维码图片的方法
	 * @param path
	 * @return
	 */
	public Result scanningImage(String path) {
		if(TextUtils.isEmpty(path)){
			return null;
		}
		Hashtable<DecodeHintType, String> hints = new Hashtable<DecodeHintType, String>();
		hints.put(DecodeHintType.CHARACTER_SET, "UTF8"); //设置二维码内容的编码

		BitmapFactory.Options options = new BitmapFactory.Options();
		options.inJustDecodeBounds = true; // 先获取原大小
		scanBitmap = BitmapFactory.decodeFile(path, options);
		options.inJustDecodeBounds = false; // 获取新的大小
		int sampleSize = (int) (options.outHeight / (float) 200);
		if (sampleSize <= 0)
			sampleSize = 1;
		options.inSampleSize = sampleSize;
		scanBitmap = BitmapFactory.decodeFile(path, options);
		RGBLuminanceSource source = new RGBLuminanceSource(scanBitmap);
		BinaryBitmap bitmap1 = new BinaryBitmap(new HybridBinarizer(source));
		QRCodeReader reader = new QRCodeReader();
		try {
			return reader.decode(bitmap1, hints);

		} catch (NotFoundException e) {
			e.printStackTrace();
		} catch (ChecksumException e) {
			e.printStackTrace();
		} catch (FormatException e) {
			e.printStackTrace();
		}
		return null;
	}

	/**
	 * 跳转到上一个页面
	 * @param resultString
	 * @param bitmap
	 */
	private void onResultHandler(String resultString, Bitmap bitmap){
		if(TextUtils.isEmpty(resultString)){
			Toast.makeText(CaptureActivity.this, "Scan failed!", Toast.LENGTH_SHORT).show();
			return;
		}
		Intent intent = new Intent(getIntent().getAction());
		intent.addFlags(Intent.FLAG_ACTIVITY_CLEAR_WHEN_TASK_RESET);
		intent.putExtra("SCAN_RESULT", resultString);
		intent.putExtra("SCAN_RESULT_FORMAT", "SCAN_RESULT_FORMAT");
		setResult(RESULT_OK, intent);
		CaptureActivity.this.finish();

	}


  private void sendReplyMessage(int id, Object arg, long delayMS) {
    Message message = Message.obtain(handler, id, arg);
    if (delayMS > 0L) {
      handler.sendMessageDelayed(message, delayMS);
    } else {
      handler.sendMessage(message);
    }
  }
}