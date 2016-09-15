<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" component="$UI/system/components/justep/window/window" xid="window" design="device:pc;">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:334px;top:318px;">
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
  <div xid="view"> 
    <div component="$UI/system/components/justep/toolBar/toolBar" class="x-toolbar x-toolbar-spliter form-inline"
      xid="bar"> 
      <div component="$UI/system/components/justep/smartFilter/smartFilter"
        xid="smartFilter1" filterData="{{data_xid}}" filterCols="{{list_columns}}"
        class="pull-right"> 
        <input type="text" class="form-control" placeholder="搜索" data-bind="valueUpdate: ['input', 'afterkeydown']"
          xid="input1"/> 
      </div>  
      <a component="$UI/system/components/justep/button/button" label=" 新建"
        class="btn btn-link btn-icon-left" icon="icon-plus" onClick="{&quot;operation&quot;:&quot;{{data_xid}}.new&quot;, args:{index:'js:0'}}"
        xid="newBtn"> 
        <i class="icon-plus"/>  
        <span>新建</span> 
      </a>  
      <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
        label="保存" xid="saveBtn" onClick="{&quot;operation&quot;:&quot;{{data_xid}}.save&quot;}"> 
        <i xid="i3"/>  
        <span xid="label7">保存</span> 
      </a>  
      <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
        label="删除" xid="deleteBtn" onClick="deleteBtnClick"> 
        <i xid="i4"/>  
        <span xid="span7">删除</span> 
      </a>  
      <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
        xid="refreshBtn" onClick="{&quot;operation&quot;:&quot;{{data_xid}}.refresh&quot;}" label="刷新"> 
        <i xid="i2"/>  
        <span xid="span2">刷新</span> 
      </a> 
    <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left" label="全部取消" xid="button1" onClick="cancelEditClick">
   <i xid="i1"></i>
   <span xid="span8">全部取消</span></a></div>  
    <div xid="mainList" class="x-list" component="$UI/system/components/justep/list/list"
        data="{{data_xid}}" limit="-1"> 
        <div class="x-list-head"/>  
        <ul class="x-list-template"> 
          <li> 
            <div component="$UI/system/components/justep/row/row" class="x-row x-row-center"> 
              <div class="x-col" style="text-align: left;"> 
                <span component="$UI/system/components/justep/button/checkbox"
                  bind-ref="ref('calcCheckBox')" class="x-checkbox"/> 
              </div>  
              <div component="$UI/system/components/justep/row/row" class="x-col x-col-90"> 
                <div class="x-row" component="$UI/system/components/justep/row/row">{{#each columns}} 
                  <div class="x-col"> 
                    <input component="$UI/system/components/justep/input/input" class="form-control" xid="input2" bind-ref="ref('{{column_name}}')"></input></div>{{#if list_field2}}
                  <div class="x-col" style="text-align:right;color:gray"> 
                    <input component="$UI/system/components/justep/input/input" class="form-control" xid="input3" bind-ref="ref('{{column_name2}}')"></input></div>{{/if}}{{/each}}
                </div>
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
  <div component="$UI/system/components/justep/pagerBar/pagerBar" class="x-pagerbar container-fluid"
    xid="pagerBar" data="{{data_xid}}"> 
    <div class="row" xid="div1"> 
      <div class="col-sm-3" xid="div2"> 
        <div class="x-pagerbar-length" xid="div3"> 
          <label component="$UI/system/components/justep/pagerLimitSelect/pagerLimitSelect"
            class="x-pagerlimitselect" xid="pagerLimitSelect1" defaultValue="10"> 
            <span xid="span1">显示</span>  
            <select component="$UI/system/components/justep/select/select" class="form-control input-sm"
              xid="select1"> 
              <option value="10" xid="default2">10</option>  
              <option value="20" xid="default3">20</option>  
              <option value="50" xid="default4">50</option>  
              <option value="100" xid="default5">100</option> 
            </select>  
            <span xid="span3">条</span> 
          </label> 
        </div> 
      </div>  
      <div class="col-sm-3" xid="div4"> 
        <div class="x-pagerbar-info" xid="div5">当前显示1-10条，共16条</div> 
      </div>  
      <div class="col-sm-6" xid="div6"> 
        <div class="x-pagerbar-pagination" xid="div7"> 
          <ul class="pagination" component="$UI/system/components/bootstrap/pagination/pagination"
            xid="pagination1"> 
            <li class="prev" xid="li1"> 
              <a href="#" xid="a1"> 
                <span aria-hidden="true" xid="span4">«</span>  
                <span class="sr-only" xid="span5">Previous</span> 
              </a> 
            </li>  
            <li class="next" xid="li2"> 
              <a href="#" xid="a2"> 
                <span aria-hidden="true" xid="span6">»</span>  
                <span class="sr-only" xid="span9">Next</span> 
              </a> 
            </li> 
          </ul> 
        </div> 
      </div> 
    </div> 
  </div> 
</div>
