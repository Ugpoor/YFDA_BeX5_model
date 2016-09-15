<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window" component="$UI/system/components/justep/window/window">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="width:102px;height:auto;left:184px;top:201px;"> 
    <div component="$UI/system/components/justep/data/bizData" xid="evectionData"
      concept="OA_Evection" autoLoad="false" limit="-1" onBeforeSave="taskDataBeforeSave"
      confirmDelete="false" orderBy="fCreatorTime desc"> 
      <reader xid="default1" action="/OA/personalOffice/logic/action/queryOA_EvectionAction"/>  
      <writer xid="default2" action="/OA/personalOffice/logic/action/saveOA_EvectionAction"/>  
      <creator xid="default3" action="/OA/personalOffice/logic/action/createOA_EvectionAction"/>  
      <rule xid="rule1">
   <col name="fContent" xid="ruleCol1">
    <required xid="required1">
     <expr xid="default4">js:true</expr>
     <message xid="default5">请输入文字内容</message></required> </col> 
   <col name="fPlace" xid="ruleCol2">
    <required xid="required2">
     <expr xid="default6">js:true</expr>
     <message xid="default7">请输入地点</message></required> </col> 
   <col name="fStartDate" xid="ruleCol3">
    <required xid="required3">
     <expr xid="default8">js:true</expr>
     <message xid="default9">请选择开始日期</message></required> 
    <constraint xid="constraint1">
     <expr xid="default10"><![CDATA[js: $row.val("fStartDate")  <=  $row.val("fEndDate")]]></expr>
     <message xid="default11">开始日期不能大于结束日期</message></constraint> </col> 
   <col name="fEndDate" xid="ruleCol4">
    <required xid="required4">
     <expr xid="default12">js:true</expr>
     <message xid="default13">请选择结束日期</message></required> </col> </rule></div>  
    <div component="$UI/system/components/justep/data/bizData" xid="evePlaceData"
      concept="OA_EvectionPlace" autoNew="false"> 
      <reader xid="default18" action="/OA/personalOffice/logic/action/queryOA_EvectionPlaceAction"/>  
      <writer xid="default19" action="/OA/personalOffice/logic/action/saveOA_EvectionPlaceAction"/>  
      <creator xid="default20" action="/OA/personalOffice/logic/action/createOA_EvectionPlaceAction"/>  
      <master xid="default21" data="evectionData" relation="fEvectionID"/>  
      <rule xid="rule3">
   <col name="fStartDate" xid="ruleCol8">
    <required xid="required8">
     <expr xid="default24">js:true</expr>
     <message xid="default25">请选择开始日期</message></required> 
    <constraint xid="constraint2">
     <expr xid="default26"><![CDATA[js: $row.val("fStartDate")  <=  $row.val("fEndDate")]]></expr>
     <message xid="default27">开始日期不能大于结束日期</message></constraint> </col> 
   <col name="fEndDate" xid="ruleCol9">
    <required xid="required9">
     <expr xid="default28">js:true</expr>
     <message xid="default29">请选择结束日期</message></required> </col> 
   <col name="fPlace" xid="ruleCol10">
    <required xid="required10">
     <expr xid="default30">js:true</expr>
     <message xid="default31">请输入地点</message></required> </col> </rule></div> 
  </div>  
  <!--   <span component="$UI/system/components/justep/org/orgDialog" xid="orgSingleDialog"
    onReceive="orgSingleDialogReceive"/>  
  <span component="$UI/system/components/justep/org/orgDialog" xid="orgMutilDialog"
    multiSelection="true" onReceive="orgMutilDialogReceive"/>   -->  
  <span component="$UI/system/components/justep/messageDialog/messageDialog"
    xid="closeMsgDlg" type="YesNo" onClose="closeMsgDlgClose" title="提示" message="是否取消当前操作？"/>  
  <div component="$UI/system/components/justep/panel/panel" class="x-panel x-full"
    xid="panel3"> 
    <div class="x-panel-top" xid="top3"> 
      <div component="$UI/system/components/justep/titleBar/titleBar" class="x-titlebar"
        xid="titleBar2" title="新建出差管理"> 
        <div class="x-titlebar-left" xid="div27"> 
          <a component="$UI/system/components/justep/button/button" class="btn btn-link"
            xid="listBtn" onClick="listBtnClick" icon="icon-chevron-left"> 
            <i xid="i1" class="icon-chevron-left"/>  
            <span xid="span2"/> 
          </a> 
        </div>  
        <div class="x-titlebar-title" xid="div28">新建出差管理</div>  
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
      <div _component="$UI/system/components/justep/labelEdit/labelEdit" class="input-group input-group-row"
        xid="startLabelInput2"> 
        <span class="input-group-addon"><![CDATA[出差地点]]></span>  
        <input component="$UI/system/components/justep/input/input" class="form-control x-edit"
          xid="inputstart2" bind-ref="evectionData.ref('fPlace')" placeHolder="请输入出差地点"
          style="text-align:right;" min="js:new Date()"/> 
      </div>  
      <div _component="$UI/system/components/justep/labelEdit/labelEdit" class="input-group input-group-row"
        xid="endLabelInput2"> 
        <span class="input-group-addon"><![CDATA[开始日期]]></span>  
        <input component="$UI/system/components/justep/input/input" class="form-control x-edit"
          xid="inputend2" bind-ref="evectionData.ref('fStartDate')" placeHolder="请选择日期"
          style="text-align:right;"/> 
      </div>  
      <div _component="$UI/system/components/justep/labelEdit/labelEdit" class="input-group input-group-row"
        xid="placeLabelInput2"> 
        <span class="input-group-addon"><![CDATA[结束日期]]></span>  
        <input component="$UI/system/components/justep/input/input" class="form-control x-edit"
          xid="placeinput2" bind-ref="evectionData.ref('fEndDate')" placeHolder="请选择日期"
          style="text-align:right;"/> 
      </div>  
      <ul bind-foreach="evePlaceData.datas"> 
        <li> 
          <div _component="$UI/system/components/justep/labelEdit/labelEdit"
            class="input-group input-group-row" xid="startLabelInput"> 
            <span class="input-group-addon"><![CDATA[出差地点]]></span>  
            <input component="$UI/system/components/justep/input/input" class="form-control x-edit"
              xid="inputstart" bind-ref="ref('fPlace')" placeHolder="请输入出差地点" style="text-align:right;"/>  
            <div xid="div1" class="input-group-addon" style="inline-height:28px;vertical-align:middle;"
              bind-click="delPlaceClick" bind-value="ref('OA_EvectionPlace')"> 
              <i class="icon-close" style="color:#FF0000;"/> 
            </div> 
          </div>  
          <div _component="$UI/system/components/justep/labelEdit/labelEdit"
            class="input-group input-group-row" xid="endLabelInput"> 
            <span class="input-group-addon"><![CDATA[开始日期]]></span>  
            <input component="$UI/system/components/justep/input/input" class="form-control x-edit"
              xid="inputend" bind-ref="ref('fStartDate')" placeHolder="请选择日期" style="text-align:right;"/> 
          </div>  
          <div _component="$UI/system/components/justep/labelEdit/labelEdit"
            class="input-group input-group-row" xid="placeLabelInput"> 
            <span class="input-group-addon"><![CDATA[结束日期]]></span>  
            <input component="$UI/system/components/justep/input/input" class="form-control x-edit"
              xid="placeinput" bind-ref="ref('fEndDate')" placeHolder="请选择日期" style="text-align:right;"/> 
          </div> 
        </li> 
      </ul>  
      <div id="choiceLabelInput" bind-click="newPlaceClick" class="input-group input-group-row"
        style="height:40px;"> 
        <span class="input-group-addon" style="text-align:left;"><![CDATA[新增出差地点]]></span>  
        <!--       <div xid="choiceinput" class="form-control x-edit"
            style="text-align:right;" title="&gt;">&gt;</div>  -->  
        <span class="input-group-addon" style="text-align:right;"> 
          <i class="icon-chevron-right"/> 
        </span> 
      </div>  
      <div class="input-row"> 
        <textarea component="$UI/system/components/justep/textarea/textarea" placeHolder="请输入文字内容"
          class="form-control " xid="textarea1" bind-ref="evectionData.ref('fContent')"
          style="height:128px;"/> 
      </div>  
      <div>
      <div component="$UI/system/components/justep/attachment/attachment" access="duud" xid="attachment1" bind-ref="evectionData.ref('fAttachment')">
   <div class="x-attachment" xid="div2">
    <div class="x-attachment-content x-card-border" xid="div3">
     <div class="x-doc-process" xid="div4">
      <div class="progress-bar x-doc-process-bar" role="progressbar" style="width:0%;" xid="div5"></div></div> 
     <div data-bind="foreach:$attachmentItems" xid="div6">
      <div class="x-attachment-cell" xid="div7">
       <div class="x-attachment-item x-item-other" data-bind="click:$model.previewOrRemoveItem.bind($model),style:{opacity: $model.$access.get() % 4 &gt;= 2 || $model.$state.get() == 'remove' ? '1.0' : '0.5',backgroundImage:($model.previewPicture.bind($model,$object))()}" xid="div8">
        <a data-bind="visible:$model.$state.get() == 'remove'" class="x-remove-barget" xid="a1"></a></div> </div> </div> 
     <div class="x-attachment-cell" data-bind="visible:$state.get() == 'upload' &amp;&amp; ($limit.get() == '-1' || $limit.get() &gt; $attachmentItems.get().length)" xid="div9">
      <div class="x-attachment-item x-item-upload" data-bind="visible:$state.get() == 'upload' &amp;&amp; $access.get() % 512 &gt;= 256" xid="div10"></div></div> 
     <div class="x-attachment-cell" data-bind="visible:$state.get() == 'upload' &amp;&amp; $attachmentItems.get().length &gt; 0" xid="div11">
      <div class="x-attachment-item x-item-remove" data-bind="click:changeState.bind($object,'remove'),visible:$access.get() % 2048 &gt;= 1024" xid="div12"></div></div> 
     <div style="clear:both;" xid="div13"></div></div> </div> </div></div>
      <div class="x-ro" component="$UI/system/components/justep/social/relativeOrg/relativeOrg"
        xid="selectExecutor" data="evectionData" bind-nameRef="evectionData.ref('fCreator')"
        groupName="审批人" groupID="A" multiSelection="false" statusEnabled="false"> 
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
        xid="selectParticipants" data="evectionData" bind-nameRef="evectionData.ref('fCreator')"
        multiSelection="true" groupName="知会相关人" groupID="P" socialData="bizData3"
        statusEnabled="false"> 
        <div component="$UI/system/components/justep/data/bizData" concept="SA_Social"
          xid="bizData1"/> 
      </div>  

    </div> 
  </div>  
  <span component="$UI/system/components/justep/windowReceiver/windowReceiver"
    xid="windowReceiver" style="left:17px;top:429px;" onReceive="windowReceiverReceive"/> 
</div>
