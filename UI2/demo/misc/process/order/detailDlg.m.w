<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" component="$UI/system/components/justep/window/window">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:408px;top:67px;"> 
    <div component="$UI/system/components/justep/data/bizData" xid="detailData" concept="DEMO_OrderDetail" limit="10">
   <reader xid="default4" action="/demo/misc/logic/action/queryOrder_DAction"></reader>
   <writer xid="default5" action="/demo/misc/logic/action/saveOrder_DAction"></writer>
   <creator xid="default6" action="/demo/misc/logic/action/createOrder_DAction"></creator>
   <master xid="default7"></master>
   <rule xid="rule2">
    <col name="fFactAmt" xid="ruleCol2">
     <calculate xid="calculate2">
      <expr xid="default10"><![CDATA[js:(ref("fUnitprice")?val("fUnitprice"):0) * (ref("fQuantity")?val("fQuantity"):0) * (ref("fDisCount")?val("fDisCount"):0)]]></expr></calculate> </col> </rule> </div><div component="$UI/system/components/justep/data/bizData" xid="productData" concept="DEMO_Product"><reader xid="default1" action="/demo/misc/logic/action/queryProductAction"></reader></div></div>  
  <div/>  
  <div component="$UI/system/components/justep/panel/panel" class="x-panel x-full"
    xid="panel1"> 
    <div class="x-panel-top" xid="top1"> 
      <div component="$UI/system/components/justep/titleBar/titleBar" class="x-titlebar"
        xid="titleBar1" title="选择商品"> 
        <div class="x-titlebar-left" xid="div1"> 
          <a component="$UI/system/components/justep/button/button" class="btn btn-link"
            xid="closeWin" icon="icon-chevron-left" onClick="{operation:'windowReceiver.windowCancel'}"> 
            <i xid="i1" class="icon-chevron-left"/>  
            <span xid="span1"/> 
          </a> 
        </div>  
        <div class="x-titlebar-title" xid="div2">选择商品</div>  
        <div class="x-titlebar-right reverse" xid="div3"> 
          <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-only-icon"
            xid="OkBtn" icon="icon-checkmark" onClick="OkBtnClick"> 
            <i xid="i2" class="icon-save icon-checkmark"/>
            <span /> 
          </a>  
          </div> 
      </div> 
    </div>  
    <div class="x-panel-content x-full" xid="content1"> 
      <div component="$UI/system/components/justep/controlGroup/controlGroup"
        class="x-control-group" xid="controlGroup1"> 
        <div class="x-control-group-title" xid="controlGroupTitle1"></div>  
        <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit"
          xid="labelSelect1"> 
          <label class="x-label x-label-w" xid="label3" bind-text="detailData.label('fProductName')"/>  
          <select component="$UI/system/components/justep/select/select" class="form-control x-edit"
            xid="select1" bind-ref="detailData.ref('fProductCode')" bind-labelRef="detailData.ref('fProductName')"
            bind-options="productData" bind-optionsCaption="选择产品" bind-optionsLabel="fProductName"
            bind-optionsValue="fProductCode"/> 
        </div>  
        <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit"
          xid="labelInput1"> 
          <label class="x-label x-label-w" xid="label4" bind-text="detailData.label('fUnitprice')"/>  
          <input component="$UI/system/components/justep/input/input" class="form-control x-edit"
            xid="input1" bind-ref="detailData.ref('fUnitprice')"/> 
        </div>  
        <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit"
          xid="labelInput2"> 
          <label class="x-label x-label-w" xid="label5" bind-text="detailData.label('fQuantity')"/>  
          <input component="$UI/system/components/justep/input/input" class="form-control x-edit"
            xid="input2" bind-ref="detailData.ref('fQuantity')"/> 
        </div>  
        <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit"
          xid="labelInput4"> 
          <label class="x-label x-label-w" xid="label7" bind-text="detailData.label('fDisCount')"/>  
          <input component="$UI/system/components/justep/input/input" class="form-control x-edit"
            xid="input4" bind-ref="detailData.ref('fDisCount')"/> 
        </div>  
        <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit"
          xid="labelOutput3"> 
          <label class="x-label x-label-w" xid="label8" bind-text="detailData.label('fFactAmt')"/>  
          <div component="$UI/system/components/justep/output/output" class="x-output x-edit"
            xid="output3" bind-ref="detailData.ref('fFactAmt')"/> 
        </div> 
      </div>  
      </div> 
  </div>  
  <span component="$UI/system/components/justep/windowReceiver/windowReceiver" xid="windowReceiver" style="left:567px;top:81px;" onReceive="windowReceiverReceive"></span></div>
