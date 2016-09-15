<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window oa" component="$UI/system/components/justep/window/window">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="width:102px;height:auto;left:319px;top:206px;"
    onLoad="modelLoad"> 
    <div component="$UI/system/components/justep/data/bizData" xid="taskData"
      concept="OA_TasksAssigned" autoLoad="true" limit="-1" confirmDelete="false"
      orderBy="fLastModifyTime desc"> 
      <reader xid="default1" action="/OA/personalOffice/logic/action/queryOA_TasksAssignedOpAction"/>  
      <writer xid="default2" action="/OA/personalOffice/logic/action/saveOA_TasksAssignedAction"/>  
      <creator xid="default3" action="/OA/personalOffice/logic/action/createOA_TasksAssignedAction"/> 
    <calculateRelation relation="fShowTime" xid="calculateRelation1"></calculateRelation>
  <rule xid="rule2">
   <col name="fShowTime" xid="ruleCol2">
    <calculate xid="calculate2">
     <expr xid="default14">js:$model.showTime($row)</expr></calculate> </col> </rule></div>  
    <div component="$UI/system/components/justep/data/bizData" xid="closeData"
      concept="OA_TasksAssigned" limit="6" onAfterRefresh="closeDataAfterRefresh"
      orderBy="fLastModifyTime desc"> 
      <reader xid="default9" action="/OA/personalOffice/logic/action/queryOA_TasksAssignedClAction"/>  
      <writer xid="default10" action="/OA/personalOffice/logic/action/saveOA_TasksAssignedAction"/>  
      <creator xid="default11" action="/OA/personalOffice/logic/action/createOA_TasksAssignedAction"/> 
    <calculateRelation relation="fShowTime" xid="calculateRelation2"></calculateRelation>
  <rule xid="rule3">
   <col name="fShowTime" xid="ruleCol3">
    <calculate xid="calculate3">
     <expr xid="default15"><![CDATA[js:$model.showTime($row)]]></expr></calculate> </col> </rule></div>  
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
    <div component="$UI/system/components/justep/data/data" xid="numData" idColumn="attNum"
      autoNew="true"> 
      <column label="col0" name="attNum" type="String" xid="default4"/>  
      <column label="col1" name="parNum" type="String" xid="default5"/>  
      <column label="col2" name="exeNum" type="String" xid="default6"/>  
      <column label="col3" name="creNum" type="String" xid="default7"/>  
      <column label="col4" name="cloNum" type="String" xid="default8"/>  
      <column label="col5" name="findStr" type="String" xid="default12"/> 
    </div> 
  </div>  
  <!--   <span component="$UI/system/components/justep/org/orgDialog" xid="orgSingleDialog"
    onReceive="orgSingleDialogReceive"/>  
  <span component="$UI/system/components/justep/org/orgDialog" xid="orgMutilDialog"
    multiSelection="true" onReceive="orgMutilDialogReceive"/>   -->  
  <span component="$UI/system/components/justep/windowDialog/windowDialog" xid="detailDialog"
    src="$UI/OA/personalOffice/process/tasksAssigned/detailActivity.m.w" onReceive="detailDialogReceive"/>  
  <!--   <span component="$UI/system/components/justep/messageDialog/messageDialog"
    xid="closeMsgDlg" type="YesNo" onClose="closeMsgDlgClose" title="提示" message="是否取消当前操作？"/>   -->  
  <span component="$UI/system/components/justep/windowDialog/windowDialog" xid="newDialog"
    src="$UI/OA/personalOffice/process/tasksAssigned/newActivity.m.w" onReceive="newDialogReceive"/>  
  <div component="$UI/system/components/justep/contents/contents" class="x-contents x-full"
    active="0" xid="contents" slidable="true" swipe="false"> 
    <div class="x-contents-content" xid="list"> 
      <div component="$UI/system/components/justep/panel/panel" class="x-panel x-full"
        xid="panel1"> 
        <div class="x-panel-top" xid="top1" > 
          <div component="$UI/system/components/justep/titleBar/titleBar" class="x-titlebar"
            xid="listTitleBar" title="工作交办"> 
            <div class="x-titlebar-left" xid="div1" style="width:83px;"> 
              <a component="$UI/system/components/justep/button/button" class="btn btn-link"
                xid="backBtn" style="width:40px;" icon="icon-chevron-left" onClick="backBtnClick"> 
                <i xid="i3" class="icon-chevron-left"/>  
                <span xid="span3"/> 
              </a> 
            </div>  
            <div class="x-titlebar-title" xid="div2">工作交办</div>  
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
					      <i class="x-pull-down-img glyphicon x-icon-pull-down"></i>
					      <span class="x-pull-down-label">下拉刷新...</span>
					</div>
                  
                  <div class="x-scroll-content" xid="div12"> 
                    <div xid="div6" class="title-row" bind-visible="$model.numData.getValue('attNum')&gt;0"
                      bind-html="&quot;我关注（&quot; + $model.numData.getValue('attNum') + &quot;）&quot;"/>  
                    <div component="$UI/system/components/justep/list/list"
                      class="x-list" xid="attList" data="taskData" bind-click="listClick"
                      disableInfiniteLoad="true" disablePullToRefresh="true" filter="js:$row.val('sActive') ==  1 &amp;&amp; $row.val('fStatus')== '未关闭' &amp;&amp; $model.dataFilter($row)"
                      limit="200"> 
                      <ul class="x-list-template" xid="listTemplateUl4"> 
                        <li xid="li4" class="x-flex list-row"> 
                          <div xid="col21" class="head-pic-data"> 
                            <div class="x-blob" component="$UI/system/components/justep/org/orgImage"
                              xid="orgImage1" bind-ref="ref('fCreatorID')" orgKind="person"> 
                              <div class="x-blob-bar" xid="div5"> 
                                <i class="x-blob-edit icon-compose" xid="i5"/>  
                                <i class="x-blob-del icon-close-round" xid="i6"/> 
                              </div>  
                              <img class="x-blob-img x-autofill" xid="image7"/> 
                            </div>  
                            <div component="$UI/system/components/justep/output/output"
                              bind-visible="val('sMessageNumber') &gt; 0" class="x-output message-count"
                              xid="output81" bind-ref="ref('sMessageNumber')"/> 
                          </div>  
                          <div class="x-flex1" xid="col23"> 
                            <div _component="$UI/system/components/justep/row/row"
                              class="x-flex" xid="row8"> 
                              <div component="$UI/system/components/justep/output/output"
                                class="x-flex1 x-output title-data" xid="output6"
                                bind-ref="ref('fName')"/>  
                              <div component="$UI/system/components/justep/output/output"
                                class="x-output right-content-data" xid="output2"
                                bind-ref="ref('fShowTime')"/>  
                              <img src="img/star.png" alt="" xid="image21"
                                class="star-data"/> 
                            </div>  
                            <div _component="$UI/system/components/justep/row/row"
                              _class="x-row" xid="row9" class="x-flex"> 
                              <div component="$UI/system/components/justep/output/output"
                                class="x-flex1 x-output content-data" xid="output7"
                                bind-ref="ref('fContent')"/>  
                              <div xid="div14" style="width:70px;"/> 
                            </div> 
                          </div> 
                        </li> 
                      </ul> 
                    </div>  
                    <div xid="div7" class="title-row" bind-html="&quot;我负责（&quot; + $model.numData.getValue('exeNum') + &quot;）&quot;"
                      bind-visible="$model.numData.getValue('exeNum')&gt;0">我负责</div>  
                    <div component="$UI/system/components/justep/list/list"
                      class="x-list" xid="exeList" data="taskData" bind-click="listClick"
                      filter="js:$row.val('sGroupID') == 'A' &amp;&amp; $row.val('sActive')!= 1  &amp;&amp; $row.val('fStatus')== '未关闭' &amp;&amp; $model.dataFilter($row)"
                      limit="200" disablePullToRefresh="true" disableInfiniteLoad="true"> 
                      <ul class="x-list-template" xid="listTemplateUl5"> 
                        <li xid="li5" class="x-flex list-row"> 
                          <div xid="col32" class="head-pic-data "> 
                            <div class="x-blob" component="$UI/system/components/justep/org/orgImage"
                              xid="orgImage2" bind-ref="ref('fCreatorID')" orgKind="person"> 
                              <div class="x-blob-bar" xid="div15"> 
                                <i class="x-blob-edit icon-compose" xid="i1"/>  
                                <i class="x-blob-del icon-close-round" xid="i2"/> 
                              </div>  
                              <img class="x-blob-img x-autofill" xid="image1"/> 
                            </div>  
                            <div component="$UI/system/components/justep/output/output"
                              bind-visible="val('sMessageNumber') &gt; 0" class="x-output message-count"
                              xid="output82" bind-ref="ref('sMessageNumber')"/> 
                          </div>  
                          <div class="x-flex1" xid="col33"> 
                            <div _component="$UI/system/components/justep/row/row"
                              class="x-flex" xid="row11"> 
                              <div component="$UI/system/components/justep/output/output"
                                class="x-flex1 x-output title-data" xid="output9"
                                bind-ref="ref('fName')"/>  
                              <div component="$UI/system/components/justep/output/output"
                                class="x-output right-content-data" xid="output11"
                                bind-ref="ref('fShowTime')"/> 
                            </div>  
                            <div _component="$UI/system/components/justep/row/row"
                              class="x-flex" xid="row12"> 
                              <div component="$UI/system/components/justep/output/output"
                                class="x-flex1 x-output content-data" xid="output10"
                                bind-ref="ref('fContent')"/>  
                              <div xid="col39" style="width:70px;"/> 
                            </div> 
                          </div> 
                        </li> 
                      </ul> 
                    </div>  
                    <div xid="div8" class="title-row" bind-visible="$model.numData.getValue('parNum')&gt;0"
                      bind-html="&quot;我参与（&quot; + $model.numData.getValue('parNum') + &quot;）&quot;">我参与</div>  
                    <div component="$UI/system/components/justep/list/list"
                      class="x-list" xid="parList" data="taskData" bind-click="listClick"
                      limit="200" disablePullToRefresh="true" disableInfiniteLoad="true"
                      filter="js:$row.val('sGroupID') == 'P' &amp;&amp; $row.val('sActive')!= 1  &amp;&amp; $row.val('fStatus')== '未关闭' &amp;&amp; $model.dataFilter($row)"> 
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
                            <div component="$UI/system/components/justep/output/output"
                              bind-visible="val('sMessageNumber') &gt; 0" class="x-output message-count"
                              xid="output83" bind-ref="ref('sMessageNumber')"/> 
                          </div>  
                          <div class="x-flex1" xid="col3"> 
                            <div _component="$UI/system/components/justep/row/row"
                              class="x-flex" xid="row2"> 
                              <div component="$UI/system/components/justep/output/output"
                                class="x-flex1 x-output title-data" xid="output13"
                                bind-ref="ref('fName')"/>  
                              <div component="$UI/system/components/justep/output/output"
                                class="x-output right-content-data" xid="output14"
                                bind-ref="ref('fShowTime')"/> 
                            </div>  
                            <div _component="$UI/system/components/justep/row/row"
                              class="x-flex" xid="row3"> 
                              <div component="$UI/system/components/justep/output/output"
                                class="x-flex1 x-output content-data" xid="output15"
                                bind-ref="ref('fContent')"/>  
                              <div xid="col391" style="width:70px;"/> 
                            </div> 
                          </div> 
                        </li> 
                      </ul> 
                    </div>  
                    <div xid="div9" class="title-row" bind-visible="$model.numData.getValue('creNum')&gt;0"
                      bind-html="&quot;我委托（&quot; + $model.numData.getValue('creNum') + &quot;）&quot;">我委托</div>  
                    <div component="$UI/system/components/justep/list/list"
                      class="x-list" xid="creList" data="taskData" bind-click="listClick"
                      limit="200" disablePullToRefresh="true" disableInfiniteLoad="true"
                      filter="js:$row.val('sGroupID') == 'C' &amp;&amp; $row.val('sActive')!= 1 &amp;&amp; $row.val('fStatus')== '未关闭' &amp;&amp; $model.dataFilter($row)"> 
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
                            <div component="$UI/system/components/justep/output/output"
                              bind-visible="val('sMessageNumber') &gt; 0" class="x-output message-count"
                              xid="output84" bind-ref="ref('sMessageNumber')"/> 
                          </div>  
                          <div xid="col12" class="x-flex1"> 
                            <div _component="$UI/system/components/justep/row/row"
                              class="x-flex" xid="row5"> 
                              <div component="$UI/system/components/justep/output/output"
                                class="x-flex1 x-output title-data" xid="output1"
                                bind-ref="ref('fName')"/>  
                              <div component="$UI/system/components/justep/output/output"
                                class="x-output right-content-data" xid="output3"
                                bind-ref="ref('fShowTime')"/> 
                            </div>  
                            <div _component="$UI/system/components/justep/row/row"
                              class="x-flex" xid="row6"> 
                              <div component="$UI/system/components/justep/output/output"
                                class="x-flex1 x-output content-data" xid="output4"
                                bind-ref="ref('fContent')"/>  
                              <div xid="col18" style="width:70px;"/> 
                            </div> 
                          </div> 
                        </li> 
                      </ul> 
                    </div>  
                    <div xid="div10" class="title-row" bind-html="&quot;已关闭（&quot; + $model.numData.getValue('cloNum') + &quot;）&quot;"
                      bind-visible="$model.numData.getValue('cloNum') &gt; 0">已关闭</div>  
                    <div component="$UI/system/components/justep/list/list"
                      class="x-list" xid="cloList" data="closeData" limit="6" bind-click="cloListClick"
                      filter="js:$model.dataFilter($row)"> 
                      <ul class="x-list-template" xid="listTemplateUl8"> 
                        <li xid="li8" class="x-flex close-list-row"> 
                          <div xid="col19" class="head-pic-data "> 
                            <div class="x-blob" component="$UI/system/components/justep/org/orgImage"
                              xid="orgImage5" bind-ref="ref('fCreatorID')"
                              orgKind="person"> 
                              <div class="x-blob-bar" xid="div18"> 
                                <i class="x-blob-edit icon-compose" xid="i13"/>  
                                <i class="x-blob-del icon-close-round" xid="i14"/> 
                              </div>  
                              <img class="x-blob-img x-autofill" xid="image5"/> 
                            </div>  
                            <div component="$UI/system/components/justep/output/output"
                              bind-visible="val('sMessageNumber') &gt; 0" class="x-output message-count"
                              xid="output85" bind-ref="ref('sMessageNumber')"/> 
                          </div>  
                          <div xid="col22" class="x-flex1"> 
                            <div _component="$UI/system/components/justep/row/row"
                              class="x-flex" xid="row14"> 
                              <div component="$UI/system/components/justep/output/output"
                                class="x-flex1 x-output title-data" xid="output17"
                                bind-ref="ref('fName')"/>  
                              <div component="$UI/system/components/justep/output/output"
                                class="x-output right-content-data" xid="output19"
                                bind-ref="ref('fShowTime')" style="float:right;"/>  
                              <img src="img/star.png" alt="" xid="image2"
                                class="star-data" bind-visible="val('sActive') == 1"/> 
                            </div>  
                            <div _component="$UI/system/components/justep/row/row"
                              xid="row15" class="x-flex"> 
                              <div component="$UI/system/components/justep/output/output"
                                class="x-flex1 x-output content-data" xid="output18"
                                bind-ref="ref('fContent')"/>  
                              <div xid="col40"> 
                                <div xid="div25" style="width:70px;"/> 
                              </div> 
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
</div>
