<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window" component="$UI/system/components/justep/window/window"
  design="device:pc;">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:260px;top:346px;"> 
    <div component="$UI/system/components/justep/data/bizData" xid="orderDetailData"
      concept="DEMO_OrderDetail" limit="1"> 
      <reader xid="default1" action="/demo/misc/logic/action/queryOrder_DAction"/>  
      <writer xid="default2" action="/demo/misc/logic/action/saveOrder_DAction"/>  
      <creator xid="default3" action="/demo/misc/logic/action/createOrder_DAction"/> 
    </div>  
    <div component="$UI/system/components/justep/data/bizData" xid="productData"
      concept="DEMO_Product">
      <reader xid="default4" action="/demo/misc/logic/action/queryProductAction"/>
    </div>
  </div>  
  <span component="$UI/system/components/justep/windowReceiver/windowReceiver"
    xid="windowReceiver" onReceive="windowReceiverReceive"/>  
  <div xid="view"> 
    <div class="form-horizontal container-fluid" component="$UI/system/components/bootstrap/form/form"> 
      <div class="form-group" xid="formGroup1"> 
        <div class="col-sm-2" xid="col1"> 
          <label class="control-label" xid="productL">产品</label> 
        </div>  
        <div class="col-sm-10" xid="col2"> 
          <div class="x-gridSelect" component="$UI/system/components/justep/gridSelect/gridSelect"
            xid="product" bind-ref="orderDetailData.ref('fProductCode')" bind-labelRef="orderDetailData.ref('fProductName')"> 
            <option xid="productOption" data="productData" value="fProductCode"
              label="fProductName"/>
          </div>
        </div> 
      </div>  
      <div class="form-group" xid="formGroup2"> 
        <div class="col-sm-2" xid="col3"> 
          <label class="control-label" xid="priceL">单价</label> 
        </div>  
        <div class="col-sm-10" xid="col4"> 
          <input component="$UI/system/components/justep/input/input" class="form-control"
            bind-ref="orderDetailData.ref('fUnitprice')" xid="price"/> 
        </div> 
      </div>  
      <div class="form-group" xid="formGroup3"> 
        <div class="col-sm-2" xid="col5"> 
          <label class="control-label" xid="quantityL">数量</label> 
        </div>  
        <div class="col-sm-10" xid="col6"> 
          <input component="$UI/system/components/justep/input/input" class="form-control"
            bind-ref="orderDetailData.ref('fQuantity')" xid="quantity"/> 
        </div> 
      </div>  
      <div class="form-group" xid="formGroup4"> 
        <div class="col-sm-2" xid="col7"> 
          <label class="control-label" xid="disCountL">折扣率</label> 
        </div>  
        <div class="col-sm-10" xid="col8"> 
          <input component="$UI/system/components/justep/input/input" class="form-control"
            bind-ref="orderDetailData.ref('fDisCount')" xid="disCount"/> 
        </div> 
      </div>  
      <div class="form-group" xid="formGroup5"> 
        <div class="col-sm-2" xid="col9"> 
          <label class="control-label" xid="factAmtL">实际金额</label> 
        </div>  
        <div class="col-sm-10" xid="col10"> 
          <input component="$UI/system/components/justep/input/input" class="form-control"
            bind-ref="orderDetailData.ref('fFactAmt')" xid="factAmt"/> 
        </div> 
      </div>  
      <div class="x-panel-bottom" 
        xid="dialogBar">
		<a class="btn btn-link btn-only-label x-dialog-button" component="$UI/system/components/justep/button/button"
			label="取消" onClick="cancelBtnClick" xid="cancelBtn">
			<i xid="i4_1" />
			<span xid="span4_1">取消</span>
		</a>
		<a class="btn btn-primary btn-only-label x-dialog-button" component="$UI/system/components/justep/button/button"
			label="确定" onClick="okBtnClick" 
			xid="okBtn">
			<i xid="i3_1" />
			<span xid="span3_1">确定</span>
		</a>
      </div> 
    </div> 
  </div> 
</div>
