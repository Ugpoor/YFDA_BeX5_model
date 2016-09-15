<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" component="$UI/system/components/justep/window/window" design="device:m;"
  xid="window" class="window">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="left:18px;top:83px;height:244px;"> 
    <div component="$UI/system/components/justep/data/data" autoLoad="true"
      xid="data1" idColumn="col0"> 
      <column name="col0" type="String" xid="xid1"/>  
      <column name="col1" type="String" xid="xid2"/>  
      <column name="col2" type="String" xid="xid3"/>  
      <data xid="default1">[{}]</data> 
    </div> 
  </div>  
  <div component="$UI/system/components/justep/panel/panel" class="x-panel x-full"
    xid="panel1"> 
    <div class="x-panel-top" xid="top1"> 
      <div component="$UI/system/components/justep/titleBar/titleBar" title="地址选择"
        class="x-titlebar"> 
        <div class="x-titlebar-left"> 
          <a component="$UI/system/components/justep/button/button" label=""
            class="btn btn-link btn-only-icon" icon="icon-chevron-left" onClick="{operation:'window.close'}"
            xid="backBtn"> 
            <i class="icon-chevron-left"/>  
            <span/> 
          </a> 
        </div>  
        <div class="x-titlebar-title">地址选择</div>  
        <div class="x-titlebar-right reverse"/> 
      </div> 
    </div>  
    <div class="x-panel-content" xid="content1"> 
      <div component="$UI/system/components/justep/controlGroup/controlGroup"
        class="x-control-group" xid="controlGroup1"> 
        <div class="x-control-group-title" xid="controlGroupTitle1"> 
          <span xid="span1">title</span> 
        </div>  
        <div component="$UI/system/components/justep/distpicker/distpicker"
          class="form-inline" bind-provinceRef="data1.ref('col0')" bind-cityRef="data1.ref('col1')"
          bind-districtRef="data1.ref('col2')"> 
          <select class="form-control" component="$UI/system/components/justep/distpicker/provinceSelect"
            bind-ref="data1.ref('col0')"/>  
          <select class="form-control" component="$UI/system/components/justep/distpicker/citySelect"
            bind-provinceRef="data1.ref('col0')" bind-ref="data1.ref('col1')"/>  
          <select class="form-control" component="$UI/system/components/justep/distpicker/districtSelect"
            bind-cityRef="data1.ref('col1')" bind-ref="data1.ref('col2')"/> 
        </div>  
        <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label10"
          xid="labelEdit1"> 
          <label class="x-label" xid="label1"><![CDATA[省]]></label>  
          <div class="x-edit" xid="div1"> 
            <select class="form-control" component="$UI/system/components/justep/distpicker/provinceSelect"
              bind-ref="data1.ref('col0')"/> 
          </div> 
        </div>  
        <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label10"
          xid="labelEdit2"> 
          <label class="x-label" xid="label2"><![CDATA[市]]></label>  
          <div class="x-edit" xid="div2"> 
            <select class="form-control" component="$UI/system/components/justep/distpicker/citySelect"
              bind-provinceRef="data1.ref('col0')" bind-ref="data1.ref('col1')"/> 
          </div> 
        </div>  
        <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label10"
          xid="labelEdit3"> 
          <label class="x-label" xid="label3"><![CDATA[县]]></label>  
          <div class="x-edit" xid="div3"> 
            <select class="form-control" component="$UI/system/components/justep/distpicker/districtSelect"
              bind-cityRef="data1.ref('col1')" bind-ref="data1.ref('col2')"/> 
          </div> 
        </div>  
        <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label10"
          xid="labelEdit4"> 
          <label class="x-label" xid="label4"><![CDATA[地址]]></label>  
          <input component="$UI/system/components/justep/input/input" class="form-control x-edit"
            xid="input1" bind-click="input1Click" readonly="true" placeHolder="点击选择地名"/>
        </div>
      </div> 
    </div> 
  </div>
  
    <div component="$UI/system/components/justep/distpicker/distpicker2" class="x-popPicker"
      xid="distPicker2" dismissible="true" onOK="doOK" style="left:39px;top:11px;">
      <div class="x-popPicker-overlay"/>  
      <div class="x-popPicker-content"> 
        <div class="x-poppicker-header"> 
          <button class="btn btn-default x-btn-ok">确定 </button>
        </div>
      </div>  
    </div> 

    </div>
