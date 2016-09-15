<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window" component="$UI/system/components/justep/window/window">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="left:253px;top:321px;height:98px;width:109px;"> 
    <div component="$UI/system/components/justep/data/bizData" xid="detailData"
      concept="OA_CustomerVisit" autoLoad="false" confirmDelete="true"> 
      <reader xid="default1" action="/OA/CRM/logic/action/queryOA_CustomerVisitAction"/>  
      <writer xid="default2" action="/OA/CRM/logic/action/saveOA_CustomerVisitAction"/>  
      <creator xid="default3" action="/OA/CRM/logic/action/createOA_CustomerVisitAction"/>  
      </div>  
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
            xid="titleBar2" title="拜访信息"> 
            <div class="x-titlebar-left" xid="div4" style="width:57px;"> 
              <a component="$UI/system/components/justep/button/button" class="btn btn-link"
                xid="listBtn" icon="icon-chevron-left" onClick='{"operation":"windowReceiver.windowCancel"}'> 
                <i xid="i1" class="icon-chevron-left"/>  
                <span xid="span1"/> 
              </a>  
              <div component="$UI/system/components/justep/bar/bar" class="x-bar"
                xid="bar1" style="width:99px;"/> 
            </div>  
            <div class="x-titlebar-title" xid="div5">拜访信息</div>  
            <div class="x-titlebar-right reverse" xid="div6"> 
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
              <div xid="div24" class="input-group input-group-row" bind-visible="$model.detailData.getValue('fCustomer')!= null"> 
            <span xid="span74" class="input-group-addon"><![CDATA[客户]]></span>  
            <div component="$UI/system/components/justep/output/output" class="form-control" xid="output1" bind-ref="detailData.ref('fCustomer')"></div></div>  
          <div xid="div20" class="input-group input-group-row" bind-visible="$model.detailData.getValue('fVisitTime')!= null"> 
            <span xid="span7" class="input-group-addon"><![CDATA[拜访时间]]></span>  
            <div component="$UI/system/components/justep/output/output" class="form-control" xid="output2" bind-ref="detailData.ref('fVisitTime')"></div></div>  
          <div xid="div30" class="input-group input-group-row" bind-visible="$model.detailData.getValue('fCreator')!= null"> 
            <span xid="span307" class="input-group-addon"><![CDATA[拜访人]]></span>  
            <div component="$UI/system/components/justep/output/output" class="form-control" xid="output3" bind-ref="detailData.ref('fCreator')"></div></div>  
          <div xid="div26" class="input-group input-group-row" bind-visible="$model.detailData.getValue('fContent')!= null"> 
            <span xid="span76" class="input-group-addon"><![CDATA[总结]]></span>  
            <div component="$UI/system/components/justep/output/output" class="form-control" xid="output4" bind-ref="detailData.ref('fContent')"></div></div>  
          <div xid="div11"> 
            <div component="$UI/system/components/justep/attachment/attachment"
              access="d" xid="attachment1" bind-ref="detailData.ref('fAttachment')"> 
              <div class="x-attachment" xid="div12"> 
                <div class="x-attachment-content x-card-border" xid="div13"> 
                  <div class="x-doc-process" xid="div14"> 
                    <div class="progress-bar x-doc-process-bar" role="progressbar"
                      style="width:0%;" xid="div15"/> 
                  </div>  
                  <div data-bind="foreach:$attachmentItems" xid="div16"> 
                    <div class="x-attachment-cell" xid="div17"> 
                      <div class="x-attachment-item x-item-other" data-bind="click:$model.previewOrRemoveItem.bind($model),style:{opacity: $model.$access.get() % 4 &gt;= 2 || $model.$state.get() == 'remove' ? '1.0' : '0.5',backgroundImage:($model.previewPicture.bind($model,$object))()}"
                        xid="div181"> 
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
          </div> 
        </div> 
      </div> 
    </div>  
    </div>  
  <!--   <span component="$UI/system/components/justep/windowDialog/windowDialog" xid="windowDialog1"
    src="closeMainActivity.m.w" onReceive="windowDialog1Receive" style="left:1px;top:351px;"/>-->  
  <span component="$UI/system/components/justep/windowReceiver/windowReceiver"
    xid="windowReceiver" onReceive="windowReceiverReceive" style="top:419px;left:-2px;"/>  
  <span component="$UI/system/components/justep/windowDialog/windowDialog" xid="mapDialog" src="$UI/OA/common/process/map.w" style="left:64px;top:13px;"></span></div>
