<?xml version="1.0" encoding="utf-8"?>

<model xmlns="http://www.justep.com/model"> &gt; 
  <relation name="sTimes" data-type="Integer" single-valued="true"> 
    <label language="zh_CN">执行次数</label> 
  </relation>  
  <relation name="sLastTime" data-type="DateTime" single-valued="true"> 
    <label language="zh_CN">上次执行时间</label> 
  </relation>  
  <relation name="sIntervalTime" data-type="Time" single-valued="true"> 
    <label language="zh_CN">间隔时间</label> 
  </relation>  
  <relation name="sStatus" data-type="String" single-valued="true"> 
    <label language="zh_CN">任务状态</label> 
  </relation>  
  <relation name="sTimerType" data-type="String" single-valued="true"> 
    <label language="zh_CN">定时类型</label> 
  </relation>  
  <relation name="sTimerTypeName" data-type="String" single-valued="true"> 
    <label language="zh_CN">定时类型名称</label> 
  </relation>  
  <!-- <relation name="sRemark" data-type="String" single-valued="true"> 
    <label language="zh_CN">状态备注</label> 
  </relation> -->  
  <relation name="sReturnable" data-type="String" single-valued="true"> 
    <label language="zh_CN">是否返回</label> 
  </relation>  
  <relation name="sReturnPattern" data-type="String" single-valued="true"> 
    <label language="zh_CN">返回模板</label> 
  </relation>  
  <relation name="sActionParam" data-type="SA_RemindActionParameter"> 
    <label language="zh_CN">action参数</label> 
  </relation>  
  <relation name="sCondition" data-type="String" single-valued="true"> 
    <label language="zh_CN">条件SQL</label> 
  </relation>  
  <relation name="sDataModel" data-type="String" single-valued="true"> 
    <label language="zh_CN">数据库模块</label> 
  </relation>  
  <relation name="sReminder" data-type="SA_OPPerson"> 
    <label language="zh_CN">被提醒人</label> 
  </relation>  
  <relation name="sIntervalDay" data-type="Integer" single-valued="true"> 
    <label language="zh_CN">天</label> 
  </relation>  
  <relation name="sIntervalHour" data-type="Integer" single-valued="true"> 
    <label language="zh_CN">小时</label> 
  </relation>  
  <relation name="sIntervalMin" data-type="Integer" single-valued="true"> 
    <label language="zh_CN">分钟</label> 
  </relation>  
  <!--  
  <relation name="sType" data-type="Integer" single-valued="true"> 
    <label language="zh_CN">类型</label> 
  </relation>  
  -->
  <concept name="SA_Remind" default-value-expr="guid()"> 
    <label language="zh_CN">提醒定义</label>  
    <has-relation relation="version" default-value-expr="0"> 
      <label language="zh_CN">版本</label> 
    </has-relation>
    <has-relation relation="sName"> 
      <label language="zh_CN">名称</label> 
    </has-relation>
    <has-relation relation="sReminder" data-type="String"> 
      <label language="zh_CN">被提醒人</label> 
    </has-relation>
    <has-relation relation="sReminderID" size="1000"></has-relation><has-relation relation="sTimerType"> 
      <label language="zh_CN">定时类型</label> 
    </has-relation>
    <has-relation relation="sTimerTypeName"/>
    <has-relation relation="sActualStartTime" data-type="DateTime"> 
      <label language="zh_CN">开始时间</label> 
    </has-relation>
    <has-relation relation="sActualFinishTime" data-type="DateTime"> 
      <label language="zh_CN">结束时间</label> 
    </has-relation>
    <has-relation relation="sIntervalTime"> 
      <label language="zh_CN">间隔时间</label> 
    </has-relation>
    <has-relation relation="sIntervalDay" default-value-expr="0"> 
      <label language="zh_CN">天</label> 
    </has-relation>
    <has-relation relation="sIntervalHour" default-value-expr="0"> 
      <label language="zh_CN">小时</label> 
    </has-relation>
    <has-relation relation="sIntervalMin" default-value-expr="1"> 
      <label language="zh_CN">分钟</label> 
    </has-relation>
    <has-relation relation="sLastTime" data-type="DateTime"> 
      <label language="zh_CN">上次执行时间</label> 
    </has-relation>
    <has-relation relation="sStatus" default-value-expr="'alarm.state.create'"> 
      <label language="zh_CN">任务状态</label> 
    </has-relation>
    <has-relation relation="sRemark"> 
      <label language="zh_CN">状态备注</label> 
    </has-relation>
    <has-relation relation="sTimes" default-value-expr="1"> 
      <label language="zh_CN">执行次数</label> 
    </has-relation>  
    <has-relation relation="sCreatorID" default-value-expr="operatorID()"> 
      <label language="zh_CN">创建人</label> 
    </has-relation>
    <has-relation relation="sCreatorName" default-value-expr="operatorName()"> 
      <label language="zh_CN">创建人姓名</label> 
    </has-relation>
    <has-relation relation="sDataModel"> 
      <label language="zh_CN">数据库模块</label> 
    </has-relation>
    <has-relation relation="sRemindStyle"/>
    <has-relation relation="sConditionType"/>
    <has-relation relation="sCondition"> 
      <label language="zh_CN">条件SQL</label> 
    </has-relation>
    <has-relation relation="sContent"> 
      <label language="zh_CN">内容</label> 
    </has-relation>
    <has-relation relation="sProcess" default-value-expr="'/SA/task/remind/remindProcess'"> 
      <label language="zh_CN">过程</label> 
    </has-relation>
    <has-relation relation="sActivity" default-value-expr="'mainActivity'"> 
      <label language="zh_CN">活动</label> 
    </has-relation>
    <has-relation relation="sAction" default-value-expr="'createRemindTaskAction'"> 
      <label language="zh_CN">处理action</label> 
    </has-relation>  
    <has-relation relation="sActionParam"> 
      <label language="zh_CN">action参数</label> 
    </has-relation>
    <has-relation relation="sAssertType" data-type="Integer"/>
    <has-relation relation="sReturnable"> 
      <label language="zh_CN">是否返回</label> 
    </has-relation>  
    <has-relation relation="sReturnPattern"> 
      <label language="zh_CN">返回模板</label> 
    </has-relation> 
  
