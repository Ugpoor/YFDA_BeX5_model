<?xml version="1.0" encoding="UTF-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window" component="$UI/system/components/justep/window/window" design="device:pc">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:31px;top:150px;"><div component="$UI/system/components/justep/data/data" autoLoad="true" xid="menuData" idColumn="fID" isTree="true" onCustomRefresh="menuDataCustomRefresh" limit="3">
   <column label="ID" name="fID" type="String" xid="xid12"></column>
  <column label="组织机构" name="fName" type="String" xid="xid13"></column>
  <column label="父" name="fParentID" type="String" xid="xid14"></column>
  <column label="类型" name="fType" type="String" xid="xid15"></column>
  <treeOption delayLoad="false" parentRelation="fParentID" xid="default18"></treeOption></div>
  <div component="$UI/system/components/justep/data/data" autoLoad="true" xid="userData" idColumn="fID">
   <column label="ID" name="fID" type="String" xid="xid7"></column>
   <column label="姓名" name="fName" type="String" xid="xid8"></column>
   <column label="性别" name="fSex" type="String" xid="xid9"></column>
   <column label="部门" name="fDept" type="String" xid="xid10"></column>
   <column label="学历" name="fEducation" type="String" xid="xid11"></column>
   <data xid="default2">[{&quot;fID&quot;:&quot;001&quot;,&quot;fName&quot;:&quot;员工1&quot;,&quot;fSex&quot;:&quot;男&quot;,&quot;fDept&quot;:&quot;部门1&quot;,&quot;fEducation&quot;:&quot;大专&quot;},{&quot;fID&quot;:&quot;002&quot;,&quot;fName&quot;:&quot;员工2&quot;,&quot;fSex&quot;:&quot;女&quot;,&quot;fDept&quot;:&quot;部门1&quot;,&quot;fEducation&quot;:&quot;大专&quot;},{&quot;fID&quot;:&quot;003&quot;,&quot;fName&quot;:&quot;员工3&quot;,&quot;fSex&quot;:&quot;男&quot;,&quot;fDept&quot;:&quot;部门1&quot;,&quot;fEducation&quot;:&quot;大专&quot;},{&quot;fID&quot;:&quot;004&quot;,&quot;fName&quot;:&quot;员工4&quot;,&quot;fSex&quot;:&quot;女&quot;,&quot;fDept&quot;:&quot;部门1&quot;,&quot;fEducation&quot;:&quot;本科&quot;},{&quot;fID&quot;:&quot;005&quot;,&quot;fName&quot;:&quot;员工5&quot;,&quot;fSex&quot;:&quot;男&quot;,&quot;fDept&quot;:&quot;部门1&quot;,&quot;fEducation&quot;:&quot;本科&quot;},{&quot;fID&quot;:&quot;006&quot;,&quot;fName&quot;:&quot;员工6&quot;,&quot;fSex&quot;:&quot;男&quot;,&quot;fDept&quot;:&quot;部门2&quot;,&quot;fEducation&quot;:&quot;本科&quot;},{&quot;fID&quot;:&quot;007&quot;,&quot;fName&quot;:&quot;员工7&quot;,&quot;fSex&quot;:&quot;男&quot;,&quot;fDept&quot;:&quot;部门2&quot;,&quot;fEducation&quot;:&quot;本科&quot;},{&quot;fID&quot;:&quot;008&quot;,&quot;fName&quot;:&quot;员工8&quot;,&quot;fSex&quot;:&quot;女&quot;,&quot;fDept&quot;:&quot;部门2&quot;,&quot;fEducation&quot;:&quot;本科&quot;}]</data></div></div> 
