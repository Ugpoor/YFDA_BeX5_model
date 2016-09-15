import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.dom4j.Document;
import org.dom4j.DocumentException;
import org.dom4j.Element;
import org.dom4j.io.SAXReader;

import com.justep.ui.impl.JProcessorImpl;

public class GetOlapServerURL extends JProcessorImpl {
	private static final String DECISION_GRID_PATH = "/service/decisionGrid.jsp";
	private static final String DECISION_CHART_PATH = "/service/decisionData.jsp";
	
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Document resultDoc = org.dom4j.DocumentHelper.createDocument();
		
		String olapServerURL = getOLAPServerURL(request);

		if (olapServerURL == null || olapServerURL.equals("")) {

		} else {
			Element rootE = resultDoc.addElement("root");
			Element olapServerURLE = rootE.addElement("olap-server-url");
			olapServerURLE.setText(olapServerURL+DECISION_GRID_PATH);
			Element olapServerDataE = rootE.addElement("olap-server-data");
			olapServerDataE.setText(olapServerURL+DECISION_CHART_PATH);
		}
		response.setContentType("application/xml");
		response.getWriter().write(resultDoc.asXML());
	}
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
	
	private String getOLAPServerURL(HttpServletRequest request) {
		String rsURL = null;
		@SuppressWarnings("deprecation")
		File fl = new File(request.getRealPath("/WEB-INF/justep.xml"));
		if (fl.exists()) {
			SAXReader reader = new SAXReader();
			try {
				Document doc = reader.read(fl);
				Element e = doc.getRootElement().element("report-server");
				if (e != null) {
					rsURL = e.getText().trim();
				} else {
				}
			} catch (DocumentException e) {
				e.printStackTrace();
				throw new UnsupportedOperationException();
			}
		}
		if(rsURL != null){
			int n = rsURL.indexOf("ReportServer");
			if(n != -1){
				rsURL = rsURL.substring(0, n+"ReportServer".length());
			}
		}
		return rsURL;
	}

}