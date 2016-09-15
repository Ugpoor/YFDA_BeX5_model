<?xml version="1.0" encoding="UTF-8"?>
<model xmlns="http://www.justep.com/model">
<concept name="YF_mainApplication" default-value-expr="guid()"><has-relation relation="version" default-value-expr="0"><label language="zh_CN">版本</label>
</has-relation>
<label language="zh_CN">申请表主表</label>
<has-relation relation="fAppId" data-type="String"></has-relation>
<has-relation relation="fAppUser" data-type="String"></has-relation>
</concept>
<relation name="fAppId" data-type="String"><label language="zh_CN">appId</label>
</relation>
<relation name="fAppUser" data-type="String"><label language="zh_CN">申请人用户名</label>
</relation>
</model>