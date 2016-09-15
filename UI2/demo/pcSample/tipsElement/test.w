<?xml version="1.0" encoding="UTF-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window" component="$UI/system/components/justep/window/window" design="device:m;">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:240px;top:219px;" onLoad="modelLoad"/> 
  <div xid="silu">
	<button bind-click="tips_pop">测试按钮</button>
	</div>
	<div xid="winpop">
	 <div class="title">您有新的消息<span class="close" bind-click="tips_pop">X</span></div>
	    <div class="con">未读信息(1)</div>
	</div>
</div>