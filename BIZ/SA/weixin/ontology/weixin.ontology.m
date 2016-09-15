<?xml version="1.0" encoding="utf-8"?>

<model xmlns="http://www.justep.com/model">  
  <concept name="SA_WeixinCp" default-value-expr="guid()">
    <has-relation relation="version" default-value-expr="0">
      <label language="zh_CN">版本</label> 
    </has-relation>  
    <label language="zh_CN">SA_WeixinCp</label>  
    <has-relation relation="sName"/>  
     
  <has-relation relation="sText" data-type="Text"><label language="zh_CN">文本</label>
</has-relation>
<has-relation relation="sCode"></has-relation>
</concept> 
<relation name="sText" data-type="Text"><label language="zh_CN">文本</label>
</relation>
</model>
