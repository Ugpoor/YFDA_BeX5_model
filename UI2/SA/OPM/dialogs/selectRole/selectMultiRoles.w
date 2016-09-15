<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window" component="$UI/system/components/justep/window/window">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:252px;top:307px;"> 
    <div component="$UI/system/components/justep/data/bizData" xid="roleData"
      concept="SA_OPRole" onRefreshCreateParam="roleDataRefreshCreateParam" limit="-1"> 
      <reader xid="default1" action="/SA/OPM/logic/action/queryOPRoleAction"/>  
      <filter name="filter0" xid="filter1"><![CDATA[SA_OPRole.sValidState = 1]]></filter> 
    </div> 
  </div>  
  <span component="$UI/system/components/justep/windowReceiver/windowReceiver"
    xid="windowReceiver" style="left:151px;top:297px;" onReceive="windowReceiverReceive"/>  
  <div component="$UI/system/components/justep/panel/panel" class="x-panel x-full"
    xid="panel1"> 
    <div class="x-panel-top form-inline" xid="top1"> 
      <div component="$UI/system/components/justep/smartFilter/smartFilter"
        xid="smartFilter" filterData="roleData" filterCols="sName,sCode" class="x-control"> 
        <input type="text" class="form-control" placeholder="搜索" data-bind="valueUpdate: ['input', 'afterkeydown']"
          bind-value="$model.comp($element.parentElement).searchText" bind-change="$model.comp($element.parentElement).onInputChange.bind($model.comp($element.parentElement))"
          xid="input2"/> 
      </div> 
    </div>  
    <div class="x-panel-content x-bordered" xid="content1"> 
      <div component="$UI/system/components/justep/dataTables/dataTables" flexibleWidth="true"
        rowActiveClass="active" class="table table-hover" xid="roleDataTables" data="roleData"
        multiSelect="true" onCellRender="roleDataTablesCellRender"> 
        <columns xid="columns2"> 
          <column name="sRoleKind" xid="column8" label="　" width="20px" className="x-dt-cell-center"
            orderable="false"/>  
          <column name="sName" xid="column6"/>  
          <column name="sCode" xid="column7"/>  
          </columns> 
      </div> 
    </div>  
    <div class="x-panel-bottom" xid="bottom1"> 
      <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-only-label x-dialog-button"
        label="取消" xid="cancelBtn" onClick='{"operation":"windowReceiver.windowCancel"}'> 
        <i xid="i1"/>  
        <span xid="span1">取消</span> 
      </a>  
      <a component="$UI/system/components/justep/button/button" class="btn btn-primary btn-only-label x-dialog-button"
        label="确定" xid="okBtn" onClick="okBtnClick"> 
        <i xid="i2"/>  
        <span xid="span2">确定</span> 
      </a> 
    </div> 
  </div> 
</div>
