<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window oa" component="$UI/system/components/justep/window/window">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="width:109px;height:auto;left:351px;top:221px;"> 
    <div component="$UI/system/components/justep/data/bizData" xid="customerData"
      concept="OA_Customer" autoLoad="false" confirmDelete="false" autoNew="false"
      confirmRefresh="false"> 
      <reader xid="default1" action="/OA/CRM/logic/action/queryOA_CustomerAction"/>  
      <writer xid="default2" action="/OA/CRM/logic/action/saveOA_CustomerAction"/>  
      <creator xid="default3" action="/OA/CRM/logic/action/createOA_CustomerAction"/>  
      <calculateRelation relation="fAreaInfo" xid="calculateRelation1"/>  
      <rule xid="rule1"> 
        <col name="fAreaInfo" xid="ruleCol2"> 
          <calculate xid="calculate2"> 
            <expr xid="default9">js: ($row.val("fProvince")?($row.val("fProvince")):'') + ($row.val("fCity")?('-' + $row.val("fCity")):'') + ($row.val("fZone")?('-' + $row.val("fZone")):'')</expr>
          </calculate> 
        </col> 
      </rule>
    </div>  
    <div component="$UI/system/components/justep/data/bizData" xid="custMoreData"
      concept="OA_CustomrMore" autoLoad="true">
      <reader xid="default5" action="/OA/CRM/logic/action/queryOA_CustomrMoreAction"/>  
      <writer xid="default6" action="/OA/CRM/logic/action/saveOA_CustomrMoreAction"/>  
      <creator xid="default7" action="/OA/CRM/logic/action/createOA_CustomrMoreAction"/>  
      <master xid="default8" data="customerData" relation="fCustomerID"/>
    </div>
  <div component="$UI/system/components/justep/data/bizData" xid="lastVisitData" concept="OA_CustomerVisit" limit="1" orderBy="fVisitTime desc"><reader xid="default10" action="/OA/CRM/logic/action/queryOA_CustomerVisitAction"></reader>
  <writer xid="default11" action="/OA/CRM/logic/action/saveOA_CustomerVisitAction"></writer>
  <creator xid="default12" action="/OA/CRM/logic/action/createOA_CustomerVisitAction"></creator></div></div>  
  <span component="$UI/system/components/justep/windowReceiver/windowReceiver"
    xid="windowReceiver" onReceive="windowReceiverReceive" style="top:419px;left:-2px;"/>  
  <div component="$UI/system/components/justep/contents/contents" class="x-contents x-full"
    active="0" xid="contents1"> 
    <div class="x-contents-content" xid="detail"> 
      <div component="$UI/system/components/justep/panel/panel" class="x-panel x-full"
        xid="panel1"> 
        <div class="x-panel-top" xid="top1"> 
          <div component="$UI/system/components/justep/titleBar/titleBar" class="x-titlebar"
            xid="titleBar2" title="详细资料"> 
            <div class="x-titlebar-left" xid="div4" style="width:57px;"> 
              <a component="$UI/system/components/justep/button/button" class="btn btn-link"
                xid="backBtn" icon="icon-chevron-left" style="width:40px;" onClick="backBtnClick"> 
                <i xid="i1" class="icon-chevron-left"/>  
                <span xid="span1"/> 
              </a>  
              <div component="$UI/system/components/justep/bar/bar" class="x-bar"
                xid="bar1" style="width:99px;"/> 
            </div>  
            <div class="x-titlebar-title" xid="div5">详细资料</div>  
            <div class="x-titlebar-right reverse" xid="div6"> 
              <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-only-icon"
                xid="editBtn" label="编辑" onClick="editBtnClick" icon="icon-edit"> 
                <i xid="i2" class="icon-edit"/>  
                <span xid="span2">编辑</span> 
              </a>  
              <a component="$UI/system/components/justep/button/button" class="btn btn-link"
                label="" xid="mapBtn" icon="icon-android-location" onClick="mapBtnClick"> 
                <i xid="i3" class="icon-android-location"/>  
                <span xid="span3"/>
              </a>
            </div> 
          </div> 
        </div>  
        <div class="x-panel-content" xid="content3"> 
          <div class="media" xid="div7"> 
            <div xid="div1" class="pull-left content-head-pic">
              <img src="img/customer.jpg" alt="" xid="imag" class="media-object x-blob"
                style="width:44px"/>
            </div>  
            <div class="media-body " xid="div8"> 
                <div component="$UI/system/components/justep/output/output"
                  class="form-control title-data" xid="optTheme" bind-ref="customerData.ref('fName')" style="padding-top:20px;padding-left:10px;"/> 
           </div> 
          </div> 
              <div xid="div26" class="input-group input-group-row" bind-visible="typeof($model.customerData.getValue('fContent'))!= &quot;undefined&quot;"> 
                <span xid="span76" class="input-group-addon"><![CDATA[简介]]></span>  
                <div component="$UI/system/components/justep/output/output"
                  class="form-control" xid="optContent" bind-ref="customerData.ref('fContent')"
                  style="text-align:left;"/> 
              </div>  
              <div xid="div20" class="input-group input-group-row" bind-visible="typeof($model.customerData.getValue('fPhone'))!= &quot;undefined&quot;"> 
                <span xid="span7" class="input-group-addon"><![CDATA[电话]]></span>  
                <div component="$UI/system/components/justep/output/output"
                  class="form-control" xid="optPhone" bind-ref="customerData.ref('fPhone')"
                  style="text-align:left;"/> 
              </div>  
              <div xid="div201" class="input-group input-group-row" bind-visible="typeof($model.customerData.getValue('fPhone2'))!= &quot;undefined&quot;"> 
                <span xid="span711" class="input-group-addon"><![CDATA[电话]]></span>  
                <div component="$UI/system/components/justep/output/output"
                  class="form-control" xid="optPhone2" bind-ref="customerData.ref('fPhone2')"
                  style="text-align:left;"/> 
              </div>  
              <div xid="div30" class="input-group input-group-row" bind-visible="typeof($model.customerData.getValue('fURL'))!= &quot;undefined&quot;"> 
                <span xid="span307" class="input-group-addon"><![CDATA[网址]]></span>  
                <div component="$UI/system/components/justep/output/output"
                  class="form-control" xid="opturl" bind-ref="customerData.ref('fURL')"
                  style="text-align:left;"/> 
              </div>  
              <div xid="div21" class="input-group input-group-row" bind-visible="typeof($model.customerData.getValue('fProvince'))!= &quot;undefined&quot;"> 
                <span xid="span71" class="input-group-addon"><![CDATA[地域]]></span>  
                <div component="$UI/system/components/justep/output/output"
                  class="form-control" xid="optProvice" bind-ref="customerData.ref('fAreaInfo')"
                  style="text-align:left;"/> 
              </div>  
              <div xid="div31" class="input-group input-group-row" bind-visible="typeof($model.customerData.getValue('fAddr'))!= &quot;undefined&quot;"> 
                <span xid="span317" class="input-group-addon"><![CDATA[地址]]></span>  
                <div component="$UI/system/components/justep/output/output"
                  class="form-control" xid="optPlace" bind-ref="customerData.ref('fAddr')"
                  style="text-align:left;"/> 
              </div>  
              <div xid="div325" class="input-group input-group-row" bind-visible="typeof($model.customerData.getValue('fEmployeeNum'))!= &quot;undefined&quot;"> 
                <span xid="span357" class="input-group-addon"><![CDATA[员工数]]></span>  
                <div component="$UI/system/components/justep/output/output"
                  class="form-control" xid="optEmpNum" bind-ref="customerData.ref('fEmployeeNum')"
                  style="text-align:left;"/> 
              </div>  
              <div component="$UI/system/components/justep/list/list" class="x-list"
                xid="listMoreField" data="custMoreData" style="padding-right:0px;padding-left:0px;"> 
                <ul class="x-list-template" xid="listTemplateUl1"> 
                  <li xid="li1"> 
                    <div xid="div315" class="input-group input-group-row"> 
                      <span xid="span3571" class="input-group-addon" bind-text="ref('fFieldName')"><![CDATA[]]></span>  
                      <div component="$UI/system/components/justep/output/output"
                        class="form-control" xid="optField" bind-ref="ref('fFieldValue')"
                        style="text-align:left;"/> 
                    </div> 
                  </li> 
                </ul> 
              </div>  
              <div xid="div121"> 
                <div component="$UI/system/components/justep/attachment/attachment"
                  access="d" xid="attachment1" bind-ref="customerData.ref('fAttachment')"> 
                  <div class="x-attachment" xid="div112" data-bind="visible: $attachmentItems.get().length &gt; 0"> 
                    <div class="x-attachment-content x-card-border" xid="div113"> 
                      <div class="x-doc-process" xid="div14"> 
                        <div class="progress-bar x-doc-process-bar" role="progressbar"
                          style="width:0%;" xid="div15"/> 
                      </div>  
                      <div data-bind="foreach:$attachmentItems" xid="div16"> 
                        <div class="x-attachment-cell" xid="div17"> 
                          <div class="x-attachment-item x-item-other" data-bind="click:$model.previewOrRemoveItem.bind($model),style:{opacity: $model.$access.get() % 4 &gt;= 2 || $model.$state.get() == 'remove' ? '1.0' : '0.5',backgroundImage:($model.previewPicture.bind($model,$object))()}"
                            xid="div118"> 
                            <a data-bind="visible:$model.$state.get() == 'remove'"
                              class="x-remove-barget" xid="a1"/> 
                          </div> 
                        </div> 
                      </div>  
                      <div class="x-attachment-cell" data-bind="visible:$state.get() == 'upload' &amp;&amp; ($limit.get() == '-1' || $limit.get() &gt; $attachmentItems.get().length)"
                        xid="div19"> 
                        <div class="x-attachment-item x-item-upload" data-bind="visible:$state.get() == 'upload' &amp;&amp; $access.get() % 512 &gt;= 256"
                          xid="div27"/> 
                      </div>  
                      <div class="x-attachment-cell" data-bind="visible:$state.get() == 'upload' &amp;&amp; $attachmentItems.get().length &gt; 0"
                        xid="div28"> 
                        <div class="x-attachment-item x-item-remove" data-bind="click:changeState.bind($object,'remove'),visible:$access.get() % 2048 &gt;= 1024"
                          xid="div29"/> 
                      </div>  
                      <div style="clear:both;" xid="div32"/> 
                    </div> 
                  </div> 
                </div> 
              </div>  
              <!--  <div xid="div37"> 
            <div class="x-ro x-ro-border" component="$UI/system/components/justep/social/relativeOrg/relativeOrg"
              xid="relativeOrg1" groupName="负责人可以管理客户，建议添加主管部门经理等" groupID="E" data="customerData"
              bind-nameRef="customerData.ref('fName')"> 
              <div component="$UI/system/components/justep/data/bizData" concept="SA_Social"
                xid="bizData3"/> 
            </div> 
          </div>   -->  
              <!-- <div xid="div38"> 
            <div class="x-ro x-ro-border" component="$UI/system/components/justep/social/relativeOrg/relativeOrg"
              xid="relativeOrg2" groupID="P" groupName="相关人可以查看客户信息" data="customerData"
              bind-nameRef="customerData.ref('fName')"> 
              <div component="$UI/system/components/justep/data/bizData" concept="SA_Social"
                xid="bizData4"/> 
            </div> 
          </div>  -->  
