import java.io.File;
import java.io.IOException;
import java.io.OutputStream;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tools.ant.BuildException;
import org.apache.tools.ant.Project;
import org.apache.tools.ant.ProjectHelper;
import org.apache.tools.ant.listener.Log4jListener;

import com.alibaba.fastjson.JSONObject;
import com.justep.biz.client.ActionUtils;
import com.justep.biz.client.util.BizClientUtils;
import com.justep.deploy.AppInfo;
import com.justep.deploy.AppHelper;
import com.justep.tools.ant.listener.BuildLogListener;
import com.justep.ui.JavaServer;
import com.justep.ui.JustepConfig;
import com.justep.ui.util.NetUtils;

public class Deploy extends com.justep.ui.impl.JProcessorImpl {

	private static void execTask(File buildFile, AppInfo appInfo, String logFileName) throws IOException {
		Project p = new Project();
		Log4jListener consoleLogger = new Log4jListener();
		BuildLogListener buidLogger = new BuildLogListener(logFileName);
		p.addBuildListener(consoleLogger);
		p.addBuildListener(buidLogger);
		try {
			p.fireBuildStarted();
			p.init();
			ProjectHelper helper = ProjectHelper.getProjectHelper();
			helper.parse(p, buildFile);
			p.executeTarget("deploy");
			p.fireBuildFinished(null);
		} catch (BuildException e) {
			p.fireBuildFinished(e);
			throw e;
		} finally {
			buidLogger.flush();
		}
	}

	private void deploy(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, IllegalAccessException {
		String UI = JustepConfig.getUIValue(NetUtils.getRequestPath(request));
		String modelPath = com.justep.filesystem.FileSystemWrapper.instance().getRealPath("/");
		String justepHome = JustepConfig.getHome();
		String antLibDir = modelPath + UI + "/system/deploy/common/antlib";
		String nativeDir = modelPath + "Native";
		JSONObject config = JSONObject.parseObject(JavaServer.getPostData(request));

		final AppInfo appInfo = new AppInfo(config);
		final String logFileName = nativeDir + "/" + appInfo.projectName + "/log/build.log";

		// 创建ant脚本
		final File buildFile = AppHelper.createBuildXML(justepHome, antLibDir, nativeDir, appInfo, "");

		// 执行ant脚本。线程执行，避免safari下ajax 60s超时的问题。通过checkPacking做监测是否完成
		Thread t = new Thread(new Runnable() {
			public void run() {
				try {
					execTask(buildFile, appInfo, logFileName);
					com.justep.deploy.Deploy.packStatus = "";
				} catch (Exception e) {
					com.justep.deploy.Deploy.packStatus = "ERROR";
				}
			}
		});
		t.start();
	}

	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		com.justep.deploy.Deploy.serverPackStatus = "";
		String result;
		if ("BUSY".equals(com.justep.deploy.Deploy.packStatus)) {
			result = BizClientUtils.generateResult(false, null, "部署任务执行中，请稍候再试", "", "", "", "", ActionUtils.JSON_CONTENT_TYPE);
		} else {
			com.justep.deploy.Deploy.packStatus = "BUSY";
			try {
				result = BizClientUtils.generateResult(true, "BUSY", "正在部署......", "", "", "", "", ActionUtils.JSON_CONTENT_TYPE);
				deploy(request, response);
			} catch (BuildException be) {
				// 对于执行ant失败返回成功标记，但code值为ERROR，和正常执行成功一样通过build.log查看具体错误日志
				result = BizClientUtils.generateResult(true, "ERROR", "部署失败!", be.getMessage(), AppHelper.getStackTrace(be), "", "", ActionUtils.JSON_CONTENT_TYPE);
				com.justep.deploy.Deploy.packStatus = "ERROR";
			} catch (Exception e) { // TODO: 非致命异常要通过？
				result = BizClientUtils.generateResult(false, "ERROR", "部署失败!", e.getMessage(), AppHelper.getStackTrace(e), "", "", ActionUtils.JSON_CONTENT_TYPE);
				com.justep.deploy.Deploy.packStatus = "ERROR";
			}
		}

		response.setCharacterEncoding("UTF-8");
		response.setContentType(ActionUtils.JSON_CONTENT_TYPE);
		OutputStream output = response.getOutputStream();
		output.write(result.getBytes("UTF-8"));
		output.flush();
		output.close();
	}

}
