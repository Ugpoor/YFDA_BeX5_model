<?xml version="1.0" encoding="utf-8"?>

<model xmlns="http://www.justep.com/model">  
  <concept name="SA_QuickStart" default-value-expr="guid()">
    <has-relation relation="version" default-value-expr="0">
      <label language="zh_CN">版本</label> 
    </has-relation>  
    <label language="zh_CN">Mobile快捷应用设置</label>  
    <has-relation relation="sLabel" data-type="String">
      <label language="zh_CN">标签名</label> 
    </has-relation>  
    <has-relation relation="sIcon" data-type="String">
      <label language="zh_CN">图标路径</label> 
    </has-relation>  
    <has-relation relation="sURL" data-type="String">
      <label language="zh_CN">应用路径</label> 
    </has-relation>  
    <has-relation relation="sProcess">
      <label language="zh_CN">过程</label> 
    </has-relation>  
    <has-relation relation="sActivity">
      <label language="zh_CN">环节</label> 
    </has-relation>  
    <has-relation relation="sPersonID" default-value-expr="currentPersonID()">
      <label language="zh_CN">人员</label> 
    </has-relation>  
    <has-relation relation="sSequence" data-type="Integer">
      <label language="zh_CN">顺序号</label> 
    </has-relation> 
  </concept>  
  <relation name="sLabel" data-type="String">
    <label language="zh_CN">标签名</label> 
  </relation>  
  <relation name="sIcon" data-type="String">
    <label language="zh_CN">图标路径</label> 
  </relation>  
  <relation name="sURL" data-type="String">
    <label language="zh_CN">应用路径</label> 
  </relation> 
</model>
