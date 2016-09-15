package com.justep.tools.ant.task.app;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;

import org.apache.tools.ant.BuildException;
import org.apache.tools.ant.Task;
import org.apache.tools.ant.taskdefs.Execute;
import org.apache.tools.ant.taskdefs.Redirector;
import org.apache.tools.ant.types.Commandline;
import org.apache.tools.ant.types.Environment;
import org.dom4j.Document;
import org.dom4j.Element;
import org.dom4j.io.OutputFormat;
import org.dom4j.io.SAXReader;
import org.dom4j.io.XMLWriter;

import com.justep.tools.ant.common.Utils;

public class UpdateSourceTask extends Task {

	private Redirector redirector = new Redirector(this);

	private String justepHome;
	private String targetDir;

	private Environment env = new Environment();

	private static final String DEFAULT_A_KEY = "private static byte\\[\\] p = \\{ 49, 50, 51, 52, 53, 54, 55, 56, 57, 48, 49, 50, 51, 52, 53, 54 \\}";
	private static final String DEFAULT_A_E = "private static Boolean e = false";
	private static final String DEFAULT_I_KEY = "const unsigned char bytes\\[\\] = \\{49, 50, 51, 52, 53, 54, 55, 56, 57, 48, 49, 50, 51, 52, 53, 54\\}";
	private static final String DEFAULT_I_E = "Boolean needDecrypted = false";

	private static int toDigit(char ch, int index) {
		int digit = Character.digit(ch, 16);
		if (digit == -1) {
			throw new RuntimeException("Illegal hexadecimal character " + ch + " at index " + index);
		}
		return digit;
	}

	private static byte[] decodeHex(char[] data) {
		int len = data.length;
		if ((len & 0x01) != 0) {
			throw new RuntimeException("Odd number of characters.");
		}

		byte[] out = new byte[len >> 1];
		for (int i = 0, j = 0; j < len; i++) {
			int f = toDigit(data[j], j) << 4;
			j++;
			f = f | toDigit(data[j], j);
			j++;
			out[i] = (byte) (f & 0xFF);
		}
		return out;
	}

	private String getKeyStr(String resPassword) {
		char[] keyHexChars = new char[resPassword.length()];
		resPassword.getChars(0, resPassword.length(), keyHexChars, 0);
		byte[] keyBytes = decodeHex(keyHexChars);
		StringBuffer sb = new StringBuffer();
		sb.append("{");
		for (int i = 0; i < keyBytes.length; i++) {
			if (i != 0) {
				sb.append(",");
			}
			sb.append(Integer.toString(keyBytes[i]));
		}
		sb.append("}");
		return sb.toString();
	}

	private String getIOSCompileType(String releaseMode) {
		if ("release".equals(releaseMode)) {
			return "Distribution";
		} else {
			return "Developer";
		}
	}

	private void exec(String cmd, String opration) throws IOException, BuildException {
		Commandline cmdl = new Commandline();
		cmdl.setExecutable(cmd);
		String[] arg = { opration };
		cmdl.addArguments(arg);

		Execute exe = new Execute(redirector.createHandler(), null);
		exe.setCommandline(cmdl.getCommandline());
		exe.setAntRun(getProject());
		exe.setWorkingDirectory(new File(targetDir));
		exe.setVMLauncher(true);
		String[] environment = this.env.getVariables();
		if (environment != null) {
			for (int i = 0; i < environment.length; i++) {
				log("Setting environment variable: " + environment[i], 3);
			}
		}
		exe.setEnvironment(environment);

		int returnCode = exe.execute();
		if (exe.killedProcess()) {
			String msg = "Timeout: killed the sub-process";
			throw new BuildException(msg);
		}
		this.redirector.complete();
		if (Execute.isFailure(returnCode)) {
			throw new BuildException(getTaskType() + " returned: " + returnCode, getLocation());
		}
	}

	public void setJustepHome(String justepHome) {
		this.justepHome = justepHome;
	}

	public void setTargetDir(String targetDir) {
		this.targetDir = targetDir;
	}

	public void addEnv(Environment.Variable var) {
		this.env.addVariable(var);
	}

