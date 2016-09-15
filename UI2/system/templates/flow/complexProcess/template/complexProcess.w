<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" component="$UI/system/components/justep/window/window" design="device:m;"
  xid="window">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="left:18px;top:83px;height:244px;">{{#each datas}}
    <div component="$UI/system/components/justep/data/bizData" xid="{{data_xid}}"
      directDelete="true" autoLoad="false" concept="{{data_concept}}" orderBy="{{data_orderBy}}"
      columns="{{data_relations}}" onSaveCommit="saveCommit" autoNew="true" isTree="false"> 
      <reader action="{{data_reader}}"/>  
      <writer action="{{data_writer}}"/>  
      <creator action="{{data_creator}}"/>  
      <calculateRelation relation="calcCheckBox"/> 
    </div>{{/each}}{{#each detaildatas}}
    <div component="$UI/system/components/justep/data/bizData" xid="{{data_xid}}"
      directDelete="true" autoLoad="true" concept="{{data_concept}}" columns="{{data_relations}}"
      autoNew="false"> 
      <reader action="{{data_reader}}"/>  
      <writer action="{{data_writer}}"/>  
      <creator action="{{data_creator}}"/>  
      <master xid="default1" data="mainData" relation="{{masterColumn}}"/> 
    </div>{{/each}}
  </div>  
  <div component="$UI/system/components/justep/process/process" xid="process"
    data="{{form_data}}"/>  
  <div component="$UI/system/components/justep/popMenu/popMenu" class="x-popMenu"
    xid="processMenu"> 
    <div class="x-popMenu-overlay" xid="div4"/>  
    <ul component="$UI/system/components/justep/menu/menu" class="x-menu dropdown-menu x-popMenu-content"
      xid="menu1"> 
      <li class="x-menu-item" xid="item2"> 
        <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
          xid="addButton" onClick="detailAdd" icon="icon-eye" label="查看"> 
          <i xid="i5" class="icon-eye"/>  
          <span xid="span5">查看</span> 
        </a> 
      </li>  
      <li class="x-menu-divider divider" xid="divider1"/>  
      <li class="x-menu-item" xid="item1"> 
        <a component="$UI/system/components/justep/button/button" class="btn btn-link"
          label="回退" xid="backButton" onClick="{operation:'process.back'}"> 
          <i xid="i21"/>  
          <span xid="span21">回退</span> 
        </a> 
      </li>  
      <li class="x-menu-divider divider" xid="divider2"/>  
      <li class="x-menu-item" xid="item3"> 
        <a component="$UI/system/components/justep/button/button" class="btn btn-link"
          label="终止" xid="abortButton" onClick="{operation:'process.abort'}"> 
          <i xid="i6"/>  
          <span xid="span6">终止</span> 
        </a> 
      </li>  
      <li class="x-menu-divider divider" xid="divider3"/>  
      <li class="x-menu-item" xid="item4"> 
        <a component="$UI/system/components/justep/button/button" class="btn btn-link"
          label="流程图" xid="showChart" onClick="{operation:'process.showChart'}"> 
          <i xid="i17"/>  
          <span xid="span7">流程图</span> 
        </a> 
      </li> 
    </ul> 
  </div>  
  <div component="$UI/system/components/justep/contents/contents" class="x-contents x-full"
    active="0" xid="contents"> 
    <div class="x-contents-content" xid="mainView"> 
      <div component="$UI/system/components/justep/panel/panel" class="x-panel x-full"> 
        <div class="x-panel-top"> 
          <div component="$UI/system/components/justep/titleBar/titleBar" title="{{form_title}}"
            class="x-titlebar"> 
            <div class="x-titlebar-left"> 
              <a component="$UI/system/components/justep/button/button" label=""
                class="btn btn-link btn-only-icon" icon="icon-chevron-left" onClick="{operation:'window.close'}"
                xid="backBtn"> 
                <i class="icon-chevron-left"/>  
                <span/> 
              </a> 
            </div>  
            <div class="x-titlebar-title">{{form_title}}</div>  
            <div class="x-titlebar-right reverse"> 
              <a component="$UI/system/components/justep/button/button" class="btn btn-link"
                label="" xid="moreBtn" icon="icon-android-more" onClick="moreBtnClick"> 
                <i xid="i1" class="icon-android-more"/>  
                <span xid="span1"/> 
              </a>  
              <a component="$UI/system/components/justep/button/button" class="btn btn-link"
                label="流转" xid="button2" onClick="{operation:'process.advance'}"> 
                <i xid="i2"/>  
                <span xid="span2">流转</span> 
              </a> 
            </div> 
          </div> 
        </div>  
        <div class="x-panel-content"> 
          <div component="$UI/system/components/justep/controlGroup/controlGroup"
            class="x-control-group" title="详细信息"> 
            <div class="x-control-group-title">详细信息</div> {{#each form}} 
            <div component="$UI/system/components/justep/labelEdit/labelEdit"
              class="x-label-edit x-label20"> 
              <label class="x-label left" bind-text="{{form_data}}.label('{{form_field}}')"
                xid="M{{form_field}}L"/>  
              <div class="x-edit">{{#if form_selectDataID}} 
                <select class="form-control" component="$UI/system/components/justep/select/select"
                  bind-ref="{{form_data}}.ref('{{form_refID}}')" bind-labelRef="{{form_data}}.ref('{{form_field}}')"
                  bind-options="{{form_selectDataID}}" bind-optionsLabel="{{form_selectLabelName}}"
                  bind-optionsValue="{{form_selectConcept}}" bind-optionsCaption="请选择..."
                  xid="M{{form_field}}"/>{{else}}{{#if form_password}}
                <input component="$UI/system/components/justep/input/password"
                  xid="M{{form_field}}" class="form-control x-edit" bind-ref="{{form_data}}.ref('{{form_field}}')"/>{{/if}}{{#if form_range}}
                <input component="$UI/system/components/justep/input/range" class="x-edit"
                  xid="M{{form_field}}" bind-ref="{{form_data}}.ref('{{form_field}}')"
                  min="-10000" max="10000"/>{{/if}}{{#if form_output}}
                <div component="$UI/system/components/justep/output/output"
                  class="x-output" bind-ref="{{form_data}}.ref('{{form_field}}')"
                  xid="M{{form_field}}"/>{{/if}}{{#if form_textarea}}
                <textarea class="form-control" component="$UI/system/components/justep/textarea/textarea"
                  xid="M{{form_field}}" bind-ref="{{form_data}}.ref('{{form_field}}')"/> {{/if}}{{#if form_input}}
                <input class="form-control" component="$UI/system/components/justep/input/input"
                  xid="M{{form_field}}" bind-ref="{{form_data}}.ref('{{form_field}}')"/>{{/if}}{{/if}}
              </div> 
            </div>{{/each}}
          </div> 
        </div> 
      </div> 
    </div>  
    <div class="x-contents-content" xid="detailView"> 
      <div component="$UI/system/components/justep/panel/panel" class="x-panel x-full"
        xid="panel1"> 
        <div class="x-panel-top" xid="top1"> 
          <div component="$UI/system/components/justep/titleBar/titleBar" class="x-titlebar"
            xid="titleBar1" title="{{detail_title}}"> 
            <div class="x-titlebar-left" xid="div1"> 
              <a component="$UI/system/components/justep/button/button" class="btn btn-link"
                xid="button1" onClick="returnMainView" icon="icon-chevron-left"> 
                <i xid="i3" class="icon-chevron-left"/>  
                <span xid="span3"/> 
              </a> 
            </div>  
            <div class="x-titlebar-title" xid="div2">{{detail_title}}</div>  
            <div class="x-titlebar-right reverse" xid="div3"> 
              <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-only-icon"
                label="" xid="button3" onClick="{operation:'{{detail_data}}.new'}"> 
                <i xid="i4"/>  
                <span xid="span8"/> 
              </a>  
              <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-only-icon"
                xid="button4" onClick="{operation:'{{detail_data}}.save'}"> 
                <i xid="i8"/>  
                <span xid="span9"/> 
              </a> 
            </div> 
          </div> 
        </div>  
        <div class="x-panel-content" xid="content1"> 
          <div component="$UI/system/components/justep/controlGroup/controlGroup"
            class="x-control-group" title="title" xid="controlGroup1"> 
            <div class="x-control-group-title" xid="controlGroupTitle1"> 
              <span xid="span4">title</span> 
            </div>  
            <div component="$UI/system/components/justep/list/list" class="x-list"
              xid="list" data="{{detail_data}}"> 
              <div class="x-list-template" xid="listTemplateUl1"> 
                <div component="$UI/system/components/justep/row/row" class="x-row x-order-detail"
                  xid="row1"> 
                  <div class="x-col" xid="col1">{{#each detail}} 
                    <div component="$UI/system/components/justep/labelEdit/labelEdit"
                      class="x-label-edit x-label20"> 
                      <label class="x-label left" bind-text="label('{{detail_field}}')"
                        xid="{{detail_field}}L"/>  
                      <div class="x-edit">{{#if detail_selectDataID}} 
                        <select class="form-control" component="$UI/system/components/justep/select/select"
                          bind-ref="ref('{{detail_refID}}')" bind-labelRef="ref('{{detail_field}}')"
                          bind-options="{{detail_selectDataID}}" bind-optionsLabel="{{detail_selectLabelName}}"
                          bind-optionsValue="{{detail_selectConcept}}" bind-optionsCaption="请选择..."
                          xid="{{detail_field}}"/>{{else}}{{#if detail_password}}
                        <input component="$UI/system/components/justep/input/password"
                          xid="{{detail_field}}" class="form-control x-edit" bind-ref="ref('{{detail_field}}')"/>{{/if}}{{#if detail_range}}
                        <input component="$UI/system/components/justep/input/range"
                          class="x-edit" bind-ref="ref('{{detail_field}}')" xid="{{detail_field}}"
                          min="-10000" max="10000"/>{{/if}}{{#if detail_output}}
                        <div component="$UI/system/components/justep/output/output" class="x-output"
                          xid="{{detail_field}}" bind-ref="ref('{{detail_field}}')"/>{{/if}}{{#if detail_textarea}}
                        <textarea class="form-control" component="$UI/system/components/justep/textarea/textarea"
                          xid="{{detail_field}}" bind-ref="ref('{{detail_field}}')"/> {{/if}}{{#if detail_input}}
                        <input class="form-control" component="$UI/system/components/justep/input/input"
                          xid="{{detail_field}}" bind-ref="ref('{{detail_field}}')"/>{{/if}}{{/if}}
                      </div> 
                    </div>{{/each}}
                  </div>  
                  <div xid="col2" class="x-col x-col-10 x-col-center"> 
                    <i xid="i7" class="icon-close row-icon" style="color:#FF0000;"
                      bind-click="deleteBtn"/> 
                  </div> 
                </div> 
              </div> 
            </div> 
          </div> 
        </div> 
      </div> 
    </div> 
  </div> 
</div>