</concept>  
  <relation name="sRemindID" data-type="SA_Remind" single-valued="true"> 
    <label language="zh_CN">提醒定义</label> 
  </relation>  
  <relation name="sDataType" data-type="String" single-valued="true"> 
    <label language="zh_CN">数据类型</label> 
  </relation>  
  
  <concept name="SA_RemindActionParameter" default-value-expr="guid()"> 
    <label language="zh_CN">提醒定义action参数</label>  
    <has-relation relation="sName"> 
      <label language="zh_CN">参数名</label> 
    </has-relation>  
    <has-relation relation="sValue"> 
      <label language="zh_CN">参数值</label> 
    </has-relation>  
    <has-relation relation="sRemindID"> 
      <label language="zh_CN">提醒定义</label> 
    </has-relation>  
    <has-relation relation="sDataType"> 
      <label language="zh_CN">数据类型</label> 
    </has-relation>  
    <has-relation relation="version"> 
      <label language="zh_CN">版本</label> 
    </has-relation> 
  </concept>  
  <!-- 
  <concept name="SA_Reminder" default-value-expr="guid()"> 
    <has-relation relation="version" default-value-expr="0"/>  
    <label language="zh_CN">被提醒人员列表</label>  
    <has-relation relation="sReminderName"/>  
    <has-relation relation="sReminderID"/>  
    <has-relation relation="sReminderType"/>  
    <has-relation relation="sRemindTaskID"/> 
  <has-relation relation="sRemindID" data-type="String"></has-relation>
