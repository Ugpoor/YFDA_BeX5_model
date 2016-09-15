<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window" component="$UI/system/components/justep/window/window"
  design="device:mobile">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:291px;top:160px;"> 
    <div component="$UI/system/components/justep/data/bizData" xid="orgData"
      concept="SA_OPOrg" limit="-1"> 
      <reader xid="default1" action="/SA/OPM/logic/action/queryOPOrgAction"/>  
      <filter name="filter0" xid="filter1"><![CDATA[SA_OPOrg.sValidState = 1]]></filter> 
    </div> 
  </div>  
  <span component="$UI/system/components/justep/windowReceiver/windowReceiver"
    xid="windowReceiver" style="left:292px;top:328px;" onReceive="windowReceiverReceive"/>  
  <div component="$UI/system/components/justep/panel/panel" class="x-panel x-full"
    xid="panel1"> 
    <div class="x-panel-top form-inline" xid="top1"> 
      <div component="$UI/system/components/justep/smartFilter/smartFilter"
        xid="smartFilter" filterData="orgData" filterCols="sName,sCode,sFName" class="x-control"> 
        <input type="text" class="form-control" placeholder="搜索" data-bind="valueUpdate: ['input', 'afterkeydown']"
          bind-value="$model.comp($element.parentElement).searchText" bind-change="$model.comp($element.parentElement).onInputChange.bind($model.comp($element.parentElement))"
          xid="input1"/>
      </div>
    </div>  
    <div class="x-panel-content x-bordered" xid="content1"> 
      <div component="$UI/system/components/justep/dataTables/dataTables" flexibleWidth="true"
        rowActiveClass="active" class="table table-hover" xid="orgDataTables" data="orgData"
        onCellRender="orgDataTablesCellRender"> 
        <columns xid="columns2"> 
          <column name="sOrgKindID" xid="column4" label="　" width="20px" orderable="false"
            className="x-dt-cell-center"/>  
          <column name="sFName" xid="column3" label="组织路径"/> 
        </columns> 
      </div> 
    </div>  
    <div class="x-panel-bottom" xid="bottom1"> 
      <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-only-label x-dialog-button"
        label="取消" xid="cancelBtn" onClick='{"operation":"windowReceiver.windowCancel"}'> 
        <i xid="i4"/>  
        <span xid="span4">取消</span> 
      </a>  
      <a component="$UI/system/components/justep/button/button" class="btn btn-primary btn-only-label x-dialog-button"
        label="确定" xid="okBtn" onClick="okBtnClick" bind-enable="$model.orgData.getCurrentRow()"> 
        <i xid="i3"/>  
        <span xid="span3">确定</span> 
      </a> 
    </div> 
  </div> 
</div>