	public void execute() throws BuildException {
		try {
			String packageName = getProject().getProperty("packageName");
			String appName = getProject().getProperty("appName");
			Boolean resEncryption = "true".equals(getProject().getProperty("resEncryption"));
			String resPassword = getProject().getProperty("resPassword");
			String releaseMode = getProject().getProperty("releaseMode");
			String iosDevloperPassword = getProject().getProperty("iosDevloperPassword");
			String iosDistributionPassword = getProject().getProperty("iosDistributionPassword");
			Boolean includeUIRes = "true".equals(getProject().getProperty("includeUIRes"));
			String mode = getProject().getProperty("mode");

			// 设置默认打开的页面
			SAXReader xReader = new SAXReader();
			String configXMLPath = this.targetDir + "/config.xml";
			InputStreamReader isr = new InputStreamReader(new FileInputStream(configXMLPath), "UTF-8");
			Document config = xReader.read(isr);
			Element e = (Element) config.selectSingleNode("//widget");
			String webPath = getProject().getProperty("webPath");
			if ("1".equals(mode) || "2".equals(mode) || (includeUIRes && "3".equals(mode))) {
				String version = Utils.getUrlVersion(getProject().getProperty("targetDir") + "/www" + webPath);
				if ((version != null) && !"".equals(version)) {
					webPath = webPath + "/" + version;
				}
			}
			String url = getProject().getProperty("serverURL") + webPath;
			e.element("content").attribute("src").setValue(url + getProject().getProperty("indexURL"));
			OutputStreamWriter osw = new OutputStreamWriter(new FileOutputStream(configXMLPath), "UTF-8");
			XMLWriter writer = new XMLWriter(osw, OutputFormat.createPrettyPrint());
			writer.write(config);
			writer.close();

			// 替换包名和应用名，相关常量插件会用到
			File constantsFile = new File(this.targetDir + "/platforms/android/src/com/justep/x5/base/Constants.java");
			if (constantsFile.exists()) {
				Utils.replaceFileText(constantsFile, "PACKNAME = \"[\\w.]*\"", "PACKNAME = \"" + packageName + "\"");
				Utils.replaceFileText(constantsFile, "APPNAME = \"[\\w.]*\"", "APPNAME = \"" + appName + "\"");
			}

			File cordova = new File(this.justepHome + "/tools/cordova/bin/cordova" + (Utils.isMacOSX() ? "" : ".cmd"));
			exec(cordova.getAbsolutePath(), "prepare");

			// 加密
			if (resEncryption) {
				String androidFile = this.targetDir + "/platforms/android/CordovaLib/src/org/apache/cordova/ResourceLoader.java";
				String keyStr = getKeyStr(resPassword);
				Utils.replaceFileText(androidFile, DEFAULT_A_KEY, "private static byte[] p = " + keyStr);
				Utils.replaceFileText(androidFile, DEFAULT_A_E, "private static Boolean e = true");

				String iosFile1 = this.targetDir + "/platforms/ios/" + appName + "/Classes/NSData+AES128.m";
				String iosFile2 = this.targetDir + "/platforms/ios/" + appName + "/Classes/JustepURLProtocol.m";
				Utils.replaceFileText(iosFile1, DEFAULT_I_KEY, "const unsigned char bytes[] = " + keyStr);
				Utils.replaceFileText(iosFile2, DEFAULT_I_E, "Boolean needDecrypted = true");
			}

			// IOS 设置证书密码和编译类型
			getProject().setProperty("iosPassword", "release".equals(releaseMode) ? iosDistributionPassword : iosDevloperPassword);
			String iosCompileType = getIOSCompileType(releaseMode);
			getProject().setProperty("iosCompileType", iosCompileType.toLowerCase());
			Utils.replaceFileText(this.targetDir + "/platforms/ios/cordova/build.xcconfig", "CODE_SIGN_IDENTITY = iPhone Developer", "CODE_SIGN_IDENTITY = iPhone " + iosCompileType);
		} catch (Exception e) {
			throw new BuildException(e);
		}
	}
}