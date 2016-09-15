<?xml version="1.0" encoding="utf-8"?>

<model xmlns="http://www.justep.com/model">  
  <action name="queryRemindConfigAction" procedure="bizQueryProcedure"> 
    <private name="concept" type="String" value="SA_RemindConfig"/>  
    <public name="idColumn" type="String" value="SA_RemindConfig"/>  
    <private name="select" type="String" value="SA_RemindConfig.*"/>  
    <private name="from" type="String" value="SA_RemindConfig SA_RemindConfig"/>  
    <private name="aggregate" type="String"/>  
    <private name="dataModel" type="String" value="/SA/task/data"/>  
    <private name="fnModel" type="String" value="/system/logic/fn"/>  
    <protected name="condition" type="String"/>  
    <permission name="range" type="List"/>  
    <public name="distinct" type="Boolean" value="false"/>  
    <!-- <public name="idColumn" type="String" value="SA_RemindConfig"/> -->  
    <public name="filter" type="String"/>  
    <public name="limit" type="Integer"/>  
    <public name="offset" type="Integer"/>  
    <public name="columns" type="String"/>  
    <public name="orderBy" type="String"/>  
    <public name="aggregateColumns" type="String"/>  
    <public name="variables" type="Map"/>  
    <label language="zh_CN">查询提醒定义设置</label> 
  </action>  
  <action name="createRemindConfigAction" procedure="bizCreateProcedure"> 
    <private name="concept" type="String" value="SA_RemindConfig"/>  
    <public name="table" type="Table"/>  
    <public name="defaultValues" type="Map"/>  
    <private name="fnModel" type="String" value="/system/logic/fn"/>  
    <label language="zh_CN">创建提醒定义设置</label> 
  </action>  
  <action name="saveRemindConfigAction" procedure="bizSaveProcedure"> 
    <private name="concept" type="String" value="SA_RemindConfig"/>  
    <protected name="readOnly" type="String"/>  
    <protected name="notNull" type="String"/>  
    <public name="table" type="Table"/>  
    <private name="dataModel" type="String" value="/SA/task/data"/>  
    <label language="zh_CN">保存提醒定义设置</label>  
    <permission name="insertRange" type="List"/>
    <permission name="deleteRange" type="List"/>
    <permission name="updateRange" type="List"/>
    <private name="fnModel" type="String" value="/system/logic/fn"/>
  </action>  
  
  <action name="saveRemindAction" procedure="saveRemindProcedure"> 
    <private name="concept" type="String" value="SA_Remind"/>  
    <protected name="readOnly" type="String"/>  
    <protected name="notNull" type="String"/>  
    <public name="table" type="Table"/>  
    <private name="dataModel" type="String" value="/SA/task/data"/>  
    <label language="zh_CN">保存提醒定义</label>  
    <permission name="insertRange" type="List"/>
    <permission name="deleteRange" type="List"/>
    <permission name="updateRange" type="List"/>
    <private name="fnModel" type="String" value="/system/logic/fn"/>
  </action>  
  
  <action name="queryRemindAction" procedure="bizQueryProcedure"> 
    <private name="concept" type="String" value="SA_Remind"/>  
    <private name="select" type="String" value="SA_Remind,SA_Remind.sName as sName,SA_Remind.version as version,SA_Remind.sTimes as sTimes,SA_Remind.sActualStartTime as sActualStartTime,SA_Remind.sActualFinishTime as sActualFinishTime,SA_Remind.sProcess as sProcess,SA_Remind.sIntervalTime as sIntervalTime,SA_Remind.sLastTime as sLastTime,SA_Remind.sActivity as sActivity,SA_Remind.sAction as sAction,SA_Remind.sStatus as sStatus,SA_Remind.sCreatorID as sCreatorID,SA_Remind.sCreatorName as sCreatorName,SA_Remind.sRemark as sRemark,SA_Remind.sReturnable as sReturnable,SA_Remind.sReturnPattern as sReturnPattern,SA_Remind.sReminder as sReminder,SA_Remind.sCondition as sCondition,SA_Remind.sContent as sContent,SA_Remind.sDataModel as sDataModel,SA_Remind.sIntervalDay as sIntervalDay,SA_Remind.sIntervalHour as sIntervalHour,SA_Remind.sIntervalMin as sIntervalMin,SA_Remind.sTimerType as sTimerType,SA_Remind.sTimerTypeName as sTimerTypeName,SA_Remind.sRemindStyle as sRemindStyle,SA_Remind.sConditionType as sConditionType,SA_Remind.sAssertType as sAssertType,SA_Remind.sReminderID as sReminderID"/>  
    <private name="from" type="String" value="SA_Remind SA_Remind"/>  
    <private name="aggregate" type="String"/>  
    <private name="dataModel" type="String" value="/SA/task/data"/>  
    <private name="fnModel" type="String" value="/system/logic/fn"/>  
    <protected name="condition" type="String"/>  
    <permission name="range" type="List"/>  
    <public name="distinct" type="Boolean" value="false"/>  
    <public name="idColumn" type="String" value="SA_Remind"/>  
    <public name="filter" type="String"/>  
    <public name="limit" type="Integer"/>  
    <public name="offset" type="Integer"/>  
    <public name="columns" type="String"/>  
    <public name="orderBy" type="String"/>  
    <public name="aggregateColumns" type="String"/>  
    <public name="variables" type="Map"/>  
    <label language="zh_CN">查询提醒定义</label> 
  </action>  
  
  <action name="createRemindAction" procedure="bizCreateProcedure">
    <private name="concept" type="String" value="SA_Remind"/>  
    <private name="fnModel" type="String"/>  
    <public name="table" required="true" type="Table"/>  
    <public name="defaultValues" type="Map"/> 
  </action>  

  <action global="true" name="queryRemindCountAction" procedure="queryRemindCountProcedure"> 
    <label language="zh_CN">查询提醒任务条数</label> 
  </action>  
  
  
  <!-- 
  <action name="createTimerParamAction" procedure="bizCreateProcedure"> 
    <private name="concept" type="String" value="SA_RemindActionParameter"/>  
    <public name="table" type="Table"/>  
    <public name="defaultValues" type="Map"/>  
    <private name="fnModel" type="String" value="/system/logic/fn"/>  
    <label language="zh_CN">创建提醒定义action参数</label> 
  </action>  
  <action name="createReminderAction" procedure="bizCreateProcedure"> 
    <private name="concept" type="String" value="SA_Reminder"/>  
    <public name="table" type="Table"/>  
    <public name="defaultValues" type="Map"/>  
    <private name="fnModel" type="String" value="/system/logic/fn"/>  
    <label language="zh_CN">创建提醒定义被提醒人</label> 
  </action>  
  <action name="saveRemindActionParameterAction" procedure="bizSaveProcedure"> 
    <private name="concept" type="String" value="SA_RemindActionParameter"/>  
    <protected name="readOnly" type="String"/>  
    <protected name="notNull" type="String"/>  
    <public name="table" type="Table"/>  
    <private name="dataModel" type="String" value="/SA/task/data"/>  
    <label language="zh_CN">保存提醒定义action参数</label>  
    <permission name="insertRange" type="List"/>
    <permission name="deleteRange" type="List"/>
    <permission name="updateRange" type="List"/>
    <private name="fnModel" type="String" value="/system/logic/fn"/>
  </action>  
  <action name="saveyReminderAction" procedure="bizSaveProcedure"> 
    <private name="concept" type="String" value="SA_Reminder"/>  
    <protected name="readOnly" type="String"/>  
    <protected name="notNull" type="String"/>  
    <public name="table" type="Table"/>  
    <private name="dataModel" type="String" value="/SA/task/data"/>  
    <label language="zh_CN">保存提醒定义被提醒人</label>  
    <permission name="insertRange" type="List"/>
    <permission name="deleteRange" type="List"/>
    <permission name="updateRange" type="List"/>
    <private name="fnModel" type="String" value="/system/logic/fn"/>
  </action>  
  <action name="queryReminderAction" procedure="bizQueryProcedure"> 
    <private name="concept" type="String" value="SA_Reminder"/>  
    <private name="select" type="String" value="SA_Reminder,SA_Reminder.version as version,SA_Reminder.sReminderName as sReminderName,SA_Reminder.sReminderType as sReminderType,SA_Reminder.sRemindTaskID as sRemindTaskID,SA_Reminder.sReminderID as sReminderID"/>  
    <private name="from" type="String" value="SA_Reminder SA_Reminder"/>  
    <private name="aggregate" type="String"/>  
    <private name="dataModel" type="String" value="/SA/task/data"/>  
    <private name="fnModel" type="String" value="/system/logic/fn"/>  
    <protected name="condition" type="String"/>  
    <permission name="range" type="List"/>  
    <public name="distinct" type="Boolean" value="false"/>  
    <public name="idColumn" type="String" value="SA_Reminder"/>  
    <public name="filter" type="String"/>  
    <public name="limit" type="Integer"/>  
    <public name="offset" type="Integer"/>  
    <public name="columns" type="String"/>  
    <public name="orderBy" type="String"/>  
    <public name="aggregateColumns" type="String"/>  
    <public name="variables" type="Map"/>  
    <label language="zh_CN">查询提醒定义被提醒人</label> 
  </action>  
  <action name="queryRemindActionParameterAction" procedure="bizQueryProcedure"> 
    <private name="concept" type="String" value="SA_RemindActionParameter"/>  
    <private name="select" type="String" value="SA_RemindActionParameter.*"/>  
    <private name="from" type="String" value="SA_RemindActionParameter SA_RemindActionParameter"/>  
    <private name="aggregate" type="String"/>  
    <private name="dataModel" type="String" value="/SA/task/data"/>  
    <private name="fnModel" type="String" value="/system/logic/fn"/>  
    <protected name="condition" type="String"/>  
    <permission name="range" type="List"/>  
    <public name="distinct" type="Boolean" value="false"/>  
    <public name="idColumn" type="String" value="SA_RemindActionParameter"/>  
    <public name="filter" type="String"/>  
    <public name="limit" type="Integer"/>  
    <public name="offset" type="Integer"/>  
    <public name="columns" type="String"/>  
    <public name="orderBy" type="String"/>  
    <public name="aggregateColumns" type="String"/>  
    <public name="variables" type="Map"/>  
    <label language="zh_CN">查询提醒定义action参数</label> 
  </action>  
  <action global="true" name="liveAction" procedure="liveProcedure"> 
    <label language="zh_CN">session定时</label> 
  </action>  
  <action name="querySA_RemindTaskAction" procedure="bizQueryProcedure">
    <permission name="range" type="List"/>  
    <private name="concept" type="String" value="SA_RemindTask"/>  
    <private name="select" type="String" value="SA_RemindTask.*"/>  
    <private name="from" type="String" value="SA_RemindTask SA_RemindTask"/>  
    <private name="aggregate" type="String"/>  
    <private name="dataModel" type="String" value="/SA/task/data"/>  
    <private name="fnModel" type="String"/>  
    <protected name="condition" type="String"/>  
    <public name="distinct" type="Boolean" value="false"/>  
    <public name="idColumn" type="String" value="SA_RemindTask"/>  
    <public name="filter" type="String"/>  
    <public name="limit" type="Integer"/>  
    <public name="offset" type="Integer"/>  
    <public name="columns" type="String"/>  
    <public name="orderBy" type="String"/>  
    <public name="aggregateColumns" type="String"/>  
    <public name="variables" type="Map"/> 
  </action>  
  <action name="saveSA_RemindTaskAction" procedure="bizSaveProcedure">
    <permission name="insertRange" type="List"/>  
    <permission name="deleteRange" type="List"/>  
    <permission name="updateRange" type="List"/>  
    <private name="concept" type="String" value="SA_RemindTask"/>  
    <private name="dataModel" type="String" value="/SA/task/data"/>  
    <private name="fnModel" type="String"/>  
    <protected name="readOnly" type="String"/>  
    <protected name="notNull" type="String"/>  
    <public name="table" required="true" type="Table"/> 
  </action>  
  <action name="createSA_RemindTaskAction" procedure="bizCreateProcedure">
    <private name="concept" type="String" value="SA_RemindTask"/>  
    <private name="fnModel" type="String"/>  
    <public name="table" required="true" type="Table"/>  
    <public name="defaultValues" type="Map"/> 
  </action>  
  <action name="querySA_ReminderDetailAction" procedure="bizQueryProcedure">
    <permission name="range" type="List"/>  
    <private name="concept" type="String" value="SA_ReminderDetail"/>  
    <private name="select" type="String" value="SA_ReminderDetail.*"/>  
    <private name="from" type="String" value="SA_ReminderDetail SA_ReminderDetail"/>  
    <private name="aggregate" type="String"/>  
    <private name="dataModel" type="String" value="/SA/task/data"/>  
    <private name="fnModel" type="String"/>  
    <protected name="condition" type="String"/>  
    <public name="distinct" type="Boolean" value="false"/>  
    <public name="idColumn" type="String" value="SA_ReminderDetail"/>  
    <public name="filter" type="String"/>  
    <public name="limit" type="Integer"/>  
    <public name="offset" type="Integer"/>  
    <public name="columns" type="String"/>  
    <public name="orderBy" type="String"/>  
    <public name="aggregateColumns" type="String"/>  
    <public name="variables" type="Map"/> 
  </action>  
  <action name="saveSA_ReminderDetailAction" procedure="bizSaveProcedure">
    <permission name="insertRange" type="List"/>  
    <permission name="deleteRange" type="List"/>  
    <permission name="updateRange" type="List"/>  
    <private name="concept" type="String" value="SA_ReminderDetail"/>  
    <private name="dataModel" type="String" value="/SA/task/data"/>  
    <private name="fnModel" type="String"/>  
    <protected name="readOnly" type="String"/>  
    <protected name="notNull" type="String"/>  
    <public name="table" required="true" type="Table"/> 
  </action>  
  <action name="createSA_ReminderDetailAction" procedure="bizCreateProcedure">
    <private name="concept" type="String" value="SA_ReminderDetail"/>  
    <private name="fnModel" type="String"/>  
    <public name="table" required="true" type="Table"/>  
    <public name="defaultValues" type="Map"/> 
  </action>  
  --> 
</model>
