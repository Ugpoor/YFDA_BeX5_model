<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window" component="$UI/system/components/justep/window/window">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="width:102px;height:auto;left:319px;top:206px;"> 
    <div component="$UI/system/components/justep/data/bizData" xid="taskData"
      concept="OA_TasksAssigned" autoLoad="false" limit="-1" confirmDelete="false"
      orderBy="fLastModifyTime desc"> 
      <reader xid="default1" action="/OA/personalOffice/logic/action/queryOA_TasksAssignedAction"/>  
      <writer xid="default2" action="/OA/personalOffice/logic/action/saveOA_TasksAssignedAction"/>  
      <creator xid="default3" action="/OA/personalOffice/logic/action/createOA_TasksAssignedAction"/>  
      <rule xid="rule1"> 
        <col name="fContent" xid="ruleCol1"> 
          <required xid="required1"> 
            <expr xid="default4">js:true</expr>  
            <message xid="default5">请输入文字内容</message> 
          </required> 
        </col>  
        <col name="fExecutor" xid="ruleCol2"> 
          <required xid="required2"> 
            <expr xid="default6">js:true</expr>  
            <message xid="default7">请选择负责人</message> 
          </required> 
        </col> 
      </rule> 
    </div>  
    <div component="$UI/system/components/justep/data/bizData" xid="upToDateData"
      concept="OA_TasksAssignedDate" autoNew="false"> 
      <reader xid="default18" action="/OA/personalOffice/logic/action/queryOA_TasksAssignedDateAction"/>  
      <writer xid="default19" action="/OA/personalOffice/logic/action/saveOA_TasksAssignedDateAction"/>  
      <creator xid="default20" action="/OA/personalOffice/logic/action/createOA_TasksAssignedDateAction"/>  
      <master xid="default21" data="taskData" relation="fTaskID"/>  
      <rule xid="rule3"> 
        <col name="fUpToDate" xid="ruleCol7"> 
          <required xid="required7"> 
            <expr xid="default38">js:true</expr>  
            <message xid="default39">请选择截止日期</message> 
          </required> 
        </col> 
      </rule> 
    </div> 
  </div>  
  <!--   <span component="$UI/system/components/justep/org/orgDialog" xid="orgSingleDialog"
    onReceive="orgSingleDialogReceive"/>  
  <span component="$UI/system/components/justep/org/orgDialog" xid="orgMutilDialog"
    multiSelection="true" onReceive="orgMutilDialogReceive"/>   -->  
  <span component="$UI/system/components/justep/messageDialog/messageDialog"
    xid="closeMsgDlg" type="YesNo" onClose="closeMsgDlgClose" title="提示" message="是否取消当前操作？" style="left:62px;top:8px;"/>  
  <div component="$UI/system/components/justep/panel/panel" class="x-panel x-full"
    xid="panel3"> 
    <div class="x-panel-top" xid="top3"> 
      <div component="$UI/system/components/justep/titleBar/titleBar" class="x-titlebar"
        xid="titleBar2" title="新建工作"> 
        <div class="x-titlebar-left" xid="div27"> 
          <a component="$UI/system/components/justep/button/button" class="btn btn-link"
            xid="listBtn" icon="icon-chevron-left" onClick="listBtnClick"> 
            <i xid="i1" class="icon-chevron-left"/>  
            <span xid="span2"/> 
          </a> 
        </div>  
        <div class="x-titlebar-title" xid="div28">新建工作</div>  
        <div class="x-titlebar-right reverse" xid="div29"> 
          <a component="$UI/system/components/justep/button/button" class="btn btn-link"
            xid="saveBtn" icon="icon-checkmark-round" onClick="saveBtnClick"> 
            <i xid="i2" class="icon-checkmark-round"/>  
            <span xid="span6"/> 
          </a> 
        </div> 
      </div> 
    </div>  
    <div class="x-panel-content" xid="content5"> 
      <textarea component="$UI/system/components/justep/textarea/textarea" placeHolder="请输入文字内容"
        class="form-control input-row" xid="textarea1" bind-ref="taskData.ref('fContent')"
        style="height:128px;"/>  
        <div>
      <div component="$UI/system/components/justep/attachment/attachment" access="duud" xid="attachment1" bind-ref="taskData.ref('fAttachment')">
   <div class="x-attachment" xid="div1">
    <div class="x-attachment-content x-card-border" xid="div2">
     <div class="x-doc-process" xid="div3">
      <div class="progress-bar x-doc-process-bar" role="progressbar" style="width:0%;" xid="div4"></div></div> 
     <div data-bind="foreach:$attachmentItems" xid="div5">
      <div class="x-attachment-cell" xid="div6">
       <div class="x-attachment-item x-item-other" data-bind="click:$model.previewOrRemoveItem.bind($model),style:{opacity: $model.$access.get() % 4 &gt;= 2 || $model.$state.get() == 'remove' ? '1.0' : '0.5',backgroundImage:($model.previewPicture.bind($model,$object))()}" xid="div7">
        <a data-bind="visible:$model.$state.get() == 'remove'" class="x-remove-barget" xid="a1"></a></div> </div> </div> 
     <div class="x-attachment-cell" data-bind="visible:$state.get() == 'upload' &amp;&amp; ($limit.get() == '-1' || $limit.get() &gt; $attachmentItems.get().length)" xid="div8">
      <div class="x-attachment-item x-item-upload" data-bind="visible:$state.get() == 'upload' &amp;&amp; $access.get() % 512 &gt;= 256" xid="div9"></div></div> 
     <div class="x-attachment-cell" data-bind="visible:$state.get() == 'upload' &amp;&amp; $attachmentItems.get().length &gt; 0" xid="div10">
      <div class="x-attachment-item x-item-remove" data-bind="click:changeState.bind($object,'remove'),visible:$access.get() % 2048 &gt;= 1024" xid="div11"></div></div> 
     <div style="clear:both;" xid="div12"></div></div> </div> </div></div>
      <div _component="$UI/system/components/justep/labelEdit/labelEdit" class="input-group input-group-row "
        xid="labelInput1"> 
        <span class="input-group-addon"><![CDATA[截止日期]]></span>  
        <input component="$UI/system/components/justep/input/input" class="form-control x-edit"
          xid="input5" bind-ref="upToDateData.ref('fUpToDate')" placeHolder="请选择时间  "
          style="text-align:right;" min="js:new Date()"/> 
      </div>  
      <div class="x-ro" component="$UI/system/components/justep/social/relativeOrg/relativeOrg"
        xid="selectExecutor" data="taskData" bind-nameRef="taskData.ref('fName')"
        groupName="负责人" groupID="A" multiSelection="false" statusEnabled="false" onChange="selectExecutorChange"> 
        <div component="$UI/system/components/justep/data/bizData" concept="SA_Social"
          xid="bizData3"/>  
        <!--           <div class="x-ro-title" xid="div13"> 
            <div class="pull-left x-ro-title-content" xid="div14">TO：负责人</div>  
            <div class="pull-left x-ro-title-status" xid="div16"/>  
            <div style="clear:both" xid="div17"/>
          </div>  --> 
      </div>  
      <div xid="div15" style="height:1px;"/>  
      <div class="x-ro" component="$UI/system/components/justep/social/relativeOrg/relativeOrg"
        xid="selectParticipants" data="taskData" bind-nameRef="taskData.ref('fName')"
        multiSelection="true" groupName="参与人" groupID="P" socialData="bizData3" statusEnabled="false"> 
        <div component="$UI/system/components/justep/data/bizData" concept="SA_Social"
          xid="bizData1"/>  
      </div>  

    </div> 
  </div>  
  <span component="$UI/system/components/justep/windowReceiver/windowReceiver"
    xid="windowReceiver" style="left:17px;top:429px;" onReceive="windowReceiverReceive"/> 
</div>
