<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window" component="$UI/system/components/justep/window/window"
  design="device:pc;">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:331px;top:247px;"> 
    <div component="$UI/system/components/justep/data/bizData" xid="orderData"
      concept="DEMO_Order" limit="1" autoNew="true"> 
      <reader xid="default1" action="/demo/misc/logic/action/queryOrderAction"/>  
      <writer xid="default2" action="/demo/misc/logic/action/saveOrderAction"/>  
      <creator xid="default3" action="/demo/misc/logic/action/createOrderAction"/> 
    </div> 
  </div>  
  <div component="$UI/system/components/justep/process/process" xid="process"
    data="orderData"/>  
  <div component="$UI/system/components/justep/popMenu/popMenu" class="x-popMenu"
    xid="moreMenu" opacity="0" anchor="moreBtn" direction="left-bottom"> 
    <div class="x-popMenu-overlay" xid="moreMenuOverlay"/>  
    <ul component="$UI/system/components/justep/menu/menu" class="x-menu dropdown-menu x-popMenu-content"
      xid="moreContent"> 
      <li class="x-menu-item" xid="backItem"> 
        <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
          xid="backBtn" onClick="{operation:'process.back'}"> 
          <i xid="i8"/>  
          <span xid="span6"/> 
        </a> 
      </li>  
      <li class="x-menu-item" xid="suspendItem"> 
        <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
          xid="suspendBtn" onClick="{operation:'process.suspend'}"> 
          <i xid="i3"/>  
          <span xid="span3"/> 
        </a> 
      </li>  
      <li class="x-menu-item" xid="abortItem"> 
        <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
          xid="abortBtn" onClick="{operation:'process.abort'}"> 
          <i xid="i4"/>  
          <span xid="span4"/> 
        </a> 
      </li>  
      <li class="x-menu-item" xid="chartItem"> 
        <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
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
        xid="saveBtn" onClick="{operation:'orderData.save'}"> 
        <i xid="i1"/>  
        <span xid="span1"/> 
      </a>  
      <a component="$UI/system/components/justep/button/button" label="更多"
        xid="moreBtn" onClick="{operation:'moreMenu.show'}" class="btn btn-link"> 
        <i xid="i15"/>  
        <span xid="span15">更多</span> 
      </a> 
    </div>  
    <div xid="content"> 
      <h1 xid="title" class="text-center"><![CDATA[阳光集团销售审批单]]></h1>  
      <div class="form-horizontal container-fluid" component="$UI/system/components/bootstrap/form/form"> 
        <div class="form-group" xid="formGroup1"> 
          <div class="col-sm-2" xid="col1"> 
            <label class="control-label" xid="codeL">订单编号</label> 
          </div>  
          <div class="col-sm-4" xid="col2"> 
            <output component="$UI/system/components/justep/output/output" class="form-control"
              xid="code" bind-ref="orderData.ref('fOrderCode')"/> 
          </div>  
          <div class="col-sm-2" xid="col3"> 
            <label class="control-label" xid="orderDateL">订购日期</label> 
          </div>  
          <div class="col-sm-4" xid="col4"> 
            <input component="$UI/system/components/justep/input/input" class="form-control"
              xid="orderDate" bind-ref="orderData.ref('fOrderDate')"/> 
          </div> 
        </div>  
        <div class="form-group" xid="formGroup2"> 
          <div class="col-sm-2" xid="col5"> 
            <label class="control-label" xid="customerL">客户名称</label> 
          </div>  
          <div class="col-sm-4" xid="col6"> 
            <input component="$UI/system/components/justep/input/input" class="form-control"
              xid="customer" bind-ref="orderData.ref('fCustomerName')"/> 
          </div>  
          <div class="col-sm-2" xid="col7"> 
            <label class="control-label" xid="reportL">申请人</label> 
          </div>  
          <div class="col-sm-4" xid="col8"> 
            <output component="$UI/system/components/justep/output/output" class="form-control"
              bind-ref="orderData.ref('fReportID')" xid="report"/> 
          </div> 
        </div>  
        <div class="form-group" xid="formGroup3"> 
          <div class="col-sm-2" xid="col9"> 
            <label class="control-label" xid="emploueeL">雇员名称</label> 
          </div>  
          <div class="col-sm-4" xid="col10"> 
            <input component="$UI/system/components/justep/input/input" class="form-control"
              xid="emplouee" bind-ref="orderData.ref('fEmploueeName')"/> 
          </div>  
          <div class="col-sm-2" xid="col11"> 
            <label class="control-label" xid="reportDateL">申请日期</label> 
          </div>  
          <div class="col-sm-4" xid="col12"> 
            <input component="$UI/system/components/justep/input/input" class="form-control"
              bind-ref="orderData.ref('fReporedDate')" xid="reportDate"/> 
          </div> 
        </div>  
        <div class="form-group" xid="formGroup4"> 
          <div class="col-sm-2" xid="col13"> 
            <label class="control-label" xid="shippedDateL">发货日期</label> 
          </div>  
          <div class="col-sm-4" xid="col14"> 
            <input component="$UI/system/components/justep/input/input" class="form-control"
              bind-ref="orderData.ref('fShippedDate')" xid="shippedDate"/> 
          </div>  
          <div class="col-sm-2" xid="col15"> 
            <label class="control-label" xid="requiredDateL">到货日期</label> 
          </div>  
          <div class="col-sm-4" xid="col16"> 
            <input component="$UI/system/components/justep/input/input" class="form-control"
              bind-ref="orderData.ref('fRequiredDate')" xid="requiredDate"/> 
          </div> 
        </div>  
        <div class="form-group" xid="formGroup5"> 
          <div class="col-sm-2" xid="col17"> 
            <label class="control-label" xid="totalAmtL">金额</label> 
          </div>  
          <div class="col-sm-10" xid="col18"> 
            <input component="$UI/system/components/justep/input/input" class="form-control"
              bind-ref="orderData.ref('fTolotalAmt')" xid="totalAmt"/> 
          </div> 
        </div> 
      </div> 
    </div> 
  </div> 
</div>
