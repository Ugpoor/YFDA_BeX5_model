<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" component="$UI/system/components/justep/window/window" xid="window">  
  <div component="$UI/system/components/justep/model/model" xid="model" onLoad="modelLoad"
    style="height:auto;left:87px;top:358px;"> 
    <div component="$UI/system/components/justep/data/bizData" xid="taskData"
      directDelete="true" autoLoad="true" concept="SA_WorkTask" orderBy="sCreateTime desc"
      onSaveCommit="saveCommit" limit="15"> 
      <reader action="/SA/task/logic/action/queryWorkTaskAction"/>  
      <writer action="/SA/task/logic/action/saveWorkTaskAction"/>  
      <creator action="/SA/task/logic/action/createWorkTaskAction"/>  
      <calculateRelation relation="calcCheckBox"/> 
    </div>  
    <div xid="importanceData" component="$UI/system/components/justep/data/bizData"
      concept="SA_Importance" autoLoad="false"> 
      <reader action="/system/logic/action/queryImportanceAction"/> 
    </div>  
    <div xid="emergencyData" component="$UI/system/components/justep/data/bizData"
      concept="SA_Emergency" autoLoad="false"> 
      <reader action="/system/logic/action/queryEmergencyAction"/> 
    </div>  
    <div xid="statusData" component="$UI/system/components/justep/data/bizData"
      concept="SA_TaskStatus" autoLoad="false"> 
      <reader action="/system/logic/action/queryStatusAction"/> 
    </div>  
    <div component="$UI/system/components/justep/data/data" xid="controlData"
      idColumn="edit"> 
      <column name="edit" type="Integer"/>  
      <data><![CDATA[
      [{edit:0}]
      ]]></data> 
    </div> 
  </div>  
  <div component="$UI/system/components/bootstrap/tabs/tabs" xid="tabs"> 
    <ul class="nav nav-tabs" xid="navs"> 
      <li class="active" xid="nav-list"> 
        <a content="list" xid="tabItem1"><![CDATA[列表]]></a> 
      </li>  
      <li role="presentation" xid="nav-detail"> 
        <a content="detail" xid="tabItem2"><![CDATA[详细]]></a> 
      </li> 
    </ul>  
    <div class="tab-content" xid="contents"> 
      <div class="tab-pane active" xid="list"> 
        <div component="$UI/system/components/justep/toolBar/toolBar" class="x-toolbar x-toolbar-spliter"> 
          <div component="$UI/system/components/justep/smartFilter/smartFilter"
            xid="smartFilter1" filterData="taskData" class="pull-right"> 
            <input type="text" class="form-control" placeholder="搜索" data-bind="valueUpdate: ['input', 'afterkeydown']"
              bind-value="$model.comp($element.parentElement).searchText" bind-change="$model.comp($element.parentElement).onInputChange.bind($model.comp($element.parentElement))"
              xid="input4"/>
          </div> 
          <a component="$UI/system/components/justep/button/button" label=" 新建"
            class="btn btn-link btn-icon-left" icon="icon-plus" onClick="addBtnClick"> 
            <i class="icon-plus"/>  
            <span>新建</span> 
          </a>  
          <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
            xid="button6" onClick="{&quot;operation&quot;:&quot;taskData.save&quot;}"> 
            <i xid="i10"/>  
            <span xid="label7"/>
          </a>
          <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
            xid="button4" onClick="button2Click" label="删除" icon="icon-minus"> 
            <i xid="i7" class="icon-minus"/>  
            <span xid="span11">删除</span>
          </a>
          <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
            xid="button3" onClick="{&quot;operation&quot;:&quot;taskData.refresh&quot;}"> 
            <i xid="i6"/>  
            <span xid="span10">刷新</span>
          </a>
          <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
            label="" xid="filterBtn" icon="icon-search" onClick="{&quot;operation&quot;:&quot;dataFilter.menu&quot;}"> 
            <i xid="i9" class="icon-search"/>  
            <span xid="span13"/>
          </a>
          <span component="$UI/system/components/justep/button/checkbox" class="x-checkbox"
            xid="checkbox2" label="显示过滤框" onChange="checkbox2Change" style="padding-top:3px;"/>
          <div component="$UI/system/components/justep/toolBar/toolBar" class="x-toolbar"
            xid="searchArea" style="display:none;"> 
            <div class="form-inline" component="$UI/system/components/bootstrap/form/form"
              xid="form1"> 
              <div class="form-group" xid="formGroup1"> 
                <input component="$UI/system/components/justep/input/input" class="form-control"
                  xid="input1" placeholder="时间"/> 
              </div>  
              <div class="form-group" xid="formGrou2"> 
                <input component="$UI/system/components/justep/input/input" class="form-control"
                  xid="input2" placeholder="人员"/> 
              </div>  
              <div class="form-group" xid="formGrou3"> 
                <input component="$UI/system/components/justep/input/input" class="form-control"
                  xid="input3" placeholder="状态"/> 
              </div>  
              <div class="form-group" xid="formGrou4"> 
                <input class="form-control" component="$UI/system/components/justep/input/input"
                  data="taskData" xid="likeInput" placeholder="包含"/> 
              </div>  
              <a component="$UI/system/components/justep/button/button" class="btn btn-primary btn-icon-left"
                label="过滤" xid="button1" icon="icon-android-search" onClick="button1Click"> 
                <i xid="i1" class="icon-android-search"/>  
                <span xid="label5">过滤</span> 
              </a> 
            </div> 
          </div>  
        </div>  
        <div component="$UI/system/components/justep/dataTables/dataTables"
          flexibleWidth="true" class="table table-hover table-striped" xid="dataTables1"
          data="taskData" rowActiveClass="active" onRowDblClick="grid3RowClick"> 
          <columns xid="columns1"> 
            <column name="sName" xid="column9"/>  
            <column name="sContent" xid="column10"/>  
            <column name="sLastModifyTime" xid="column11"/>  
            <column name="sCreatorFName" xid="column12"/> 
          </columns> 
        </div>  
        <div component="$UI/system/components/justep/pagerBar/pagerBar" class="x-pagerbar container-fluid"
          xid="pageBar1" data="taskData"> 
          <div class="row" xid="div1"> 
            <div class="col-sm-3" xid="div2"> 
              <div class="x-pagerbar-length" xid="div3"> 
                <label component="$UI/system/components/justep/pagerLimitSelect/pagerLimitSelect"
                  class="x-pagerlimitselect" xid="limitSelect1"> 
                  <span xid="span2">显示</span>  
                  <select component="$UI/system/components/justep/select/select"
                    class="form-control input-sm" xid="select1"> 
                    <option value="10" xid="default1">10</option>  
                    <option value="20" xid="default2">20</option>  
                    <option value="50" xid="default3">50</option>  
                    <option value="100" xid="default4">100</option>
                  </select>  
                  <span xid="span5">条</span>
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
                  <li class="prev" xid="li1"> 
                    <a href="#" xid="a1"> 
                      <span aria-hidden="true" xid="span6">«</span>  
                      <span class="sr-only" xid="span7">Previous</span>
                    </a> 
                  </li>  
                  <li class="next" xid="li2"> 
                    <a href="#" xid="a2"> 
                      <span aria-hidden="true" xid="span8">»</span>  
                      <span class="sr-only" xid="span9">Next</span>
                    </a> 
                  </li> 
                </ul> 
              </div> 
            </div> 
          </div> 
        </div>
      </div>  
      <div class="tab-pane" xid="detail"> 
        <div component="$UI/system/components/justep/toolBar/toolBar" class="x-toolbar x-toolbar-spliter"> 
          <a component="$UI/system/components/justep/button/button" label=" 新建"
            class="btn btn-link btn-icon-left" icon="icon-plus" onClick="addBtnClick"
            xid="newBtn2"> 
            <i class="icon-plus" xid="i3"/>  
            <span xid="span1">新建</span> 
          </a>
          <a component="$UI/system/components/justep/button/button" label=" 保存"
            class="btn btn-link btn-icon-left" onClick="{operation:'taskData.save'}"
            xid="saveBtn"> 
            <i/>  
            <span>保存</span> 
          </a>
          <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
            label="删除" xid="button2" icon="icon-minus" onClick="button2Click"> 
            <i xid="i2" class="icon-minus"/>  
            <span xid="label6">删除</span> 
          </a>  
          <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
            xid="button5" onClick="{&quot;operation&quot;:&quot;taskData.refresh&quot;}"> 
            <i xid="i8"/>  
            <span xid="span12"/>
          </a>
          <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
            xid="preBtn" onClick="{&quot;operation&quot;:&quot;taskData.prevRow&quot;}"> 
            <i xid="i4"/>  
            <span xid="span3"/> 
          </a>
          <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
            xid="nextBtn" onClick="{&quot;operation&quot;:&quot;taskData.nextRow&quot;}"> 
            <i xid="i5"/>  
            <span xid="span4"/> 
          </a>
        </div>  
        <div class="container-fluid">
          <div component="$UI/system/components/bootstrap/row/row" class="row"
            xid="row1"> 
            <div class="col col-xs-12" xid="col1"> 
              <div component="$UI/system/components/justep/controlGroup/controlGroup"
                class="x-control-group" title="基本信息"> 
                <div class="x-control-group-title">基本信息</div>  
                <div class="form-horizontal" component="$UI/system/components/bootstrap/form/form"
                  style="margin:30px 10px"> 
                  <div class="form-group"> 
                    <div class="col-sm-2"> 
                      <label class="control-label" bind-text="$model.taskData.label('sName')"/> 
                    </div>  
                    <div class="col-sm-10"> 
                      <input class="form-control" component="$UI/system/components/justep/input/input"
                        data="taskData" bind-ref="taskData.ref('sName')"/> 
                    </div> 
                  </div>  
                  <div class="form-group"> 
                    <div class="col-sm-2"> 
                      <label class="control-label" bind-text="$model.taskData.label('sCode')"/> 
                    </div>  
                    <div class="col-sm-10"> 
                      <input class="form-control" component="$UI/system/components/justep/input/input"
                        data="taskData" bind-ref="taskData.ref('sCode')"/> 
                    </div> 
                  </div>  
                  <div class="form-group"> 
                    <div class="col-sm-2"> 
                      <label class="control-label" bind-text="$model.taskData.label('sCustomerName')"/> 
                    </div>  
                    <div class="col-sm-10"> 
                      <input class="form-control" component="$UI/system/components/justep/input/input"
                        data="taskData" bind-ref="taskData.ref('sCustomerName')"/> 
                    </div> 
                  </div>  
                  <div class="form-group"> 
                    <div class="col-sm-2"> 
                      <label class="control-label" bind-text="$model.taskData.label('sPlanName')"/> 
                    </div>  
                    <div class="col-sm-10"> 
                      <input class="form-control" component="$UI/system/components/justep/input/input"
                        data="taskData" bind-ref="taskData.ref('sPlanName')"/> 
                    </div> 
                  </div>  
                  <div class="form-group"> 
                    <div class="col-sm-2"> 
                      <label class="control-label" bind-text="$model.taskData.label('sProjectName')"/> 
                    </div>  
                    <div class="col-sm-10"> 
                      <input class="form-control" component="$UI/system/components/justep/input/input"
                        data="taskData" bind-ref="taskData.ref('sProjectName')"/> 
                    </div> 
                  </div>  
                  <div class="form-group"> 
                    <div class="col-sm-2"> 
                      <label class="control-label" bind-text="$model.taskData.label('sImportanceName')"/> 
                    </div>  
                    <div class="col-sm-10"> 
                      <select class="form-control" component="$UI/system/components/justep/select/select"
                        bind-ref="taskData.ref('sImportanceID')" bind-labelRef="taskData.ref('sImportanceName')"
                        bind-options="importanceData" bind-optionsLabel="sName" bind-optionsValue="SA_Importance"
                        bind-optionsCaption="请选择..."/> 
                    </div> 
                  </div>  
                  <div class="form-group"> 
                    <div class="col-sm-2"> 
                      <label class="control-label" bind-text="$model.taskData.label('sEmergencyName')"/> 
                    </div>  
                    <div class="col-sm-10"> 
                      <select class="form-control" component="$UI/system/components/justep/select/select"
                        bind-ref="taskData.ref('sEmergencyID')" bind-labelRef="taskData.ref('sEmergencyName')"
                        bind-options="emergencyData" bind-optionsLabel="sName" bind-optionsValue="SA_Emergency"
                        bind-optionsCaption="请选择..."/> 
                    </div> 
                  </div>  
                  <div class="form-group"> 
                    <div class="col-sm-2"> 
                      <label class="control-label" bind-text="$model.taskData.label('sLimitTime')"/> 
                    </div>  
                    <div class="col-sm-10"> 
                      <input class="form-control" component="$UI/system/components/justep/input/input"
                        data="taskData" bind-ref="taskData.ref('sLimitTime')"/> 
                    </div> 
                  </div>  
                  <div class="form-group"> 
                    <div class="col-sm-2"> 
                      <label class="control-label" bind-text="$model.taskData.label('sContent')"/> 
                    </div>  
                    <div class="col-sm-10"> 
                      <textarea class="form-control" component="$UI/system/components/justep/textarea/textarea"
                        data="taskData" bind-ref="taskData.ref('sContent')"/> 
                    </div> 
                  </div>  
                  <div class="form-group"> 
                    <div class="col-sm-2"> 
                      <label class="control-label" bind-text="$model.taskData.label('sCreatorFName')"/> 
                    </div>  
                    <div class="col-sm-10"> 
                      <span class="x-output" component="$UI/system/components/justep/output/output"
                        data="taskData" bind-ref="taskData.ref('sCreatorFName')"/> 
                    </div> 
                  </div>  
                  <div class="form-group"> 
                    <div class="col-sm-2"> 
                      <label class="control-label" bind-text="$model.taskData.label('sCreateTime')"/> 
                    </div>  
                    <div class="col-sm-10"> 
                      <span class="x-output" component="$UI/system/components/justep/output/output"
                        data="taskData" bind-ref="taskData.ref('sCreateTime')"/> 
                    </div> 
                  </div> 
                </div> 
              </div> 
            </div>  
            <div class="col col-xs-12" xid="col2"> 
              <div component="$UI/system/components/justep/controlGroup/controlGroup"
                class="x-control-group" title="处理信息"> 
                <div class="x-control-group-title">处理信息</div>  
                <div class="form-horizontal" component="$UI/system/components/bootstrap/form/form"
                  style="margin:30px 10px"> 
                  <div class="form-group"> 
                    <div class="col-sm-2"> 
                      <label class="control-label" bind-text="$model.taskData.label('sStatusName')"/> 
                    </div>  
                    <div class="col-sm-10"> 
                      <select class="form-control" component="$UI/system/components/justep/select/select"
                        bind-ref="taskData.ref('sStatusID')" bind-labelRef="taskData.ref('sStatusName')"
                        bind-options="statusData" bind-optionsLabel="sName" bind-optionsValue="SA_TaskStatus"
                        bind-optionsCaption="请选择..."/> 
                    </div> 
                  </div>  
                  <div class="form-group"> 
                    <div class="col-sm-2"> 
                      <label class="control-label" bind-text="$model.taskData.label('sExecuteTime')"/> 
                    </div>  
                    <div class="col-sm-10"> 
                      <input class="form-control" component="$UI/system/components/justep/input/input"
                        data="taskData" bind-ref="taskData.ref('sExecuteTime')"/> 
                    </div> 
                  </div>  
                  <div class="form-group"> 
                    <div class="col-sm-2"> 
                      <label class="control-label" bind-text="$model.taskData.label('sExpectStartTime')"/> 
                    </div>  
                    <div class="col-sm-10"> 
                      <input class="form-control" component="$UI/system/components/justep/input/input"
                        data="taskData" bind-ref="taskData.ref('sExpectStartTime')"/> 
                    </div> 
                  </div>  
                  <div class="form-group"> 
                    <div class="col-sm-2"> 
                      <label class="control-label" bind-text="$model.taskData.label('sExpectFinishTime')"/> 
                    </div>  
                    <div class="col-sm-10"> 
                      <input class="form-control" component="$UI/system/components/justep/input/input"
                        data="taskData" bind-ref="taskData.ref('sExpectFinishTime')"/> 
                    </div> 
                  </div>  
                  <div class="form-group"> 
                    <div class="col-sm-2"> 
                      <label class="control-label" bind-text="$model.taskData.label('sActualStartTime')"/> 
                    </div>  
                    <div class="col-sm-10"> 
                      <input class="form-control" component="$UI/system/components/justep/input/input"
                        data="taskData" bind-ref="taskData.ref('sActualStartTime')"/> 
                    </div> 
                  </div>  
                  <div class="form-group"> 
                    <div class="col-sm-2"> 
                      <label class="control-label" bind-text="$model.taskData.label('sActualFinishTime')"/> 
                    </div>  
                    <div class="col-sm-10"> 
                      <input class="form-control" component="$UI/system/components/justep/input/input"
                        data="taskData" bind-ref="taskData.ref('sActualFinishTime')"/> 
                    </div> 
                  </div>  
                  <div class="form-group"> 
                    <div class="col-sm-2"> 
                      <label class="control-label" bind-text="$model.taskData.label('sRemark')"/> 
                    </div>  
                    <div class="col-sm-10"> 
                      <textarea class="form-control" component="$UI/system/components/justep/textarea/textarea"
                        data="taskData" bind-ref="taskData.ref('sRemark')"/> 
                    </div> 
                  </div> 
                </div> 
              </div> 
            </div> 
          </div>
        </div>
      </div> 
    </div> 
  </div>  
  <span component="$UI/system/components/justep/bizFilter/bizFilter" xid="dataFilter"
    filterData="taskData" style="left:28px;top:290px;" filterCols="sName,sCode,sContent,sCustomerName,sProjectName,sPlanName,sLastModifyTime,sCreateTime,sStatusName,sImportanceName,sEmergencyName,sCreatorPersonName,sCreatorPosName,sCreatorDeptName,sCreatorOgnName,sExecutorPersonName,sExecutorPosName,sExecutorDeptName,sExecutorOgnName"/>
</div>
