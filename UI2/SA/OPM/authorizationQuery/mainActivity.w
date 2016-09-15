<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window x-full-screen" component="$UI/system/components/justep/window/window"
  design="device:pc">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:64px;top:257px;"> 
    <div component="$UI/system/components/justep/data/bizData" xid="permissionByOrgData"
      concept="SA_OPPermission" onRefreshCreateParam="permissionByOrgDataRefreshCreateParam"
      confirmRefresh="false" directDelete="true"> 
      <reader xid="default1" action="/SA/OPM/logic/action/queryOPAuthorizePermissionByOrgAction"/> 
    </div>  
    <div component="$UI/system/components/justep/data/data" autoLoad="false"
      xid="funcTreeData" idColumn="id" onCustomRefresh="funcTreeDataCustomRefresh"
      isTree="true" onIndexChanged="funcTreeDataIndexChanged"> 
      <treeOption xid="default10" parentRelation="parent" nodeKindRelation="nodeKind"/>  
      <column name="id" type="String" xid="column8"/>  
      <column name="label" type="String" xid="column9"/>  
      <column name="path" type="String" xid="column10"/>  
      <column name="isFolder" type="String" xid="column11"/>  
      <column name="process" type="String" xid="column1"/>  
      <column name="activity" type="String" xid="default6"/>  
      <column name="url" type="String" xid="default7"/>  
      <column name="parent" type="String" xid="default8"/>  
      <column name="nodeKind" type="String" xid="default11"/>
    <rule xid="rule1">
   <col name="nodeKind" xid="ruleCol1">
    <calculate xid="calculate1">
     <expr xid="default12">$row.val(&quot;isFolder&quot;) ? '' : 'nkLeaf'</expr></calculate> </col> </rule></div>  
    <div component="$UI/system/components/justep/data/bizData" xid="orgByPermissionData"
      concept="SA_OPOrg" isTree="false" onRefreshCreateParam="orgByPermissionDataRefreshCreateParam">
      <reader xid="default9" action="/SA/OPM/logic/action/queryOrgByPermissionAction"/>
    </div>
  <div component="$UI/system/components/justep/data/bizData" xid="orgSearchData" concept="SA_OPOrg" onIndexChanged="orgSearchDataIndexChanged">
   <reader xid="default17" action="/system/logic/action/queryOrgAction"></reader></div>
  <div component="$UI/system/components/justep/data/data" autoLoad="false" xid="funcListData" idColumn="id" isTree="true" onCustomRefresh="funcListDataCustomRefresh" onIndexChanged="funcListDataIndexChanged" confirmRefresh="false">
   <treeOption nodeKindRelation="nodeKind" parentRelation="parent" xid="default21"></treeOption>
   <column name="id" type="String" xid="column34"></column>
   <column label="权限" name="label" type="String" xid="column33"></column>
   <column name="path" type="String" xid="column28"></column>
   <column name="isFolder" type="String" xid="column27"></column>
   <column name="process" type="String" xid="column26"></column>
   <column name="activity" type="String" xid="column31"></column>
   <column name="url" type="String" xid="column29"></column>
   <column name="parent" type="String" xid="column30"></column>
   <column name="nodeKind" type="String" xid="column32"></column>
   <rule xid="rule3">
    <col name="nodeKind" xid="ruleCol3">
     <calculate xid="calculate3">
      <expr xid="default20">$row.val(&quot;isFolder&quot;) ? '' : 'nkLeaf'</expr></calculate> </col> </rule> </div></div>  
  <div component="$UI/system/components/justep/panel/panel" class="x-panel x-full"
    xid="panel2"> 
    <div class="x-panel-top" xid="top2"> 
      <ul component="$UI/system/components/bootstrap/navs/navs" class="nav nav-tabs" xid="navs" onClick="navsClick">
   <li role="presentation" class="active" xid="tab1">
    <a xid="a5"><![CDATA[按组织查询权限]]></a></li> 
  <li xid="tab2">
   <a xid="a6"><![CDATA[按权限查询组织]]></a></li></ul></div>  
    <div class="x-panel-content" xid="content3"> 
      <div component="$UI/system/components/justep/contents/contents" class="x-contents x-full"
        active="0" xid="contents"> 
        <div class="x-contents-content container-fluid" xid="content1"> 
          <div component="$UI/system/components/bootstrap/row/row" class="row"
            xid="row1" style="height:100%;"> 
            <div class="col col-xs-3" xid="col1" style="height:100%; overflow: auto;"> 
              <div component="$UI/system/components/justep/toolBar/toolBar" class="x-toolbar form-inline x-toolbar-spliter" xid="toolBar3">
   <div class="input-group" component="$UI/system/components/bootstrap/inputGroup/inputGroup" xid="inputGroup1">
    <input type="text" class="form-control" component="$UI/system/components/justep/input/input" xid="filter" bind-keypress="filterKeypress" valueUpdateMode="input" onChange="filterChange"></input>
    <div class="input-group-btn" xid="div1">
     <a component="$UI/system/components/justep/button/button" class="btn btn-default btn-only-icon" xid="searchBtn" icon="icon-android-search" onClick="searchBtnClick">
      <i xid="i5" class="icon-android-search"></i>
      <span xid="span22"></span></a> </div> </div> </div><div component="$UI/system/components/justep/smartContainer/smartContainer"
                class="x-smartcontainer" xid="smartContainer1"> 
                <div component="$UI/system/components/justep/org/orgTreePC"
                  xid="orgTreePC" bind-visible="!showFilterGird.get()"> 
                  <div component="$UI/system/components/justep/data/bizData"
                    autoLoad="true" xid="orgTreeData" onIndexChanged="orgTreeDataIndexChanged"/>  
                  <div component="$UI/system/components/justep/grid/grid" appearance="tree"
                    expandColumn="sName" useVirtualRoot="false" virtualRootLabel="组织机构"
                    xid="grid2" class="x-grid-no-bordered" height="auto"> 
                    <columns xid="columns2"> 
                      <column name="sName" xid="column2"/> 
                    </columns> 
                  </div> 
                </div> 
              <div xid="searchDiv" class="x-bordered" style="display:none;height:0;" bind-visible="showFilterGird">
   <div component="$UI/system/components/justep/dataTables/dataTables" flexibleWidth="true" responsive="true" rowActiveClass="active" class="table table-hover table-striped" xid="searchGrid" data="orgSearchData" ordering="false">
    <columns xid="columns5">
     <column name="sFName" xid="column15"></column></columns> </div> </div></div> 
            </div>  
            <div class="col col-xs-9 col-spliter-left" xid="col2" style="height:100%;"> 
              <div component="$UI/system/components/justep/panel/panel" class="x-panel x-panel-opm-pc"
                xid="panel1" style="height:100%;"> 
                <div class="x-panel-top" xid="top1"> 
                  <div component="$UI/system/components/justep/toolBar/toolBar"
                    class="x-toolbar x-toolbar-spliter form-inline" xid="toolBar1"> 
                    <div class="input-group" component="$UI/system/components/justep/smartFilter/smartFilter"
                      xid="smartFilter1" filterData="permissionByOrgData" filterCols="sProcess,sActivityFName,sActivity,roleName"> 
                      <input type="text" class="form-control" placeholder="搜索"
                        data-bind="valueUpdate: ['input', 'afterkeydown']" bind-value="$model.comp($element.parentElement).searchText"
                        bind-change="$model.comp($element.parentElement).onInputChange.bind($model.comp($element.parentElement))"
                        xid="input1"/> 
                    </div> 
                  </div> 
                </div>  
                <div class="x-panel-content" xid="content4"> 
                  <div component="$UI/system/components/justep/dataTables/dataTables"
                    flexibleWidth="true" rowActiveClass="active" class="table table-striped table-hover text-nowrap"
                    xid="dataTables1" data="permissionByOrgData" responsive="false"> 
                    <columns xid="columns3"> 
                      <column name="roleName" xid="column7" label="角色"/>  
                      <column name="sActivityFName" xid="column4" label="功能"/>  
                      <column name="actionsLabel" xid="column6" label="动作权限/数据权限"
                        orderable="false"/>  
                      <column name="sProcess" xid="column3" label="process"/>  
                      <column name="sActivity" xid="column5" label="activity"/> 
                    </columns> 
                  </div> 
                </div>  
                <div class="x-panel-bottom" xid="bottom1"> 
                  <div component="$UI/system/components/justep/pagerBar/pagerBar"
                    class="x-pagerbar container-fluid" xid="pagerBar1" data="permissionByOrgData"> 
                    <div class="row" xid="div2"> 
                      <div class="col-sm-3" xid="div3"> 
                        <div class="x-pagerbar-length" xid="div4"> 
                          <label component="$UI/system/components/justep/pagerLimitSelect/pagerLimitSelect"
                            class="x-pagerlimitselect" xid="pagerLimitSelect1"> 
                            <span xid="span3">显示</span>  
                            <select component="$UI/system/components/justep/select/select"
                              class="form-control input-sm" xid="select1"> 
                              <option value="10" xid="default2">10</option>  
                              <option value="20" xid="default3">20</option>  
                              <option value="50" xid="default4">50</option>  
                              <option value="100" xid="default5">100</option> 
                            </select>  
                            <span xid="span4">条</span> 
                          </label> 
                        </div> 
                      </div>  
                      <div class="col-sm-3" xid="div5"> 
                        <div class="x-pagerbar-info" xid="div6">当前显示0条，共0条</div> 
                      </div>  
                      <div class="col-sm-6" xid="div7"> 
                        <div class="x-pagerbar-pagination" xid="div8"> 
                          <ul class="pagination" component="$UI/system/components/bootstrap/pagination/pagination"
                            xid="pagination1"> 
                            <li class="prev" xid="li1"> 
                              <a href="#" xid="a1"> 
                                <span aria-hidden="true" xid="span5">«</span>  
                                <span class="sr-only" xid="span6">Previous</span> 
                              </a> 
                            </li>  
                            <li class="next" xid="li2"> 
                              <a href="#" xid="a2"> 
                                <span aria-hidden="true" xid="span7">»</span>  
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
        <div class="x-contents-content container-fluid" xid="content2"> 
          <div component="$UI/system/components/bootstrap/row/row" class="row"
            xid="row2" style="height:100%;"> 
            <div class="col col-xs-3" xid="col3" style="height:100%; overflow: auto;"> 
              <div component="$UI/system/components/justep/smartContainer/smartContainer"
                class="x-smartcontainer" xid="smartContainer2"> 
                <div component="$UI/system/components/justep/toolBar/toolBar" class="x-toolbar form-inline x-toolbar-spliter" xid="toolBar5">
   <div class="input-group" component="$UI/system/components/bootstrap/inputGroup/inputGroup" xid="inputGroup3">
    <input type="text" class="form-control" component="$UI/system/components/justep/input/input" xid="filter2" bind-keypress="filterKeypress1" valueUpdateMode="input" onChange="filterChange1"></input>
    <div class="input-group-btn" xid="div18">
     <a component="$UI/system/components/justep/button/button" class="btn btn-default btn-only-icon" xid="search" icon="icon-android-search" onClick="searchClick">
      <i xid="i2" class="icon-android-search"></i>
      <span xid="span2"></span></a> </div> </div> </div><div xid="div16" bind-visible="!showFilterGird2.get()"><div component="$UI/system/components/justep/grid/grid" xid="funcTreeGrid" data="funcTreeData" height="auto" hiddenCaptionbar="true" appearance="tree" expandColumn="label" multiselect="false" cascade="true" class="x-grid-no-bordered" width="100%"> 
                  <columns xid="columns1"> 
                    <column name="label" xid="column12" /> 
                  </columns> 
                </div></div> 
              <div xid="searchDiv2" class="x-bordered" style="display:none;height:0;" bind-visible="showFilterGird2">
   <div component="$UI/system/components/justep/dataTables/dataTables" flexibleWidth="true" responsive="true" rowActiveClass="active" class="table table-hover table-striped" xid="searchGrid2" data="funcListData" ordering="false" filter="$model.filter($row)">
    <columns xid="columns9">
     <column name="label" xid="column38"></column></columns> </div> </div>
  </div> 
            </div>  
            <div class="col col-xs-9 col-spliter-left" xid="col4" style="height:100%;"> 
              <div component="$UI/system/components/justep/panel/panel" class="x-panel x-panel-opm-pc"
                xid="panel3" style="height:100%;"> 
                <div class="x-panel-top" xid="top3">
                  <div component="$UI/system/components/justep/toolBar/toolBar"
                    class="x-toolbar form-inline x-toolbar-spliter" xid="toolBar2">
                    <div class="input-group" component="$UI/system/components/justep/smartFilter/smartFilter"
                      xid="smartFilter2" filterData="orgByPermissionData" filterCols="orgFName,roleName"> 
                      <input type="text" class="form-control" placeholder="搜索"
                        data-bind="valueUpdate: ['input', 'afterkeydown']" bind-value="$model.comp($element.parentElement).searchText"
                        bind-change="$model.comp($element.parentElement).onInputChange.bind($model.comp($element.parentElement))"
                        xid="input2"/> 
                    </div>
                  </div>
                </div>  
                <div class="x-panel-content" xid="content5">
                  <div component="$UI/system/components/justep/dataTables/dataTables"
                    flexibleWidth="true" rowActiveClass="active" class="table table-striped table-hover text-nowrap"
                    xid="dataTables2" data="orgByPermissionData"> 
                    <columns xid="columns4">
                      <column name="roleName" xid="column14" label="角色"/>
                      <column name="orgFName" xid="column13" label="组织"/> 
                    </columns>
                  </div>
                </div>  
                <div class="x-panel-bottom" xid="bottom2"><div component="$UI/system/components/justep/pagerBar/pagerBar" class="x-pagerbar container-fluid" xid="pagerBar2" data="orgByPermissionData">
   <div class="row" xid="div9">
    <div class="col-sm-3" xid="div10">
     <div class="x-pagerbar-length" xid="div11">
      <label component="$UI/system/components/justep/pagerLimitSelect/pagerLimitSelect" class="x-pagerlimitselect" xid="pagerLimitSelect2">
       <span xid="span9">显示</span>
       <select component="$UI/system/components/justep/select/select" class="form-control input-sm" xid="select2">
        <option value="10" xid="default13">10</option>
        <option value="20" xid="default14">20</option>
        <option value="50" xid="default15">50</option>
        <option value="100" xid="default16">100</option></select> 
       <span xid="span10">条</span></label> </div> </div> 
    <div class="col-sm-3" xid="div12">
     <div class="x-pagerbar-info" xid="div13">当前显示0条，共0条</div></div> 
    <div class="col-sm-6" xid="div14">
     <div class="x-pagerbar-pagination" xid="div15">
      <ul class="pagination" component="$UI/system/components/bootstrap/pagination/pagination" xid="pagination2">
       <li class="prev" xid="li3">
        <a href="#" xid="a3">
         <span aria-hidden="true" xid="span11">«</span>
         <span class="sr-only" xid="span12">Previous</span></a> </li> 
       <li class="next" xid="li4">
        <a href="#" xid="a4">
         <span aria-hidden="true" xid="span13">»</span>
         <span class="sr-only" xid="span14">Next</span></a> </li> </ul> </div> </div> </div> </div></div> 
              </div> 
            </div> 
          </div> 
        </div> 
      </div> 
    </div> 
  </div> 
</div>
