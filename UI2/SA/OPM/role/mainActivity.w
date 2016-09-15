<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window  container-fluid x-full-screen" component="$UI/system/components/justep/window/window">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:435px;top:229px;"
    onModelConstructDone="modelModelConstructDone"> 
    <div component="$UI/system/components/justep/data/bizData" xid="roleData"
      concept="SA_OPRole" limit="-1" onIndexChanged="roleDataIndexChanged" onBeforeRefresh="roleDataBeforeRefresh"> 
      <reader xid="default1" action="/SA/OPM/logic/action/queryOPRoleAction"/> 
    </div>  
    <div component="$UI/system/components/justep/data/bizData" xid="permissionData"
      concept="SA_OPPermission" onRefreshCreateParam="permissionDataRefreshCreateParam"
      confirmRefresh="false"> 
      <reader xid="default2" action="/SA/OPM/logic/action/queryOPPermissionByRoleAction"/> 
    </div>  
    <div component="$UI/system/components/justep/data/data" autoLoad="true"
      xid="tempData" autoNew="false" idColumn="id" onValueChanged="tempDataValueChanged"> 
      <column label="id" name="id" type="String" xid="default5"/>  
      <column label="showDisabledRole" name="showDisabledRole" type="String" xid="default6"/>  
      <column label="showInheritedPermission" name="showInheritedPermission" type="String"
        xid="default7"/>  
      <data xid="default8">[{"showInheritedPermission":"true"}]</data> 
    </div> 
  </div>  
  <span component="$UI/system/components/justep/windowDialog/windowDialog" xid="functionDialog"
    style="left:169px;top:287px;" title="选择功能" src="$UI/SA/OPM/dialogs/selectFunction/selectMultiFunctions.w"
    status="normal" onReceive="functionDialogReceive" showTitle="true" width="60%"
    />  
  <span component="$UI/system/components/justep/windowDialog/windowDialog" xid="roleDetailDialog"
    style="left:128px;top:288px;" src="$UI/SA/OPM/dialogs/showRole/roleDetail.w" title="角色"
    showTitle="true" status="normal"   onReceive="roleDetailDialogReceive"/>  
  <div component="$UI/system/components/bootstrap/row/row" class="row" xid="row1"
    style="height:100%;"> 
    <div class="col col-xs-5" xid="col1" style="height:100%;"> 
      <div component="$UI/system/components/justep/panel/panel" class="x-panel x-panel-opm-pc"
        xid="panel1" style="height:100%;"> 
        <div class="x-panel-top" xid="top1"> 
          <div component="$UI/system/components/justep/toolBar/toolBar" class="x-toolbar x-toolbar-spliter"
            xid="toolBar1"> 
            <div class="dropdown btn-group" component="$UI/system/components/bootstrap/dropdown/dropdown"
              xid="dropdown1"> 
              <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left dropdown-toggle "
                label="新建" icon="icon-plus" xid="button3"> 
                <i class="icon-plus" xid="i3"/>  
                <span xid="span3">新建</span> 
              </a>  
              <ul component="$UI/system/components/justep/menu/menu" class="x-menu dropdown-menu"
                xid="menu2"> 
                <li class="x-menu-item" xid="item1"> 
                  <a component="$UI/system/components/justep/button/button"
                    class="btn btn-link btn-icon-left" label="新建功能角色" xid="newFunRoleBtn"
                    icon="img:$UI/SA/OPM/images/funRole.gif|" onClick="newFunRoleBtnClick"> 
                    <img src="$UI/SA/OPM/images/funRole.gif" xid="image1"/>  
                    <span xid="span4">新建功能角色</span> 
                  </a> 
                </li>  
                <li class="x-menu-item" xid="item2"> 
                  <a component="$UI/system/components/justep/button/button"
                    class="btn btn-link btn-icon-left" label="新建数据角色" xid="newDataRoleBtn"
                    icon="img:$UI/SA/OPM/images/dataRole.gif|" onClick="newDataRoleBtnClick"> 
                    <img src="$UI/SA/OPM/images/dataRole.gif" xid="image2"/>  
                    <span xid="span5">新建数据角色</span> 
                  </a> 
                </li> 
              </ul> 
            </div>  
            <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left "
              label="编辑" xid="editRoleBtn" icon="icon-compose" onClick="editRoleBtnClick"> 
              <i xid="i2" class="icon-compose"/>  
              <span xid="span2">编辑</span> 
            </a>  
            <div class="dropdown btn-group" component="$UI/system/components/bootstrap/dropdown/dropdown"
              xid="dropdown5" autoHideMenu="false"> 
              <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left dropdown-toggle"
                label="选项" icon="icon-android-more" xid="button2"> 
                <i class="icon-android-more" xid="i5"/>  
                <span xid="span11">选项</span> 
              </a>  
              <ul component="$UI/system/components/justep/menu/menu" class="x-menu dropdown-menu"
                xid="menu5"> 
                <li class="x-menu-item" xid="item6"> 
                  <a xid="a3"> 
                    <span component="$UI/system/components/justep/button/checkbox"
                      class="x-checkbox" xid="checkbox1" label="显示已禁用的角色" bind-ref="tempData.ref('showDisabledRole')"/> 
                  </a> 
                </li> 
              </ul> 
            </div>  
            <div class="dropdown btn-group" component="$UI/system/components/bootstrap/dropdown/dropdown"
              xid="dropdown2"> 
              <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left dropdown-toggle"
                label="更多" icon="icon-arrow-down-b" xid="button6"> 
                <i class="icon-arrow-down-b" xid="i6"/>  
                <span xid="span6">更多</span> 
              </a>  
              <ul component="$UI/system/components/justep/menu/menu" class="x-menu dropdown-menu"
                xid="menu3" style="width:200px;"> 
                <li class="x-menu-item" xid="item3"> 
                  <a component="$UI/system/components/justep/button/button"
                    class="btn btn-link btn-icon-left" label="启用" xid="enableRoleBtn"
                    icon="icon-unlocked" onClick="enableRoleBtnClick"> 
                    <i xid="i7" class="icon-unlocked"/>  
                    <span xid="span7">启用</span> 
                  </a> 
                </li>  
                <li class="x-menu-item" xid="item4"> 
                  <a component="$UI/system/components/justep/button/button"
                    class="btn btn-link btn-icon-left" label="禁用" xid="disableRoleBtn"
                    icon="icon-locked" onClick="disableRoleBtnClick"> 
                    <i xid="i8" class="icon-locked"/>  
                    <span xid="span8"/> 
                  </a> 
                </li>  
                <li class="x-menu-divider divider" xid="divider1"/>  
                <li class="x-menu-item" xid="item5"> 
                  <a component="$UI/system/components/justep/button/button"
                    class="btn btn-link btn-icon-left" label="删除" xid="deleteRoleBtn"
                    icon="icon-close" onClick="deleteRoleBtnClick"> 
                    <i xid="i9" class="icon-close"/>  
                    <span xid="span9">button</span> 
                  </a> 
                </li> 
              </ul> 
            </div> 
          <div class="input-group" component="$UI/system/components/justep/smartFilter/smartFilter" xid="smartFilter1" filterData="roleData" filterCols="sName,sCode,sCatalog" style="float: right;">
   <input type="text" class="form-control" placeholder="搜索" data-bind="valueUpdate: ['input', 'afterkeydown']" bind-value="$model.comp($element.parentElement).searchText" bind-change="$model.comp($element.parentElement).onInputChange.bind($model.comp($element.parentElement))" xid="input1"></input></div></div> 
        </div>  
        <div class="x-panel-content" xid="content1"> 
          <div component="$UI/system/components/justep/dataTables/dataTables"
            flexibleWidth="true" rowActiveClass="active" class="table table-hover"
            xid="roleDataTables" data="roleData" onCellRender="roleDataTablesCellRender"
            onRowDblClick="editRoleBtnClick"> 
            <columns xid="columns3"> 
              <column name="sRoleKind" xid="column13" label="　" width="20px" orderable="false"
                className="x-dt-cell-center"/>  
              <column name="sName" xid="column10" label="角色"/>  
              <column name="sCode" xid="column11"/>  
              <column name="sCatalog" xid="column12"/> 
            </columns> 
          </div> 
        </div> 
      </div> 
    </div>  
    <div class="col col-xs-7 col-spliter-left" xid="col2" style="height:100%;"> 
      <div component="$UI/system/components/justep/panel/panel" class="x-panel x-panel-opm-pc"
        xid="panel2" style="height:100%;"> 
        <div class="x-panel-top" xid="top2"> 
          <div component="$UI/system/components/justep/toolBar/toolBar" class="x-toolbar x-toolbar-spliter"
            xid="toolBar2"> 
            <div class="x-control" component="$UI/system/components/justep/smartFilter/smartFilter"
              xid="smartFilter2" filterData="permissionData" filterCols="sActivityFName,actionsLabel,roleName"
              style="float: right;"> 
              <input type="text" class="form-control" placeholder="搜索" data-bind="valueUpdate: ['input', 'afterkeydown']"
                bind-value="$model.comp($element.parentElement).searchText" bind-change="$model.comp($element.parentElement).onInputChange.bind($model.comp($element.parentElement))"
                xid="input2"/> 
            </div>  
            <div class="dropdown btn-group" component="$UI/system/components/bootstrap/dropdown/dropdown"
              xid="dropdown4"> 
              <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left dropdown-toggle "
                label="添加" icon="icon-android-add" xid="button5"> 
                <i class="icon-android-add" xid="i14"/>  
                <span xid="span16">添加</span> 
              </a>  
              <ul component="$UI/system/components/justep/menu/menu" class="x-menu dropdown-menu"
                xid="menu4"> 
                <li class="x-menu-item" xid="item8"> 
                  <a component="$UI/system/components/justep/button/button"
                    class="btn btn-link btn-icon-left" label="分配功能权限" xid="addFunPermissionBtn"
                    icon="img:$UI/SA/OPM/images/funPermission.gif|" onClick="addFunPermissionBtnClick"
                    bind-enable=" $model.roleData.val(&quot;sRoleKind&quot;) == 'fun'"> 
                    <img src="$UI/SA/OPM/images/funPermission.gif" xid="image3"/>  
                    <span xid="span17">分配功能权限</span> 
                  </a> 
                </li>  
                <li class="x-menu-item" xid="item9"> 
                  <a component="$UI/system/components/justep/button/button"
                    class="btn btn-link btn-icon-left" label="分配数据权限" xid="addDataPermissionBtn"
                    icon="img:$UI/SA/OPM/images/dataPermission.gif|" onClick="addDataPermissionBtnClick"> 
                    <img src="$UI/SA/OPM/images/dataPermission.gif" xid="image4"/>  
                    <span xid="span18">分配数据权限</span> 
                  </a> 
                </li> 
              </ul> 
            </div>  
            <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left "
              label="删除" xid="deletePermissionBtn" icon="icon-android-remove" onClick="deletePermissionBtnClick"> 
              <i xid="i17" class="icon-android-remove"/>  
              <span xid="span19">删除</span> 
            </a>  
            <div class="dropdown btn-group" component="$UI/system/components/bootstrap/dropdown/dropdown"
              xid="dropdown3" autoHideMenu="false"> 
              <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left dropdown-toggle"
                label="选项" icon="icon-android-more" xid="button7"> 
                <i class="icon-android-more" xid="i4"/>  
                <span xid="span10">选项</span> 
              </a>  
              <ul component="$UI/system/components/justep/menu/menu" class="x-menu dropdown-menu"
                xid="menu1"> 
                <li class="x-menu-item" xid="item7"> 
                  <a xid="a4"> 
                    <span component="$UI/system/components/justep/button/checkbox"
                      class="x-checkbox" xid="checkbox2" label="显示从父角色继承的权限" bind-ref="tempData.ref('showInheritedPermission')"/> 
                  </a> 
                </li> 
              </ul> 
            </div> 
          </div> 
        </div>  
        <div class="x-panel-content" xid="content2"> 
          <div component="$UI/system/components/justep/dataTables/dataTables"
            flexibleWidth="true" rowActiveClass="active" class="table table-hover"
            xid="permissionDataTables" data="permissionData" multiSelect="true" onCellRender="permissionDataTablesCellRender"
            onRowCheck="permissionDataTablesRowCheck" onRowClick="permissionDataTablesRowClick"> 
            <columns xid="columns4"> 
              <column name="sPermissionKind" xid="column17" label="　" width="20px"
                className="x-dt-cell-center" orderable="false"/>  
              <column name="sActivityFName" xid="column16" label="功能权限"/>  
              <column name="actionsLabel" xid="column18" label="动作权限/数据权限"/>  
              <column name="roleName" xid="column19" label="所属角色"/> 
            </columns> 
          </div> 
        </div>  
        <div class="x-panel-bottom" xid="bottom2"> 
          <div component="$UI/system/components/justep/pagerBar/pagerBar" class="x-pagerbar container-fluid"
            xid="pagerBar1" data="permissionData"> 
            <div class="row" xid="div1"> 
              <div class="col-sm-3" xid="div2"> 
                <div class="x-pagerbar-length" xid="div3"> 
                  <label component="$UI/system/components/justep/pagerLimitSelect/pagerLimitSelect"
                    class="x-pagerlimitselect" xid="pagerLimitSelect1"> 
                    <span xid="span1">显示</span>  
                    <select component="$UI/system/components/justep/select/select"
                      class="form-control input-sm" xid="select1"> 
                      <option value="10" xid="default3">10</option>  
                      <option value="20" xid="default4">20</option>  
                      <option value="50" xid="default9">50</option>  
                      <option value="100" xid="default10">100</option> 
                    </select>  
                    <span xid="span12">条</span> 
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
                        <span aria-hidden="true" xid="span13">«</span>  
                        <span class="sr-only" xid="span14">Previous</span> 
                      </a> 
                    </li>  
                    <li class="next" xid="li2"> 
                      <a href="#" xid="a2"> 
                        <span aria-hidden="true" xid="span15">»</span>  
                        <span class="sr-only" xid="span20">Next</span> 
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
  <span component="$UI/system/components/justep/windowDialog/windowDialog" xid="dataPermissionDialog"
    style="left:213px;top:287px;" src="$UI/SA/OPM/dialogs/showDataPermission/dataPermissionDetail.w"
    title="数据权限" showTitle="true" status="normal" width="90%" onReceive="dataPermissionDialogReceive" />  
  <span component="$UI/system/components/justep/windowDialog/windowDialog" xid="actionPermissionDialog"
    style="left:261px;top:286px;" src="$UI/SA/OPM/dialogs/showActionPermission/actionPermissionDetail.w"
    title="动作权限" showTitle="true" status="normal" width="50%"  onReceive="actionPermissionDialogReceive"/> 
</div>
