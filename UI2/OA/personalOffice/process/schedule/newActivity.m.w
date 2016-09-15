<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window" component="$UI/system/components/justep/window/window">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="width:102px;height:auto;left:261px;top:316px;"> 
    <div component="$UI/system/components/justep/data/bizData" xid="scheduleData"
      concept="OA_Schedule" autoLoad="false" limit="-1" confirmDelete="false" onBeforeSave="scheduleDataBeforeSave"> 
      <reader xid="default1" action="/OA/personalOffice/logic/action/queryOA_ScheduleAction"/>  
      <writer xid="default2" action="/OA/personalOffice/logic/action/saveOA_ScheduleAction"/>  
      <creator xid="default3" action="/OA/personalOffice/logic/action/createOA_ScheduleAction"/>  
      <rule xid="rule2">
   <col name="fName" xid="ruleCol4">
    <required xid="required4">
     <expr xid="default13">js:true</expr>
     <message xid="default14">请输入主题</message></required> </col> 
   <col name="fStartTime" xid="ruleCol5">
    <required xid="required5">
     <expr xid="default15">js:true</expr>
     <message xid="default16">请选择开始时间</message></required> 
    <constraint xid="constraint1">
     <expr xid="default17"><![CDATA[js: $row.val("fStartTime") <  $row.val("fEndTime")]]></expr>
     <message xid="default18">开始时间不能大于结束时间</message></constraint> </col> 
   <col name="fEndTime" xid="ruleCol6">
    <required xid="required6">
     <expr xid="default19">js:true</expr>
     <message xid="default20">请选择结束时间</message></required> </col> </rule></div>  
    <div component="$UI/system/components/justep/data/data" xid="weekData"
      idColumn="day" autoNew="false" autoLoad="true"> 
      <column label="day" name="day" type="Integer" xid="default6"/>  
      <column label="xing" name="xingqi" type="String" xid="default7"/>  
      <data xid="default9">[{"day":2,"xingqi":"星期一"},{"day":3,"xingqi":"星期二"},{"day":4,"xingqi":"星期三"},{"day":5,"xingqi":"星期四"},{"day":6,"xingqi":"星期五"},{"day":7,"xingqi":"星期六"},{"day":1,"xingqi":"星期日"}]</data> 
    </div> 
  </div>  
  <!--   <span component="$UI/system/components/justep/org/orgDialog" xid="orgSingleDialog"
    onReceive="orgSingleDialogReceive"/>  
  <span component="$UI/system/components/justep/org/orgDialog" xid="orgMutilDialog"
    multiSelection="true" onReceive="orgMutilDialogReceive"/>   -->  
  <span component="$UI/system/components/justep/messageDialog/messageDialog"
    xid="closeMsgDlg" type="YesNo" onClose="closeMsgDlgClose" title="提示" message="是否取消当前操作？"/>  
  <div component="$UI/system/components/justep/contents/contents" class="x-contents x-full"
    active="0" xid="contents1" wrap="false" swipe="false"> 
    <div class="x-contents-content" xid="new"> 
      <div component="$UI/system/components/justep/panel/panel" class="x-panel x-full"
        xid="panel3"> 
        <div class="x-panel-top" xid="top3" > 
          <div component="$UI/system/components/justep/titleBar/titleBar" class="x-titlebar"
            xid="titleBar" title="日程编辑"> 
            <div class="x-titlebar-left" xid="div27"> 
              <a component="$UI/system/components/justep/button/button" class="btn btn-link"
                xid="listBtn" icon="icon-chevron-left" onClick="listBtnClick"> 
                <i xid="i1" class="icon-chevron-left"/>  
                <span xid="span2"/> 
              </a> 
            </div>  
            <div class="x-titlebar-title" xid="div28">日程编辑</div>  
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
          <div xid="div25" class="input-group input-group-row"> 
            <span xid="span75" class="input-group-addon">主题</span>  
            <input component="$UI/system/components/justep/input/input" class="form-control"
              xid="iptTheme" bind-ref="scheduleData.ref('fName')" style="text-align:right;" placeHolder="请输入主题"/> 
          </div>  
          <div xid="div26" class="input-group input-group-row"> 
            <span xid="span76" class="input-group-addon">地点</span>  
            <input component="$UI/system/components/justep/input/input" class="form-control"
              xid="iptPlace" bind-ref="scheduleData.ref('fPlace')" style="text-align:right;" placeHolder="请输入地点"/> 
          </div>  
          <div xid="div20" class="input-group input-group-row"> 
            <span xid="span7" class="input-group-addon">开始时间</span>  
            <input component="$UI/system/components/justep/input/input" class="form-control"
              xid="iptStartTime" bind-ref="scheduleData.ref('fStartTime')" style="text-align:right;"
              format="yyyy-MM-dd hh:mm" placeHolder="请选择开始时间"/> 
          </div>  
          <div xid="div21" class="input-group input-group-row"> 
            <span xid="span71" class="input-group-addon">结束时间</span>  
            <input component="$UI/system/components/justep/input/input" class="form-control"
              xid="iptEndTime" bind-ref="scheduleData.ref('fEndTime')" style="text-align:right;"
              format="yyyy-MM-dd hh:mm" placeHolder="请选择结束时间"/> 
          </div>  
          <div xid="div22" class="input-group input-group-row"> 
            <span xid="span72" class="input-group-addon">重复</span>  
            <div xid="iptfRepeat" class="form-control" bind-click="iptfRepeatClick"
              bind-html="getRepeatType($model.scheduleData)" style="text-align:right;"/> 
          </div>  
          <div xid="div23" class="input-group input-group-row"> 
            <span xid="span73" class="input-group-addon">重复频率</span>  
            <div xid="iptfRate" class="form-control" bind-click="iptfRateClick"
              bind-html="getRepeat($model.scheduleData)" style="text-align:right;"/> 
          </div>  
          <div xid="div24" class="input-group input-group-row"> 
            <span xid="span74" class="input-group-addon">结束重复</span>  
            <div xid="iptStopType" class="form-control" bind-click="iptStopTypeClick"
              bind-html="getStop($model.scheduleData)" style="text-align:right;"/> 
          </div>  
          <textarea component="$UI/system/components/justep/textarea/textarea" placeHolder="请输入摘要"
            class="form-control input-row" xid="textarea1" bind-ref="scheduleData.ref('fContent')"
            style="height:86px;"/>  
            <div>
          <div component="$UI/system/components/justep/attachment/attachment" access="duud" xid="attachment1" bind-ref="scheduleData.ref('fAttachment')">
   <div class="x-attachment" xid="div11">
    <div class="x-attachment-content x-card-border" xid="div12">
     <div class="x-doc-process" xid="div13">
      <div class="progress-bar x-doc-process-bar" role="progressbar" style="width:0%;" xid="div14"></div></div> 
     <div data-bind="foreach:$attachmentItems" xid="div15">
      <div class="x-attachment-cell" xid="div16">
       <div class="x-attachment-item x-item-other" data-bind="click:$model.previewOrRemoveItem.bind($model),style:{opacity: $model.$access.get() % 4 &gt;= 2 || $model.$state.get() == 'remove' ? '1.0' : '0.5',backgroundImage:($model.previewPicture.bind($model,$object))()}" xid="div17">
        <a data-bind="visible:$model.$state.get() == 'remove'" class="x-remove-barget" xid="a1"></a></div> </div> </div> 
     <div class="x-attachment-cell" data-bind="visible:$state.get() == 'upload' &amp;&amp; ($limit.get() == '-1' || $limit.get() &gt; $attachmentItems.get().length)" xid="div18">
      <div class="x-attachment-item x-item-upload" data-bind="visible:$state.get() == 'upload' &amp;&amp; $access.get() % 512 &gt;= 256" xid="div19"></div></div> 
     <div class="x-attachment-cell" data-bind="visible:$state.get() == 'upload' &amp;&amp; $attachmentItems.get().length &gt; 0" xid="div30">
      <div class="x-attachment-item x-item-remove" data-bind="click:changeState.bind($object,'remove'),visible:$access.get() % 2048 &gt;= 1024" xid="div31"></div></div> 
     <div style="clear:both;" xid="div32"></div></div> </div> </div></div>
          <div xid="div52" class="row-line"> 
            <div class="x-ro" component="$UI/system/components/justep/social/relativeOrg/relativeOrg"
              xid="selectCreator" data="scheduleData" groupName="与会人" groupID="E"
              multiSelection="true" statusEnabled="false" bind-nameRef="scheduleData.ref('fName')"> 
              <div component="$UI/system/components/justep/data/bizData" concept="SA_Social"
                xid="bizData3"/>  
            </div> 
          </div>  
          <div class="input-group input-group-row" xid="labelToggle1"> 
            <span xid="span731" class="input-group-addon">私人日程</span>  
            <div component="$UI/system/components/justep/button/toggle" class="x-toggle x-edit pull-right"
              xid="toggle2" bind-ref="scheduleData.ref('fOwn')" ON="是" OFF="否" checkedValue="1"/> 
          </div>  
          <!-- <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit" xid="labelToggle2">
      <label class="x-label" xid="label2">动态分享</label>
      <span component="$UI/system/components/justep/button/toggle" class="x-toggle x-edit" xid="toggle3" bind-ref="scheduleData.ref('fShare')"></span></div>
       -->  

        </div> 
      </div> 
    </div>  
    <div class="x-contents-content" xid="repeat" style="color:#808080;"> 
      <div component="$UI/system/components/justep/panel/panel" class="x-panel x-full"
        xid="panel1"> 
        <div class="x-panel-top" xid="top1" > 
          <div component="$UI/system/components/justep/titleBar/titleBar" class="x-titlebar"
            xid="titleBar1" title="重复方式"> 
            <div class="x-titlebar-left" xid="div1"> 
              <a component="$UI/system/components/justep/button/button" class="btn btn-link"
                xid="repeatBacBtn" onClick="repeatBacBtnClick" icon="icon-chevron-left"> 
                <i xid="i3" class="icon-chevron-left"/>  
                <span xid="span1"/> 
              </a> 
            </div>  
            <div class="x-titlebar-title" xid="div2">重复方式</div>  
            <div class="x-titlebar-right reverse" xid="div3"/> 
          </div> 
        </div>  
        <div class="x-panel-content" xid="content6"> 
          <div component="$UI/system/components/justep/row/row" class="x-row input-row50"
            xid="noneRow" bind-click="noneRowClick"> 
            <div class="x-col" xid="col1"> 
              <span xid="span3"><![CDATA[永不]]></span> 
            </div>  
            <div class="x-col" xid="col2" style="text-align:right;color:#2fa4e7"> 
              <i xid="i4" class="icon-checkmark-round" bind-visible="$model.scheduleData.getValue('fRepeat') =='none'"/> 
            </div> 
          </div>  
          <div component="$UI/system/components/justep/row/row" class="x-row input-row50"
            xid="dayRow" bind-click="dayRowClick"> 
            <div class="x-col" xid="col4"> 
              <span xid="span5"><![CDATA[每天]]></span> 
            </div>  
            <div class="x-col" xid="col6" style="text-align:right;color:#2fa4e7"> 
              <i xid="i6" class="icon-checkmark-round" bind-visible="$model.scheduleData.getValue('fRepeat')=='day'"/> 
            </div> 
          </div>  
          <div component="$UI/system/components/justep/row/row" class="x-row input-row50"
            xid="weekRow" bind-click="weekRowClick"> 
            <div class="x-col" xid="col7"> 
              <span xid="span9"><![CDATA[每周]]></span> 
            </div>  
            <div class="x-col" xid="col9" style="text-align:right;color:#2fa4e7"> 
              <i xid="i13" class="icon-checkmark-round" bind-visible="$model.scheduleData.getValue('fRepeat')=='week'"/> 
            </div> 
          </div>  
          <div component="$UI/system/components/justep/row/row" class="x-row input-row50"
            xid="monthRow" bind-click="monthRowClick"> 
            <div class="x-col" xid="col10"> 
              <span xid="span10"><![CDATA[每月]]></span> 
            </div>  
            <div class="x-col" xid="col12" style="text-align:right;color:#2fa4e7"> 
              <i xid="i15" class="icon-checkmark-round" bind-visible="$model.scheduleData.getValue('fRepeat')=='month'"/> 
            </div> 
          </div>  
          <div component="$UI/system/components/justep/row/row" class="x-row input-row50"
            xid="yearRow" bind-click="yearRowClick"> 
            <div class="x-col" xid="col16"> 
              <span xid="span11"><![CDATA[每年]]></span> 
            </div>  
            <div class="x-col" xid="col18" style="text-align:right;color:#2fa4e7"> 
              <i xid="i14" class="icon-checkmark-round" bind-visible="$model.scheduleData.getValue('fRepeat')=='year'"/> 
            </div> 
          </div> 
        </div> 
      </div> 
    </div>  
    <div class="x-contents-content" xid="rate"> 
      <div component="$UI/system/components/justep/panel/panel" class="x-panel x-full"
        xid="panel2"> 
        <div class="x-panel-top" xid="top2" > 
          <div component="$UI/system/components/justep/titleBar/titleBar" class="x-titlebar"
            xid="titleBar3" title="重复频率"> 
            <div class="x-titlebar-left" xid="div4"> 
              <a component="$UI/system/components/justep/button/button" class="btn btn-link"
                xid="rateBacBtn" onClick="ratebacBtnClick" icon="icon-chevron-left"> 
                <i xid="i5" class="icon-chevron-left"/>  
                <span xid="span4"/> 
              </a> 
            </div>  
            <div class="x-titlebar-title" xid="div5">重复频率</div>  
            <div class="x-titlebar-right reverse" xid="div6"/> 
          </div> 
        </div>  
        <div class="x-panel-content" xid="content7"> 
          <input component="$UI/system/components/justep/input/input" xid="input1"
            placeHolder="输入重复频率" bind-ref="scheduleData.ref('fRepeatFrequency')" style="width:100%;height:40px;"
            class="input-row form-control "/>  
          <div xid="div10" style="height:20px;" class="title-row"/>  
          <div component="$UI/system/components/justep/controlGroup/controlGroup"
            class="x-control-group x-content-center" title="title" xid="controlGroup4"
            style="height:270px;" bind-visible="$model.scheduleData.getValue('fRepeat') =='week'"> 
            <div component="$UI/system/components/justep/labelEdit/labelEdit"
              class="x-label-edit" xid="labelCheckboxGroup2"> 
              <label class="x-label" xid="label4"/>  
              <span component="$UI/system/components/justep/select/checkboxGroup"
                class="x-checkbox-group x-checkbox-group-vertical x-checkboxs x-edit"
                xid="checkboxGroup2" bind-itemset="weekData" bind-itemsetLabel="ref('xingqi')"
                bind-itemsetValue="ref('day')" bind-ref="scheduleData.ref('fWeekRepeat')"/> 
            </div> 
          </div> 
        </div> 
      </div> 
    </div>  
    <div class="x-contents-content" xid="stopType"> 
      <div component="$UI/system/components/justep/panel/panel" class="x-panel x-full"
        xid="panel4"> 
        <div class="x-panel-top" xid="top4" > 
          <div component="$UI/system/components/justep/titleBar/titleBar" class="x-titlebar"
            xid="titleBar4" title="重复结束条件"> 
            <div class="x-titlebar-left" xid="div7"> 
              <a component="$UI/system/components/justep/button/button" class="btn btn-link"
                xid="stopBacBtn" onClick="stopBacBtnClick" icon="icon-chevron-left"> 
                <i xid="i7" class="icon-chevron-left"/>  
                <span xid="span8"/> 
              </a> 
            </div>  
            <div class="x-titlebar-title" xid="div8">重复结束条件</div>  
            <div class="x-titlebar-right reverse" xid="div9"/> 
          </div> 
        </div>  
        <div class="x-panel-content" xid="content8"> 
          <div xid="divtype25" class="input-group  input-group-row" style="margin-top:5px;"> 
            <span xid="spantype75" class="input-group-addon" style="background-color:white;border-style:none none none none;"><![CDATA[按截止日期]]></span>  
            <input component="$UI/system/components/justep/input/input" class="form-control"
              xid="typetime" bind-ref="scheduleData.ref('fUpToDate')" style="text-align:right;"/> 
          </div>  
          <div xid="divtype26" class="input-group  input-group-row" style="margin-top:5px;"> 
            <span xid="spantype76" class="input-group-addon" style="background-color:white;border-style:none none none none;"><![CDATA[按重复次数]]></span>  
            <input component="$UI/system/components/justep/input/input" class="form-control"
              xid="typecount" bind-ref="scheduleData.ref('fRepeatCount')" style="text-align:right;"/> 
          </div> 
        </div> 
      </div> 
    </div> 
  </div>  
  <span component="$UI/system/components/justep/windowReceiver/windowReceiver"
    xid="windowReceiver" style="left:3px;top:356px;" onReceive="windowReceiverReceive"/> 
</div>