<!--               <div component="$UI/system/components/justep/output/output" class="x-output"
                xid="output1"/> -->
        <div class="x-ro x-ro-border" component="$UI/system/components/justep/social/relativeOrg/relativeOrg" xid="relativeOrg1" groupName="负责人" groupID="E" data="customerData" bind-nameRef="customerData.ref('fName')" multiSelection="true" statusEnabled="false" readonly="js:true">
   <div component="$UI/system/components/justep/data/bizData" concept="SA_Social" xid="bizData3"></div></div>
  <div class="x-ro x-ro-border" component="$UI/system/components/justep/social/relativeOrg/relativeOrg" xid="relativeOrg2" groupID="P" groupName="相关人" data="customerData" bind-nameRef="customerData.ref('fName')" multiSelection="true" statusEnabled="false" readonly="js:true" socialData="bizData3">
   <div component="$UI/system/components/justep/data/bizData" concept="SA_Social" xid="bizData4"></div></div></div> 
      </div> 
    </div>  
    <div class="x-contents-content" xid="edit"> 
      <div component="$UI/system/components/justep/panel/panel" class="x-panel x-full"
        xid="panel2"> 
        <div class="x-panel-top" xid="top2"> 
          <div component="$UI/system/components/justep/titleBar/titleBar" class="x-titlebar"
            xid="titleBar1" title="审批"> 
            <div class="x-titlebar-left" xid="div111" style="width:40px;"> 
              <a component="$UI/system/components/justep/button/button" class="btn btn-link"
                xid="backDetBtn" icon="icon-chevron-left" style="width:40px;"> 
                <i xid="i5" class="icon-chevron-left"/>  
                <span xid="span5"/> 
              </a> 
            </div>  
            <div class="x-titlebar-title" xid="div12">审批</div>  
            <div class="x-titlebar-right reverse" xid="div13"/> 
          </div> 
        </div>  
        <div class="x-panel-content" xid="content4"></div> 
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
  <span component="$UI/system/components/justep/windowDialog/windowDialog" xid="editDialog"
    src="$UI/OA/CRM/process/customer/newActivity.w" style="left:228px;top:170px;"
    onReceive="editDialogReceive"/>  
  <span component="$UI/system/components/justep/windowDialog/windowDialog" xid="mapDialog"
    src="$UI/OA/common/process/map.w" style="left:52px;top:11px;"/>
</div>
