<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" component="$UI/system/components/justep/window/window" xid="window">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:57px;top:27px;"> 
    <div component="$UI/system/components/justep/data/data" autoLoad="true"
      xid="data" idColumn="author"> 
      <column label="作者" name="author" type="String" xid="xid1"/>  
      <column label="评论" name="comment" type="String" xid="xid2"/>  
      <data xid="default1">[{"author":"张三","comment":"你好！"},{"author":"李四","comment":"你也好！"}]</data> 
    </div> 
  </div>  
  <div xid="view" class="container-fluid"> 
    <h1 xid="title"><![CDATA[评论]]></h1>  
    <div component="$UI/system/components/justep/list/list" class="x-list"
      xid="comments" data="data"> 
      <ul class="x-list-template" xid="listTemplateUl2"> 
        <li xid="li3"> 
          <div component="$UI/system/components/justep/windowContainer/windowContainer"
            class="x-window-container" xid="comment" src="$UI/demo/comments/comment.w"
            params="{author: val('author'), comment: val('comment')}"/> 
        </li> 
      </ul> 
    </div>  
    <div component="$UI/system/components/justep/windowContainer/windowContainer"
      class="x-window-container" xid="commentForm" src="$UI/demo/comments/commentForm.w"
      onReceive="commentFormReceive"/> 
  </div> 
</div>
