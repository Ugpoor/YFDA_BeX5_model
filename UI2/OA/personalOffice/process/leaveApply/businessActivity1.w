<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window oa" component="$UI/system/components/justep/window/window">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:144px;top:311px;">
    <div component="$UI/system/components/justep/data/bizData" xid="leaveApplyData"
      concept="OA_LeaveApply" autoNew="false" autoLoad="true" onAfterRefresh="leaveApplyDataAfterRefresh">
      <reader xid="default1" action="/OA/personalOffice/logic/action/queryOA_LeaveApplyAction"/>  
      <writer xid="default2" action="/OA/personalOffice/logic/action/saveOA_LeaveApplyAction"/>  
      <creator xid="default3" action="/OA/personalOffice/logic/action/createOA_LeaveApplyAction"/>
    <calculateRelation relation="fLeaveDayHour" xid="calculateRelation1"></calculateRelation>
  <calculateRelation relation="fShowTime" xid="calculateRelation2"></calculateRelation></div>  
    <div component="$UI/system/components/justep/data/data" xid="leaveTypeData"
      idColumn="type" autoLoad="true">
      <column label="请假类型" name="type" type="String" xid="default6"/>  
      <column label="类型ID" name="typeID" type="String" xid="default7"/>  
      <data xid="default8">[{"type":"事假","typeID":"1"},{"type":"病假","typeID":"2"},{"type":"年假","typeID":"3"}]</data>
    </div>
  </div>  
  <div component="$UI/system/components/justep/popMenu/popMenu" class="x-popMenu"
    xid="processMenu" anchor="moreButt"> 
    <div class="x-popMenu-overlay" xid="div4"/>  
    <ul component="$UI/system/components/justep/menu/menu" class="x-menu dropdown-menu x-popMenu-content"
      xid="menu1">
      <li class="x-menu-item" xid="item1"> 
        <a component="$UI/system/components/justep/button/button" class="btn btn-link"
          label="回退" xid="backButton" onClick="{operation:'process.back'}"> 
          <i xid="i2"/>  
          <span xid="span2">回退</span>
        </a> 
      </li>  
      <li class="x-menu-divider divider" xid="divider1"/>  
      <li class="x-menu-item" xid="item3"> 
        <a component="$UI/system/components/justep/button/button" class="btn btn-link"
          label="终止" xid="abortButton" onClick="{operation:'process.abort'}"> 
          <i xid="i6"/>  
          <span xid="span6">终止</span>
        </a> 
      </li>
      <li class="x-menu-divider divider" xid="divider3"/>  
    <li class="x-menu-item" xid="item4">
   <a component="$UI/system/components/justep/button/button" class="btn btn-link" label="流程图" xid="showChart" onClick="{operation:'process.showChart'}">
    <i xid="i7"></i>
    <span xid="span7">流程图</span></a> </li></ul>
  </div>
  <span component="$UI/system/components/justep/windowReceiver/windowReceiver" xid="windowReceiver1" style="left:72px;top:4px;"></span><div component="$UI/system/components/justep/panel/panel" class="x-panel x-full oa"
    xid="panel1"> 
    <div class="x-panel-top" xid="top1">
      <div component="$UI/system/components/justep/titleBar/titleBar" class="x-titlebar"
        xid="titleBar1" title="请假申请"> 
        <div class="x-titlebar-left" xid="div1" style="width:101px;">
          <a component="$UI/system/components/justep/button/button" class="btn btn-link" xid="closeBtn" onClick="closeBtnClick" icon="icon-chevron-left">
   <i xid="i4" class="icon-chevron-left"></i>
   <span xid="span4"></span></a></div>  
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
      <div   class="media" > 
      
       <a class="pull-left content-head-pic " href="#" style="margin-right:0px;"
              xid="a2"> 
              <div class="media-object x-blob" component="$UI/system/components/justep/org/orgImage"
                xid="orgImage1" bind-ref="leaveApplyData.ref('fCreatorID')" orgKind="person"> 
                <div class="x-blob-bar" xid="div18" title="7"> 
                  <i class="x-blob-edit icon-compose" xid="i71"/>  
                  <i class="x-blob-del icon-close-round" xid="i8"/> 
                </div>  
                <img class="x-blob-img x-autofill" xid="image1"/> 
              </div> 
            </a>  
            <div class="media-body" xid="div8">  
            
            <div xid="divName" class="content-first-row"> 
                <div component="$UI/system/components/justep/output/output"
                  class="x-output title-data" xid="outputName" bind-ref="leaveApplyData.ref('fCreator')"/> 
              </div>  
              <div component="$UI/system/components/justep/output/output" class="x-output content-data content-row"
                xid="outputTime" bind-ref="leaveApplyData.ref('fShowTime')"/>  
        <div _component="$UI/system/components/justep/labelEdit/labelEdit"
          class="input-group input-group-row" xid="typeLabelInput"> 
          <span class="input-group-addon"><![CDATA[请假类型：]]></span>  
          <div component="$UI/system/components/justep/output/output" class="form-control x-output" xid="output1" bind-ref="leaveApplyData.ref('fLeaveType')"></div></div>  
        <div _component="$UI/system/components/justep/labelEdit/labelEdit"
          class="input-group input-group-row" xid="startLabelInput"> 
          <span class="input-group-addon"><![CDATA[开始时间：]]></span>  
          <div component="$UI/system/components/justep/output/output" class="form-control x-output" xid="output2" bind-ref="leaveApplyData.ref('fStartTime')"></div></div>  
        <div _component="$UI/system/components/justep/labelEdit/labelEdit"
          class="input-group input-group-row" xid="endLabelInput"> 
          <span class="input-group-addon"><![CDATA[结束时间：]]></span>  
          <div component="$UI/system/components/justep/output/output" class="form-control x-output" xid="output3" bind-ref="leaveApplyData.ref('fEndTime')"></div></div> 
        
         <div _component="$UI/system/components/justep/labelEdit/labelEdit"
          class="input-group input-group-row" xid="daysLabelInput"> 
          <span class="input-group-addon"><![CDATA[ 请假天数：]]>
  </span>  
          <div component="$UI/system/components/justep/output/output" class="form-control x-output" xid="output5" bind-ref="leaveApplyData.ref('fLeaveDayHour')"></div></div> 
           
          <div component="$UI/system/components/justep/output/output" class="x-output input-row50" xid="output6" bind-ref="leaveApplyData.ref('fContent')"></div></div>  
      </div>
    </div>  
    </div>  
  <div component="$UI/system/components/justep/process/process" xid="process"
    data="leaveApplyData" autoFilter="true"/>
</div>
