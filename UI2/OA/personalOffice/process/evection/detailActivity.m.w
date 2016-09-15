<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window" component="$UI/system/components/justep/window/window">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="width:109px;height:auto;left:470px;top:226px;"> 
    <div component="$UI/system/components/justep/data/bizData" xid="detailData"
      concept="OA_Evection" autoLoad="false" confirmDelete="false" autoNew="false"
      onBeforeSave="detailDataBeforeSave" confirmRefresh="false"> 
      <reader xid="default1" action="/OA/personalOffice/logic/action/queryOA_EvectionAction"/>  
      <writer xid="default2" action="/OA/personalOffice/logic/action/saveOA_EvectionAction"/>  
      <creator xid="default3" action="/OA/personalOffice/logic/action/createOA_EvectionAction"/>  
      <calculateRelation relation="fShowTime" xid="calculateRelation2"/>  
      <calculateRelation relation="fTimePeriod" xid="calculateRelation3"/>  
      <rule xid="rule1"> 
        <col name="fTimePeriod" xid="ruleCol1"> 
          <calculate xid="calculate1"> 
            <expr xid="default4"><![CDATA[js: justep.Date.toString($row.val("fStartDate"),'MM月dd日') + ' 至 ' +  justep.Date.toString($row.val("fEndDate"),'MM月dd日')]]></expr>
          </calculate> 
        </col> 
      </rule>
    </div>  
    <div component="$UI/system/components/justep/data/bizData" xid="evePlaceData"
      concept="OA_EvectionPlace" autoLoad="true"> 
      <reader xid="default5" action="/OA/personalOffice/logic/action/queryOA_EvectionPlaceAction"/>  
      <writer xid="default6" action="/OA/personalOffice/logic/action/saveOA_EvectionPlaceAction"/>  
      <creator xid="default7" action="/OA/personalOffice/logic/action/createOA_EvectionPlaceAction"/>  
      <master xid="default8" data="detailData" relation="fEvectionID"/>  
      <calculateRelation relation="fTimePeriod" xid="calculateRelation4"/>  
      <rule xid="rule2"> 
        <col name="fTimePeriod" xid="ruleCol2"> 
          <calculate xid="calculate2"> 
            <expr xid="default15"><![CDATA[js: justep.Date.toString($row.val("fStartDate"),'MM月dd日') + ' 至 ' +  justep.Date.toString($row.val("fEndDate"),'MM月dd日')]]></expr>
          </calculate> 
        </col> 
      </rule>
    </div>  
    <div component="$UI/system/components/justep/data/bizData" xid="socialData"
      concept="SA_Social" autoLoad="false" limit="-1" orderBy="sCreateTime asc"> 
      <reader xid="default9" action="/system/logic/action/querySocialAction"/>  
      <writer xid="default10" action="/system/logic/action/saveSocialAction"/>  
      <creator xid="default11" action="/system/logic/action/createSocialAction"/>  
      <master xid="default12"/>  
      <filter name="filter0" xid="filter1"><![CDATA[SA_Social.sGroupID = 'A' and SA_Social.sESField01 is not null]]></filter>  
      <calculateRelation relation="fMemo" xid="calculateRelation1"/>  
      <rule xid="rule6"> 
        <col name="fMemo" xid="ruleCol6"> 
          <calculate xid="calculate5"> 
            <expr xid="default19"><![CDATA[js: $row.val('sESField01') + ($row.val('sESField02')?'：'+$row.val('sESField02'):'') + '（'+ justep.Date.toString($row.val('sCreateTime'),'hh:mm') + '）']]></expr> 
          </calculate> 
        </col> 
      </rule> 
    </div>  
    <div component="$UI/system/components/justep/data/data" xid="commonData"
      idColumn="content" autoNew="true"> 
      <column label="col0" name="content" type="String" xid="default13"/>  
      <column label="col1" name="groupID" type="String" xid="default14"/> 
    </div> 
  </div>  
  <span component="$UI/system/components/justep/windowReceiver/windowReceiver"
    xid="windowReceiver" onReceive="windowReceiverReceive" style="top:419px;left:-2px;"/>  
  <div component="$UI/system/components/justep/contents/contents" class="x-contents x-full"
    active="0" xid="contents1"> 
    <div class="x-contents-content" xid="detail"> 
      <div component="$UI/system/components/justep/panel/panel" class="x-panel x-full"
        xid="panel1"> 
        <div class="x-panel-top" xid="top1"> 
          <div component="$UI/system/components/justep/titleBar/titleBar" class="x-titlebar"
            xid="titleBar2" title="出差详情"> 
            <div class="x-titlebar-left" xid="div4" style="width:57px;"> 
              <a component="$UI/system/components/justep/button/button" class="btn btn-link"
                xid="listBtn" onClick="listBtnClick" icon="icon-chevron-left" style="width:40px;"> 
                <i xid="i1" class="icon-chevron-left"/>  
                <span xid="span1"/> 
              </a>  
              <div component="$UI/system/components/justep/bar/bar" class="x-bar"
                xid="bar1" style="width:99px;"/> 
            </div>  
            <div class="x-titlebar-title" xid="div5">出差详情</div>  
            <div class="x-titlebar-right reverse" xid="div6"> 
              <a component="$UI/system/components/justep/button/button" class="btn btn-link"
                xid="approveBtn" label="审批" style="width:59px;" onClick="approveBtnClick"
                bind-visible="$model.commonData.val('groupID') == 'A' &amp;&amp; $model.detailData.val('fStatus') == '未关闭'"> 
                <i xid="i2"/>  
                <span xid="span2">审批</span> 
              </a> 
            </div> 
          </div> 
        </div>  
        <div class="x-panel-content" xid="content3"> 
          <div class="media" xid="div7"> 
            <a class="pull-left content-head-pic" href="#" style="margin-right:0px;"
              xid="a2"> 
              <div class="media-object x-blob" component="$UI/system/components/justep/org/orgImage"
                xid="orgImage1" bind-ref="detailData.ref('fCreatorID')" orgKind="person"> 
                <div class="x-blob-bar" xid="div18" title="7"> 
                  <i class="x-blob-edit icon-compose" xid="i7"/>  
                  <i class="x-blob-del icon-close-round" xid="i8"/> 
                </div>  
                <img class="x-blob-img x-autofill" xid="image1"/> 
              </div> 
            </a>  
            <div class="media-body" xid="div8"> 
              <div xid="div9" class="content-first-row"> 
                <div component="$UI/system/components/justep/output/output"
                  class="x-output title-data" xid="output6" bind-ref="detailData.ref('fCreator')"/> 
              </div>  
              <div component="$UI/system/components/justep/output/output" class="x-output content-data content-row"
                xid="output7" bind-ref="detailData.ref('fShowTime')"/>  
              <div xid="div3" class="input-group input-group-row"> 
                <span xid="span4" class="input-group-addon" style="color:#92BEE7;padding-right:0px;"> 
                  <i xid="i3" class="icon-plane"/> 
                </span>  
                <span xid="span41" class="input-group-addon" style="padding-left:6px;"><![CDATA[出差地点]]></span>  
                <div component="$UI/system/components/justep/output/output"
                  class="form-control x-output" xid="output8" bind-ref="detailData.ref('fPlace')"/> 
              </div>  
              <div xid="div2" class="input-group  input-group-row"> 
                <span xid="span3" class="input-group-addon" style="color:#92BEE7;padding-right:0px;"> 
                  <i xid="i6" class="icon-android-alarm"/> 
                </span>  
                <span xid="span31" class="input-group-addon" style="padding-left:5px;"><![CDATA[出差时间]]></span>  
                <div component="$UI/system/components/justep/output/output"
                  class="form-control x-output" xid="output91" bind-ref="detailData.ref('fTimePeriod')"/> 
              </div>  
              <ul bind-foreach="evePlaceData.datas" xid="ul1"> 
                <li xid="li2"> 
                  <div xid="div25" class="input-group input-group-row"> 
                    <span xid="span75" class="input-group-addon" style="color:#92BEE7;padding-right:0px;"> 
                      <i xid="i31" class="icon-plane"/> 
                    </span>  
                    <span xid="span752" class="input-group-addon" style="padding-left:6px;"><![CDATA[出差地点]]></span>  
                    <div component="$UI/system/components/justep/output/output"
                      xid="output2" bind-ref="ref('fPlace')" class="form-control x-output"/> 
                  </div>  
                  <div xid="div251" class="input-group input-group-row"> 
                    <span xid="span751" class="input-group-addon" style="color:#92BEE7;padding-right:0px;"> 
                      <i xid="i9" class="icon-android-alarm"/> 
                    </span>  
                    <span xid="span753" class="input-group-addon" style="padding-left:5px;"><![CDATA[出差时间]]></span>  
                    <div component="$UI/system/components/justep/output/output"
                      class="form-control x-output" xid="output41" bind-ref="ref('fTimePeriod')"/> 
                  </div> 
                </li> 
              </ul>  
              <div component="$UI/system/components/justep/output/output" class="x-output input-row50"
                xid="output5" bind-ref="detailData.ref('fContent')"/>  
              <div xid="div1"> 
                <div component="$UI/system/components/justep/attachment/attachment"
                  access="d" xid="attachment1" bind-ref="detailData.ref('fAttachment')"> 
                  <div class="x-attachment" xid="div10" data-bind="visible: $attachmentItems.get().length &gt; 0"> 
                    <div class="x-attachment-content x-card-border" xid="div14"> 
                      <div class="x-doc-process" xid="div15"> 
                        <div class="progress-bar x-doc-process-bar" role="progressbar"
                          style="width:0%;" xid="div16"/>
                      </div>  
                      <div data-bind="foreach:$attachmentItems" xid="div17"> 
                        <div class="x-attachment-cell" xid="div19"> 
                          <div class="x-attachment-item x-item-other" data-bind="click:$model.previewOrRemoveItem.bind($model),style:{opacity: $model.$access.get() % 4 &gt;= 2 || $model.$state.get() == 'remove' ? '1.0' : '0.5',backgroundImage:($model.previewPicture.bind($model,$object))()}"
                            xid="div20"> 
                            <a data-bind="visible:$model.$state.get() == 'remove'"
                              class="x-remove-barget" xid="a1"/>
                          </div> 
                        </div> 
                      </div>  
                      <div class="x-attachment-cell" data-bind="visible:$state.get() == 'upload' &amp;&amp; ($limit.get() == '-1' || $limit.get() &gt; $attachmentItems.get().length)"
                        xid="div21"> 
                        <div class="x-attachment-item x-item-upload" data-bind="visible:$state.get() == 'upload' &amp;&amp; $access.get() % 512 &gt;= 256"
                          xid="div22"/>
                      </div>  
                      <div class="x-attachment-cell" data-bind="visible:$state.get() == 'upload' &amp;&amp; $attachmentItems.get().length &gt; 0"
                        xid="div23"> 
                        <div class="x-attachment-item x-item-remove" data-bind="click:changeState.bind($object,'remove'),visible:$access.get() % 2048 &gt;= 1024"
                          xid="div24"/>
                      </div>  
                      <div style="clear:both;" xid="div26"/>
                    </div> 
                  </div> 
                </div>
              </div>  
              <div class="x-ros x-ros-border" component="$UI/system/components/justep/social/relativeOrg/relativeOrgs"
                xid="relativeOrgs" data="detailData" bind-nameRef="detailData.ref('fName')"> 
                <div component="$UI/system/components/justep/data/bizData"
                  concept="SA_Social" xid="bizData2"/>  
                <div class="x-ros-item" groupName="审批人" groupID="A" limit="20"
                  filter="" multiSelection="false" statusEnabled="true" readonly="js:true"
                  xid="item1"/>  
                <div class="x-ros-item" groupName="知会相关人" groupID="P" limit="20"
                  filter="" multiSelection="true" statusEnabled="true" readonly="js:commonData.val('groupID')!='C' || $model.detailData.val('fStatus') == '已关闭'"
                  xid="item2"/> 
              </div>  
              <div component="$UI/system/components/justep/list/list" class="x-list"
                xid="Approvelist" data="socialData" autoLoad="false"> 
                <ul class="x-list-template" xid="listTemplateUl1"> 
                  <li xid="li1"> 
                    <!--                       <div _component="$UI/system/components/justep/row/row"
                        class="x-flex" xid="row6" style="min-height:35px;"> 
                        <div xid="col14" style="width:30px"> 
                          <span component="$UI/system/components/justep/button/checkbox"
                            class="x-checkbox" xid="checkbox3" checked="true" disabled="true"/> 
                        </div>  
                        <div xid="col17" class="x-flex1"> 
                          <div component="$UI/system/components/justep/output/output"
                            class="x-output " xid="appoutput7" bind-ref="ref('fMemo')"/> 
                        </div> 
                      </div>  -->  
                    <div component="$UI/system/components/justep/row/row" class="x-row"
                      xid="row6"> 
                      <div xid="col14" class="x-col x-col-fixed" style="width:auto;"> 
                        <span component="$UI/system/components/justep/button/checkbox"
                          class="x-checkbox" xid="checkbox3" checked="true" disabled="true"/> 
                      </div>  
                      <div xid="col141" class="x-col x-col-fixed" style="width:auto;"> 
                        <div component="$UI/system/components/justep/output/output"
                          class="x-output" xid="output3" bind-ref="ref('sPersonName')"
                          style="font-weight:bold;"/> 
                      </div>  
                      <div xid="col17" class="x-col"> 
                        <div component="$UI/system/components/justep/output/output"
                          class="x-output " xid="appoutput7" bind-ref="ref('fMemo')"/> 
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
    <div class="x-contents-content" xid="approve"> 
      <div component="$UI/system/components/justep/panel/panel" class="x-panel x-full"
        xid="panel2"> 
        <div class="x-panel-top" xid="top2"> 
          <div component="$UI/system/components/justep/titleBar/titleBar" class="x-titlebar"
            xid="titleBar1" title="审批"> 
            <div class="x-titlebar-left" xid="div11" style="width:40px;"> 
              <a component="$UI/system/components/justep/button/button" class="btn btn-link"
                xid="backDetBtn" icon="icon-chevron-left" onClick="backDetBtnClick"
                style="width:40px;"> 
                <i xid="i5" class="icon-chevron-left"/>  
                <span xid="span5"/> 
              </a> 
            </div>  
            <div class="x-titlebar-title" xid="div12">审批</div>  
            <div class="x-titlebar-right reverse" xid="div13"/> 
          </div> 
        </div>  
        <div class="x-panel-content" xid="content4"> 
          <textarea component="$UI/system/components/justep/textarea/textarea" class="form-control input-row"
            xid="textarea1" style="height:95px;" bind-ref="commonData.ref('content')"
            placeHolder="请输入文字内容"/>  
          <div component="$UI/system/components/justep/controlGroup/controlGroup"
            class="x-control-group" title="title" xid="controlGroup1"> 
            <div component="$UI/system/components/justep/row/row" xid="notAgreeRow1"
              class="x-row"> 
              <!--    <div class="x-col x-col-33 approve-left" xid="col2" >不同意</div>  
              <div class="x-col x-col-offset-10 approve-right" xid="col3">关闭并结束审批</div>  --> 
            </div>  
            <div component="$UI/system/components/justep/row/row" xid="notAgreeRow"
              class="x-row approve" bind-click="notAgreeRowClick"> 
              <div class="x-col x-col-33 approve-left" xid="col2">不同意</div>  
              <div class="x-col x-col-offset-10 approve-right" xid="col3">关闭并结束审批</div> 
            </div>  
            <div component="$UI/system/components/justep/row/row" class="x-row approve"
              xid="approvalRow" bind-click="approvalRowClick"> 
              <div class="x-col x-col-33 approve-left" xid="col5">审　核</div>  
              <div class="x-col x-col-offset-10 approve-right" xid="col6">提交下一级审批</div> 
            </div>  
            <div component="$UI/system/components/justep/row/row" class="x-row approve"
              xid="apprvedRow" bind-click="apprvedRowClick"> 
              <div class="x-col x-col-33 approve-left" xid="col8">批　准</div>  
              <div class="x-col x-col-offset-10 approve-right" xid="col9">完成审批</div> 
            </div> 
          </div> 
        </div> 
      </div> 
    </div>  
    <!--     <div class="x-contents-content" xid="choicePsm"> 
      <div component="$UI/system/components/justep/panel/panel" class="x-panel x-full"
        xid="panel3"> 
        <div class="x-panel-top" xid="top3"> 
          <div component="$UI/system/components/justep/titleBar/titleBar" class="x-titlebar"
            xid="titleBar3" title="审批"> 
            <div class="x-titlebar-left" xid="div14"> 
              <a component="$UI/system/components/justep/button/button" class="btn btn-link"
                xid="backAppBut" icon="icon-chevron-left" onClick="backAppButClick"> 
                <i xid="i10" class="icon-chevron-left"/>  
                <span xid="span6"/> 
              </a> 
            </div>  
            <div class="x-titlebar-title" xid="div15">审批</div>  
            <div class="x-titlebar-right reverse" xid="div16"> 
              <a component="$UI/system/components/justep/button/button" class="btn btn-link"
                xid="saveBut" icon="icon-checkmark-round" bind-click="saveButClick"> 
                <i xid="i11" class="icon-checkmark-round"/>  
                <span xid="span7"/> 
              </a> 
            </div> 
          </div> 
        </div>  
        <div class="x-panel-content" xid="content2"> 
                    <div component="$UI/system/components/justep/controlGroup/controlGroup"
            class="x-control-group" title="title" xid="controlGroup2" style="height:286px;"> 
            <div class="x-ro x-ro-border" component="$UI/system/components/justep/social/relativeOrg/relativeOrg"
              xid="nextExecutor" groupName="选择下一级审核人员" data="detailData" bind-nameRef="detailData.ref('fName')"
              groupID="A" multiSelection="true"> 
              <div component="$UI/system/components/justep/data/bizData" concept="SA_Social"
                xid="bizData3"/>  

            </div>  
            <div class="x-ro x-ro-border" component="$UI/system/components/justep/social/relativeOrg/relativeOrg"
              xid="relativeParPsm" groupName="知会相关人员" data="detailData" bind-nameRef="detailData.ref('fName')"
              groupID="P"> 
              <div component="$UI/system/components/justep/data/bizData" concept="SA_Social"
                xid="bizData4"/>  

            </div> 
          </div>  
        </div>  
        <div class="x-panel-bottom" xid="bottom3"/> 
      </div> 
    </div>  --> 
  </div>  
  <span component="$UI/system/components/justep/windowDialog/windowDialog" xid="selectDialog"
    src="$UI/OA/personalOffice/process/evection/selectActivity.m.w" onReceive="selectDialogReceive"
    style="left:228px;top:170px;"/> 
</div>
