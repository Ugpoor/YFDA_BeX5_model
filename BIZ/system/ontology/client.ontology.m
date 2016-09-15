<?xml version="1.0" encoding="utf-8"?>

<model xmlns="http://www.justep.com/model">  
  <concept name="SA_Client" default-value-expr="guid()">
    <has-relation relation="version" default-value-expr="0">
      <label language="zh_CN">版本</label> 
    </has-relation>  
    <label language="zh_CN">租户</label>  
    <has-relation relation="sName"/>  
    <has-relation relation="sLongName"/>
    <has-relation relation="sCode"/>
    <has-relation relation="sContact" data-type="String"/>
    <has-relation relation="sPhone"/>
    <has-relation relation="sFax"/>
    <has-relation relation="sAddress"/>
    <has-relation relation="sZip"/>
    <has-relation relation="sDescription"/>  
    <has-relation relation="sCreatorID"/>  
    <has-relation relation="sCreatorName" default-value-expr="currentPersonName()"/>  
    <has-relation relation="sCreateTime" default-value-expr="currentDateTime()"/>  
    <has-relation relation="sEMail" data-type="String"/>  
    <has-relation relation="sIndustry" data-type="String" size="32"/>  
    <has-relation relation="sEmployeesSize" data-type="Integer"/> 
  </concept>  
  <relation name="sContact" data-type="String" size="32">
    <label language="zh_CN">负责人</label> 
  </relation>  
  <concept name="SA_App" default-value-expr="guid()">
    <has-relation relation="version" default-value-expr="0">
      <label language="zh_CN">版本</label> 
    </has-relation>  
    <label language="zh_CN">应用</label>  
    <has-relation relation="sName"/>  
    <has-relation relation="sCode" /><has-relation relation="sModel"/>
      
      
    <has-relation relation="sDescription"/>
    
    
    <has-relation relation="sCreatorID"/>
    <has-relation relation="sCreatorName" default-value-expr="currentPersonName()"/>  
    <has-relation relation="sCreateTime" default-value-expr="currentDateTime()"/>  
      
     
  <has-relation relation="sAppVersion" data-type="String"></has-relation>
<has-relation relation="sVendorName" data-type="String"></has-relation>
<has-relation relation="sVendorID" data-type="SA_AppVendor"></has-relation>
<has-relation relation="sValidState"></has-relation>
</concept>  
  <concept name="SA_AppVendor" default-value-expr="guid()">
    <has-relation relation="version" default-value-expr="0">
      <label language="zh_CN">版本</label> 
    </has-relation>  
    <label language="zh_CN">应用供应商</label>  
    <has-relation relation="sName"/>  
    <has-relation relation="sLongName"/>
    <has-relation relation="sCode"/>
    <has-relation relation="sContact"/>
    <has-relation relation="sPhone"/>
    <has-relation relation="sFax"/>
    <has-relation relation="sAddress"/>
    <has-relation relation="sZip"/>
    <has-relation relation="sDescription"/>  
    <has-relation relation="sCreatorID"/>
    <has-relation relation="sCreatorName" default-value-expr="currentPersonName()"/>  
    <has-relation relation="sCreateTime" default-value-expr="currentDateTime()"/> 
    <has-relation relation="sEMail" data-type="String"/>  
    <has-relation relation="sIndustry" data-type="String" size="32"/>  
    <has-relation relation="sEmployeesSize" data-type="Integer"/> 
  </concept>  
    
    
    
    
  <concept name="SA_ClientApp" default-value-expr="guid()">
    <has-relation relation="version" default-value-expr="0">
      <label language="zh_CN">版本</label> 
    </has-relation>  
    <label language="zh_CN">租户应用</label>  
    
    
    <has-relation relation="sClientName"></has-relation><has-relation relation="sClientID"></has-relation><has-relation relation="sAppName"></has-relation><has-relation relation="sAppID"></has-relation><has-relation relation="sAppVersion"></has-relation><has-relation relation="sVendorName"></has-relation><has-relation relation="sVendorID"></has-relation>
    
    
    
    
    
    
    
    
    
    <has-relation relation="sCreatorID"/>
    <has-relation relation="sCreatorName" default-value-expr="currentPersonName()"/>
    
    
    <has-relation relation="sCreateTime" default-value-expr="currentDateTime()"/> 
  






<has-relation relation="sRentStartTime" data-type="DateTime"></has-relation>
<has-relation relation="sRentDays" data-type="Integer" default-value-expr="-1"></has-relation>
<has-relation relation="sRentNumber" data-type="Integer" default-value-expr="-1"></has-relation>
<has-relation relation="sValidState"></has-relation>
<has-relation relation="sAppModel" data-type="String"></has-relation>
<has-relation relation="sRentEndTime" data-type="DateTime"></has-relation>
</concept>  
  <relation name="sClientName" data-type="String" size="64">
    <label language="zh_CN">租户名称</label> 
  </relation>  
  <relation name="sClientID" data-type="String" size="32">
    <label language="zh_CN">租户</label> 
  </relation>  
  <relation name="sAppID" data-type="String" size="32">
    <label language="zh_CN">应用</label> 
  </relation>  
  <relation name="sAppName" data-type="String" size="64">
    <label language="zh_CN">应用名称</label> 
  </relation>  
  <relation name="sEMail" data-type="String" size="64">
    <label language="zh_CN">邮件</label> 
  </relation>  
  <relation name="sIndustry" data-type="String" size="64">
    <label language="zh_CN">行业</label> 
  </relation>  
  <relation name="sEmployeesSize" data-type="Integer">
    <label language="zh_CN">职员数</label> 
  </relation> 
<relation name="sAppVersion" data-type="String" size="32"><label language="zh_CN">应用版本</label>
</relation>
<relation name="sVendorName" data-type="String"><label language="zh_CN">供应商名称</label>
</relation>
<relation name="sVendorID" data-type="String"><label language="zh_CN">供应商</label>
</relation>
<relation name="sRentStartTime" data-type="DateTime"><label language="zh_CN">租用开始时间</label>
</relation>
<relation name="sRentDays" data-type="Integer"><label language="zh_CN">租用天数</label>
</relation>
<relation name="sRentNumber" data-type="Integer"><label language="zh_CN">租用人数</label>
</relation>
<relation name="sAppModel" data-type="String"><label language="zh_CN">应用模块</label>
</relation>
<relation name="sRentEndTime" data-type="DateTime"><label language="zh_CN">租用结束时间</label>
</relation>
</model>
