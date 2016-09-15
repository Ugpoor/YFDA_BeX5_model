<?xml version="1.0" encoding="UTF-8"?>
<model xmlns="http://www.justep.com/model">
<concept name="OA_LeaveApply" default-value-expr="guid()"><has-relation relation="version" default-value-expr="0"><label language="zh_CN">版本</label>
</has-relation>
<label language="zh_CN">请假申请</label>
<has-relation relation="fCreatorID" default-value-expr="currentPersonID()" size="32"><label language="zh_CN">请假人ID</label>
</has-relation>
<has-relation relation="fCreator" default-value-expr="currentPersonName()" size="10"><label language="zh_CN">请假人</label>
</has-relation>
<has-relation relation="fCreatorTime" default-value-expr="currentDateTime()"><label language="zh_CN">创建时间</label>
</has-relation>
<has-relation relation="fName" size="50"></has-relation>
<has-relation relation="fContent" size="200"><label language="zh_CN">请假原由</label>
</has-relation>
<has-relation relation="fStartTime"></has-relation>
<has-relation relation="fEndTime"></has-relation>
<has-relation relation="sFName" size="2048"></has-relation>
<has-relation relation="sFID" size="2048"></has-relation>
<has-relation relation="fLastModifyTime"></has-relation>
<has-relation relation="fLeaveType" data-type="String" size="10"></has-relation>
<has-relation relation="fLeaveTypeID" data-type="String" size="32"></has-relation>
<has-relation relation="fApprove" size="50"></has-relation>
<has-relation relation="fLeaveDays" data-type="Integer"></has-relation>
<has-relation relation="fStatus" size="10"><label language="zh_CN">单据状态</label>
</has-relation>
<has-relation relation="fLeaveHours" data-type="Float"></has-relation>
<has-relation relation="fLeaveTime" data-type="Float"></has-relation>
</concept>
<relation name="fLeaveType" data-type="String"><label language="zh_CN">请假类型</label>
</relation>

<relation name="fLeaveDays" data-type="Integer"><label language="zh_CN">请假天数</label>
</relation>
<relation name="fLeaveHours" data-type="Float"><label language="zh_CN">请假小时数</label>
</relation>
<relation name="fLeaveTime" data-type="Float"><label language="zh_CN">请假时长</label>
</relation>
</model>