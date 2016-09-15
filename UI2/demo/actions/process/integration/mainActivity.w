<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" component="$UI/system/components/justep/window/window" design="device:pc">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="left:18px;top:83px;height:244px;">
    <div component="$UI/system/components/justep/data/bizData" xid="mainData"
      directDelete="true" autoLoad="false" concept="DEMO_BorrowBook" autoNew="true"> 
      <reader action="/demo/actions/logic/action/queryDEMO_BorrowBookAction"/>  
      <writer action="/demo/actions/logic/action/saveDEMO_BorrowBookAction"/>  
      <creator action="/demo/actions/logic/action/createDEMO_BorrowBookAction"/> 
    <rule xid="rule1">
   <col name="fBookName" xid="ruleCol1">
    <required xid="required1">
     <expr xid="default1">true</expr></required> </col> 
   <col name="fStartDate" xid="ruleCol2">
    <required xid="required2">
     <expr xid="default2">true</expr></required> </col> 
   <col name="fEndDate" xid="ruleCol3">
    <required xid="required3">
     <expr xid="default3">true</expr></required> </col> 
   <col name="fBorrower" xid="ruleCol4">
    <required xid="required4">
     <expr xid="default4">true</expr></required> </col> </rule></div>
  </div>  
  <div component="$UI/system/components/justep/process/process" xid="process"
    data="mainData"/>  
  <div component="$UI/system/components/justep/popMenu/popMenu" class="x-popMenu"
    xid="moreMenu" opacity="0" anchor="moreBtn" direction="left-bottom"> 
    <div class="x-popMenu-overlay" xid="moreMenuOverlay"/>  
    <ul component="$UI/system/components/justep/menu/menu" class="x-menu dropdown-menu x-popMenu-content"
      xid="moreContent"> 
      <li class="x-menu-item" xid="backItem"> 
        <a component="$UI/system/components/justep/button/button" class="btn btn-link  btn-icon-left"
          xid="backBtn" onClick="{operation:'process.back'}"> 
          <i xid="i8"/>  
          <span xid="span6"/> 
        </a> 
      </li>  
      <li class="x-menu-item" xid="suspendItem"> 
        <a component="$UI/system/components/justep/button/button" class="btn btn-link  btn-icon-left"
          xid="suspendBtn" onClick="{operation:'process.suspend'}"> 
          <i xid="i3"/>  
          <span xid="span3"/> 
        </a> 
      </li>  
      <li class="x-menu-item" xid="abortItem"> 
        <a component="$UI/system/components/justep/button/button" class="btn btn-link  btn-icon-left"
          xid="abortBtn" onClick="{operation:'process.abort'}"> 
          <i xid="i4"/>  
          <span xid="span4"/> 
        </a> 
      </li>  
      <li class="x-menu-item" xid="chartItem"> 
        <a component="$UI/system/components/justep/button/button" class="btn btn-link  btn-icon-left"
          xid="chartBtn" onClick="{operation:'process.showChart'}"> 
          <i xid="i5"/>  
          <span xid="span5"/> 
        </a> 
      </li>  
      <li class="x-menu-item" xid="recordItem"> 
        <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
          xid="recordBtn" onClick="{operation:'process.processRecord'}"> 
          <i xid="i55"/>  
          <span xid="span55"/> 
        </a> 
      </li> 
    </ul> 
  </div>  
  <div xid="view"> 
    <div component="$UI/system/components/justep/toolBar/toolBar" class="x-toolbar x-toolbar-spliter form-inline"
      xid="mainBar"> 
        <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
          xid="advanceBtn" onClick="{operation:'process.advance'}"> 
          <i xid="i2"/>  
          <span xid="span2"/> 
        </a>  
        <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
          xid="saveBtn" onClick="{operation:'mainData.save'}"> 
          <i xid="i1"/>  
          <span xid="span1"/> 
        </a>  
        <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left btn-only-label"
          label="更多" xid="moreBtn" onClick="{operation:'moreMenu.show'}" icon="icon-ios7-more"> 
          <i xid="i15" class="icon-ios7-more"/>  
          <span xid="span15">更多</span> 
        </a> 
    </div>  
    <div xid="content"> 
      <h1 xid="h11" class="text-center"><![CDATA[借书申请]]></h1>  
      <div xid="mainForm" class="form-horizontal container-fluid" component="$UI/system/components/bootstrap/form/form"> 
        <div xid="formGroup1" class="form-group"> 
          <div xid="col11" class="col-sm-2"> 
            <label xid="fBookNameL" class="control-label" bind-text="mainData.label('fBookName')"/> 
          </div>  
          <div xid="col12" class="col-sm-4">
            <input class="form-control" component="$UI/system/components/justep/input/input"
              bind-ref="mainData.ref('fBookName')"/>
          </div>  
            
          <div xid="col23" class="col-sm-2">
   <label xid="fBorrowerL" class="control-label" bind-text="mainData.label('fBorrower')"></label></div>
  <div xid="col24" class="col-sm-4">
   <input xid="fBorrower" class="form-control" component="$UI/system/components/justep/input/input" bind-ref="mainData.ref('fBorrower')"></input></div></div>  
        <div xid="formGroup2" class="form-group"> 
          <div xid="col13" class="col-sm-2">
   <label xid="fStartDateL" class="control-label" bind-text="mainData.label('fStartDate')"></label></div>
  <div xid="col14" class="col-sm-4">
   <input xid="fStartDate" class="form-control" component="$UI/system/components/justep/input/input" bind-ref="mainData.ref('fStartDate')"></input></div>
  <div xid="col21" class="col-sm-2">
   <label xid="fEndDateL" class="control-label" bind-text="mainData.label('fEndDate')"></label></div>
  <div xid="col22" class="col-sm-4">
   <input class="form-control" component="$UI/system/components/justep/input/input" bind-ref="mainData.ref('fEndDate')" xid="input1"></input></div></div> 
      </div> 
    </div> 
  </div> 
</div>