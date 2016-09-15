<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window x-full-screen container-fluid" component="$UI/system/components/justep/window/window"
  design="device:mobile">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:67px;top:145px;"> 
    <div component="$UI/system/components/justep/data/bizData" xid="managementData"
      concept="SA_OPManagement" onBeforeRefresh="managementDataBeforeRefresh"> 
      <reader xid="default1" action="/SA/OPM/logic/action/queryOPManagementAction"/>  
      <filter name="filterManagementType" xid="filterManagementType"><![CDATA[SA_OPManagement.sManageTypeID = 'systemManagement']]></filter> 
    </div>  
    <div component="$UI/system/components/justep/data/bizData" xid="roleManagementData"
      concept="SA_OPRoleManagement" onBeforeRefresh="roleManagementDataBeforeRefresh"> 
      <reader xid="default9" action="/SA/OPM/logic/action/queryOPRoleManagementAction"/> 
    </div>  
    <div component="$UI/system/components/justep/data/data" autoLoad="true"
      xid="tempData" idColumn="id" onValueChanged="tempDataValueChanged"> 
      <column label="id" name="id" type="String" xid="default4"/>  
      <column label="showInherited" name="showInherited" type="String" xid="default5"/>  
      <column label="showInheritedRole" name="showInheritedRole" type="String"
        xid="default14"/>  
      <data xid="default6">[{"showInherited":"true","showInheritedRole":"true"}]</data> 
    </div> 
  <div component="$UI/system/components/justep/data/bizData" xid="orgSearchData" concept="SA_OPOrg" onIndexChanged="orgSearchDataIndexChanged">
   <reader xid="default17" action="/system/logic/action/queryOrgAction"></reader></div></div>  
  <span component="$UI/system/components/justep/org/orgDialogPC" showTitle="true"
    xid="orgDialog" style="left:160px;top:371px;" title="选择管理的下级组织" onReceive="orgDialogReceive"
    multiSelection="true"/>  
  <span component="$UI/system/components/justep/windowDialog/windowDialog" xid="roleDialog"
    style="left:217px;top:369px;" src="$UI/SA/OPM/dialogs/selectRole/selectMultiRoles.w"
    title="选择管理的角色" showTitle="true" status="normal" onReceive="roleDialogReceive"
    width="50%"/>  
  <div component="$UI/system/components/bootstrap/row/row" class="row" xid="row1"
    style="height:100%;"> 
    <div class="col col-xs-3" xid="col1" style="height:100%;overflow:auto;"> 
      <div component="$UI/system/components/justep/toolBar/toolBar" class="x-toolbar form-inline x-toolbar-spliter" xid="toolBar3">
   <div class="input-group" component="$UI/system/components/bootstrap/inputGroup/inputGroup" xid="inputGroup1">
    <input type="text" class="form-control" component="$UI/system/components/justep/input/input" xid="filter" bind-keypress="filterKeypress" valueUpdateMode="input" onChange="filterChange"></input>
    <div class="input-group-btn" xid="div15">
     <a component="$UI/system/components/justep/button/button" class="btn btn-default btn-only-icon" xid="searchBtn" icon="icon-android-search" onClick="searchBtnClick">
      <i xid="i7" class="icon-android-search"></i>
      <span xid="span22"></span></a> </div> </div> </div><div component="$UI/system/components/justep/smartContainer/smartContainer"
        class="x-smartcontainer" xid="smartContainer1"> 
        <div component="$UI/system/components/justep/org/orgTreePC" xid="orgTreePC1" bind-visible="!showFilterGird.get()"> 
          <div component="$UI/system/components/justep/data/bizData" autoLoad="true"
            xid="orgTreeData" onIndexChanged="orgTreeDataIndexChanged"> 
            <filter name="filter0" xid="filter1">SA_OPOrg.sValidState = 1</filter> 
          </div>  
          <div component="$UI/system/components/justep/grid/grid" appearance="tree"
            expandColumn="sName" useVirtualRoot="false" virtualRootLabel="组织机构" xid="orgTreeGrid"
            class="x-grid-no-bordered" height="auto"> 
            <columns xid="columns1"> 
              <column name="sName" xid="column1"/> 
            </columns> 
          </div> 
        </div> 
      <div xid="searchDiv" class="x-bordered" style="display:none;height:0;" bind-visible="showFilterGird">
   <div component="$UI/system/components/justep/dataTables/dataTables" flexibleWidth="true" responsive="true" rowActiveClass="active" class="table table-hover table-striped" xid="searchGrid" data="orgSearchData" ordering="false">
    <columns xid="columns3">
     <column name="sFName" xid="column4"></column></columns> </div> </div></div> 
    </div>  
    <div class="col col-xs-9 col-spliter-left" xid="col3" style="height:100%;"> 
      <div component="$UI/system/components/justep/panel/panel" class="x-panel  x-panel-opm-pc"
        xid="panel1" style="height:50%;"> 
        <div class="x-panel-top" xid="top1">
          <div component="$UI/system/components/justep/toolBar/toolBar" class="x-toolbar x-toolbar-spliter"
            xid="toolBar1"> 
            <div class="x-control" component="$UI/system/components/justep/smartFilter/smartFilter"
              xid="smartFilter1" filterData="managementData" filterCols="sOrgFName,sManageOrgFName,manageTypeName"
              style="float: right;"> 
              <input type="text" class="form-control" placeholder="搜索" data-bind="valueUpdate: ['input', 'afterkeydown']"
                bind-value="$model.comp($element.parentElement).searchText" bind-change="$model.comp($element.parentElement).onInputChange.bind($model.comp($element.parentElement))"
                xid="input1"/>
            </div>  
            <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
              label="添加" xid="addManagementBtn" icon="icon-android-add" onClick="addManagementBtnClick"> 
              <i xid="i1" class="icon-android-add"/>  
              <span xid="span1">添加</span>
            </a>  
            <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
              label="删除" xid="deleteManagementBtn" icon="icon-android-remove" onClick="deleteManagementBtnClick"> 
              <i xid="i2" class="icon-android-remove"/>  
              <span xid="span2">删除</span>
            </a>  
            <div class="dropdown btn-group" component="$UI/system/components/bootstrap/dropdown/dropdown"
              xid="dropdown1" autoHideMenu="false"> 
              <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left dropdown-toggle"
                label="选项" icon="icon-android-more" xid="button1"> 
                <i class="icon-android-more" xid="i6"/>  
                <span xid="span5">选项</span>
              </a>  
              <ul component="$UI/system/components/justep/menu/menu" class="x-menu dropdown-menu"
                xid="menu1"> 
                <li class="x-menu-item" xid="item1"> 
                  <a xid="a6"> 
                    <span component="$UI/system/components/justep/button/checkbox"
                      class="x-checkbox" xid="checkbox1" label="显示继承的管理组织" bind-ref="tempData.ref('showInherited')"/>
                  </a> 
                </li> 
              </ul> 
            </div> 
          </div>
        </div>  
        <div class="x-panel-content" xid="content1">
          <div component="$UI/system/components/justep/dataTables/dataTables"
            flexibleWidth="true" rowActiveClass="active" class="table table-hover"
            xid="managementDataTables" data="managementData" multiSelect="true" onRowCheck="managementDataTablesRowCheck"> 
            <columns xid="columns4"> 
              <column name="sManageOrgFName" xid="column3" label="管理的下级组织"/>  
              <column name="sOrgFName" xid="column2" label="所属组织"/>
            </columns> 
          </div>
        </div>  
        <div class="x-panel-bottom" xid="bottom1">
          <div component="$UI/system/components/justep/pagerBar/pagerBar" class="x-pagerbar container-fluid"
            xid="pagerBar1" data="managementData"> 
            <div class="row" xid="div1"> 
              <div class="col-sm-3" xid="div2"> 
                <div class="x-pagerbar-length" xid="div3"> 
                  <label component="$UI/system/components/justep/pagerLimitSelect/pagerLimitSelect"
                    class="x-pagerlimitselect" xid="pagerLimitSelect1"> 
                    <span xid="span3">显示</span>  
                    <select component="$UI/system/components/justep/select/select"
                      class="form-control input-sm" xid="select1"> 
                      <option value="10" xid="default2">10</option>  
                      <option value="20" xid="default3">20</option>  
                      <option value="50" xid="default7">50</option>  
                      <option value="100" xid="default8">100</option>
                    </select>  
                    <span xid="span4">条</span>
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
      </div>  
      <div component="$UI/system/components/justep/panel/panel" class="x-panel  x-panel-opm-pc"
        xid="panel2" style="height:50%;border-top-style:double;border-top-width:medium;border-top-color:#C0C0C0;"> 
        <div class="x-panel-top" xid="top2">
          <div component="$UI/system/components/justep/toolBar/toolBar" class="x-toolbar x-toolbar-spliter"
            xid="toolBar2"> 
            <div class="x-control" component="$UI/system/components/justep/smartFilter/smartFilter"
              xid="smartFilter2" filterData="roleManagementData" style="float: right;"
              filterCols="roleName,sOrgFName"> 
              <input type="text" class="form-control" placeholder="搜索" data-bind="valueUpdate: ['input', 'afterkeydown']"
                bind-value="$model.comp($element.parentElement).searchText" bind-change="$model.comp($element.parentElement).onInputChange.bind($model.comp($element.parentElement))"
                xid="input2"/>
            </div>  
            <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
              label="添加" xid="addRoleBtn" icon="icon-android-add" onClick="addRoleBtnClick"> 
              <i xid="i5" class="icon-android-add"/>  
              <span xid="span18">添加</span>
            </a>  
            <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
              label="删除" xid="deleteRoleBtn" icon="icon-android-remove" onClick="deleteRoleBtnClick"> 
              <i xid="i4" class="icon-android-remove"/>  
              <span xid="span16">删除</span>
            </a>  
            <div class="dropdown btn-group" component="$UI/system/components/bootstrap/dropdown/dropdown"
              xid="dropdown2" autoHideMenu="false"> 
              <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left dropdown-toggle"
                label="选项" icon="icon-android-more" xid="button3"> 
                <i class="icon-android-more" xid="i3"/>  
                <span xid="span15">选项</span>
              </a>  
              <ul component="$UI/system/components/justep/menu/menu" class="x-menu dropdown-menu"
                xid="menu2"> 
                <li class="x-menu-item" xid="item2"> 
                  <a xid="a5"> 
                    <span component="$UI/system/components/justep/button/checkbox"
                      class="x-checkbox" xid="checkbox2" label="显示继承的管理角色" bind-ref="tempData.ref('showInheritedRole')"/>
                  </a> 
                </li> 
              </ul> 
            </div> 
          </div>
        </div>  
        <div class="x-panel-content" xid="content2">
          <div component="$UI/system/components/justep/dataTables/dataTables"
            flexibleWidth="true" rowActiveClass="active" class="table table-hover"
            xid="roleDataTables" data="roleManagementData" multiSelect="true" onRowCheck="roleDataTablesRowCheck"> 
            <columns xid="columns2"> 
              <column name="roleName" xid="column6" label="管理的角色"/>  
              <column name="sOrgFName" xid="column5" label="所属组织"/>
            </columns> 
          </div>
        </div>  
        <div class="x-panel-bottom" xid="bottom2">
          <div component="$UI/system/components/justep/pagerBar/pagerBar" class="x-pagerbar container-fluid"
            xid="pagerBar2" data="roleManagementData"> 
            <div class="row" xid="div14"> 
              <div class="col-sm-3" xid="div13"> 
                <div class="x-pagerbar-length" xid="div12"> 
                  <label component="$UI/system/components/justep/pagerLimitSelect/pagerLimitSelect"
                    class="x-pagerlimitselect" xid="pagerLimitSelect2"> 
                    <span xid="span17">显示</span>  
                    <select component="$UI/system/components/justep/select/select"
                      class="form-control input-sm" xid="select2"> 
                      <option value="10" xid="default12">10</option>  
                      <option value="20" xid="default13">20</option>  
                      <option value="50" xid="default10">50</option>  
                      <option value="100" xid="default11">100</option>
                    </select>  
                    <span xid="span14">条</span>
                  </label> 
                </div> 
              </div>  
              <div class="col-sm-3" xid="div11"> 
                <div class="x-pagerbar-info" xid="div10">当前显示0条，共0条</div>
              </div>  
              <div class="col-sm-6" xid="div9"> 
                <div class="x-pagerbar-pagination" xid="div8"> 
                  <ul class="pagination" component="$UI/system/components/bootstrap/pagination/pagination"
                    xid="pagination2"> 
                    <li class="prev" xid="li3"> 
                      <a href="#" xid="a3"> 
                        <span aria-hidden="true" xid="span12">«</span>  
                        <span class="sr-only" xid="span13">Previous</span>
                      </a> 
                    </li>  
                    <li class="next" xid="li4"> 
                      <a href="#" xid="a4"> 
                        <span aria-hidden="true" xid="span10">»</span>  
                        <span class="sr-only" xid="span11">Next</span>
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
</div>
