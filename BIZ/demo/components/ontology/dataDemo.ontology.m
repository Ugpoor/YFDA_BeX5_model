<?xml version="1.0" encoding="utf-8"?>

<model xmlns="http://www.justep.com/model">  
  <concept name="DEMO_TABLE1" default-value-expr="guid()"> 
    <has-relation relation="version" default-value-expr="0"> 
      <label language="zh_CN">版本</label> 
    </has-relation>  
    <label language="zh_CN">DEMO_TABLE1</label> 
  <has-relation relation="fString"><label language="zh_CN">String</label>
</has-relation>
<has-relation relation="fInteger"><label language="zh_CN">Integer</label>
</has-relation>
<has-relation relation="fFloat"><label language="zh_CN">Float</label>
</has-relation>
<has-relation relation="fDecimal" size="13" scale="3"><label language="zh_CN">Decimal</label>
</has-relation>
<has-relation relation="fDate"><label language="zh_CN">Date</label>
</has-relation>
<has-relation relation="fDateTime"><label language="zh_CN">DateTime</label>
</has-relation>
<has-relation relation="fTime"><label language="zh_CN">Time</label>
</has-relation>
<has-relation relation="fBlob"><label language="zh_CN">Blob</label>
</has-relation>
<has-relation relation="fText"><label language="zh_CN">Text</label>
</has-relation>
<has-relation relation="fParent"><label language="zh_CN">Parent</label>
</has-relation>
<has-relation relation="fChild"><label language="zh_CN">Child</label>
</has-relation>
<has-relation relation="fLevel"><label language="zh_CN">Level</label>
</has-relation>

<has-relation relation="fPath"><label language="zh_CN">path</label>
</has-relation>
<has-relation relation="fString0"><label language="zh_CN">string0</label>
</has-relation>
<has-relation relation="fString1"><label language="zh_CN">string1</label>
</has-relation>
<has-relation relation="fKind"><label language="zh_CN">kind</label>
</has-relation>
</concept>  
  <concept name="DEMO_TABLE2" default-value-expr="guid()"> 
    <has-relation relation="version" default-value-expr="0"> 
      <label language="zh_CN">版本</label> 
    </has-relation>  
    <label language="zh_CN">DEMO_TABLE2</label> 
  <has-relation relation="fString"><label language="zh_CN">String</label>
</has-relation>
<has-relation relation="fInteger"><label language="zh_CN">Integer</label>
</has-relation>
<has-relation relation="fFloat"><label language="zh_CN">Float</label>
</has-relation>
<has-relation relation="fDecimal"><label language="zh_CN">Decimal</label>
</has-relation>
<has-relation relation="fDate"><label language="zh_CN">Date</label>
</has-relation>
<has-relation relation="fDateTime"><label language="zh_CN">DateTime</label>
</has-relation>
<has-relation relation="fTime"><label language="zh_CN">Time</label>
</has-relation>
<has-relation relation="fBlob"><label language="zh_CN">Blob</label>
</has-relation>
<has-relation relation="fText"><label language="zh_CN">Text</label>
</has-relation>
<has-relation relation="fMaster"><label language="zh_CN">Master</label>
</has-relation>
<has-relation relation="fParent"><label language="zh_CN">Parent</label>
</has-relation>
<has-relation relation="fChild"><label language="zh_CN">Child</label>
</has-relation>
<has-relation relation="fLevel"><label language="zh_CN">Level</label>
</has-relation>
<has-relation relation="fPath"><label language="zh_CN">path</label>
</has-relation>
<has-relation relation="fString0"><label language="zh_CN">string0</label>
</has-relation>
<has-relation relation="fString1"><label language="zh_CN">string1</label>
</has-relation>
<has-relation relation="fKind"><label language="zh_CN">kind</label>
</has-relation>
</concept>  
  <concept name="DEMO_TABLE3" default-value-expr="guid()"> 
    <has-relation relation="version" default-value-expr="0"> 
      <label language="zh_CN">版本</label> 
    </has-relation>  
    <label language="zh_CN">DEMO_TABLE3</label> 
  <has-relation relation="fString"><label language="zh_CN">String</label>
</has-relation>
<has-relation relation="fInteger"><label language="zh_CN">Integer</label>
</has-relation>
<has-relation relation="fFloat"><label language="zh_CN">Float</label>
</has-relation>
<has-relation relation="fDecimal"><label language="zh_CN">Decimal</label>
</has-relation>
<has-relation relation="fDate"><label language="zh_CN">Date</label>
</has-relation>
<has-relation relation="fDateTime"><label language="zh_CN">DateTime</label>
</has-relation>
<has-relation relation="fTime"><label language="zh_CN">Time</label>
</has-relation>
<has-relation relation="fBlob"><label language="zh_CN">Blob</label>
</has-relation>
<has-relation relation="fText"><label language="zh_CN">Text</label>
</has-relation>
<has-relation relation="fMaster"><label language="zh_CN">Master</label>
</has-relation>
<has-relation relation="fParent"><label language="zh_CN">Parent</label>
</has-relation>
<has-relation relation="fChild"><label language="zh_CN">Child</label>
</has-relation>
<has-relation relation="fLevel"><label language="zh_CN">Level</label>
</has-relation>
<has-relation relation="fPath"><label language="zh_CN">path</label>
</has-relation>
<has-relation relation="fString0"><label language="zh_CN">string0</label>
</has-relation>
<has-relation relation="fString1"><label language="zh_CN">string1</label>
</has-relation>
</concept>  
  <relation name="fString" data-type="String">
    <label language="zh_CN">String</label> 
  </relation>  
    
  <relation name="fInteger" data-type="Integer">
    <label language="zh_CN">Integer</label> 
  </relation>  
    
  <relation name="fFloat" data-type="Float">
    <label language="zh_CN">Float</label> 
  </relation>  
    
  <relation name="fDecimal" data-type="Decimal">
    <label language="zh_CN">Decimal</label> 
  </relation>  
    
  <relation name="fDate" data-type="Date">
    <label language="zh_CN">Date</label> 
  </relation>  
    
  <relation name="fDateTime" data-type="DateTime">
    <label language="zh_CN">DateTime</label> 
  </relation>  
    
  <relation name="fTime" data-type="Time">
    <label language="zh_CN">Time</label> 
  </relation>  
    
  <relation name="fBlob" data-type="Blob">
    <label language="zh_CN">Blob</label> 
  </relation>  
  <relation name="fText" data-type="Text">
    <label language="zh_CN">Text</label> 
  </relation>  
  <relation name="fParent" data-type="DEMO_TABLE1" inverse-of="fChild">
    <label language="zh_CN">Parent</label> 
  </relation>  
  <relation name="fChild" data-type="DEMO_TABLE1" inverse-of="fParent" single-valued="false">
    <label language="zh_CN">Child</label> 
  </relation>  
  <relation name="fLevel" data-type="String">
    <label language="zh_CN">Level</label> 
  </relation> 
<relation name="fMaster" data-type="String"><label language="zh_CN">Master</label>
</relation>

<relation name="fPath" data-type="String"><label language="zh_CN">path</label>
</relation>
<relation name="fString0" data-type="String"><label language="zh_CN">string0</label>
</relation>
<relation name="fString1" data-type="String"><label language="zh_CN">string1</label>
</relation>
<relation name="fKind" data-type="String"><label language="zh_CN">kind</label>
</relation>
</model>
