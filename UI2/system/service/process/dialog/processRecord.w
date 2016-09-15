<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window" component="$UI/system/components/justep/window/window">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:193px;top:274px;"> 
    <div component="$UI/system/components/justep/data/bizData" xid="processRecordData"
      concept="SA_Task" columns="sName,sActivityName,sExecutorDeptName,sExecutorPersonName,sContent,sActualStartTime,sActualFinishTime"> 
      <reader xid="default1" action="/system/logic/action/queryProcessExecuteListAction"/> 
    </div> 
  </div>  
  <span xid="windowReceive" component="$UI/system/components/justep/windowReceiver/windowReceiver"
    onReceive="windowReceiveReceive" style="left:332px;top:107px;"/>  
  <div component="$UI/system/components/justep/panel/panel" class="x-panel x-full"
    xid="panel"> 
    <div class="x-panel-top" xid="top"> 
      <div component="$UI/system/components/justep/toolBar/toolBar" class="x-toolbar form-inline"
        xid="bar"> 
        <div class="x-smartFilter-clear-hide input-group" component="$UI/system/components/justep/smartFilter/smartFilter"
          xid="smartFilter" filterData="processRecordData" filterCols="sName,sActivityName,sExecutorPersonName,sExecutorDeptName,sContent,sActualFinishTime"> 
          <input type="text" class="form-control" placeholder="搜索" data-bind="valueUpdate: ['input', 'afterkeydown']"
            bind-value="$model.comp($element.parentElement).searchText" bind-change="$model.comp($element.parentElement).onInputChange.bind($model.comp($element.parentElement))"
            xid="input1"/>  
          <span class="input-group-addon x-smartFilter-refresh" bind-click="$model.comp($element.parentElement).refresh.bind($model.comp($element.parentElement))"
            xid="span1"> 
            <i class="icon-android-search" xid="i1"/> 
          </span> 
        </div> 
        <div component="$UI/system/components/justep/button/buttonGroup" class="btn-group pull-right"
          tabbed="false" xid="pageBar">
          <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
            xid="preBtn" onClick="{operation:'processRecordData.prevPage'}"> 
            <i xid="i4"/>  
            <span xid="span4"/> 
          </a>  
          <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
            xid="nextBtn" onClick="{operation:'processRecordData.nextPage'}"> 
            <i xid="i5"/>  
            <span xid="span5">下页</span> 
          </a>
        </div> 
      </div> 
    </div>  
    <div class="x-panel-content x-bordered" xid="content"> 
      <div component="$UI/system/components/justep/dataTables/dataTables" flexibleWidth="true"
        rowActiveClass="active" class="table table-hover table-striped" xid="table"
        data="processRecordData"> 
        <columns xid="columns1"> 
          <column name="sName" xid="column1"/>  
          <column name="sExecutorDeptName" xid="column3"/>  
          <column name="sExecutorPersonName" xid="column2"/>  
          <column name="sActivityName" xid="column4"/>  
          <column name="sActualFinishTime" xid="column6" format="yyyy-MM-dd hh:mm"/>  
          <column name="sContent" xid="column7"/> 
        </columns> 
      </div> 
    </div> 
  </div> 
</div>
