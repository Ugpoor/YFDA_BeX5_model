<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" component="$UI/system/components/justep/window/window" design="device:m;" xid="window">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:488px;top:183px;">{{#each datas}} 
    <div component="$UI/system/components/justep/data/bizData" xid="{{data_xid}}"
      directDelete="true" autoLoad="false" concept="{{data_concept}}" orderBy="{{data_orderBy}}"
      columns="{{data_relations}}" onSaveCommit="saveCommit" autoNew="true"> 
      <reader action="{{data_reader}}"/>  
      <writer action="{{data_writer}}"/>  
      <creator action="{{data_creator}}"/>  
      <calculateRelation relation="calcCheckBox"/> 
    </div>{{/each}}
    <div component="$UI/system/components/justep/data/data" xid="controlData"
      idColumn="edit" autoLoad="true"> 
      <column name="edit" type="Integer"/>  
      <data><![CDATA[
      [{edit:0}]
      ]]></data> 
    </div> 
  </div>  
  <div component="$UI/system/components/justep/popMenu/popMenu" class="x-popMenu"
    xid="processMenu"> 
    <div class="x-popMenu-overlay" xid="div4"/>  
    <ul component="$UI/system/components/justep/menu/menu" class="x-menu dropdown-menu x-popMenu-content"
      xid="menu1"> 
      <li class="x-menu-item" xid="item1"> 
        <a component="$UI/system/components/justep/button/button" label=""
          class="btn btn-link btn-only-icon" icon="icon-edit" onClick="editBtnClick"
          xid="editBtn"> 
          <i class="icon-edit"/>  
          <span/> 
        </a> 
      </li>  
      <li class="x-menu-divider divider" xid="divider1"/>  
      <li class="x-menu-item" xid="item2"> 
        <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-only-icon"
          onClick="addBtnClick" icon="icon-plus"> 
          <i xid="i3" class="icon-plus"/>  
          <span xid="span3"/> 
        </a> 
      </li>  
      <li class="x-menu-divider divider" xid="divider2"/>  
      <li class="x-menu-item" xid="item3"> 
        <a component="$UI/system/components/justep/button/button" class="btn btn-link"
          label="回退" xid="backButton" onClick="{operation:'process.back'}"> 
          <i xid="i2"/>  
          <span xid="span2">回退</span> 
        </a> 
      </li>  
      <li class="x-menu-divider divider" xid="divider3"/>  
      <li class="x-menu-item" xid="item4"> 
        <a component="$UI/system/components/justep/button/button" class="btn btn-link"
          label="终止" xid="abortButton" onClick="{operation:'process.abort'}"> 
          <i xid="i6"/>  
          <span xid="span6">终止</span> 
        </a> 
      </li>  
      <li class="x-menu-divider divider" xid="divider4"/>  
      <li class="x-menu-item" xid="item5"> 
        <a component="$UI/system/components/justep/button/button" class="btn btn-link"
          label="流程图" xid="showChart" onClick="{operation:'process.showChart'}"> 
          <i xid="i7"/>  
          <span xid="span7">流程图</span> 
        </a> 
      </li> 
    </ul> 
  </div>  
  <div component="$UI/system/components/justep/process/process" xid="process"
    data="{{list_data}}"/>  
  <div> 
    <div component="$UI/system/components/justep/contents/contents" class="x-contents x-full"
      active="0" slidable="true" xid="contents"> 
      <div class="x-contents-content active" xid="list"> 
        <div component="$UI/system/components/justep/panel/panel" class="x-panel x-full"> 
          <div class="x-panel-top"> 
            <div component="$UI/system/components/justep/titleBar/titleBar"
              title="{{list_title}}" class="x-titlebar"> 
              <div class="x-titlebar-left"> 
                <a component="$UI/system/components/justep/button/button"
                  label="" class="btn btn-link btn-only-icon" icon="icon-chevron-left"
                  onClick="{operation:'window.close'}" xid="backBtn"> 
                  <i class="icon-chevron-left"/>  
                  <span/> 
                </a> 
              </div>  
              <div class="x-titlebar-title">{{list_title}}</div>  
              <div class="x-titlebar-right reverse"> 
                <a component="$UI/system/components/justep/button/button"
                  class="btn btn-link" xid="button3" icon="icon-android-more" onClick="showMenu"> 
                  <i xid="i4" class="icon-android-more"/>  
                  <span xid="span4"/> 
                </a>  
                <a component="$UI/system/components/justep/button/button"
                  class="btn btn-link" xid="button4" onClick="{operation:'process.advance'}"> 
                  <i xid="i8"/>  
                  <span xid="span8"/> 
                </a> 
              </div> 
            </div> 
          </div>  
          <div class="x-panel-content" refresh="true" load="true"> 
            <div xid="mainList" class="x-list" component="$UI/system/components/justep/list/list"
              data="{{list_data}}" limit="6"> 
              <div class="x-list-head"/>  
              <ul class="x-list-template"> 
                <li> 
                  <div component="$UI/system/components/justep/row/row" class="x-row x-row-center"> 
                    <div class="x-col" style="text-align: left;" bind-visible="$model.controlData.val('edit')==1"> 
                      <span component="$UI/system/components/justep/button/checkbox"
                        bind-ref="ref('calcCheckBox')" class="x-checkbox"/> 
                    </div>  
                    <div component="$UI/system/components/justep/row/row" class="x-col x-col-90"
                      bind-click="showDetailClick">{{#each list}} 
                      <div class="x-row" component="$UI/system/components/justep/row/row"> 
                        <div class="x-col"> 
                          <span class="x-output" component="$UI/system/components/justep/output/output"
                            data="{{list_data}}" bind-ref="ref('{{list_field1}}')" xid="{{list_field1}}"/> 
                        </div> {{#if list_field2}}
                        <div class="x-col" style="text-align:right;color:gray"> 
                          <span class="x-output" component="$UI/system/components/justep/output/output"
                            data="{{list_data}}" bind-ref="ref('{{list_field2}}')" xid="{{list_field2}}"/> 
                        </div>{{/if}}
                      </div>{{/each}}
                    </div>  
                    <div class="x-col font-gray" bind-click="showDetailClick"
                      style="text-align: right"> 
                      <a component="$UI/system/components/justep/button/button"
                        label="" class="btn btn-only-icon" icon="icon-chevron-right"
                        xid="editBtn{{addOne @index}}"> 
                        <i class="icon-chevron-right"/>  
                        <span/> 
                      </a> 
                    </div> 
                  </div> 
                </li> 
              </ul> 
            </div> 
          </div>  
          <div class="x-panel-bottom" bind-visible="$model.controlData.val('edit')==1"> 
            <div class="btn-group-lg btn-group-justified" component="$UI/system/components/justep/button/buttonGroup"> 
              <a component="$UI/system/components/justep/button/button" label="删除"
                class="btn btn-default" onClick="okEditClick"> 
                <i/>  
                <span>删除</span> 
              </a>  
              <a component="$UI/system/components/justep/button/button" label="取消"
                class="btn btn-default" onClick="cancelEditClick"> 
                <i/>  
                <span>取消</span> 
              </a> 
            </div> 
          </div> 
        </div> 
      </div>  
      <div class="x-contents-content" xid="detail"> 
        <div component="$UI/system/components/justep/panel/panel" class="x-panel x-full"> 
          <div class="x-panel-top"> 
            <div component="$UI/system/components/justep/titleBar/titleBar"
              title="{{form_title}}" class="x-titlebar"> 
              <div class="x-titlebar-left"> 
                <a component="$UI/system/components/justep/button/button"
                  label="" class="btn btn-link btn-only-icon" icon="icon-chevron-left"
                  onClick="{operation:'window.close'}" xid="listBtn"> 
                  <i class="icon-chevron-left"/>  
                  <span/> 
                </a> 
              </div>  
              <div class="x-titlebar-title">{{form_title}}</div>  
              <div class="x-titlebar-right reverse"> 
                <a component="$UI/system/components/justep/button/button"
                  label="" class="btn btn-link btn-only-icon" icon="icon-plus" onClick="addBtnClick"
                  xid="addBtn"> 
                  <i class="icon-plus"/>  
                  <span/> 
                </a>  
                <a component="$UI/system/components/justep/button/button"
                  label="" class="btn btn-link btn-only-icon" onClick="{operation:'{{form_data}}.save'}"
                  xid="saveBtn"> 
                  <i/>  
                  <span/> 
                </a> 
              </div> 
            </div> 
          </div>  
          <div class="x-panel-content"> 
            <div component="$UI/system/components/justep/controlGroup/controlGroup"
              class="x-control-group" title="详细信息"> 
              <div class="x-control-group-title">详细信息</div> {{#each form}} 
              <div component="$UI/system/components/justep/labelEdit/labelEdit"
                class="x-label-edit x-label30"> 
                <label class="x-label left" bind-text="{{form_data}}.label('{{form_field}}')"/>  
                <div class="x-edit">{{#if form_selectDataID}} 
                  <select class="form-control" component="$UI/system/components/justep/select/select"
                    bind-ref="{{form_data}}.ref('{{form_refID}}')" bind-labelRef="{{form_data}}.ref('{{form_field}}')"
                    bind-options="{{form_selectDataID}}" bind-optionsLabel="{{form_selectLabelName}}"
                    bind-optionsValue="{{form_selectConcept}}" bind-optionsCaption="请选择..." xid="d{{form_field}}"/>{{else}}{{#if form_password}}
                  <input component="$UI/system/components/justep/input/password" xid="d{{form_field}}"
                    class="form-control x-edit" bind-ref="{{form_data}}.ref('{{form_field}}')"/>{{/if}}{{#if form_range}}
                  <input component="$UI/system/components/justep/input/range" xid="d{{form_field}}"
                    class="x-edit" bind-ref="{{form_data}}.ref('{{form_field}}')"
                    min="-10000" max="10000"/>{{/if}}{{#if form_output}}
                  <span class="x-output" component="$UI/system/components/justep/output/output" xid="d{{form_field}}"
                    bind-ref="{{form_data}}.ref('{{form_field}}')"/>{{/if}}{{#if form_textarea}}
                  <textarea class="form-control" component="$UI/system/components/justep/textarea/textarea"
                    xid="d{{form_field}}" bind-ref="{{form_data}}.ref('{{form_field}}')"/> {{/if}}{{#if form_input}}
                  <input class="form-control" component="$UI/system/components/justep/input/input"
                    xid="d{{form_field}}" bind-ref="{{form_data}}.ref('{{form_field}}')"/>{{/if}}{{/if}}
                </div> 
              </div>{{/each}}
            </div> 
          </div>  
          </div> 
      </div> 
    </div> 
  </div> 
</div>
