<?xml version="1.0" encoding="utf-8"?>

<model xmlns="http://www.justep.com/model">  
  <concept name="SA_Social" default-value-expr="guid()">
    <has-relation relation="sName"/>
    <has-relation relation="sCreatorFID"/>
    <has-relation relation="sCreatorID"/>
    <has-relation relation="sCreatorFName"/>
    <has-relation relation="sCreatorName" default-value-expr="currentPersonMemberName()"/>
    <has-relation relation="sOrgID"/>
    <has-relation relation="sOrgFID"/>
    <has-relation relation="sOrgName"/>
    <has-relation relation="sOrgFName"/>
    <has-relation relation="sProcess"/>
    <has-relation relation="sActivity"/>
    <has-relation relation="sURL"/>
    <has-relation relation="sData1"/>
    <has-relation relation="sData2"/>
    <has-relation relation="sData3"/>
    <has-relation relation="sData4"/>
    <has-relation relation="sTypeID" data-type="String">
      <label language="zh_CN">社交类型</label> 
    </has-relation>
    <has-relation relation="sTypeName">
      <label language="zh_CN">社交类型</label> 
    </has-relation>
    <has-relation relation="sCreateTime" /><has-relation relation="sValidState"></has-relation><has-relation relation="sESField01" /><has-relation relation="sESField02" /><has-relation relation="sESField03" /><has-relation relation="sESField04" /><has-relation relation="sESField05" /><has-relation relation="sESField06" /><has-relation relation="sESField07" /><has-relation relation="sESField08" /><has-relation relation="sEBField51" /><has-relation relation="sEBField52" /><has-relation relation="sEBField53" /><has-relation relation="sEBField54" /><has-relation relation="sEDField21" /><has-relation relation="sEDField22" /><has-relation relation="sEDField23" /><has-relation relation="sEDField24" /><has-relation relation="sETField31" /><has-relation relation="sETField32" /><has-relation relation="sETField33" /><has-relation relation="sETField34" /><has-relation relation="sENField11" /><has-relation relation="sENField12" /><has-relation relation="sENField13" /><has-relation relation="sENField14" /><has-relation relation="sEIField41"></has-relation><has-relation relation="sEIField42"></has-relation><has-relation relation="sEIField43"></has-relation><has-relation relation="sEIField44"></has-relation><has-relation relation="version" default-value-expr="0">
      <label language="zh_CN">版本</label> 
    </has-relation><has-relation relation="sGroupID" data-type="String" /><has-relation relation="sGroupName" data-type="String" /><has-relation relation="sMessageNumber" data-type="Integer" default-value-expr="0"></has-relation>
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
      
    <label language="zh_CN">社交信息</label>  
      
     
  







<has-relation relation="sActive" data-type="Integer" default-value-expr="0"></has-relation>
<has-relation relation="sPersonID"></has-relation>
<has-relation relation="sPersonName"></has-relation>
</concept>  
  <relation name="sGroupID" data-type="String" size="32">
    <label language="zh_CN">分组</label> 
  </relation>  
  <relation name="sGroupName" data-type="String" size="64">
    <label language="zh_CN">分组</label> 
  </relation> 
<relation name="sMessageNumber" data-type="Integer"><label language="zh_CN">消息数</label>
</relation>
</model>
