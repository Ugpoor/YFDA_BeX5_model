<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window" component="$UI/system/components/justep/window/window"
  design="device:pc">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:573px;top:255px;"> 
    <div component="$UI/system/components/justep/data/bizData" xid="mainData"
      concept="SA_ProcessTemplate" orderBy="sCreateTime desc" autoLoad="true" directDelete="true"> 
      <reader xid="default1" action="/system/logic/action/queryProcessTemplateAction"/>  
      <writer xid="default2" action="/system/logic/action/saveProcessTemplateAction"/>  
      <creator xid="default3" action="/system/logic/action/createProcessTemplateAction"/>  
      <filter name="defaultFilter" xid="filter1"><![CDATA[(SA_ProcessTemplate.sTypeID='PROCESS_TEMPLATE' and SA_ProcessTemplate.sKindID='template')]]></filter> 
    </div>  
    <div component="$UI/system/components/justep/data/bizData" xid="resourceControl"
      concept="SA_ResourceControl" autoLoad="true"> 
      <reader xid="default4" action="/system/logic/action/queryResourceControlAction"/>  
      <writer xid="default5" action="/system/logic/action/saveResourceControlAction"/>  
      <creator xid="default6" action="/system/logic/action/createResourceControlAction"/>  
      <master xid="default7" data="mainData" relation="sResourceID"/> 
    </div> 
  </div>  
  <span component="$UI/system/components/justep/windowDialog/windowDialog" xid="templateDialog"
    src="$UI/system/service/process/dialog/processTemplate.w" title="第二步： 编辑流程模板"
    showTitle="true" width="90%" height="90%" status="normal" onReceive="templateDialogReceive"/>  
  <span component="$UI/system/components/justep/windowDialog/windowDialog" xid="processDialog"
    src="$UI/SA/OPM/dialogs/selectFunction/selectSingleFunction.w" title="第一步：选择流程"
    showTitle="true" status="normal" onReceive="processDialogReceive"/>  
  <div component="$UI/system/components/bootstrap/tabs/tabs" xid="tabs"> 
    <ul class="nav nav-tabs" xid="nav"> 
      <li class="active" xid="li5"> 
        <a content="templateContent" xid="templateItem"><![CDATA[流程模板]]></a> 
      </li>  
      <li role="presentation" xid="li6"> 
        <a content="orgContent" xid="orgItem"><![CDATA[关联组织]]></a> 
      </li> 
    </ul>  
    <div class="tab-content" xid="tabContent"> 
      <div class="tab-pane active" xid="templateContent"> 
        <div component="$UI/system/components/justep/toolBar/toolBar" class="x-toolbar form-inline x-toolbar-spliter"
          xid="templateBar"> 
          <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
            label="新建" xid="newBtn" icon="icon-plus" onClick="newBtnClick"> 
            <i xid="i1" class="icon-plus"/>  
            <span xid="span1">新建</span> 
          </a>  
          <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
            label="编辑" xid="editBtn" icon="icon-edit" onClick="editBtnClick" bind-enable=" $model.hasTemplate()"> 
            <i xid="i2" class="icon-edit"/>  
            <span xid="span2">编辑</span> 
          </a>  
          <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
            xid="deleteBtn" onClick="{operation:'mainData.delete'}"> 
            <i xid="i3"/>  
            <span xid="span3"/> 
          </a>  
          <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
            label="启用" xid="enabledBtn" icon="icon-unlocked" onClick="enabledBtnClick"
            bind-enable=" $model.isDisEnabled()"> 
            <i xid="i4" class="icon-unlocked"/>  
            <span xid="span4">启用</span> 
          </a>  
          <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
            label="禁用" xid="disEnabledBtn" icon="icon-locked" onClick="disEnabledBtnClick"
            bind-enable=" $model.isEnabled()"> 
            <i xid="i5" class="icon-locked"/>  
            <span xid="span5">禁用</span> 
          </a>  
          <div class="input-group pull-right" component="$UI/system/components/justep/smartFilter/smartFilter"
            xid="templateFilter" filterData="mainData" filterCols="sName,sProcessName"> 
            <input type="text" class="form-control" placeholder="搜索" data-bind="valueUpdate: ['input', 'afterkeydown']"
              bind-value="$model.comp($element.parentElement).searchText" bind-change="$model.comp($element.parentElement).onInputChange.bind($model.comp($element.parentElement))"
              xid="input1"/>  
            <span class="input-group-addon x-smartFilter-refresh" bind-click="$model.comp($element.parentElement).refresh.bind($model.comp($element.parentElement))"
              xid="span6"> 
              <i class="icon-android-search" xid="i6"/> 
            </span> 
          </div>  
          <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
            xid="templateRefreshBtn" onClick="{operation:'mainData.refresh'}"> 
            <i xid="i12"/>  
            <span xid="span25"/> 
          </a> 
        </div>  
        <div component="$UI/system/components/justep/dataTables/dataTables"
          flexibleWidth="true" rowActiveClass="active" class="table table-hover table-striped"
          xid="templateTables" data="mainData" onCellRender="templateTablesCellRender"> 
          <columns xid="templateColumns"> 
            <column name="sName" xid="column1"/>  
            <column name="sProcessName" xid="column2" label="流程"/>  
            <column name="sValidState" xid="column3" orderable="false" label="状态"/> 
          </columns> 
        </div>  
        <div component="$UI/system/components/justep/pagerBar/pagerBar" class="x-pagerbar container-fluid"
          xid="templatePagerBar" data="mainData"> 
          <div class="row" xid="div1"> 
            <div class="col-sm-3" xid="div2"> 
              <div class="x-pagerbar-length" xid="div3"> 
                <label component="$UI/system/components/justep/pagerLimitSelect/pagerLimitSelect"
                  class="x-pagerlimitselect" xid="pagerLimitSelect1"> 
                  <span xid="span8">显示</span>  
                  <select component="$UI/system/components/justep/select/select"
                    class="form-control input-sm" xid="select1"> 
                    <option value="10" xid="default8">10</option>  
                    <option value="20" xid="default9">20</option>  
                    <option value="50" xid="default10">50</option>  
                    <option value="100" xid="default11">100</option> 
                  </select>  
                  <span xid="span9">条</span> 
                </label> 
              </div> 
            </div>  
            <div class="col-sm-3" xid="div4"> 
              <div class="x-pagerbar-info" xid="div5">当前显示0条，共0条</div> 
            </div>  
            <div class="col-sm-6" xid="div6"> 
              <div class="x-pagerbar-pagination" xid="div7"> 
                <ul class="pagination" component="$UI/system/components/bootstrap/pagination/pagination"
                  xid="pagination1"> 
                  <li class="prev" xid="li1"> 
                    <a href="#" xid="a1"> 
                      <span aria-hidden="true" xid="span10">«</span>  
                      <span class="sr-only" xid="span11">Previous</span> 
                    </a> 
                  </li>  
                  <li class="next" xid="li2"> 
                    <a href="#" xid="a2"> 
                      <span aria-hidden="true" xid="span12">»</span>  
                      <span class="sr-only" xid="span13">Next</span> 
                    </a> 
                  </li> 
                </ul> 
              </div> 
            </div> 
          </div> 
        </div> 
      </div>  
      <div class="tab-pane" xid="orgContent"> 
        <div component="$UI/system/components/justep/toolBar/toolBar" class="x-toolbar form-inline x-toolbar-spliter"
          xid="orgBar"> 
          <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
            label="分配" xid="addOrgBtn" icon="icon-plus" onClick="addOrgBtnClick" bind-enable="$model.hasTemplate()"> 
            <i xid="i8" class="icon-plus"/>  
            <span xid="span14">分配</span> 
          </a>  
          <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
            label="删除" xid="deleteOrgBtn" icon="icon-minus" onClick="deleteOrgBtnClick"
            bind-enable=" $model.hasOrg()"> 
            <i xid="i9" class="icon-minus"/>  
            <span xid="span15">删除</span> 
          </a>  
          <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
            xid="orgRefreshBtn" onClick="{operation:'resourceControl.refresh'}"> 
            <i xid="i13"/>  
            <span xid="span26"/> 
          </a>  
          <div class="input-group pull-right" component="$UI/system/components/justep/smartFilter/smartFilter"
            xid="orgFilter" filterData="resourceControl" filterCols="sOrgFName"> 
            <input type="text" class="form-control" placeholder="搜索" data-bind="valueUpdate: ['input', 'afterkeydown']"
              bind-value="$model.comp($element.parentElement).searchText" bind-change="$model.comp($element.parentElement).onInputChange.bind($model.comp($element.parentElement))"
              xid="input2"/>  
            <span class="input-group-addon x-smartFilter-refresh" bind-click="$model.comp($element.parentElement).refresh.bind($model.comp($element.parentElement))"
              xid="span16"> 
              <i class="icon-android-search" xid="i10"/> 
            </span> 
          </div> 
        </div>  
        <div component="$UI/system/components/justep/dataTables/dataTables"
          flexibleWidth="true" rowActiveClass="active" class="table table-hover table-striped"
          xid="orgTables" data="resourceControl" multiSelect="true"> 
          <columns xid="columns2"> 
            <column name="sOrgFName" xid="column4"/> 
          </columns> 
        </div>  
        <div component="$UI/system/components/justep/pagerBar/pagerBar" class="x-pagerbar container-fluid"
          xid="orgPagerBar" data="resourceControl"> 
          <div class="row" xid="div8"> 
            <div class="col-sm-3" xid="div9"> 
              <div class="x-pagerbar-length" xid="div10"> 
                <label component="$UI/system/components/justep/pagerLimitSelect/pagerLimitSelect"
                  class="x-pagerlimitselect" xid="pagerLimitSelect2"> 
                  <span xid="span18">显示</span>  
                  <select component="$UI/system/components/justep/select/select"
                    class="form-control input-sm" xid="select2"> 
                    <option value="10" xid="default12">10</option>  
                    <option value="20" xid="default13">20</option>  
                    <option value="50" xid="default14">50</option>  
                    <option value="100" xid="default15">100</option> 
                  </select>  
                  <span xid="span19">条</span> 
                </label> 
              </div> 
            </div>  
            <div class="col-sm-3" xid="div11"> 
              <div class="x-pagerbar-info" xid="div12">当前显示0条，共0条</div> 
            </div>  
            <div class="col-sm-6" xid="div13"> 
              <div class="x-pagerbar-pagination" xid="div14"> 
                <ul class="pagination" component="$UI/system/components/bootstrap/pagination/pagination"
                  xid="pagination2"> 
                  <li class="prev" xid="li3"> 
                    <a href="#" xid="a3"> 
                      <span aria-hidden="true" xid="span20">«</span>  
                      <span class="sr-only" xid="span21">Previous</span> 
                    </a> 
                  </li>  
                  <li class="next" xid="li4"> 
                    <a href="#" xid="a4"> 
                      <span aria-hidden="true" xid="span22">»</span>  
                      <span class="sr-only" xid="span23">Next</span> 
                    </a> 
                  </li> 
                </ul> 
              </div> 
            </div> 
          </div> 
        </div> 
      </div> 
    </div> 
  </div> 
</div>
