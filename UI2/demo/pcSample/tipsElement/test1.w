<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window" component="$UI/system/components/justep/window/window"
  design="device:m;">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:234px;top:225px;"/> 
  <div xid="silu" style="font-size:13px; color:#999999; position:absolute; left:0; text-align:right; text-decoration:underline; line-height:22px;">
	<a component="$UI/system/components/justep/button/button" class="btn btn-default" label="button" xid="button1" onClick="tips_pop">
   <i xid="i1"></i>
   <span xid="span1"></span></a></div>
	<div xid="winpop" style="width:200px; height:0px; position:absolute; right:0; bottom:0; border:1px solid #999999; margin:0; padding:1px; overflow:hidden; display:none; background:#FFFFFF">
	 <div class="title" style="width:100%; height:20px; line-height:20px; background:#FFCC00; font-weight:bold; text-align:center; font-size:12px;">您有新的消息
	 	<span class="close" style="position:absolute; right:4px; top:-1px; color:#FFFFFF; cursor:pointer" bind-click="tips_pop">X</span>
	 </div>
	 <div class="con" style="width:100%; height:80px; line-height:80px; font-weight:bold; font-size:12px; color:#FF0000; text-decoration:underline; text-align:center">未读信息(1)</div>
	</div>
</div>
