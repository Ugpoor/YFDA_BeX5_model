import org.apache.log4j.Logger;
import org.dom4j.Document;
import org.dom4j.DocumentHelper;
import org.dom4j.Element;
import org.jivesoftware.smack.XMPPException;

import com.justep.model.Config;
import com.justep.model.ModelUtils;
import com.justep.system.context.ContextHelper;
import com.justep.system.data.KSQL;
import com.justep.system.data.Row;
import com.justep.system.data.Table;
import com.justep.system.opm.Person;
import com.justep.util.Utils;

import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

class SyncThread extends Thread {
	String host, user, pws;
	int port;

	public void run() {
		try {
			XMsgClient.reloadOrg(host, port, user, pws);
		} catch (XMPPException e) {
			//MessengerOrgSynchronizeActions.logger.error("Messenger自动同步失败！", e);
			throw new RuntimeException("Messenger自动同步失败！", e);
		} catch (InterruptedException e) {
			throw new RuntimeException("Messenger自动同步失败！", e);
			//MessengerOrgSynchronizeActions.logger.error("Messenger自动同步失败！", e);
		}
	}
}

public class MessengerOrgSynchronizeActions {
	public static final Logger logger = Logger.getLogger(MessengerOrgSynchronizeActions.class);

	public static void autoSync() {
		if (!isAutoSync()) {
			return;
		}
		try {
			SyncThread thread = new SyncThread();
			thread.host = getHost();
			thread.port = getPort();
			thread.user = getCurrentPersonCode();
			thread.pws = getCurrentPersonPassword();
			thread.start();
		} catch (Exception e) {
			//logger.error("Messenger自动同步失败！", e);
			throw new RuntimeException("Messenger自动同步失败！", e);
		}
	}

	public static Document excute() {
		Document result = DocumentHelper.createDocument();
		Element rtRoot = result.addElement("root");
		boolean success = true;
		String msg = "messenger组织同步";

		String host = getHost();
		try {
			int port = getPort();
			String user = getCurrentPersonCode();
			String pws = getCurrentPersonPassword();
			try {
				XMsgClient.reloadOrg(host, port, user, pws);
				msg += "[成功]。";
			} catch (XMPPException e) {
				success = false;
				msg += "[失败]：\n" + e.getMessage();
				//logger.error(msg, e);
				throw new RuntimeException(msg, e);

			} catch (InterruptedException e) {
				success = false;
				msg += "[失败]：\n" + e.getMessage();
				throw new RuntimeException(msg, e);
			}
		} catch (NumberFormatException e) {
			success = false;
			msg += "[失败]：\n" + "端口号必须为整数！";
		}

		rtRoot.addAttribute("message", msg);
		rtRoot.addAttribute("success", success == true ? "true" : "false");
		return result;
	}

	private static String getHost() {
		String host = "localhost";
		Config config = (Config) ModelUtils.getModelObjectByFullName("/SA/OPM/logic/code/orgSynchronize/messenger.host", Config.TYPE);
		if (config != null) {
			host = config.getValue();
		}
		return host;
	}

	private static int getPort() {
		int port = 5222;
		Config config = (Config) ModelUtils.getModelObjectByFullName("/SA/OPM/logic/code/orgSynchronize/messenger.port", Config.TYPE);
		if (config != null) {
			port = Integer.parseInt(config.getValue());
		}
		return port;
	}

	private static boolean isAutoSync() {
		boolean autoSync = false;
		Config config = (Config) ModelUtils.getModelObjectByFullName("/SA/OPM/logic/code/orgSynchronize/messenger.autoSync", Config.TYPE);
		if (config != null) {
			autoSync = "true".equalsIgnoreCase(config.getValue());
		}
		return autoSync;
	}

	private static String getCurrentPersonCode() {
		Person p = ContextHelper.getOperator();
		if (Utils.isNotNull(p)) {
			return p.getCode();
		} else
			return null;
	}

	private static String getCurrentPersonPassword() {
		String ksql = "select SA_OPPerson.sPassword from SA_OPPerson SA_OPPerson " + "	where SA_OPPerson = :personID ";
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("personID", ContextHelper.getOperator().getID());
		Table table = KSQL.select(ksql, params, "/system/data", null);
		Iterator<Row> rows = table.iterator();
		if (rows.hasNext())
			return rows.next().getString("sPassword");
		else
			return "";
	}
}