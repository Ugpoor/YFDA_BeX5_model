<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window x-full-screen container-fluid" component="$UI/system/components/justep/window/window"
  design="device:pc">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:219px;top:149px;"> 
    <div component="$UI/system/components/justep/data/bizData" autoLoad="false"
      xid="typeData" concept="SA_Code" limit="-1"> 
      <reader xid="default4" action="/system/logic/action/querySA_CodeTypeAction"/> 
    </div>  
    <div component="$UI/system/components/justep/data/bizData" autoLoad="true"
      xid="codeData" concept="SA_Code" onNewCreateParam="codeDataNewCreateParam" confirmRefresh="false"> 
      <reader xid="default1" action="/system/logic/action/querySA_CodeAction"/>  
      <writer xid="default2" action="/system/logic/action/saveSA_CodeAction"/>  
      <creator xid="default3" action="/system/logic/action/createSA_CodeAction"/>  
      <rule xid="rule1"> 
        <col name="sCode" xid="ruleCol1"> 
          <required xid="required1"> 
            <expr xid="default6">true</expr>  
            <message xid="default7">请输入编码</message> 
          </required> 
        </col>  
        <col name="sName" xid="ruleCol2"> 
          <required xid="required2"> 
            <expr xid="default8">true</expr>  
            <message xid="default9">请输入名称</message> 
          </required> 
        </col>  
        <col name="sType" xid="ruleCol3"> 
          <required xid="required3"> 
            <expr xid="default10">true</expr>  
            <message xid="default11">请输入类型</message> 
          </required> 
        </col> 
      </rule> 
    </div> 
  <div component="$UI/system/components/justep/data/data" autoLoad="false" xid="tempData" idColumn="type" autoNew="true" onValueChange="tempDataValueChange"><column name="type" type="String" xid="xid1"></column></div></div>  
  <div component="$UI/system/components/justep/panel/panel" class="x-panel" xid="panel2" style="height:100%;width:100%;">
   <div class="x-panel-top" xid="top2" height="55">
    <div component="$UI/system/components/justep/toolBar/toolBar" class="x-toolbar x-toolbar-spliter" xid="toolBar2">
     <label xid="label2" class="pull-left" style="margin: 8px;"><![CDATA[类型]]></label><div class="x-gridSelect pull-left" component="$UI/system/components/justep/gridSelect/gridSelect" xid="gridSelect1" style="width:200px;" bind-ref="tempData.ref('type')" defaultLabel="'全部'" clearButton="true" onShowOption="gridSelect1ShowOption">
   <option xid="option1" data="typeData" value="sType" autoLoad="false"></option></div><a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left" onClick="{'operation':'codeData.new'}" xid="button3" style="margin-left: 8px;">
      <i xid="i3"></i>
      <span xid="span3"></span></a> 
     <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left" onClick="{'operation':'codeData.delete'}" xid="button2">
      <i xid="i2"></i>
      <span xid="span2"></span></a> 
     <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left" onClick="{'operation':'codeData.save'}" xid="button1">
      <i xid="i1"></i>
      <span xid="span1"></span></a> 
  </div> </div> 
   <div class="x-panel-content" xid="content2" style="overflow: hidden;">
    <div component="$UI/system/components/justep/grid/grid" hiddenCaptionbar="true" altRows="true" class="x-grid-no-bordered" xid="grid2" data="codeData" showRowNumber="true" height="100%" width="100%">
     <columns xid="columns2">
      <column width="200" name="sType" xid="column2" label="类型" editable="true">
       <editor xid="editor1">
        <input component="$UI/system/components/justep/input/input" class="form-control" xid="input1" bind-ref="ref('sType')"></input></editor> </column> 
      <column name="sCode" editable="true" editor="input" xid="column3" label="编码">
       <editor xid="editor2">
        <input component="$UI/system/components/justep/input/input" class="form-control" xid="input2" bind-ref="ref('sCode')"></input></editor> </column> 
      <column name="sName" editable="true" editor="input" xid="column4" label="名称">
       <editor xid="editor3">
        <input component="$UI/system/components/justep/input/input" class="form-control" xid="input3" bind-ref="ref('sName')"></input></editor> </column> </columns> </div> </div> 
   <div class="x-panel-bottom" xid="bottom2" height="60">
    <div component="$UI/system/components/justep/pagerBar/pagerBar" class="x-pagerbar container-fluid" xid="pagerBar4" data="codeData">
     <div class="row" xid="div22">
      <div class="col-sm-3" xid="div23">
       <div class="x-pagerbar-length" xid="div24">
        <label component="$UI/system/components/justep/pagerLimitSelect/pagerLimitSelect" class="x-pagerlimitselect" xid="pagerLimitSelect6">
         <span xid="span27">显示</span>
         <select component="$UI/system/components/justep/select/select" class="form-control input-sm" xid="select6">
          <option value="10" xid="default31">10</option>
          <option value="20" xid="default32">20</option>
          <option value="50" xid="default33">50</option>
          <option value="100" xid="default34">100</option></select> 
         <span xid="span28">条</span></label> </div> </div> 
      <div class="col-sm-3" xid="div25">
       <div class="x-pagerbar-info" xid="div26">当前显示0条，共0条</div></div> 
      <div class="col-sm-6" xid="div27">
       <div class="x-pagerbar-pagination" xid="div28">
        <ul class="pagination" component="$UI/system/components/bootstrap/pagination/pagination" xid="pagination4">
         <li class="prev" xid="li9">
          <a href="#" xid="a9">
           <span aria-hidden="true" xid="span29">«</span>
           <span class="sr-only" xid="span30">Previous</span></a> </li> 
         <li class="next" xid="li10">
          <a href="#" xid="a10">
           <span aria-hidden="true" xid="span31">»</span>
           <span class="sr-only" xid="span32">Next</span></a> </li> </ul> </div> </div> </div> </div> </div> </div></div>
