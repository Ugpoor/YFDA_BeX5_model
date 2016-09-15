<?xml version="1.0" encoding="UTF-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window" component="$UI/system/components/justep/window/window" design="device:pc">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:468px;top:138px;"><div component="$UI/system/components/justep/data/bizData" xid="permissionData" concept="SA_OPPermission" onRefreshCreateParam="permissionDataRefreshCreateParam"><reader xid="default1" action="/SA/OPM/logic/action/queryDistinctOPAuthorizePermissionByOrgAction"></reader></div></div> 
<span component="$UI/system/components/justep/windowReceiver/windowReceiver" xid="windowReceiver" style="left:313px;top:265px;" onReceive="windowReceiverReceive"></span><div component="$UI/system/components/justep/panel/panel" class="x-panel x-full" xid="panel1">
   <div class="x-panel-top" xid="top1"><div component="$UI/system/components/justep/toolBar/toolBar" class="x-toolbar form-inline x-toolbar-spliter" xid="toolBar1"><div component="$UI/system/components/justep/smartFilter/smartFilter" xid="smartFilter" filterData="permissionData" filterCols="sActivityFName" class="x-control">
   <input type="text" class="form-control" placeholder="搜索" data-bind="valueUpdate: ['input', 'afterkeydown']" bind-value="$model.comp($element.parentElement).searchText" bind-change="$model.comp($element.parentElement).onInputChange.bind($model.comp($element.parentElement))" xid="input2"></input></div></div></div>
   <div class="x-panel-content" xid="content1"><div component="$UI/system/components/justep/dataTables/dataTables" flexibleWidth="true" rowActiveClass="active" class="table table-hover" xid="permissionDataTables" data="permissionData" multiSelect="true">
   <columns xid="columns2">
    <column name="sActivityFName" xid="column1" label="功能权限"></column></columns> </div>
  <div component="$UI/system/components/justep/pagerBar/pagerBar" class="x-pagerbar container-fluid" xid="pagerBar1" data="permissionData">
   <div class="row" xid="div8">
    <div class="col-sm-3" xid="div9">
     <div class="x-pagerbar-length" xid="div10">
      <label component="$UI/system/components/justep/pagerLimitSelect/pagerLimitSelect" class="x-pagerlimitselect" xid="pagerLimitSelect2">
       <span xid="span9">显示</span>
       <select component="$UI/system/components/justep/select/select" class="form-control input-sm" xid="select2">
        <option value="10" xid="default6">10</option>
        <option value="20" xid="default7">20</option>
        <option value="50" xid="default8">50</option>
        <option value="100" xid="default9">100</option></select> 
       <span xid="span10">条</span></label> </div> </div> 
    <div class="col-sm-3" xid="div11">
     <div class="x-pagerbar-info" xid="div12">当前显示0条，共0条</div></div> 
    <div class="col-sm-6" xid="div13">
     <div class="x-pagerbar-pagination" xid="div14">
      <ul class="pagination" component="$UI/system/components/bootstrap/pagination/pagination" xid="pagination2">
       <li class="prev" xid="li3">
        <a href="#" xid="a3">
         <span aria-hidden="true" xid="span11">«</span>
         <span class="sr-only" xid="span12">Previous</span></a> </li> 
       <li class="next" xid="li4">
        <a href="#" xid="a4">
         <span aria-hidden="true" xid="span13">»</span>
         <span class="sr-only" xid="span14">Next</span></a> </li> </ul> </div> </div> </div> </div></div>
   <div class="x-panel-bottom" xid="bottom1"><a component="$UI/system/components/justep/button/button" class="btn btn-link btn-only-label x-dialog-button" label="取消" xid="cancelBtn" onClick='{"operation":"windowReceiver.windowCancel"}'>
   <i xid="i1"></i>
   <span xid="span1">取消</span></a>
  <a component="$UI/system/components/justep/button/button" class="btn btn-primary btn-only-label x-dialog-button" label="确定" xid="okBtn" onClick="okBtnClick">
   <i xid="i2"></i>
   <span xid="span2">确定</span></a>
  </div></div></div>