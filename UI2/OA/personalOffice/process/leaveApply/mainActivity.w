<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window"  component="$UI/system/components/justep/window/window">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:144px;top:311px;"> 
    <div component="$UI/system/components/justep/data/bizData" xid="leaveApplyData"
      concept="OA_LeaveApply" autoNew="false" autoLoad="false" onValueChange="leaveApplyDataValueChange"> 
      <reader xid="default1" action="/OA/personalOffice/logic/action/queryOA_LeaveApplyAction"/>  
      <writer xid="default2" action="/OA/personalOffice/logic/action/saveOA_LeaveApplyAction"/>  
      <creator xid="default3" action="/OA/personalOffice/logic/action/createOA_LeaveApplyAction"/>  
      <calculateRelation relation="fLeaveDayHour" xid="calculateRelation1"/>  
      <rule xid="rule1">
   <col name="fContent" xid="ruleCol1">
    <required xid="required1">
     <expr xid="default4">js:true</expr>
     <message xid="default5">请输入请假原因</message></required> </col> 
   <col name="fStartTime" xid="ruleCol2">
    <required xid="required2">
     <expr xid="default9">js:true</expr>
     <message xid="default10">请选择开始时间</message></required> 
    <constraint xid="constraint1">
     <expr xid="default11"><![CDATA[js:$row.val("fStartTime") < $row.val("fEndTime")]]></expr>
     <message xid="default12"><![CDATA[开始时间不能大于结束时间]]></message></constraint> </col> 
   <col name="fEndTime" xid="ruleCol3">
    <required xid="required3">
     <expr xid="default13">js:true</expr>
     <message xid="default14">请选择结束时间</message></required> 
    </col> 
   <col name="fLeaveType" xid="ruleCol4">
    <required xid="required4">
     <expr xid="default17">js:true</expr>
     <message xid="default18">请选择请假类型</message></required> </col> </rule></div>  
    <div component="$UI/system/components/justep/data/data" xid="leaveTypeData"
      idColumn="type" autoLoad="true"> 
      <column label="请假类型" name="type" type="String" xid="default6"/>  
      <column label="类型ID" name="typeID" type="String" xid="default7"/>  
      <data xid="default8">[{"type":"事假","typeID":"1"},{"type":"病假","typeID":"2"},{"type":"年假","typeID":"3"}]</data> 
    </div> 
  </div>  
  
    <div component="$UI/system/components/justep/popMenu/popMenu" class="x-popMenu"
    xid="processMenu" anchor="moreBtn"> 
    <div class="x-popMenu-overlay" xid="div4"/>  
    <ul component="$UI/system/components/justep/menu/menu" class="x-menu dropdown-menu x-popMenu-content"
      xid="menu1"> 
      <li class="x-menu-item" xid="item2"> 
        <a component="$UI/system/components/justep/button/button" class="btn btn-link"
          label="保存" xid="saveButton" onClick="{operation:'leaveApplyData.save'}"> 
          <i xid="i5"/>  
          <span xid="span5">保存</span> 
        </a> 
      </li>  
      <li class="x-menu-divider divider" xid="divider1"/>  
      <li class="x-menu-item" xid="item1"> 
        <a component="$UI/system/components/justep/button/button" class="btn btn-link"
          label="回退" xid="backButton" onClick="{operation:'process.back'}"> 
          <i xid="i2"/>  
          <span xid="span2">回退</span> 
        </a> 
      </li>  
      <li class="x-menu-divider divider" xid="divider2"/>  
      <li class="x-menu-item" xid="item3"> 
        <a component="$UI/system/components/justep/button/button" class="btn btn-link"
          label="终止" xid="abortButton" onClick="{operation:'process.abort'}"> 
          <i xid="i6"/>  
          <span xid="span6">终止</span> 
        </a> 
      </li>  
      <li class="x-menu-divider divider" xid="divider3"/>  
      <li class="x-menu-item" xid="item4"> 
        <a component="$UI/system/components/justep/button/button" class="btn btn-link"
          label="流程图" xid="showChart" onClick="{operation:'process.showChart'}"> 
          <i xid="i7"/>  
          <span xid="span7">流程图</span>
        </a> 
      </li>
    </ul> 
  </div>  
  <span component="$UI/system/components/justep/windowReceiver/windowReceiver"
    xid="windowReceiver" onReceive="windowReceiverReceive" style="left:23px;top:322px;"/>  
  <span component="$UI/system/components/justep/messageDialog/messageDialog" xid="messageDialog" message="开始时间不能大于结束时间" title="提示" style="left:97px;top:339px;"></span><div component="$UI/system/components/justep/panel/panel" class="x-panel x-full"
    xid="panel1"> 
    <div class="x-panel-top" xid="top1"> 
      <div component="$UI/system/components/justep/titleBar/titleBar" class="x-titlebar"
        xid="titleBar1" title="请假申请"> 
        <div class="x-titlebar-left" xid="div1" style="width:101px;"> 
          <a component="$UI/system/components/justep/button/button" class="btn btn-link"
            xid="closeBtn" onClick="closeBtnClick" icon="icon-chevron-left"> 
            <i xid="i4" class="icon-chevron-left"/>  
            <span xid="span4"/> 
          </a> 
        </div>  
        <div class="x-titlebar-title" xid="div2">请假申请</div>  
        <div class="x-titlebar-right reverse" xid="div3" style="width:188px;"> 
          <a component="$UI/system/components/justep/button/button" class="btn btn-link"
            xid="moreBtn" onClick="moreBtnClick" icon="icon-android-more"> 
            <i xid="i1" class="icon-android-more"/>  
            <span xid="span1"/> 
          </a>  
          <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-only-icon"
            xid="advanceButt" onClick="{operation:'process.advance'}"> 
            <i xid="i3"/>  
            <span xid="span3"/> 
          </a> 
        </div> 
      </div> 
    </div>  
    <div class="x-panel-content" xid="content1"> 
      <div dir="ltr"> 
        <div _component="$UI/system/components/justep/labelEdit/labelEdit"
          class="input-group input-group-row" xid="typeLabelInput"> 
          <span class="input-group-addon"><![CDATA[请假类型]]></span>  
          <div component="$UI/system/components/justep/output/output" class="form-control x-edit"
            xid="LeaveTypeOutput" style="text-align:right;" bind-ref="leaveApplyData.ref('fLeaveType')"
            bind-click="LeaveTypeOutputClick"/> 
        </div>  
        <div _component="$UI/system/components/justep/labelEdit/labelEdit"
          class="input-group input-group-row" xid="startLabelInput"> 
          <span class="input-group-addon"><![CDATA[开始时间]]></span>  
          <input component="$UI/system/components/justep/input/input" class="form-control x-edit"
            xid="startDateInput" bind-ref="leaveApplyData.ref('fStartTime')" placeHolder="请选择日期"
            style="text-align:right;"/> 
        </div>  
        <div _component="$UI/system/components/justep/labelEdit/labelEdit"
          class="input-group input-group-row" xid="endLabelInput"> 
          <span class="input-group-addon"><![CDATA[结束时间]]></span>  
          <input component="$UI/system/components/justep/input/input" class="form-control x-edit"
            xid="endDateInput" bind-ref="leaveApplyData.ref('fEndTime')" placeHolder="请选择日期"
            style="text-align:right;"/> 
        </div>  
        <div _component="$UI/system/components/justep/labelEdit/labelEdit"
          class="input-group input-group-row" xid="daysLabelInput"> 
          <span class="input-group-addon"><![CDATA[ 请假天数]]></span>  
          <div component="$UI/system/components/justep/output/output" class="form-control x-edit"
            xid="daysInput" bind-ref="leaveApplyData.ref('fLeaveDayHour')" style="text-align:right;"/> 
        </div>  
        <div _component="$UI/system/components/justep/labelEdit/labelEdit"
          class="input-group input-row" xid="contentLabelInput" style="width:100%;"> 
          <!--  <span xid="span8" class="input-group-addon" ></span> -->  
          <textarea component="$UI/system/components/justep/textarea/textarea" class="form-control x-edit"
            style="height:84px;" placeHolder="请输入请假原因  " xid="textarea1" bind-ref="leaveApplyData.ref('fContent')"/> 
        </div> 
      </div> 
    </div>  
    </div>  
  <div component="$UI/system/components/justep/process/process" xid="process"
    data="leaveApplyData" autoFilter="true" autoClose="false" onAdvanceCommit="processAdvanceCommit"/>  
  <div component="$UI/system/components/justep/popMenu/popMenu" class="x-popMenu"
    xid="leaveTypeMenu"> 
    <div class="x-popMenu-overlay" xid="div5"/>  
    <ul component="$UI/system/components/justep/menu/menu" class="x-menu dropdown-menu x-popMenu-content"
      xid="menu3"> 
      <li class="x-menu-item" xid="item5"> 
        <a component="$UI/system/components/justep/button/button" class="btn btn-link"
          label="事假" xid="leaveBtn" bind-click="leaveBtnClick"> 
          <i xid="i8"/>  
          <span xid="span8">事假</span> 
        </a> 
      </li>  
      <li class="x-menu-divider divider" xid="divider4"/>  
      <li class="x-menu-item" xid="item6"> 
        <a component="$UI/system/components/justep/button/button" class="btn btn-link"
          label="病假" xid="sickLeaveBtn" bind-click="sickLeaveClick"> 
          <i xid="i9"/>  
          <span xid="span9">病假</span> 
        </a> 
      </li>  
      <li class="x-menu-divider divider" xid="divider5"/>  
      <li class="x-menu-item" xid="item7"> 
        <a component="$UI/system/components/justep/button/button" class="btn btn-link"
          label="年假" xid="annualLeaveBtn" bind-click="annualLeaveClick"> 
          <i xid="i10"/>  
          <span xid="span10">年假</span> 
        </a> 
      </li> 
    </ul> 
  </div> 
<span component="$UI/system/components/justep/messageDialog/messageDialog" xid="closeMsgDlg" type="YesNo" onClose="closeMsgDlgClose" title="提示" message="是否取消当前操作？" style="left:45px;top:372px;"></span></div>
