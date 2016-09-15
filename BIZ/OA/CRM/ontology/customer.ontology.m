<?xml version="1.0" encoding="utf-8"?>

<model xmlns="http://www.justep.com/model">  
  <concept name="OA_Customer" default-value-expr="guid()">
    <has-relation relation="version" default-value-expr="0">
      <label language="zh_CN">版本</label> 
    </has-relation>  
    <label language="zh_CN">客户表</label>  
    <has-relation relation="fName" data-type="String" size="50"><label language="zh_CN">公司名称</label>
</has-relation>  
    <has-relation relation="fContent" data-type="String" size="200"><label language="zh_CN">简介</label>
</has-relation>  
    <has-relation relation="fPhone" data-type="String" size="20"/>  
    <has-relation relation="fProvince" data-type="String" size="10"/>  
    <has-relation relation="fProvinceID" data-type="String" size="32"/>  
    <has-relation relation="fCity" data-type="String" size="10"/>  
    <has-relation relation="fCityID" data-type="String" size="32"/>  
    <has-relation relation="fZone" data-type="String" size="10"/>  
    <has-relation relation="fZoneID" data-type="String" size="32"/>  
    <has-relation relation="fURL" data-type="String" size="100"/>  
      
    <has-relation relation="fAddr" data-type="String" size="200"></has-relation><has-relation relation="flongitude" data-type="Decimal" scale="6" size="20"/>  
    <has-relation relation="fLatitude" data-type="Decimal" scale="6" size="20"/>  
    <has-relation relation="fAttachment" data-type="Text"/>  
    <has-relation relation="fAbbr" data-type="String" size="100"/>  
    <has-relation relation="fEmployeeNum" data-type="Integer"/>  
    <has-relation relation="fCreator" data-type="String" size="10"><label language="zh_CN">创建人</label>
</has-relation>  
    <has-relation relation="fCreatorID" data-type="String" size="32"><label language="zh_CN">创建人ID</label>
</has-relation>  
    <has-relation relation="fCreatorTime" data-type="DateTime"><label language="zh_CN">创建时间</label>
</has-relation>  
    <has-relation relation="fLastModifyTime" data-type="DateTime"/> 
  
<has-relation relation="fLetter" data-type="String"></has-relation>

<has-relation relation="fVisitNum" data-type="Integer" default-value-expr="0"></has-relation>
<has-relation relation="fPhone2" data-type="String" size="20"></has-relation>
</concept>  

  <relation name="fPhone" data-type="String">
    <label language="zh_CN">电话</label> 
  </relation>  
  <relation name="fProvince" data-type="String">
    <label language="zh_CN">省</label> 
  </relation>  
  <relation name="fProvinceID" data-type="String">
    <label language="zh_CN">省ID</label> 
  </relation>  
  <relation name="fCity" data-type="String">
    <label language="zh_CN">市</label> 
  </relation>  
  <relation name="fCityID" data-type="String">
    <label language="zh_CN">市ID</label> 
  </relation>  
  <relation name="fZone" data-type="String">
    <label language="zh_CN">区</label> 
  </relation>  
  <relation name="fZoneID" data-type="String">
    <label language="zh_CN">区ID</label> 
  </relation>  
  <relation name="fURL" data-type="String">
    <label language="zh_CN">网址</label> 
  </relation>  
  <relation name="fAbbr" data-type="String">
    <label language="zh_CN">拼音缩写</label> 
  </relation>  
  <relation name="fEmployeeNum" data-type="Integer">
    <label language="zh_CN">员工数</label> 
  </relation>  

  <concept name="OA_CustomrMore" default-value-expr="guid()">
    <has-relation relation="version" default-value-expr="0">
      <label language="zh_CN">版本</label> 
    </has-relation>  
    <label language="zh_CN">客户信息扩展表</label>  
    <has-relation relation="fCustomerID" data-type="String" size="32"/>  
    <has-relation relation="fFieldName" data-type="String" size="20"><label language="zh_CN">扩展关系</label>
</has-relation>  
    <has-relation relation="fFieldValue" data-type="String" size="100"><label language="zh_CN">扩展关系值</label>
</has-relation> 
  </concept>  

  <relation name="fFieldName" data-type="String">
    <label language="zh_CN">扩展关系</label> 
  </relation>  
  <relation name="fFieldValue" data-type="String">
    <label language="zh_CN">扩展关系值</label> 
  </relation> 
<relation name="fAddr" data-type="String"><label language="zh_CN">地址</label>
</relation>
<relation name="fLetter" data-type="String"><label language="zh_CN">首字母</label>
</relation>

<relation name="fVisitNum" data-type="Integer"><label language="zh_CN">拜访次数</label>
</relation>
<relation name="fPhone2" data-type="String"><label language="zh_CN">电话2</label>
</relation>
</model>
