<?xml version="1.0" encoding="UTF-8"?>
<model xmlns="http://www.justep.com/model">
<concept name="OA_Evection" default-value-expr="guid()"><has-relation relation="version" default-value-expr="0"><label language="zh_CN">版本</label>
</has-relation>
<label language="zh_CN">出差管理表</label>
<has-relation relation="fContent" size="200"></has-relation>
<has-relation relation="fCreatorID" default-value-expr="currentPersonID()" size="32"><label language="zh_CN">创建人ID</label>
</has-relation>
<has-relation relation="fCreator" default-value-expr="currentPersonName()" size="10"><label language="zh_CN">创建人</label>
</has-relation>
<has-relation relation="fCreatorTime" default-value-expr="currentDateTime()"><label language="zh_CN">创建时间</label>
</has-relation>
<has-relation relation="fStatus" default-value-expr="'未关闭'" size="10"><label language="zh_CN">日程状态</label>
</has-relation>
<has-relation relation="fPlace" size="100"></has-relation>
<has-relation relation="fStartDate"></has-relation>
<has-relation relation="fEndDate"></has-relation>
<has-relation relation="fAttachment"></has-relation>
<has-relation relation="fApprove" data-type="String" size="50"></has-relation>
<has-relation relation="fName" size="50"></has-relation>
<has-relation relation="fLastModifyTime"></has-relation>
</concept>
<concept name="OA_EvectionPlace" default-value-expr="guid()"><has-relation relation="version" default-value-expr="0"><label language="zh_CN">版本</label>
</has-relation>
<label language="zh_CN">出差地点表</label>
<has-relation relation="fEvectionID" data-type="String" size="32"></has-relation>
<has-relation relation="fStartDate" data-type="Date"></has-relation>
<has-relation relation="fEndDate" data-type="Date"></has-relation>
<has-relation relation="fPlace" size="50"></has-relation>
</concept>
<relation name="fEvectionID" data-type="String"><label language="zh_CN">出差表ID</label>
</relation>
<relation name="fStartDate" data-type="Date"><label language="zh_CN">开始日期</label>
</relation>
<relation name="fEndDate" data-type="Date"><label language="zh_CN">结束日期</label>
</relation>
<relation name="fApprove" data-type="String"><label language="zh_CN">审批人</label>
</relation>

</model>