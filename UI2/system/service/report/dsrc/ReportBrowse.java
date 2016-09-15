import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.justep.common.MessageUtils;
import com.justep.message.UIMessages;
import com.justep.ui.impl.JProcessorImpl;
import com.justep.ui.system.service.report.ReportHelper;

/**
 * 
 * 根据请求JSON信息 组合模版信息 发送报表服务器请求
 * 
 */
public class ReportBrowse extends JProcessorImpl {
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			ReportHelper reportHelper = new ReportHelper(request);
			reportHelper.service(response);
		} catch (Exception e) {
			throw new ServletException(MessageUtils.getMessage(UIMessages.class, UIMessages.REQUEST_REPORT_ERROR), e);
		}
		
	}
}