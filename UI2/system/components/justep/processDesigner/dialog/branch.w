<?xml version="1.0" encoding="UTF-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window" component="$UI/system/components/justep/window/window" design="device:pc">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:4px;top:352px;"><div component="$UI/system/components/justep/data/data" autoLoad="true" xid="forkRulesData" idColumn="name" confirmDelete="false" onIndexChanged="forkRulesDataIndexChanged"><column label="名称" name="name" type="String" xid="xid1"></column>
  <column label="生效条件" name="condition" type="String" xid="xid2"></column>
  <column label="ID" name="id" type="String" xid="xid11"></column></div>
  <div component="$UI/system/components/justep/data/data" autoLoad="true" xid="joinRulesData" idColumn="name" confirmDelete="false" onIndexChanged="joinRulesDataIndexChanged"><column label="名称" name="name" type="String" xid="xid3"></column>
  <column label="生效条件" name="condition" type="String" xid="xid4"></column>
  <column label="合并模式" name="joinMode" type="String" xid="xid5"></column>
  <column label="分支环节" name="forkActivity" type="String" xid="xid6"></column>
  <column label="ID" name="id" type="String" xid="xid12"></column></div>
  <div component="$UI/system/components/justep/data/data" autoLoad="true" xid="inputActivity" idColumn="value" confirmDelete="false"><column label="值" name="value" type="String" xid="xid7"></column>
  <column label="显示值" name="oValue" type="String" xid="xid8"></column></div>
  <div component="$UI/system/components/justep/data/data" autoLoad="true" xid="outputActivity" idColumn="value" confirmDelete="false"><column label="值" name="value" type="String" xid="xid9"></column>
  <column label="显示值" name="oValue" type="String" xid="xid10"></column></div>
  <div component="$UI/system/components/justep/data/data" autoLoad="true" xid="forkOutputActivity" idColumn="id" confirmDelete="false"><column label="ID" name="id" type="String" xid="xid13"></column>
  <column label="名称" name="name" type="String" xid="xid14"></column></div>
  <div component="$UI/system/components/justep/data/data" autoLoad="true" xid="joinInputActivity" idColumn="id" confirmDelete="false"><column label="ID" name="id" type="String" xid="xid15"></column>
  <column label="名称" name="name" type="String" xid="xid16"></column></div>
  <div component="$UI/system/components/justep/data/data" autoLoad="true" xid="joinMode" idColumn="value"><column label="值" name="value" type="String" xid="xid17"></column>
  <column label="显示值" name="oValue" type="String" xid="xid18"></column>
  <data xid="default1">[{&quot;value&quot;:&quot;join&quot;,&quot;oValue&quot;:&quot;合并&quot;},{&quot;value&quot;:&quot;preempt&quot;,&quot;oValue&quot;:&quot;抢占&quot;}]</data></div>
  <div component="$UI/system/components/justep/data/data" autoLoad="true" xid="forkLink" idColumn="value"><column label="值" name="value" type="String" xid="xid19"></column>
  <column label="显示值" name="oValue" type="String" xid="xid20"></column></div></div> 
