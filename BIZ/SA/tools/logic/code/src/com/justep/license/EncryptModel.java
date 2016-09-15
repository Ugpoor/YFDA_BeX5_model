package com.justep.license;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStreamReader;

import com.justep.common.SystemUtils;
import com.justep.filesystem.FileSystemWrapper;

public class EncryptModel {
	private static String JNI = "biz-encrypt-model-jni";
	private static String LIB_PATH = "/SA/tools/logic/code/lib";
	private String userName;//开发商名称
	private String userCode;//开发商编码
	private String sourceModelPath, targetModelPath;//源模型目录和目标模型目录

	static {
		//特殊逻辑：因为license已经加载完了, 所以可以使用license相关信息
		boolean isDev = (com.justep.license.LicenseChecker.instance().getLicense().getKind()==0);
		String dll = SystemUtils.normalizeLib(SystemUtils.getAppHome() + "/lib", SystemUtils.normalizeDevLib(JNI, isDev));
		System.load(dll);
	}

	public EncryptModel(byte[] cert, String sourceModelPath, String targetModelPath) {
		setDeveloperCert(cert);
		this.sourceModelPath = sourceModelPath;
		this.targetModelPath = targetModelPath;
	}

	/**
	 * 
	 * @param filepath
	 * @throws IOException
	 */
	private static void deleteFile(String filepath) {
		File f = new File(filepath);// 定义文件路径
		if (f.exists()) {// 判断是文件还是目录
			if (f.isDirectory()) {
				if (f.listFiles().length == 0) {// 若目录下没有文件则直接删除
					f.delete();
				} else {// 若有则把文件放进数组，并判断是否有下级目录
					File delFile[] = f.listFiles();
					int i = f.listFiles().length;
					for (int j = 0; j < i; j++) {
						if (delFile[j].isDirectory()) {
							deleteFile(delFile[j].getAbsolutePath());// 递归调用del方法并取得子目录路径
						}
						delFile[j].delete();// 删除文件
					}
				}
			} else
				f.delete();
		}
	}

	// 复制文件
	private static void copyFile(File sourceFile, File targetFile) throws IOException {
		if (sourceFile.getCanonicalPath().endsWith(".w"))
			return;//.w不进行复制
		BufferedInputStream inBuff = null;
		BufferedOutputStream outBuff = null;
		try {
			// 新建文件输入流并对它进行缓冲
			inBuff = new BufferedInputStream(new FileInputStream(sourceFile));

			// 新建文件输出流并对它进行缓冲
			outBuff = new BufferedOutputStream(new FileOutputStream(targetFile));

			// 缓冲数组
			byte[] b = new byte[1024 * 4];
			int len;
			while ((len = inBuff.read(b)) != -1) {
				outBuff.write(b, 0, len);
			}
			// 刷新此缓冲的输出流
			outBuff.flush();
		} finally {
			// 关闭流
			if (inBuff != null)
				inBuff.close();
			if (outBuff != null)
				outBuff.close();
		}
	}

	// 复制文件夹
	private static void copyDirectiory(String sourceDir, String targetDir) throws IOException {
		File fSourceDir = new File(sourceDir);
		if (!fSourceDir.exists())
			return;
		if (sourceDir.endsWith(".svn") || (!sourceDir.endsWith("dsrc") && sourceDir.endsWith("src")))
			return;//.svn .cache不进行复制
		// 新建目标目录
		(new File(targetDir)).mkdirs();
		// 获取源文件夹当前下的文件或目录
		File[] file = fSourceDir.listFiles();
		boolean isCacheDir = -1<sourceDir.lastIndexOf(File.separator+".cache");
		for (int i = 0; i < file.length; i++) {
			if (file[i].isFile() && (!isCacheDir || (isCacheDir && file[i].getCanonicalPath().endsWith(".report")))) {
				// 源文件
				File sourceFile = file[i];
				// 目标文件
				File targetFile = new File(new File(targetDir).getAbsolutePath() + File.separator + file[i].getName());
				copyFile(sourceFile, targetFile);
			}
			if (file[i].isDirectory()) {
				// 准备复制的源文件夹
				String dir1 = sourceDir + File.separator + file[i].getName();
				// 准备复制的目标文件夹
				String dir2 = targetDir + File.separator + file[i].getName();
				copyDirectiory(dir1, dir2);
			}
		}
	}

	private void init(String model) throws IOException {
		//删除文件夹
		deleteFile(targetModelPath + model);

		//copy文件夹
		copyDirectiory(sourceModelPath + model, targetModelPath + model);
	}

