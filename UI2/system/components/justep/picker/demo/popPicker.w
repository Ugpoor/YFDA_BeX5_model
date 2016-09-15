<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window" component="$UI/system/components/justep/window/window">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="position:absolute;;left:15.0px;top:54.0px"
    onLoad="modelLoad"> 
    <div component="$UI/system/components/justep/data/baasData" autoLoad="true"
      xid="mainData" idColumn="fID" limit="5" saveAction="saveAccount" queryAction="queryAccount"
      tableName="account" url="/justep/account" confirmDelete="false"> 
      <column label="主键" name="fID" type="String" xid="xid3"/>  
      <column label="创建时间" name="fCreateTime" type="DateTime" xid="xid4"/>  
      <column label="日期" name="fDate" type="Date" xid="xid5"/>  
      <column label="金额" name="fMoney" type="Decimal" xid="xid6"/>  
      <column label="备注" name="fDescription" type="String" xid="xid7"/>  
      <column label="收入\支出" name="fType" type="String" xid="xid8"/>  
      <column label="分类" name="fClass" type="String" xid="xid9"/>  
      <data xid="default2">[]</data>  
      <treeOption xid="default7" parentRelation="fID"/> 
    </div> 
  </div>  
  <div component="$UI/system/components/justep/panel/panel" class="x-panel x-full"
    xid="panel1"> 
    <div class="x-panel-top" xid="top1"> 
      <div component="$UI/system/components/justep/titleBar/titleBar" class="x-titlebar"
        xid="titleBar1" title="popPicker"> 
        <div class="x-titlebar-left" xid="div1"> 
          <a component="$UI/system/components/justep/button/button" class="btn btn-link"
            xid="button1" icon="icon-chevron-left" onClick="closeWin"> 
            <i xid="i1" class="icon-chevron-left"/>  
            <span xid="span1"/> 
          </a> 
        </div>  
        <div class="x-titlebar-title" xid="div2">popPicker</div>  
        <div class="x-titlebar-right reverse" xid="div3"> 
          <a component="$UI/system/components/justep/button/button" class="btn btn-link"
            xid="button6" onClick="show" label="click me"> 
            <i xid="i6"/>  
            <span xid="span6">click me</span> 
          </a> 
        </div> 
      </div> 
    </div>  
    <div class="x-panel-content" xid="content1"> 
      <div component="$UI/system/components/justep/controlGroup/controlGroup"
        class="x-control-group" title="title" xid="controlGroup1"> 
        <h3 style="height:48px;vertical-align: middle;padding: 8px;display: inline-block;">popPicker</h3>  
        <a component="$UI/system/components/justep/button/button" class="btn btn-link"
          label="js" onClick="showJsSource"> 
          <i/>  
          <span>js</span> 
        </a>  
        <a component="$UI/system/components/justep/button/button" class="btn btn-link"
          label="源码" onClick="showPopMenuSource" bind-visible="isVisible"> 
          <i/>  
          <span>源码</span> 
        </a>  
        <p>1、点击右上角按钮，取消点击其他地方即可</p> 
      </div>  
      <div class="x-panel-bottom" xid="bottom1"/> 
    </div>  
    <div id="aler"/>  
    <span component="$UI/system/components/justep/windowDialog/windowDialog"
      xid="windowDialog" src="$UI/system/components/justep/common/demo/dialog.w" status="normal"/>  
    <div component="$UI/system/components/justep/picker/popPicker" class="x-popPicker"
      xid="popPicker" dismissible="true"> 
      <div class="x-popPicker-overlay" xid="div4"/>  
      <div class="x-popPicker-content"> 
        <div class="x-poppicker-header"> 
          <button class="btn btn-default x-btn-ok">确定 </button>
        </div>  
        <div component="$UI/system/components/justep/picker/picker" class="x-picker x-picker-2"
          xid="list2" data="mainData"> 
          <div class="x-picker-inner"> 
            <div class="x-pciker-rule x-pciker-rule-ft"/>  
            <ul class="x-list-template x-pciker-list" xid="listTemplateUl2"> 
              <li xid="li2" bind-text="val('fDate')"/> 
            </ul>  
            <div class="x-pciker-rule x-pciker-rule-bg"/> 
          </div> 
        </div>
        <div component="$UI/system/components/justep/picker/picker" class="x-picker x-picker-2"
          xid="list1" data="mainData"> 
          <div class="x-picker-inner"> 
            <div class="x-pciker-rule x-pciker-rule-ft"/>  
            <ul class="x-list-template x-pciker-list" xid="listTemplateUl1"> 
              <li xid="li1" bind-text="val('fClass')"/> 
            </ul>  
            <div class="x-pciker-rule x-pciker-rule-bg"/> 
          </div> 
        </div>
      </div> 
    </div> 
  </div> 
</div>