<span component="$UI/system/components/justep/windowReceiver/windowReceiver" xid="windowReceiver1" onReceive="windowReceiver1Receive"></span>
  
  <div component="$UI/system/components/justep/panel/panel" class="x-panel x-full" xid="panel4">
   <div class="x-panel-content" xid="content1"><div component="$UI/system/components/justep/row/row" class="x-row" xid="row2">
   <div class="x-col x-col-50" xid="col2"><div class="input-group" component="$UI/system/components/bootstrap/inputGroup/inputGroup" xid="inputGroup1">
   <span xid="span15" class="input-group-addon">显示名称：</span>
   <input component="$UI/system/components/justep/input/input" class="form-control x-edit" xid="andName"></input></div></div>
   </div><div component="$UI/system/components/bootstrap/tabs/tabs" xid="tabs1">
   <ul class="nav nav-tabs" xid="ul1">
    <li class="active" xid="li1">
     <a content="tabContent1" xid="tabItem1"><![CDATA[合并规则]]></a>
  <div xid="div5"></div></li> 
    <li role="presentation" xid="li2">
     <a content="tabContent2" xid="tabItem2"><![CDATA[分支规则]]></a></li> </ul> 
   <div class="tab-content" xid="div2">
    <div class="tab-pane active" xid="tabContent1">
  <div class="panel panel-default" component="$UI/system/components/bootstrap/panel/panel" xid="panel2">
   
   <div class="panel-body" xid="body2"><div component="$UI/system/components/bootstrap/row/row" class="row" xid="row6">
   <div class="col col-xs-4" xid="col13"><div component="$UI/system/components/justep/toolBar/toolBar" class="x-toolbar form-inline x-toolbar-spliter" xid="toolBar1"><a component="$UI/system/components/justep/button/button" class="btn btn-link" label="新增" xid="button1" icon="icon-android-add" onClick="button1Click">
   <i xid="i1" class="icon-android-add"></i>
   <span xid="span1">新增</span></a><a component="$UI/system/components/justep/button/button" class="btn btn-link" label="删除" xid="button2" icon="icon-android-close" onClick="button2Click">
   <i xid="i2" class="icon-android-close"></i>
   <span xid="span2">删除</span></a></div><div component="$UI/system/components/justep/dataTables/dataTables" flexibleWidth="true" rowActiveClass="active" class="table table-hover table-striped" xid="dataTables1" data="joinRulesData">
   <columns xid="columns1"><column name="name" xid="column1"></column></columns></div></div>
   <div class="col col-xs-8" xid="col15"><div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label30" xid="labelEdit2">
   <label class="x-label"><![CDATA[生效条件]]></label>
   <input component="$UI/system/components/justep/input/input" class="form-control x-edit" xid="input2" bind-ref="joinRulesData.ref('condition')"></input></div><div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label30" xid="labelEdit3">
   <label class="x-label" xid="label3"><![CDATA[合并模式]]></label>
   <select component="$UI/system/components/justep/select/select" class="form-control x-edit" xid="select1" bind-ref="joinRulesData.ref('joinMode')" bind-options="joinMode" bind-optionsValue="value" bind-optionsLabel="oValue"></select></div><div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label30" xid="labelEdit4">
   <label class="x-label" xid="label4"><![CDATA[分支环节]]></label>
   <select component="$UI/system/components/justep/select/select" class="form-control x-edit" xid="select2" bind-ref="joinRulesData.ref('forkActivity')" bind-options="forkLink" bind-optionsValue="value" bind-optionsLabel="oValue"></select></div><h4 xid="h41"><![CDATA[可选输入]]></h4><div component="$UI/system/components/justep/toolBar/toolBar" class="x-toolbar form-inline x-toolbar-spliter" xid="toolBar2"><a component="$UI/system/components/justep/button/button" class="btn btn-link" label="新增" xid="button3" onClick="button3Click" icon="icon-android-add">
   <i xid="i7" class="icon-android-add"></i>
   <span xid="span7">新增</span></a><a component="$UI/system/components/justep/button/button" class="btn btn-link" label="删除" xid="button4" onClick="button4Click" icon="icon-android-close">
   <i xid="i8" class="icon-android-close"></i>
   <span xid="span8">删除</span></a></div>
  
  <div xid="div6" style="height:130px;overflow:auto;"><div component="$UI/system/components/justep/dataTables/dataTables" flexibleWidth="true" rowActiveClass="active" class="table table-hover table-striped" xid="dataTables3" data="joinInputActivity" filter='$row.val("id") == $model.joinRulesData.val("id")'>
   <columns xid="columns3"><column name="name" xid="column3"></column></columns></div></div></div></div>
  </div>
   </div></div>
    <div class="tab-pane" xid="tabContent2">
  <div class="panel panel-default" component="$UI/system/components/bootstrap/panel/panel" xid="panel3">
   
   <div class="panel-body" xid="body3"><div component="$UI/system/components/bootstrap/row/row" class="row" xid="row7">
   <div class="col col-xs-4" xid="col16"><div component="$UI/system/components/justep/toolBar/toolBar" class="x-toolbar form-inline x-toolbar-spliter" xid="toolBar3"><a component="$UI/system/components/justep/button/button" class="btn btn-link" label="新增" xid="add" icon="icon-android-add" onClick="addClick">
       <i xid="i6" class="icon-android-add"></i>
       <span xid="span6">新增</span></a><a component="$UI/system/components/justep/button/button" class="btn btn-link" label="删除" xid="delete" icon="icon-android-close" onClick="deleteClick">
       <i xid="i5" class="icon-android-close"></i>
       <span xid="span5">删除</span></a></div><div component="$UI/system/components/justep/dataTables/dataTables" flexibleWidth="true" rowActiveClass="active" class="table table-hover table-striped" xid="dataTables2" data="forkRulesData">
   <columns xid="columns2"><column name="name" xid="column2"></column></columns></div></div>
   <div class="col col-xs-8" xid="col18"><div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label30" xid="labelEdit7">
       <label class="x-label" xid="label5"><![CDATA[生效条件]]></label>
       <input component="$UI/system/components/justep/input/input" class="form-control x-edit" xid="input3" bind-ref="forkRulesData.ref('condition')"></input></div><h4 xid="h42"><![CDATA[可选输出]]></h4><div component="$UI/system/components/justep/toolBar/toolBar" class="x-toolbar form-inline x-toolbar-spliter" xid="toolBar4"><a component="$UI/system/components/justep/button/button" class="btn btn-link" label="新增" xid="button5" onClick="button5Click" icon="icon-android-add">
   <i xid="i9" class="icon-android-add"></i>
   <span xid="span9">新增</span></a><a component="$UI/system/components/justep/button/button" class="btn btn-link" label="删除" xid="button6" onClick="button6Click" icon="icon-android-close">
   <i xid="i10" class="icon-android-close"></i>
   <span xid="span10">删除</span></a></div>
  <div xid="div4" style="height:230px;overflow:auto"><div component="$UI/system/components/justep/dataTables/dataTables" flexibleWidth="true" rowActiveClass="active" class="table table-hover table-striped" xid="dataTables4" data="forkOutputActivity" filter='$row.val("id") == $model.forkRulesData.val("id")'>
   <columns xid="columns4"><column name="name" xid="column4"></column></columns></div></div></div></div>
  </div>
   </div></div></div> </div>
  </div>
   <div class="x-panel-bottom" xid="bottom1">
  
  <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-only-label x-dialog-button" label="取消" xid="cancel" onClick="cancelClick">
   <i xid="i4"></i>
   <span xid="span4">取消</span></a><a component="$UI/system/components/justep/button/button" class="btn btn-primary btn-only-label x-dialog-button" label="确定" xid="okbtn" onClick="okbtnClick">
   <i xid="i3"></i>
   <span xid="span3">确定</span></a></div></div></div>