	protected native void setDeveloperCert(byte[] cert);

	protected native void encryptFile(String file, String key, boolean aes, boolean dsa);

	protected native void signFile(String file, String key);

	protected void encryptClassDir(File classDir, String key) throws IOException{
		if(!classDir.isDirectory()) return;
		//biz代码打包成slib
		for (File f : classDir.listFiles()) {
			if (f.isFile()) {
				if(f.getName().endsWith(".class"))
					encryptFile(f.getCanonicalPath(), key, true, false);
			}else if (f.isDirectory()) {
				encryptClassDir(f, key);
			}
		}
	}
	
	protected void packSlib(File classDir, String key) throws IOException {
		if(!classDir.isDirectory()) return;
		if(0<classDir.list().length){
			//class加密
			encryptClassDir(classDir, key);
			//biz代码打包成slib
			File slibFile = new File(classDir.getParentFile().getAbsolutePath() + File.separator + "slib" + File.separator + classDir.getName() + ".jar");
			if (!slibFile.getParentFile().exists())
				slibFile.getParentFile().mkdirs();
			PackJar packJar = new PackJar(classDir, slibFile);
			//packJar.setDsaPVRawKey(dsaPVRawKey);
			packJar.start();
			signFile(slibFile.getAbsolutePath(), key);
		}
		deleteFile(classDir.getAbsolutePath());
	}

	/**
	 * 重写文件路径，主要是为了统一格式.
	 * @param oldFilePath 旧的路径
	 * @return
	 */
	public static String rewriteFilePath(String oldFilePath) {
		return oldFilePath.replace("\\", "/").replace("\\\\", "/");
	}

	public void encryptDir(String dir, String key) throws IOException {
		File fDir = new File(dir);
		if (!fDir.exists())
			return;
		for (File f : fDir.listFiles()) {
			String fileName = rewriteFilePath(f.getCanonicalPath()).toLowerCase();
			if (f.isFile()) {
				if ((fileName.endsWith(".m")&&!fileName.endsWith(".process.m")) || (-1 < fileName.indexOf("/.release/") && (fileName.endsWith(".w.form")||fileName.endsWith(".w.form.xml")))) {
					encryptFile(fileName, key, true, true);
					deleteFile(fileName);
				}
			} else if (f.isDirectory()) {
				if (-1 < fileName.indexOf("/biz/") && ("classes".equalsIgnoreCase(f.getName()))) {
					packSlib(f, key);
				} else
					encryptDir(f.getAbsolutePath(), key);
			}
		}
	}

	/*
	 * 模型根据开发者证书签名
	 * model支持格式：/BIZ/demo、/UI/demo、/UI2/demo、/demo
	 */
	public void encrypt(String model, String key, boolean isCompile) throws IOException {
		if (null == model || "".equals(model) || !model.startsWith("/"))
			throw new RuntimeException("输入的模块路径不正确，支持格式：/BIZ/demo、/UI/demo、/UI2/demo、/demo");

		//编译模型，包括代码和.w
		if(isCompile) compile(model);

		String s = model.toLowerCase();
		if (s.startsWith("/biz/") || s.startsWith("/ui/") || s.startsWith("/mobileui/")) {
			//初始化，删除目标下的文件
			File fSourceDir = new File(sourceModelPath + model);
			if (!fSourceDir.exists())
				throw new RuntimeException("原目录["+sourceModelPath + model+"]不存在");
			init(model);
			encryptDir(targetModelPath + model, key);
		} else {
			File fSourceDir = new File(sourceModelPath + "/BIZ" + model);
			if (!fSourceDir.exists())
				throw new RuntimeException("原目录["+sourceModelPath + "/BIZ" + model+"]不存在");
			init("/BIZ" + model);
			encryptDir(targetModelPath + "/BIZ" + model, key);
			init("/UI2" + model);
			encryptDir(targetModelPath + "/UI2" + model, key);
			init("/UI" + model);
			encryptDir(targetModelPath + "/UI" + model, key);
			init("/mobileUI" + model);
			encryptDir(targetModelPath + "/mobileUI" + model, key);
		}
	}

	protected void compile(String model) {
		String s = model.toLowerCase();
		if (s.startsWith("/biz/")) {
			compileBIZ(model);
		} else if (s.startsWith("/ui/") || s.startsWith("/ui2/") || s.startsWith("/mobileui/")) {
			compileUI(model);
		} else {
			compileBIZ("/BIZ" + model);
			compileUI(model);
		}
	}

