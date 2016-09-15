<?xml version="1.0" encoding="UTF-8"?>
<model xmlns="http://www.justep.com/model">
<concept name="RI_RY" default-value-expr="guid()"><has-relation relation="version" default-value-expr="0"><label language="zh_CN">版本</label>
</has-relation>
<label language="zh_CN">人员</label>
<has-relation relation="fMZ" data-type="String"></has-relation>
<has-relation relation="fXB" data-type="String"></has-relation>
</concept>
<relation name="fMZ" data-type="String"><label language="zh_CN">名字</label>
</relation>
<relation name="fXB" data-type="String"><label language="zh_CN">性别</label>
</relation>
</model>