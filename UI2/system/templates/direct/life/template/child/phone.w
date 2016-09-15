<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xmlns:xu="http://www.xmldb.org/xupdate"
  xmlns:xui="http://www.justep.com/xui" __id="id_1" component="$UI/system/components/justep/window/window" extends="../parent/parent.w"
  xid="window" class="window" design="device:m;">  
  <div xid="model" style="height:auto;left:277px;top:63px;" xui:update-mode="merge"/>  
  <div autoLoad="true" component="$UI/system/components/justep/data/data" idColumn="title"
    xid="phoneData" xui:parent="model" xui:update-mode="insert"> 
    <column label="标题" name="title" type="String" xid="xid11_1"/>  
    <data xid="default11111_1">[{"title":"政府机构：XXXXXXXXXXX"},{"title":"举报投诉：XXXXXXXXXXX"},{"title":"快递物流：XXXXXXXXXXX"},{"title":"应急必备：XXXXXXXXXXX"}]</data> 
  </div>  
  <div class="x-control-group" component="$UI/system/components/justep/controlGroup/controlGroup"
    title="便民电话" xid="controlGroup11_6" xui:parent="content1" xui:update-mode="insert"> 
    <div class="x-control-group-title" xid="controlGroupTitle11_6"> 
      <span xid="span11_6"> <![CDATA[
便民电话]]> </span> 
    </div>  
    <ul class="x-list x-list-template" component="$UI/system/components/justep/list/list"
      data="phoneData" xid="list11_6"> 
      <li xid="li11_6"> 
        <div class="x-row" component="$UI/system/components/justep/row/row"
          xid="row11_6"> 
          <div class="x-col" xid="col11_6"> 
            <div bind-ref="ref('title')" class="x-output" component="$UI/system/components/justep/output/output"
              style="font-size:16px;" xid="output21_6"/> 
          </div> 
        </div> 
      </li> 
    </ul> 
  </div> 
</div>
