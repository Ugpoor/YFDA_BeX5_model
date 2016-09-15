<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" component="$UI/system/components/justep/window/window" xid="window" sysParam="false">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:463px;top:331px;" onModelConstructDone="modelModelConstructDone">
    <div component="$UI/system/components/justep/data/data" autoLoad="false"
      xid="selectData" idColumn="SA_OPOrg" confirmDelete="false" confirmRefresh="false">
      <column label="组织ID" name="SA_OPOrg" type="String" xid="default1"/>  
      <column label="名称" name="sName" type="String" xid="default2"/>  
      <column label="全ID" name="sFID" type="String" xid="default3"/>
      <column label="编码" name="sCode" type="String" />
      <column label="长名称" name="sLongName" type="String" />
      <column label="全名称" name="sFName" type="String" />
      <column label="全编码" name="sFCode" type="String" />
      <column label="组织类型" name="sOrgKindID" type="String" />
      <column label="人员ID" name="sPersonID" type="String" />
    </div>
  <div component="$UI/system/components/justep/data/bizData" xid="orgSearchData" concept="SA_OPOrg" onBeforeRefresh="orgDataBeforeRefresh"><reader xid="default4" action="/system/logic/action/queryOrgAction"></reader></div></div>  
  <span component="$UI/system/components/justep/windowReceiver/windowReceiver"
    xid="windowReceiver" style="top:2px;left:606px;" onReceive="windowReceiverReceive"/>  
  <div component="$UI/system/components/justep/panel/panel" class="x-panel x-full"
    xid="panel1"> 
    <div class="x-panel-top container-fluid" xid="top2">
      <div component="$UI/system/components/bootstrap/row/row" class="row"
        xid="row2" style="height:100%;"> 
        <div class="col col-xs-6 col-sm-6 col-md-6 col-lg-6" xid="col4" style="height:100%;padding-left: 0;"><div class="input-group" component="$UI/system/components/bootstrap/inputGroup/inputGroup" xid="inputGroup1">
   <input type="text" class="form-control" component="$UI/system/components/justep/input/input" xid="filter" bind-keypress="filterKeypress" valueUpdateMode="input" onChange="filterChange"></input>
  <div class="input-group-btn" xid="div1">
   <a component="$UI/system/components/justep/button/button" class="btn btn-default btn-only-icon" xid="searchBtn" icon="icon-android-search" onClick="searchBtnClick">
    <i xid="i7" class="icon-android-search"></i>
    <span xid="span7"></span></a> </div></div></div>  
        <div class="col col-xs-1 col-sm-1 col-md-1 col-lg-1" xid="col6" style="height:100%;"/>
      <div class="col col-xs-5 col-sm-5 col-md-5 col-lg-5" xid="col3" style="height:100%;"><span component="$UI/system/components/justep/button/checkbox" class="x-checkbox" xid="cbCascade" label="级联选择"></span></div></div>
    </div>
    <div class="x-panel-content container-fluid" xid="content1" >
      <div component="$UI/system/components/bootstrap/row/row" class="row"
        xid="row1" style="height:100%;overflow: hidden;"> 
        <div class="col col-xs-6 col-sm-6 col-md-6 col-lg-6" xid="col1" style="height:100%;padding-left: 0;">
          <div component="$UI/system/components/justep/org/orgTreePC" xid="orgTree" style="height:100%;overflow-x: hidden;" bind-visible="!showFilterGird.get()" class="x-bordered"> 
            <div component="$UI/system/components/justep/data/bizData" autoLoad="false"
              xid="orgData" onBeforeRefresh="orgDataBeforeRefresh" onAfterRefresh="orgDataAfterRefresh" onCustomRefresh="orgDataCustomRefresh" onRefreshCreateParam="orgDataRefreshCreateParam"><treeOption xid="default5" delayLoad="true"></treeOption></div>  
            <div component="$UI/system/components/justep/grid/grid" appearance="tree"
              expandColumn="sName" useVirtualRoot="true" virtualRootLabel="组织机构" xid="orgGrid"
              width="100%" height="100%" onRowDblClick="orgGridRowDblClick" class="x-grid-no-bordered" rowAttr='$model.canSelect($row)?{}:{class:"x-disabled-select"}'> 
              <columns xid="columns2"> 
                <column name="sName" xid="column2"/>
              </columns> 
            </div> 
          </div>
          <div style="display:none;height:0;" bind-visible="showFilterGird" xid="searchDiv" class="x-bordered">
	          <div component="$UI/system/components/justep/dataTables/dataTables" flexibleWidth="true" data="orgSearchData" rowActiveClass="active" class="table table-striped" xid="searchGrid" scrollCollapse="false" ordering="false" lengthMenu="20" onRowDblClick="searchGridRowDblClick">
   <columns xid="columns3">
    <column name="sFName" xid="column3"></column></columns> </div></div>
        </div>  
        <div class="col col-xs-1 col-sm-1 col-md-1 col-lg-1" xid="col2" style="height:100%;padding:5% 0 0 0;">
          <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left btn-block"
            label="全选" xid="addAllBtn" icon="icon-chevron-right" onClick="addAllBtnClick"> 
            <i xid="i3" class="icon-chevron-right"/>  
            <span xid="span3">全选</span>
          </a>  
          <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left btn-block"
            label="选择" xid="addBtn" icon="icon-chevron-right" onClick="addBtnClick"> 
            <i xid="i4" class="icon-chevron-right"/>  
            <span xid="span4">选择</span>
          </a>  
          <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left btn-block"
            label="移除" xid="removeBtn" icon="icon-chevron-left" onClick="removeBtnClick"> 
            <i xid="i5" class="icon-chevron-left"/>  
            <span xid="span5">移除</span>
          </a>  
          <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left btn-block"
            label="清空" xid="removeAllBtn" icon="icon-chevron-left" onClick="removeAllBtnClick"> 
            <i xid="i6" class="icon-chevron-left"/>  
            <span xid="span6">清空</span>
          </a>
        </div>  
        <div class="col col-xs-5 col-sm-5 col-md-5 col-lg-5" xid="col7" style="height:100%;padding-right: 0;">
	        <div style="height:100%;" class="x-bordered">
	          <div component="$UI/system/components/justep/dataTables/dataTables" flexibleWidth="true" data="selectData" rowActiveClass="active" class="table table-striped" xid="selectGrid" scrollCollapse="false" ordering="false" onRowDblClick="selectGridRowDblClick">
   <columns xid="columns1">
    <column name="sName" xid="column1"></column></columns> </div></div>
        </div>
      </div>
    </div>  
    <div class="x-panel-bottom" xid="bottom1" height="42"> 
      <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-only-label x-dialog-button"
        label="取消" xid="button2" onClick="{&quot;operation&quot;:&quot;windowReceiver.windowCancel&quot;}"> 
        <i xid="i2"/>  
        <span xid="span2">取消</span> 
      </a>  
      <a component="$UI/system/components/justep/button/button" class="btn btn-primary x-dialog-button"
        label="确定" xid="OKBtn" onClick="OKBtnClick"> 
        <i xid="i1"/>  
        <span xid="span1">确定</span> 
      </a> 
    </div> 
  </div> 
</div>
