<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" component="$UI/system/components/justep/window/window">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:357px;top:-9px;"
    onLoad="modelLoad"/>  
  <div component="$UI/system/components/justep/panel/panel" class="x-panel x-full"
    xid="panel1"> 
    <div class="x-panel-top" xid="top1"> 
      <div component="$UI/system/components/justep/titleBar/titleBar" class="x-titlebar"
        xid="titleBar" title="选择人员"> 
        <div class="x-titlebar-left" xid="div1"> 
          <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-only-icon"
            xid="btnCancel" icon="icon-chevron-left" onClick="btnCancelClick"> 
            <i xid="i2" class="icon-chevron-left"/>  
            <span xid="span5"/> 
          </a> 
        </div>  
        <div class="x-titlebar-title" xid="div3">选择人员</div>  
        <div class="x-titlebar-right reverse" xid="div5"> 
          <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-only-icon"
            xid="btnOK" icon="icon-checkmark-round" onClick="btnOKClick"> 
            <i xid="i3" class="icon-checkmark-round"/>  
            <span xid="span4"/> 
          </a>  
          <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-only-icon"
            xid="btnRefresh" icon="icon-refresh" onClick="btnRefreshClick"> 
            <i lass="icon-close-round" class="icon-refresh"/>  
            <span/> 
          </a> 
        </div> 
      </div> 
    </div>  
    <div class="x-panel-content x-flex x-flex-column" xid="content1">
      <div component="$UI/system/components/justep/button/buttonGroup" class="btn-group x-types" tabbed="true" selected="btnAll"> 
        <a component="$UI/system/components/justep/button/button" class="x-type btn btn-link btn-icon-left"
          label="全部" xid="btnAll" icon="icon-android-friends" onClick="btnAllClick"> 
          <i xid="i4" class="icon-android-friends"/>  
          <span xid="span3">全部</span> 
        </a>  
        <a component="$UI/system/components/justep/button/button" class="x-type btn btn-link btn-icon-left"
          label="常用组" xid="btnCommonGroup" icon="icon-android-contacts" onClick="btnCommonGroupClick"> 
          <i xid="i5" class="icon-android-contacts"/>  
          <span xid="span6">常用组</span> 
        </a> 
      </div>	 
      <div component="$UI/system/components/justep/contents/contents" class="x-contents x-flex1"
        active="0" xid="contents1" routable="false" wrap="false" swipe="false"> 
        <div class="x-contents-content x-full" xid="contentAllOrg"> 
          <div class="x-flex x-flex-column x-full"> 
            <div class="x-key"/>  
            <div> 
              <div class="x-query-input x-flex"> 
                <i class="icon-android-search x-icon-lg"/>  
                <input type="text" class="x-flex1" data-bind="value:filterText,valueUpdate: 'input'"/>  
                <i class="icon-close-circled  x-icon-lg x-cls-filter" bind-css="{hide:!filterText.get()}"
                  bind-click="clsfilterText"/> 
              </div> 
            </div>  
            <div class="x-flex1 x-org-list-content"> 
              <div class="x-full x-scroll-view"> 
                <div class="x-scroll" component="$UI/system/components/justep/scrollView/scrollView"
                  xid="scrollView" pullDownLabel="加载..." pullDownMoveLabel="松开加载..."
                  pullUpLabel="加载..." pullUpMoveLabel="松开加载..."> 
                  <div class="x-content-center x-pull-down container" xid="div6"> 
                    <i class="x-pull-down-img glyphicon x-icon-pull-down"/>  
                    <span class="x-pull-down-label" xid="span1">加载...</span> 
                  </div>  
                  <div class="x-scroll-content" xid="orgListContent" bind-touchstart="orgListContentTouchstart"> 
                    <div class="x-foreach" data-bind="foreach:{data: getList(),afterRender:afterRender()}"> 
                      <div data-bind="css:{media:$object.isTitle},if:$object.isTitle,attr:{flag:sName}"> 
                        <div component="$UI/system/components/justep/output/output"
                          class="x-output x-title" xid="output1" bind-ref="sName"/> 
                      </div>  
                      <div data-bind="css:{media:!$object.isTitle,'x-currentRow':$object==$model.currentRow.get()},if:!$object.isTitle"> 
                        <div class="pull-left x-org-checkbox" data-bind="if:$model.multiSelection"> 
                          <span component="$UI/system/components/justep/button/checkbox"
                            class="x-checkbox" bind-ref="selected"/> 
                        </div>  
                        <div class="media-body" data-bind="click:$model.doRowClick.bind($model)"> 
                          <div class="media"> 
                            <div class="x-blob x-blob-radius pull-left media-object x-org-image"
                              component="$UI/system/components/justep/org/orgImage"
                              xid="orgImage1" bind-ref="sFID" onCreateURL="orgImage1CreateURL"> 
                              <div class="x-blob-bar" xid="div4"> 
                                <i class="x-blob-edit icon-compose" xid="i1"/>  
                                <i class="x-blob-del icon-close-round" xid="i2"/> 
                              </div>  
                              <img class="x-blob-img x-autofill" xid="image1"/> 
                            </div>  
                            <div class="media-body"> 
                              <h4 class="media-heading" bind-text="sName"/>  
                              <div bind-text="sFName"/> 
                            </div> 
                          </div> 
                        </div> 
                      </div> 
                    </div> 
                  </div>  
                  <div class="x-content-center x-pull-up" xid="div7"> 
                    <span class="x-pull-up-label" xid="span2">加载...</span> 
                  </div> 
                </div>  
                <div class="x-key-index"> 
                  <div class="info"/>  
                  <ul data-bind="foreach: keys"> 
                    <li class="x-key-item" data-bind="text:$object"/> 
                  </ul> 
                </div> 
              </div> 
            </div> 
          </div> 
        </div>  
      </div> 
    </div>  
  </div>  
  <span component="$UI/system/components/justep/windowReceiver/windowReceiver"
    xid="windowReceiver" style="left:434px;top:163px;" onReceive="windowReceiverReceive"/> 
</div>
