<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window oa" component="$UI/system/components/justep/window/window">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="width:102px;height:auto;left:214px;top:224px;"
    onLoad="modelLoad" onActive="modelActive"> 
    <div component="$UI/system/components/justep/data/bizData" xid="closeData"
      concept="OA_LeaveApply" limit="6"> 
      <reader xid="default9" action="/OA/personalOffice/logic/action/queryOA_LeaveApplyClAction"/>  
      <writer xid="default10" action="/OA/personalOffice/logic/action/saveOA_LeaveApplyAction"/>  
      <creator xid="default11" action="/OA/personalOffice/logic/action/createOA_LeaveApplyAction"/>  
      <calculateRelation relation="fShowTime" xid="calculateRelation1"/>  
      <rule xid="rule1"> 
        <col name="fShowTime" xid="ruleCol1"> 
          <calculate xid="calculate1"> 
            <expr xid="default18">js:$model.showTime($row)</expr>
          </calculate> 
        </col> 
      </rule>
    </div>  
    <div component="$UI/system/components/justep/data/data" xid="numData" idColumn="croNum"
      autoNew="true"> 
      <column label="col0" name="croNum" type="String" xid="default4"/>  
      <column label="col1" name="exeNum" type="String" xid="default5"/>  
      <column label="col2" name="parNum" type="String" xid="default6"/>  
      <column label="col3" name="cloNum" type="String" xid="default7"/>  
      <column label="col4" name="findStr" type="String" xid="default8"/> 
    </div>  
    <div component="$UI/system/components/justep/data/bizData" xid="executorData"
      concept="OA_LeaveApply" autoLoad="true" limit="-1" confirmDelete="false"> 
      <reader xid="default1" action="/OA/personalOffice/logic/action/queryOA_LeaveApplyExAction"/>  
      <writer xid="default2" action="/OA/personalOffice/logic/action/saveOA_LeaveApplyAction"/>  
      <creator xid="default3" action="/OA/personalOffice/logic/action/createOA_LeaveApplyAction"/>  
      <calculateRelation relation="fShowTime" xid="calculateRelation2"/>  
      <rule xid="rule2"> 
        <col name="fShowTime" xid="ruleCol2"> 
          <calculate xid="calculate2"> 
            <expr xid="default19">js:$model.showTime($row)</expr>
          </calculate> 
        </col> 
      </rule>
    </div>  
    <div component="$UI/system/components/justep/data/bizData" xid="creatorData"
      concept="OA_LeaveApply" limit="-1"> 
      <reader xid="default12" action="/OA/personalOffice/logic/action/queryOA_LeaveApplyCrAction"/>  
      <writer xid="default13" action="/OA/personalOffice/logic/action/saveOA_LeaveApplyAction"/>  
      <creator xid="default14" action="/OA/personalOffice/logic/action/createOA_LeaveApplyAction"/>  
      <calculateRelation relation="fShowTime" xid="calculateRelation3"/>  
      <rule xid="rule3"> 
        <col name="fShowTime" xid="ruleCol3"> 
          <calculate xid="calculate3"> 
            <expr xid="default20">js:$model.showTime($row)</expr>
          </calculate> 
        </col> 
      </rule>
    </div>  
    <div component="$UI/system/components/justep/data/bizData" xid="parData"
      concept="OA_LeaveApply" limit="-1"> 
      <reader xid="default15" action="/OA/personalOffice/logic/action/queryOA_LeaveApply1PaAction"/>  
      <writer xid="default16" action="/OA/personalOffice/logic/action/saveOA_LeaveApplyAction"/>  
      <creator xid="default17" action="/OA/personalOffice/logic/action/createOA_LeaveApplyAction"/>  
      <calculateRelation relation="fShowTime" xid="calculateRelation4"/>  
      <rule xid="rule4"> 
        <col name="fShowTime" xid="ruleCol4"> 
          <calculate xid="calculate4"> 
            <expr xid="default21">js:$model.showTime($row)</expr>
          </calculate> 
        </col> 
      </rule>
    </div> 
  </div>  
  <!--   <span component="$UI/system/components/justep/org/orgDialog" xid="orgSingleDialog"
    onReceive="orgSingleDialogReceive"/>  
  <span component="$UI/system/components/justep/org/orgDialog" xid="orgMutilDialog"
    multiSelection="true" onReceive="orgMutilDialogReceive"/>   -->  
  <span component="$UI/system/components/justep/windowDialog/windowDialog" xid="detailDialog"
    style="left:63px;top:448px;" src="$UI/OA/personalOffice/process/leaveApply/detailActivity.w"/>  
  <!--   <span component="$UI/system/components/justep/messageDialog/messageDialog"
    xid="closeMsgDlg" type="YesNo" onClose="closeMsgDlgClose" title="提示" message="是否取消当前操作？"/>   -->  
  <span component="$UI/system/components/justep/windowDialog/windowDialog" xid="newDialog"
    src="$UI/OA/personalOffice/process/leaveApply/mainActivity.w" onReceive="newDialogReceive"
    style="left:22px;top:453px;" forceRefreshOnOpen="true"/>  
  <div component="$UI/system/components/justep/contents/contents" class="x-contents x-full"
    active="0" xid="contents" slidable="true" swipe="false"> 
    <div class="x-contents-content" xid="list"> 
      <div component="$UI/system/components/justep/panel/panel" class="x-panel x-full"
        xid="panel1"> 
        <div class="x-panel-top" xid="top1"> 
          <div component="$UI/system/components/justep/titleBar/titleBar" class="x-titlebar"
            xid="listTitleBar" title="请假管理"> 
            <div class="x-titlebar-left" xid="div1" style="width:83px;"> 
              <a component="$UI/system/components/justep/button/button" class="btn btn-link"
                xid="backBtn" icon="icon-chevron-left" onClick="backBtnClick"> 
                <i xid="i3" class="icon-chevron-left"/>  
                <span xid="span3"/> 
              </a> 
            </div>  
            <div class="x-titlebar-title" xid="div2">请假管理</div>  
            <div class="x-titlebar-right reverse" xid="div3" style="width:124px;"> 
              <a component="$UI/system/components/justep/button/button" class="btn btn-link"
                xid="addBtn" icon="icon-plus-round" onClick="addBtnClick"> 
                <i xid="i4" class="icon-plus-round"/>  
                <span xid="span4"/> 
              </a> 
            </div> 
          </div> 
        </div>  
        <div class="x-panel-content" xid="content3"> 
          <div component="$UI/system/components/justep/panel/panel" class="x-panel x-full"
            xid="panel2"> 
            <div class="x-panel-top" xid="top2"> 
              <div class="input-group smart-filter" component="$UI/system/components/justep/smartFilter/smartFilter"
                xid="smartFilter" onFilter="smartFilterFilter"> 
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
            <div class="x-panel-content x-scroll-view" xid="content4" style="bottom: 0px;"> 
                <div class="x-scroll" component="$UI/system/components/justep/scrollView/scrollView"
                  xid="scrollView2"> 
                  <div class="x-content-center x-pull-down container" xid="div11"> 
                    <i class="x-pull-down-img glyphicon x-icon-pull-down"/>  
                    <span class="x-pull-down-label">下拉刷新...</span> 
                  </div>  
                  <div class="x-scroll-content" xid="div12"> 
                    <div xid="div7" class="title-row" bind-html="&quot;我审批 (&quot; + $model.numData.getValue('exeNum') + &quot;)&quot;"
                      bind-visible="$model.numData.getValue('exeNum')&gt;0">我审批</div>  
                    <div component="$UI/system/components/justep/list/list"
                      class="x-list" xid="executorList" data="executorData" limit="200"
                      disablePullToRefresh="true" disableInfiniteLoad="true" filter="js:$model.dataFilter($row) "
                      bind-click="executoristClick"> 
                      <ul class="x-list-template" xid="listTemplateUl5"> 
                        <li xid="li5" > 
                          <div component="$UI/system/components/justep/row/row"
                            class="x-row list-row2" xid="row1"> 
                            <div class="x-col x-col-fixed " xid="col1" style="width:auto;">
                              <div class="x-blob head-pic-data2" component="$UI/system/components/justep/org/orgImage"
                                xid="orgImage1" bind-ref="ref('fCreatorID')" orgKind="person"> 
                                <div class="x-blob-bar" xid="div5"> 
                                  <i class="x-blob-edit icon-compose" xid="i1"/>  
                                  <i class="x-blob-del icon-close-round"
                                    xid="i2"/>
                                </div>  
                                <img class="x-blob-img x-autofill" xid="image1"/>
                              </div>
                            </div>  
                            <div class="x-col" xid="col3">
                              <div component="$UI/system/components/justep/row/row"
                                class="x-row innerRow1" xid="row2"> 
                                <div class="x-col" xid="col4">
                                  <div component="$UI/system/components/justep/output/output"
                                    class="x-output title-data2" xid="output2" bind-ref="ref('fCreator')" style="padding-top:0px;"/>
                                </div>  
                                <div class="x-col x-col-fixed" xid="col6" style="width:auto;">
                                  <div component="$UI/system/components/justep/output/output"
                                    class="x-output" xid="output6" bind-ref="ref('fShowTime')" style="padding-top:0px;"/>
                                </div>
                              </div>  
                              <div component="$UI/system/components/justep/row/row"
                                class="x-row innerRow2" xid="row3"> 
                                <div class="x-col" xid="col7">
                                  <div component="$UI/system/components/justep/output/output"
                                    class="x-output content-data2" xid="output5" bind-ref="ref('fContent')" style="padding-top:0px;"/>
                                </div>  
                                <div class="x-col x-col-fixed" xid="col9" style="width:auto;">
                                  <div component="$UI/system/components/justep/output/output"
                                    class="x-output" xid="output7" bind-ref="ref('fApprove')" style="padding-top:0px;"/>
                                </div>
                              </div>
                            </div>
                          </div>  
                          <!--                           <div xid="col32" class="head-pic-data "> 
                            <div class="x-blob" component="$UI/system/components/justep/org/orgImage"
                              xid="orgImage2" bind-ref="ref('fCreatorID')" orgKind="person"> 
                              <div class="x-blob-bar" xid="div6"> 
                                <i class="x-blob-edit icon-compose" xid="i5"/>  
                                <i class="x-blob-del icon-close-round" xid="i6"/> 
                              </div>  
                              <img class="x-blob-img x-autofill" xid="image2"/> 
                            </div> 
                          </div>  
                          <div class="x-flex1" xid="col33"> 
                            <div _component="$UI/system/components/justep/row/row"
                              class="x-flex" xid="row11"> 
                              <div component="$UI/system/components/justep/output/output"
                                class="x-flex1 x-output title-data" xid="output9"
                                bind-ref="ref('fCreator')"/>  
                              <div component="$UI/system/components/justep/output/output"
                                class="x-output right-content-data" xid="output11"
                                bind-ref="ref('fShowTime')"/> 
                            </div>  
                            <div _component="$UI/system/components/justep/row/row"
                              class="x-flex" xid="row12"> 
                              <div component="$UI/system/components/justep/output/output"
                                class="x-flex1 x-output content-data" xid="output10"
                                bind-ref="ref('fContent')"/>  
                              <div component="$UI/system/components/justep/output/output"
                                class="x-output right-content-data2" xid="col39" bind-ref="ref('fApprove')"/> 
                            </div> 
                          </div>  --> 
                        </li> 
                      </ul> 
                    </div>  
                    <div xid="div92" class="title-row" bind-visible="$model.numData.getValue('croNum')&gt;0"
                      bind-html="&quot;我发起 (&quot; + $model.numData.getValue('croNum') + &quot;)&quot;">我发起</div>  
                    <div component="$UI/system/components/justep/list/list"
                      class="x-list" xid="creatorList" data="creatorData" limit="200"
                      disablePullToRefresh="true" disableInfiniteLoad="true" filter="js:$model.dataFilter($row) "
                      bind-click="creatorListClick"> 
                      <ul class="x-list-template" xid="listTemplateUl7"> 
                        <li xid="li7" class="x-flex list-row"> 
                          <div xid="col10" class="head-pic-data "> 
                            <div class="x-blob" component="$UI/system/components/justep/org/orgImage"
                              xid="orgImage3" orgKind="person" bind-ref="ref('fCreatorID')"> 
                              <div class="x-blob-bar" xid="div8"> 
                                <i class="x-blob-edit icon-compose" xid="i9"/>  
                                <i class="x-blob-del icon-close-round" xid="i10"/> 
                              </div>  
                              <img class="x-blob-img x-autofill" xid="image3"/> 
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
                                bind-ref="ref('fContent')"/>  
                              <div component="$UI/system/components/justep/output/output"
                                class="x-output right-content-data2" xid="col18" bind-ref="ref('fApprove')"/> 
                            </div> 
                          </div> 
                        </li> 
                      </ul> 
                    </div>  
                    <div xid="div91" class="title-row" bind-visible="$model.numData.getValue('parNum')&gt;0"
                      bind-html="&quot;我相关 (&quot; + $model.numData.getValue('parNum') + &quot;)&quot;">我相关</div>  
                    <div component="$UI/system/components/justep/list/list"
                      class="x-list" xid="parList" data="parData" limit="200" disablePullToRefresh="true"
                      disableInfiniteLoad="true" filter="js:$model.dataFilter($row) "
                      bind-click="parListClick"> 
                      <ul class="x-list-template" xid="listTemplateUl71"> 
                        <li xid="li71" class="x-flex list-row"> 
                          <div xid="col101" class="head-pic-data "> 
                            <div class="x-blob" component="$UI/system/components/justep/org/orgImage"
                              xid="orgImage31" orgKind="person" bind-ref="ref('fCreatorID')"> 
                              <div class="x-blob-bar" xid="div81"> 
                                <i class="x-blob-edit icon-compose" xid="i91"/>  
                                <i class="x-blob-del icon-close-round" xid="i101"/> 
                              </div>  
                              <img class="x-blob-img x-autofill" xid="image31"/> 
                            </div> 
                          </div>  
                          <div xid="col121" class="x-flex1"> 
                            <div _component="$UI/system/components/justep/row/row"
                              class="x-flex" xid="row51"> 
                              <div component="$UI/system/components/justep/output/output"
                                class="x-flex1 x-output title-data" xid="output111"
                                bind-ref="ref('fCreator')"/>  
                              <div component="$UI/system/components/justep/output/output"
                                class="x-output right-content-data" xid="output31"
                                bind-ref="ref('fShowTime')"/> 
                            </div>  
                            <div _component="$UI/system/components/justep/row/row"
                              class="x-flex" xid="row61"> 
                              <div component="$UI/system/components/justep/output/output"
                                class="x-flex1 x-output content-data" xid="output41"
                                bind-ref="ref('fContent')"/>  
                              <div component="$UI/system/components/justep/output/output"
                                class="x-output right-content-data2" xid="col181"
                                bind-ref="ref('fApprove')"/> 
                            </div> 
                          </div> 
                        </li> 
                      </ul> 
                    </div>  
                    <div xid="div10" class="title-row" bind-html="&quot;已审批 (&quot; + $model.numData.getValue('cloNum') + &quot;)&quot;"
                      bind-visible="$model.numData.getValue('cloNum') &gt; 0">已审批</div>  
                    <div component="$UI/system/components/justep/list/list"
                      class="x-list" xid="cloList" data="closeData" limit="6" bind-click="cloListClick"
                      filter="js:$model.dataFilter($row) "> 
                      <ul class="x-list-template" xid="listTemplateUl8"> 
                        <li xid="li8" class="x-flex close-list-row"> 
                          <div xid="col19" class="head-pic-data "> 
                            <div class="x-blob" component="$UI/system/components/justep/org/orgImage"
                              xid="orgImage4" orgKind="person" bind-ref="ref('fCreatorID')"> 
                              <div class="x-blob-bar" xid="div14"> 
                                <i class="x-blob-edit icon-compose" xid="i11"/>  
                                <i class="x-blob-del icon-close-round" xid="i12"/> 
                              </div>  
                              <img class="x-blob-img x-autofill" xid="image4"/> 
                            </div> 
                          </div>  
                          <div xid="col22" class="x-flex1"> 
                            <div class="x-flex" xid="row14"> 
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
                                bind-ref="ref('fContent')"/>  
                              <div component="$UI/system/components/justep/output/output"
                                class="x-output right-content-data2" xid="col40" bind-ref="ref('fApprove')"/> 
                            </div> 
                          </div> 
                        </li> 
                      </ul> 
                    </div> 
                  </div>  
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
  <div xid="dialog"/> 
</div>
