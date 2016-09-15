<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xmlns:xu="http://www.xmldb.org/xupdate"
  xmlns:xui="http://www.justep.com/xui" __id="id_1" extends="../parent/parent.w" component="$UI/system/components/justep/window/window"
  xid="window" class="window" design="device:m;">  
  <div xid="model" style="height:auto;left:420px;top:12px;" xui:update-mode="merge"/>  
  <div autoLoad="true" component="$UI/system/components/justep/data/data" idColumn="title"
    xid="readData" xui:parent="model" xui:update-mode="insert"> 
    <column label="标题" name="title" type="String" xid="xid1_4"/>  
    <column label="图片" name="photo" type="String" xid="xid2_4"/>  
    <data xid="default1_4">[{"title":"英语四六级阅读小窍门","photo":"10.jpg"},{"title":"段落信息匹配同技巧","photo":"11.jpg"},{"title":"四级英语长难句分析 ","photo":"12.jpg"},{"title":"2015四级英语考试阅读","photo":"13.jpg"}]</data> 
  </div>  
  <div class="x-control-group" component="$UI/system/components/justep/controlGroup/controlGroup"
    title="感谢你使用英语学习软件" xid="controlGroup1_2" xui:parent="content1" xui:update-mode="insert"> 
    <div class="x-control-group-title" xid="controlGroupTitle1_2"> 
      <span xid="span1_2">title</span> 
    </div>  
    <p style="text-indent:2em;margin-top:20px;font-size:18px;">我们希望通过我们的软件您能实现随时随地学习英语，利用零碎的时间提高英语。</p>  
    <p style="text-indent:2em;margin-top:20px;font-size:18px;">提供各种锦囊、干货，让您在考试中仿佛如有神助！</p>  
    <p style="text-indent:2em;margin-top:20px;font-size:18px;">软件主要由写作、单词、阅读、听力四个部分英语学习重点组成。</p> 
  </div> 
</div>
