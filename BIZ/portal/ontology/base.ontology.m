<?xml version="1.0" encoding="UTF-8"?>
<model xmlns="http://www.justep.com/model">
<concept name="Portal_Message" default-value-expr="guid()"><has-relation relation="version" default-value-expr="0"><label language="zh_CN">版本</label>
</has-relation>
<label language="zh_CN">message</label>
<has-relation relation="fLabel" data-type="String"></has-relation>
<has-relation relation="fSubLabel" data-type="String"></has-relation><has-relation relation="fContent" data-type="String" single-valued="true"></has-relation>
<has-relation relation="fTag" data-type="String"></has-relation><has-relation relation="fDate" data-type="DateTime"></has-relation>
<has-relation relation="fCount" data-type="Integer" single-valued="true"></has-relation>
<has-relation relation="fProcess"></has-relation>
<has-relation relation="fActivity"></has-relation>


<has-relation relation="fUrl" data-type="String"></has-relation>
</concept>
<relation name="fLabel" data-type="String"><label language="zh_CN">标题</label>
</relation>
<relation name="fContent" data-type="String"><label language="zh_CN">内容</label>
</relation>
<relation name="fDate" data-type="DateTime"><label language="zh_CN">日期</label>
</relation>
<relation name="fCount" data-type="Integer"><label language="zh_CN">数量</label>
</relation>
<relation name="fProcess" data-type="String"><label language="zh_CN">过程</label>
</relation>
<relation name="fActivity" data-type="String"><label language="zh_CN">环节</label>
</relation>
<relation name="fSubLabel" data-type="String"><label language="zh_CN">副标题</label>
</relation>
<relation name="fTag" data-type="String"><label language="zh_CN">标签</label>
</relation>
<relation name="fUrl" data-type="String"><label language="zh_CN">URL</label>
</relation>
</model>