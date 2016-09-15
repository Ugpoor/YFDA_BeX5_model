<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window container-fluid x-full-screen" component="$UI/system/components/justep/window/window">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:494px;top:135px;"
    onModelConstructDone="modelModelConstructDone"> 
    <div component="$UI/system/components/justep/data/bizData" xid="orgListData"
      concept="SA_OPOrg" autoLoad="false" onRefreshCreateParam="orgListDataRefreshCreateParam"
      limit="20" onBeforeRefresh="orgListDataBeforeRefresh"> 
      <reader xid="default5" action="/SA/OPM/logic/action/queryOPOrgAction"/> 
    </div>  
    <div component="$UI/system/components/justep/data/data" autoLoad="false"
      xid="orgKindsData" idColumn="id"> 
      <column label="id" name="id" type="String" xid="default10"/>  
      <column label="label" name="label" type="String" xid="default11"/>  
      <column label="show" name="show" type="String" xid="default12"/>  
      <rule xid="rule1"> 
        <col name="show" xid="ruleCol1"> 
          <calculate xid="calculate1"> 
            <expr xid="default13">'显示' + val('label')</expr> 
          </calculate> 
        </col> 
      </rule> 
    </div>  
    <div component="$UI/system/components/justep/data/data" autoLoad="false"
      xid="tempData" idColumn="id" autoNew="true" onValueChanged="tempDataValueChanged"> 
      <column label="id" name="id" type="String" xid="default4"/>  
      <column label="showDisabled" name="showDisabled" type="String" xid="default6"/>  
      <column label="showAllChildren" name="showAllChildren" type="String" xid="default7"/>  
      <column label="onlyShowMasterPsm" name="onlyShowMasterPsm" type="String"
        xid="default8"/>  
      <column label="listOrgKinds" name="listOrgKinds" type="String" xid="default9"/> 
    </div> 
  <div component="$UI/system/components/justep/data/bizData" xid="orgSearchData" concept="SA_OPOrg" onIndexChanged="orgSearchDataIndexChanged">
   <reader xid="default17" action="/system/logic/action/queryOrgAction"></reader></div></div>  
  <span component="$UI/system/components/justep/windowDialog/windowDialog" xid="orgDetailDialog"
    style="left:136px;top:424px;" src="$UI/SA/OPM/dialogs/showOrg/orgDetail.w" title="组织"
    status="normal" showTitle="true" onReceive="orgDetailDialogReceive" 
    />  
  <span component="$UI/system/components/justep/windowDialog/windowDialog" xid="personDetailDialog"
    style="left:176px;top:423px;" src="$UI/SA/OPM/dialogs/showPerson/personDetail.w"
    title="人员" showTitle="true" status="normal" onReceive="personDetailDialogReceive"
     height="85%"/>  
  <span component="$UI/system/components/justep/org/orgDialogPC" showTitle="true"
    xid="assignPersonOrgDialog" style="left:212px;top:422px;" title="分配人员" status="normal"
    selectFilter="js:$row &amp;&amp; $row.val('sOrgKindID') == 'psm'"  
    multiSelection="true" onReceive="assignPersonOrgDialogReceive"/>  
  <span component="$UI/system/components/justep/windowDialog/windowDialog" xid="sortOrgDialog"
    style="left:250px;top:422px;" src="$UI/SA/OPM/dialogs/sortOrg/sortOrg.w" title="排序"
    showTitle="true" status="normal" width="50%"  onReceive="sortOrgDialogReceive"/>  
  <span component="$UI/system/components/justep/org/orgDialogPC" showTitle="true"
    xid="moveOrgDialog" style="left:294px;top:422px;" title="移动到" status="normal"
    width="50%"  onReceive="moveOrgDialogReceive"/>  
  <span component="$UI/system/components/justep/windowDialog/windowDialog" xid="changeMainOrgDialog"
    style="left:341px;top:421px;" src="$UI/SA/OPM/dialogs/selectOrg/selectOrgByList.w"
    title="选择主要岗位" status="normal" showTitle="true" width="60%"  onReceive="changeMainOrgDialogReceive"/>  
  <div component="$UI/system/components/bootstrap/row/row" class="row" xid="row1"
    style="height:100%;"> 
    <div class="col col-xs-3" xid="col1" style="height:100%;overflow: auto;"> 
      <div component="$UI/system/components/justep/toolBar/toolBar" class="x-toolbar form-inline x-toolbar-spliter" xid="toolBar2">
   <div class="input-group" component="$UI/system/components/bootstrap/inputGroup/inputGroup" xid="inputGroup1">
    <input type="text" class="form-control" component="$UI/system/components/justep/input/input" xid="filter" bind-keypress="filterKeypress" valueUpdateMode="input" onChange="filterChange"></input>
    <div class="input-group-btn" xid="div10">
     <a component="$UI/system/components/justep/button/button" class="btn btn-default btn-only-icon" xid="searchBtn" icon="icon-android-search" onClick="searchBtnClick">
      <i xid="i5" class="icon-android-search"></i>
      <span xid="span22"></span></a> </div> </div> </div><div component="$UI/system/components/justep/smartContainer/smartContainer"
        class="x-smartcontainer" xid="smartContainer1"> 
        <div component="$UI/system/components/justep/org/orgTreePC" xid="orgTreePC1" bind-visible="!showFilterGird.get()"> 
          <div component="$UI/system/components/justep/data/bizData" autoLoad="false"
            xid="orgTreeData" onIndexChanged="orgTreeDataIndexChanged" onBeforeRefresh="orgTreeDataBeforeRefresh"> 
            <filter name="filter0" xid="filter2"><![CDATA[SA_OPOrg.sOrgKindID <> 'psm']]></filter>  
            <calculateRelation relation="isLeaf" xid="calculateRelation2"/>  
            <rule xid="rule2"> 
              <col name="isLeaf" xid="ruleCol2"> 
                <calculate xid="calculate2"> 
                  <expr xid="default14">js:$model.isTreeLeaf($row.val('sOrgKindID')) ? 'nkLeaf' : null</expr> 
                </calculate> 
              </col> 
            </rule>  
            <treeOption xid="default15" nodeKindRelation="isLeaf"/> 
          </div>  
          <div component="$UI/system/components/justep/grid/grid" appearance="tree"
            expandColumn="sName" useVirtualRoot="true" virtualRootLabel="组织机构" xid="orgTreeGrid"
            height="auto" class="x-grid-no-bordered"> 
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
          <div component="$UI/system/components/justep/toolBar/toolBar" class="x-toolbar x-toolbar-spliter"
            xid="toolBar1"> 
            <div class="x-control" component="$UI/system/components/justep/smartFilter/smartFilter"
              xid="smartFilter1" filterData="orgListData" filterCols="sName,sCode"
              style="float: right;"> 
              <input type="text" class="form-control" placeholder="搜索" data-bind="valueUpdate: ['input', 'afterkeydown']"
                bind-value="$model.comp($element.parentElement).searchText" bind-change="$model.comp($element.parentElement).onInputChange.bind($model.comp($element.parentElement))"
                xid="input1"/> 
            </div>  
            <div class="dropdown btn-group" component="$UI/system/components/bootstrap/dropdown/dropdown"
              xid="dropdown1"> 
              <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left dropdown-toggle"
                label="新建" icon="icon-android-add-contact" xid="newBtn"> 
                <i class="icon-android-add-contact" xid="i2"/>  
                <span xid="span3"/> 
              </a>  
              <ul component="$UI/system/components/justep/menu/menu" class="x-menu dropdown-menu"
                xid="menu1"> 
                <li class="x-menu-item" xid="item2" bind-foreach="orgKindsData.datas"> 
                  <a component="$UI/system/components/justep/button/button"
                    class="btn btn-link btn-icon-left" label="新建" xid="newOrgBtn"
                    bind-attr-orgkind="$object.val('id')" bind-enable="$model.newOrgIsEnabled($object.val('id'))"
                    onClick="newOrgBtnClick"> 
                    <img bind-attr-src="$model.orgKinds.getImageURL($object.val('id'))"
                      xid="image1"/>  
                    <span xid="span5" bind-text="'新建' + $object.val('label')"/> 
                  </a> 
                </li>  
                <li class="x-menu-divider divider" xid="divider2"/>  
                <li class="x-menu-item" xid="item3"> 
                  <a component="$UI/system/components/justep/button/button"
                    class="btn btn-link btn-icon-left" xid="assignPersonBtn" label="分配下级人员"
                    bind-enable="$model.newOrgIsEnabled('psm')" onClick="assignPersonBtnClick"> 
                    <img bind-attr-src="$model.orgKinds.getImageURL('psm')"
                      xid="image2"/>  
                    <span xid="span6">分配人员</span> 
                  </a> 
                </li> 
              </ul> 
            </div>  
            <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
              label="编辑" xid="editBtn" onClick="editBtnClick" icon="icon-compose"
              bind-enable="$model.orgListData.getCurrentRow()"> 
              <i xid="i7" class="icon-compose"/>  
              <span xid="span7">编辑</span> 
            </a>  
            <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
              label="移动" xid="moveBtn" icon="icon-forward" onClick="moveBtnClick"
              bind-enable="$model.orgListData.getCurrentRow()"> 
              <i xid="i13" class="icon-forward"/>  
              <span xid="span16">移动</span> 
            </a>  
            <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
              label="排序" xid="sortBtn" icon="icon-arrow-swap" onClick="sortBtnClick"
              bind-enable="$model.orgTreeData.getCurrentRow() || $model.comp('orgTreeGrid').getSelection()"> 
              <i xid="i14" class="icon-arrow-swap"/>  
              <span xid="span17">排序</span> 
            </a>  
            <div class="dropdown btn-group" component="$UI/system/components/bootstrap/dropdown/dropdown"
              xid="dropdown3" autoHideMenu="false"> 
              <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left dropdown-toggle"
                label="选项" icon="icon-android-more" xid="button4"> 
                <i class="icon-android-more" xid="i4"/>  
                <span xid="span8">选项</span> 
              </a>  
              <ul component="$UI/system/components/justep/menu/menu" class="x-menu dropdown-menu"
                xid="menu3"> 
                <li class="x-menu-item" xid="item8"> 
                  <a> 
                    <span component="$UI/system/components/justep/button/checkbox"
                      class="x-checkbox" xid="showDisabledCheckbox" label="显示已禁用的组织"
                      bind-ref="tempData.ref('showDisabled')"/> 
                  </a> 
                </li>  
                <li class="x-menu-item" xid="item9"> 
                  <a> 
                    <span component="$UI/system/components/justep/button/checkbox"
                      class="x-checkbox" xid="showAllChildrenCheckbox" label="显示所有下级组织"
                      bind-ref="tempData.ref('showAllChildren')"/> 
                  </a> 
                </li>  
                <li class="x-menu-item" xid="item10"> 
                  <a> 
                    <span component="$UI/system/components/justep/button/checkbox"
                      class="x-checkbox" xid="onlyShowMasterPsmCheckbox" bind-ref="tempData.ref('onlyShowMasterPsm')"
                      label="只显示人员主岗"/> 
                  </a> 
                </li>  
                <li class="x-menu-divider divider" xid="divider4"/>  
                <li class="x-menu-item" xid="item11"> 
                  <a> 
                    <span>组织类型过滤</span>  
                    <span component="$UI/system/components/justep/select/checkboxGroup"
                      class="x-checkbox-group" xid="checkboxGroup1" bind-ref="tempData.ref('listOrgKinds')"
                      bind-itemset="orgKindsData" bind-itemsetValue="ref('id')" bind-itemsetLabel="ref('label')"
                      itemStyle="display: block;"/> 
                  </a> 
                </li> 
              </ul> 
            </div>  
            <div class="dropdown btn-group" component="$UI/system/components/bootstrap/dropdown/dropdown"
              xid="moreDropDown"> 
              <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left dropdown-toggle"
                label="更多" icon="icon-arrow-down-b" xid="button3"> 
                <i class="icon-arrow-down-b" xid="i6"/>  
                <span xid="span10">更多</span> 
              </a>  
              <ul component="$UI/system/components/justep/menu/menu" class="x-menu dropdown-menu"
                xid="menu2"> 
                <li class="x-menu-item" xid="item1"> 
                  <a component="$UI/system/components/justep/button/button"
                    class="btn btn-link btn-icon-left" label="启用" xid="enableOrgBtn"
                    icon="icon-unlocked" onClick="enableOrgBtnClick" bind-enable="$model.orgListData.val('sValidState') == 0"> 
                    <i xid="i8" class="icon-unlocked"/>  
                    <span xid="span11">启用</span> 
                  </a> 
                </li>  
                <li class="x-menu-item" xid="item4"> 
                  <a component="$UI/system/components/justep/button/button"
                    class="btn btn-link btn-icon-left" label="禁用" xid="disableBtn"
                    icon="icon-locked" onClick="disableBtnClick" bind-enable="$model.orgListData.val('sValidState') == 1"> 
                    <i xid="i9" class="icon-locked"/>  
                    <span xid="span12">禁用</span> 
                  </a> 
                </li>  
                <li class="x-menu-divider divider" xid="divider1"/>  
                <li class="x-menu-item" xid="item5"> 
                  <a component="$UI/system/components/justep/button/button"
                    class="btn btn-link btn-icon-left" label="删除" xid="logicDeleteBtn"
                    icon="icon-android-trash" onClick="logicDeleteBtnClick" bind-enable="$model.orgListData.getCurrentRow()"> 
                    <i xid="i10" class="icon-android-trash"/>  
                    <span xid="span13">删除</span> 
                  </a> 
                </li>  
                <li class="x-menu-divider divider" xid="divider3"/>  
                <li class="x-menu-item" xid="item6"> 
                  <a component="$UI/system/components/justep/button/button"
                    class="btn btn-link btn-icon-left" label="重置密码" xid="resetPasswordBtn"
                    icon="icon-key" onClick="resetPasswordBtnClick" bind-enable="$model.orgKinds.isPersonMember($model.orgListData.val('sOrgKindID'))"> 
                    <i xid="i11" class="icon-key"/>  
                    <span xid="span14">重置密码</span> 
                  </a> 
                </li>  
                <li class="x-menu-item" xid="item7"> 
                  <a component="$UI/system/components/justep/button/button"
                    class="btn btn-link btn-icon-left" label="设置主岗" xid="changeMainOrgBtn"
                    icon="icon-android-contacts" bind-enable="$model.orgKinds.isPersonMember($model.orgListData.val('sOrgKindID'))"
                    onClick="changeMainOrgBtnClick"> 
                    <i xid="i12" class="icon-android-contacts"/>  
                    <span xid="span15">设置主岗</span> 
                  </a> 
                </li>  
                <li class="x-menu-item" xid="item18"> 
                  <a component="$UI/system/components/justep/button/button"
                    class="btn btn-link btn-icon-left" label="刷新组织缓存" xid="refreshOrgCacheBtn"
                    icon="icon-load-c" onClick="refreshOrgCache"> 
                    <i xid="i113" class="icon-load-c"/>  
                    <span xid="span116">刷新组织缓存</span> 
                  </a> 
                </li> 
              </ul> 
            </div> 
          </div>
        </div>  
        <div class="x-panel-content" xid="content1">
          <div component="$UI/system/components/justep/dataTables/dataTables"
            flexibleWidth="true" rowActiveClass="active" class="table table-hover"
            xid="orgListDataTables" data="orgListData" onRowDblClick="editBtnClick"
            onCellRender="orgListDataTablesCellRender"> 
            <columns xid="columns3"> 
              <column name="sOrgKindID" xid="column9" label="　" width="20px" orderable="false"
                className="x-dt-cell-center"/>  
              <column name="sName" xid="column6"/>  
              <column name="sCode" xid="column7"/>  
              <column name="sFName" xid="column8"/> 
            </columns> 
          </div>
        </div>  
        <div class="x-panel-bottom" xid="bottom1">
          <div component="$UI/system/components/justep/pagerBar/pagerBar" class="x-pagerbar container-fluid"
            xid="pagerBar1" data="orgListData"> 
            <div class="row" xid="div1"> 
              <div class="col-sm-3" xid="div2"> 
                <div class="x-pagerbar-length" xid="div3" style="height:104px;width:456px;"> 
                  <label component="$UI/system/components/justep/pagerLimitSelect/pagerLimitSelect"
                    class="x-pagerlimitselect" xid="pagerLimitSelect1"> 
                    <span xid="span1">显示</span>  
                    <select component="$UI/system/components/justep/select/select"
                      class="form-control input-sm" xid="select1"> 
                      <option value="10" xid="default1">10</option>  
                      <option value="20" xid="default2">20</option>  
                      <option value="50" xid="default3">50</option>  
                      <option value="100" xid="default16">100</option> 
                    </select>  
                    <span xid="span2">条</span> 
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
                        <span class="sr-only" xid="span9">Previous</span> 
                      </a> 
                    </li>  
                    <li class="next" xid="li2"> 
                      <a href="#" xid="a2"> 
                        <span aria-hidden="true" xid="span18">»</span>  
                        <span class="sr-only" xid="span19">Next</span> 
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
