<?xml version="1.0" encoding="utf-8"?>

<model xmlns="http://www.justep.com/model">  
  <concept name="OA_CustomerVisit" default-value-expr="guid()">
    <has-relation relation="version" default-value-expr="0">
      <label language="zh_CN">版本</label> 
    </has-relation>  
    <label language="zh_CN">客户拜访表</label>  
    <has-relation relation="fVisitTime" data-type="DateTime" default-value-expr="currentDateTime()">
      <label language="zh_CN">拜访日期</label> 
    </has-relation>  
    <has-relation relation="fCustomer" data-type="String" size="50"/>  
    <has-relation relation="fCustomerID" size="32"/>  
    <has-relation relation="fAttachment"/>  
    <has-relation relation="flongitude" data-type="Decimal" size="20" scale="6"/>  
    <has-relation relation="fLatitude" data-type="Decimal" size="20" scale="6"/>  
    <has-relation relation="fCreator" size="10" default-value-expr="currentPersonName()">
      <label language="zh_CN">业务员</label> 
    </has-relation>  
    <has-relation relation="fCreatorID" size="32" default-value-expr="currentPersonID()">
      <label language="zh_CN">业务员ID</label> 
    </has-relation>  
    <has-relation relation="fContent" size="200">
      <label language="zh_CN">总结</label> 
    </has-relation> 
  <has-relation relation="fCreatorDate" data-type="Date" default-value-expr="currentDate()"></has-relation>
</concept>  
  <relation name="fVisitTime" data-type="DateTime">
    <label language="zh_CN">拜访日期</label> 
  </relation>  

<relation name="fCreatorDate" data-type="Date"><label language="zh_CN">创建日期</label>
</relation>
</model>