</concept>  
-->
    
  <!-- <relation name="sCreatorID" data-type="String"> 
    <label language="zh_CN">创建人</label> 
  </relation> -->  
  <!--  
  <relation name="sCreatorName" data-type="String"> 
    <label language="zh_CN">创建人姓名</label> 
  </relation>  
   -->  
  <relation name="sRemindStyle" data-type="String"> 
    <label language="zh_CN">提醒方式</label> 
  </relation>  
  <!-- 
  <concept name="SA_RemindTask" default-value-expr="guid()"> 
    <has-relation relation="version" default-value-expr="0"> 
      <label language="zh_CN">版本</label> 
    </has-relation>  
    <label language="zh_CN">提醒任务</label>  
    <has-relation relation="sStatusID" data-type="Integer" default-value-expr="0"> 
      <label language="zh_CN">任务状态</label> 
    </has-relation>  
    <has-relation relation="sCreateTime"/>  
    <has-relation relation="sContent"/>  
    <has-relation relation="sUCode" /><has-relation relation="sTaskID" /><has-relation relation="sCreatorID"> 
      <label language="zh_CN">创建人ID</label> 
    </has-relation>  
    <has-relation relation="sCreatorName"> 
      <label language="zh_CN">创建人名称</label> 
    </has-relation>  
    <has-relation relation="sLimitTime"/>  
      
     
  <has-relation relation="sRemindStyle"></has-relation>
</concept>  
-->
  <relation name="sSmsStatusID" data-type="Integer"> 
    <label language="zh_CN">短信提醒状态</label> 
  </relation>  
  <relation name="sMsnStatusID" data-type="Integer"> 
    <label language="zh_CN">msn提醒状态</label> 
  </relation>  
  <relation name="sX5MessagerStatusID" data-type="Integer"> 
    <label language="zh_CN">msg提醒状态</label> 
  </relation>  
  <relation name="sConditionType" data-type="String"> 
    <label language="zh_CN">条件的类型</label> 
  </relation>  
  <relation name="sAssertType" data-type="String">
    <label language="zh_CN">判断方式</label> 
  </relation>  
  <relation name="sUCode" data-type="String">
    <label language="zh_CN">唯一码</label> 
  </relation>  
  <relation name="sTaskID" data-type="String">
    <label language="zh_CN">流程任务ID</label> 
  </relation>  
  <relation name="sReminderName" data-type="String">
    <label language="zh_CN">提醒者名称</label> 
  </relation>  
  <relation name="sReminderID" data-type="String">
    <label language="zh_CN">提醒者ID</label> 
  </relation>  
  <relation name="sReminderType" data-type="String">
    <label language="zh_CN">提醒者的类型</label> 
  </relation>  
  <relation name="sRemindTaskID" data-type="String">
    <label language="zh_CN">提醒任务ID</label> 
  </relation>  
  <!-- 
  <concept name="SA_ReminderDetail" default-value-expr="guid()">
    <has-relation relation="version" default-value-expr="0">
      <label language="zh_CN">版本</label> 
    </has-relation>  
    <label language="zh_CN">提醒状态</label>  
    <has-relation relation="sReminderName"></has-relation><has-relation relation="sReminderID" data-type="String"/>  
    <has-relation relation="sRemindTaskID" />  
      
      
      
     
  



<has-relation relation="sSendTarget"></has-relation>
<has-relation relation="sSendTargetType"></has-relation>
<has-relation relation="sStatusID" data-type="Integer"><label language="zh_CN">提醒状态</label>
</has-relation>
</concept> 
 -->
<relation name="sX5Messager" data-type="String"><label language="zh_CN">x5Messager号码</label>
</relation>
<relation name="sSendTarget" data-type="String"><label language="zh_CN">发送目标</label>
</relation>
<relation name="sSendTargetType" data-type="String"><label language="zh_CN">发送目标类型</label>
</relation>
</model>
