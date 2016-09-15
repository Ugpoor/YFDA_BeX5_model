<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window" component="$UI/system/components/justep/window/window">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:96px;top:358px;"> 
    <div component="$UI/system/components/justep/data/bizData" xid="customerData"
      concept="OA_Customer" autoLoad="true" limit="7" confirmDelete="false" confirmRefresh="false"> 
      <reader xid="default4" action="/OA/CRM/logic/action/queryOA_CustomerSelectAction"/>  
      <writer xid="default5" action="/OA/CRM/logic/action/saveOA_CustomerAction"/>  
      <creator xid="default6" action="/OA/CRM/logic/action/createOA_CustomerAction"/> 
    </div> 
  </div>  

      <div component="$UI/system/components/justep/panel/panel" class="x-panel x-full"
        xid="panel3"> 
        <div class="x-panel-top" xid="top3"> 
          <div component="$UI/system/components/justep/titleBar/titleBar" class="x-titlebar"
            xid="titleBar3" title="选择客户"> 
            <div class="x-titlebar-left" xid="div7"> 
              <a component="$UI/system/components/justep/button/button" class="btn btn-link"
                label="" xid="backBtn" icon="icon-chevron-left" bind-click="backBtnClick"> 
                <i xid="i10" class="icon-chevron-left"/>  
                <span xid="span11"/> 
              </a> 
            </div>  
            <div class="x-titlebar-title" xid="div8">选择客户</div>  
            <div class="x-titlebar-right reverse" xid="div9" style="width:129px;"><a component="$UI/system/components/justep/button/button" class="btn btn-link btn-only-icon" xid="addBtn" icon="icon-android-add" onClick="addBtnClick">
   <i xid="i1" class="icon-android-add"></i>
   <span xid="span1"></span></a></div> 
          </div> 
        </div>  
        <div class="x-panel-content" xid="content1"> 
          <div component="$UI/system/components/justep/panel/panel" class="x-panel x-full"
            xid="panel4"> 
            <div class="x-panel-top" xid="top4"> 
              <div class="input-group smart-filter" component="$UI/system/components/justep/smartFilter/smartFilter"
                xid="smartFilter" filterData="customerData" filterCols="fName,fAbbr"> 
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
                  xid="span3"> 
                  <i class="icon-close-circled" xid="i8"/> 
                </span> 
              </div> 
            </div>  
            <div class="x-panel-content x-scroll-view" xid="content2"> 
              <div class="x-scroll" component="$UI/system/components/justep/scrollView/scrollView"
                xid="scrollView1"> 
                <div class="x-content-center x-pull-down container" xid="div4"> 
                  <i class="x-pull-down-img glyphicon x-icon-pull-down" xid="i31"/>  
                  <span class="x-pull-down-label" xid="span31">下拉刷新...</span> 
                </div>  
                <div class="x-scroll-content" xid="div10"> 
                  <div component="$UI/system/components/justep/list/list" class="x-list"
                    xid="customerList" disableInfiniteLoad="true" disablePullToRefresh="true"
                    limit="20" data="customerData" bind-click="customerListClick"> 
                    <ul class="x-list-template" xid="listTemplateUl4"> 
                      <li xid="liTitle" data-bind="" class="title-row" bind-visible="val('fLetter') != ''"> 
                        <div component="$UI/system/components/justep/output/output"
                          class="x-output" xid="output1" bind-ref="ref('fLetter')"/> 
                      </li>  
                      <li xid="liCustomer" class="x-flex list-row" bind-visible="val('fLetter') == ''"> 
                        <div component="$UI/system/components/justep/row/row"
                          class="x-row" xid="row3"> 
                          <div class="x-col x-col-fixed " xid="col6" style="width:auto;"> 
                            <img src="img/customer.jpg" alt="" xid="image1"
                              style="width:44px;" height="44"/> 
                          </div>  
                          <div class="x-col x-col-center" xid="col7"> 
                            <div component="$UI/system/components/justep/output/output"
                              class="x-output title-data" xid="output2" bind-ref="ref('fName')"
                              style="padding:0px 0px 0px 0px;"/> 
                          </div> 
                        </div> 
                      </li> 
                    </ul> 
                  </div> 
                </div>  
                <div class="x-content-center x-pull-up" xid="div71"> 
                  <span class="x-pull-up-label" xid="span41">加载更多...</span> 
                </div> 
              </div> 
            </div>  
<!--             <div class="x-key-index"> 
              <div class="info"/>  
              <ul data-bind="foreach: keys"> 
                <li class="x-key-item" data-bind="text:$object"/> 
              </ul> 
            </div>  -->
          </div> 
        </div>  
        <div class="x-panel-bottom" xid="bottom3">
          <div component="$UI/system/components/justep/button/buttonGroup"
            class="btn-group btn-group-justified" tabbed="true" xid="buttonGroup" selected="allCusBtn" onSelect="buttonGroupSelect" style="height:100%;">
            <a component="$UI/system/components/justep/button/button" class="btn btn-default"
              label="全部" xid="allCusBtn" onClick="allCusBtnClick"> 
              <i xid="i3"/>  
              <span xid="span4">全部</span>
            </a>  
            <a component="$UI/system/components/justep/button/button" class="btn btn-default"
              label="附近" xid="nearCusBtn"> 
              <i xid="i4"/>  
              <span xid="span5">附近</span>
            </a>
          </div>
        </div> 
      </div> 

  <span component="$UI/system/components/justep/windowReceiver/windowReceiver"
    xid="windowReceiver" style="left:117px;top:16px;" onReceive="windowReceiverReceive"/>  
  <span component="$UI/system/components/justep/windowDialog/windowDialog" xid="newDialog" src="$UI/OA/CRM/process/customer/newActivity.w" style="left:76px;top:16px;" onReceive="newDialogReceive" process="/OA/CRM/process/customer/customerProcess" activity="mainActivity"></span></div>
