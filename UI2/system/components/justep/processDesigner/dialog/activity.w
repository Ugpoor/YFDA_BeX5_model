<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window" component="$UI/system/components/justep/window/window"
  design="device:pc">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:33px;top:790px;"
    onLoad="modelLoad"> 
    <div component="$UI/system/components/justep/data/data" autoLoad="true"
      xid="assignModeData" idColumn="value"> 
      <column label="值" name="value" type="String" xid="xid8"/>  
      <column label="显示值" name="oValue" type="String" xid="xid14"/>  
      <data xid="default1">[{"value":"singleness","oValue":"独立"},{"value":"together","oValue":"共同"}]</data> 
    </div>  
    <div component="$UI/system/components/justep/data/data" autoLoad="true"
      xid="preemptMode" idColumn="value"> 
      <column label="值" name="value" type="String" xid="xid17"/>  
      <column label="显示值" name="oValue" type="String" xid="xid18"/>  
      <data xid="default3">[{"value":"'tpmOpen'","oValue":"打开时"},{"value":"'tpmExecute'","oValue":"处理时"}]</data> 
    </div>  
    <div component="$UI/system/components/justep/data/data" autoLoad="true"
      xid="executeData" idColumn="val"> 
      <column label="值" name="val" type="String" xid="xid20"/>  
      <column label="显示值" name="oVal" type="String" xid="xid21"/>  
      <data xid="default2">[{"val":"'temPreempt'","oVal":"抢占"},{"val":"'temSequential'","oVal":"顺序"},{"val":"'temSimultaneous'","oVal":"同时"}]</data> 
    </div>  
    <div component="$UI/system/components/justep/data/data" autoLoad="true"
      xid="transferRulesData" idColumn="name" confirmDelete="false"> 
      <column label="名称" name="name" type="String" xid="xid9"></column>
  <column label="条件" name="condition" type="String" xid="xid15"></column>
  <column label="转发确认" name="dialogEnabled" type="String" xid="xid16"></column>
  <column label="是否需要保存" name="saveEnabled" type="String" xid="xid19"></column>
  <column label="任务分配模式" name="taskAssignMode" type="String" xid="xid22"></column>
  <column label="范围表达式" name="rangeExpr" type="String" xid="xid23"></column>
  <column label="执行模式" name="sExecuteMode" type="String" xid="xid24"></column>
  <column label="抢占模式" name="sPreemptMode" type="String" xid="xid25"></column>
  <column label="标题" name="sName" type="String" xid="xid26"></column>
  <column label="限制时间" name="sLimitTime" type="DateTime" xid="xid27"></column>
  <column label="默认表达式" name="defaultExpr" type="String" xid="xid28"></column>
  <column label="类型" name="kind" type="String" xid="xid29"></column>
  <column label="表达式" name="defaultExprValue" type="String" xid="xid77"></column>
  <column label="范围表达式" name="rangeExprValue" type="String" xid="xid78"></column>
  <column label="类型名" name="kindName" type="String" xid="xid82"></column></div>  
    <div component="$UI/system/components/justep/data/data" autoLoad="true"
      xid="noticeRulesData" idColumn="name" confirmDelete="false"> 
      <column label="名称" name="name" type="String" xid="xid30"></column>
  <column label="条件" name="condition" type="String" xid="xid31"></column>
  <column label="通知确认" name="dialogEnabled" type="String" xid="xid32"></column>
  <column label="是否需要保存" name="saveEnabled" type="String" xid="xid33"></column>
  <column label="任务分配模式" name="taskAssignMode" type="String" xid="xid34"></column>
  <column label="流转时" name="transferTask" type="String" xid="xid35"></column>
  <column label="转发时" name="advanceProcess" type="String" xid="xid36"></column>
  <column label="回退时" name="backProcess" type="String" xid="xid37"></column>
  <column label="范围表达式" name="rangeExpr" type="String" xid="xid38"></column>
  <column label="默认表达式" name="defaultExpr" type="String" xid="xid39"></column>
  <column label="打开后自动结束" name="sExecuteMode2" type="String" xid="xid40"></column>
  <column label="处理页面" name="sEURL" type="String" xid="xid41"></column>
  <column label="限制时间" name="sLimitTime" type="DateTime" xid="xid42"></column>
  <column label="标题" name="sName" type="String" xid="xid43"></column>
  <column label="当流出到此环节时" name="whenToUnit" type="String" xid="xid44"></column>
  <column label="类型" name="kind" type="String" xid="xid45"></column>
  <column label="表达式" name="defaultExprValue" type="String" xid="xid79"></column>
  <column label="范围表达式" name="rangeExprValue" type="String" xid="xid80"></column>
  <column label="类型名" name="kindName" type="String" xid="xid83"></column></div>  
    <div component="$UI/system/components/justep/data/data" autoLoad="true"
      xid="advanceRulesData" idColumn="name" confirmDelete="false"> 
      <column label="名称" name="name" type="String" xid="xid46"/>  
      <column label="生效条件" name="condition" type="String" xid="xid47"/>  
      <column label="确认流转" name="dialogEnabled" type="String" xid="xid48"/>  
      <column label="是否需要保存" name="saveEnabled" type="String" xid="xid49"/>  
      <column label="允许跳转" name="jumpEnabled" type="String" xid="xid50"/>  
      <column label="强制流转" name="ignoreExecuteMode" type="String" xid="xid53"/>  
      <column label="任务等待" name="taskWait" type="String" xid="xid54"/>  
      <column label="任务合并" name="taskJoin" type="String" xid="xid55"/>  
      <column label="任务分支环节" name="forkActivity" type="String" xid="xid56"/> 
    </div>  
    <div component="$UI/system/components/justep/data/data" autoLoad="true"
      xid="backRulesData" idColumn="name" confirmDelete="false" onIndexChanged="backRulesDataIndexChanged"> 
      <column label="名称" name="name" type="String" xid="xid57"/>  
      <column label="生效条件" name="condition" type="String" xid="xid58"/>  
      <column label="回退确认" name="dialogEnabled" type="String" xid="xid59"/>  
      <column label="是否需要保存" name="saveEnabled" type="String" xid="xid60"/>  
      <column label="回退确认" name="ignoreExecuteMode" type="String" xid="xid61"/>  
      <column label="回退范围" name="backRange" type="String" xid="xid62"/>  
      <column label="返回方式" name="thenFlowMode" type="String" xid="xid63"/>  
      <column label="ID" name="id" type="String" xid="xid74"/> 
    </div>  
    <div component="$UI/system/components/justep/data/data" autoLoad="true"
      xid="kindData" idColumn="value"> 
      <column label="值" name="value" type="String" xid="xid51"/>  
      <column label="显示值" name="oValue" type="String" xid="xid52"/>  
      <data xid="default4">[{"value":"ogn","oValue":"机构"},{"value":"dpt","oValue":"部门"},{"value":"pos","oValue":"岗位"},{"value":"hum","oValue":"人员"}]</data> 
    </div>  
    <div component="$UI/system/components/justep/data/data" autoLoad="true"
      xid="labelData" confirmDelete="false" idColumn="value"> 
      <column label="值" name="value" type="String" xid="xid64"/>  
      <column label="显示值" name="oValue" type="String" xid="xid65"/> 
    </div>  
    <div component="$UI/system/components/justep/data/data" autoLoad="true"
      xid="executeRulesData" idColumn="name" confirmDelete="false"> 
      <column label="名称" name="name" type="String" xid="xid1"></column>
  <column label="生效条件" name="condition" type="String" xid="xid2"></column>
  <column label="任务分配模式" name="taskAssignMode" type="String" xid="xid3"></column>
  <column label="范围表达式" name="rangeExpr" type="String" xid="xid4"></column>
  <column label="执行模式" name="sExecuteMode" type="String" xid="xid5"></column>
  <column label="任务标题" name="sName" type="String" xid="xid6"></column>
  <column label="抢占模式" name="sPreemptMode" type="String" xid="xid7"></column>
  <column label="限制时间" name="sLimitTime" type="DateTime" xid="xid10"></column>
  <column label="自动流转" name="sExecuteMode2" type="String" xid="xid11"></column>
  <column label="表达式" name="defaultExpr" type="String" xid="xid12"></column>
  <column label="类型" name="kind" type="String" xid="xid13"></column>
  <column label="默认表达式值" name="defaultExprValue" type="String" xid="xid75"></column>
  <column label="范围表达式至" name="rangeExprValue" type="String" xid="xid76"></column>
  <column label="类型名" name="kindName" type="String" xid="xid81"></column></div>  
    <div component="$UI/system/components/justep/data/data" autoLoad="true"
      xid="backRangeData" idColumn="value"> 
      <column label="值" name="value" type="String" xid="xid66"/>  
      <column label="显示值" name="oValue" type="String" xid="xid67"/>  
      <data xid="default5">[{"value":"all","oValue":"所有前序环节"},{"value":"prev-activity","oValue":"前序环节"},{"value":"specified","oValue":"指定环节"},{"value":"start","oValue":"首环节"},{"value":"prev-task","oValue":"前序人"}]</data> 
    </div>  
    <div component="$UI/system/components/justep/data/data" autoLoad="true"
      xid="thenFlowModeData" idColumn="value"> 
      <column label="值" name="value" type="String" xid="xid68"/>  
      <column label="显示值" name="oValue" type="String" xid="xid69"/>  
      <data xid="default6">[{"value":"flowToFront","oValue":"原路返回"},{"value":"flowToAgain","oValue":"重新流转"},{"value":"flowToFrontOrAgain","oValue":"原路返回或重新流转"}]</data> 
    </div>  
    <div component="$UI/system/components/justep/data/data" autoLoad="true"
      xid="sEURLData" idColumn="value" confirmDelete="false"> 
      <column label="值" name="value" type="String" xid="xid70"/>  
      <column label="显示值" name="oValue" type="String" xid="xid71"/> 
    </div>  
    <div component="$UI/system/components/justep/data/data" autoLoad="true"
      xid="designatedLinkData" confirmDelete="false" idColumn="id"> 
      <column label="环节名" name="linkName" type="String" xid="xid72"/>  
      <column label="ID" name="id" type="String" xid="xid73"/> 
    </div> 
  </div>  
  <span component="$UI/system/components/justep/windowReceiver/windowReceiver"
    xid="windowReceiver" onReceive="windowReceiver1Receive"/>  
  <div component="$UI/system/components/justep/panel/panel" class="x-panel x-full"
    xid="panel3"> 
    <div class="x-panel-content" xid="content1"> 
      <div component="$UI/system/components/justep/row/row" class="x-row" xid="row6">
   <div class="x-col x-col-50" xid="col15"><div class="input-group" component="$UI/system/components/bootstrap/inputGroup/inputGroup" xid="inputGroup1"> 
            <span xid="span15" class="input-group-addon"><![CDATA[显示名称：]]></span>  
            <input type="text" class="form-control x-control" component="$UI/system/components/justep/input/input" xid="activityName" /> 
          </div></div>
   </div><div component="$UI/system/components/bootstrap/tabs/tabs" xid="tabs1"> 
        <ul class="nav nav-tabs" xid="ul1"> 
          <li role="presentation" xid="li2" class="active"> 
            <a content="tabContent2" xid="tabItem2"><![CDATA[执行规则]]></a> 
          </li>  
          <li xid="li3"> 
            <a content="tabContent3" xid="tabItem3"><![CDATA[转发规则]]></a> 
          </li>  
          <li xid="li4"> 
            <a content="tabContent4" xid="tabItem4"><![CDATA[通知规则]]></a> 
          </li>  
          <li xid="li5"> 
            <a content="tabContent5" xid="tabItem5"><![CDATA[流转规则]]></a> 
          </li>  
          <li xid="li6"> 
            <a content="tabContent6" xid="tabItem6"><![CDATA[回退规则]]></a> 
          </li> 
        </ul>  
        <div class="tab-content" xid="div1"> 
          <div class="tab-pane active" xid="tabContent2"> 
            <div class="panel panel-default" component="$UI/system/components/bootstrap/panel/panel"
              xid="panel8"> 
              <div class="panel-body" xid="body7"> 
                <div component="$UI/system/components/bootstrap/row/row" class="row"
                  xid="row1"> 
                  <div class="col col-xs-4" xid="col1"> 
                    <div component="$UI/system/components/justep/toolBar/toolBar"
                      class="x-toolbar form-inline x-toolbar-spliter" xid="toolBar2"> 
                      <a component="$UI/system/components/justep/button/button"
                        class="btn btn-link" label="新增" xid="add" icon="icon-android-add"
                        onClick="addClick"> 
                        <i xid="i17" class="icon-android-add"/>  
                        <span xid="span17">新增</span> 
                      </a>  
                      <a component="$UI/system/components/justep/button/button"
                        class="btn btn-link" label="删除" xid="delete" icon="icon-android-close"
                        onClick="deleteClick"> 
                        <i xid="i18" class="icon-android-close"/>  
                        <span xid="span18">删除</span> 
                      </a> 
                    </div>  
                    <div component="$UI/system/components/justep/dataTables/dataTables"
                      flexibleWidth="true" rowActiveClass="active" class="table table-hover table-striped"
                      xid="dataTables1" data="executeRulesData"> 
                      <columns xid="columns6"> 
                        <column name="name" xid="column5"/> 
                      </columns> 
                    </div> 
                  </div>  
                  <div class="col col-xs-8" xid="col3"> 
                    <div xid="div3"> 
                      <span component="$UI/system/components/justep/button/checkbox"
                        class="x-checkbox" xid="checkbox1" label="打开后自动流转" checkedValue="'advanceWhenOpen'"
                        bind-ref="executeRulesData.ref('sExecuteMode2')"/>  
                      <div component="$UI/system/components/justep/labelEdit/labelEdit"
                        class="x-label-edit x-label30" xid="labelEdit1"> 
                        <label class="x-label" xid="label1"><![CDATA[生效条件]]></label>  
                        <input component="$UI/system/components/justep/input/input"
                          class="form-control x-edit" xid="condition" bind-ref="executeRulesData.ref('condition')"/> 
                      </div>  
                      <div component="$UI/system/components/justep/labelEdit/labelEdit"
                        class="x-label-edit x-label30" xid="labelEdit2"> 
                        <label class="x-label" xid="label2"><![CDATA[任务标题]]></label>  
                        <input component="$UI/system/components/justep/input/input"
                          class="form-control x-edit" xid="taskTitle" bind-ref="executeRulesData.ref('sName')"/> 
                      </div>  
                      <div component="$UI/system/components/justep/labelEdit/labelEdit"
                        class="x-label-edit x-label30" xid="labelEdit3"> 
                        <label class="x-label" xid="label3"><![CDATA[限制时间]]></label>  
                        <input component="$UI/system/components/justep/input/input"
                          class="form-control x-edit" xid="input3" dataType="DateTime" bind-ref="executeRulesData.ref('sLimitTime')"/> 
                      </div>  
                      <div component="$UI/system/components/bootstrap/tabs/tabs"
                        xid="tabs3"> 
                        <ul class="nav nav-tabs" xid="ul2"> 
                          <li class="active" xid="li7"> 
                            <a content="tabContent1" xid="tabItem7"><![CDATA[执行者]]></a> 
                          </li>  
                          <li role="presentation" xid="li8"> 
                            <a content="tabContent7" xid="tabItem8"><![CDATA[任务协作]]></a> 
                          </li> 
                        </ul>  
                        <div class="tab-content" xid="div11"> 
                          <div class="tab-pane active" xid="tabContent1"> 
                            <div xid="div8" name="div8"> 
                              <!-- <div component="$UI/system/components/justep/labelEdit/labelEdit"
                                class="x-label-edit x-label30" xid="labelEdit38"> 
                                <label class="x-label" xid="label39"><![CDATA[类型]]></label>  
                                <input component="$UI/system/components/justep/input/input"
                                  class="form-control x-edit" xid="input5" bind-ref="executeRulesData.ref('kindName')"/>  
                                <a component="$UI/system/components/justep/button/button"
                                  class="btn btn-link" label="选择" xid="kindSelect"
                                  onClick="kindSelectClick"> 
                                  <i xid="i5"/>  
                                  <span xid="span5">选择</span> 
                                </a> 
                              </div>   -->
                              <div component="$UI/system/components/justep/labelEdit/labelEdit"
                                class="x-label-edit x-label30" xid="labelEdit15"> 
                                <label class="x-label" xid="label15"><![CDATA[表达式]]></label>  
                                <input component="$UI/system/components/justep/input/input"
                                  class="form-control x-edit" xid="executeSelectValueInput"
                                  bind-ref="executeRulesData.ref('defaultExprValue')"/>  
                                <a component="$UI/system/components/justep/button/button"
                                  class="btn btn-link" label="选择" xid="executeSelect"
                                  onClick="executeSelectClick"> 
                                  <i xid="i8"/>  
                                  <span xid="span9">选择</span> 
                                </a> 
                              </div>  
                              <div component="$UI/system/components/justep/labelEdit/labelEdit"
                                class="x-label-edit x-label30" xid="labelEdit28"> 
                                <label class="x-label" xid="label23"><![CDATA[范围表达式]]></label>  
                                <input component="$UI/system/components/justep/input/input"
                                  class="form-control x-edit" xid="executeSelectRangeValueInput"
                                  bind-ref="executeRulesData.ref('rangeExprValue')"/>  
                                <a component="$UI/system/components/justep/button/button"
                                  class="btn btn-link" label="选择" xid="executeSelectRange"
                                  onClick="executeSelectRangeClick"> 
                                  <i xid="i9"/>  
                                  <span xid="span10">选择</span> 
                                </a> 
                              </div> 
                            </div> 
                          </div>  
                          <div class="tab-pane" xid="tabContent7"> 
                            <div xid="div9" name="div9"> 
                              <div component="$UI/system/components/justep/labelEdit/labelEdit"
                                class="x-label-edit x-label30" xid="labelEdit7"> 
                                <label class="x-label" xid="label7"><![CDATA[任务分配模式]]></label>  
                                <select component="$UI/system/components/justep/select/select"
                                  class="form-control x-edit" xid="select1" bind-options="assignModeData"
                                  bind-ref="executeRulesData.ref('taskAssignMode')"
                                  bind-optionsValue="value" bind-optionsLabel="oValue"/> 
                              </div>  
                              <div component="$UI/system/components/justep/labelEdit/labelEdit"
                                class="x-label-edit x-label30" xid="labelEdit8"> 
                                <label class="x-label" xid="label8"><![CDATA[执行模式]]></label>  
                                <select component="$UI/system/components/justep/select/select"
                                  class="form-control x-edit" xid="select2" bind-options="executeData"
                                  bind-optionsValue="val" bind-optionsLabel="oVal"
                                  bind-ref="executeRulesData.ref('sExecuteMode')"
                                  bind-disable=" $model.executeRulesData.val(&quot;taskAssignMode&quot;) != &quot;together&quot;"/> 
                              </div>  
                              <div component="$UI/system/components/justep/labelEdit/labelEdit"
                                class="x-label-edit x-label30" xid="labelEdit9"> 
                                <label class="x-label" xid="label9"><![CDATA[抢占模式]]></label>  
                                <select component="$UI/system/components/justep/select/select"
                                  class="form-control x-edit" xid="select3" bind-ref="executeRulesData.ref('sPreemptMode')"
                                  bind-options="preemptMode" bind-optionsValue="value"
                                  bind-optionsLabel="oValue" bind-disable=" $model.executeRulesData.val(&quot;taskAssignMode&quot;) != &quot;together&quot; ||  $model.executeRulesData.val(&quot;sExecuteMode&quot;) != &quot;'temPreempt'&quot;"/> 
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
          </div>  
            
            
            
           
        <div class="tab-pane" xid="tabContent3"> 
            <div class="panel panel-default" component="$UI/system/components/bootstrap/panel/panel" xid="panel15"> 
              <div class="panel-body" xid="body9"> 
                <div component="$UI/system/components/bootstrap/row/row" class="row" xid="row14"> 
                  <div class="col col-xs-4" xid="col42"> 
                    <div component="$UI/system/components/justep/toolBar/toolBar" class="x-toolbar form-inline x-toolbar-spliter" xid="toolBar1"> 
                      <a component="$UI/system/components/justep/button/button" class="btn btn-link" label="新增" xid="addTransferRule" icon="icon-android-add" onClick="addTransferRuleClick"> 
                        <i xid="i21" class="icon-android-add" />  
                        <span xid="span24">新增</span> 
                      </a>  
                      <a component="$UI/system/components/justep/button/button" class="btn btn-link" label="删除" xid="deleteTransferRule" icon="icon-android-close" onClick="deleteTransferRuleClick"> 
                        <i xid="i19" class="icon-android-close" />  
                        <span xid="span25">删除</span> 
                      </a> 
                    </div>  
                    <div component="$UI/system/components/justep/dataTables/dataTables" flexibleWidth="true" rowActiveClass="active" class="table table-hover table-striped" xid="dataTables2" data="transferRulesData"> 
                      <columns xid="columns7"> 
                        <column name="name" xid="column6" /> 
                      </columns> 
                    </div> 
                  </div>  
                  <div class="col col-xs-8" xid="col43"> 
                    <div xid="div7"> 
                      <span component="$UI/system/components/justep/button/checkbox" class="x-checkbox" xid="checkbox18" label="转发确认" checkedValue="dialogEnabled" bind-ref="transferRulesData.ref('dialogEnabled')" />  
                      <span component="$UI/system/components/justep/button/checkbox" class="x-checkbox" xid="checkbox19" label="是否需要保存" checkedValue="saveEnabled" bind-ref="transferRulesData.ref('saveEnabled')" />  
                      <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label30" xid="labelEdit24"> 
                        <label class="x-label" xid="label26">生效条件</label>  
                        <input component="$UI/system/components/justep/input/input" class="form-control x-edit" xid="input15" bind-ref="transferRulesData.ref('condition')" /> 
                      </div>  
                      <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label30" xid="labelEdit23"> 
                        <label class="x-label" xid="label27">任务标题</label>  
                        <input component="$UI/system/components/justep/input/input" class="form-control x-edit" xid="input16" bind-ref="transferRulesData.ref('sName')" /> 
                      </div>  
                      <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label30" xid="labelEdit22"> 
                        <label class="x-label" xid="label28">限制时间</label>  
                        <input component="$UI/system/components/justep/input/input" class="form-control x-edit" xid="input11" dataType="DateTime" bind-ref="transferRulesData.ref('sLimitTime')" /> 
                      </div>  
                      <div component="$UI/system/components/bootstrap/tabs/tabs" xid="tabs4"> 
                        <ul class="nav nav-tabs" xid="ul3"> 
                          <li class="active" xid="li10"> 
                            <a content="tabContent8" xid="tabItem9"><![CDATA[执行者]]></a> 
                          </li>  
                          <li role="presentation" xid="li11"> 
                            <a content="tabContent9" xid="tabItem10"><![CDATA[任务协作]]></a> 
                          </li> 
                        </ul>  
                        <div class="tab-content" xid="div12"> 
                          <div class="tab-pane active" xid="tabContent8"> 
                            <div xid="div5" name="div5"> 
                             <!--  <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label30" xid="labelEdit39"> 
                                <label class="x-label" xid="label40">类型</label>  
                                <input component="$UI/system/components/justep/input/input" class="form-control x-edit" xid="input6" bind-ref="transferRulesData.ref('kindName')" />  
                                <a component="$UI/system/components/justep/button/button" class="btn btn-link" label="选择" xid="transferKindSelect" onClick="transferKindSelectClick"> 
                                  <i xid="i15" />  
                                  <span xid="span19">选择</span> 
                                </a> 
                              </div>   -->
                              <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label30" xid="t"> 
                                <label class="x-label" xid="label33"><![CDATA[表达式]]></label>  
                                <input component="$UI/system/components/justep/input/input" class="form-control x-edit" xid="transferDefaultExprValue" bind-ref="transferRulesData.ref('defaultExprValue')" />  
                                <a component="$UI/system/components/justep/button/button" class="btn btn-link" label="选择" xid="transferSelect" onClick="transferSelectClick"> 
                                  <i xid="i10" />  
                                  <span xid="span12">选择</span> 
                                </a> 
                              </div>  
                              <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label30" xid="labelEdit32"> 
                                <label class="x-label" xid="label32"><![CDATA[范围表达式]]></label>  
                                <input component="$UI/system/components/justep/input/input" class="form-control x-edit" xid="transferRangeExprValue" bind-ref="transferRulesData.ref('rangeExprValue')" />  
                                <a component="$UI/system/components/justep/button/button" class="btn btn-link" label="选择" xid="transferSelectRange" onClick="transferSelectRangeClick"> 
                                  <i xid="i12" />  
                                  <span xid="span13">选择</span> 
                                </a> 
                              </div> 
                            </div> 
                          </div>  
                          <div class="tab-pane" xid="tabContent9"> 
                            <div xid="div2" name="div2"> 
                              <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label30" xid="labelEdit27"> 
                                <label class="x-label" xid="label20">任务分配模式</label>  
                                <select component="$UI/system/components/justep/select/select" class="form-control x-edit" xid="select8" bind-options="assignModeData" bind-ref="transferRulesData.ref('taskAssignMode')" bind-optionsValue="value" bind-optionsLabel="oValue" /> 
                              </div>  
                              <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label30" xid="labelEdit26"> 
                                <label class="x-label" xid="label25">执行模式</label>  
                                <select component="$UI/system/components/justep/select/select" class="form-control x-edit" xid="select6" bind-options="executeData" bind-ref="transferRulesData.ref('sExecuteMode')" bind-optionsValue="val" bind-optionsLabel="oVal" bind-disable=" $model.transferRulesData.val(&quot;taskAssignMode&quot;) !=&quot;together&quot;" /> 
                              </div>  
                              <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label30" xid="labelEdit25"> 
                                <label class="x-label" xid="label24">抢占模式</label>  
                                <select component="$UI/system/components/justep/select/select" class="form-control x-edit" xid="select7" bind-options="preemptMode" bind-optionsValue="value" bind-optionsLabel="oValue" bind-ref="transferRulesData.ref('sPreemptMode')" bind-disable=" $model.transferRulesData.val(&quot;taskAssignMode&quot;) !=&quot;together&quot;  || $model.transferRulesData.val(&quot;sExecuteMode&quot;) !=&quot;'temPreempt'&quot;" /> 
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
          </div><div class="tab-pane" xid="tabContent4"> 
            <div class="panel panel-default" component="$UI/system/components/bootstrap/panel/panel" xid="panel5"> 
              <div class="panel-body" xid="body4"> 
                <div component="$UI/system/components/bootstrap/row/row" class="row" xid="row10"> 
                  <div class="col col-xs-4" xid="col11"> 
                    <div component="$UI/system/components/justep/toolBar/toolBar" class="x-toolbar form-inline x-toolbar-spliter" xid="toolBar3"> 
                      <a component="$UI/system/components/justep/button/button" class="btn btn-link" label="新增" xid="addNoticeRule" onClick="addNoticeRuleClick" icon="icon-android-add"> 
                        <i xid="i3" class="icon-android-add" />  
                        <span xid="span3" /> 
                      </a>  
                      <a component="$UI/system/components/justep/button/button" class="btn btn-link" label="删除" xid="deleteNoticeRule" onClick="deleteNoticeRuleClick" icon="icon-android-close"> 
                        <i xid="i4" class="icon-android-close" />  
                        <span xid="span4" /> 
                      </a> 
                    </div>  
                    <div component="$UI/system/components/justep/dataTables/dataTables" flexibleWidth="true" rowActiveClass="active" class="table table-hover table-striped" xid="dataTables3" data="noticeRulesData"> 
                      <columns xid="columns8"> 
                        <column name="name" xid="column7" /> 
                      </columns> 
                    </div> 
                  </div>  
                  <div class="col col-xs-8" xid="col20"> 
                    <div component="$UI/system/components/bootstrap/row/row" class="row" xid="row11"> 
                      <div class="col col-xs-4" xid="col21"> 
                        <span component="$UI/system/components/justep/button/checkbox" class="x-checkbox" xid="checkbox2" label="通知确认" checkedValue="dialogEnabled" bind-ref="noticeRulesData.ref('dialogEnabled')" /> 
                      </div>  
                      <div class="col col-xs-4" xid="col22"> 
                        <span component="$UI/system/components/justep/button/checkbox" class="x-checkbox" xid="checkbox3" label="是否需要保存" checkedValue="saveEnabled" bind-ref="noticeRulesData.ref('saveEnabled')" /> 
                      </div>  
                      <div class="col col-xs-4" xid="col23"> 
                        <span component="$UI/system/components/justep/button/checkbox" class="x-checkbox" xid="checkbox4" label="打开后自动结束" checkedValue="'finishWhenOpen'" bind-ref="noticeRulesData.ref('sExecuteMode2')" /> 
                      </div> 
                    </div>  
                    <div component="$UI/system/components/bootstrap/row/row" class="row" xid="row2"> 
                      <div class="col col-xs-4" xid="col2">
                        <label class="x-label" xid="label44"><![CDATA[通知时机]]></label>
                      </div>  
                      <div class="col col-xs-8" xid="col5">
                        <span component="$UI/system/components/justep/button/checkbox" class="x-checkbox" xid="checkbox5" label="流转时" checkedValue="advanceProcess" bind-ref="noticeRulesData.ref('advanceProcess')" />
                        <span component="$UI/system/components/justep/button/checkbox" class="x-checkbox" xid="checkbox6" label="回退时" checkedValue="backProcess" bind-ref="noticeRulesData.ref('backProcess')" />
                        <span component="$UI/system/components/justep/button/checkbox" class="x-checkbox" xid="checkbox7" label="转发时" checkedValue="transferTask" bind-ref="noticeRulesData.ref('transferTask')" />
                      </div>
                    </div>
                    <div component="$UI/system/components/bootstrap/row/row" class="row" xid="row3">
   <div class="col col-xs-6" xid="col6"><div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label30" xid="labelEdit12"> 
                      <label class="x-label" xid="label12"><![CDATA[生效条件]]></label>  
                      <input component="$UI/system/components/justep/input/input" class="form-control x-edit" xid="input1" bind-ref="noticeRulesData.ref('condition')" /> 
                    </div></div>
   <div class="col col-xs-6" xid="col7"><div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label30" xid="labelEdit13"> 
                      <label class="x-label" xid="label13"><![CDATA[通知标题]]></label>  
                      <input component="$UI/system/components/justep/input/input" class="form-control x-edit" xid="input2" bind-ref="noticeRulesData.ref('sName')" /> 
                    </div></div></div>  
                      
                    <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label30" xid="labelEdit14"> 
                      <label class="x-label" xid="label14"><![CDATA[限制时间]]></label>  
                      <input component="$UI/system/components/justep/input/input" class="form-control x-edit" xid="input4" dataType="DateTime" bind-ref="noticeRulesData.ref('sLimitTime')" /> 
                    </div><div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label30" xid="labelEdit16"> 
                      <label class="x-label" xid="label16"><![CDATA[当流出到此环节时]]></label>  
                      <select component="$UI/system/components/justep/select/select" class="form-control x-edit" xid="select5" bind-ref="noticeRulesData.ref('whenToUnit')" bind-options="labelData" bind-optionsValue="value" bind-optionsLabel="oValue" /> 
                    </div><div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label30" xid="labelEdit17"> 
                      <label class="x-label" xid="label17"><![CDATA[处理页面]]></label>  
                      <input component="$UI/system/components/justep/input/input" class="form-control x-edit" xid="disposePage" bind-ref="noticeRulesData.ref('sEURL')" />  
                      <a component="$UI/system/components/justep/button/button" class="btn btn-link" label="选择" xid="select" onClick="selectClick"> 
                        <i xid="i6" />  
                        <span xid="span6">选择</span> 
                      </a> 
                    </div>  
                      
                    <div component="$UI/system/components/bootstrap/tabs/tabs" xid="tabs2"> 
                      <ul class="nav nav-tabs" xid="ul4"> 
                        <li class="active" xid="li1"> 
                          <a content="tabContent10" xid="tabItem1"><![CDATA[执行者]]></a>
                        </li> 
                      </ul>  
                      <div class="tab-content" xid="div4"> 
                        <div class="tab-pane active" xid="tabContent10">
                         <!--  <div component="$UI/system/components/justep/labelEdit/labelEdit"
                            class="x-label-edit x-label30" xid="labelEdit40"> 
                            <label class="x-label" xid="label41">类型</label>  
                            <input component="$UI/system/components/justep/input/input"
                              class="form-control x-edit" xid="input7" bind-ref="noticeRulesData.ref('kindName')"/>  
                            <a component="$UI/system/components/justep/button/button"
                              class="btn btn-link" label="选择" xid="noticeKindSelect"
                              onClick="noticeKindSelectClick"> 
                              <i xid="i16"/>  
                              <span xid="span20">选择</span> 
                            </a> 
                          </div> -->
                          <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label30" xid="labelEdit37"> 
                            <label class="x-label" xid="label38"><![CDATA[表达式]]></label>  
                            <input component="$UI/system/components/justep/input/input" class="form-control x-edit" xid="noticeDefaultExprValue" bind-ref="noticeRulesData.ref('defaultExprValue')" />  
                            <a component="$UI/system/components/justep/button/button" class="btn btn-link" label="选择" xid="noticeSelect" onClick="noticeSelectClick"> 
                              <i xid="i13" />  
                              <span xid="span14">选择</span> 
                            </a> 
                          </div>
                          <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label30" xid="labelEdit33"> 
                            <label class="x-label" xid="label37"><![CDATA[范围表达式]]></label>  
                            <input component="$UI/system/components/justep/input/input" class="form-control x-edit" xid="noticeRangeExprValue" bind-ref="noticeRulesData.ref('rangeExprValue')" />  
                            <a component="$UI/system/components/justep/button/button" class="btn btn-link" label="选择" xid="noticeSelectRange" onClick="noticeSelectRangeClick"> 
                              <i xid="i14" />  
                              <span xid="span16">选择</span> 
                            </a> 
                          </div>
                        </div> 
                      </div> 
                    </div> 
                  </div> 
                </div> 
              </div> 
            </div> 
          </div><div class="tab-pane" xid="tabContent5"> 
            <div class="panel panel-default" component="$UI/system/components/bootstrap/panel/panel" xid="panel6"> 
              <div class="panel-body" xid="body5"> 
                <div component="$UI/system/components/bootstrap/row/row" class="row" xid="row21"> 
                  <div class="col col-xs-4" xid="col46"> 
                    <div component="$UI/system/components/justep/toolBar/toolBar" class="x-toolbar form-inline x-toolbar-spliter" xid="toolBar4"> 
                      <a component="$UI/system/components/justep/button/button" class="btn btn-link" label="新增" xid="addAdvanceRule" onClick="addAdvanceRuleClick" icon="icon-android-add"> 
                        <i xid="i25" class="icon-android-add" />  
                        <span xid="span26" /> 
                      </a>  
                      <a component="$UI/system/components/justep/button/button" class="btn btn-link" label="删除" xid="deleteAdvanceRule" onClick="deleteAdvanceRuleClick" icon="icon-android-close"> 
                        <i xid="i26" class="icon-android-close" />  
                        <span xid="span27" /> 
                      </a> 
                    </div>  
                    <div component="$UI/system/components/justep/dataTables/dataTables" flexibleWidth="true" rowActiveClass="active" class="table table-hover table-striped" xid="dataTables4" data="advanceRulesData"> 
                      <columns xid="columns9"> 
                        <column name="name" xid="column8" /> 
                      </columns> 
                    </div> 
                  </div>  
                  <div class="col col-xs-8" xid="col48"> 
                    <div component="$UI/system/components/justep/row/row" class="x-row" xid="row22"> 
                      <div class="x-col" xid="col49"> 
                        <span component="$UI/system/components/justep/button/checkbox" class="x-checkbox" xid="checkbox9" label="流转确认" checkedValue="dialogEnabled" bind-ref="advanceRulesData.ref('dialogEnabled')" /> 
                      </div>  
                      <div class="x-col" xid="col50"> 
                        <span component="$UI/system/components/justep/button/checkbox" class="x-checkbox" xid="checkbox10" label="允许跳转" checkedValue="jumpEnabled" bind-ref="advanceRulesData.ref('jumpEnabled')" /> 
                      </div>  
                      <div class="x-col" xid="col51" /> 
                    </div>  
                    <div component="$UI/system/components/justep/row/row" class="x-row" xid="row23"> 
                      <div class="x-col" xid="col52"> 
                        <span component="$UI/system/components/justep/button/checkbox" class="x-checkbox" xid="checkbox11" label="任务等待" checkedValue="taskWait" bind-ref="advanceRulesData.ref('taskWait')" /> 
                      </div>  
                      <div class="x-col" xid="col53"> 
                        <span component="$UI/system/components/justep/button/checkbox" class="x-checkbox" xid="checkbox12" label="任务合并" checkedValue="taskJoin" bind-ref="advanceRulesData.ref('taskJoin')" /> 
                      </div>  
                      <div class="x-col" xid="col54" /> 
                    </div>  
                    <div component="$UI/system/components/justep/row/row" class="x-row" xid="row24"> 
                      <div class="x-col" xid="col55"> 
                        <span component="$UI/system/components/justep/button/checkbox" class="x-checkbox" xid="checkbox13" label="是否需要保存" checkedValue="saveEnabled" bind-ref="advanceRulesData.ref('saveEnabled')" /> 
                      </div>  
                      <div class="x-col" xid="col56" />  
                      <div class="x-col" xid="col57" /> 
                    </div>  
                    <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label30" xid="labelEdit29"> 
                      <label class="x-label" xid="label29"><![CDATA[强制流转]]></label>  
                      <input component="$UI/system/components/justep/input/input" class="form-control x-edit" xid="input17" bind-ref="advanceRulesData.ref('ignoreExecuteMode')" /> 
                    </div>  
                    <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label30" xid="labelEdit30"> 
                      <label class="x-label" xid="label30"><![CDATA[生效条件]]></label>  
                      <input component="$UI/system/components/justep/input/input" class="form-control x-edit" xid="input18" bind-ref="advanceRulesData.ref('condition')" /> 
                    </div>  
                    <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label30" xid="labelEdit31"> 
                      <label class="x-label" xid="label31"><![CDATA[任务分支环节]]></label>  
                      <select component="$UI/system/components/justep/select/select" class="form-control x-edit" xid="select9" bind-ref="advanceRulesData.ref('forkActivity')" bind-options="labelData" bind-optionsValue="value" bind-optionsLabel="oValue" /> 
                    </div> 
                  </div> 
                </div> 
              </div> 
            </div> 
          </div><div class="tab-pane" xid="tabContent6"> 
            <div class="panel panel-default" component="$UI/system/components/bootstrap/panel/panel" xid="panel7"> 
              <div class="panel-body" xid="body6"> 
                <div component="$UI/system/components/bootstrap/row/row" class="row" xid="row26"> 
                  <div class="col col-xs-4" xid="col63"> 
                    <div component="$UI/system/components/justep/toolBar/toolBar" class="x-toolbar form-inline x-toolbar-spliter" xid="toolBar5"> 
                      <a component="$UI/system/components/justep/button/button" class="btn btn-link" label="新增" xid="addBackRule" onClick="addBackRuleClick" icon="icon-android-add"> 
                        <i xid="i27" class="icon-android-add" />  
                        <span xid="span28" /> 
                      </a>  
                      <a component="$UI/system/components/justep/button/button" class="btn btn-link" label="删除" xid="deleteBackRule" onClick="deleteBackRuleClick" icon="icon-android-close"> 
                        <i xid="i28" class="icon-android-close" />  
                        <span xid="span29" /> 
                      </a> 
                    </div>  
                    <div component="$UI/system/components/justep/dataTables/dataTables" flexibleWidth="true" rowActiveClass="active" class="table table-hover table-striped" xid="dataTables5" data="backRulesData"> 
                      <columns xid="columns10"> 
                        <column name="name" xid="column9" /> 
                      </columns> 
                    </div> 
                  </div>  
                  <div class="col col-xs-8" xid="col61"> 
                    <div component="$UI/system/components/justep/row/row" class="x-row" xid="row27"> 
                      <div class="x-col" xid="col66"> 
                        <span component="$UI/system/components/justep/button/checkbox" class="x-checkbox" xid="checkbox14" label="回退确认" checkedValue="dialogEnabled" bind-ref="backRulesData.ref('dialogEnabled')" /> 
                      </div>  
                      <div class="x-col" xid="col65"> 
                        <span component="$UI/system/components/justep/button/checkbox" class="x-checkbox" xid="checkbox17" label="强制回退" checkedValue="ignoreExecuteMode" bind-ref="backRulesData.ref('ignoreExecuteMode')" /> 
                      </div>  
                      <div class="x-col" xid="col64" ><span component="$UI/system/components/justep/button/checkbox" class="x-checkbox" xid="checkbox16" label="是否需要保存" checkedValue="saveEnabled" bind-ref="backRulesData.ref('saveEnabled')" /></div> 
                    </div>  
                      
                      
                    <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label30" xid="labelEdit36"> 
                      <label class="x-label" xid="label34">生效条件</label>  
                      <input component="$UI/system/components/justep/input/input" class="form-control x-edit" xid="input20" bind-ref="backRulesData.ref('condition')" /> 
                    </div><div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label30" xid="labelEdit35"> 
                      <label class="x-label" xid="label35"><![CDATA[返回方式]]></label>  
                      <select component="$UI/system/components/justep/select/select" class="form-control x-edit" xid="select12" bind-ref="backRulesData.ref('thenFlowMode')" bind-options="thenFlowModeData" bind-optionsValue="value" bind-optionsLabel="oValue" /> 
                    </div><div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label30" xid="labelEdit34"> 
                      <label class="x-label" xid="label36"><![CDATA[回退范围]]></label>  
                      <select component="$UI/system/components/justep/select/select" class="form-control x-edit" xid="select11" bind-ref="backRulesData.ref('backRange')" bind-options="backRangeData" bind-optionsValue="value" bind-optionsLabel="oValue" /> 
                    </div>  
                    <div xid="div10" bind-visible="$model.backRulesData.val(&quot;backRange&quot;) == &quot;specified&quot;"> 
                      <h4 xid="h41"><![CDATA[指定环节列表]]></h4><div component="$UI/system/components/justep/toolBar/toolBar" class="x-toolbar form-inline x-toolbar-spliter" xid="toolBar6"> 
                        <a component="$UI/system/components/justep/button/button" class="btn btn-link" label="增加" xid="button3" onClick="button3Click" icon="icon-android-add"> 
                          <i xid="i7" class="icon-android-add" />  
                          <span xid="span7">增加</span> 
                        </a>  
                        <a component="$UI/system/components/justep/button/button" class="btn btn-link" label="删除" xid="button4" onClick="button4Click" icon="icon-android-close"> 
                          <i xid="i11" class="icon-android-close" />  
                          <span xid="span11">删除</span> 
                        </a> 
                      </div>  
                       
                    <div xid="div6" style=" height:100px; overflow:auto"><div component="$UI/system/components/justep/dataTables/dataTables" flexibleWidth="true" rowActiveClass="active" class="table table-hover table-striped" xid="dataTables8" data="designatedLinkData" filter="$row.val(&quot;id&quot;) == $model.backRulesData.val(&quot;id&quot;)"> 
                        <columns xid="columns3"> 
                          <column name="linkName" xid="column4" /> 
                        </columns> 
                      </div></div></div> 
                  </div> 
                </div> 
              </div> 
            </div> 
          </div></div> 
      </div> 
    </div>  
    <div class="x-panel-bottom" xid="bottom1"> 
      <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-only-label x-dialog-button"
        label="取消" xid="cancel" onClick="cancelClick"> 
        <i xid="i2"/>  
        <span xid="span2">取消</span> 
      </a>  
      <a component="$UI/system/components/justep/button/button" class="btn btn-primary btn-only-label x-dialog-button"
        label="确定" xid="okbtn"> 
        <i xid="i1"/>  
        <span xid="span1" bind-click="span1Click">确定</span> 
      </a> 
    </div> 
  </div> 
</div>
