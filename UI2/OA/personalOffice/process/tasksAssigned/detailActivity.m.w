<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window" component="$UI/system/components/justep/window/window">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="left:253px;top:321px;height:98px;width:109px;"> 
    <div component="$UI/system/components/justep/data/bizData" xid="detailData"
      concept="OA_TasksAssigned" autoLoad="false" onAfterRefresh="detailDataAfterRefresh"
      confirmDelete="true" onBeforeSave="detailDataBeforeSave"> 
      <reader xid="default1" action="/OA/personalOffice/logic/action/queryOA_TasksAssignedAllAction"/>  
      <writer xid="default2" action="/OA/personalOffice/logic/action/saveOA_TasksAssignedAction"/>  
      <creator xid="default3" action="/OA/personalOffice/logic/action/createOA_TasksAssignedAction"/>  
      <calculateRelation relation="fMemo" xid="calculateRelation1"/>
    <calculateRelation relation="fShowTime" xid="calculateRelation2"></calculateRelation>
  <rule xid="rule2">
   <col name="fMemo" xid="ruleCol2">
    <calculate xid="calculate1">
     <expr xid="default8">js:$model.showMemo($row)</expr></calculate> </col> </rule></div>  
    <div component="$UI/system/components/justep/data/bizData" xid="upToDateData"
      concept="OA_TasksAssignedDate" orderBy="fOperatorTime asc" autoLoad="true" autoNew="false"
      confirmDelete="false" onBeforeSave="upToDateDataBeforeSave" onSaveCommit="upToDateDataSaveCommit" limit="-1"> 
      <reader xid="default4" action="/OA/personalOffice/logic/action/queryOA_TasksAssignedDateAction"/>  
      <writer xid="default5" action="/OA/personalOffice/logic/action/saveOA_TasksAssignedDateAction"/>  
      <creator xid="default6" action="/OA/personalOffice/logic/action/createOA_TasksAssignedDateAction"/>  
      <master xid="default7" data="detailData" relation="fTaskID"/>  
      <calculateRelation relation="fMemo" xid="calculateRelation3"></calculateRelation>
  <rule xid="rule5">
   <col name="fMemo" xid="ruleCol7">
    <calculate xid="calculate5">
     <expr xid="default21"><![CDATA[js: $row.val('fUpToDate')?($row.val('fOperator') + '：修改截止日期到' +  justep.Date.toString($row.val('fUpToDate'),'yyyy-MM-dd') + ($row.val('fReason')? '：' + $row.val('fReason'):'') + '（' + justep.Date.toString($row.val('fOperatorTime'),'hh:mm') + ')'):'']]></expr></calculate> </col> </rule></div>  
    <div component="$UI/system/components/justep/data/data" xid="commoDdata"
      idColumn="id" autoNew="true"> 
      <column label="人员类型" name="openType" type="String" xid="default15"/>  
      <column label="col1" name="id" type="String" xid="default16"/>  
      <column label="工作   截止日" name="lastDate" type="String" xid="default17"/>  
      <column label="操作类型" name="doType" type="String" xid="default18"/>  
      <column label="原来关注类型" name="oldType" type="Integer" xid="default19"/> 
    </div> 
  </div>  
  <div component="$UI/system/components/justep/contents/contents" class="x-contents x-full"
    active="0" xid="contents" wrap="true" swipe="false" slidable="true"> 
    <div class="x-contents-content" xid="detail"> 
      <div component="$UI/system/components/justep/panel/panel" class="x-panel x-full"
        xid="panel1"> 
        <div class="x-panel-top" xid="top1"> 
          <div component="$UI/system/components/justep/titleBar/titleBar" class="x-titlebar"
            xid="titleBar2" title="工作详细"> 
            <div class="x-titlebar-left" xid="div4" style="width:57px;"> 
              <a component="$UI/system/components/justep/button/button" class="btn btn-link"
                xid="listBtn" icon="icon-chevron-left" onClick="listBtnClick"> 
                <i xid="i1" class="icon-chevron-left"/>  
                <span xid="span1"/> 
              </a>  
              <div component="$UI/system/components/justep/bar/bar" class="x-bar"
                xid="bar1" style="width:99px;"/> 
            </div>  
            <div class="x-titlebar-title" xid="div5">工作详细</div>  
            <div class="x-titlebar-right reverse" xid="div6"> 
              <a component="$UI/system/components/justep/button/button" class="btn btn-link"
                xid="closeTaskBtn" label="关闭" onClick="closeTaskBtnClick" style="width:59px;"
                bind-visible="commoDdata.val('openType')=='E' &amp;&amp; detailData.val('fStatus')=='未关闭'"> 
                <i xid="i2"/>  
                <span xid="span2">关闭</span> 
              </a> 
            </div> 
          </div> 
        </div>  
        <div class="x-panel-content" xid="content3"> 
          <div class="media"> 
            <a class="pull-left content-head-pic " href="#"> 
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
              <div class="content-first-row"> 
                <div component="$UI/system/components/justep/output/output"
                  class="x-output title-data" xid="output1" bind-ref="detailData.ref('fCreator')"/>  
                <span component="$UI/system/components/justep/social/focus/focus"
                  class="star-data" xid="focus1" data="detailData" bind-ref="detailData.ref('sActive')"
                  bind-nameRef="detailData.ref('fName')" bind-visible="commoDdata.val('openType')!='C' &amp;&amp; detailData.val('fStatus')=='未关闭'"/> 
              </div>  
              <div component="$UI/system/components/justep/output/output" class="x-output content-data content-row"
                xid="output2" bind-ref="detailData.ref('fShowTime')"/>  
              <div component="$UI/system/components/justep/output/output"
                class="x-output input-row50" xid="output4" bind-ref="detailData.ref('fContent')"/>  
                <div>
              <div component="$UI/system/components/justep/attachment/attachment" access="d" xid="attachment1" bind-ref="detailData.ref('fAttachment')">
   <div class="x-attachment" xid="div1" data-bind="visible: $attachmentItems.get().length &gt; 0">
    <div class="x-attachment-content x-card-border" xid="div2">
     <div class="x-doc-process" xid="div3">
      <div class="progress-bar x-doc-process-bar" role="progressbar" style="width:0%;" xid="div8"></div></div> 
     <div data-bind="foreach:$attachmentItems" xid="div10">
      <div class="x-attachment-cell" xid="div21">
       <div class="x-attachment-item x-item-other" data-bind="click:$model.previewOrRemoveItem.bind($model),style:{opacity: $model.$access.get() % 4 &gt;= 2 || $model.$state.get() == 'remove' ? '1.0' : '0.5',backgroundImage:($model.previewPicture.bind($model,$object))()}" xid="div22">
        <a data-bind="visible:$model.$state.get() == 'remove'" class="x-remove-barget" xid="a1"></a></div> </div> </div> 
     <div class="x-attachment-cell" data-bind="visible:$state.get() == 'upload' &amp;&amp; ($limit.get() == '-1' || $limit.get() &gt; $attachmentItems.get().length)" xid="div23">
      <div class="x-attachment-item x-item-upload" data-bind="visible:$state.get() == 'upload' &amp;&amp; $access.get() % 512 &gt;= 256" xid="div24"></div></div> 
     <div class="x-attachment-cell" data-bind="visible:$state.get() == 'upload' &amp;&amp; $attachmentItems.get().length &gt; 0" xid="div25">
      <div class="x-attachment-item x-item-remove" data-bind="click:changeState.bind($object,'remove'),visible:$access.get() % 2048 &gt;= 1024" xid="div26"></div></div> 
     <div style="clear:both;" xid="div27"></div></div> </div> </div></div>
              <div id="upToDateDiv" class="input-row"/>  
          <div>
          <div component="$UI/system/components/justep/list/list" class="x-list" xid="list1" data="upToDateData" limit="200" filter="js:$row.val('fDelay')=='1' ">
   <ul class="x-list-template" xid="listTemplateUl1">
    <li xid="li1"><div component="$UI/system/components/justep/row/row" class="x-row" xid="row1">
   <div class="x-col x-col-fixed" xid="col3" style="width:auto;">
    <span component="$UI/system/components/justep/button/checkbox" class="x-checkbox" xid="checkbox2" disabled="true" checked="true"></span></div> 
   <div class="x-col" xid="col5">
    <div component="$UI/system/components/justep/output/output" class="x-output" xid="output3" bind-ref="ref('fMemo')"></div></div> </div></li></ul> </div></div>
              
              <div xid="div9" bind-visible="$model.detailData.getValue('fStatus') == '已关闭'"> 
                <div component="$UI/system/components/justep/row/row" 
                  xid="row6" class="x-row"> 
                  <div class="x-col x-col-fixed" xid="col1" style="width:auto">
                    <span component="$UI/system/components/justep/button/checkbox"
                      class="x-checkbox" xid="checkbox1" checked="true" disabled="true"/>
                  </div>  
                  <div class="x-col" xid="col2">
                    <div component="$UI/system/components/justep/output/output"
                      class="x-output" xid="output31" bind-ref="detailData.ref('fMemo')"/>
                  </div>
                </div> 
              </div>  
              <div class="x-ros x-ro-border" component="$UI/system/components/justep/social/relativeOrg/relativeOrgs"
                xid="relativeOrgs" bind-ref="detailData.ref('OA_TasksAssigned')" data="detailData"
                bind-nameRef="detailData.ref('fName')"> 
                <div component="$UI/system/components/justep/data/bizData"
                  concept="SA_Social" xid="bizcommoDdata"/>  
                <div class="x-ros-item" groupName="负责人" groupID="A" limit="20"
                  filter="" multiSelection="false" statusEnabled="true" readonly="js:true"
                  xid="item1"/>  
                <div class="x-ros-item" groupName="参与人" groupID="P" limit="20"
                  filter="" multiSelection="true" statusEnabled="true" readonly="js:commoDdata.val('openType')!='E' || detailData.val('fStatus')=='已关闭'"
                  xid="item2"/> 
              </div> 
            </div> 
          </div> 
        </div> 
      </div> 
    </div>  
    <div class="x-contents-content" xid="close"> 
      <div component="$UI/system/components/justep/panel/panel" class="x-panel x-full"
        xid="panel2"> 
        <div class="x-panel-top" xid="top2"> 
          <div component="$UI/system/components/justep/titleBar/titleBar" class="x-titlebar"
            xid="titleBar1" title="关闭"> 
            <div class="x-titlebar-left" xid="div11"> 
              <a component="$UI/system/components/justep/button/button" class="btn btn-link"
                xid="closeBackBtn" icon="icon-chevron-left" onClick="closeBackBtnClick"> 
                <i xid="i3" class="icon-chevron-left"/>  
                <span xid="span3"/> 
              </a> 
            </div>  
            <div class="x-titlebar-title" xid="div12">关闭</div>  
            <div class="x-titlebar-right reverse" xid="div13"> 
              <a component="$UI/system/components/justep/button/button" class="btn btn-link"
                xid="closeSaveBtn" icon="icon-checkmark-round" onClick="closeSaveBtnClick"> 
                <i xid="i4" class="icon-checkmark-round"/>  
                <span xid="span4"/> 
              </a> 
            </div> 
          </div> 
        </div>  
        <div class="x-panel-content" xid="content4"> 
          <div xid="div19" style="height:162px;"
            class="input-row "> 
            <textarea component="$UI/system/components/justep/textarea/textarea"
              class="form-control" xid="textarea1" style="height:100%;width:100%;"
              bind-ref="detailData.ref('fCloserMemo')" placeHolder="请输入文字内容"/> 
          </div> 
        </div> 
      </div> 
    </div>  
    <div class="x-contents-content" xid="editTime"> 
      <div component="$UI/system/components/justep/panel/panel" class="x-panel x-full"
        xid="panel3"> 
        <div class="x-panel-top" xid="top3"> 
          <div component="$UI/system/components/justep/titleBar/titleBar" class="x-titlebar"
            xid="titleBar3" title="修改截止日期"> 
            <div class="x-titlebar-left" xid="div7"> 
              <a component="$UI/system/components/justep/button/button" class="btn btn-link"
                xid="dateBackBtn" icon="icon-chevron-left" onClick="dateBackBtnClick"> 
                <i xid="i5" class="icon-chevron-left"/>  
                <span xid="span5"/> 
              </a> 
            </div>  
            <div class="x-titlebar-title" xid="div14">修改截止日期</div>  
            <div class="x-titlebar-right reverse" xid="div15"> 
              <a component="$UI/system/components/justep/button/button" class="btn btn-link"
                xid="dateSaveBtn" icon="icon-checkmark-round" onClick="dateSaveBtnClick"> 
                <i xid="i6" class="icon-checkmark-round"/>  
                <span xid="span6"/> 
              </a> 
            </div> 
          </div> 
        </div>  
        <div class="x-panel-content" xid="content2"> 
          <div xid="div16"> 
            <textarea component="$UI/system/components/justep/textarea/textarea"
              class="form-control input-row" xid="textarea2" placeHolder="请输入文字内容" bind-ref="upToDateData.ref('fReason')"
              style="height:101px;"/>  
            <div xid="div17" class="title-row " bind-html="'工作截止日：'+$model.commoDdata.val('lastDate')"/>  
            <div xid="div20" class="input-group "> 
              <span xid="span7" class="input-group-addon"><![CDATA[延期到：]]></span>  
              <input component="$UI/system/components/justep/input/input" class="form-control"
                xid="iptNewDate" bind-ref="upToDateData.ref('fUpToDate')" style="text-align:right;"/> 
            </div> 
          </div> 
        </div> 
      </div> 
    </div> 
  </div>  
  <!--   <span component="$UI/system/components/justep/windowDialog/windowDialog" xid="windowDialog1"
    src="closeMainActivity.m.w" onReceive="windowDialog1Receive" style="left:1px;top:351px;"/>-->  
  <span component="$UI/system/components/justep/windowReceiver/windowReceiver"
    xid="windowReceiver" onReceive="windowReceiverReceive" style="top:419px;left:-2px;"/>  
  <span component="$UI/system/components/justep/messageDialog/messageDialog"
    xid="dateMsgDlg" title="提示" message="延期日期必须大于截止日" style="left:3px;top:478px;"/> 
</div>
