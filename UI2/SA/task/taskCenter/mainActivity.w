<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" class="window" component="$UI/system/components/justep/window/window"
  xid="window" design="device:pc;">  
  <div component="$UI/system/components/justep/model/model" xid="model" onLoad="modelLoad"
    style="height:auto;left:338px;top:197px;" onActive="modelActive"> 
    <div component="$UI/system/components/justep/data/bizData" xid="taskData"
      directDelete="true" autoLoad="false" concept="SA_Task" orderBy="sCreateTime desc"
      limit="10" onRefreshCreateParam="taskDataRefreshCreateParam" onBeforeRefresh="taskDataBeforeRefresh"> 
      <reader action="/SA/task/logic/action/queryTaskCenterAction"/>  
      </div>  
    <div component="$UI/system/components/justep/data/data" autoLoad="true"
      xid="conditionData" idColumn="id"> 
      <data xid="default7">[{"id":"id"}]</data>  
      <column label="id" name="id" type="String" xid="default4"/>  
      <column label="状态" name="status" type="String" xid="default5"/>  
      <column label="条件" name="text" type="String" xid="default6"/>  
      <column label="状态名称" name="statusLabel" type="String" xid="default8"/> 
    </div>  
    <div component="$UI/system/components/justep/data/data" autoLoad="true"
      xid="statusData" idColumn="id"> 
      <column label="id" name="id" type="String" xid="default1"/>  
      <column label="name" name="name" type="String" xid="default2"/>  
      <data xid="default3">[{"id":"waiting","name":"待办"},{"id":"finished","name":"已办"},{"id":"submited","name":"提交"}]</data> 
    </div> 
  </div>  
  <span component="$UI/system/components/justep/bizFilter/bizFilter" xid="bizFilter"
    filterData="taskData" style="left:268px;top:184px;"/>  
  <div component="$UI/system/components/justep/popMenu/popMenu" class="x-popMenu"
    xid="moreMenu" anchor="moreBtn" opacity="0" direction="left-bottom"> 
    <div class="x-popMenu-overlay" xid="menuOverlay"/>  
    <ul component="$UI/system/components/justep/menu/menu" class="x-menu dropdown-menu x-popMenu-content"
      xid="menuContent">
      <li class="x-menu-item" xid="refreshItem">
	      <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
	        xid="refreshBtn" onClick='{"operation":"taskData.refresh"}'> 
	        <i xid="i3"/>  
	        <span xid="span4"/> 
	      </a>  
      </li>
       
      <li class="x-menu-item" xid="recyTaskItem"> 
        <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
          bind-enable="$model.canRecycle() " xid="recyTaskBtn" onClick="recyTaskBtnClick"
          label="回收" icon="icon-android-system-back"> 
          <i xid="i6" class="icon-android-system-back"/>  
          <span xid="span7">回收</span> 
        </a> 
      </li>  
      <li class="x-menu-item" xid="chartItem"> 
        <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
          bind-enable="$model.canShowChart()" label="" xid="chartBtn" onClick="{operation:'process.showChart', args:{task: 'js:$model.taskData.getCurrentRowID()'}}"> 
          <i xid="i7"/>  
          <span xid="span1"/> 
        </a> 
      </li>  
      <li class="x-menu-item" xid="recordItem"> 
        <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
          bind-enable="$model.canProcessRecord()" label="" xid="recordBtn" onClick="{operation:'process.processRecord', args:{task: 'js:$model.taskData.getCurrentRowID()'}}"> 
          <i xid="i8"/>  
          <span xid="span8"/> 
        </a> 
      </li> 
    </ul> 
  </div>  
  <div xid="view"> 
    <div component="$UI/system/components/justep/toolBar/toolBar" class="x-toolbar x-toolbar-spliter form-inline"
      xid="bar"> 
      <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
        label="处理" xid="executeBtn" icon="icon-android-checkmark" onClick="executeBtnClick"
        bind-enable="$model.canExecute()"> 
        <i xid="i1" class="icon-android-checkmark"/>  
        <span xid="span2">处理</span> 
      </a>  
      <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
        label="查看" xid="viewBtn" icon="icon-ios7-eye" onClick="viewBtnClick" bind-enable="$model.canBrowse()"> 
        <i xid="i2" class="icon-ios7-eye"/>  
        <span xid="span3">查看</span> 
      </a>  
       <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
         label="" xid="filterBtn" icon="icon-search" onClick="{operation:'bizFilter.menu'}"> 
         <i xid="i4" class="icon-search"/>  
         <span xid="span5"></span> 
       </a> 
      <a component="$UI/system/components/justep/button/button" class="btn btn-link"
        label="更多" xid="moreBtn" onClick="moreBtnClick"> 
        <i xid="i5"/>  
        <span xid="span6">更多</span> 
      </a>  
      <div component="$UI/system/components/justep/dateFilter/dateFilter" xid="dateFilter"
        class="x-control" filterData="taskData" filterMode="singleDate" dateCol="sCreateTime"
        defaultValue="all" autoRefresh="true"> 
        <div class="x-gridSelect" component="$UI/system/components/justep/gridSelect/gridSelect"
          xid="gridSelect" style="width:70px;" optionHeight="390"> 
          <option xid="option2"/> 
        </div> 
      </div>  
      <div component="$UI/system/components/justep/orgFilter/orgFilter" xid="orgFilter"
        class="x-control" useMyself="true" onFilter="orgFilterFilter" defaultValue="_myself_"
        autoRefresh="true"> 
        <div class="x-gridSelect" component="$UI/system/components/justep/org/orgSelectPC"
          xid="orgSelectPC1" manageCodes="businessManagement" multiselect="true" style="width:140px;"> 
          <option xid="option3"> 
            <columns xid="columns2"> 
              <column name="sName" xid="column1"/> 
            </columns> 
          </option> 
        </div> 
      </div>  
      <div class="x-gridSelect" component="$UI/system/components/justep/gridSelect/gridSelect"
        xid="statusSelect" bind-ref="conditionData.ref('status')" bind-labelRef="conditionData.ref('statusLabel')"
        style="width:100px;" multiselect="true" onUpdateValue="statusSelectUpdateValue"> 
        <option xid="option1" data="statusData" value="id" label="name"/> 
      </div>  
      <div class="x-smartFilter-clear-hide input-group" component="$UI/system/components/justep/smartFilter/smartFilter"
        xid="smartFilter" filterData="taskData" filterCols="sName,sTypeName,sCreatorPersonName,sExecutorPersonName,sStatusName,sCreateTime,sExecuteTime"
        style="width:140px;" autoRefresh="true"> 
        <input type="text" class="form-control" placeholder="搜索" data-bind="valueUpdate: ['input', 'afterkeydown']"
          bind-value="$model.comp($element.parentElement).searchText" bind-change="$model.comp($element.parentElement).onInputChange.bind($model.comp($element.parentElement))"
          xid="input1"/>  
        <span class="input-group-addon x-smartFilter-refresh" bind-click="$model.comp($element.parentElement).refresh.bind($model.comp($element.parentElement))"
          xid="span9"> 
          <i class="icon-android-search" xid="i9"/> 
        </span> 
      </div> 
    </div>  
    <div component="$UI/system/components/justep/dataTables/dataTables" flexibleWidth="true"
      rowActiveClass="active" class="table" xid="list" data="taskData" pagingType="simple_numbers"> 
      <columns xid="columns1"> 
        <column name="sName"/>  
        <column name="sTypeName" label="类型"/>  
        <column name="sStatusName" label="状态"/>  
        <column name="sCreatorPersonName"/>  
        <column name="sCreateTime" format="yyyy-MM-dd hh:mm"/>  
        <column name="sExecutorPersonName"/>  
        <column name="sExecuteTime" format="yyyy-MM-dd hh:mm"/> 
      </columns> 
    </div> 
  <div component="$UI/system/components/justep/pagerBar/pagerBar" class="x-pagerbar container-fluid" xid="pagerBar" data="taskData">
   <div class="row" xid="div1">
    <div class="col-sm-3" xid="div2">
     <div class="x-pagerbar-length" xid="div3">
      <label component="$UI/system/components/justep/pagerLimitSelect/pagerLimitSelect" class="x-pagerlimitselect" xid="pagerLimitSelect1">
       <span xid="span10">显示</span>
       <select component="$UI/system/components/justep/select/select" class="form-control input-sm" xid="select1">
        <option value="10" xid="default9">10</option>
        <option value="20" xid="default10">20</option>
        <option value="50" xid="default11">50</option>
        <option value="100" xid="default12">100</option></select> 
       <span xid="span11">条</span></label> </div> </div> 
    <div class="col-sm-3" xid="div4">
     <div class="x-pagerbar-info" xid="div5">当前显示1-10条，共16条</div></div> 
    <div class="col-sm-6" xid="div6">
     <div class="x-pagerbar-pagination" xid="div7">
      <ul class="pagination" component="$UI/system/components/bootstrap/pagination/pagination" xid="pagination1">
       <li class="prev" xid="li1">
        <a href="#" xid="a1">
         <span aria-hidden="true" xid="span12">«</span>
         <span class="sr-only" xid="span13">Previous</span></a> </li> 
       <li class="next" xid="li2">
        <a href="#" xid="a2">
         <span aria-hidden="true" xid="span14">»</span>
         <span class="sr-only" xid="span15">Next</span></a> </li> </ul> </div> </div> </div> </div></div>  
  <div component="$UI/system/components/justep/process/process" xid="process"
    autoClose="false" autoStart="false" autoSave="false" autoFilter="false"/> 
</div>
