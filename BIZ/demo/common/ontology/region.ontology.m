<?xml version="1.0" encoding="utf-8"?>

<model xmlns="http://www.justep.com/model">  
  <concept name="DEMO_Region"> 
    <has-relation relation="fName" required="true"/>  
    <label language="zh_CN">地区</label> 
  </concept>  
  <concept name="DEMO_Province"> 
    <has-relation relation="fName" required="true"/>  
    <has-relation relation="fRegionID" required="true"/>  
    <label language="zh_CN">省</label> 
  </concept>  
  <concept name="DEMO_City"> 
    <has-relation relation="fName" required="true"/>  
    <has-relation relation="fProvinceID" required="true"/>  
    <label language="zh_CN">市</label> 
  </concept>  
  <concept name="DEMO_Zone"> 
    <has-relation relation="fName" required="true"/>  
    <has-relation relation="fCityID" required="true"/>  
    <has-relation relation="fPostCode"/>  
    <has-relation relation="fAreaCode"/>  
    <label language="zh_CN">区</label> 
  </concept>  
  <relation name="fRegionID" data-type="Integer"> 
    <label language="zh_CN">地区ID</label> 
  </relation>  
  <relation name="fProvinceID" data-type="Integer"> 
    <label language="zh_CN">省ID</label> 
  </relation>  
  <relation name="fAreaCode" data-type="String" size="16"> 
    <label language="zh_CN">区号</label> 
  </relation>  
  <relation name="fCityID" data-type="Integer"> 
    <label language="zh_CN">市ID</label> 
  </relation>  
  <relation name="fPostCode" data-type="String" size="16"> 
    <label language="zh_CN">邮编</label> 
  </relation> 
</model>
