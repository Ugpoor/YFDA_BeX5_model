import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Collection;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;

import com.justep.exception.BaseRuntimeException;
import com.justep.message.SystemMessages;
import com.justep.model.ModelUtils;
import com.justep.model.exception.ModelException;
import com.justep.system.data.BizData;
import com.justep.system.data.KSQLProcedure;
import com.justep.system.data.Row;
import com.justep.system.data.Table;
import com.justep.system.util.BizSystemException;
import com.justep.system.util.CommonUtils;

public class Task {

	@SuppressWarnings({ "rawtypes", "unchecked" })
	public static int saveRemind(String concept, String readOnly, String notNull, Table table, String dataModel, List insertRange, List deleteRange,
			List updateRange, String fnModel) {
		Connection conn = null;
		PreparedStatement ps = null;
		String deleteReminderSql = "DELETE SA_Reminder WHERE sRemindID IN ";
		String addReminderSql = "INSERT INTO SA_Reminder (sID,version,sReminderName,sReminderID,sReminderType,sRemindID) VALUES (?,?,?,?,?,?)";
		try {
			conn = ModelUtils.getConnection(table.getModel().getFullName());
			Iterator<Row> iter = table.iterator();
			String delids = "";
			while (iter.hasNext()) {
				Row row = iter.next();
				String rowId = row.getValue("SA_Remind").toString();
				delids += "'" + rowId + "',";
			}
			if (delids.length() > 0) {
				delids = delids.substring(0, delids.length() - 1);
				ps = conn.prepareStatement(deleteReminderSql + " (" + delids + ")");
				ps.execute();
			}
			ps = conn.prepareStatement(addReminderSql);
			iter = table.iterator();
			while (iter.hasNext()) {
				Row row = iter.next();
				if (!row.getState().isDelete()) {
					String[] sReminders = row.getString("sReminder").split(",");
					String[] sReminderIDs = row.getString("sReminderID").split(",");
					String rowId = row.getValue("SA_Remind").toString();
					for (int i = 0; i < sReminders.length; i++) {
						ps.setString(1, CommonUtils.createGUID());
						ps.setInt(2, 0);
						ps.setString(3, sReminders[i]);
						ps.setString(4, sReminderIDs[i]);
						if (sReminderIDs[i].endsWith("ogn")) {
							ps.setString(5, "org");
						} else {
							ps.setString(5, "person");
						}
						ps.setString(6, rowId);
						ps.execute();
					}
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (ps != null){
				try{
					ps.close();
				}catch(Exception e100){
					
				}
			}
			
			if (conn != null){
				try {
					conn.close();
				} catch (Exception e2) {
				
				}
			}
		}
		return BizData.save(table, concept, insertRange, deleteRange, updateRange, readOnly, notNull, dataModel, fnModel);
	}

	public static void createWorkRecordTask(String sid) {
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			conn = ModelUtils.getConnection("/system/data");
			ps = conn.prepareStatement("select sName,sConditionType,sCondition,sAssertType,sContent,"
					+ "sDataModel,sCreatorID,sCreatorName,sRemindStyle from SA_Remind where sID = ?");
			ps.setString(1, sid);
			rs = ps.executeQuery();
			String sName = "";
			String sConditionType = "";
			String sCondition = "";
			String sAssertType = "";
			String sContent = "";
			String sqlModel = "";
			String sExecutorID = "";
			String sExecutorName = "";
			String sRemindStyle = "";
			int i = 1;
			if (rs.next()) {
				sName = rs.getString(i++);
				sConditionType = rs.getString(i++);
				sCondition = rs.getString(i++);
				sAssertType = rs.getString(i++);
				sContent = rs.getString(i++);
				sqlModel = rs.getString(i++);
				sExecutorID = rs.getString(i++);
				sExecutorName = rs.getString(i++);
				sRemindStyle = rs.getString(i++);
			} else {
				throw BizSystemException.create(SystemMessages.REMIND_TASK_EXISTS1, sid);
			}
			Map<String, String> map = new HashMap<String, String>();
			if ("KSQL".equals(sConditionType)) {
				map = execConditionKSql(sCondition, sqlModel);
			} else if ("SQL".equals(sConditionType)) {
				map = execConditionSql(sCondition, sqlModel);
			}
			//判断方式：条件查询结果为空，条件查询结果非空,不添加提醒任务(RemindTask)
			if (("0".equals(sAssertType) && map != null) || ("1".equals(sAssertType) && map == null)) {
				return;
			}
			Set<String> nameSet = map.keySet();
			for (String name : nameSet) {
				String value = map.get(name);
				sContent = sContent.replace("(" + name + ")", value);
				sName = sName.replace("(" + name + ")", value);
			}
			insertRemindTask(sContent, sName, sExecutorID, sExecutorName, sRemindStyle, sid);
		} catch (Exception e) {
			throw new ModelException("CreateRemindTask", e);
		} finally {
			if (null != rs) {
				try {
					rs.close();
				} catch (SQLException e) {
				}
			}
			if (null != ps) {
				try {
					ps.close();
				} catch (SQLException e) {
				}
			}
			if (null != conn) {
				try {
					conn.close();
				} catch (SQLException e) {
				}
			}
		}
	}

	private static HashMap<String, String> execConditionKSql(String conditionSql, String modelName) throws SQLException {
		if (null == modelName || "".equals(modelName)) {
			modelName = "/system/data";
		}
		HashMap<String, String> map = new HashMap<String, String>();
		com.justep.system.data.Table table = KSQLProcedure.query(conditionSql, null, modelName, null);
		Iterator<Row> iter = table.iterator();
		boolean flag = true;
		if (iter.hasNext()) {
			Row row = (Row) iter.next();
			Collection<String> cNames = table.getColumnNames();
			Iterator<String> sNIter = cNames.iterator();
			while (sNIter.hasNext()) {
				String sName = sNIter.next();
				map.put(sName, row.getString(sName));
			}
			if (flag)
				flag = false;
		}
		if (flag)
			return null;
		return map;
	}

	private static HashMap<String, String> execConditionSql(String conditionSql, String modelName) throws SQLException {
		Connection conn = null;
		Statement st = null;
		ResultSet rs = null;
		try {
			HashMap<String, String> map = new HashMap<String, String>();
			if (null == conditionSql || "".equals(conditionSql))
				return map;
			if (null == modelName || "".equals(modelName)) {
				conn = ModelUtils.getConnection("/system/data");
			} else {
				conn = ModelUtils.getConnection("/system/data");
			}
			conn.setAutoCommit(false);
			st = conn.createStatement();
			rs = st.executeQuery(conditionSql);
			ResultSetMetaData rsmd = rs.getMetaData();
			int count = rsmd.getColumnCount();
			boolean flag = true;
			HashMap<String, List<String>> setMap = new HashMap<String, List<String>>();
			while (rs.next()) {
				for (int i = 1; i <= count; i++) {
					String name = rsmd.getColumnName(i);
					Object o = rs.getObject(name);
					List<String> valueSet = setMap.get(name);
					if (null == valueSet) {
						valueSet = new ArrayList<String>();
						setMap.put(name, valueSet);
					}
					String value = toString(o);
					valueSet.add(value);
				}
				if (flag)
					flag = false;
			}
			if (flag)
				return null;
			Set<String> keySet = setMap.keySet();
			for (String name : keySet) {
				List<String> values = setMap.get(name);
				String value = "";
				if (null == values || values.isEmpty()) {
					map.put(name, value);
				} else {
					for (String v : values) {
						if ("".equals(value)) {
							value = v;
						} else {
							value = value + "、" + v;
						}
					}
					map.put(name, value);
				}
			}
			return map;
		} catch (Exception e) {
			throw new BaseRuntimeException("CreateRemindTask", e);
		} finally {
			if (null != rs) {
				try {
					rs.close();
				} catch (SQLException e) {
				}
			}
			if (null != st) {
				try {
					st.close();
				} catch (SQLException e) {
				}
			}
			if (null != conn) {
				try {
					conn.close();
				} catch (SQLException e) {
				}
			}
		}
	}

	private static String toString(Object o) {
		if (null == o)
			return "";
		if (o instanceof java.sql.Time) {
			java.text.SimpleDateFormat format = new java.text.SimpleDateFormat("HH:mm:ss");
			return format.format((java.sql.Time) o);
		}
		if (o instanceof java.sql.Date) {
			java.text.SimpleDateFormat format = new java.text.SimpleDateFormat("yyyy-MM-dd");
			return format.format((java.sql.Date) o);
		}
		if (o instanceof java.sql.Timestamp) {
			java.text.SimpleDateFormat format = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			return format.format((java.sql.Timestamp) o);
		} else {
			return o.toString();
		}
	}

	private static void insertRemindTask(String content, String sName, String creatorId, String creatorName, String sRemindStyle, String remindSid)
			throws SQLException {
		//如果设置sLimitTime,提醒任务都会过期

		Connection connS = null;
		PreparedStatement psS = null;
		ResultSet rs = null;

		Connection conn = null;
		PreparedStatement ps = null;
		try {

			Map<String, String[]> personInfoMap = new HashMap<String, String[]>();
			List<String> orgInfoList = new ArrayList<String>();

			String selecSql = "SELECT c.sID, c.sName, c.sMobilePhone, c.sMsn, c.sMail FROM SA_OPOrg a, SA_Reminder b, SA_OPPerson c "
					+ "WHERE a.sFID = b.sReminderID AND a.sParent = c.sMainOrgID AND a.sCode = c.sCode AND b.sRemindID = ? AND a.sOrgKindID = 'psm' "
					+ "AND c.sID NOT IN (SELECT d.sCreatorPersonID FROM SA_Task d WHERE d.sTypeID = 'WORKRECORD' AND d.sCreateTime >= ? AND d.sCreateTime < ?)";
			connS = ModelUtils.getConnection("/system/data");
			psS = connS.prepareStatement(selecSql);
			psS.setString(1, remindSid);
			psS.setString(2, getYesDayDate());
			psS.setString(3, getTodayDate());
			rs = psS.executeQuery();
			while (rs.next()) {
				personInfoMap.put(rs.getString(1),
						new String[] { rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5) });
			}

			selecSql = "select a.sFID from SA_OPOrg a,SA_Reminder b where a.sFID = b.sReminderID and b.sRemindID=? and a.sOrgKindID='ogn'";
			psS = connS.prepareStatement(selecSql);
			psS.setString(1, remindSid);
			rs = psS.executeQuery();
			while (rs.next()) {
				orgInfoList.add(rs.getString(1));
			}
			selecSql = "SELECT b.sID, b.sName, b.sMobilePhone, b.sMsn, b.sMail FROM SA_OPOrg a, SA_OPPerson b "
					+ "WHERE a.sCode = b.sCode AND a.sOrgKindID = 'psm' AND a.sFID LIKE ? "
					+ "AND b.sID NOT IN (SELECT c.sCreatorPersonID FROM SA_Task c WHERE c.sTypeID = 'WORKRECORD' AND c.sCreateTime >= ? AND c.sCreateTime < ?)";
			for (int i = 0, len = orgInfoList.size(); i < len; i++) {
				psS = connS.prepareStatement(selecSql);
				psS.setString(1, orgInfoList.get(i) + "%");
				psS.setString(2, getYesDayDate());
				psS.setString(3, getTodayDate());
				rs = psS.executeQuery();
				while (rs.next()) {
					personInfoMap.put(rs.getString(1),
							new String[] { rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5) });
				}
			}

			//添加RemindTask
			String sql = "insert into SA_RemindTask (fID,version,sStatusID,sCreateTime,sContent,sCreatorID,sCreatorName,"
					+ "sLimitTime,sUCode,sTaskId,sRemindStyle) values (?,?,?,?,?,?,?,?,?,?,?)";
			conn = ModelUtils.getConnection("/system/data");
			ps = conn.prepareStatement(sql);

			int i = 1;
			String sid = CommonUtils.createGUID();
			ps.setString(i++, sid);
			ps.setInt(i++, 0);
			ps.setInt(i++, 1);
			ps.setTimestamp(i++, new Timestamp(System.currentTimeMillis()));
			ps.setString(i++, content);

			ps.setString(i++, creatorId);
			ps.setString(i++, creatorName);

			//时效
			ps.setTimestamp(i++, new Timestamp(System.currentTimeMillis()));
			//TODO 暂时不需要 sUCode sTaskId
			ps.setString(i++, "");
			ps.setString(i++, "");
			ps.setString(i++, sRemindStyle);
			ps.execute();

			//添加Remind
			sql = "INSERT INTO SA_ReminderDetail (fID,version,sReminderName,sReminderId,sRemindTaskId,sStatusID,sSendTarget,sSendTargetType) VALUES (?,?,?,?,?,?,?,?)";
			String[] remindStyles = sRemindStyle.trim().split(" ");
			ps = conn.prepareStatement(sql);
			Iterator<Entry<String, String[]>> iter = personInfoMap.entrySet().iterator();
			while (iter.hasNext()) {
				Entry<String, String[]> entry = iter.next();
				String[] value = entry.getValue();
				for (int j = 0, len = remindStyles.length; j < len; j++) {
					String sendTarget = null;
					String sendTargetType = null;
					if ((sendTargetType = "sms").equals(remindStyles[j])) {
						sendTarget = value[2];
					} else if ((sendTargetType = "msn").equals(remindStyles[j])) {
						sendTarget = value[3];
					} else if ((sendTargetType = "x5Messager").equals(remindStyles[j])) {
						sendTarget = value[0];
					} else if ((sendTargetType = "email").equals(remindStyles[j])) {
						sendTarget = value[4];
					}
					if (sendTargetType == null || sendTargetType.length() == 0 || sendTargetType.toLowerCase().equals("null")) {
						break;
					}
					int colunmIndex = 1;
					ps.setString(colunmIndex++, CommonUtils.createGUID());
					ps.setInt(colunmIndex++, 0);
					ps.setString(colunmIndex++, value[1]);
					ps.setString(colunmIndex++, value[0]);
					ps.setString(colunmIndex++, sid);
					ps.setInt(colunmIndex++, 0);
					ps.setString(colunmIndex++, sendTarget);
					ps.setString(colunmIndex++, sendTargetType);
					ps.execute();
				}
			}
		} catch (Exception e) {
			throw new BaseRuntimeException("CreateRemindTask", e);
		} finally {
			if (null != rs) {
				try {
					rs.close();
				} catch (SQLException e) {
				}
			}
			if (null != ps) {
				try {
					ps.close();
				} catch (SQLException e) {
				}
			}
			if (null != conn) {
				try {
					conn.close();
				} catch (SQLException e) {
				}
			}
			if (null != psS) {
				try {
					psS.close();
				} catch (SQLException e) {
				}
			}
			if (null != connS) {
				try {
					connS.close();
				} catch (SQLException e) {
				}
			}
		}
	}

	private static String getTodayDate() {
		Calendar cd = Calendar.getInstance();
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String dateValue = dateFormat.format(cd.getTime());
		dateValue = dateValue.substring(0, dateValue.indexOf(" "));
		return dateValue + " 00:00:00";
	}

	private static String getYesDayDate() {
		Calendar cd = Calendar.getInstance();
		int monthOfNumber = cd.get(Calendar.DAY_OF_MONTH);
		cd.set(Calendar.DAY_OF_MONTH, monthOfNumber - 1);
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String dateValue = dateFormat.format(cd.getTime());
		dateValue = dateValue.substring(0, dateValue.indexOf(" "));
		return dateValue + " 00:00:00";
	}

	public static void main(String[] args) {
		System.out.println(getYesDayDate());
		System.out.println(getTodayDate());
	}

}