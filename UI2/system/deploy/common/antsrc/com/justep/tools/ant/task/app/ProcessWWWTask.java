package com.justep.tools.ant.task.app;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.security.InvalidAlgorithmParameterException;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;
import java.security.Security;

import javax.crypto.BadPaddingException;
import javax.crypto.Cipher;
import javax.crypto.IllegalBlockSizeException;
import javax.crypto.KeyGenerator;
import javax.crypto.NoSuchPaddingException;
import javax.crypto.SecretKey;
import javax.crypto.spec.SecretKeySpec;

import org.apache.tools.ant.BuildException;
import org.apache.tools.ant.Task;
import org.apache.tools.ant.util.FileUtils;

public class ProcessWWWTask extends Task {

	static final String LINE_SEPARATOR = System.getProperty("line.separator");

	private String dir;
	private String targetDir;
	private String resEncryption;

	private Cipher cipher;
	private boolean encode;
	private byte[] key = { 49, 50, 51, 52, 53, 54, 55, 56, 57, 48, 49, 50, 51, 52, 53, 54 };
	private static final char[] DIGITS = { '0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'a', 'b', 'c', 'd', 'e', 'f' };

	private static char[] encodeHex(byte[] data) {
		int l = data.length;
		char[] out = new char[l << 1];
		for (int i = 0, j = 0; i < l; i++) {
			out[j++] = DIGITS[(0xF0 & data[i]) >>> 4];
			out[j++] = DIGITS[0x0F & data[i]];
		}
		return out;
	}

	private static int toDigit(char ch, int index) throws Exception {
		int digit = Character.digit(ch, 16);
		if (digit == -1) {
			throw new Exception("资源密钥格式不正确。");
		}
		return digit;
	}

	private static byte[] decodeHex(char[] data) throws Exception {
		int len = data.length;

		if ((len & 0x01) != 0) {
			throw new Exception("资源密钥格式不正确。");
		}

		byte[] out = new byte[len >> 1];

		// two characters form the hex value.
		for (int i = 0, j = 0; j < len; i++) {
			int f = toDigit(data[j], j) << 4;
			j++;
			f = f | toDigit(data[j], j);
			j++;
			out[i] = (byte) (f & 0xFF);
		}

		return out;
	}

	private void encryptFile(File fromFile, File toFile) throws IOException, NoSuchAlgorithmException, NoSuchPaddingException, InvalidKeyException, IllegalBlockSizeException, BadPaddingException,
			InvalidAlgorithmParameterException {
		InputStream in = new FileInputStream(fromFile);
		ByteArrayOutputStream out = new ByteArrayOutputStream();
		byte[] buffer = new byte[1024];
		int length;
		while ((length = in.read(buffer)) > 0) {
			out.write(buffer, 0, length);
		}
		in.close();
		byte[] content = out.toByteArray();
		byte[] result = cipher.doFinal(content);

		OutputStream outStream = new FileOutputStream(toFile);
		outStream.write(result);
		outStream.close();
	}

	private void copy(File fromFile, File toFile) throws IOException, InvalidKeyException, NoSuchAlgorithmException, NoSuchPaddingException, IllegalBlockSizeException, BadPaddingException,
			InvalidAlgorithmParameterException {
		if (fromFile.isDirectory()) {
			if (!toFile.exists()) {
				toFile.mkdir();
			}

			String files[] = fromFile.list();
			for (String file : files) {
				File srcFile = new File(fromFile, file);
				File destFile = new File(toFile, URLEncoder.encode(file, "UTF-8"));
				copy(srcFile, destFile);
			}
		} else {
			if (encode) {
				encryptFile(fromFile, toFile);
			} else {
				FileUtils.getFileUtils().copyFile(fromFile, toFile, null, true);
			}
		}
	}

	public void setDir(String dir) {
		this.dir = dir;
	}

	public void setTargetDir(String targetDir) {
		this.targetDir = targetDir;
	}

	public void setResEncryption(String resEncryption) {
		this.resEncryption = resEncryption;
	}

	public void execute() throws BuildException {
		try {
			String resPassword = getProject().getProperty("resPassword");
			encode = "true".equals(resEncryption);
			// 密钥规则：如果为空，则自动生成，后续沿用此密钥
			if (encode) {
				Security.addProvider(new org.bouncycastle.jce.provider.BouncyCastleProvider());
				// 如果为空，自动生成密匙生成。原先默认值是12345678，默认情况需要新生成
				if ((resPassword == null) || "".equals(resPassword) || "12345678".equals(resPassword)) {
					KeyGenerator kg = KeyGenerator.getInstance("AES");
					kg.init(128);
					SecretKey sKey = kg.generateKey();
					key = sKey.getEncoded();
					for (int i = 0; i < key.length; i++) {
						// ios 下高位处理有问题，这里统一去掉高位，取正数
						key[i] = (byte) Math.abs(key[i]);
					}
					resPassword = new String(encodeHex(key));
				} else {
					key = decodeHex(resPassword.toCharArray());
				}

				SecretKeySpec skeySpec = new SecretKeySpec(key, "AES");
				cipher = Cipher.getInstance("AES/ECB/PKCS7Padding", "BC");
				cipher.init(Cipher.ENCRYPT_MODE, skeySpec);
			}

			copy(new File(dir), new File(targetDir));

			getProject().setProperty("resPassword", resPassword);
		} catch (Exception e) {
			throw new BuildException(e);
		}
	}
}