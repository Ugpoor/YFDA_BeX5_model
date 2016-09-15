<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xmlns:xu="http://www.xmldb.org/xupdate"
  xmlns:xui="http://www.justep.com/xui" __id="id_1" component="$UI/system/components/justep/window/window" extends="../parent/parent.w"
  xid="window" class="window" design="device:m;">  
  <div xid="model" style="height:auto;left:420px;top:12px;" xui:update-mode="merge"/>  
  <div autoLoad="true" component="$UI/system/components/justep/data/data" idColumn="word"
    xid="wordData" xui:parent="model" xui:update-mode="insert"> 
    <column label="单词" name="word" type="String" xid="xid1"/>  
    <data xid="default1">[{"word":"四级单词"},{"word":"六级单词"},{"word":"考研单词"}]</data> 
  </div>  
  <img alt="" bind-attr-src=" $model.getImageUrl('9.jpg')" src="" style="width:100%;"
    xid="image1" xui:parent="content1" xui:update-mode="insert"/>  
  <div class="titleCss" xid="div3" xui:parent="content1" xui:update-mode="insert">敬请期待</div> 
</div>
