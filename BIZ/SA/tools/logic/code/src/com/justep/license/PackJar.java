package com.justep.license;

import java.io.*;
import java.security.InvalidKeyException;
import java.security.KeyFactory;
import java.security.NoSuchAlgorithmException;
import java.security.PrivateKey;
import java.security.Signature;
import java.security.SignatureException;
import java.security.spec.InvalidKeySpecException;
import java.security.spec.PKCS8EncodedKeySpec;
import java.util.jar.JarEntry;
import java.util.jar.JarOutputStream;

public class PackJar {
	static final int BUFFER = 2 * 1024;
	private String filePath;
	private JarOutputStream out;
	private File fromFile;
	private File toFile;
	private byte[] dsaPVRawKey = null;

	public PackJar(File fromFile, File toFile) {
		filePath = fromFile.getAbsolutePath() + "\\";
		this.fromFile = fromFile;
		this.toFile = toFile;
	}

	public void start() {
		try {
			FileOutputStream fos = new FileOutputStream(toFile);
			out = new JarOutputStream(new BufferedOutputStream(fos));
			try {
				makeJar(fromFile);
			} finally {
				out.close();
			}
		} catch (IOException e) {
			throw new RuntimeException("创建jar[" + toFile.getAbsolutePath() + "]失败", e);
		}
		if (null != dsaPVRawKey)
			sign(toFile, dsaPVRawKey);
	}

	public void setDsaPVRawKey(byte[] dsaPVRawKey) {
		this.dsaPVRawKey = dsaPVRawKey;
	}

	private void makeJar(File fromFile) throws IOException {
		File[] fileList = fromFile.listFiles();
		for (int i = 0; i < fileList.length; i++) {
			File _f = fileList[i];
			if (_f.isDirectory()) {
				makeJar(_f);
			} else {
				String path = _f.getAbsolutePath();
				path = getAbsolutePath(path);
				writeEntry(path, _f, out);
			}
		}
	}

	private void writeEntry(String EntryName, File file, JarOutputStream out) throws IOException {
		JarEntry entry = new JarEntry(EntryName);
		out.putNextEntry(entry);
		FileInputStream fi = new FileInputStream(file);
		BufferedInputStream origin = null;
		origin = new BufferedInputStream(fi, BUFFER);

		int count;
		byte data[] = new byte[BUFFER];
		while ((count = origin.read(data, 0, BUFFER)) != -1) {
			out.write(data, 0, count);
		}
		origin.close();

	}

	private String getAbsolutePath(String strPath) {
		String ret = strPath.substring(filePath.length(), strPath.length());
		return EncryptModel.rewriteFilePath(ret);
	}

	private void sign(File file, byte[] dsaPVRawKey) {
		PrivateKey pvk;
		try {
			byte[] m = null;
			pvk = KeyFactory.getInstance("DSA").generatePrivate(new PKCS8EncodedKeySpec(dsaPVRawKey));
			FileInputStream fis = new FileInputStream(file);
			try {
				int size = fis.available();
				m = new byte[size];
				fis.read(m);
			} finally {
				fis.close();
			}

			Signature signalg = Signature.getInstance("DSA");
			signalg.initSign(pvk);
			signalg.update(m);
			byte[] signature = signalg.sign();

			File s = new File(file.getAbsolutePath() + ".sign");
			FileOutputStream fos = new FileOutputStream(s);
			try {
				fos.write(signature);
			} finally {
				fos.close();
			}
		} catch (InvalidKeySpecException e) {
			throw new RuntimeException("签名jar[" + toFile.getAbsolutePath() + "]失败，无效的签名私钥", e);
		} catch (NoSuchAlgorithmException e) {
			throw new RuntimeException("签名jar[" + toFile.getAbsolutePath() + "]失败", e);
		} catch (IOException e) {
			throw new RuntimeException("签名jar[" + toFile.getAbsolutePath() + "]失败", e);
		} catch (InvalidKeyException e) {
			throw new RuntimeException("签名jar[" + toFile.getAbsolutePath() + "]失败，无效的签名私钥", e);
		} catch (SignatureException e) {
			throw new RuntimeException("签名jar[" + toFile.getAbsolutePath() + "]失败", e);
		}
	}

}