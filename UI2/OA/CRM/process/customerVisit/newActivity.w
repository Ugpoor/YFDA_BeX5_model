<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window" component="$UI/system/components/justep/window/window">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:96px;top:358px;"> 
    <div component="$UI/system/components/justep/data/bizData" xid="visitData"
      concept="OA_CustomerVisit" autoNew="false"> 
      <reader xid="default1" action="/OA/CRM/logic/action/queryOA_CustomerVisitAction"/>  
      <writer xid="default2" action="/OA/CRM/logic/action/saveOA_CustomerVisitAction"/>  
      <creator xid="default3" action="/OA/CRM/logic/action/createOA_CustomerVisitAction"/>  
      <rule xid="rule1"> 
        <col name="fCustomer" xid="ruleCol1"> 
          <required xid="required1"> 
            <expr xid="default7">js:true</expr>  
            <message xid="default8"><![CDATA[请选择客户]]></message> 
          </required> 
        </col>  
        <col name="fContent" xid="ruleCol2"> 
          <required xid="required2"> 
            <expr xid="default9">js:true</expr>  
            <message xid="default10">请输入文字内容</message> 
          </required> 
        </col> 
      </rule> 
    </div>  
    </div>  
  <span component="$UI/system/components/justep/windowDialog/windowDialog" xid="selectCustomerDialog" style="left:163px;top:14px;" src="$UI/OA/CRM/process/customer/selectCustomer.w" onReceive="selectCustomerDialogReceive"></span><div component="$UI/system/components/justep/contents/contents" class="x-contents x-full"
    active="0" xid="contents"> 
    <div class="x-contents-content" xid="mainField"> 
      <div component="$UI/system/components/justep/panel/panel" class="x-panel x-full"
        xid="panel1"> 
        <div class="x-panel-top" xid="top1"> 
          <div component="$UI/system/components/justep/titleBar/titleBar" class="x-titlebar"
            xid="titleBar1" title="添加拜访信息"> 
            <div class="x-titlebar-left" xid="div1"> 
              <a component="$UI/system/components/justep/button/button" class="btn btn-link"
                label="" xid="backBtn" icon="icon-chevron-left" onClick="backBtnClick"> 
                <i xid="i1" class="icon-chevron-left"/>  
                <span xid="span1"/> 
              </a> 
            </div>  
            <div class="x-titlebar-title" xid="div2">添加拜访信息</div>  
            <div class="x-titlebar-right reverse" xid="div3"> 
              <a component="$UI/system/components/justep/button/button" class="btn btn-link"
                label="" xid="saveBtn" icon="icon-checkmark-round" onClick="saveBtnClick"> 
                <i xid="i2" class="icon-checkmark-round"/>  
                <span xid="span2"/> 
              </a>  
              </div> 
          </div> 
        </div>  
        <div class="x-panel-content" xid="content4"> 
          <div xid="div26" class="input-row" style="width:100%;"> 
            <textarea component="$UI/system/components/justep/textarea/textarea"
              class="form-control" xid="textarea1" bind-ref="visitData.ref('fContent')"
              style="height:170px;" placeHolder="请输入文字内容"/> 
          </div>  
          <div xid="div24" class="input-group input-group-row" bind-click="checkCustomerClick"> 
            <span xid="span74" class="input-group-addon"><![CDATA[客户]]></span>  
            <div component="$UI/system/components/justep/output/output" class="x-output form-control"
              xid="output6" bind-ref="visitData.ref('fCustomer')" style="text-align:right;"/>  
            <span xid="span14" class="input-group-addon right-open"> 
              <i xid="i13" class="icon-chevron-right"/> 
            </span> 
          </div>  
          <div xid="div20" class="input-group input-group-row"> 
            <span xid="span7" class="input-group-addon"><![CDATA[拜访时间]]></span>  
            <div component="$UI/system/components/justep/output/output" class="x-output form-control"
              xid="output7" bind-ref="visitData.ref('fVisitTime')" style="text-align:right;"/> 
          </div>  
          <div xid="div30" class="input-group input-group-row"> 
            <span xid="span307" class="input-group-addon"><![CDATA[拜访人]]></span>  
            <div component="$UI/system/components/justep/output/output" class="x-output form-control"
              xid="output8" style="text-align:right;" bind-ref="visitData.ref('fCreator')"/> 
          </div>  
          <div xid="div11"> 
            <div component="$UI/system/components/justep/attachment/attachment"
              access="duud" xid="attachment1" bind-ref="visitData.ref('fAttachment')"> 
              <div class="x-attachment" xid="div12"> 
                <div class="x-attachment-content x-card-border" xid="div13"> 
                  <div class="x-doc-process" xid="div14"> 
                    <div class="progress-bar x-doc-process-bar" role="progressbar"
                      style="width:0%;" xid="div15"/> 
                  </div>  
                  <div data-bind="foreach:$attachmentItems" xid="div16"> 
                    <div class="x-attachment-cell" xid="div17"> 
                      <div class="x-attachment-item x-item-other" data-bind="click:$model.previewOrRemoveItem.bind($model),style:{opacity: $model.$access.get() % 4 &gt;= 2 || $model.$state.get() == 'remove' ? '1.0' : '0.5',backgroundImage:($model.previewPicture.bind($model,$object))()}"
                        xid="div18"> 
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
        </div>  
        <div class="x-panel-bottom" xid="bottom1"/> 
      </div> 
    </div>  
  </div>  
  <span component="$UI/system/components/justep/windowReceiver/windowReceiver"
    xid="windowReceiver" onReceive="windowReceiverReceive" style="left:126px;top:14px;"/>  
  <span component="$UI/system/components/justep/windowDialog/windowDialog" xid="mapDialog"
    src="$UI/OA/common/process/map.w" style="left:86px;top:14px;"/> 
<span component="$UI/system/components/justep/messageDialog/messageDialog" xid="closeMsgDlg" type="YesNo" onClose="closeMsgDlgClose" title="提示" message="是否取消当前操作？" style="left:43px;top:15px;"></span></div>
