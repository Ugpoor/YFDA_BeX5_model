<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" component="$UI/system/components/justep/window/window" design="device:mobile"
  xid="window">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="left:18px;top:83px;height:244px;">
    <div component="$UI/system/components/justep/data/baasData" xid="{{data_xid}}"
      directDelete="true" autoLoad="true" idColumn="{{column_id}}"
      onSaveCommit="saveCommit"
      queryAction="{{query_action}}" tableName="{{table}}" url="{{service_url}}" saveAction="{{save_action}}">{{#each columns}}
      <column label="{{column_label}}" name="{{column_name}}" type="{{column_type}}"
        xid="{{column_xid}}"/>{{/each}}
    	<rule xid="rule1">
	   <col name="fID" xid="ruleCol1">
	    <calculate xid="calculate1">
	     <expr xid="default2">justep.UUID.createUUID()</expr></calculate> </col> </rule>
	   </div>
  </div>  
  <div component="$UI/system/components/justep/panel/panel" class="x-panel x-full"> 
    <div class="x-panel-top"> 
      <div component="$UI/system/components/justep/titleBar/titleBar" title="{{list_title}}"
        class="x-titlebar"> 
        <div class="x-titlebar-left"> 
          <a component="$UI/system/components/justep/button/button" label=""
            class="btn btn-link btn-only-icon" icon="icon-chevron-left" onClick="{operation:'window.close'}"
            xid="backBtn"> 
            <i class="icon-chevron-left"/>  
            <span/> 
          </a> 
        </div>  
        <div class="x-titlebar-title">标题</div>  
        <div class="x-titlebar-right reverse"><a component="$UI/system/components/justep/button/button" class="btn btn-default" label="保存" xid="button1" onClick="{operation:'{{data_xid}}.save'}">
   <i xid="i1"></i>
   <span xid="span1">保存</span></a>
  <a component="$UI/system/components/justep/button/button" class="btn btn-default" label="新增" xid="button2" onClick="{operation:'{{data_xid}}.new'}">
   <i xid="i2"></i>
   <span xid="span2">新增</span></a></div> 
      </div> 
    </div>  
    <div class="x-panel-content"> 
      <div component="$UI/system/components/justep/controlGroup/controlGroup"
        class="x-control-group" title="详细信息"> 
        <div class="x-control-group-title">详细信息</div> {{#each columns}}
        <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label20"> 
          <label class="x-label left" bind-text="$model.{{data_xid}}.label('{{column_name}}')"/>  
          <div class="x-edit">{{#if form_selectDataID}} 
            <select class="form-control" component="$UI/system/components/justep/select/select"
              bind-ref="{{data_xid}}.ref('{{form_refID}}')" bind-labelRef="{{data_xid}}.ref('{{column_name}}')"
              bind-options="{{form_selectDataID}}" bind-optionsLabel="{{form_selectLabelName}}"
              bind-optionsValue="{{form_selectConcept}}" bind-optionsCaption="请选择..."/>{{else}}{{#if form_password}}
            <input component="$UI/system/components/justep/input/password" class="form-control x-edit"
              data="{{data_xid}}" bind-ref="{{data_xid}}.ref('{{column_name}}')"/>{{/if}}{{#if form_range}}
            <input component="$UI/system/components/justep/input/range" class="x-edit"
              bind-ref="{{data_xid}}.ref('{{column_name}}')" min="-10000" max="10000"/>{{/if}}{{#if form_output}}
            <span class="x-output" component="$UI/system/components/justep/output/output"
              data="{{data_xid}}" bind-ref="{{data_xid}}.ref('{{column_name}}')"/>{{/if}}{{#if form_textarea}}
            <textarea class="form-control" component="$UI/system/components/justep/textarea/textarea"
              data="{{data_xid}}" bind-ref="{{data_xid}}.ref('{{column_name}}')"/> {{/if}}{{#if form_input}}
            <input class="form-control" component="$UI/system/components/justep/input/input"
              data="{{data_xid}}" bind-ref="{{data_xid}}.ref('{{column_name}}')"/>{{/if}}{{/if}}
          </div> 
        </div>{{/each}}
      </div> 
    </div> 
  </div> 
</div>
