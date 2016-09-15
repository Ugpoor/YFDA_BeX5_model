<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" component="$UI/system/components/justep/window/window" xid="window" sysParam="false">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:357px;top:-9px;"
    onModelConstructDone="modelModelConstructDone"> 
    <div component="$UI/system/components/justep/data/data" autoLoad="false"
      xid="selectData" idColumn="SA_OPOrg" confirmDelete="false" confirmRefresh="false"> 
      <column label="组织ID" name="SA_OPOrg" type="String" xid="default1"/>  
      <column label="名称" name="sName" type="String" xid="default2"/>  
      <column label="全ID" name="sFID" type="String" xid="default3"/>  
      <column label="编码" name="sCode" type="String"/>  
      <column label="长名称" name="sLongName" type="String"/>  
      <column label="全名称" name="sFName" type="String"/>  
      <column label="全编码" name="sFCode" type="String"/>  
      <column label="组织类型" name="sOrgKindID" type="String"/>  
      <column label="人员ID" name="sPersonID" type="String"/> 
    </div>  
    <div component="$UI/system/components/justep/data/bizData" xid="orgSearchData"
      concept="SA_OPOrg" onBeforeRefresh="orgDataBeforeRefresh">
      <reader xid="default4" action="/system/logic/action/queryOrgAction"/>
    </div>
  </div>  
  <span component="$UI/system/components/justep/windowReceiver/windowReceiver"
    xid="windowReceiver" style="top:2px;left:606px;" onReceive="windowReceiverReceive"/>  
  <div component="$UI/system/components/justep/panel/panel" class="x-panel x-full"
    xid="panel1"> 
    <div class="x-panel-top" xid="top2"> 
      <div xid="row2" style="height:100%;"> 
          <div class="input-group" component="$UI/system/components/bootstrap/inputGroup/inputGroup"
            xid="inputGroup1"> 
            <input type="text" class="form-control" component="$UI/system/components/justep/input/input"
              xid="filter" bind-keypress="filterKeypress"/>  
            <div class="input-group-btn" xid="div1"> 
              <a component="$UI/system/components/justep/button/button" class="btn btn-default btn-only-icon"
                xid="searchBtn" icon="icon-android-search" onClick="searchBtnClick"> 
                <i xid="i7" class="icon-android-search"/>  
                <span xid="span7"/>
              </a> 
            </div>
          </div>
      </div> 
    </div>  
    <div class="x-panel-content" xid="content1"> 
      <div 
        xid="row1" style="height:100%;overflow: hidden;"> 
          <div component="$UI/system/components/justep/org/orgTreePC" xid="orgTree"
            style="height:100%;overflow-x: hidden;" bind-visible="!showFilterGird.get()" class="x-bordered"> 
            <div component="$UI/system/components/justep/data/bizData" autoLoad="false"
              xid="orgData" onBeforeRefresh="orgDataBeforeRefresh" onAfterRefresh="orgDataAfterRefresh" onCustomRefresh="orgDataCustomRefresh" onRefreshCreateParam="orgDataRefreshCreateParam"><treeOption xid="default5" delayLoad="true"></treeOption></div>  
            <div component="$UI/system/components/justep/grid/grid" appearance="tree"
              expandColumn="sName" useVirtualRoot="true" virtualRootLabel="组织机构" xid="orgGrid"
              width="100%" height="100%" onRowSelect="orgGridRowSelect" onBeforeRowSelect="orgGridBeforeRowSelect" class="x-grid-no-bordered"> 
              <columns xid="columns2"> 
                <column name="sName" xid="column2"/> 
              </columns> 
            </div> 
          </div>  
          <div style="display:none;height:0;position: absolute;" bind-visible="showFilterGird"
            xid="searchDiv"> 
            <div component="$UI/system/components/justep/grid/grid" xid="searchGrid"
              data="orgSearchData" hiddenCaptionbar="true" width="100%" height="100%"
              multiselect="false" onRowSelect="searchGridRowSelect" onBeforeRowSelect="searchGridBeforeRowSelect"> 
              <columns> 
                <column name="sFName" sortable="false"/> 
              </columns> 
            </div> 
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
        label="确定" xid="OKBtn" onClick="OKBtnClick" bind-enable="canReturn"> 
        <i xid="i1"/>  
        <span xid="span1">确定</span> 
      </a> 
    </div> 
  </div> 
</div>
