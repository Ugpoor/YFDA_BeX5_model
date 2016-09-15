<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window" component="$UI/system/components/justep/window/window">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="left:253px;top:321px;height:98px;width:109px;"> 
    <div component="$UI/system/components/justep/data/bizData" xid="detailData"
      concept="OA_Schedule" autoLoad="false" confirmDelete="true" autoNew="false"> 
      <reader xid="default1" action="/OA/personalOffice/logic/action/queryOA_ScheduleAction"/>  
      <writer xid="default2" action="/OA/personalOffice/logic/action/saveOA_ScheduleAction"/>  
      <creator xid="default3" action="/OA/personalOffice/logic/action/createOA_ScheduleAction"/>  
      <rule xid="rule1"> 
        <col name="fName" xid="ruleCol1"> 
          <readonly xid="readonly1"> 
            <expr xid="default4"><![CDATA[]]></expr> 
          </readonly> 
        </col> 
      </rule> 
    <calculateRelation relation="fShowTime" xid="calculateRelation1"></calculateRelation></div> 
  </div>  
  <span component="$UI/system/components/justep/windowDialog/windowDialog" xid="editDialog"
    src="$UI/OA/personalOffice/process/schedule/newActivity.m.w" onReceive="editDialogReceive"/>  
  <div component="$UI/system/components/justep/panel/panel" class="x-panel x-full"
    xid="panel1"> 
    <div class="x-panel-top" xid="top1" > 
      <div component="$UI/system/components/justep/titleBar/titleBar" class="x-titlebar"
        xid="titleBar2" title="日程详细"> 
        <div class="x-titlebar-left" xid="div4" style="width:57px;"> 
          <a component="$UI/system/components/justep/button/button" class="btn btn-link"
            xid="listBtn" icon="icon-chevron-left" onClick="listBtnClick"> 
            <i xid="i1" class="icon-chevron-left"/>  
            <span xid="span1"/> 
          </a>  
          <div component="$UI/system/components/justep/bar/bar" class="x-bar"
            xid="bar1" style="width:99px;"/> 
        </div>  
        <div class="x-titlebar-title" xid="div5">日程详细</div>  
        <div class="x-titlebar-right reverse" xid="div6"> 
          <a component="$UI/system/components/justep/button/button" class="btn btn-link"
            xid="editBtn" label="编辑" style="width:59px;" onClick="editBtnClick"> 
            <i xid="i2"/>  
            <span xid="span2">编辑</span> 
          </a> 
        </div> 
      </div> 
    </div>  
    <div class="x-panel-content" xid="content3"> 
      <div class="media"> 
        <a class="pull-left content-head-pic " href="#" style="margin-right:0px;"> 
          <div class="media-object x-blob" component="$UI/system/components/justep/org/orgImage"
            xid="orgImage1" bind-ref="detailData.ref('fCreatorID')" orgKind="person"> 
            <div class="x-blob-bar" xid="div18" title="7"> 
              <i class="x-blob-edit icon-compose" xid="i7"/>  
              <i class="x-blob-del icon-close-round" xid="i8"/> 
            </div>  
            <img class="x-blob-img x-autofill" xid="image1"/> 
          </div> 
        </a>  
        <div class="media-body"> 
          <div xid="div9" class="content-first-row"> 
            <div component="$UI/system/components/justep/output/output" class="x-output title-data"
              xid="output6" bind-ref="detailData.ref('fCreator')"/> 
          </div>  
          <div component="$UI/system/components/justep/output/output" class="x-output content-data input-row"
            xid="output7" bind-ref="detailData.ref('fShowTime')"/>  
          <div component="$UI/system/components/justep/output/output" class="x-output form-control input-row40"
            xid="output3" bind-ref="detailData.ref('fName')"/>  
          <div xid="div3" class="input-group input-group-row"> 
            <span xid="span4" class="input-group-addon"><![CDATA[时间:]]></span>  
            <div xid="div33" class="form-control" bind-html="getTime($model.detailData)"/> 
          </div>  
          <div xid="div2" class="input-group input-group-row"> 
            <span xid="span3" class="input-group-addon"><![CDATA[重复:]]></span>  
            <div xid="div7" dir="ltr" bind-html="getRepeat($model.detailData)"
              class="form-control"/> 
          </div>  
          <div xid="div25" class="input-group input-group-row"> 
            <span xid="span75" class="input-group-addon"><![CDATA[地点:]]></span>  
            <div component="$UI/system/components/justep/output/output" xid="output2"
              bind-ref="detailData.ref('fPlace')" class="form-control"/> 
          </div>  
            <div component="$UI/system/components/justep/output/output" xid="output4"
              bind-ref="detailData.ref('fContent')" class="x-output input-row50"/> 
          <div xid="div1"> 
            <div component="$UI/system/components/justep/attachment/attachment" access="d" xid="attachment1" bind-ref="detailData.ref('fAttachment')">
   <div class="x-attachment" xid="div8" data-bind="visible: $attachmentItems.get().length &gt; 0">
    <div class="x-attachment-content x-card-border" xid="div10">
     <div class="x-doc-process" xid="div11">
      <div class="progress-bar x-doc-process-bar" role="progressbar" style="width:0%;" xid="div12"></div></div> 
     <div data-bind="foreach:$attachmentItems" xid="div13">
      <div class="x-attachment-cell" xid="div14">
       <div class="x-attachment-item x-item-other" data-bind="click:$model.previewOrRemoveItem.bind($model),style:{opacity: $model.$access.get() % 4 &gt;= 2 || $model.$state.get() == 'remove' ? '1.0' : '0.5',backgroundImage:($model.previewPicture.bind($model,$object))()}" xid="div15">
        <a data-bind="visible:$model.$state.get() == 'remove'" class="x-remove-barget" xid="a1"></a></div> </div> </div> 
     <div class="x-attachment-cell" data-bind="visible:$state.get() == 'upload' &amp;&amp; ($limit.get() == '-1' || $limit.get() &gt; $attachmentItems.get().length)" xid="div16">
      <div class="x-attachment-item x-item-upload" data-bind="visible:$state.get() == 'upload' &amp;&amp; $access.get() % 512 &gt;= 256" xid="div17"></div></div> 
     <div class="x-attachment-cell" data-bind="visible:$state.get() == 'upload' &amp;&amp; $attachmentItems.get().length &gt; 0" xid="div19">
      <div class="x-attachment-item x-item-remove" data-bind="click:changeState.bind($object,'remove'),visible:$access.get() % 2048 &gt;= 1024" xid="div20"></div></div> 
     <div style="clear:both;" xid="div21"></div></div> </div> </div></div>  
          <div class="x-ro x-ro-border" component="$UI/system/components/justep/social/relativeOrg/relativeOrg"
            xid="noAffirmOrg" groupName="未确认" groupID="E" data="detailData" bind-nameRef="detailData.ref('fName')"
            filter="$row.val('sESField01')!='O' &amp;&amp; $row.val('sESField01')!='C'" statusEnabled="false"
            readonly="js:true"> 
            <div component="$UI/system/components/justep/data/bizData" concept="SA_Social"
              xid="bizData1"/> 
          </div>  
          <div class="x-ro x-ro-border" component="$UI/system/components/justep/social/relativeOrg/relativeOrg"
            xid="affirmOrg" groupName="已确认" groupID="E" data="detailData" bind-nameRef="detailData.ref('fName')"
            filter="$row.val('sESField01')=='O'" statusEnabled="false" socialData="bizData1"
            readonly="js:true"> 
            <div component="$UI/system/components/justep/data/bizData" concept="SA_Social"
              xid="bizData2"/> 
          </div>  
          <div class="x-ro x-ro-border" component="$UI/system/components/justep/social/relativeOrg/relativeOrg"
            xid="cancelOrg" groupName="已拒绝" groupID="E" data="detailData" bind-nameRef="detailData.ref('fName')"
            filter="$row.val('sESField01')=='C'" statusEnabled="false" socialData="bizData1"
            readonly="js:true"> 
            <div component="$UI/system/components/justep/data/bizData" concept="SA_Social"
              xid="bizData3"/> 
          </div> 
        </div> 
      </div> 
    </div> 
  </div>  
  <span component="$UI/system/components/justep/windowReceiver/windowReceiver"
    xid="windowReceiver" onReceive="windowReceiverReceive" style="top:419px;left:-2px;"/> 
</div>
