<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window" component="$UI/system/components/justep/window/window"
  design="device:pc">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:350px;top:227px;" onLoad="modelLoad" onModelConstruct="modelModelConstruct"> 
    <div component="$UI/system/components/justep/data/bizData" xid="flowData"
      concept="SA_Task" orderBy="sCreateTime desc" autoLoad="false" limit="20" onBeforeRefresh="flowDataBeforeRefresh"> 
      <reader xid="default1" action="/system/logic/action/queryTaskCenterAction1"/>  
      <writer xid="default2"/>  
      <creator xid="default3"/>  
      <filter name="flowFilter" xid="filter1"><![CDATA[SA_Task.sKindID='tkProcessInstance']]></filter> 
    </div>  
    <div component="$UI/system/components/justep/data/bizData" xid="taskData"
      concept="SA_Task" autoLoad="true" limit="10" orderBy="sCreateTime desc" onBeforeRefresh="taskDataBeforeRefresh"> 
      <filter name="taskFilter" xid="filter2"><![CDATA[SA_Task.sExecutorFID like '/%' AND NOT(SA_Task.sName IS NULL) AND ((SA_Task.sKindID='tkTask') OR (SA_Task.sKindID='tkExecutor') OR (SA_Task.sKindID IS NULL))]]></filter>  
      <reader xid="default4" action="/system/logic/action/queryTaskCenterAction1"/>  
      <writer xid="default5" action="/system/logic/action/saveTaskCenterAction1"/>  
      <creator xid="default6"/>  
      <master xid="default7" data="flowData" relation="sFlowID"/> 
    </div>  
    <div component="$UI/system/components/justep/data/data" autoLoad="true"
      xid="statusData" idColumn="value"> 
      <column label="名称" name="name" type="String" xid="default10"/>  
      <column label="值" name="value" type="String" xid="default11"/>  
      <data xid="default22">[{"name":"全部","value":"all"},{"name":"处理中","value":"executing"},{"name":"已完成","value":"finished"},{"name":"已暂停","value":"paused"},{"name":"已终止","value":"aborted"}]</data> 
    </div>  
    <div component="$UI/system/components/justep/data/data" autoLoad="true"
      xid="filterData" idColumn="id"> 
      <data xid="default18">[{"statusName":"处理中","statusID":"executing","id":"filter"}]</data>  
      <column label="状态名称" name="statusName" type="String" xid="default19"/>  
      <column label="状态标识" name="statusID" type="String" xid="default20"/>  
      <column label="标识" name="id" type="String" xid="default21"/> 
    </div> 
  </div>  
  <span component="$UI/system/components/justep/bizFilter/bizFilter" xid="flowFilter"
    filterData="flowData"/>  
  <div component="$UI/system/components/justep/popMenu/popMenu" class="x-popMenu"
    xid="taskMenu" opacity="0" direction="left-bottom" anchor="moreBtn"> 
    <div class="x-popMenu-overlay" xid="menuOverlay"/>  
    <ul component="$UI/system/components/justep/menu/menu" class="x-menu dropdown-menu x-popMenu-content"
      xid="menuContent"> 
      <li class="x-menu-item" xid="titleItem"> 
        <a component="$UI/system/components/justep/button/button" class="btn btn-link"
          label="修改标题" xid="modifyTitleBtn" onClick="modifyTitleBtnClick" bind-enable=" $model.canModifyTitle()"> 
          <i xid="i7"/>  
          <span xid="span7">修改标题</span> 
        </a> 
      </li>  
      <li class="x-menu-item" xid="abortItem"> 
        <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
          xid="abortBtn" icon="icon-stop" label="终止" bind-enable=" $model.canAbort()"
          onClick="abortBtnClick"> 
          <i xid="i10" class="icon-stop"/>  
          <span xid="span10">终止</span> 
        </a> 
      </li>  
      <li class="x-menu-item" xid="suspendItem"> 
        <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
          xid="suspendBtn" label="暂停" icon="icon-pause" onClick="suspendBtnClick"
          bind-enable=" $model.canSuspend()"> 
          <i xid="i11" class="icon-pause"/>  
          <span xid="span11">暂停</span> 
        </a> 
      </li>  
      <li class="x-menu-item" xid="resumeItem"> 
        <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
          xid="resumeBtn" icon="icon-arrow-right-b" label="唤醒" onClick="resumeBtnClick"
          bind-enable=" $model.canResume()"> 
          <i xid="i8" class="icon-arrow-right-b"/>  
          <span xid="span8">唤醒</span> 
        </a> 
      </li>  
      <!--  
      <li class="x-menu-item" xid="custItem"> 
        <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
          xid="custBtn" onClick="{operation:'process.customized', args:{task: 'js:$model.taskData.getCurrentRowID()'}}"> 
          <i xid="i13"/>  
          <span xid="span13">流程定制</span> 
        </a> 
      </li> 
      -->  
      <li class="x-menu-item" xid="recyItem"> 
        <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
          xid="recyBtn" label="回收" icon="icon-android-system-back" onClick="recyBtnClick"
          bind-enable=" $model.canRecy()"> 
          <i xid="i12" class="icon-android-system-back"/>  
          <span xid="span12">回收</span> 
        </a> 
      </li>  
      <li class="x-menu-item" xid="recordItem"> 
        <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
          xid="recordBtn" onClick="recordBtnClick" label="流程记录" icon="icon-android-note"
          bind-enable=" $model.hasTaskData()"> 
          <i xid="i22" class="icon-android-note"/>  
          <span xid="span22">流程记录</span> 
        </a> 
      </li> 
    </ul> 
  </div>  
  <div component="$UI/system/components/bootstrap/tabs/tabs" xid="tabs"> 
    <ul class="nav nav-tabs" xid="nav"> 
      <li class="active" xid="li1"> 
        <a content="flowContent" xid="flowItem"><![CDATA[流程列表]]></a> 
      </li>  
      <li role="presentation" xid="li2"> 
        <a content="taskContent" xid="taskItem"><![CDATA[任务列表]]></a> 
      </li> 
    </ul>  
    <div class="tab-content" xid="tabContent"> 
      <div class="tab-pane active " xid="flowContent"> 
        <div component="$UI/system/components/justep/toolBar/toolBar" class="x-toolbar x-toolbar-spliter form-inline"
          xid="flowBar"> 
          <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
            xid="flowChartBtn" bind-enable=" $model.canShowChart()" label="流程图" icon="icon-image"
            onClick="flowChartBtnClick"> 
            <i xid="i50" class="icon-image"/>  
            <span xid="span50">流程图</span> 
          </a>  
          <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
            xid="refreshBtn" onClick="{operation:'flowData.refresh'}"> 
            <i xid="i1"/>  
            <span xid="span1"/> 
          </a>  
          <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
            xid="filterBtn" onClick="{operation:'flowFilter.menu'}"> 
            <i xid="i2"/>  
            <span xid="span2"/> 
          </a>  
          <div class="x-control" component="$UI/system/components/justep/dateFilter/dateFilter"
            xid="dateFilter" filterData="flowData" dateCol="sCreateTime" defaultValue="all"
            autoRefresh="true"> 
            <div class="x-gridSelect" component="$UI/system/components/justep/gridSelect/gridSelect"
              xid="gridSelect2" style="width:80px;" optionHeight="390"> 
              <option xid="option2"/> 
            </div> 
          </div>  
          <div class="x-gridSelect" component="$UI/system/components/justep/gridSelect/gridSelect"
            xid="statusSelect" style="width:80px;" bind-ref="filterData.ref('statusID')"
            bind-labelRef="filterData.ref('statusName')" onUpdateValue="statusSelectUpdateValue"> 
            <option xid="option1" data="statusData" value="value" label="name"/> 
          </div>  
          <div class="x-smartFilter-clear-hide input-group" component="$UI/system/components/justep/smartFilter/smartFilter"
            xid="smartFilter" filterData="flowData" filterCols="sName,sStatusName,sCreatorPersonName,sCreateTime,sActualStartTime,sActualFinishTime"
            style="width:180px;" autoRefresh="true"> 
            <input type="text" class="form-control" placeholder="搜索" data-bind="valueUpdate: ['input', 'afterkeydown']"
              bind-value="$model.comp($element.parentElement).searchText" bind-change="$model.comp($element.parentElement).onInputChange.bind($model.comp($element.parentElement))"
              xid="input1"/>  
            <span class="input-group-addon x-smartFilter-refresh" bind-click="$model.comp($element.parentElement).refresh.bind($model.comp($element.parentElement))"
              xid="span9"> 
              <i class="icon-android-search" xid="i9"/> 
            </span> 
          </div> 
        </div>  
        <div component="$UI/system/components/justep/dataTables/dataTables"
          flexibleWidth="true" rowActiveClass="active" class="table table-hover table-striped"
          xid="flowTable" data="flowData"> 
          <columns xid="columns1"> 
            <column name="sName" xid="column1"/>  
            <column name="sStatusName" xid="column6" label="状态"/>  
            <column name="sCreatorPersonName" xid="column5"/>  
            <column name="sCreateTime" xid="column2"/>  
            <column name="sActualStartTime" xid="column3"/>  
            <column name="sActualFinishTime" xid="column4"/> 
          </columns> 
        </div>  
        <div component="$UI/system/components/justep/pagerBar/pagerBar" class="x-pagerbar container-fluid"
          xid="flowPagerBar" data="flowData"> 
          <div class="row" xid="div1"> 
            <div class="col-sm-3" xid="div2"> 
              <div class="x-pagerbar-length" xid="div3"> 
                <label component="$UI/system/components/justep/pagerLimitSelect/pagerLimitSelect"
                  class="x-pagerlimitselect" xid="pagerLimitSelect1"> 
                  <span xid="span14">显示</span>  
                  <select component="$UI/system/components/justep/select/select"
                    class="form-control input-sm" xid="select1"> 
                    <option value="10" xid="default8">10</option>  
                    <option value="20" xid="default9">20</option>  
                    <option value="50" xid="default12">50</option>  
                    <option value="100" xid="default13">100</option> 
                  </select>  
                  <span xid="span15">条</span> 
                </label> 
              </div> 
            </div>  
            <div class="col-sm-3" xid="div4"> 
              <div class="x-pagerbar-info" xid="div5">当前显示1-10条，共16条</div> 
            </div>  
            <div class="col-sm-6" xid="div6"> 
              <div class="x-pagerbar-pagination" xid="div7"> 
                <ul class="pagination" component="$UI/system/components/bootstrap/pagination/pagination"
                  xid="pagination1"> 
                  <li class="prev" xid="li7"> 
                    <a href="#" xid="a5"> 
                      <span aria-hidden="true" xid="span16">«</span>  
                      <span class="sr-only" xid="span17">Previous</span> 
                    </a> 
                  </li>  
                  <li class="next" xid="li8"> 
                    <a href="#" xid="a6"> 
                      <span aria-hidden="true" xid="span18">»</span>  
                      <span class="sr-only" xid="span24">Next</span> 
                    </a> 
                  </li> 
                </ul> 
              </div> 
            </div> 
          </div> 
        </div> 
      </div>  
      <div class="tab-pane" xid="taskContent"> 
        <div component="$UI/system/components/justep/toolBar/toolBar" class="x-toolbar x-toolbar-spliter form-inline"
          xid="taskBar"> 
          <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
            xid="chartBtn" bind-enable=" $model.canShowChart()" label="流程图" icon="icon-image"
            onClick="flowChartBtnClick"> 
            <i xid="i20" class="icon-image"/>  
            <span xid="span20">流程图</span> 
          </a>  
          <a component="$UI/system/components/justep/button/button" class="btn btn-link"
            label="查看表单" xid="dataBtn" onClick="dataBtnClick" bind-enable=" $model.canShowData()"> 
            <i xid="i21"/>  
            <span xid="span21">查看表单</span> 
          </a>  
          <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
            xid="taskRefreshBtn" onClick="{operation:'taskData.refresh'}"> 
            <i xid="i3"/>  
            <span xid="span3"/> 
          </a>  
          <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
            xid="taskFilterBtn" onClick="{operation:'taskFilter.menu'}"> 
            <i xid="i4"/>  
            <span xid="span4"/> 
          </a>  
          <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
            xid="specialBtn" onClick="specialBtnClick" label="特送" icon="icon-arrow-graph-up-right"
            bind-enable=" $model.canSpecial()"> 
            <i xid="i5" class="icon-arrow-graph-up-right"/>  
            <span xid="span5">特送</span> 
          </a>  
          <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
            xid="modifyExecutorBtn" onClick="modifyExecutorBtnClick" bind-enable=" $model.canModifyExecutor()"
            label="修改执行者" icon="icon-person"> 
            <i xid="i6" class="icon-person"/>  
            <span xid="span6">修改执行者</span> 
          </a>  
          <a component="$UI/system/components/justep/button/button" class="btn btn-link"
            label="更多" xid="moreBtn" onClick="moreBtnClick"> 
            <i xid="i19"/>  
            <span xid="span19">更多</span> 
          </a>  
          <div class="input-group" component="$UI/system/components/justep/smartFilter/smartFilter"
            xid="taskFitler" filterData="taskData" filterCols="sName,sStatusName,sExecutorPersonName,sCreatorPersonName,sActualStartTime,sActualFinishTime"
            style="width:180px;"> 
            <input type="text" class="form-control" placeholder="搜索" data-bind="valueUpdate: ['input', 'afterkeydown']"
              bind-value="$model.comp($element.parentElement).searchText" bind-change="$model.comp($element.parentElement).onInputChange.bind($model.comp($element.parentElement))"
              xid="input2"/>  
            <span class="input-group-addon x-smartFilter-refresh" bind-click="$model.comp($element.parentElement).refresh.bind($model.comp($element.parentElement))"
              xid="span31"> 
              <i class="icon-android-search" xid="i14"/> 
            </span> 
          </div> 
        </div>  
        <div component="$UI/system/components/justep/dataTables/dataTables"
          flexibleWidth="true" rowActiveClass="active" class="table table-hover table-striped"
          xid="taskTable" data="taskData"> 
          <columns xid="columns2"> 
            <column name="sName" xid="column8"/>  
            <column name="sStatusName" xid="column9" label="状态"/>  
            <column name="sExecutorPersonName" xid="column15"/>  
            <column name="sCreatorPersonName" xid="column17"/>  
            <column name="sActualStartTime" xid="column11"/>  
            <column name="sActualFinishTime" xid="column12"/> 
          </columns> 
        </div>  
        <div component="$UI/system/components/justep/pagerBar/pagerBar" class="x-pagerbar container-fluid"
          xid="taskPagerBar" data="taskData"> 
          <div class="row" xid="div8"> 
            <div class="col-sm-3" xid="div9"> 
              <div class="x-pagerbar-length" xid="div10"> 
                <label component="$UI/system/components/justep/pagerLimitSelect/pagerLimitSelect"
                  class="x-pagerlimitselect" xid="pagerLimitSelect2"> 
                  <span xid="span25">显示</span>  
                  <select component="$UI/system/components/justep/select/select"
                    class="form-control input-sm" xid="select2"> 
                    <option value="10" xid="default14">10</option>  
                    <option value="20" xid="default15">20</option>  
                    <option value="50" xid="default16">50</option>  
                    <option value="100" xid="default17">100</option> 
                  </select>  
                  <span xid="span26">条</span> 
                </label> 
              </div> 
            </div>  
            <div class="col-sm-3" xid="div11"> 
              <div class="x-pagerbar-info" xid="div12">当前显示1-10条，共16条</div> 
            </div>  
            <div class="col-sm-6" xid="div13"> 
              <div class="x-pagerbar-pagination" xid="div14"> 
                <ul class="pagination" component="$UI/system/components/bootstrap/pagination/pagination"
                  xid="pagination2"> 
                  <li class="prev" xid="li9"> 
                    <a href="#" xid="a7"> 
                      <span aria-hidden="true" xid="span27">«</span>  
                      <span class="sr-only" xid="span28">Previous</span> 
                    </a> 
                  </li>  
                  <li class="next" xid="li10"> 
                    <a href="#" xid="a8"> 
                      <span aria-hidden="true" xid="span29">»</span>  
                      <span class="sr-only" xid="span30">Next</span> 
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
  <span component="$UI/system/components/justep/bizFilter/bizFilter" xid="taskFilter" filterData="taskData"/>  
  <div component="$UI/system/components/justep/process/process" xid="process"
    autoClose="false" autoStart="false" autoSave="false" autoFilter="false"/>  
  <div component="$UI/system/components/bootstrap/dialog/dialog" class="modal fade"
    xid="titleDialog"> 
    <div class="modal-dialog" xid="div15"> 
      <div class="modal-content" xid="div16"> 
        <div class="modal-header" xid="div17"> 
          <button type="button" class="close" data-dismiss="modal" xid="button1"> 
            <span aria-hidden="true" xid="span13">×</span>  
            <span class="sr-only" xid="span23">Close</span> 
          </button>  
          <h4 class="modal-title" xid="h41"><![CDATA[修改标题]]></h4> 
        </div>  
        <div class="modal-body" xid="div18"> 
          <div class="form-horizontal container-fluid" component="$UI/system/components/bootstrap/form/form"
            xid="dialogForm"> 
            <div class="form-group" xid="formGroup2"> 
              <div class="col-sm-2" xid="div24"> 
                <label class="control-label" xid="titleLabel"><![CDATA[标题：]]></label> 
              </div>  
              <div class="col-sm-10" xid="div25"> 
                <input component="$UI/system/components/justep/input/input" class="form-control"
                  xid="titleContent" bind-ref="taskData.ref('sName')"/> 
              </div> 
            </div> 
          </div> 
        </div>  
        <div class="modal-footer" xid="div19"> 
          <a class="btn btn-link btn-only-label x-dialog-button" component="$UI/system/components/justep/button/button"
            label="取消" xid="cancelBtn" onClick="cancelBtnClick"> 
            <i xid="i4_1"/>  
            <span xid="span4_1">取消</span> 
          </a>  
          <a class="btn btn-primary btn-only-label x-dialog-button" component="$UI/system/components/justep/button/button"
            label="确定" xid="okBtn" onClick="okBtnClick"> 
            <i xid="i3_1"/>  
            <span xid="span3_1">确定</span> 
          </a> 
        </div> 
      </div> 
    </div> 
  </div> 
</div>
