<?xml version="1.0" encoding="UTF-8"?>
<model xmlns="http://www.justep.com/model">
<concept name="SA_Code" default-value-expr="guid()"><has-relation relation="version" default-value-expr="0"><label language="zh_CN">版本</label>
</has-relation>
<label language="zh_CN">通用编码</label>
<has-relation relation="sCode"></has-relation>
<has-relation relation="sName"></has-relation>
<has-relation relation="sType" data-type="String"></has-relation>
</concept>
<relation name="sType" data-type="String"><label language="zh_CN">类型</label>
</relation>
</model>