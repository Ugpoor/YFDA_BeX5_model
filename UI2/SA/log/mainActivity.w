<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" component="$UI/system/components/justep/window/window" xid="window" design="device:pc;">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:350px;top:185px;"> 
    <div component="$UI/system/components/justep/data/bizData" xid="mainData"
      directDelete="true" autoLoad="true" concept="SA_Log" limit="15" > 
      <reader action="/system/logic/action/queryLogAction"/>  
      <writer action="/system/logic/action/saveLogAction"/>  
      <creator action="/system/logic/action/createLogAction"/>  
      <calculateRelation relation="calcCheckBox"/> 
    <rule xid="rule1">
   <readonly xid="readonly1">
    <expr xid="default13">true</expr></readonly> </rule></div> 
  </div>  
  <div component="$UI/system/components/bootstrap/tabs/tabs" xid="tabs"> 
    <ul class="nav nav-tabs" xid="navs"> 
      <li class="active" xid="nav-list"> 
        <a content="list" xid="tabItem1"><![CDATA[列表]]></a> 
      </li>  
      <li role="presentation" xid="nav-detail"> 
        <a content="detail" xid="tabItem2"><![CDATA[详细]]></a> 
      </li> 
    </ul>  
    <div class="tab-content" xid="contents"> 
      <div class="tab-pane active" xid="list"> 
        <div xid="bar" component="$UI/system/components/justep/toolBar/toolBar"
          class="x-toolbar x-toolbar-spliter form-inline"> 
          <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
            xid="refreshBtn" onClick="{'operation':'mainData.refresh'}"> 
            <i xid="i6"/>  
            <span xid="span10"/> 
          </a>  
          <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
            xid="bizFilterBtn" onClick="{operation:'bizFilter1.menu'}"> 
            <i xid="i7"/>  
            <span xid="span11"/> 
          </a>  
          <div component="$UI/system/components/justep/smartFilter/smartFilter"
            xid="smartFilter1" filterData="mainData" class="pull-right" filterCols="sTypeName,sCreateTime,sCreatorPersonName,sProcessName,sActionName,sStatusName,sIP,sDeviceType"> 
            <input type="text" class="form-control" placeholder="搜索" data-bind="valueUpdate: ['input', 'afterkeydown']"
              bind-value="$model.comp($element.parentElement).searchText" bind-change="$model.comp($element.parentElement).onInputChange.bind($model.comp($element.parentElement))"
              xid="input44"/> 
          </div> 
        <div class="x-control" component="$UI/system/components/justep/dateFilter/dateFilter" xid="dateFilter1" filterData="mainData" dateCol="sCreateTime" defaultValue="all">
   <div class="x-gridSelect" component="$UI/system/components/justep/gridSelect/gridSelect" xid="gridSelect1" optionHeight="390" style="width:80px;">
    <option xid="option1"></option></div> </div>
  <div class="x-control" component="$UI/system/components/justep/orgFilter/orgFilter" xid="orgFilter1" filterData="mainData" orgFIDCol="sCreatorFID" personIDCol="sCreatorPersonID" useMyself="true">
   <div class="x-gridSelect" component="$UI/system/components/justep/org/orgSelectPC" xid="orgSelectPC2">
    <option xid="option3" value="sFID" label="sName">
     <columns xid="columns2">
      <column name="sName" xid="column3"></column></columns> </option> </div> </div></div>  
        <div component="$UI/system/components/justep/dataTables/dataTables"
          flexibleWidth="true" class="table table-hover table-striped" xid="listData"
          data="mainData" rowActiveClass="active" onRowDblClick="grid3RowClick"> 
          <columns xid="column"> 
            <column name="sProcessName" label="功能"/>
            <column name="sActionName" label="操作"/>
            <column name="sCreatorPersonName"/>
            <column name="sCreateTime"/>  
            <column name="sIP"/>  
            <column name="sDeviceType"/>  
            <column name="sTypeName"/>  
            <column name="sStatusName" xid="column1"/>
          </columns> 
        </div>  
        <div component="$UI/system/components/justep/pagerBar/pagerBar" class="x-pagerbar container-fluid"
          xid="pageBar" data="mainData"> 
          <div class="row" xid="div1"> 
            <div class="col-sm-3" xid="div2"> 
              <div class="x-pagerbar-length" xid="div3"> 
                <label component="$UI/system/components/justep/pagerLimitSelect/pagerLimitSelect"
                  class="x-pagerlimitselect" xid="limitSelect1"> 
                  <span xid="span2">显示</span>  
                  <select component="$UI/system/components/justep/select/select"
                    class="form-control input-sm" xid="select1"> 
                    <option value="10" xid="default1">10</option>  
                    <option value="20" xid="default2">20</option>  
                    <option value="50" xid="default3">50</option>  
                    <option value="100" xid="default4">100</option> 
                  </select>  
                  <span xid="span5">条</span> 
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
                      <span aria-hidden="true" xid="span6">«</span>  
                      <span class="sr-only" xid="span7">Previous</span> 
                    </a> 
                  </li>  
                  <li class="next" xid="li2"> 
                    <a href="#" xid="a2"> 
                      <span aria-hidden="true" xid="span8">»</span>  
                      <span class="sr-only" xid="span9">Next</span> 
                    </a> 
                  </li> 
                </ul> 
              </div> 
            </div> 
          </div> 
        </div> 
      </div>  
      <div class="tab-pane" xid="detail"> 
        <div xid="detailBar" component="$UI/system/components/justep/toolBar/toolBar"
          class="x-toolbar x-toolbar-spliter form-inline"> 
          <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
            xid="preBtn" onClick='{"operation":"mainData.prevRow"}'> 
            <i xid="i4"/>  
            <span xid="span3"/> 
          </a>  
          <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
            xid="nextBtn" onClick='{"operation":"mainData.nextRow"}'> 
            <i xid="i5"/>  
            <span xid="span4"/> 
          </a> 
        </div>  
        <div class="form-horizontal container-fluid" component="$UI/system/components/bootstrap/form/form" xid="form"><div class="form-group" xid="formGroup1">
   <div class="col-sm-2" xid="div8"><label class="control-label" xid="controlLabel1"><![CDATA[功能]]></label></div>
   <div class="col-sm-4" xid="div9"><input component="$UI/system/components/justep/input/input" class="form-control" xid="input1" bind-ref="mainData.ref('sProcessName')"></input></div>
   <div class="col-sm-2" xid="div10"><label class="control-label" xid="controlLabel2"><![CDATA[操作]]></label></div>
   <div class="col-sm-4" xid="div11"><input component="$UI/system/components/justep/input/input" class="form-control" xid="input2" bind-ref="mainData.ref('sActionName')"></input></div></div>
  <div class="form-group" xid="formGroup2">
   <div class="col-sm-2" xid="div12"><label class="control-label" xid="controlLabel3"><![CDATA[操作者]]></label></div>
   <div class="col-sm-4" xid="div13"><input component="$UI/system/components/justep/input/input" class="form-control" xid="input3" bind-ref="mainData.ref('sCreatorPersonName')"></input></div>
   <div class="col-sm-2" xid="div14"><label class="control-label" xid="controlLabel4"><![CDATA[操作时间]]></label></div>
   <div class="col-sm-4" xid="div15"><input component="$UI/system/components/justep/input/input" class="form-control" xid="input4" bind-ref="mainData.ref('sCreateTime')"></input></div></div>
  <div class="form-group" xid="formGroup3">
   <div class="col-sm-2" xid="div16"><label class="control-label" xid="controlLabel5"><![CDATA[IP地址]]></label></div>
   <div class="col-sm-4" xid="div17"><input component="$UI/system/components/justep/input/input" class="form-control" xid="input6" bind-ref="mainData.ref('sIP')"></input></div>
   <div class="col-sm-2" xid="div18"><label class="control-label" xid="controlLabel6"><![CDATA[类别]]></label></div>
   <div class="col-sm-4" xid="div19"><input component="$UI/system/components/justep/input/input" class="form-control" xid="input5" bind-ref="mainData.ref('sTypeName')"></input></div></div>
  <div class="form-group" xid="formGroup4">
   <div class="col-sm-2" xid="div20"><label class="control-label" xid="controlLabel7"><![CDATA[操作状态]]></label></div>
   <div class="col-sm-4" xid="div21"><input component="$UI/system/components/justep/input/input" class="form-control" xid="input7" bind-ref="mainData.ref('sStatusName')"></input></div>
   <div class="col-sm-2" xid="div22"><label class="control-label" xid="controlLabel8"><![CDATA[客户端类型]]></label></div>
   <div class="col-sm-4" xid="div23"><input component="$UI/system/components/justep/input/input" class="form-control" xid="input8" bind-ref="mainData.ref('sDeviceType')"></input></div>
   </div>
  <div class="form-group" xid="formGroup5">
   <div class="col-sm-2" xid="div24"><label class="control-label" xid="controlLabel9"><![CDATA[参数]]></label></div>
   <div class="col-sm-10" xid="div25"><textarea rows="5" component="$UI/system/components/justep/textarea/textarea" class="form-control" xid="textarea1" bind-ref="mainData.ref('sParameters')"></textarea></div>
   </div>
  <div class="form-group" xid="formGroup6">
   <div class="col-sm-2" xid="div28"><label class="control-label" xid="controlLabel10"><![CDATA[返回值]]></label></div>
   <div class="col-sm-10" xid="div29"><textarea rows="5" component="$UI/system/components/justep/textarea/textarea" class="form-control" xid="textarea2" bind-ref="mainData.ref('sResult')"></textarea></div>
   </div>
  <div class="form-group" xid="formGroup7">
   <div class="col-sm-2" xid="div32"><label class="control-label" xid="controlLabel11"><![CDATA[描述]]></label></div>
   <div class="col-sm-10" xid="div33"><textarea rows="5" component="$UI/system/components/justep/textarea/textarea" class="form-control" xid="textarea3" bind-ref="mainData.ref('sDescription')"></textarea></div>
   </div></div></div> 
    </div> 
  </div> 
<span component="$UI/system/components/justep/bizFilter/bizFilter" xid="bizFilter1" filterData="mainData" filterCols="sTypeName,sCreateTime,sCreatorPersonName,sProcessName,sActionName,sStatusName,sIP,sDeviceType"></span></div>