	public static boolean isWindowsOS() {
		return SystemUtils.isWindows();
	}

	protected void compileUI(String model) {
		String s = model.toLowerCase();
		if (s.startsWith("/ui2/")) {
			model = model.substring(4);
		}else if (s.startsWith("/ui/")) {
			model = model.substring(3);
		} else if (s.startsWith("/mobileui/")) {
			model = model.substring(9);
		}
		String justep_home = SystemUtils.getHome(null);
		String model_lib = FileSystemWrapper.instance().getRealPath(LIB_PATH);
		String ui_lib = "./runtime/UIServer/WEB-INF/lib";
		String classPath = "%UI_LIB%/biz-client.jar;%UI_LIB%/ui-classloader.jar;%UI_LIB%/message.jar;%UI_LIB%/ui-common.jar;%UI_LIB%/commons-beanutils-1_5.jar;%UI_LIB%/commons-codec-1_3.jar;%UI_LIB%/commons-collections-3_1.jar;%UI_LIB%/commons-fileupload-1.2.1.jar;%UI_LIB%/commons-httpclient-3_1.jar;%UI_LIB%/commons-io.jar;%UI_LIB%/commons-lang-2_3.jar;%UI_LIB%/commons-logging-1.0.4.jar;%UI_LIB%/dom4j-1_6_1.jar;%UI_LIB%/ui-excel.jar;%UI_LIB%/ui-excel-convert.jar;%UI_LIB%/ui-ext-space.jar;%UI_LIB%/FCKeditor-2.3.jar;%UI_LIB%/freemarker.jar;%UI_LIB%/jakarta-slide-webdavlib-2.0rc1.jar;%UI_LIB%/jaxen-1_1_beta_9.jar;%UI_LIB%/json.jar;%UI_LIB%/jxl.jar;%UI_LIB%/log4j-1.2.14.jar;%UI_LIB%/ui-master.jar;%UI_LIB%/ui-model-parser.jar;%UI_LIB%/portal-core.jar;%UI_LIB%/report.jar;%UI_LIB%/report-proxy.jar;%UI_LIB%/resources.jar;%UI_LIB%/saxon-8_8_orbeon_20080516.jar;%UI_LIB%/ss_css2_ext.jar;%UI_LIB%/stax-1.2.0.jar;%UI_LIB%/stax-api-1.0.jar;%UI_LIB%/tools.jar;%UI_LIB%/transform.jar;%UI_LIB%/ui-core.jar;%UI_LIB%/update.jar;%UI_LIB%/xalan-2_5_1_orbeon.jar;%UI_LIB%/xerces-xercesImpl-2_9_orbeon_20070711.jar;%UI_LIB%/xerces-xml-apis-2_9_orbeon_20070711.jar;%MODEL_LIB%/servlet-api.jar;%MODEL_LIB%/compileUI.jar";
		String cmd = justep_home + "/java/jre1.8/bin/java -Xms64m -Xmx512m -classpath %CLASSPATH% com.justep.tools.CompileUI";

		cmd = cmd.replaceAll("%CLASSPATH%", classPath).replaceAll("%UI_LIB%", ui_lib).replaceAll("%MODEL_LIB%", model_lib)
				.replaceAll("%UI%", "./model/UI").replaceAll("%MOBILE_UI%", "./model/mobileUI");
		if (0 > runCMD(cmd, null, justep_home))
			throw new RuntimeException("执行编译UI模型[" + model + "]失败");
	}

	protected void compileBIZ(String model) {
		String justep_home = SystemUtils.getHome(null);
		String java_home = "./jdk";
		String model_lib = FileSystemWrapper.instance().getRealPath(LIB_PATH);
		String biz_lib = "./runtime/BusinessServer/WEB-INF/lib";
		String classPath = "%JAVA_HOME%/lib/dt.jar;%JAVA_HOME%/lib/tools.jar;%JAVA_HOME%/jre/lib/rt.jar;%BIZ_LIB%/dom4j-1_6_1.jar;%BIZ_LIB%/message.jar;%BIZ_LIB%/biz-common.jar;%BIZ_LIB%/biz-model-parser.jar;%BIZ_LIB%/biz-ext-space.jar;%BIZ_LIB%/log4j-1.2.14.jar;%BIZ_LIB%/jaxen-1_1_beta_9.jar;";
		String cmd = justep_home + "/java/jre1.8/bin/java -Xbootclasspath/a:%CLASSPATH% -jar %MODEL_LIB%/compileBIZ.jar %BIZ% %BIZ_LIB% %MODEL_LIB%";

		cmd = cmd.replaceAll("%CLASSPATH%", classPath).replaceAll("%JAVA_HOME%", java_home).replaceAll("%BIZ_LIB%", biz_lib)
				.replaceAll("%MODEL_LIB%", model_lib).replaceAll("%BIZ%", "./model/BIZ");
		if (0 > runCMD(cmd, null, justep_home))
			throw new RuntimeException("执行编译BIZ模型[" + model + "]源码失败");
	}

