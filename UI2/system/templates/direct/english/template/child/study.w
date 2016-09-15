<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xmlns:xu="http://www.xmldb.org/xupdate"
  xmlns:xui="http://www.justep.com/xui" __id="id_1" component="$UI/system/components/justep/window/window" extends="../parent/parent.w"
  xid="window" class="window" design="device:m;">  
  <div xid="model" style="height:auto;left:420px;top:12px;" xui:update-mode="merge"/>  
  <div autoLoad="true" component="$UI/system/components/justep/data/data" idColumn="title"
    xid="readData" xui:parent="model" xui:update-mode="insert"> 
    <column label="标题" name="title" type="String" xid="xid1_4"/>  
    <column label="图片" name="photo" type="String" xid="xid2_4"/>  
    <data xid="default1_4">[{"title":"英语四六级阅读小窍门","photo":"10.jpg"},{"title":"段落信息匹配同技巧","photo":"11.jpg"},{"title":"四级英语长难句分析 ","photo":"12.jpg"},{"title":"2015四级英语考试阅读","photo":"13.jpg"}]</data> 
  </div>  
  <div style="font-size:18px;margin:20px 20px 20px 20px;" xid="div1_10" xui:parent="content1"
    xui:update-mode="insert">欢迎来到学习社区</div> 
</div>
