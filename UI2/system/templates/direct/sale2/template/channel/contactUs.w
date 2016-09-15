<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" component="$UI/system/components/justep/window/window" xid="window" design="device:mobile">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="left:18px;top:83px;height:244px;"> 
    <div component="$UI/system/components/justep/data/data" autoLoad="true"
      xid="data" idColumn="id"> 
      <column label="id" name="id" type="String"/>  
      <column label="title" name="title" type="String"/>  
      <column label="companyName" name="companyName" type="String"/>  
      <column label="地址" name="address" type="String"/>  
      <column label="电话" name="tel" type="String"/>  
      <column label="邮编" name="postalCode" type="String"/>  
      <column label="网址" name="website" type="String"/>  
      <column label="邮箱" name="email" type="String"/>  
      <data xid="default2">[{"id":"1","title":"联系我们","companyName":"北京起步科技有限公司","address":"北京市朝阳区东三环南路98号高和蓝峰大厦18层","tel":"(010)2883925","postalCode":"111111","website":"http://www.justep.com","email":"justep@justep.com.cn"}]</data> 
    </div> 
  </div>  
  <div component="$UI/system/components/justep/panel/panel" class="x-panel x-full"> 
    <div class="x-panel-top"> 
      <div component="$UI/system/components/justep/titleBar/titleBar" title="联系我们"
        class="x-titlebar"> 
        <div class="x-titlebar-left"> 
          <a component="$UI/system/components/justep/button/button" label=""
            class="btn btn-link btn-only-icon" icon="icon-chevron-left" onClick="backBtnClick"
            xid="backBtn"> 
            <i class="icon-chevron-left"/>  
            <span/> 
          </a> 
        </div>  
        <div class="x-titlebar-title">联系我们</div>  
        <div class="x-titlebar-right reverse"/> 
      </div> 
    </div>  
    <div class="x-panel-content panel-body"> 
      <h4 bind-text="data.ref('companyName')" xid="h42"/>  
      <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label15"
        xid="labelOutput1"> 
        <label class="x-label" xid="label1" bind-text="data.label('address')"/>  
        <div component="$UI/system/components/justep/output/output" class="x-output x-edit"
          xid="output2" bind-ref="data.ref('address')"/>
      </div>  
      <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label15"
        xid="labelOutput2"> 
        <label class="x-label" xid="label2" bind-text="data.label('tel')"/>  
        <div component="$UI/system/components/justep/output/output" class="x-output x-edit"
          xid="output3" bind-ref="data.ref('tel')"/>
      </div>  
      <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label15"
        xid="labelOutput3"> 
        <label class="x-label" xid="label3" bind-text="data.label('postalCode')"/>  
        <div component="$UI/system/components/justep/output/output" class="x-output x-edit"
          xid="output4" bind-ref="data.ref('postalCode')"/>
      </div>  
      <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label15"
        xid="labelOutput4"> 
        <label class="x-label" xid="label4" bind-text="data.label('website')"/>  
        <div component="$UI/system/components/justep/output/output" class="x-output x-edit"
          xid="output5" bind-ref="data.ref('website')"/>
      </div>  
      <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label15"
        xid="labelOutput5"> 
        <label class="x-label" xid="label5" bind-text="data.label('email')"/>  
        <div component="$UI/system/components/justep/output/output" class="x-output x-edit"
          xid="output6" bind-ref="data.ref('email')"/>
      </div>
    </div> 
  </div> 
</div>
