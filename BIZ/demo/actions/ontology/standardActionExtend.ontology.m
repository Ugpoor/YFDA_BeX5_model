<?xml version="1.0" encoding="utf-8"?>

<model xmlns="http://www.justep.com/model">  
  <concept name="DEMO_Project" default-value-expr="guid()">
    <has-relation relation="version" default-value-expr="0">
      <label language="zh_CN">版本</label> 
    </has-relation>  
    <label language="zh_CN">项目</label>  
    <has-relation relation="fProjectCode" data-type="String"/>  
    <has-relation relation="fProjectName" data-type="String"/>  
     
  </concept>  
  <relation name="fProjectCode" data-type="String" size="32">
    <label language="zh_CN">项目编码</label> 
  </relation>  
  <relation name="fProjectName" data-type="String" size="64">
    <label language="zh_CN">项目名称</label> 
  </relation>  
    
    
  <relation name="fStatus" data-type="String" size="32">
    <label language="zh_CN">状态</label> 
  </relation>  
  <concept name="DEMO_ProjectPlan" default-value-expr="guid()">
    <has-relation relation="version" default-value-expr="0">
      <label language="zh_CN">版本</label> 
    </has-relation>  
    <label language="zh_CN">项目计划</label>  
    <has-relation relation="fProjectID" data-type="String"/>  
    <has-relation relation="fPlanName" data-type="String"/>  
    <has-relation relation="fDescription" data-type="Text"/>  
    <has-relation relation="fCreator" data-type="String" default-value-expr="currentPersonID()"/>  
    <has-relation relation="fExecutor" data-type="String"/> 
  <has-relation relation="fStartDate" data-type="Date"></has-relation><has-relation relation="fEndDate" data-type="Date"></has-relation><has-relation relation="fStatus"></has-relation>


</concept>  
  <relation name="fProjectID" data-type="String" size="32">
    <label language="zh_CN">项目ID</label> 
  </relation>  
  <relation name="fPlanName" data-type="String" size="64">
    <label language="zh_CN">计划名称</label> 
  </relation>  
  <relation name="fDescription" data-type="Text">
    <label language="zh_CN">计划详细</label> 
  </relation>  
  <relation name="fCreator" data-type="String" size="32">
    <label language="zh_CN">计划制定人</label> 
  </relation>  
  <relation name="fExecutor" data-type="String" size="32">
    <label language="zh_CN">计划执行人</label> 
  </relation> 
<relation name="fStartDate" data-type="Date"><label language="zh_CN">开始日期</label>
</relation>
<relation name="fEndDate" data-type="Date"><label language="zh_CN">结束日期</label>
</relation>

<concept name="DEMO_BookView" keys="fBookID"><has-relation relation="fBookID" required="true" default-value-expr="nextSeq('BookID')"></has-relation>
<has-relation relation="fBookName" size="256" required="true"></has-relation>
<has-relation relation="fPrice"></has-relation>
<has-relation relation="fISBN" size="64"></has-relation>
<has-relation relation="fAmount"></has-relation>
<label language="zh_CN">图书视图</label>
</concept>
<relation name="fAmount" data-type="Integer"><label language="zh_CN">数量</label>
</relation>
<relation name="fPrice" data-type="Decimal"><label language="zh_CN">价格</label>
</relation>
<relation name="fBookID" data-type="Integer"><label language="zh_CN">图书ID</label>
</relation>
<relation name="fBookName" data-type="String"><label language="zh_CN">图书名称</label>
</relation>
<relation name="fISBN" data-type="String"><label language="zh_CN">书号</label>
</relation>

<concept name="DEMO_BookXML" keys="fBookID">
<label language="zh_CN">图书XML</label>
<has-relation relation="fBookID" default-value-expr="nextSeq('XMLBookID')"></has-relation>
<has-relation relation="fBookName"></has-relation>
<has-relation relation="fISBN"></has-relation>

<has-relation relation="fPrice"></has-relation>
</concept>
</model>
