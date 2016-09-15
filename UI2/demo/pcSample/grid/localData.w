<?xml version="1.0" encoding="UTF-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window" component="$UI/system/components/justep/window/window" design="device:pc">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:402px;top:532px;"><div component="$UI/system/components/justep/data/data" autoLoad="true" xid="employeeData" idColumn="id" onCustomRefresh="employeeDataCustomRefresh"><column label="ID" name="id" type="String" xid="xid1"></column>
  <column label="姓名" name="name" type="String" xid="xid2"></column>
  <column label="性别" name="sex" type="String" xid="xid3"></column>
  <column label="部门" name="dept" type="String" xid="xid4"></column>
  <column label="学历" name="enducation" type="String" xid="xid5"></column></div></div> 

  <div component="$UI/system/components/justep/grid/grid" hiddenCaptionbar="true" altRows="true" class="x-grid-no-bordered" xid="employGrid" data="employeeData" style="border-color:#FF9900;" showRowNumber="true" multiselect="true" width="100%" height="300">
   <columns xid="columns1"><column name="name" multiRowEditor="false" disableEditorDisplay="false" editable="false" editor="component" xid="column11">
   <editor xid="editor7">
    <input component="$UI/system/components/justep/input/input" bind-ref="ref('name')" class="form-control x-edit-focusin" xid="input6" disabled="true"></input></editor> </column>
  <column name="sex" multiRowEditor="false" disableEditorDisplay="false" editable="false" editor="component" xid="column12">
   <editor xid="editor8">
    <input component="$UI/system/components/justep/input/input" bind-ref="ref('sex')" class="form-control x-edit-focusin" xid="input7" disabled="true"></input></editor> </column>
  <column name="dept" multiRowEditor="false" disableEditorDisplay="false" editable="false" editor="component" xid="column13">
   <editor xid="editor9">
    <input component="$UI/system/components/justep/input/input" bind-ref="ref('dept')" class="form-control x-edit-focusin" xid="input8" disabled="true"></input></editor> </column>
  <column name="enducation" multiRowEditor="false" disableEditorDisplay="false" editable="false" editor="component" xid="column14">
   <editor xid="editor10">
    <input component="$UI/system/components/justep/input/input" bind-ref="ref('enducation')" class="form-control x-edit-focusin" xid="input9" disabled="true"></input></editor> </column></columns></div>
  
  <div component="$UI/system/components/justep/row/row" class="x-row" xid="row1">
   
  <div class="x-col" xid="col4"></div>
  <div class="x-col" xid="col3"><a component="$UI/system/components/justep/button/button" class="btn btn-link center-block" label="返回" xid="back" onClick="backClick">
   <i xid="i1"></i>
   <span xid="span1">返回</span></a></div><div class="x-col" xid="col5"></div></div></div>