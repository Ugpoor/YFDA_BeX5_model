<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" component="$UI/system/components/justep/window/window" design="device:m;"
  xid="window">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:16px;top:246px;">{{#each datas}}
    <div component="$UI/system/components/justep/data/bizData" xid="{{data_xid}}"
      directDelete="true" autoLoad="true" concept="{{data_concept}}" orderBy="{{data_orderBy}}"
      columns="{{data_relations}}"> 
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
            <span/> 
          </a> 
        </div>  
        <div class="x-titlebar-title">标题</div>  
        <div class="x-titlebar-right reverse"/> 
      </div> 
    </div>  
    <div class="x-panel-content"> 
      <div xid="mainList" class="x-list" component="$UI/system/components/justep/list/list"
        data="{{list_data}}" limit="-1"> 
        <div class="x-list-head"/>  
        <ul class="x-list-template"> 
          <li>{{#each list}} 
            <div class="x-row" component="$UI/system/components/justep/row/row"> 
              <div class="x-col"> 
                <div component="$UI/system/components/justep/output/output"
                  class="x-output" xid="{{list_field1}}" bind-ref="ref('{{list_field1}}')"/> 
              </div> {{#if list_field2}}
              <div class="x-col" style="text-align:right;color:gray"> 
                <div component="$UI/system/components/justep/output/output"
                  class="x-output" xid="{{list_field2}}" bind-ref="ref('{{list_field2}}')"/> 
              </div>{{/if}}
            </div>{{/each}}
          </li> 
        </ul> 
      </div> 
    </div> 
  </div> 
</div>
