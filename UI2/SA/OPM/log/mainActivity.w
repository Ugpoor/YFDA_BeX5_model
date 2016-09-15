<?xml version="1.0" encoding="UTF-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window" component="$UI/system/components/justep/window/window" design="device:pc">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:362px;top:185px;"><div component="$UI/system/components/justep/data/bizData" autoLoad="true" xid="dlogData" concept="SA_Log" confirmRefresh="false" confirmDelete="false"><reader xid="default1" action="/system/logic/action/queryLogAction"></reader>
  <writer xid="default2" action="/system/logic/action/saveLogAction"></writer>
  <creator xid="default3" action="/system/logic/action/createLogAction"></creator>
  <filter name="filter1" xid="filter2"><![CDATA[SA_Log.sTypeName = '组织权限变更日志']]></filter></div></div> 
<div component="$UI/system/components/justep/panel/panel" class="x-panel x-full" xid="panel1">
   <div class="x-panel-top" xid="top1"><div component="$UI/system/components/justep/row/row" class="x-row" xid="row1" style="height:100%;">
   <div class="x-col x-col-fixed x-col-center" xid="col6" style="width:auto;"><a component="$UI/system/components/justep/button/button" class="btn btn-link" label="查询" xid="button1" style="color:#FFFFFF;font-weight:900;background-color:#B4F8B7;" onClick="{operation:'bizFilter1.menu'}">
   <i xid="i3"></i>
   <span xid="span9">查询</span></a></div><div class="x-col x-col-fixed x-col-center" xid="col1" style="width:auto;"><label xid="label1"><![CDATA[时间]]></label></div>
   <div class="x-col x-col-fixed x-col-center" xid="col2" style="width:auto;"><div class="x-control" component="$UI/system/components/justep/dateFilter/dateFilter" xid="dateFilter1" filterData="dlogData" dateCol="sCreateTime" defaultValue="all" style="width:120px;">
   <div class="x-gridSelect" component="$UI/system/components/justep/gridSelect/gridSelect" xid="gridSelect1">
    <option xid="option1"></option></div> </div></div>
   <div class="x-col x-col-fixed x-col-center" xid="col7" style="width:auto;"><label xid="label2"><![CDATA[模糊查询]]></label></div><div class="x-col x-col-fixed x-col-center" xid="col4" style="width:auto;"><div class="input-group" component="$UI/system/components/justep/smartFilter/smartFilter" xid="smartFilter1" filterData="dlogData" filterCols="sTypeName,sCreatorPersonName,sActivityName,sActionName,sIP" style="width:222px;">
   <span class="input-group-addon x-smartFilter-refresh" bind-click="$model.comp($element.parentElement).refresh.bind($model.comp($element.parentElement))" xid="span7">
    <i class="icon-android-search" xid="i1"></i></span> 
   <input type="text" class="form-control" placeholder="搜索" data-bind="valueUpdate: ['input', 'afterkeydown']" bind-value="$model.comp($element.parentElement).searchText" bind-change="$model.comp($element.parentElement).onInputChange.bind($model.comp($element.parentElement))" xid="input1"></input>
   <span class="input-group-addon x-smartFilter-clear" bind-click="$model.comp($element.parentElement).clear.bind($model.comp($element.parentElement))" bind-visible="$model.comp($element.parentElement).searchText.get() != ''" xid="span8">
    <i class="icon-close-circled" xid="i2"></i></span> </div></div>
  
  <div class="x-col x-col-fixed x-col-center" xid="col5" style="width:auto;"><a component="$UI/system/components/justep/button/button" class="btn btn-link" label="刷新" xid="refreshbtn" icon="icon-loop" style="background-color:#C0F1B8;" onClick="{operation:'dlogData.refresh'}">
   <i xid="i4" class="icon-loop"></i>
   <span xid="span10">刷新</span></a></div>
  </div></div>
   <div class="x-panel-content" xid="content1"><div component="$UI/system/components/justep/grid/grid" hiddenCaptionbar="true" altRows="true" class="x-grid-no-bordered" xid="grid1" data="dlogData" serverSort="false" showRowNumber="true" height="100%" width="100%">
   <columns xid="columns2"><column name="sDescription" xid="column7" sortable="false"></column>
  <column name="sCreateTime" xid="column8" sortable="false"></column>
  <column name="sCreatorPersonName" xid="column9" sortable="false"></column>
  <column name="sActivityName" xid="column10" sortable="false"></column>
  <column name="sActionName" xid="column11" sortable="false"></column>
  <column name="sIP" xid="column12" sortable="false"></column></columns></div></div>
   <div class="x-panel-bottom" xid="bottom1" height="165"><div component="$UI/system/components/justep/pagerBar/pagerBar" class="x-pagerbar container-fluid" xid="pagerBar1" data="dlogData" style="height:30px;">
   <div class="row" xid="div1">
    <div class="col-sm-3" xid="div2">
     <div class="x-pagerbar-length" xid="div3">
      <label component="$UI/system/components/justep/pagerLimitSelect/pagerLimitSelect" class="x-pagerlimitselect" xid="pagerLimitSelect1">
       <span xid="span1">显示</span>
       <select component="$UI/system/components/justep/select/select" class="form-control input-sm" xid="select1">
        <option value="10" xid="default4">10</option>
        <option value="20" xid="default5">20</option>
        <option value="50" xid="default6">50</option>
        <option value="100" xid="default7">100</option></select> 
       <span xid="span2">条</span></label> </div> </div> 
    <div class="col-sm-3" xid="div4">
     <div class="x-pagerbar-info" xid="div5">当前显示0条，共0条</div></div> 
    <div class="col-sm-6" xid="div6">
     <div class="x-pagerbar-pagination" xid="div7">
      <ul class="pagination" component="$UI/system/components/bootstrap/pagination/pagination" xid="pagination1">
       <li class="prev" xid="li1">
        <a href="#" xid="a1">
         <span aria-hidden="true" xid="span3">«</span>
         <span class="sr-only" xid="span4">Previous</span></a> </li> 
       <li class="next" xid="li2">
        <a href="#" xid="a2">
         <span aria-hidden="true" xid="span5">»</span>
         <span class="sr-only" xid="span6">Next</span></a> </li> </ul> </div> </div> </div> </div><textarea component="$UI/system/components/justep/textarea/textarea" class="form-control" xid="textarea1" style="width:100%;height:135px;" bind-ref="dlogData.ref('sETField32')"></textarea></div></div>
  <span component="$UI/system/components/justep/bizFilter/bizFilter" xid="bizFilter1" style="left:130px;top:227px;" filterData="dlogData" filterCols="sTypeName,sCreatorPersonName,sActivityName,sActionName,sIP"></span></div>