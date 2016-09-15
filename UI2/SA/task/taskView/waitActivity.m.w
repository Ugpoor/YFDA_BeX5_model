<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" component="$UI/system/components/justep/window/window">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="top:26px;height:auto;left:378px;" onActive="modelActive"> 
    <div component="$UI/system/components/justep/data/bizData" xid="taskData" 
      autoLoad="true" concept="SA_Task" orderBy="sCreateTime desc" confirmRefresh="false" columns="sName,sCreateTime,sExecutorFName,sExecutorNames,sCreatorFName,sProcess,sActivity,sExecutorFID,sEURL,sData1,sData2,sData3,sData4,sKindID,sStatusID"> 
      <reader action="/SA/task/logic/action/queryWaitTask2Action"/> 
    </div> 
  </div>  
  <div/>  
  <div component="$UI/system/components/justep/panel/panel" class="x-panel x-full"
    xid="panel1"> 
    <div class="x-panel-top" xid="top1"> 
      <div component="$UI/system/components/justep/titleBar/titleBar" class="x-titlebar"
        xid="titleBar1" title="待办任务"> 
        <div class="x-titlebar-left" xid="div1"> 
          <!-- 	
          <a component="$UI/system/components/justep/button/button" class="btn btn-link" xid="menuBtn" icon="icon-navicon-round" onClick="menuBtnClick"> 
            <i class="icon-navicon-round"/>  
            <span></span> 
          </a> 
          -->
          <a component="$UI/system/components/justep/button/button" label=""
            class="btn btn-link btn-only-icon" icon="icon-chevron-left" onClick="backBtnClick"
            xid="backBtn"> 
            <i class="icon-chevron-left"/>  
            <span></span> 
          </a> 
          
        </div>  
        <div class="x-titlebar-title" xid="div2">待办任务</div>  
        <div class="x-titlebar-right reverse" xid="div3"/> 
      </div> 
    </div>  
    <div class="x-panel-content" xid="content1"> 
      <div class="x-list x-inner-scroll" component="$UI/system/components/justep/list/list"
        data="taskData" limit="20"> 
        <div class="x-list-head"/>  
        <div class="x-list-content x-scroll-view"> 
          <div component="$UI/system/components/justep/scrollView/scrollView"
            supportPullToRefresh="true" supportInfiniteLoad="true" hScroll="false"
            vScroll="true" hScrollbar="false" vScrollbar="true" bounce="true" class="x-scroll"> 
            <div class="x-content-center x-pull-down container">
			      <i class="x-pull-down-img glyphicon x-icon-pull-down"></i>
			      <span class="x-pull-down-label">下拉刷新...</span>
			</div>  
            <div class="x-scroll-content" > 
              <ul class="x-list-template"> 
              	<!-- bind-css="{ 'x-currentRow': $model.taskData.currentRow.get() == $object }" -->
                <li class="list-group-item"  bind-click="li2Click"> 
                  <div class="x-row x-row-center" component="$UI/system/components/justep/row/row"> 
                    <div class="x-col" style="font-weight:bold"> 
                      <span component="$UI/system/components/justep/output/output"
                        data="taskData" bind-ref="ref('sName')"/> 
                    </div>  
                  </div>  
                  <div class="x-row x-row-center" style="color:gray" component="$UI/system/components/justep/row/row"> 
                    <div class="x-col"> 
                      <span component="$UI/system/components/justep/output/output"
                        data="taskData" bind-ref="ref('sCreatorFName')"/> 
                    </div>  
                    <div class="x-col"> 
                      <span component="$UI/system/components/justep/output/output"
                        data="taskData" bind-ref="ref('sCreateTime')" format="yyyy-MM-dd"/> 
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
