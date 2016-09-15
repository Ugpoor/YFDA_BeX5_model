<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window" component="$UI/system/components/justep/window/window"
  design="device:pc">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="top:140px;left:197px;height:auto;"
    onLoad="modelLoad">
    <div component="$UI/system/components/justep/data/data" autoLoad="true"
      xid="mainData" idColumn="xid">
      <column label="名称" name="name" type="String" xid="xid1"></column>
  <column label=".w Url" name="url" type="String" xid="xid2"></column>
  <column label="标题" name="title" type="String" xid="xid3"></column>
  <column label="xid" name="xid" type="String" xid="xid4"></column>
  <rule xid="rule1">
   <col name="name" xid="ruleCol1">
    <required xid="required1">
     <expr xid="default1">true</expr>
     <message xid="default2">映射名称是必须的</message></required> </col> 
   <col name="url" xid="ruleCol2">
    <required xid="required2">
     <expr xid="default3">true</expr>
     <message xid="default4">.W Url是必须的</message></required> </col> </rule></div>  
    </div>  
  <div component="$UI/system/components/justep/toolBar/toolBar" class="x-toolbar form-inline x-toolbar-spliter"
    xid="toolBar1">
    <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
      onClick="{'operation':'mainData.new'}" xid="button1"> 
      <i xid="i1"/>  
      <span xid="span1"/>
    </a>  
    <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
      onClick="{'operation':'mainData.delete'}" xid="button2"> 
      <i xid="i2"/>  
      <span xid="span2"/>
    </a>
  </div>  
  <div component="$UI/system/components/fragment/list/listTable" data="mainData" masterData="" masterCol="" xid="listTable1">
   <div component="$UI/system/components/justep/list/list" class="x-list" data="mainData" xid="list1">
    <table class="table table-bordered table-hover table-striped table-condensed" component="$UI/system/components/bootstrap/table/table" xid="table1">
     <thead xid="thead1">
      <tr xid="tr1">
       <th xid="col1">
        <label bind-text="$model.mainData.label('name')" xid="label1"></label></th> 
       <th xid="col2" style="width:45%;">
        <label bind-text="$model.mainData.label('url')" xid="label2"></label></th> 
       <th xid="col3">
        <label bind-text="$model.mainData.label('title')" xid="label3"></label></th> </tr> </thead> 
     <tbody class="x-list-template" bind-click="$model!=$object?$object.data.to($object):null" xid="listTemplate1">
      <tr xid="tr2" bind-css="{'info':$object==$model.mainData.getCurrentRow()}">
       <td xid="td1">
        <input component="$UI/system/components/justep/input/input" class="form-control" bind-ref="ref('name')" xid="input1"></input></td> 
       <td xid="td2">
                          <div class="input-group" component="$UI/system/components/bootstrap/inputGroup/inputGroup"
                    xid="inputGroup1"> 
                    <input type="text" class="form-control" component="$UI/system/components/justep/input/input"
                      xid="input1" bind-ref="ref(&quot;url&quot;)"/>  
                    <div class="input-group-btn" xid="layoutWizard1"> 
                      <a component="$UI/system/components/justep/button/button"
                        class="btn btn-default btn-only-icon" label="button" xid="button1"
                        icon="icon-more" bind-click="fileClick"> 
                        <i xid="i4" class="icon-more"/>  
                        <span xid="span3"/>
                      </a> 
                    </div>
                  </div></td> 
       <td xid="td3">
        <input component="$UI/system/components/justep/input/input" class="form-control" bind-ref="ref('title')" xid="input3"></input></td> </tr> </tbody> </table> </div> </div>
  <span component="$UI/system/components/justep/windowDialog/windowDialog" xid="dlgFile" style="top:162px;left:367px;" src="$UI/system/components/designerCommon/propEdtorPages/fileSelector/fileSelectView.w" status="normal" showTitle="true" title="选择.W" onReceive="dlgFileReceive"></span></div>
