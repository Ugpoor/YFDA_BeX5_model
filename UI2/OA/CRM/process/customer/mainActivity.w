<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window oa" component="$UI/system/components/justep/window/window">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:169px;top:228px;"> 
    <div component="$UI/system/components/justep/data/bizData" xid="customerData"
      concept="OA_Customer" autoLoad="true" confirmDelete="false" confirmRefresh="false"
      limit="7"> 
      <reader xid="default1" action="/OA/CRM/logic/action/queryOA_CustomerLetterAction"/>  
      <writer xid="default2" action="/OA/CRM/logic/action/saveOA_CustomerAction"/>  
      <creator xid="default3" action="/OA/CRM/logic/action/createOA_CustomerAction"/> 
    </div> 
  </div>  
  <div component="$UI/system/components/justep/panel/panel" class="x-panel x-full"
    xid="panel1"> 
    <div class="x-panel-top" xid="top1"> 
      <div component="$UI/system/components/justep/titleBar/titleBar" class="x-titlebar"
        xid="titleBar1" title="客户信息"> 
        <div class="x-titlebar-left" xid="div1"> 
          <a component="$UI/system/components/justep/button/button" class="btn btn-link"
            label="" xid="backBtn" icon="icon-chevron-left" onClick="backBtnClick"> 
            <i xid="i1" class="icon-chevron-left"/>  
            <span xid="span1"/> 
          </a> 
        </div>  
        <div class="x-titlebar-title" xid="div2">客户信息</div>  
        <div class="x-titlebar-right reverse" xid="div3"> 
          <a component="$UI/system/components/justep/button/button" class="btn btn-link"
            label="" xid="addBtn" icon="icon-plus-round" onClick="addBtnClick"> 
            <i xid="i2" class="icon-plus-round"/>  
            <span xid="span2"/> 
          </a> 
        </div> 
      </div> 
    </div>  
    <div class="x-panel-content" xid="content1"> 
      <div component="$UI/system/components/justep/panel/panel" class="x-panel x-full"
        xid="panel2"> 
        <div class="x-panel-top" xid="top2"> 
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
              xid="span7"> 
              <i class="icon-close-circled" xid="i8"/> 
            </span> 
          </div> 
        </div>  
        <div class="x-panel-content x-scroll-view" xid="content2"> 
           <div class="x-scroll" component="$UI/system/components/justep/scrollView/scrollView"
            xid="scrollView2"> 
            <div class="x-content-center x-pull-down container" xid="div4"> 
              <i class="x-pull-down-img glyphicon x-icon-pull-down" xid="i3"/>  
              <span class="x-pull-down-label" xid="span3">下拉刷新...</span>
            </div>  
            <div class="x-scroll-content" xid="div6">
              <div component="$UI/system/components/justep/list/list" class="x-list"
                xid="customerList" disableInfiniteLoad="false" disablePullToRefresh="false"
                limit="-1" data="customerData" bind-click="customerListClick"> 
                <ul class="x-list-template" xid="listTemplateUl4"> 
                  <li xid="liTitle" data-bind="" class="title-row" bind-visible="val('fLetter') != ''"> 
                    <div component="$UI/system/components/justep/output/output"
                      class="x-output" xid="output1" bind-ref="ref('fLetter')"/> 
                  </li>  
                  <li xid="liCustomer" class="x-flex list-row" bind-visible="val('fLetter') == ''"> 
                    <div component="$UI/system/components/justep/row/row" class="x-row"
                      xid="row1"> 
                      <div class="x-col x-col-fixed " xid="col1" style="width:auto;"> 
                        <img src="img/customer.jpg" alt="" xid="image1" style="width:44px"
                          height="44"/> 
                      </div>  
                      <div class="x-col x-col-center" xid="col2"> 
                        <div component="$UI/system/components/justep/output/output"
                          class="x-output title-data" xid="output2" bind-ref="ref('fName')"
                          style="padding:0px 0px 0px 0px;"/> 
                      </div> 
                    </div> 
                  </li> 
                </ul> 
          </div>
              </div>        
            <div class="x-content-center x-pull-up" xid="div7"> 
              <span class="x-pull-up-label" xid="span4">加载更多...</span>
            </div> 
          </div>
             </div> 
      </div> 
    </div> 
  </div>  
  <span component="$UI/system/components/justep/windowDialog/windowDialog" xid="newDialog"
    src="$UI/OA/CRM/process/customer/newActivity.w" onReceive="newDialogReceive" style="left:110px;top:14px;"/>  
  <span component="$UI/system/components/justep/windowDialog/windowDialog" xid="detailDialog"
    src="$UI/OA/CRM/process/customer/detailActivity.m.w" onReceive="detailDialogReceive" style="left:70px;top:13px;"/> 
</div>
