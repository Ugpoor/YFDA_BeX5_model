<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window" component="$UI/system/components/justep/window/window"
  design="device:m;" >  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:172px;top:187px;"> 
    <div component="$UI/system/components/justep/data/data" autoLoad="true" xid="accountData" idColumn="fID" onCustomRefresh="accountDataCustomRefresh" onCustomSave="accountDataCustomSave" limit="5" onBeforeNew="accountDataBeforeNew">
   <column label="主键" name="fID" type="String" xid="column1"></column>
   <column label="创建时间" name="fCreateTime" type="DateTime" xid="column2"></column>
   <column label="日期" name="fDate" type="Date" xid="column3"></column>
   <column label="金额" name="fMoney" type="Decimal" xid="column4"></column>
   <column label="备注" name="fDescription" type="String" xid="column5"></column>
   <column label="收入\支出" name="fType" type="String" xid="column6"></column>
   <column label="分类" name="fClass" type="String" xid="column7"></column>
   <data xid="default6">[{&quot;fID&quot;:&quot;001&quot;,&quot;fCreateTime&quot;:&quot;&quot;,&quot;fDate&quot;:&quot;2015-09-29&quot;,&quot;fMoney&quot;:100,&quot;fDescription&quot;:&quot;去前门&quot;,&quot;fType&quot;:&quot;支出&quot;,&quot;fClass&quot;:&quot;交通&quot;},{&quot;fID&quot;:&quot;002&quot;,&quot;fCreateTime&quot;:&quot;&quot;,&quot;fDate&quot;:&quot;2015-09-29&quot;,&quot;fMoney&quot;:200.5,&quot;fDescription&quot;:&quot;去吃大餐&quot;,&quot;fType&quot;:&quot;支出&quot;,&quot;fClass&quot;:&quot;食物&quot;},{&quot;fID&quot;:&quot;003&quot;,&quot;fDate&quot;:&quot;2015-09-29&quot;,&quot;fMoney&quot;:150,&quot;fDescription&quot;:&quot;捡钱了&quot;,&quot;fType&quot;:&quot;收入&quot;,&quot;fClass&quot;:&quot;意外之财&quot;}]</data></div></div>  
  <span component="$UI/system/components/justep/windowDialog/windowDialog" xid="detailDialog"
    style="left:103px;top:198px;" src="./detail.w" title="记账" onReceived="detailDialogReceived"> 
    <result concept="accountData" operation="edit" origin="accountData" xid="default26"> 
      <mapping from="fID" to="fID" locator="true" xid="default27"/>  
      <mapping from="fCreateTime" to="fCreateTime" xid="default28"/>  
      <mapping from="fDate" to="fDate" xid="default29"/>  
      <mapping from="fMoney" to="fMoney" xid="default30"/>  
      <mapping from="fDescription" to="fDescription" xid="default31"/>  
      <mapping from="fType" to="fType" xid="default32"/>  
      <mapping from="fClass" to="fClass" xid="default33"/> 
    </result> 
  </span>  
  <div component="$UI/system/components/justep/panel/panel" class="x-panel x-full"
    xid="panel1"> 
    <div class="x-panel-top" xid="top1"> 
      <div component="$UI/system/components/justep/titleBar/titleBar" class="x-titlebar"
        xid="titleBar1" title="记账本"> 
        <div class="x-titlebar-left" xid="div1"> 
          <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-only-icon"
            label="设置" xid="settingBtn" icon="icon-navicon-round" onClick="settingBtnClick"> 
            <i xid="i4" class="icon-navicon-round"/>  
            <span xid="span5">设置</span> 
          </a> 
        </div>  
        <div class="x-titlebar-title" xid="div2">记账本</div>  
        <div class="x-titlebar-right reverse" xid="div3"> 
          <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-only-icon"
            label="新增" xid="newBtn" icon="icon-android-add" onClick="newBtnClick"> 
            <i xid="i2" class="icon-android-add"/>  
            <span xid="span2">新增</span> 
          </a> 
        </div> 
      </div> 
    </div>  
    <div class="x-panel-content x-scroll-view" xid="content1"> 
      <div class="x-scroll" component="$UI/system/components/justep/scrollView/scrollView"
        xid="scrollView1"> 
        <div class="x-content-center x-pull-down container" xid="div4"> 
          <i class="x-pull-down-img glyphicon x-icon-pull-down" xid="i1"/>  
          <span class="x-pull-down-label" xid="span1">下拉刷新...</span> 
        </div>  
        <div class="x-scroll-content" xid="div5"> 
          <div component="$UI/system/components/justep/list/list" class="x-list"
            xid="list1" data="accountData"> 
            <ul class="x-list-template" xid="listTemplateUl1"> 
              <li xid="li1" class="account-list-line" bind-css="{'account-income' : $object.val('fType') == '收入','account-payout' : $object.val('fType') == '支出'}"> 
                <div component="$UI/system/components/justep/row/row" class="x-row x-row-center"
                  xid="row1"> 
                  <div class="x-col" xid="col2" bind-click="listLineClick"> 
                    <div component="$UI/system/components/justep/row/row" class="x-row"
                      xid="row2"> 
                      <div class="x-col" xid="col4"> 
                        <div component="$UI/system/components/justep/output/output"
                          class="x-output h3" xid="output2" bind-ref="ref('fClass')"/> 
                      </div> 
                    </div>  
                    <div component="$UI/system/components/justep/row/row" class="x-row"
                      xid="row3"> 
                      <div class="x-col" xid="col7"> 
                        <div component="$UI/system/components/justep/output/output"
                          class="x-output" xid="output4" bind-ref="ref('fDescription')"/> 
                      </div> 
                    </div> 
                  </div>  
                  <div class="x-col" xid="col3" bind-click="listLineClick"> 
                    <div component="$UI/system/components/justep/row/row" class="x-row"
                      xid="row4"> 
                      <div class="x-col" xid="col10"> 
                        <div component="$UI/system/components/justep/output/output"
                          class="x-output h3" xid="output1" bind-ref="ref('fMoney')"
                          format="0,000.00"/> 
                      </div> 
                    </div>  
                    <div component="$UI/system/components/justep/row/row" class="x-row"
                      xid="row5"> 
                      <div class="x-col" xid="col13"> 
                        <div component="$UI/system/components/justep/output/output"
                          class="x-output" xid="output3" bind-ref="ref('fDate')" format="yyyy-MM-dd"/> 
                      </div> 
                    </div> 
                  </div>  
                  <div class="x-col x-col-fixed" xid="col1" style="width:50px;"> 
                    <a component="$UI/system/components/justep/button/button"
                      class="btn btn-link btn-only-icon account-delete" label="删除"
                      xid="deleteBtn" icon="icon-android-close" onClick="deleteBtnClick"> 
                      <i xid="i3" class="icon-android-close"/>  
                      <span xid="span3">删除</span> 
                    </a> 
                  </div> 
                </div> 
              </li> 
            </ul> 
          </div> 
        </div>  
        <div class="x-content-center x-pull-up" xid="div6"> 
          <span class="x-pull-up-label" xid="span4">加载更多...</span> 
        <div component="$UI/system/components/justep/pagerBar/pagerBar" class="x-pagerbar container-fluid" xid="pagerBar1">
   <div class="row" xid="div7">
    <div class="col-sm-3" xid="div8">
     <div class="x-pagerbar-length" xid="div9">
      <label component="$UI/system/components/justep/pagerLimitSelect/pagerLimitSelect" class="x-pagerlimitselect" xid="pagerLimitSelect1">
       <span xid="span6">显示</span>
       <select component="$UI/system/components/justep/select/select" class="form-control input-sm" xid="select1">
        <option value="10" xid="default1">10</option>
        <option value="20" xid="default3">20</option>
        <option value="50" xid="default4">50</option>
        <option value="100" xid="default5">100</option></select> 
       <span xid="span7">条</span></label> </div> </div> 
    <div class="col-sm-3" xid="div10">
     <div class="x-pagerbar-info" xid="div11">当前显示0条，共0条</div></div> 
    <div class="col-sm-6" xid="div12">
     <div class="x-pagerbar-pagination" xid="div13">
      <ul class="pagination" component="$UI/system/components/bootstrap/pagination/pagination" xid="pagination1">
       <li class="prev" xid="li2">
        <a href="#" xid="a1">
         <span aria-hidden="true" xid="span8">«</span>
         <span class="sr-only" xid="span9">Previous</span></a> </li> 
       <li class="next" xid="li3">
        <a href="#" xid="a2">
         <span aria-hidden="true" xid="span10">»</span>
         <span class="sr-only" xid="span11">Next</span></a> </li> </ul> </div> </div> </div> </div></div> 
      </div> 
    </div> 
  </div> 
</div>
