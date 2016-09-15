<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window oa" component="$UI/system/components/justep/window/window">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="width:102px;height:auto;left:127px;top:-18px;"
    onLoad="modelLoad"> 
    <div component="$UI/system/components/justep/data/bizData" xid="evectionData"
      concept="OA_Evection" autoLoad="true" limit="-1" confirmDelete="false"> 
      <reader xid="default1" action="/OA/personalOffice/logic/action/queryOA_EvectionOpAction"/>  
      <writer xid="default2" action="/OA/personalOffice/logic/action/saveOA_EvectionAction"/>  
      <creator xid="default3" action="/OA/personalOffice/logic/action/createOA_EvectionAction"/> 
    <calculateRelation relation="fShowTime" xid="calculateRelation1"></calculateRelation>
  <rule xid="rule1">
   <col name="fShowTime" xid="ruleCol1">
    <calculate xid="calculate1">
     <expr xid="default12">js:$model.showTime($row)</expr></calculate> </col> </rule></div>  
    <div component="$UI/system/components/justep/data/bizData" xid="closeData"
      concept="OA_Evection" limit="6" onAfterRefresh="closeDataAfterRefresh"> 
      <reader xid="default9" action="/OA/personalOffice/logic/action/queryOA_EvectionClAction"/>  
      <writer xid="default10" action="/OA/personalOffice/logic/action/saveOA_EvectionAction"/>  
      <creator xid="default11" action="/OA/personalOffice/logic/action/createOA_EvectionAction"/> 
    <calculateRelation relation="fShowTime" xid="calculateRelation2"></calculateRelation>
  <rule xid="rule2">
   <col name="fShowTime" xid="ruleCol2">
    <calculate xid="calculate2">
     <expr xid="default13">js:$model.showTime($row)</expr></calculate> </col> </rule></div>  
    <!--     <div component="$UI/system/components/justep/data/bizData" xid="evePlacData"
      concept="OA_EvectionPlace" autoNew="false"> 
      <reader xid="default18" action="/OA/personalOffice/logic/action/queryOA_EvectionPlaceAction"/>  
      <writer xid="default19" action="/OA/personalOffice/logic/action/saveOA_EvectionPlaceAction"/>  
      <creator xid="default20" action="/OA/personalOffice/logic/action/createOA_EvectionPlaceAction"/>  
      <master xid="default21" data="evectionData" relation="fEvectionID"/>  
      <rule xid="rule3"> 

      </rule> 
    </div>   -->  
    <div component="$UI/system/components/justep/data/data" xid="numData" idColumn="croNum"
      autoNew="true"> 
      <column label="col0" name="croNum" type="String" xid="default4"/>  
      <column label="col1" name="appNum" type="String" xid="default5"/>  
      <column label="col2" name="parNum" type="String" xid="default6"/>  
      <column label="col3" name="cloNum" type="String" xid="default7"/>  
      <column label="col4" name="findStr" type="String" xid="default8"/> 
    </div> 
  </div>  
  <!--   <span component="$UI/system/components/justep/org/orgDialog" xid="orgSingleDialog"
    onReceive="orgSingleDialogReceive"/>  
  <span component="$UI/system/components/justep/org/orgDialog" xid="orgMutilDialog"
    multiSelection="true" onReceive="orgMutilDialogReceive"/>   -->  
  <span component="$UI/system/components/justep/windowDialog/windowDialog" xid="detailDialog"
    onReceive="detailDialogReceive" src="$UI/OA/personalOffice/process/evection/detailActivity.m.w"/>  
  <!--   <span component="$UI/system/components/justep/messageDialog/messageDialog"
    xid="closeMsgDlg" type="YesNo" onClose="closeMsgDlgClose" title="提示" message="是否取消当前操作？"/>   -->  
  <span component="$UI/system/components/justep/windowDialog/windowDialog" xid="newDialog"
    src="$UI/OA/personalOffice/process/evection/newActivity.m.w" onReceive="newDialogReceive"/>  
  <div component="$UI/system/components/justep/contents/contents" class="x-contents x-full"
    active="0" xid="contents" slidable="true" swipe="false"> 
    <div class="x-contents-content" xid="list"> 
      <div component="$UI/system/components/justep/panel/panel" class="x-panel x-full"
        xid="panel1"> 
        <div class="x-panel-top" xid="top1" > 
          <div component="$UI/system/components/justep/titleBar/titleBar" class="x-titlebar"
            xid="listTitleBar" title="出差管理"> 
            <div class="x-titlebar-left" xid="div1" style="width:40px;"> 
              <a component="$UI/system/components/justep/button/button" class="btn btn-link"
                xid="backBtn" style="width:40px;" icon="icon-chevron-left" onClick="backBtnClick"> 
                <i xid="i3" class="icon-chevron-left"/>  
                <span xid="span3"/> 
              </a> 
            </div>  
            <div class="x-titlebar-title" xid="div2">出差管理</div>  
            <div class="x-titlebar-right reverse" xid="div3" style="width:40px;"> 
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
            <div class="x-panel-top" xid="top2" > 
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
            <div class="x-panel-content x-scroll-view" xid="content4"> 
                <div class="x-scroll" component="$UI/system/components/justep/scrollView/scrollView"
                  xid="scrollView2"> 
                  <!--   <div class="x-pull-to-refresh" xid="div11"/>   -->  
                  <div class="x-content-center x-pull-down container" xid="div11"> 
                    <i class="x-pull-down-img glyphicon x-icon-pull-down"/>  
                    <span class="x-pull-down-label">下拉刷新...</span> 
                  </div>  
                  <div class="x-scroll-content" xid="div12"> 
                    <div xid="div7" class="title-row" bind-html="&quot;我审批 (&quot; + $model.numData.getValue('appNum') + &quot;)&quot;"
                      bind-visible="$model.numData.getValue('appNum')&gt;0">我审批</div>  
                    <div component="$UI/system/components/justep/list/list"
                      class="x-list" xid="approveList" data="evectionData" filter="js:$row.val('sGroupID') == 'A' &amp;&amp; $row.val('fStatus')== '未关闭' &amp;&amp; $model.dataFilter($row)"
                      limit="200" disablePullToRefresh="true" disableInfiniteLoad="true"
                      bind-click="listClick"> 
                      <ul class="x-list-template" xid="listTemplateUl5"> 
                        <li xid="li5" class="x-flex list-row"> 
                          <div xid="col32" class="head-pic-data"> 
                            <div class="x-blob" component="$UI/system/components/justep/org/orgImage"
                              xid="orgImage1" orgKind="person" bind-ref="ref('fCreatorID')"> 
                              <div class="x-blob-bar" xid="div5"> 
                                <i class="x-blob-edit icon-compose" xid="i1"/>  
                                <i class="x-blob-del icon-close-round" xid="i2"/> 
                              </div>  
                              <img class="x-blob-img x-autofill" xid="image1"/> 
                            </div>  
                            <div component="$UI/system/components/justep/output/output"
                              bind-visible="val('sMessageNumber') &gt; 0" class="x-output message-count"
                              xid="output81" bind-ref="ref('sMessageNumber')"/> 
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
                                bind-ref="ref('fName')"/>  
                              <div component="$UI/system/components/justep/output/output"
                                class="x-output right-content-data2" xid="col39"
                                bind-ref="ref('fApprove')" /> 

                            </div> 
                          </div> 
                        </li> 
                      </ul> 
                    </div>  
                    <div xid="div9" class="title-row" bind-visible="$model.numData.getValue('croNum')&gt;0"
                      bind-html="&quot;我发起 (&quot; + $model.numData.getValue('croNum') + &quot;)&quot;">我发起</div>  
                    <div component="$UI/system/components/justep/list/list"
                      class="x-list" xid="createList" data="evectionData" limit="200"
                      disablePullToRefresh="true" disableInfiniteLoad="true" filter="js:$row.val('sGroupID') == 'C' &amp;&amp; $row.val('fStatus')== '未关闭' &amp;&amp; $model.dataFilter($row)"
                      bind-click="listClick"> 
                      <ul class="x-list-template" xid="listTemplateUl7"> 
                        <li xid="li7" class="x-flex list-row"> 
                          <div xid="col10" class="head-pic-data"> 
                            <div class="x-blob" component="$UI/system/components/justep/org/orgImage"
                              xid="orgImage2" orgKind="person" bind-ref="ref('fCreatorID')"> 
                              <div class="x-blob-bar" xid="div6"> 
                                <i class="x-blob-edit icon-compose" xid="i5"/>  
                                <i class="x-blob-del icon-close-round" xid="i6"/> 
                              </div>  
                              <img class="x-blob-img x-autofill" xid="image2"/> 
                            </div>  
                            <div component="$UI/system/components/justep/output/output"
                              bind-visible="val('sMessageNumber') &gt; 0" class="x-output message-count"
                              xid="output82" bind-ref="ref('sMessageNumber')"/> 
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
                                bind-ref="ref('fName')"/>  
                              <div component="$UI/system/components/justep/output/output"
                                class="x-output right-content-data2" xid="col18"
                                bind-ref="ref('fApprove')" /> 
                     
                            </div> 
                          </div> 
                        </li> 
                      </ul> 
                    </div>  
                    <div xid="div8" class="title-row" bind-visible="$model.numData.getValue('parNum')&gt;0"
                      bind-html="&quot;我相关 (&quot; + $model.numData.getValue('parNum') + &quot;)&quot;">我相关</div>  
                    <div component="$UI/system/components/justep/list/list"
                      class="x-list" xid="parList" data="evectionData" limit="200"
                      disablePullToRefresh="true" disableInfiniteLoad="true" filter="js:$row.val('sGroupID') == 'P' &amp;&amp; $row.val('fStatus')== '未关闭' &amp;&amp; $model.dataFilter($row)"
                      bind-click="listClick"> 
                      <ul class="x-list-template" xid="listTemplateUl6"> 
                        <li xid="li6" class="x-flex list-row"> 
                          <div xid="col1" class="head-pic-data"> 
                            <div class="x-blob" component="$UI/system/components/justep/org/orgImage"
                              xid="orgImage3" orgKind="person" bind-ref="ref('fCreatorID')"> 
                              <div class="x-blob-bar" xid="div14"> 
                                <i class="x-blob-edit icon-compose" xid="i9"/>  
                                <i class="x-blob-del icon-close-round" xid="i10"/> 
                              </div>  
                              <img class="x-blob-img x-autofill" xid="image3"/> 
                            </div>  
                            <div component="$UI/system/components/justep/output/output"
                              bind-visible="val('sMessageNumber') &gt; 0" class="x-output message-count"
                              xid="output83" bind-ref="ref('sMessageNumber')"/> 
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
                                bind-ref="ref('fName')"/>  
                              <div component="$UI/system/components/justep/output/output"
                                class="x-output right-content-data2" xid="col391"
                                bind-ref="ref('fApprove')" /> 
                       
                            </div> 
                          </div> 
                        </li> 
                      </ul> 
                    </div>  
                    <div xid="div10" class="title-row" bind-html="&quot;已审批 (&quot; + $model.numData.getValue('cloNum') + &quot;)&quot;"
                      bind-visible="$model.numData.getValue('cloNum') &gt; 0">已审批</div>  
                    <div component="$UI/system/components/justep/list/list"
                      class="x-list" xid="cloList" data="closeData" limit="6" bind-click="cloListClick"
                      filter="js:$model.dataFilter($row)"> 
                      <ul class="x-list-template" xid="listTemplateUl8"> 
                        <li xid="li8" class="x-flex close-list-row"> 
                          <div xid="col19" class="head-pic-data"> 
                            <div class="x-blob" component="$UI/system/components/justep/org/orgImage"
                              xid="orgImage4" orgKind="person" bind-ref="ref('fCreatorID')"> 
                              <div class="x-blob-bar" xid="div15"> 
                                <i class="x-blob-edit icon-compose" xid="i11"/>  
                                <i class="x-blob-del icon-close-round" xid="i12"/> 
                              </div>  
                              <img class="x-blob-img x-autofill" xid="image4"/> 
                            </div>  
                            <div component="$UI/system/components/justep/output/output"
                              bind-visible="val('sMessageNumber') &gt; 0" class="x-output message-count"
                              xid="output84" bind-ref="ref('sMessageNumber')"/> 
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
                                bind-ref="ref('fName')"/>  
                              <div component="$UI/system/components/justep/output/output"
                                class="x-output right-content-data2" xid="col40"
                                bind-ref="ref('fApprove')" /> 
                      
                            </div> 
                          </div> 
                        </li> 
                      </ul> 
                    </div> 
                  </div>  
                  <div class="x-content-center x-pull-up" xid="div13"> 
                    <span class="x-pull-up-label">加载更多...</span> 
                  </div>  
                  <!--                   <div class="x-infinite-load" xid="div13"> 
                    <span class="x-pull-up-label" xid="span5">加载更多...</span> 
                  </div>  --> 
                </div> 
            </div> 
          </div> 
        </div> 
      </div> 
    </div>  
  </div> 
</div>
