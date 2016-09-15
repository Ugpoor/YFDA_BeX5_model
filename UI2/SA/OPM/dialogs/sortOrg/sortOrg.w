<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window" component="$UI/system/components/justep/window/window">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="left:200px;top:183px;"> 
    <div component="$UI/system/components/justep/data/bizData" xid="orgData"
      concept="SA_OPOrg" limit="-1" columns="SA_OPOrg,sName,sCode,sOrgKindID,version" confirmDelete="false" confirmRefresh="false"> 
      <reader xid="default1" action="/SA/OPM/logic/action/queryOPOrgAction"/> 
    <filter name="filter0" xid="filter1"><![CDATA[SA_OPOrg.sValidState = 1]]></filter></div> 
  </div>  
  <span component="$UI/system/components/justep/windowReceiver/windowReceiver"
    xid="windowReceiver" style="left:345px;top:346px;" onReceive="windowReceiverReceive"/>  
  <div component="$UI/system/components/justep/panel/panel" class="x-panel x-full"
    xid="panel1"> 
    <div class="x-panel-content container-fluid" xid="content1"> 
      <div component="$UI/system/components/bootstrap/row/row" class="row" xid="row1" style="height:100%;">
   <div class="col col-xs-10" xid="col1" style="height:100%;"><div component="$UI/system/components/justep/grid/grid" xid="orgGrid" width="100%" height="100%" data="orgData" hiddenCaptionbar="true" showRowNumber="true" onCellRender="orgGridCellRender">
   <columns xid="columns1">
    <column width="40" name="sOrgKindID" xid="column3" label="类型" sortable="false" align="center"></column>
    <column name="sName" xid="column1" sortable="false"></column>
    <column name="sCode" xid="column2" sortable="false"></column></columns> </div></div>
   <div class="col col-xs-2" xid="col2" style="height:100%;"><table component="$UI/system/components/bootstrap/table/table" xid="table2" style="height:100%;margin: 0; padding: 0;width:100%;">
   <tbody class="x-list-template" xid="tbody2">
    <tr xid="tr6">
     <td xid="td8" style="width: 100%;"></td></tr> 
    <tr xid="tr7">
     <td xid="td9" style="height:140px; ">
      <a component="$UI/system/components/justep/button/button" class="btn btn-link" label="▲ 置顶" xid="moveTopBtn" style="margin-top: 5px; height:35px;" onClick="moveTopBtnClick">
       <i xid="i3"></i>
       <span xid="span3">▲ 置顶</span></a> 
      <a component="$UI/system/components/justep/button/button" class="btn btn-link" xid="moveUpBtn" label="∧ 上移" style="margin-top: 5px;height:35px;" onClick="moveUpBtnClick">
       <i xid="i4"></i>
       <span xid="span4">∧ 上移</span></a> 
      <a component="$UI/system/components/justep/button/button" class="btn btn-link" label="∨ 下移" xid="moveDownBtn" style="margin-top: 5px;height:35px;" onClick="moveDownBtnClick">
       <i xid="i5"></i>
       <span xid="span5">∨ 下移</span></a> 
      <a component="$UI/system/components/justep/button/button" class="btn btn-link" label="▼ 置底" xid="moveBottomBtn" style="margin-top: 5px;height:35px;" onClick="moveBottomBtnClick">
       <i xid="i6"></i>
       <span xid="span6">▼ 置底</span></a> </td> </tr> 
    <tr xid="tr8">
     <td xid="td10"></td></tr> </tbody> </table></div>
   </div></div>  
    <div class="x-panel-bottom" xid="bottom1"> 
      <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-only-label x-dialog-button" label="取消" xid="cancelBtn" onClick='{"operation":"windowReceiver.windowCancel"}'>
   <i xid="i1"></i>
   <span xid="span1">取消</span></a>
  <a component="$UI/system/components/justep/button/button" class="btn btn-primary btn-only-label x-dialog-button" label="确定" xid="okBtn" onClick="okBtnClick">
   <i xid="i2"></i>
   <span xid="span2">确定</span></a></div> 
  </div> 
</div>
