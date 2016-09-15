<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window oa" component="$UI/system/components/justep/window/window">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="width:102px;height:auto;left:319px;top:206px;"
    onLoad="modelLoad"> 
    <div component="$UI/system/components/justep/data/bizData" xid="visitData"
      concept="OA_CustomerVisit" autoLoad="true" limit="-1" confirmDelete="false" confirmRefresh="false"> 
      <reader xid="default1" action="/OA/CRM/logic/action/queryOA_CustomerVisitRecentAction"/>  
      <writer xid="default2" action="/OA/CRM/logic/action/saveOA_CustomerVisitAction"/>  
      <creator xid="default3" action="/OA/CRM/logic/action/createOA_CustomerVisitAction"/>  
      <calculateRelation relation="fShowInfo" xid="calculateRelation1"/>  
      <calculateRelation relation="fShowTime" xid="calculateRelation3"/>  
      <rule xid="rule3"> 
        <col name="fShowInfo" xid="ruleCol3"> 
          <calculate xid="calculate3"> 
            <expr xid="default6">js: $row.val("fCustomer") + '：' + $row.val("fContent")</expr>
          </calculate> 
        </col>  
        <col name="fShowTime" xid="ruleCol4"> 
          <calculate xid="calculate4"> 
            <expr xid="default7">js:$model.showTime($row)</expr>
          </calculate> 
        </col> 
      </rule>
    </div>  
    <div component="$UI/system/components/justep/data/bizData" xid="agoVisitData"
      concept="OA_CustomerVisit" limit="6" updateMode="whereVersion" confirmRefresh="false" confirmDelete="false"> 
      <reader xid="default9" action="/OA/CRM/logic/action/queryOA_CustomerVisitAgoAction"/>  
      <writer xid="default10" action="/OA/CRM/logic/action/saveOA_CustomerVisitAction"/>  
      <creator xid="default11" action="/OA/CRM/logic/action/createOA_CustomerVisitAction"/>  
      <calculateRelation relation="fShowInfo" xid="calculateRelation2"/>  
      <calculateRelation relation="fShowTime" xid="calculateRelation4"/>  
      <rule xid="rule4"> 
        <col name="fShowInfo" xid="ruleCol5"> 
          <calculate xid="calculate5"> 
            <expr xid="default8">js: $row.val("fCustomer") + '：' + $row.val("fContent")</expr>
          </calculate> 
        </col>  
        <col name="fShowTime" xid="ruleCol6"> 
          <calculate xid="calculate6"> 
            <expr xid="default12">js:$model.showTime($row)</expr>
          </calculate> 
        </col> 
      </rule>
    </div>  
    <!--     <div component="$UI/system/components/justep/data/bizData" xid="upToDateData"
      concept="OA_TasksAssignedDate" autoNew="false" limit="-1"> 
      <reader xid="default18" action="/OA/personalOffice/logic/action/queryOA_TasksAssignedDateAction"/>  
      <writer xid="default19" action="/OA/personalOffice/logic/action/saveOA_TasksAssignedDateAction"/>  
      <creator xid="default20" action="/OA/personalOffice/logic/action/createOA_TasksAssignedDateAction"/>  
      <master xid="default21" data="taskData" relation="fTaskID"/>  
      <rule xid="rule3"> 
                <col name="fUpToDate" xid="ruleCol7"> 
          <required xid="required7"> 
            <expr xid="default38">js:true</expr>  
            <message xid="default39">请选择截至日期</message> 
          </required> 
        </col>  
      </rule> 
    </div>  -->  
    <div component="$UI/system/components/justep/data/data" xid="numData" idColumn="todayNum"
      autoNew="true"> 
      <column label="col0" name="todayNum" type="String" xid="default16"/>  
      <column label="col1" name="yesdayNum" type="String" xid="default17"/>  
      <column label="col4" name="beforedayNum" type="String" xid="default18"/>  
      <column label="col3" name="findStr" type="String" xid="default19"/>
    </div> 
  </div>  
  <!--   <span component="$UI/system/components/justep/org/orgDialog" xid="orgSingleDialog"
    onReceive="orgSingleDialogReceive"/>  
  <span component="$UI/system/components/justep/org/orgDialog" xid="orgMutilDialog"
    multiSelection="true" onReceive="orgMutilDialogReceive"/>   -->  
  <span component="$UI/system/components/justep/windowDialog/windowDialog" xid="detailDialog"
    src="$UI/OA/CRM/process/customerVisit/detailActivity.m.w" style="left:118px;top:14px;"/>  
  <!--   <span component="$UI/system/components/justep/messageDialog/messageDialog"
    xid="closeMsgDlg" type="YesNo" onClose="closeMsgDlgClose" title="提示" message="是否取消当前操作？"/>   -->  
  <span component="$UI/system/components/justep/windowDialog/windowDialog" xid="newDialog"
    src="$UI/OA/CRM/process/customerVisit/newActivity.w" onReceive="newDialogReceive"
    style="left:85px;top:15px;"/>  
  <div component="$UI/system/components/justep/contents/contents" class="x-contents x-full"
    active="0" xid="contents" slidable="true" swipe="false"> 
    <div class="x-contents-content" xid="list"> 
      <div component="$UI/system/components/justep/panel/panel" class="x-panel x-full"
        xid="panel1"> 
        <div class="x-panel-top" xid="top1"> 
          <div component="$UI/system/components/justep/titleBar/titleBar" class="x-titlebar"
            xid="listTitleBar" title="客户拜访"> 
            <div class="x-titlebar-left" xid="div1" style="width:83px;"> 
              <a component="$UI/system/components/justep/button/button" class="btn btn-link"
                xid="backBtn" style="width:40px;" icon="icon-chevron-left" onClick="backBtnClick"> 
                <i xid="i3" class="icon-chevron-left"/>  
                <span xid="span3"/> 
              </a> 
            </div>  
            <div class="x-titlebar-title" xid="div2">客户拜访</div>  
            <div class="x-titlebar-right reverse" xid="div3" style="width:124px;"> 
              <a component="$UI/system/components/justep/button/button" class="btn btn-link"
                xid="addBtn" style="width:40px;" icon="icon-plus-round" onClick="addBtnClick"> 
                <i xid="i4" class="icon-plus-round"/>  
                <span xid="span4"/> 
              </a>  
              <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-only-icon"
                label="button" xid="mapBtn" icon="icon-android-location" onClick="mapBtnClick"> 
                <i xid="i1" class="icon-android-location"/>  
                <span xid="span1"/>
              </a>
            </div> 
          </div> 
        </div>  
        <div class="x-panel-content" xid="content3"> 
          <div component="$UI/system/components/justep/panel/panel" class="x-panel x-full"
            xid="panel2"> 
            <div class="x-panel-top" xid="top2"> 
              <div class="input-group smart-filter" component="$UI/system/components/justep/smartFilter/smartFilter"
                xid="smartFilter" filterData="visitData" filterCols="fVisitTime,fCustomer,fCreator,fContent"
                onFilter="smartFilterFilter"> 
                <span class="input-group-addon" bind-click="$model.comp($element.parentElement).refresh.bind($model.comp($element.parentElement))"
                  xid="span6"> 
                  <i class="icon-android-search" xid="i7"/> 
                </span>  
                <input type="text" class="form-control" data-bind="valueUpdate: ['input', 'afterkeydown']"
                  placeHolder="搜索" bind-value="$model.comp($element.parentElement).searchText"
                  bind-change="$model.comp($element.parentElement).onInputChange.bind($model.comp($element.parentElement))"
                  xid="input2"/>  
                <span class="input-group-addon" bind-click="$model.comp($element.parentElement).clear.bind($model.comp($element.parentElement))"
                  bind-visible="$model.comp($element.parentElement).searchText.get() != ''"
                  xid="span7"> 
                  <i class="icon-close-circled" xid="i8"/> 
                </span> 
              </div> 
            </div>  
            <div class="x-panel-content x-scroll-view" xid="content4"> 
                <div class="x-scroll" component="$UI/system/components/justep/scrollView/scrollView"
                  xid="scrollView2"> 
                  <!--   <div class="x-pull-to-refresh" xid="div11"/>   -->  
                  <div class="x-content-center x-pull-down container" xid="div11"> 
                    <i class="x-pull-down-img glyphicon x-icon-pull-down"/>  
                    <span class="x-pull-down-label">下拉刷新...</span> 
                  </div>  
                  <div class="x-scroll-content" xid="div12"> 
                    <div xid="div8" class="title-row" bind-visible="$model.numData.getValue('todayNum')&gt;0"
                      bind-html="&quot;今天（&quot; + $model.numData.getValue('todayNum') + &quot;）&quot;">今天</div>  
                    <div component="$UI/system/components/justep/list/list"
                      class="x-list" xid="todayList" data="visitData" bind-click="recentListClick"
                      limit="200" disablePullToRefresh="true" disableInfiniteLoad="true"
                      filter="js:$model.today($row) "> 
                      <ul class="x-list-template" xid="listTemplateUl6"> 
                        <li xid="li6" class="x-flex list-row"> 
                          <div xid="col1" class="head-pic-data "> 
                            <div class="x-blob" component="$UI/system/components/justep/org/orgImage"
                              xid="orgImage3" bind-ref="ref('fCreatorID')" orgKind="person"> 
                              <div class="x-blob-bar" xid="div16"> 
                                <i class="x-blob-edit icon-compose" xid="i9"/>  
                                <i class="x-blob-del icon-close-round" xid="i10"/> 
                              </div>  
                              <img class="x-blob-img x-autofill" xid="image3"/> 
                            </div> 
                          </div>  
                          <div class="x-flex1" xid="col3"> 
                            <div _component="$UI/system/components/justep/row/row"
                              class="x-flex" xid="row2"> 
                              <div component="$UI/system/components/justep/output/output"
                                class="x-flex1 x-output title-data" xid="output13"
                                bind-ref="ref('fCreator')"/>  
                              <div component="$UI/system/components/justep/output/output"
                                class="x-output right-content-data" xid="output14"
                                bind-ref="ref('fShowTime')"/> 
                            </div>  
                            <div _component="$UI/system/components/justep/row/row"
                              class="x-flex" xid="row3"> 
                              <div component="$UI/system/components/justep/output/output"
                                class="x-flex1 x-output content-data" xid="output15"
                                bind-ref="ref('fShowInfo')"/>  
                              <div xid="col391" style="width:70px;">
                                <div component="$UI/system/components/justep/output/output"
                                  class="x-output right-content-data" xid="output2" bind-ref="ref('fVisitNum')"/>
                              </div> 
                            </div> 
                          </div> 
                        </li> 
                      </ul> 
                    </div>  
                    <div xid="div9" class="title-row" bind-visible="$model.numData.getValue('yesdayNum')&gt;0"
                      bind-html="&quot;昨天（&quot; + $model.numData.getValue('yesdayNum') + &quot;）&quot;">昨天</div>  
                    <div component="$UI/system/components/justep/list/list"
                      class="x-list" xid="yestodayList" data="visitData" bind-click="recentListClick"
                      limit="200" disablePullToRefresh="true" disableInfiniteLoad="true"
                      filter="js:$model.yesterday($row) "> 
                      <ul class="x-list-template" xid="listTemplateUl7"> 
                        <li xid="li7" class="x-flex list-row"> 
                          <div xid="col10" class="head-pic-data "> 
                            <div class="x-blob" component="$UI/system/components/justep/org/orgImage"
                              xid="orgImage4" bind-ref="ref('fCreatorID')" orgKind="person"> 
                              <div class="x-blob-bar" xid="div17"> 
                                <i class="x-blob-edit icon-compose" xid="i11"/>  
                                <i class="x-blob-del icon-close-round" xid="i12"/> 
                              </div>  
                              <img class="x-blob-img x-autofill" xid="image4"/> 
                            </div> 
                          </div>  
                          <div xid="col12" class="x-flex1"> 
                            <div _component="$UI/system/components/justep/row/row"
                              class="x-flex" xid="row5"> 
                              <div component="$UI/system/components/justep/output/output"
                                class="x-flex1 x-output title-data" xid="output1"
                                bind-ref="ref('fCreator')"/>  
                              <div component="$UI/system/components/justep/output/output"
                                class="x-output right-content-data" xid="output3"
                                bind-ref="ref('fShowTime')"/> 
                            </div>  
                            <div _component="$UI/system/components/justep/row/row"
                              class="x-flex" xid="row6"> 
                              <div component="$UI/system/components/justep/output/output"
                                class="x-flex1 x-output content-data" xid="output4"
                                bind-ref="ref('fShowInfo')"/>  
                              <div xid="col18" style="width:70px;"><div component="$UI/system/components/justep/output/output" class="x-output right-content-data" xid="output5" bind-ref="ref('fVisitNum')"></div></div> 
                            </div> 
                          </div> 
                        </li> 
                      </ul> 
                    </div>  
                    <div xid="div10" class="title-row" bind-html="&quot;以前（&quot; + $model.numData.getValue('beforedayNum') + &quot;）&quot;"
                      bind-visible="$model.numData.getValue('beforedayNum') &gt; 0">以前</div>  
                    <div component="$UI/system/components/justep/list/list"
                      class="x-list" xid="agoList" data="agoVisitData" limit="6" bind-click="agoListClick"
                      autoLoad="true"> 
                      <ul class="x-list-template" xid="listTemplateUl8"> 
                        <li xid="li8" class="x-flex close-list-row"> 
                          <div xid="col19" class="head-pic-data "> 
                            <div class="x-blob" component="$UI/system/components/justep/org/orgImage"
                              xid="orgImage5" bind-ref="ref('fCreatorID')" orgKind="person"> 
                              <div class="x-blob-bar" xid="div18"> 
                                <i class="x-blob-edit icon-compose" xid="i13"/>  
                                <i class="x-blob-del icon-close-round" xid="i14"/> 
                              </div>  
                              <img class="x-blob-img x-autofill" xid="image5"/> 
                            </div> 
                          </div>  
                          <div xid="col22" class="x-flex1"> 
                            <div _component="$UI/system/components/justep/row/row"
                              class="x-flex" xid="row14"> 
                              <div component="$UI/system/components/justep/output/output"
                                class="x-flex1 x-output title-data" xid="output17"
                                bind-ref="ref('fCreator')"/>  
                              <div component="$UI/system/components/justep/output/output"
                                class="x-output right-content-data" xid="output19"
                                bind-ref="ref('fShowTime')" style="float:right;"/> 
                            </div>  
                            <div _component="$UI/system/components/justep/row/row"
                              xid="row15" class="x-flex"> 
                              <div component="$UI/system/components/justep/output/output"
                                class="x-flex1 x-output content-data" xid="output18"
                                bind-ref="ref('fShowInfo')"/>  
                              <div xid="col40" style="width:70px;"> 
                                <div component="$UI/system/components/justep/output/output" class="x-output right-content-data" xid="output6" bind-ref="ref('fVisitNum')"></div></div> 
                            </div> 
                          </div> 
                        </li> 
                      </ul> 
                    </div> 
                  </div>  
                  <!--         <div class="x-infinite-load" xid="div13"> 
                    <span class="x-pull-up-label" xid="span5">加载更多...</span> 
                  </div>  -->  
                  <div class="x-content-center x-pull-up" xid="div13"> 
                    <span class="x-pull-up-label">加载更多...</span> 
                  </div> 
                </div> 
            </div> 
          </div> 
        </div> 
      </div> 
    </div> 
  </div>  
  <span component="$UI/system/components/justep/windowDialog/windowDialog" xid="mapDialog"
    src="$UI/OA/common/process/map.w" style="left:49px;top:15px;"/>
</div>