<h4 xid="h41"><![CDATA[用户管理]]>
  <a component="$UI/system/components/justep/button/button" class="btn btn-link" label="JS" xid="jsBtn" onClick="jsBtnClick">
   <i xid="i3"></i>
   <span xid="span1">JS</span></a>
  <a component="$UI/system/components/justep/button/button" class="btn btn-link" label="源码" xid="sourceBtn" onClick="sourceBtnClick">
   <i xid="i4"></i>
   <span xid="span10">源码</span></a></h4><div component="$UI/system/components/justep/row/row" class="x-row" xid="row2" style="height:100%;">
   <div class="x-col x-col-fixed" xid="col5" style="width:180px;height:100%;"><div component="$UI/system/components/justep/grid/grid" hiddenCaptionbar="true" altRows="true" class="x-grid-no-bordered" xid="menu" data="menuData" appearance="treeGrid" height="100%" width="100%">
   <columns xid="columns1"><column name="fName" xid="column1" sortable="false"></column></columns></div></div>
   <div class="x-col" xid="col7" style="height:100%;"><div component="$UI/system/components/justep/controlGroup/controlGroup" class="x-control-group" title="查询" xid="controlGroup1">
   <div class="x-control-group-title" xid="controlGroupTitle1" style="background-color:#DFF4F7;height:50px;">
    </div> 
  <div component="$UI/system/components/justep/row/row" class="x-row" xid="row1">
   <div class="x-col x-col-fixed x-col-center" xid="col1" style="width:auto;"><label xid="label2"><![CDATA[名称：]]></label></div>
   <div class="x-col x-col-fixed x-col-center" xid="col2" style="width:auto;"><input component="$UI/system/components/justep/input/input" class="form-control" xid="input2" style="width:100px;"></input></div>
   <div class="x-col x-col-fixed x-col-center" xid="col3" style="width:auto;"><a component="$UI/system/components/justep/button/button" class="btn btn-link" label="查询" xid="selectBtn" icon="icon-android-search" style="background-color:#E6E6E6;">
   <i xid="i1" class="icon-android-search"></i>
   <span xid="span8">查询</span></a></div>
  <div class="x-col x-col-fixed x-col-center" xid="col4" style="width:auto;"><a component="$UI/system/components/justep/button/button" class="btn btn-link" label="重置" xid="resetBtn" icon="icon-laptop" style="background-color:#E6E6E6;">
   <i xid="i2" class="icon-laptop"></i>
   <span xid="span9">重置</span></a></div></div><div component="$UI/system/components/justep/dataTables/dataTables" flexibleWidth="true" rowActiveClass="active" class="table table-hover table-striped" xid="dataTables1" data="userData">
   <columns xid="columns2"><column name="fName" xid="column2"></column>
  <column name="fSex" xid="column3"></column>
  <column name="fDept" xid="column4"></column>
  <column name="fEducation" xid="column5"></column></columns></div><div component="$UI/system/components/justep/pagerBar/pagerBar" class="x-pagerbar container-fluid" xid="pagerBar1" data="userData">
   <div class="row" xid="div1">
    <div class="col-sm-3" xid="div2">
     <div class="x-pagerbar-length" xid="div3">
      <label component="$UI/system/components/justep/pagerLimitSelect/pagerLimitSelect" class="x-pagerlimitselect" xid="pagerLimitSelect1">
       <span xid="span2">显示</span>
       <select component="$UI/system/components/justep/select/select" class="form-control input-sm" xid="select1">
        <option value="10" xid="default1">10</option>
        <option value="20" xid="default3">20</option>
        <option value="50" xid="default4">50</option>
        <option value="100" xid="default5">100</option></select> 
       <span xid="span3">条</span></label> </div> </div> 
    <div class="col-sm-3" xid="div4">
     <div class="x-pagerbar-info" xid="div5">当前显示0条，共0条</div></div> 
    <div class="col-sm-6" xid="div6">
     <div class="x-pagerbar-pagination" xid="div7">
      <ul class="pagination" component="$UI/system/components/bootstrap/pagination/pagination" xid="pagination1">
       <li class="prev" xid="li1">
        <a href="#" xid="a1">
         <span aria-hidden="true" xid="span4">«</span>
         <span class="sr-only" xid="span5">Previous</span></a> </li> 
       <li class="next" xid="li2">
        <a href="#" xid="a2">
         <span aria-hidden="true" xid="span6">»</span>
         <span class="sr-only" xid="span7">Next</span></a> </li> </ul> </div> </div> </div> </div></div>
  </div></div>
  </div>