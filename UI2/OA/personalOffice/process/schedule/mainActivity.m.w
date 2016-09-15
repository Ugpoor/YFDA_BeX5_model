<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window oa" component="$UI/system/components/justep/window/window">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="width:102px;height:auto;left:319px;top:206px;"
    onLoad="modelLoad"> 
    <div component="$UI/system/components/justep/data/bizData" xid="scheduleData"
      concept="OA_Schedule" autoLoad="false" limit="-1" confirmDelete="false" onRefreshCreateParam="scheduleDataRefreshCreateParam"
      confirmRefresh="false"> 
      <reader xid="default1" action="/OA/personalOffice/logic/action/queryOA_ScheduleMonthAction"/>  
      <writer xid="default2" action="/OA/personalOffice/logic/action/saveOA_ScheduleAction"/>  
      <creator xid="default3" action="/OA/personalOffice/logic/action/createOA_ScheduleAction"/> 
    </div>  
    <div component="$UI/system/components/justep/data/data" xid="numData" idColumn="todNum"
      autoNew="true"> 
      <column label="col0" name="todNum" type="String" xid="default4"/>  
      <column label="col1" name="tomNum" type="String" xid="default5"/>  
      <column label="col2" name="weeNum" type="String" xid="default6"/>  
      <column label="col3" name="aftNum" type="String" xid="default7"/>  
      <column label="col4" name="finNum" type="String" xid="default8"/> 
    </div>  
    <div component="$UI/system/components/justep/data/bizData" xid="confirmData"
      concept="OA_Schedule" limit="5" confirmRefresh="false"> 
      <reader xid="default9" action="/OA/personalOffice/logic/action/queryOA_ScheduleNotSureAction"/>  
      <writer xid="default10" action="/OA/personalOffice/logic/action/saveOA_ScheduleAction"/>  
      <creator xid="default11" action="/OA/personalOffice/logic/action/createOA_ScheduleAction"/> 
    </div>  
    <div component="$UI/system/components/justep/data/data" xid="calData" idColumn="monthFirstDay"
      autoNew="true"> 
      <column label="col0" name="monthFirstDay" type="DateTime" xid="default15"></column>
  <column label="col1" name="month" type="String" xid="default16"></column>
  <column label="col2" name="monthParam" type="String" xid="default17"></column>
  <column label="col3" name="cMonthFirstDay" type="DateTime" xid="default18"></column></div>  
    <div component="$UI/system/components/justep/data/bizData" xid="colleagueData"
      concept="OA_Schedule" onRefreshCreateParam="colleagueDataRefreshCreateParam" confirmDelete="false" confirmRefresh="false" limit="-1">
      <reader xid="default12" action="/OA/personalOffice/logic/action/queryOA_ScheduleMonthAction"/>  
      <writer xid="default13" action="/OA/personalOffice/logic/action/saveOA_ScheduleAction"/>  
      <creator xid="default14" action="/OA/personalOffice/logic/action/createOA_ScheduleAction"/>
    </div>
  </div>  
  <span component="$UI/system/components/justep/windowDialog/windowDialog" xid="detailDialog"
    onReceive="detailDialogReceive" src="$UI/OA/personalOffice/process/schedule/detailActivity.m.w"
    style="left:31px;top:179px;"/>  
  <span component="$UI/system/components/justep/windowDialog/windowDialog" xid="newDialog"
    onReceive="newDialogReceive" src="$UI/OA/personalOffice/process/schedule/newActivity.m.w"
    style="left:105px;top:208px;"/>  
  <span component="$UI/system/components/justep/org/orgDialog" xid="orgDialog"
    style="left:82px;top:261px;" includeOrgKind="psm" onReceive="orgDialogReceive"/>
  <div component="$UI/system/components/justep/contents/contents" class="x-contents x-full"
    active="0" xid="contents" slidable="true" swipe="false"> 
    <div class="x-contents-content" xid="list"> 
      <div component="$UI/system/components/justep/panel/panel" class="x-panel x-full"
        xid="panel1"> 
        <div class="x-panel-top" xid="top1"> 
          <div component="$UI/system/components/justep/titleBar/titleBar" class="x-titlebar"
            xid="listTitleBar" title="日程管理"> 
            <div class="x-titlebar-left" xid="div1" style="width:83px;"> 
              <a component="$UI/system/components/justep/button/button" class="btn btn-link"
                xid="backBtn" style="width:40px;" icon="icon-chevron-left" onClick="backBtnClick"> 
                <i xid="i3" class="icon-chevron-left"/>  
                <span xid="span3"/> 
              </a> 
            </div>  
            <div class="x-titlebar-title" xid="div2">日程管理</div>  
            <div class="x-titlebar-right reverse" xid="div3" style="width:124px;"> 
              <a component="$UI/system/components/justep/button/button" class="btn btn-link"
                xid="addBtn" style="width:40px;" icon="icon-plus-round" onClick="addBtnClick"> 
                <i xid="i4" class="icon-plus-round"/>  
                <span xid="span4"/> 
              </a> 
            </div> 
          </div> 
        </div>  
        <div class="x-panel-content" xid="content3"> 
          <div component="$UI/system/components/justep/panel/panel" class="x-panel x-full"
            xid="panel2"> 
            <div class="x-panel-top" xid="topArea"> 
              <div component="$UI/system/components/justep/titleBar/titleBar"
                class="x-titlebar" xid="scheTitleBar" style="background-color:#EBEBEB;color:#808080;"> 
                <div class="x-titlebar-left" xid="div15" style="width:33px;"> 
                  <a component="$UI/system/components/justep/button/button"
                    class="btn btn-link" xid="prevBtn" icon="icon-chevron-left" onClick="prevBtnClick"
                    style="margin-left:40px;"> 
                    <i xid="i12" class="icon-chevron-left"/>  
                    <span xid="span15"/> 
                  </a> 
                </div>  
                <div class="x-titlebar-title" xid="div16"/>  
                <div class="x-titlebar-right reverse" xid="div17"> 
                  <a component="$UI/system/components/justep/button/button"
                    class="btn btn-link" xid="nextBtn" icon="icon-chevron-right" onClick="nextBtnClick"
                    style="margin-right:40px;"> 
                    <i xid="i13" class="icon-chevron-right"/>  
                    <span xid="span16"/> 
                  </a> 
                </div> 
              </div>  
              <div component="$UI/system/components/justep/calendar/calendar"
                view="month" day="now" firstDay="monday" lunarDay="false" xid="calendar"
                onEventsSelected="calendar1EventsSelected" onEventsLoad="calendarEventsLoad"
                views="month" onAfterViewLoad="calendarAfterViewLoad"/> 
            </div>  
            <div class="x-panel-content x-scroll-view" xid="contentArea" style="bottom: 0px; top: 244px;"> 
              <div class="x-scroll" component="$UI/system/components/justep/scrollView/scrollView"
                xid="scrollView"> 
                <!--                   <div class="x-content-center x-pull-down container" xid="div11"> 
                    <i class="x-pull-down-img glyphicon x-icon-pull-down"/>  
                    <span class="x-pull-down-label">下拉刷新...</span> 
                  </div>   -->  
                <div class="x-scroll-content" xid="div12"> 
                  <div component="$UI/system/components/justep/list/list" class="x-list"
                    xid="scheduleList" data="scheduleData" disableInfiniteLoad="true"
                    disablePullToRefresh="true" limit="200" bind-click="scheduleListClick"> 
                    <ul class="x-list-template" xid="listTemplateUl4"> 
                      <li xid="li1" data-bind="attr:{flag:val('fScheDay')}"
                        class="title-row" bind-visible="val('fIsTitle') == '1'"> 
                        <div component="$UI/system/components/justep/output/output"
                          class="x-output" xid="output1" bind-ref="ref('fScheDay')"
                          style="b"/> 
                      </li>  
                      <li xid="cheduleRow" class="x-flex list-row" bind-visible="val('fIsTitle') == '0'"> 
                        <div class="head-pic-data" xid="col21"> 
                          <div class="x-blob" component="$UI/system/components/justep/org/orgImage"
                            xid="orgImage1" bind-ref="ref('fCreatorID')" orgKind="person"> 
                            <div class="x-blob-bar" xid="div18"> 
                              <i class="x-blob-edit icon-compose" xid="i8"/>  
                              <i class="x-blob-del icon-close-round" xid="i9"/> 
                            </div>  
                            <img class="x-blob-img x-autofill" xid="image1"/> 
                          </div> 
                        </div>  
                        <div class="x-flex1" xid="col23" style="position:relative ;"> 
                          <div _component="$UI/system/components/justep/row/row"
                            class="x-flex" xid="row8"> 
                            <div component="$UI/system/components/justep/output/output"
                              class="x-flex1 x-output title-data" xid="output6" bind-ref="ref('fName')"/> 
                          </div>  
                          <div _component="$UI/system/components/justep/row/row"
                            _class="x-row" xid="row9" class="x-flex"> 
                            <div component="$UI/system/components/justep/output/output"
                              class="x-output content-data" xid="output7" bind-ref="ref('fTimePeriod')"/>  
                            <div xid="div14" class="x-flex1 content-data" style="padding-left:10px;"> 
                              <i xid="i10" class="icon-ios7-gear" bind-visible="val('fRepeat') != 'none'"/> 
                            </div> 
                          </div> 
                        </div> 
                      </li> 
                    </ul> 
                  </div> 
                </div>  
                <!--                   <div class="x-content-center x-pull-up" xid="div13"> 
                    <span class="x-pull-up-label">加载更多...</span> 
                  </div>  --> 
              </div> 
            </div> 
          </div> 
        </div>  
        <div class="x-panel-bottom" xid="bottom1" height="36"> 
          <div component="$UI/system/components/justep/button/buttonGroup"
            class="btn-group btn-group-justified" tabbed="true" xid="buttonGroup1"> 
            <a component="$UI/system/components/justep/button/button" class="btn btn-default"
              label="今天" xid="todayBtn" onClick="todayBtnClick"> 
              <i xid="i1"/>  
              <span xid="span1">今天</span> 
            </a>  
            <a component="$UI/system/components/justep/button/button" class="btn btn-default"
              label="未确认日程" xid="confirmBtn" onClick="confirmBtnClick"> 
              <i xid="i2"/>  
              <span xid="span2">未确认日程</span> 
            </a>  
            <a component="$UI/system/components/justep/button/button" class="btn btn-default"
              label="同事日程" xid="colleagueBtn" onClick="colleagueBtnClick"> 
              <i xid="i5"/>  
              <span xid="span8">同事日程</span> 
            </a> 
          </div> 
        </div> 
      </div> 
    </div>  
    <div class="x-contents-content" xid="confirm"> 
      <div component="$UI/system/components/justep/panel/panel" class="x-panel x-full"
        xid="panel3"> 
        <div class="x-panel-top" xid="top3"> 
          <div component="$UI/system/components/justep/titleBar/titleBar" class="x-titlebar"
            xid="titleBar1" title="未确认日程"> 
            <div class="x-titlebar-left" xid="div5"> 
              <a component="$UI/system/components/justep/button/button" class="btn btn-link"
                xid="confirmBackBtn" icon="icon-chevron-left" onClick="confirmBackBtnClick"> 
                <i xid="i6" class="icon-chevron-left"/>  
                <span xid="span9"/> 
              </a> 
            </div>  
            <div class="x-titlebar-title" xid="div6">未确认日程</div>  
            <div class="x-titlebar-right reverse" xid="div7"/> 
          </div> 
        </div>  
        <div class="x-panel-content xui-hignlight-selected x-scroll-view" xid="content2"> 
          <div class="x-scroll" component="$UI/system/components/justep/scrollView/scrollView"
            xid="confirmScrollView"> 
            <div class="x-content-center x-pull-down container" xid="div8"> 
              <i class="x-pull-down-img glyphicon x-icon-pull-down"/>  
              <span class="x-pull-down-label" xid="span11">下拉刷新...</span> 
            </div>  
            <div class="x-scroll-content" xid="div9"> 
              <div component="$UI/system/components/justep/list/list" class="x-list"
                xid="list1" data="confirmData" limit="5" filter="js:$row.val('sGroupID') != 'C' &amp;&amp; $row.val('sGroupID')!= 'O'  "> 
                <ul class="x-list-template" xid="listTemplateUl1"> 
                  <li xid="li2" class="content-row"> 
                    <div class="confirm-row"> 
                      <div component="$UI/system/components/justep/output/output"
                        style="float:left;color:#0080FF;padding-top:0px;" class="x-output" xid="output8"
                        bind-ref="ref('fCreator1')"/>  
                      <div style="float:left">将您添加到</div>  
                      <div component="$UI/system/components/justep/output/output"
                        style="float:left;color:#0080FF;padding-top:0px;" class="x-output" xid="output4"
                        bind-ref="ref('fName')"/>  
                      <div>日程活动中</div> 
                    </div>  
                    <div class="confirm-row"> 
                      <div class="pull-left">主题：</div>  
                      <div component="$UI/system/components/justep/output/output"
                        class="x-output" xid="output5" bind-ref="ref('fName')" style="padding-top:0px;"/> 
                    </div>  
                    <div class="confirm-row"> 
                      <div class="pull-left">时间：</div>  
                      <div component="$UI/system/components/justep/output/output"
                        style="float:left;padding-top:0px;" class="x-output" xid="output51" bind-ref="ref('fStartTime')" format="yyyy-MM-dd hh:mm"/>  
                      <span xid="span5" class="pull-left"><![CDATA[　至　]]></span><div component="$UI/system/components/justep/output/output"
                        class="x-output" xid="output52" bind-ref="ref('fEndTime')" style="padding-top:0px;" format="yyyy-MM-dd hh:mm"></div> 
                    </div>  
                    <div style="height:57px;"> 
                      <a component="$UI/system/components/justep/button/button"
                        class="btn btn-link pull-right btn-link-pink" label="拒绝参加"
                        xid="cancelBtn" style="width:80px;" onClick="cancelBtnClick"> 
                        <i xid="i7"/>  
                        <span xid="span13">拒绝参加</span> 
                      </a>  
                      <a component="$UI/system/components/justep/button/button"
                        class="btn btn-link pull-right btn-link-blue" label="确认参加"
                        xid="okBtn" style="width:80px;" onClick="okBtnClick"> 
                        <i xid="i11"/>  
                        <span xid="span14">确认参加</span> 
                      </a> 
                    </div> 
                  </li> 
                </ul> 
              </div> 
            </div>  
            <div class="x-content-center x-pull-up" xid="div10"> 
              <span class="x-pull-up-label" xid="span12">加载更多...</span> 
            </div> 
          </div> 
        </div> 
      </div> 
    </div>  
    <div class="x-contents-content" xid="colleague"> 
      <div component="$UI/system/components/justep/panel/panel" class="x-panel x-full"
        xid="panel11"> 
        <div class="x-panel-top" xid="top11"> 
          <div component="$UI/system/components/justep/titleBar/titleBar" class="x-titlebar"
            xid="colleagueTitleBar1" title="同事日程"> 
            <div class="x-titlebar-left" xid="div11" style="width:83px;"> 
              <a component="$UI/system/components/justep/button/button" class="btn btn-link"
                xid="colleagueBackBtn" style="width:40px;" icon="icon-chevron-left"
                onClick="colleagueBackBtnClick"> 
                <i xid="i31" class="icon-chevron-left"/>  
                <span xid="span31"/> 
              </a> 
            </div>  
            <div class="x-titlebar-title" xid="div21">同事日程</div>  
            <div class="x-titlebar-right reverse" xid="div31" style="width:124px;"></div> 
          </div> 
        </div>  
        <div class="x-panel-content" xid="content31"> 
          <div component="$UI/system/components/justep/panel/panel" class="x-panel x-full"
            xid="panel21"> 
            <div class="x-panel-top" xid="colleagueTopArea"> 
              <div component="$UI/system/components/justep/titleBar/titleBar"
                class="x-titlebar" xid="colleagueTitleBar" style="background-color:#EBEBEB;color:#808080;"> 
                <div class="x-titlebar-left" xid="div151" style="width:33px;"> 
                  <a component="$UI/system/components/justep/button/button"
                    class="btn btn-link" xid="colleaguePrevBtn" icon="icon-chevron-left"
                    onClick="colleaguePrevBtnClick" style="margin-left:40px;"> 
                    <i xid="i121" class="icon-chevron-left"/>  
                    <span xid="span151"/> 
                  </a> 
                </div>  
                <div class="x-titlebar-title" xid="div161"/>  
                <div class="x-titlebar-right reverse" xid="div171"> 
                  <a component="$UI/system/components/justep/button/button"
                    class="btn btn-link" xid="colleagueNextBtn" icon="icon-chevron-right"
                    onClick="colleagueNextBtnClick" style="margin-right:40px;"> 
                    <i xid="i131" class="icon-chevron-right"/>  
                    <span xid="span161"/> 
                  </a> 
                </div> 
              </div>  
              <div component="$UI/system/components/justep/calendar/calendar"
                view="month" day="now" firstDay="monday" lunarDay="false" xid="colleagueCalendar"
                onEventsSelected="colleagueCalendar1EventsSelected" onEventsLoad="colleagueCalendarEventsLoad"
                views="month" onAfterViewLoad="colleagueCalendarAfterViewLoad"/> 
            </div>  
            <div class="x-panel-content x-scroll-view" xid="colleagueContentArea"
              style="bottom: 0px; top: 244px;"> 
              <div class="x-scroll" component="$UI/system/components/justep/scrollView/scrollView"
                xid="colleagueScrollView"> 
                <div class="x-scroll-content" xid="div121"> 
                  <div component="$UI/system/components/justep/list/list" class="x-list"
                    xid="colleagueList" data="colleagueData" disableInfiniteLoad="true"
                    disablePullToRefresh="true" limit="200" bind-click="colleagueListClick"> 
                    <ul class="x-list-template" xid="listTemplateUl41"> 
                      <li xid="li11" data-bind="attr:{cflag:val('fScheDay')}"
                        class="title-row" bind-visible="val('fIsTitle') == '1'"> 
                        <div component="$UI/system/components/justep/output/output"
                          class="x-output" xid="output11" bind-ref="ref('fScheDay')"
                          style="b"/> 
                      </li>  
                      <li xid="colleagueRow" class="x-flex list-row" bind-visible="val('fIsTitle') == '0'"> 
                        <div class="head-pic-data" xid="col211"> 
                          <div class="x-blob" component="$UI/system/components/justep/org/orgImage"
                            xid="orgImage11" bind-ref="ref('fCreatorID')" orgKind="person"> 
                            <div class="x-blob-bar" xid="div181"> 
                              <i class="x-blob-edit icon-compose" xid="i81"/>  
                              <i class="x-blob-del icon-close-round" xid="i91"/> 
                            </div>  
                            <img class="x-blob-img x-autofill" xid="image11"/> 
                          </div> 
                        </div>  
                        <div class="x-flex1" xid="col231" style="position:relative ;"> 
                          <div _component="$UI/system/components/justep/row/row"
                            class="x-flex" xid="row81"> 
                            <div component="$UI/system/components/justep/output/output"
                              class="x-flex1 x-output title-data" xid="output61" bind-ref="ref('fName')"/> 
                          </div>  
                          <div _component="$UI/system/components/justep/row/row"
                            _class="x-row" xid="row91" class="x-flex"> 
                            <div component="$UI/system/components/justep/output/output"
                              class="x-output content-data" xid="output71" bind-ref="ref('fTimePeriod')"/>  
                            <div xid="div141" class="x-flex1 content-data"
                              style="padding-left:10px;"> 
                              <i xid="i101" class="icon-ios7-gear" bind-visible="val('fRepeat') != 'none'"/> 
                            </div> 
                          </div> 
                        </div> 
                      </li> 
                    </ul> 
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