	protected int runCMD(String cmd, String[] envp, String dir) {
		String s = null;
		try {
			StringBuffer sb = new StringBuffer();
			Process process = Runtime.getRuntime().exec(cmd, envp, new File(dir));
			BufferedReader bufferedReader = new BufferedReader(new InputStreamReader(process.getInputStream()));
			while ((s = bufferedReader.readLine()) != null){
				sb.append(s);
				System.out.println(s);
			}
			return process.waitFor();
		} catch (IOException e) {
			throw new RuntimeException("执行编译失败[" + cmd + "]", e);
		} catch (InterruptedException e) {
			throw new RuntimeException("执行编译失败[" + cmd + "]", e);
		}
	}

	public static void main(String[] args) throws IOException {
		EncryptModel eModel = new EncryptModel(
				"wx3jSDAMdDgllwXFfjTmSTgbXYanjTigzA1vWpvb0CZ/cCcI7gKRUFFa797Qdks8BvMJL3xCv05CfnQ+nRoFxJQElaC16nNqjhYJ7vVMU+EhXufMidwiOUfGj9Av7t/WXXPbw1MqRi+uKkqKMXZAJqpyawXb6JcTFJuPqrtvV0YqLi9Y2eQOT5ngw1LPzNBtv8t94jcJvGQIcbErGTwXEQAaTVmh5BKO+rFi2I+MOdGq51uODg3sgRd5QhxnrQpSMk56Ip0MJx8Qf8RNvvX15fYk/JPsrJ/+x+Z+oEMhPqDwIMCkOx3yQnubUOxYHfOipQzpvtfFenAgXEUCTkhWNjgHgImwaHaSccr8l9eGDfc8VXwEWhSIAy7oFClgXg1492qxf37byBIfvWThegV8Qvs9wWvjrTNV2LU5a2kOQNiJA26vOB+xTKpeWPVvPrcVb0SCEvK7vcSNwu4GVf1dlSHgnMig79sNILjdPOeIVK9tAs8YUVXLOKpGKqFBu6CmT8xdBW1qge7rRWf6ewL8/NcW1dfy6qrN/OMF5ue8VEMu3XMDWUTlGU1lZN70MkEtT4EGwJaFQiV/KQkUuE0VKfbglOjKYKUtjJzpSOVjIwqoYs0FdJx0IpAZWNy657xGuXvVlH1nxhj+SSkfBOTOvOY75/S/DZ/jjZSXtVXyXK/4+JVHZNySGC83Ne3QtHpSX8PHeDmfu8oeei3nZ7lT9KvP8D3S00/L6wzI/WrMmnwXQHlRwt2GhhvA46nNirxag+ZMTvWc+FZh/907nn65qd00GKcU0kbDVof6SD/hHIrAU2ZjT0lKePFMBHiXFNfWBNJyy8COFtT953Wvqww6Cyl8PrX0BvUkN2MCGmuJ379l4g4seVA99FNvlin3301RW+mG8pJZtMAPfz+GoGIz8imGzCC/PHur1cMjMLisDPbE+/BW/K7kU1Cr6DTHUm5PQb1KaHIOrD/wXkZ91NO2RAbnwGWjt6AqKkHWKkw8/ue09cjMcCIbFqkVzSdBWGHcwc1n8L9Hsn2CJRTVeozhZBBwS4YY+G58nEQHeX5Yumz61MmNIXDze0ejUzyVj13NHGJC/PthRXD8ATMoHRzI7skLHQmp4il8qWnWwOzZKIPSUJSQbxWuYv8E5hd7TnB7wgrjoMLobOqVwrqlktq7VDl6GtBzI2BZa1xhxSLtmGEVTl24XYnHVMaEsdK2iuS3G+PKDToLr1P3FvZOZ40Ysw0lDjmWtS7JuDOzn9wXYutW3bDgvR6vtg9tsln5H8DT0qX0714DPjSOlW8ZGl0GDuLeHPF6lhPz"
						.getBytes(), "X:/X5/model", "x:/temp");
		eModel.encrypt("/product", "北京", true);
	}
}
