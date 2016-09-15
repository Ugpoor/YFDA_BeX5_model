<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" component="$UI/system/components/justep/window/window" design="device:mobile"
  xid="window">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:16px;top:246px;">
    <div component="$UI/system/components/justep/data/baasData" xid="{{data_xid}}"
      directDelete="true" autoLoad="true" idColumn="{{column_id}}"
      onSaveCommit="saveCommit"
      queryAction="{{query_action}}" tableName="{{table}}" url="{{service_url}}" saveAction="{{save_action}}"
      confirmRefresh="false" limit="10">
      <column isCalculate="true" label="选择" name="calcCheckBox" type="Boolean" xid="calcCheckBox"/>{{#each columns}}
      <column label="{{column_label}}" name="{{column_name}}" type="{{column_type}}"
        xid="{{column_xid}}"/>{{/each}}
     
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
        <div class="x-titlebar-right reverse"> 
          <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-only-icon"> 
            <i class="icon-edit"/> 
          </a> 
        <a component="$UI/system/components/justep/button/button" class="btn btn-default" label="保存" xid="save" onClick="{operation:'{{data_xid}}.save'}">
   <i xid="i1"></i>
   <span xid="span1">保存</span></a></div> 
      </div> 
    </div>  
    <div class="x-panel-content"> 
      <div xid="mainList" class="x-list" component="$UI/system/components/justep/list/list"
        data="{{data_xid}}" limit="6"> 
        <div class="x-list-head"/>  
        <ul class="x-list-template"> 
          <li> 
            <div component="$UI/system/components/justep/row/row" class="x-row x-row-center"> 
              <div class="x-col" style="text-align: left;"> 
                <span component="$UI/system/components/justep/button/checkbox"
                  bind-ref="ref('calcCheckBox')" class="x-checkbox"/> 
              </div>  
              <div component="$UI/system/components/justep/row/row" class="x-col x-col-90">{{#each columns}} 
                <div class="x-row" component="$UI/system/components/justep/row/row"> 
                  <div class="x-col"> 
                    <span class="font-bold x-output" component="$UI/system/components/justep/output/output"
                      data="{{data_xid}}" bind-ref="ref('{{column_name}}')"/> 
                  </div> {{#if list_field2}}
                  <div class="x-col" style="text-align:right;color:gray"> 
                    <span class="x-output" component="$UI/system/components/justep/output/output"
                      data="{{data_xid}}" bind-ref="ref('{{column_name2}}')"/> 
                  </div>{{/if}}
                </div>{{/each}}
              </div>  
              <div class="x-col font-gray" style="text-align: right"> 
                <a component="$UI/system/components/justep/button/button"
                  label="" class="btn btn-only-icon" icon="icon-chevron-right" xid="editBtn"> 
                  <i class="icon-chevron-right"/>  
                  <span/> 
                </a> 
              </div> 
            </div> 
          </li> 
        </ul> 
      </div> 
    </div>  
    <div class="x-panel-bottom"> 
      <div class="btn-group-lg btn-group-justified" component="$UI/system/components/justep/button/buttonGroup"> 
        <a component="$UI/system/components/justep/button/button" class="btn btn-default" onClick="okEditClick"> 
          <i/>  
          <span>删除</span> 
        </a>  
        <a component="$UI/system/components/justep/button/button" class="btn btn-default" onClick="cancelEditClick" label="取消"> 
          <i/>  
          <span>取消</span> 
        </a> 
      </div> 
    </div> 
  </div> 
</div>
