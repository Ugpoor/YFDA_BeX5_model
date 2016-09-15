<?xml version="1.0" encoding="UTF-8"?>
<model xmlns="http://www.justep.com/model">
<concept name="DEMO_BorrowBook" default-value-expr="guid()"><has-relation relation="version" default-value-expr="0" required="false"><label language="zh_CN">版本</label>
</has-relation>
<label language="zh_CN">借书申请</label>
<has-relation relation="fBookName" size="256" required="false"></has-relation><has-relation relation="fStartDate" required="true"></has-relation>
<has-relation relation="fEndDate" required="true"></has-relation>


<has-relation relation="fBorrower" data-type="String" size="64" required="true"></has-relation>
</concept>
<relation name="fBorrower" data-type="String"><label language="zh_CN">借书人</label>
</relation>
</model>