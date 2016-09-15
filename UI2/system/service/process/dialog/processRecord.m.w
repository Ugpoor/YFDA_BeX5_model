<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window" component="$UI/system/components/justep/window/window">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:193px;top:274px;"> 
    <div component="$UI/system/components/justep/data/bizData" xid="processRecordData"
      concept="SA_Task" columns="sName,sActivityName,sExecutorDeptName,sExecutorPersonName,sContent,sActualStartTime,sActualFinishTime"> 
      <reader xid="default1" action="/system/logic/action/queryProcessExecuteListAction"/> 
    </div> 
  </div>  
  <span xid="windowReceive" component="$UI/system/components/justep/windowReceiver/windowReceiver"
    onReceive="windowReceiveReceive" style="left:332px;top:107px;"/>  
  <div component="$UI/system/components/justep/panel/panel" class="x-panel x-full"> 
    <div class="x-panel-top"> 
      <div xid="bar" component="$UI/system/components/justep/titleBar/titleBar"
        title="流程记录" class="x-titlebar"> 
        <div class="x-titlebar-left"> 
          <a component="$UI/system/components/justep/button/button" label=""
            class="btn btn-link btn-only-icon" icon="icon-chevron-left" xid="okBtn"
            onClick="okBtnClick"> 
            <i class="icon-chevron-left"/>  
            <span></span> 
          </a> 
        </div>  
        <div class="x-titlebar-title">流程记录</div>  
        <div class="x-titlebar-right reverse"/> 
      </div> 
    </div>  
    <div class="x-panel-content" load="true" refresh="true"> 
      <div class="x-list x-inner-scroll" component="$UI/system/components/justep/list/list"
        data="processRecordData" limit="20" autoLoad="false" xid="list"> 
        <div class="x-list-head"/>  
        <div class="x-list-content x-scroll-view"> 
          <div component="$UI/system/components/justep/scrollView/scrollView"
            supportPullToRefresh="true" supportInfiniteLoad="true" hScroll="false"
            vScroll="true" hScrollbar="false" vScrollbar="true" bounce="true" class="x-scroll"> 
            <div class="x-content-center x-pull-down container">
			      <i class="x-pull-down-img glyphicon x-icon-pull-down"></i>
			      <span class="x-pull-down-label">下拉刷新...</span>
			</div>  
            <div class="x-scroll-content"> 
              <ul class="x-list-template"> 
                <li bind-css="{ 'x-currentRow': $model.processRecordData.currentRow.get() == $object }"
                  class="list-group-item"> 
                  <div class="x-row x-row-center" component="$UI/system/components/justep/row/row"> 
                    <div class="x-col"> 
                      <span component="$UI/system/components/justep/output/output"
                        data="orgListData" bind-ref="ref('sActivityName')"/> 
                    </div>  
                    <div class="x-col"> 
                      <span component="$UI/system/components/justep/output/output"
                        data="orgListData" bind-ref="ref('sName')"/> 
                    </div> 
                  </div>  
                  <div class="x-row x-row-center" component="$UI/system/components/justep/row/row"> 
                    <div class="x-col"> 
                      <span component="$UI/system/components/justep/output/output"
                        data="orgListData" bind-ref="ref('sActualFinishTime')"/> 
                    </div>  
                    <div class="x-col"> 
                      <span component="$UI/system/components/justep/output/output"
                        data="orgListData" bind-ref="ref('sContent')"/> 
                    </div> 
                  </div> 
                </li> 
              </ul> 
            </div>  
            <div class="x-content-center x-pull-up">
		        <span class="x-pull-up-label">加载更多...</span>
		    </div>
             
          </div> 
        </div> 
      </div> 
    </div> 
  </div> 
</div>
