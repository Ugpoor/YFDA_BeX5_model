<?xml version="1.0" encoding="UTF-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window" component="$UI/system/components/justep/window/window" design="device:pc">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:194px;top:496px;"><div component="$UI/system/components/justep/data/baasData" autoLoad="true" xid="userData" saveAction="saveTakeout_user" queryAction="queryTakeout_user" tableName="takeout_user" url="/takeoutAdmin/user" idColumn="fID" limit="10">
   <column label="编号" name="fID" type="String" xid="default30"></column>
   <column label="姓名" name="fName" type="String" xid="default31"></column>
   <column label="电话" name="fPhoneNumber" type="String" xid="default32"></column>
   <column label="地址" name="fAddress" type="String" xid="default33"></column></div></div> 
<div component="$UI/system/components/justep/toolBar/toolBar" class="x-toolbar form-inline x-toolbar-spliter" xid="toolBar3">
   <a component="$UI/system/components/justep/button/button" class="btn btn-link" label="新增" xid="add" icon="icon-android-add" onClick="addClick">
    <i xid="i9" class="icon-android-add"></i>
    <span xid="span32">新增</span></a> 
   <a component="$UI/system/components/justep/button/button" class="btn btn-link" label="编辑" xid="edit" icon="icon-edit" onClick="editClick">
    <i xid="i10" class="icon-edit"></i>
    <span xid="span33">编辑</span></a> 
   <a component="$UI/system/components/justep/button/button" class="btn btn-link" label="删除" xid="delete" icon="icon-android-remove" onClick="deleteClick">
    <i xid="i12" class="icon-android-remove"></i>
    <span xid="span40">删除</span></a> 
  <div class="input-group pull-right" component="$UI/system/components/bootstrap/inputGroup/inputGroup" xid="inputGroup4">
   <input type="text" class="form-control" component="$UI/system/components/justep/input/input" xid="selectCondition" placeHolder="请输入"></input>
   <div class="input-group-btn" xid="layoutWizard2">
    <a component="$UI/system/components/justep/button/button" class="btn btn-default btn-only-icon" label="button" xid="select" icon="icon-android-search" onClick="selectClick">
     <i xid="i6" class="icon-android-search"></i>
     <span xid="span25"></span></a> </div> </div></div>
  <div component="$UI/system/components/justep/dataTables/dataTables" flexibleWidth="true" responsive="true" rowActiveClass="active" class="table table-hover table-striped" xid="userDataTables" data="userData" onRowDblClick="userDataTablesRowDblClick">
   <columns xid="columns2">
    <column name="fID" xid="column3"></column>
    <column name="fName" xid="column5"></column>
    <column name="fPhoneNumber" xid="column12"></column>
    <column name="fAddress" xid="column13"></column></columns> </div>
  <div component="$UI/system/components/justep/pagerBar/pagerBar" class="x-pagerbar container-fluid" xid="pagerBar3">
   <div class="row" xid="div19">
    <div class="col-sm-3" xid="div20">
     <div class="x-pagerbar-length" xid="div21">
      <label component="$UI/system/components/justep/pagerLimitSelect/pagerLimitSelect" class="x-pagerlimitselect" xid="pagerLimitSelect3" defaultValue="10">
       <span xid="span34">显示</span>
       <select component="$UI/system/components/justep/select/select" class="form-control input-sm" xid="select5">
        <option value="10" xid="default26">10</option>
        <option value="20" xid="default27">20</option>
        <option value="50" xid="default28">50</option>
        <option value="100" xid="default29">100</option></select> 
       <span xid="span35">条</span></label> </div> </div> 
    <div class="col-sm-3" xid="div22">
     <div class="x-pagerbar-info" xid="div23">当前显示0条，共0条</div></div> 
    <div class="col-sm-6" xid="div24">
     <div class="x-pagerbar-pagination" xid="div25">
      <ul class="pagination" component="$UI/system/components/bootstrap/pagination/pagination" xid="pagination3">
       <li class="prev" xid="li2">
        <a href="#" xid="a5">
         <span aria-hidden="true" xid="span36">«</span>
         <span class="sr-only" xid="span37">Previous</span></a> </li> 
       <li class="next" xid="li10">
        <a href="#" xid="a6">
         <span aria-hidden="true" xid="span38">»</span>
         <span class="sr-only" xid="span39">Next</span></a> </li> </ul> </div> </div> </div> </div>
  <span component="$UI/system/components/justep/windowDialog/windowDialog" xid="userWindowDialog" src="addUser.w" width="45%" height="50%" showTitle="true" status="normal" title="新增会员" onReceived="userWindowDialogReceived">
   <result concept="userData" operation="edit" origin="userData" xid="default34">
    <mapping from="fID" to="fID" locator="true" xid="default35"></mapping>
    <mapping from="fName" to="fName" xid="default36"></mapping>
    <mapping from="fPhoneNumber" to="fPhoneNumber" xid="default37"></mapping>
    <mapping from="fAddress" to="fAddress" xid="default38"></mapping></result> </span></div>