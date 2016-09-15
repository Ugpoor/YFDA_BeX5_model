<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window" component="$UI/system/components/justep/window/window"
  design="device:m;">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:172px;top:187px;"> 
    <div component="$UI/system/components/justep/data/baasData" autoLoad="true"
      xid="accountData" idColumn="fID" limit="5" saveAction="saveAccount" queryAction="queryAccount" tableName="account" url="/justep/account"> 
      <column label="主键" name="fID" type="String" xid="xid3"/>  
      <column label="创建时间" name="fCreateTime" type="DateTime" xid="xid4"/>  
      <column label="日期" name="fDate" type="Date" xid="xid5"/>  
      <column label="金额" name="fMoney" type="Decimal" xid="xid6"/>  
      <column label="备注" name="fDescription" type="String" xid="xid7"/>  
      <column label="收入\支出" name="fType" type="String" xid="xid8"/>  
      <column label="分类" name="fClass" type="String" xid="xid9"/>  
      <data xid="default2">[]</data>
    </div> 
  </div>  
  <span component="$UI/system/components/justep/windowDialog/windowDialog" xid="detailDialog"
    style="left:103px;top:198px;" src="$UI/demo/account/detail.w" title="记账" onReceived="detailDialogReceived"> 
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
        </div> 
      </div> 
    </div> 
  </div> 
</div>
