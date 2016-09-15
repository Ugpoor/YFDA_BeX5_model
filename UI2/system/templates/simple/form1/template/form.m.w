<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" component="$UI/system/components/justep/window/window" design="device:m;" xid="window">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="left:18px;top:83px;height:244px;">{{#each datas}}
    <div component="$UI/system/components/justep/data/bizData" xid="{{data_xid}}"
      directDelete="true" autoLoad="true" concept="{{data_concept}}" orderBy="{{data_orderBy}}"
      columns="{{data_relations}}" onSaveCommit="saveCommit"> 
      <reader action="{{data_reader}}"/>  
      <writer action="{{data_writer}}"/>  
      <creator action="{{data_creator}}"/>  
    </div>{{/each}}
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
            <span></span> 
          </a> 
        </div>  
        <div class="x-titlebar-title">标题</div>  
        <div class="x-titlebar-right reverse"/> 
      </div> 
    </div>  
    <div class="x-panel-content"> 
      <div component="$UI/system/components/justep/controlGroup/controlGroup"
        class="x-control-group" title="详细信息"> 
        <div class="x-control-group-title">详细信息</div> {{#each form}} 
        <div component="$UI/system/components/justep/labelEdit/labelEdit"
                    class="x-label-edit x-label20"> 
                    <label class="x-label left" bind-text="$model.{{form_data}}.label('{{form_field}}')"/>  
                    <div class="x-edit"> 
                    {{#if form_selectDataID}}<select class="form-control" component="$UI/system/components/justep/select/select"
                 		bind-ref="{{form_data}}.ref('{{form_refID}}')" bind-labelRef="{{form_data}}.ref('{{form_field}}')"
                 		bind-options="{{form_selectDataID}}" bind-optionsLabel="{{form_selectLabelName}}" bind-optionsValue="{{form_selectConcept}}"
                		bind-optionsCaption="请选择..."/>{{else}}{{#if form_password}}
                		<input component="$UI/system/components/justep/input/password" class="form-control x-edit"
   					     data="{{form_data}}" bind-ref="{{form_data}}.ref('{{form_field}}')"/>{{/if}}{{#if form_range}}
                		<input component="$UI/system/components/justep/input/range"
 					    class="x-edit" bind-ref="{{form_data}}.ref('{{form_field}}')" min="-10000" max="10000"/>{{/if}}{{#if form_output}}
 					    <span class="x-output" component="$UI/system/components/justep/output/output"
        	             data="{{form_data}}" bind-ref="{{form_data}}.ref('{{form_field}}')"/>{{/if}}{{#if form_textarea}}
 					   <textarea class="form-control" component="$UI/system/components/justep/textarea/textarea"
                  	  data="{{form_data}}" bind-ref="{{form_data}}.ref('{{form_field}}')"/> {{/if}}{{#if form_input}}
                  	  <input class="form-control" component="$UI/system/components/justep/input/input"
                  		data="{{form_data}}" bind-ref="{{form_data}}.ref('{{form_field}}')"/>{{/if}}{{/if}} 
                    </div> 
                  </div>{{/each}}
      </div> 
    </div> 
  </div> 
</div>
