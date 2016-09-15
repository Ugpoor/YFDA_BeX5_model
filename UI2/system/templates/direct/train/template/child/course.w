<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xmlns:xu="http://www.xmldb.org/xupdate"
  xmlns:xui="http://www.justep.com/xui" __id="id_1" component="$UI/system/components/justep/window/window" extends="../parent/parent.w"
  xid="window" class="window" design="device:m;">  
  <div autoLoad="true" component="$UI/system/components/justep/data/data" idColumn="name"
    xid="courseData" xui:parent="model" xui:update-mode="insert"> 
    <column label="名称" name="name" type="String" xid="xid1"/>  
    <column label="图片" name="img" type="String" xid="xid2"/>  
    <data xid="default1">[{"name":"数学","img":"1.jpg"},{"name":"语文","img":"2.jpg"},{"name":"英语","img":"3.jpg"},{"name":"化学","img":"4.jpg"},{"name":"生物","img":"5.jpg"},{"name":"物理","img":"6.jpg"},{"name":"地理","img":"7.jpg"},{"name":"画图","img":"8.jpg"}]</data> 
  </div>  
  <div class="x-list" component="$UI/system/components/justep/list/list" data="courseData"
    style="margin-left:20px;" xid="list1" xui:parent="content1" xui:update-mode="insert"> 
    <ul class="x-list-template" xid="listTemplateUl1"> 
      <li class="pull-left" style="width:12%;" xid="li1"> 
        <div bind-ref="ref('name')" class="x-output" component="$UI/system/components/justep/output/output"
          style="width:100%;left:20px;font-size:18px;color:#000000;" xid="output1"/> 
      </li> 
    </ul> 
  </div>  
  <div class="kemuCss" xid="div32" xui:parent="content1" xui:update-mode="insert"/>  
  <div class="css1" style="color:#2A2A2A;" xid="div34" xui:parent="content1"
    xui:update-mode="insert"> 
    <div bind-click="subdivClick" xid="subdiv">高三科目高级培训！备战高考！</div>  
    <div style="color:#FF0000;" xid="div35">hot~</div> 
  </div>  
  <div class="css1" style="color:#2A2A2A;" xid="div21_21" xui:parent="content1"
    xui:update-mode="insert"> 
    <div bind-click="subdivClick" xid="div11_21">高二科目高级培训！</div> 
  </div>  
  <div class="css1" style="color:#2A2A2A;" xid="div51_21" xui:parent="content1"
    xui:update-mode="insert"> 
    <div bind-click="subdivClick" xid="div41_21">高一科目高级培训！</div> 
  </div> 
</div>
