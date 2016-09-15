<?xml version="1.0" encoding="UTF-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window" component="$UI/system/components/justep/window/window" design="device:pc">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:93px;top:251px;"><div component="$UI/system/components/justep/data/data" autoLoad="true" xid="roleData" idColumn="fID"><column label="ID" name="fID" type="String" xid="xid1"></column>
  <column label="角色名称" name="fName" type="String" xid="xid2"></column>
  <column label="角色描述" name="fDescribe" type="String" xid="xid3"></column>
  <column label="角色分类" name="fType" type="String" xid="xid4"></column>
  <column label="关联资源" name="fRelevancy" type="String" xid="xid5"></column>
  <column label="操作" name="fHandle" type="String" xid="xid6"></column>
  <data xid="default1">[{&quot;fID&quot;:&quot;001&quot;,&quot;fName&quot;:&quot;系统管理员&quot;,&quot;fDescribe&quot;:&quot;可以管理所有权&quot;,&quot;fType&quot;:&quot;超级管理员&quot;,&quot;fRelevancy&quot;:&quot;已关联&quot;,&quot;fHandle&quot;:&quot;&quot;},{&quot;fID&quot;:&quot;002&quot;,&quot;fName&quot;:&quot;角色2&quot;,&quot;fDescribe&quot;:&quot;&quot;,&quot;fType&quot;:&quot;&quot;,&quot;fRelevancy&quot;:&quot;已关联&quot;},{&quot;fID&quot;:&quot;003&quot;,&quot;fName&quot;:&quot;角色3&quot;,&quot;fDescribe&quot;:&quot;&quot;,&quot;fType&quot;:&quot;&quot;,&quot;fRelevancy&quot;:&quot;已关联&quot;},{&quot;fID&quot;:&quot;004&quot;,&quot;fName&quot;:&quot;角色4&quot;,&quot;fRelevancy&quot;:&quot;已关联&quot;},{&quot;fID&quot;:&quot;005&quot;,&quot;fName&quot;:&quot;角色5&quot;,&quot;fRelevancy&quot;:&quot;已关联&quot;},{&quot;fID&quot;:&quot;006&quot;,&quot;fName&quot;:&quot;角色6&quot;,&quot;fRelevancy&quot;:&quot;已关联&quot;},{&quot;fID&quot;:&quot;007&quot;,&quot;fName&quot;:&quot;角色7&quot;,&quot;fRelevancy&quot;:&quot;已关联&quot;},{&quot;fID&quot;:&quot;008&quot;,&quot;fName&quot;:&quot;角色8&quot;,&quot;fRelevancy&quot;:&quot;已关联&quot;},{&quot;fID&quot;:&quot;009&quot;,&quot;fName&quot;:&quot;角色9&quot;,&quot;fRelevancy&quot;:&quot;已关联&quot;},{&quot;fID&quot;:&quot;010&quot;,&quot;fName&quot;:&quot;角色10&quot;,&quot;fRelevancy&quot;:&quot;已关联&quot;}]</data></div>
  <div component="$UI/system/components/justep/data/data" autoLoad="true" xid="userata" idColumn="fID"><column label="ID" name="fID" type="String" xid="xid7"></column>
  <column label="姓名" name="fName" type="String" xid="xid8"></column>
  <column label="性别" name="fSex" type="String" xid="xid9"></column>
  <column label="部门" name="fDept" type="String" xid="xid10"></column>
  <column label="学历" name="fEducation" type="String" xid="xid11"></column>
  <data xid="default2">[{&quot;fID&quot;:&quot;001&quot;,&quot;fName&quot;:&quot;员工1&quot;,&quot;fSex&quot;:&quot;男&quot;,&quot;fDept&quot;:&quot;部门1&quot;,&quot;fEducation&quot;:&quot;大专&quot;},{&quot;fID&quot;:&quot;002&quot;,&quot;fName&quot;:&quot;员工2&quot;,&quot;fSex&quot;:&quot;女&quot;,&quot;fDept&quot;:&quot;部门1&quot;,&quot;fEducation&quot;:&quot;大专&quot;},{&quot;fID&quot;:&quot;003&quot;,&quot;fName&quot;:&quot;员工3&quot;,&quot;fSex&quot;:&quot;男&quot;,&quot;fDept&quot;:&quot;部门1&quot;,&quot;fEducation&quot;:&quot;大专&quot;},{&quot;fID&quot;:&quot;004&quot;,&quot;fName&quot;:&quot;员工4&quot;,&quot;fSex&quot;:&quot;女&quot;,&quot;fDept&quot;:&quot;部门1&quot;,&quot;fEducation&quot;:&quot;本科&quot;},{&quot;fID&quot;:&quot;005&quot;,&quot;fName&quot;:&quot;员工5&quot;,&quot;fSex&quot;:&quot;男&quot;,&quot;fDept&quot;:&quot;部门1&quot;,&quot;fEducation&quot;:&quot;本科&quot;},{&quot;fID&quot;:&quot;006&quot;,&quot;fName&quot;:&quot;员工6&quot;,&quot;fSex&quot;:&quot;男&quot;,&quot;fDept&quot;:&quot;部门2&quot;,&quot;fEducation&quot;:&quot;本科&quot;},{&quot;fID&quot;:&quot;007&quot;,&quot;fName&quot;:&quot;员工7&quot;,&quot;fSex&quot;:&quot;男&quot;,&quot;fDept&quot;:&quot;部门2&quot;,&quot;fEducation&quot;:&quot;本科&quot;},{&quot;fID&quot;:&quot;008&quot;,&quot;fName&quot;:&quot;员工8&quot;,&quot;fSex&quot;:&quot;女&quot;,&quot;fDept&quot;:&quot;部门2&quot;,&quot;fEducation&quot;:&quot;本科&quot;}]</data></div>
  <div component="$UI/system/components/justep/data/data" autoLoad="true" xid="resourceData" idColumn="fID" onCustomRefresh="resourceDataCustomRefresh" isTree="true"><column label="ID" name="fID" type="String" xid="xid12"></column>
  <column label="资源树" name="fName" type="String" xid="xid13"></column>
  <column label="父" name="fParentID" type="String" xid="xid14"></column>
  <column label="类型" name="fType" type="String" xid="xid15"></column>
  <treeOption delayLoad="false" parentRelation="fParentID" xid="default18"></treeOption></div></div> 
