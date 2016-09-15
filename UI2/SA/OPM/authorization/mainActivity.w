<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window x-full-screen container-fluid" component="$UI/system/components/justep/window/window">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:499px;top:384px;"> 
    <div component="$UI/system/components/justep/data/bizData" xid="authorizeData"
      concept="SA_OPAuthorize" onBeforeRefresh="authorizeDataBeforeRefresh"> 
      <reader xid="default8" action="/SA/OPM/logic/action/queryOPAuthorizeAction"/> 
    </div>  
    <div component="$UI/system/components/justep/data/data" autoLoad="true"
      xid="tempData" idColumn="id" onValueChanged="tempDataValueChanged"> 
      <column label="id" name="id" type="String" xid="default5"/>  
      <column label="showInherited" name="showInherited" type="String" xid="default7"/>  
      <data xid="default9">[{"showInherited":"true"}]</data> 
    </div> 
  <div component="$UI/system/components/justep/data/bizData" xid="orgSearchData" concept="SA_OPOrg" onIndexChanged="orgSearchDataIndexChanged">
   <reader xid="default17" action="/system/logic/action/queryOrgAction"></reader></div></div>  
  <span component="$UI/system/components/justep/windowDialog/windowDialog" xid="selectRolesDialog"
    style="left:219px;top:418px;" src="$UI/SA/OPM/dialogs/selectRole/selectMultiRoles.w"
    showTitle="true" title="选择角色" width="50%"  status="normal" onReceive="selectRolesDialogReceive"/>  
  <div component="$UI/system/components/bootstrap/row/row" class="row" xid="row1"
    style="height:100%;"> 
    <div class="col col-xs-3" xid="col1" style="height:100%;overflow:auto;"> 
      <div component="$UI/system/components/justep/toolBar/toolBar" class="x-toolbar form-inline x-toolbar-spliter" xid="toolBar1">
   <div class="input-group" component="$UI/system/components/bootstrap/inputGroup/inputGroup" xid="inputGroup1">
    <input type="text" class="form-control" component="$UI/system/components/justep/input/input" xid="filter" bind-keypress="filterKeypress" valueUpdateMode="input" onChange="filterChange"></input>
    <div class="input-group-btn" xid="div10">
     <a component="$UI/system/components/justep/button/button" class="btn btn-default btn-only-icon" xid="searchBtn" icon="icon-android-search" onClick="searchBtnClick">
      <i xid="i5" class="icon-android-search"></i>
      <span xid="span22"></span></a> </div> </div> </div><div component="$UI/system/components/justep/smartContainer/smartContainer"
        class="x-smartcontainer" xid="smartContainer1"> 
        <div component="$UI/system/components/justep/org/orgTreePC" xid="orgTreePC1" bind-visible="!showFilterGird.get()"> 
          <div component="$UI/system/components/justep/data/bizData" autoLoad="true"
            xid="orgTreeData" onIndexChanged="orgTreeDataIndexChanged"> 
            <filter name="filter0" xid="filter1"><![CDATA[SA_OPOrg.sValidState = 1]]></filter> 
          </div>  
          <div component="$UI/system/components/justep/grid/grid" appearance="tree"
            expandColumn="sName" useVirtualRoot="false" virtualRootLabel="组织机构" xid="orgTreeGrid"
            height="auto" class="x-grid-no-bordered x-grid-no-border"> 
            <columns xid="columns1"> 
              <column name="sName" xid="column1"/> 
            </columns> 
          </div> 
        </div> 
      <div xid="searchDiv" class="x-bordered" style="display:none;height:0;" bind-visible="showFilterGird">
   <div component="$UI/system/components/justep/dataTables/dataTables" flexibleWidth="true" responsive="true" rowActiveClass="active" class="table table-hover table-striped" xid="searchGrid" data="orgSearchData" ordering="false">
    <columns xid="columns4">
     <column name="sFName" xid="column2"></column></columns> </div> </div></div> 
    </div>  
    <div class="col col-xs-9 col-spliter-left" xid="col2" style="height:100%;"> 
      <div component="$UI/system/components/justep/panel/panel" class="x-panel x-panel-opm-pc"
        xid="panel1" style="height:100%;"> 
        <div class="x-panel-top" xid="top1"> 
          <div component="$UI/system/components/justep/toolBar/toolBar" class="form-inline x-toolbar x-toolbar-spliter"
            xid="toolBar2"> 
            <div component="$UI/system/components/justep/smartFilter/smartFilter"
              xid="smartFilter1" filterData="authorizeData" filterCols="roleName"
              style="float: right;"> 
              <input type="text" class="form-control" placeholder="搜索" data-bind="valueUpdate: ['input', 'afterkeydown']"
                bind-value="$model.comp($element.parentElement).searchText" bind-change="$model.comp($element.parentElement).onInputChange.bind($model.comp($element.parentElement))"
                xid="input1"/> 
            </div>  
            <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
              label="分配角色" xid="addRoleBtn" icon="icon-android-add" onClick="addRoleBtnClick"> 
              <i xid="i7" class="icon-android-add"/>  
              <span xid="span7">分配角色</span> 
            </a>  
            <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
              label="删除角色" xid="deleteRoleBtn" icon="icon-android-remove" onClick="deleteRoleBtnClick"> 
              <i xid="i13" class="icon-android-remove"/>  
              <span xid="span16">删除角色</span> 
            </a>  
            <div class="dropdown btn-group" component="$UI/system/components/bootstrap/dropdown/dropdown"
              xid="dropdown1" autoHideMenu="false"> 
              <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left dropdown-toggle"
                label="选项" icon="icon-android-more" xid="button1"> 
                <i class="icon-android-more" xid="i2"/>  
                <span xid="span2">选项</span> 
              </a>  
              <ul component="$UI/system/components/justep/menu/menu" class="x-menu dropdown-menu"
                xid="menu1"> 
                <li class="x-menu-item" xid="item1"> 
                  <a xid="a3"> 
                    <span component="$UI/system/components/justep/button/checkbox"
                      class="x-checkbox" xid="checkbox1" label="显示从上级组织继承的角色" bind-ref="tempData.ref('showInherited')"/> 
                  </a> 
                </li> 
              </ul> 
            </div> 
          </div> 
        </div>  
        <div class="x-panel-content" xid="content1"> 
          <div component="$UI/system/components/justep/dataTables/dataTables"
            flexibleWidth="true" rowActiveClass="active" class="table table-hover"
            xid="authorizeDataTables" data="authorizeData" multiSelect="true" onRowCheck="authorizeDataTablesRowCheck" onCellRender="authorizeDataTablesCellRender"> 
            <columns xid="columns3"> 
              <column name="roleRoleKind" xid="column12" className="x-dt-cell-center"
                orderable="false" width="20px" label="　"/>  
              <column name="roleName" xid="column9" label="角色"/>  
              <column name="roleParentRolesNames" xid="column11" label="父角色"/>  
              <column name="sOrgFName" xid="column8" label="所属组织"/>  
              <column name="roleDescription" xid="column10" label="描述"/> 
            </columns> 
          </div> 
        </div>  
        <div class="x-panel-bottom" xid="bottom1"> 
          <div component="$UI/system/components/justep/pagerBar/pagerBar" class="x-pagerbar container-fluid"
            xid="pagerBar1" data="authorizeData"> 
            <div class="row" xid="div1"> 
              <div class="col-sm-3" xid="div2"> 
                <div class="x-pagerbar-length" xid="div3"> 
                  <label component="$UI/system/components/justep/pagerLimitSelect/pagerLimitSelect"
                    class="x-pagerlimitselect" xid="pagerLimitSelect1"> 
                    <span xid="span1">显示</span>  
                    <select component="$UI/system/components/justep/select/select"
                      class="form-control input-sm" xid="select1"> 
                      <option value="10" xid="default1">10</option>  
                      <option value="20" xid="default2">20</option>  
                      <option value="50" xid="default3">50</option>  
                      <option value="100" xid="default4">100</option> 
                    </select>  
                    <span xid="span3">条</span> 
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
                        <span aria-hidden="true" xid="span4">«</span>  
                        <span class="sr-only" xid="span5">Previous</span> 
                      </a> 
                    </li>  
                    <li class="next" xid="li2"> 
                      <a href="#" xid="a2"> 
                        <span aria-hidden="true" xid="span6">»</span>  
                        <span class="sr-only" xid="span8">Next</span> 
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
