<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window" component="$UI/system/components/justep/window/window"
  design="device:m;">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:138px;top:4px;"> 
    <div component="$UI/system/components/justep/data/data" autoLoad="true"
      xid="addressata" idColumn="address"> 
      <column label="预约地址：" name="address" type="String" xid="xid1"/>  
      <data xid="default1">[{"address":"朝阳区"},{"address":"昌平区"},{"address":"丰台区"},{"address":"东城区"},{"address":"西城区"}]</data> 
    </div>  
    <div component="$UI/system/components/justep/data/data" autoLoad="true"
      xid="VIPData" idColumn="VIP"> 
      <column label="你是否是会员：" name="VIP" type="String" xid="xid2"/>  
      <data xid="default2">[{"VIP":"我是会员"},{"VIP":"我不是会员"}]</data>
    </div>  
    <div component="$UI/system/components/justep/data/data" autoLoad="true"
      xid="timeData" idColumn="time"> 
      <column label="预约时间：" name="time" type="String" xid="xid3"/>  
      <data xid="default3">[{"time":"9：00-10：00"},{"time":"10：00-11：00"},{"time":"11：00-12：00"},{"time":"14：00-15：00"},{"time":"15：00-16：00"},{"time":"16：00-17：00"}]</data> 
    </div> 
  </div>  
  <img src="" alt="" xid="image1" style="width:100%;" bind-attr-src=' $model.toUrl("./img/1.jpg")'/>  
  <div component="$UI/system/components/justep/controlGroup/controlGroup" class="x-control-group"
    title="【欢迎报名】" xid="controlGroup3" style="margin-top:30px;"> 
    <div class="x-control-group-title" xid="controlGroupTitle3"> 
      <span xid="span3" style="font-size:18px;"><![CDATA[起步软件]]></span> 
    </div>  
    <div xid="div1" style="font-size:16px;margin-top:20px;margin-left:10px;">如需帮助请联系服务人员，拨打XXXXXXX</div>  
    <div component="$UI/system/components/justep/row/row" style="margin-top:20px;font-size:16px;"
      class="x-row" xid="row1"> 
      <div class="x-col x-col-fixed" xid="col1" style="width:auto;"> 
        <label xid="label1" bind-text="addressata.label('address')">label</label> 
      </div>  
      <div class="x-col" xid="col3"> 
        <select component="$UI/system/components/justep/select/select" class="form-control"
          style="margin-top:-5px;" xid="select1" bind-options="addressata" bind-optionsValue="address"
          bind-optionsLabel="address" bind-labelRef="addressata.ref('address')" bind-ref="addressata.ref('address')"/> 
      </div> 
    </div>  
    <div component="$UI/system/components/justep/row/row" class="x-row" xid="row2"> 
      <div class="x-col x-col-fixed" xid="col4" style="width:auto;"> 
        <label xid="label2" bind-text="VIPData.label('VIP')" style="font-size:16px;">label</label> 
      </div>  
      <div class="x-col" xid="col18"> 
        <span component="$UI/system/components/justep/select/radioGroup" class="x-radio-group x-radio-group-vertical"
          xid="radioGroup5" bind-itemset="VIPData" bind-itemsetValue="ref('VIP')"
          bind-itemsetLabel="ref('VIP')" style="font-size:16px;"/>
      </div>
    </div>  
    <div component="$UI/system/components/justep/row/row" style="font-size:16px;"
      class="x-row" xid="row4"> 
      <div class="x-col x-col-fixed" xid="col10" style="width:auto;"> 
        <label xid="label4" style="font-size:16px;"><![CDATA[预约日期：]]></label> 
      </div>  
      <div class="x-col" xid="col11"> 
        <input component="$UI/system/components/justep/input/input" class="form-control"
          xid="dateInput" dataType="Date" style="font-size:16px;margin-top:-5px;background-color:#FFFFFF;"
          placeHolder="请选择日期"/> 
      </div> 
    </div>  
    <div component="$UI/system/components/justep/row/row" style="font-size:16px;"
      class="x-row" xid="row5"> 
      <div class="x-col x-col-fixed" xid="col17" style="width:auto;">
        <label xid="label5" style="font-size:16px;"><![CDATA[预约时间：]]></label>
      </div>  
      <div class="x-col" xid="col12"> 
        <span component="$UI/system/components/justep/select/radioGroup" class="x-radio-group x-radio-group-vertical"
          xid="radioGroup4" bind-itemset="$model.timeData" bind-itemsetValue="ref('time')"
          bind-itemsetLabel="ref('time')"/>
      </div>
    </div>  
    <div component="$UI/system/components/justep/row/row" class="x-row" xid="row6"
      style="margin-bottom：20px;"> 
      <div class="x-col x-col-fixed" xid="col14" style="width:auto;">
        <label xid="label6" style="font-size:16px;"><![CDATA[备注：]]></label>
      </div>  
      <div class="x-col" xid="col15">
        <textarea component="$UI/system/components/justep/textarea/textarea" class="form-control"
          xid="desc" style="height:80px;"/>
      </div> 
    </div>
  <a component="$UI/system/components/justep/button/button" class="btn btn-success center-block" label="预约" xid=" bespokeBtn">
   <i xid="i1"></i>
   <span xid="span1">预约</span></a></div> 
</div>