<div xid="div21" style="background-color:#96D6F1;"><a component="$UI/system/components/justep/button/button" class="btn btn-link" label="JS" xid="jsBtn" onClick="showJsSource">
   <i xid="i8"></i>
   <span xid="span22">JS</span></a><a component="$UI/system/components/justep/button/button" class="btn btn-link" label="源码" xid="sourceBtn" bind-visible="isVisible" onClick="showSource">
   <i xid="i9"></i>
   <span xid="span23">源码</span></a></div><div component="$UI/system/components/justep/dataTables/dataTables" flexibleWidth="true" rowActiveClass="active" class="table table-hover table-striped" xid="dataTables" data="roleData" showRowNumber="true" onCellRender="dataTablesCellRender" onRowClick="dataTablesRowClick" ordering="false">
   <columns xid="columns1">
    <column name="fName" xid="column1"></column>
    <column name="fDescribe" xid="column2"></column>
    <column name="fType" xid="column3"></column>
    <column name="fRelevancy" xid="column4"></column>
    <column name="fHandle" xid="column5"></column></columns> </div>
  
  <div component="$UI/system/components/justep/pagerBar/pagerBar" class="x-pagerbar container-fluid" xid="pagerBar" data="roleData">
   <div class="row" xid="div4">
    <div class="col-sm-3" xid="div5">
     <div class="x-pagerbar-length" xid="div6">
      <label component="$UI/system/components/justep/pagerLimitSelect/pagerLimitSelect" class="x-pagerlimitselect" xid="pagerLimitSelect1">
       <span xid="span3">显示</span>
       <select component="$UI/system/components/justep/select/select" class="form-control input-sm" xid="select1">
        <option value="10" xid="default3">10</option>
        <option value="20" xid="default4">20</option>
        <option value="50" xid="default5">50</option>
        <option value="100" xid="default6">100</option></select> 
       <span xid="span4">条</span></label> </div> </div> 
    <div class="col-sm-3" xid="div7">
     <div class="x-pagerbar-info" xid="div8">当前显示0条，共0条</div></div> 
    <div class="col-sm-6" xid="div9">
     <div class="x-pagerbar-pagination" xid="div10">
      <ul class="pagination" component="$UI/system/components/bootstrap/pagination/pagination" xid="pagination1">
       <li class="prev" xid="li1">
        <a href="#" xid="a1">
         <span aria-hidden="true" xid="span5">«</span>
         <span class="sr-only" xid="span6">Previous</span></a> </li> 
       <li class="next" xid="li2">
        <a href="#" xid="a2">
         <span aria-hidden="true" xid="span7">»</span>
         <span class="sr-only" xid="span8">Next</span></a> </li> </ul> </div> </div> </div> </div>
  <div component="$UI/system/components/justep/popOver/popOver" class="x-popOver" xid="relevance_users">
   <div class="x-popOver-overlay" xid="div1"></div>
   <div class="x-popOver-content" xid="div2" style="width:80%;height:80%;">
    <div component="$UI/system/components/justep/controlGroup/controlGroup" class="x-control-group" title="关联用户" xid="controlGroup1" style="width:100%;">
     <div class="x-control-group-title" xid="controlGroupTitle1" style="height:45px;background-color:#8ED8EA;">
      <span xid="span1"><![CDATA[关联用户]]></span><a component="$UI/system/components/justep/button/button" class="btn btn-link btn-only-icon pull-right" label="button" xid="button2" icon="icon-android-close" onClick="closeUserClick">
   <i xid="i2" class="icon-android-close"></i>
   <span xid="span15"></span></a><a component="$UI/system/components/justep/button/button" class="btn btn-link" label="源码" xid="button1" bind-visible="isVisible" onClick="showReleUsersSource">
   <i xid="i5"></i>
   <span xid="span19">源码</span></a></div> 
     <label xid="label1" style="width:98px;"><![CDATA[快速检索用户]]></label><hr xid="hr1"></hr><div component="$UI/system/components/justep/row/row" class="x-row" xid="row1" style="height:51px;">
   <div class="x-col x-col-fixed x-col-center" xid="col1" style="width:auto;"><label xid="label3"><![CDATA[用户名：]]></label></div>
   <div class="x-col" xid="col2"><input component="$UI/system/components/justep/input/input" class="form-control" xid="input1"></input></div>
   <div class="x-col x-col-fixed x-col-center" xid="col3" style="width:auto;"><label xid="label4"><![CDATA[姓名：]]></label></div>
  <div class="x-col" xid="col4"><input component="$UI/system/components/justep/input/input" class="form-control" xid="input2"></input></div>
  <div class="x-col" xid="col5"><a component="$UI/system/components/justep/button/button" class="btn btn-default" label="查询" xid="button5">
   <i xid="i7"></i>
   <span xid="span21">查询</span></a></div></div><label xid="label2" style="width:90px;"><![CDATA[待绑定用户]]></label><hr xid="hr2"></hr><div component="$UI/system/components/justep/dataTables/dataTables" flexibleWidth="true" rowActiveClass="active" class="table table-hover table-striped" xid="dataTables1" data="userata" showRowNumber="true" multiSelect="true" ordering="true" style="width:100%;" scrollY="200px">
   <columns xid="columns2"><column name="fName" xid="column6"></column>
  <column name="fSex" xid="column7"></column>
  <column name="fDept" xid="column8"></column>
  <column name="fEducation" xid="column9"></column></columns></div><div component="$UI/system/components/justep/pagerBar/pagerBar" class="x-pagerbar container-fluid" xid="pagerBar2" data="userata">
   <div class="row" xid="div11">
    <div class="col-sm-3" xid="div12">
     <div class="x-pagerbar-length" xid="div13">
      <label component="$UI/system/components/justep/pagerLimitSelect/pagerLimitSelect" class="x-pagerlimitselect" xid="pagerLimitSelect2">
       <span xid="span9">显示</span>
       <select component="$UI/system/components/justep/select/select" class="form-control input-sm" xid="select2">
        <option value="10" xid="default14">10</option>
        <option value="20" xid="default15">20</option>
        <option value="50" xid="default16">50</option>
        <option value="100" xid="default17">100</option></select> 
       <span xid="span10">条</span></label> 
  </div> </div> 
    <div class="col-sm-3" xid="div14">
     <div class="x-pagerbar-info" xid="div15">当前显示0条，共0条
  </div></div> 
    <div class="col-sm-6" xid="div16">
     <div class="x-pagerbar-pagination" xid="div17">
      <ul class="pagination" component="$UI/system/components/bootstrap/pagination/pagination" xid="pagination2">
       <li class="prev" xid="li3">
        <a href="#" xid="a3">
         <span aria-hidden="true" xid="span11">«</span>
         <span class="sr-only" xid="span12">Previous</span></a> </li> 
       <li class="next" xid="li4">
        <a href="#" xid="a4">
         <span aria-hidden="true" xid="span13">»</span>
         <span class="sr-only" xid="span14">Next</span></a> </li> </ul> </div> </div> </div> </div><div xid="div3" style="width:86px;" class="div3 center-block">
      <a component="$UI/system/components/justep/button/button" class="btn btn-link" label="确认关联" xid="closeUser" style="background-color:#EBEBEB;" onClick="closeUserClick">
       <i xid="i1"></i>
       <span xid="span2">确认关联</span></a> </div> 
  
  
  
  </div> 
  </div> </div><div component="$UI/system/components/justep/popOver/popOver" class="x-popOver" xid="resource">
   <div class="x-popOver-overlay" xid="div18"></div>
   <div class="x-popOver-content" xid="div19" style="height:80%;width:80%;background-color:white;"><div component="$UI/system/components/justep/controlGroup/controlGroup" class="x-control-group" xid="controlGroup2" title="关联资源">
   <div class="x-control-group-title" xid="controlGroupTitle2" style="height:46px;">
    <span xid="span16"><![CDATA[关联资源]]></span><a component="$UI/system/components/justep/button/button" class="btn btn-link btn-only-icon pull-right" label="button" xid="closeResource" icon="icon-android-close" onClick="closeResourceClick">
   <i xid="i3" class="icon-android-close"></i>
   <span xid="span17"></span></a><a component="$UI/system/components/justep/button/button" class="btn btn-link" label="源码" xid="button3" bind-visible="isVisible" onClick="showResourceSource">
   <i xid="i6"></i>
   <span xid="span20">源码</span></a></div> 
  <div component="$UI/system/components/justep/grid/grid" hiddenCaptionbar="true" altRows="false" class="x-grid-no-bordered" xid="grid1" data="resourceData" appearance="treeGrid" cascade="true" height="370" multiselect="true" multiboxonly="false" checkedclass="checked">
   <columns xid="columns3"><column name="fName" xid="column16" align="left" width="150"></column>
  </columns></div><div xid="div20" style="width:86px;" class="div3 center-block">
   <a component="$UI/system/components/justep/button/button" class="btn btn-link" label="确认关联" xid="button4" style="background-color:#EBEBEB;" onClick="closeResourceClick">
    <i xid="i4"></i>
    <span xid="span18">确认关联</span></a> </div></div>
  
  
  </div></div>
  
  </div>