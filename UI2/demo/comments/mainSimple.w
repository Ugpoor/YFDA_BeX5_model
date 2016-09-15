<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" component="$UI/system/components/justep/window/window" xid="window">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:57px;top:27px;"> 
    <div component="$UI/system/components/justep/data/data" autoLoad="true"
      xid="data" idColumn="author"> 
      <column label="作者" name="author" type="String" xid="xid1"/>  
      <column label="评论" name="comment" type="String" xid="xid2"/>  
      <data xid="default1">[{"author":"张三","comment":"你好！"},{"author":"李四","comment":"你也好！"}]</data> 
    </div>  
    <div component="$UI/system/components/justep/data/data" autoLoad="true"
      xid="commentData" idColumn="author"> 
      <column label="作者" name="author" type="String" xid="xid3"/>  
      <column label="评论" name="comment" type="String" xid="xid4"/>  
      <data xid="default2">[{}]</data> 
    <rule xid="rule1">
   <col name="author" xid="ruleCol1">
    <required xid="required1">
     <expr xid="default3">true</expr>
     <message xid="default4">请填写作者</message></required> 
    </col> 
   <col name="comment" xid="ruleCol2">
    <required xid="required2">
     <expr xid="default5">true</expr>
     <message xid="default6">请填写评论</message></required> </col> </rule></div> 
  </div>  
  <div xid="view" class="container-fluid"> 
    <h1 xid="title"><![CDATA[评论]]></h1>  
    <div component="$UI/system/components/justep/list/list" class="x-list"
      xid="comments" data="data"> 
      <ul class="x-list-template" xid="listTemplateUl2"> 
        <li xid="li3"> 
          <h2 xid="author" class="author" bind-text="val('author')"><![CDATA[作者]]></h2>  
          <p xid="comment" bind-text="val('comment')"><![CDATA[评论]]></p> 
        </li> 
      </ul> 
    </div>  
    <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label10"
      xid="authorLE"> 
      <label class="x-label" xid="authorL"><![CDATA[作者：]]></label>  
      <div class="x-edit" xid="authorE"> 
        <input component="$UI/system/components/justep/input/input" class="form-control"
          xid="authorInput" bind-ref="commentData.ref('author')"/> 
      </div> 
    </div>  
    <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label10"
      xid="commentLE"> 
      <label class="x-label" xid="commentL"><![CDATA[评论：]]></label>  
      <textarea component="$UI/system/components/justep/textarea/textarea" class="form-control x-edit"
        xid="commentInput" bind-ref="commentData.ref('comment')"/> 
    </div>  
    <a component="$UI/system/components/justep/button/button" class="btn btn-primary pull-right"
      label="提交" xid="submit" onClick="submitClick"> 
      <i xid="i1"/>  
      <span xid="span1">提交</span> 
    </a> 
  </div> 
</div>
