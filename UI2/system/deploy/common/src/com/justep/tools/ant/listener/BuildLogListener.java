package com.justep.tools.ant.listener;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.List;

import org.apache.tools.ant.BuildEvent;
import org.apache.tools.ant.BuildListener;
import org.apache.tools.ant.Task;

public class BuildLogListener implements BuildListener {

	static private List<String> blackLogTarget = new ArrayList<String>();
	static private List<String> blackLogTask = new ArrayList<String>();

	private OutputStream stream;
	public Boolean debug;

	private void output(String msg) {
		byte[] b;
		try {
			b = msg.getBytes("UTF-8");
			stream.write(b);
			stream.write('\r');
			stream.write('\n');
			stream.flush();
		} catch (IOException e) {
			// 记录失败, 忽略
		}
	}

	private void debug(String msg) {
		if (debug) {
			output("debug: " + msg);
		}
	}

	private void info(String msg) {
		output(msg);
	}

	private void warn(String msg) {
		output("****WARN****: " + msg);
	}

	private void error(String msg, Throwable e) {
		output("****ERROR****: " + msg);
		if (e != null) {
			output("****ERROR****: 错误信息: " + e.getMessage());
			output("****ERROR****: 如不能确定具体问题，可参考常见问题: http://bbs.wex5.com/thread-82002-1-1.html");
		}
	}

	public BuildLogListener(String logFileName) throws FileNotFoundException {
		debug = false;

		blackLogTarget.add("updateImage");
		blackLogTarget.add("createApp");
		blackLogTarget.add("editApp");
		blackLogTarget.add("copyPlugin");
		blackLogTarget.add("prepareSource");
		blackLogTarget.add("pack");
		blackLogTarget.add("unZipAppBuilderServerPackage");
		blackLogTarget.add("checkWWW");
		blackLogTarget.add("encodeWWW");
		blackLogTarget.add("deleteWWW");
		blackLogTarget.add("compressTar");

		blackLogTask.add("property");
		blackLogTask.add("condition");
		blackLogTask.add("path");
		blackLogTask.add("typedef");
		blackLogTask.add("propertyfile");
		blackLogTask.add("delete");
		blackLogTask.add("mkdir");
		blackLogTask.add("copy");
		blackLogTask.add("chmod");
		blackLogTask.add("zip");
		blackLogTask.add("unzip");
		blackLogTask.add("tar");
		blackLogTask.add("propertyfile");
		blackLogTask.add("updateSource");

		File logFile = new File(logFileName);
		logFile.getParentFile().mkdirs();
		stream = new FileOutputStream(logFile);
	}

	public void flush() throws IOException {
		stream.close();
	}

	public void buildStarted(BuildEvent event) {
		info("开始......");
		info("   ");
	}

	public void buildFinished(BuildEvent event) {
		if (event.getException() == null) {
			info("完成。");
		} else {
			error("执行出错：", event.getException());
		}
	}

	public void targetStarted(BuildEvent event) {
		String targetName = event.getTarget().getName();
		if (blackLogTarget.indexOf(targetName) < 0) {
			String description = event.getTarget().getDescription();
			info(description == null ? targetName : description + ":");
		}
	}

	public void targetFinished(BuildEvent event) {
		String targetName = event.getTarget().getName();

		if (event.getException() == null) {
			if (blackLogTarget.indexOf(targetName) < 0) {
				info("   ");
			}
		} else {
			error("任务 \"" + targetName + "\" 执行失败。", null);
		}
	}

	public void taskStarted(BuildEvent event) {
	}

	public void taskFinished(BuildEvent event) {
		Task task = event.getTask();
		if (event.getException() != null) {
			error("子任务 \"" + task.getTaskName() + "\" 执行失败。", null);
		}
	}

	public void messageLogged(BuildEvent event) {
		Task task = event.getTask();

		Object categoryObject = task;
		if (task == null) {
			categoryObject = event.getTarget();
			if (categoryObject == null) {
				categoryObject = event.getProject();
			}
		} else {
			if (blackLogTask.indexOf(task.getTaskName()) >= 0) {
				return;
			}
		}
		switch (event.getPriority()) {
		case 0:
			error(event.getMessage(), null);
			break;
		case 1:
			warn(event.getMessage());
			break;
		case 2:
			info("   " + event.getMessage());
			break;
		case 3:
			debug(event.getMessage());
			break;
		case 4:
			debug(event.getMessage());
			break;
		default:
			error(event.getMessage(), null);
		}
	}
}
