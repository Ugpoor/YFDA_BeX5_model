import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.alibaba.fastjson.JSONObject;
import com.justep.biz.client.ActionEngine;
import com.justep.biz.client.ActionResult;
import com.justep.biz.client.ActionUtils;
import com.justep.common.MessageUtils;
import com.justep.ui.system.UISystemMessages;
import com.justep.ui.util.NetUtils;

public class GetOrgs extends com.justep.ui.impl.JProcessorImpl {
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			//使用页面缓存进行org的缓存
			java.util.Date date = new java.util.Date();
			response.setDateHeader("Last-Modified", date.getTime());
			response.setDateHeader("Expires", date.getTime() + ((long) 1000 * 60 * 60 * 24 * 365));

			response.setHeader("Cache-Control", "public");
			response.setHeader("Pragma", "Pragma");

			String language = NetUtils.getLanguage(request);
			String accept = ActionUtils.JSON_CONTENT_TYPE;
			String contentType = ActionUtils.JSON_CONTENT_TYPE;
			String bsessionID = NetUtils.getBSessionID(request);
			String includePersonPhotoLastModified = request.getParameter("$includePersonPhotoLastModified");

			String postData = !"true".equalsIgnoreCase(includePersonPhotoLastModified) ? "{\"contentType\":\"json\",\"accept\":\"application/json\",\"process\":\"/SA/OPM/system/systemProcess\",\"activity\":\"mainActivity\",\"action\":\"queryOrgAction\",\"parameters\":{\"variables\":{},\"filter\":\"(SA_OPOrg.sValidState=1)\",\"offset\":0,\"limit\":-1,\"columns\":\"SA_OPOrg,sAddress,sCode,sDescription,sFCode,sFID,sFName,sFax,sLevel,sLongName,sName,sNodeKind,sOrgKindID,sParent,sPersonID,sPhone,sSequence,sValidState,sWxDeptID,sZip,version\",\"cacheFilter\":null},\"translateParameter\":{\"dataType\":\"row-tree\",\"transformIdcolumn\":true,\"includeState\":true,\"useNamespace\":true,\"cellnameByRelation\":false,\"rowsConfig\":{\"concept\":\"SA_OPOrg\",\"sequence\":\"SA_OPOrg,sAddress,sCode,sDescription,sFCode,sFID,sFName,sFax,sLevel,sLongName,sName,sNodeKind,sOrgKindID,sParent,sPersonID,sPhone,sSequence,sValidState,sWxDeptID,sZip,version\",\"treeOption\":{\"tree-parent-relation\":\"sParent\"}}}}"
					: "{\"contentType\":\"application/json\",\"accept\":\"application/json\",\"process\":\"/SA/OPM/system/systemProcess\",\"activity\":\"mainActivity\",\"action\":\"queryOrgAction\",\"parameters\":{\"columns\":\"SA_OPOrg,sName,sCode,sLongName,sFName,sFCode,sFID,sOrgKindID,sPersonID,sValidState,sSequence,sPhotoLastModified,sNumb\",\"limit\":-1,\"offset\":0,\"includePersonPhotoLastModified\":true},\"translateParameter\":{\"dataType\":\"row-list\",\"transformIdcolumn\":false,\"includeState\":false,\"useNamespace\":true,\"cellnameByRelation\":false,\"rowsConfig\":{\"concept\":\"SA_OPOrg\",\"sequence\":\"SA_OPOrg,sName,sCode,sLongName,sFName,sFCode,sFID,sOrgKindID,sPersonID,sValidState,sSequence,sPhotoLastModified,sNumb\"}}}";
			byte[] bytes;
			bytes = postData.getBytes("UTF-8");
			ActionResult ar = ActionEngine.invokeActions(bytes, accept, contentType, bsessionID, language, null);
			if(ar.isSuccess()){
				JSONObject content = (JSONObject)ar.getContent();
				if (content.containsKey("sys"))
					content.remove("sys");
				
				response.setCharacterEncoding("UTF-8");
				response.setContentType("javascript/text");
				PrintWriter out = response.getWriter();
				out.write("window.__justep.__org = "+content.toString()+";");
				out.flush();
			}else throw new ServletException(MessageUtils.getMessage(UISystemMessages.class, UISystemMessages.SERVICE_BIZ_ACTION_ERROR));
		} catch (Exception e) {
			throw new ServletException(MessageUtils.getMessage(UISystemMessages.class, UISystemMessages.SERVICE_BIZ_ACTION_ERROR), e);
		}
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}
}
