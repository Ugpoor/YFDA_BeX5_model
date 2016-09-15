import java.io.File;
import java.io.IOException;
import java.io.OutputStream;
import java.net.Inet4Address;
import java.net.InetAddress;
import java.net.NetworkInterface;
import java.net.SocketException;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.alibaba.fastjson.JSONObject;
import com.justep.biz.client.ActionUtils;

public class GetDownloadInfo extends com.justep.ui.impl.JProcessorImpl {

	private static StringBuffer getIp() {
		StringBuffer ip = new StringBuffer();
		try {
			Enumeration<NetworkInterface> networkInterfaces = NetworkInterface.getNetworkInterfaces();
			while (networkInterfaces.hasMoreElements()) {
				NetworkInterface ni = (NetworkInterface) networkInterfaces.nextElement();
				Enumeration<InetAddress> nias = ni.getInetAddresses();
				while (nias.hasMoreElements()) {
					InetAddress ia = (InetAddress) nias.nextElement();
					if (!ia.isLinkLocalAddress() && !ia.isLoopbackAddress() && ia instanceof Inet4Address) {
						if (ip.length() > 0) {
							ip.append(",");
						}
						ip.append(ia.getHostAddress());
					}
				}
			}
		} catch (SocketException e) {
		}
		return ip;
	}

	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String modelPath = com.justep.filesystem.FileSystemWrapper.instance().getRealPath("/");
		String nativeDir = modelPath + "Native";
		String projectName = request.getParameter("projectName");
		String androidFile = nativeDir + "/" + projectName + "/dist/app.apk";
		String iosFile = nativeDir + "/" + projectName + "/dist/app.ipa";

		StringBuffer ip = getIp();
		int port = request.getLocalPort();

		JSONObject downloadInfo = new JSONObject();
		downloadInfo.put("ip", ip.toString());
		downloadInfo.put("port", port);
		downloadInfo.put("android", new File(androidFile).exists());
		downloadInfo.put("ios", new File(iosFile).exists());

		response.setCharacterEncoding("UTF-8");
		response.setContentType(ActionUtils.JSON_CONTENT_TYPE);
		OutputStream output = response.getOutputStream();
		output.write(downloadInfo.toJSONString().getBytes("UTF-8"));
		output.flush();
		output.close();
	}
}
