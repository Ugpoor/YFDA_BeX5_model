<?xml version="1.0" encoding="utf-8"?>

<model xmlns="http://www.justep.com/model">  
  <concept name="DEMO_Attachment" default-value-expr="guid()">
    <has-relation relation="version" default-value-expr="0">
      <label language="zh_CN">版本</label> 
    </has-relation>  
    <label language="zh_CN">附件案例</label>  
    <has-relation relation="fSampleName" data-type="String"/>  
    <has-relation relation="fAttachment" data-type="Text"/>  
    <has-relation relation="fTitle" data-type="String"/>  
    <has-relation relation="fNumber" data-type="String"/>  
    <has-relation relation="fAuthor" data-type="String"/>  
    <has-relation relation="fCreateDate" data-type="Date"/>  
    <has-relation relation="fBlobImage" data-type="Blob"/> 
  </concept>  
</model>
