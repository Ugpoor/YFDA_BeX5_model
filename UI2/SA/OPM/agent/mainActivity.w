<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window" component="$UI/system/components/justep/window/window"
  design="device:pc">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:275px;top:286px;" onLoad="modelLoad"> 
    <div component="$UI/system/components/justep/data/bizData" xid="agentData"
      concept="SA_OPAgent" autoLoad="true" onBeforeRefresh="agentDataBeforeRefresh"
      directDelete="true" orderBy="sCreateTime desc" confirmDelete="false" confirmRefresh="false"> 
      <reader xid="default1" action="/SA/OPM/logic/action/queryOPAgentAction"/>  
      <writer xid="default2" action="/SA/OPM/logic/action/saveOPAgentAction"/> 
    </div> 
  </div>  
  <div component="$UI/system/components/justep/toolBar/toolBar" class="x-toolbar form-inline x-toolbar-spliter"
    xid="toolBar1">
    <div class="input-group" component="$UI/system/components/justep/smartFilter/smartFilter"
      xid="smartFilter1" filterData="agentData" filterCols="sOrgFName,sStartTime,sFinishTime,processLabel,agentPersonName"
      style="float: right;"> 
      <input type="text" class="form-control" placeholder="搜索" data-bind="valueUpdate: ['input', 'afterkeydown']"
        bind-value="$model.comp($element.parentElement).searchText" bind-change="$model.comp($element.parentElement).onInputChange.bind($model.comp($element.parentElement))"
        xid="input1"/> 
    </div>
    <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left dropdown-toggle"
      label="新建" icon="icon-android-add" xid="newBtn" onClick="newBtnClick"> 
      <i class="icon-android-add" xid="i2"/>  
      <span xid="span7"/>
    </a>  
    <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left dropdown-toggle"
      label="编辑" icon="icon-edit" xid="editBtn" onClick="editBtnClick"> 
      <i class="icon-edit" xid="i1"/>  
      <span xid="span8">编辑</span>
    </a>  
    <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left dropdown-toggle"
      label="删除" icon="icon-android-remove" xid="deleteBtn" onClick="deleteBtnClick"> 
      <i class="icon-android-remove" xid="i3"/>  
      <span xid="span9">删除</span>
    </a> 
  </div>  
  <div component="$UI/system/components/justep/dataTables/dataTables" flexibleWidth="true"
    rowActiveClass="active" class="table table-hover" xid="agentTable" data="agentData"
    onCellRender="agentTableCellRender" multiSelect="true" onRowDblClick="editBtnClick"> 
    <columns xid="columns1"> 
      <column name="sOrgFName" xid="column3" label="委托人"/>
      <column name="agentPersonName" xid="column2" label="代理人"/>  
      <column name="processLabel" xid="column9" label="委托权限"/>  
      <column name="sStartTime" xid="column4" label="开始时间"/>  
      <column name="sFinishTime" xid="column5" label="结束时间"/>  
      <column name="sCreatorName" xid="column6" label="创建人"/>  
      <column name="sCreateTime" xid="column7" label="创建时间"/> 
    </columns> 
  </div>  
  <div component="$UI/system/components/justep/pagerBar/pagerBar" class="x-pagerbar container-fluid"
    xid="pagerBar1"> 
    <div class="row" xid="div1"> 
      <div class="col-sm-3" xid="div2"> 
        <div class="x-pagerbar-length" xid="div3"> 
          <label component="$UI/system/components/justep/pagerLimitSelect/pagerLimitSelect"
            class="x-pagerlimitselect" xid="pagerLimitSelect1"> 
            <span xid="span1">显示</span>  
            <select component="$UI/system/components/justep/select/select" class="form-control input-sm"
              xid="select1"> 
              <option value="10" xid="default3">10</option>  
              <option value="20" xid="default4">20</option>  
              <option value="50" xid="default5">50</option>  
              <option value="100" xid="default6">100</option> 
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
                <span aria-hidden="true" xid="span3">«</span>  
                <span class="sr-only" xid="span4">Previous</span> 
              </a> 
            </li>  
            <li class="next" xid="li2"> 
              <a href="#" xid="a2"> 
                <span aria-hidden="true" xid="span5">»</span>  
                <span class="sr-only" xid="span6">Next</span> 
              </a> 
            </li> 
          </ul> 
        </div> 
      </div> 
    </div> 
  </div>  
  <span component="$UI/system/components/justep/windowDialog/windowDialog" xid="agentDetailDialog"
    style="left:186px;top:308px;" src="$UI/SA/OPM/dialogs/showAgent/agentDetail.w"
    title="委托代理" showTitle="true" status="normal"  height="60%" onReceive="agentDetailDialogReceive"/>
</div>
