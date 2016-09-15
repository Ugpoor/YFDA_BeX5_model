<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" component="$UI/system/components/justep/window/window" xid="window" design="device:pc;"
  class="window">  
  <div component="$UI/system/components/justep/model/model" style="height:auto;left:520px;top:248px;"> 
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
    <div class="x-panel-top" xid="top1"/>  
    <div class="x-panel-content" xid="content1"> 
      <div xid="div1" style="height:300px;"> 
        <div component="$UI/system/components/justep/picker/picker" class="x-picker"
          xid="list1" data="mainData" disablePullToRefresh="true" disableInfiniteLoad="true"> 
          <div class="x-picker-inner"> 
            <div class="x-pciker-rule x-pciker-rule-ft"/>  
	        <ul class="x-list-template x-pciker-list" xid="listTemplateUl1"> 
	          <li xid="li1" bind-text="val('fClass')"></li> 
	        </ul>  
            <div class="x-pciker-rule x-pciker-rule-bg"/> 
          </div> 
        </div> 
      </div> 
    </div>  
    <div class="x-panel-bottom" xid="bottom1"/> 
  </div> 
</div>