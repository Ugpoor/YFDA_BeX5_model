<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" component="$UI/system/components/justep/window/window">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:408px;top:67px;"> 
    <div component="$UI/system/components/justep/data/bizData" xid="mainData"
      concept="DEMO_Order" autoNew="true" limit="1"> 
      <reader xid="default1" action="/demo/misc/logic/action/queryOrderAction"/>  
      <writer xid="default2" action="/demo/misc/logic/action/saveOrderAction"/>  
      <creator xid="default3" action="/demo/misc/logic/action/createOrderAction"/>  
      <rule xid="rule1">
   <col name="fReportID" xid="ruleCol1">
    <readonly xid="readonly1">
     <expr xid="default9">js:true</expr></readonly> </col> 
   <col name="fReporedDate" xid="ruleCol2">
    <readonly xid="readonly2">
     <expr xid="default11">js:true</expr></readonly> </col> 
   <col name="fTolotalAmt" xid="ruleCol4">
    <calculate xid="calculate1">
     <expr xid="default13">js:$model.detailData?$model.detailData.Sum('fFactAmt',$row):0</expr></calculate> </col> </rule></div>  
    <div component="$UI/system/components/justep/data/bizData" xid="detailData"
      concept="DEMO_OrderDetail" limit="10" directDelete="true"> 
      <reader xid="default4" action="/demo/misc/logic/action/queryOrder_DAction"/>  
      <writer xid="default5" action="/demo/misc/logic/action/saveOrder_DAction"/>  
      <creator xid="default6" action="/demo/misc/logic/action/createOrder_DAction"/>  
      <master xid="default7" data="mainData" relation="fOrderID"/>  
      <rule xid="rule3">
   <col name="fFactAmt" xid="ruleCol3">
    <calculate xid="calculate3">
     <expr xid="default12">js:(ref(&quot;fUnitprice&quot;)?val(&quot;fUnitprice&quot;):0) * (ref(&quot;fQuantity&quot;)?val(&quot;fQuantity&quot;):0) * (ref(&quot;fDisCount&quot;)?val(&quot;fDisCount&quot;):0)</expr></calculate> </col> </rule></div>  
    <div component="$UI/system/components/justep/data/bizData" xid="customerData"
      concept="DEMO_Custemor"> 
      <reader xid="default8" action="/demo/misc/logic/action/queryCustemorAction"/> 
    </div> 
  <div component="$UI/system/components/justep/data/bizData" xid="productData" concept="DEMO_Product">
   <reader xid="default10" action="/demo/misc/logic/action/queryProductAction"></reader></div></div>  
  <div/>  
  <div component="$UI/system/components/justep/panel/panel" class="x-panel x-full"
    xid="panel1"> 
    <div class="x-panel-top" xid="top1"> 
      <div component="$UI/system/components/justep/titleBar/titleBar" class="x-titlebar"
        xid="titleBar1" title="订单申请"> 
        <div class="x-titlebar-left" xid="div1"> 
          <a component="$UI/system/components/justep/button/button" class="btn btn-link"
            xid="closeWin" icon="icon-chevron-left" onClick="closeWin"> 
            <i xid="i1" class="icon-chevron-left"/>  
            <span xid="span1"/> 
          </a> 
        </div>  
        <div class="x-titlebar-title" xid="div2">订单申请</div>  
        <div class="x-titlebar-right reverse" xid="div3"> 
          <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-only-icon"
            xid="menu" icon="icon-android-more" onClick="menuClick"> 
            <i xid="i4" class="icon-android-more"/>  
            <span xid="span4"/> 
          </a>  
          <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-only-icon"
            xid="button2" onClick="{operation:'mainData.save'}"> 
            <i xid="i2" class="icon-save glyphicon-floppy-disk"/>  
            <span/> 
          </a> 
        </div> 
      </div> 
    </div>  
    <div class="x-panel-content x-full" xid="content1"> 
      <div component="$UI/system/components/justep/controlGroup/controlGroup"
        class="x-control-group" xid="controlGroup1" title="基本信息"> 
        <div class="x-control-group-title" xid="controlGroupTitle1">基本信息</div>  
        <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit"
          xid="labelOutput1"> 
          <label class="x-label x-label-w" xid="label1" bind-text="mainData.label('fOrderCode')"/>  
          <div component="$UI/system/components/justep/output/output" class="x-output x-edit"
            xid="output1" bind-ref="mainData.ref('fOrderCode')"/> 
        </div>  
        <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit"
          xid="labelOutput2"> 
          <label class="x-label x-label-w" xid="label2" bind-text="mainData.label('fReportID')"><![CDATA[]]></label>  
          <div component="$UI/system/components/justep/output/output" class="x-output x-edit"
            xid="output2" bind-ref="mainData.ref('fReportID')"/> 
        </div>  
        <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit"
          xid="labelSelect1"> 
          <label class="x-label x-label-w" xid="label3" bind-text="mainData.label('fCustomerID')"/>  
          <select component="$UI/system/components/justep/select/select" class="form-control x-edit"
            xid="select1" bind-ref="mainData.ref('fCustomerID')" bind-labelRef="mainData.ref('fCustomerName')"
            bind-options="customerData" bind-optionsCaption="选择客户" bind-optionsLabel="fCustomerName"
            bind-optionsValue="DEMO_Custemor"/> 
        </div>  
        <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit"
          xid="labelInput1"> 
          <label class="x-label x-label-w" xid="label4" bind-text="mainData.label('fOrderDate')"/>  
          <input component="$UI/system/components/justep/input/input" class="form-control x-edit"
            xid="input1" bind-ref="mainData.ref('fOrderDate')" format="yyyy-MM-dd"
            min="js:new Date()"/> 
        </div>  
        <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit"
          xid="labelInput2"> 
          <label class="x-label x-label-w" xid="label5" bind-text="mainData.label('fShippedDate')"/>  
          <input component="$UI/system/components/justep/input/input" class="form-control x-edit"
            xid="input2" bind-ref="mainData.ref('fShippedDate')" format="yyyy-MM-dd"
            min="js:new Date()"/> 
        </div>  
        <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit"
          xid="labelInput4"> 
          <label class="x-label x-label-w" xid="label7" bind-text="mainData.label('fRequiredDate')"/>  
          <input component="$UI/system/components/justep/input/input" class="form-control x-edit"
            xid="input4" bind-ref="mainData.ref('fRequiredDate')" format="yyyy-MM-dd"
            min="js:new Date()"/> 
        </div>  
        <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit"
          xid="labelOutput3"> 
          <label class="x-label x-label-w" xid="label8" bind-text="mainData.label('fTolotalAmt')"/>  
          <div component="$UI/system/components/justep/output/output" class="x-output x-edit"
            xid="output3" bind-ref="mainData.ref('fTolotalAmt')"/> 
        </div> 
      </div>  
      <div component="$UI/system/components/justep/controlGroup/controlGroup"
        class="x-control-group" xid="controlGroup2" title="商品明细"> 
        <div class="x-control-group-title" xid="controlGroupTitle2"><span>商品明细</span><i xid="i99" class="icon-android-add" style="font-size:20px;float:right;" bind-click="addDetailClick"/></div>  
        <div component="$UI/system/components/justep/list/list" class="x-list"
          xid="list1" data="detailData"> 
          <div class="x-list-template" xid="listTemplateUl1"> 
            <div component="$UI/system/components/justep/row/row" class="x-row x-order-detail"
              xid="row1"> 
              <div class="x-col" xid="col1"> 
                <div component="$UI/system/components/justep/labelEdit/labelEdit"
                  class="x-label-edit" xid="labelSelect2"> 
                  <label class="x-label x-label-w" xid="label6" bind-text="label('fProductName')"/>  
                  <select component="$UI/system/components/justep/select/select"
                    class="form-control x-edit" xid="select2" bind-ref="ref('fProductCode')" bind-labelRef="ref('fProductName')" bind-options="$model.productData" bind-optionsCaption="选择商品" bind-optionsLabel="fProductName" bind-optionsValue="fProductCode"/> 
                </div> 
              <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit" xid="labelInput3">
   <label class="x-label x-label-w" xid="label9" bind-text="label('fUnitprice')"></label>
   <input component="$UI/system/components/justep/input/input" class="form-control x-edit" xid="input3" bind-ref="ref('fUnitprice')"></input></div>
  <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit" xid="labelInput5">
   <label class="x-label x-label-w" xid="label10" bind-text="label('fQuantity')"></label>
   <input component="$UI/system/components/justep/input/input" class="form-control x-edit" xid="input5" bind-ref="ref('fQuantity')"></input></div>
  <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit" xid="labelInput6">
   <label class="x-label x-label-w" xid="label11" bind-text="label('fDisCount')"></label>
   <input component="$UI/system/components/justep/input/input" class="form-control x-edit" xid="input6" bind-ref="ref('fDisCount')"></input></div>
  <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit" xid="labelOutput4">
   <label class="x-label x-label-w" xid="label12" bind-text="label('fFactAmt')"></label>
   <div component="$UI/system/components/justep/output/output" class="x-output x-edit" xid="output4" bind-ref="ref('fFactAmt')"></div></div></div>  
              <div xid="col2" class="x-col x-col-10 x-col-center"> 
                <i xid="i7" class="icon-close row-icon" style="color:#FF0000;"
                  bind-click="deleteClick"/> 
              </div> 
            </div> 
          </div> 
        </div> 
      </div> 
    </div> 
  </div>  
  <div component="$UI/system/components/justep/popMenu/popMenu" class="x-popMenu"
    xid="popMenu" anchor="menu"> 
    <div class="x-popMenu-overlay" xid="div4"/>  
    <ul component="$UI/system/components/justep/menu/menu" class="x-menu dropdown-menu x-popMenu-content"
      xid="menu1"> 
      <li class="x-menu-item" xid="item1"> 
        <a component="$UI/system/components/justep/button/button" class="btn btn-link"
          xid="button5" onClick="{operation:'process.advance'}"> 
          <i xid="i5"/>  
          <span xid="span5"/> 
        </a> 
      </li>  
    <li class="x-menu-item" xid="item3">
   <a component="$UI/system/components/justep/button/button" onClick="{operation:'process.showChart'}" class="btn btn-link" xid="button1">
    <i xid="i3"></i>
    <span xid="span3"></span></a> </li>
      <li class="x-menu-item" xid="item2"> 
        <a component="$UI/system/components/justep/button/button" class="btn btn-link"
          label="添加商品" xid="addDetailBtn" onClick="addDetailClick"> 
          <i xid="i6"/>  
          <span xid="span2">添加商品</span> 
        </a> 
      </li> 
    </ul> 
  </div>  
  <div component="$UI/system/components/justep/process/process" xid="process"
    style="height:24px;width:24px;left:572px;top:104px;" data="mainData"/>  
  <span component="$UI/system/components/justep/windowDialog/windowDialog" xid="addDetailDlg"
    style="left:605px;top:105px;" src="detailDlg.m.w" onReceive="addDetailDlgReceive"/> 
</div>
