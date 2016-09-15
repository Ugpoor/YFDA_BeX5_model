<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xmlns:xu="http://www.xmldb.org/xupdate"
  xmlns:xui="http://www.justep.com/xui" __id="id_1" extends="../parent/parent.w" component="$UI/system/components/justep/window/window"
  xid="window" class="window" design="device:m;">  
  <div xid="model" style="height:auto;left:125px;top:22px;" xui:update-mode="merge"/>  
  <div autoLoad="true" component="$UI/system/components/justep/data/data" idColumn="title"
    xid="infoData" xui:parent="model" xui:update-mode="insert"> 
    <column label="标题" name="title" type="String" xid="xid1_4"/>  
    <data xid="default111_5">[{"title":"日常信息：XXXXXXXXXX"},{"title":"公交信息：XXXXXXXXXXXXXXXXX"},{"title":"社会信息：XXXXXXXXXXXX"}]</data> 
  </div>  
  <div class="x-control-group" component="$UI/system/components/justep/controlGroup/controlGroup"
    title="信息百科" xid="controlGroup1_4" xui:parent="content1" xui:update-mode="insert"> 
    <div class="x-control-group-title" xid="controlGroupTitle1_4"> 
      <span xid="span1_4"> <![CDATA[信息百科]]> </span> 
    </div>  
    <ul class="x-list x-list-template" component="$UI/system/components/justep/list/list"
      data="infoData" xid="list1_4"> 
      <li xid="li1_4"> 
        <div class="x-row" component="$UI/system/components/justep/row/row"
          xid="row1_5"> 
          <div class="x-col" xid="col1_5"> 
            <div bind-ref="ref('title')" class="x-output" component="$UI/system/components/justep/output/output"
              style="font-size:16px;" xid="output2_5"/> 
          </div> 
        </div> 
      </li> 
    </ul> 
  </div> 
</div>
