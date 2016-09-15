<div 
  xmlns:xui="http://www.justep.com/xui" 
  xmlns:xu="http://www.xmldb.org/xupdate" 
  xmlns="http://www.w3.org/1999/xhtml" 
  component="$UI/system/components/justep/window/window" 
  xid="window" 
  extends="$UI/demo/plugin/template/demo.w" 
  __id="id_1" 
  design="device:m;" 
  class="window" >

  <div xid="div2" xui:update-mode="delete"/>
  <div xid="div3" xui:update-mode="delete"/>
  <div xid="div6" xui:update-mode="delete"/>
  <div xid="div7" xui:update-mode="delete"/>
   <div xid="model" onModelConstructDone="modelModelConstructDone"  xui:update-mode="merge"/>
   <div xid="titleBar" title="ActionSheet"  xui:update-mode="merge"/>
    <p xid="p21_1" xui:parent="infoContent" xui:update-mode="insert" />
   <p xid="p1"  xui:update-mode="merge-and-replace">


ID：cordova-plugin-actionsheet</p>   <p xid="introduceP"  xui:update-mode="merge-and-replace">


弹出一个选择列表，用户点击后，返回选择项的索引。索引从1开始。</p>   <p xid="platformP"  xui:update-mode="merge-and-replace">


Android,IOS</p>    <div style="height:50px;padding:40px" xid="div11_1" xui:parent="demoContent" xui:update-mode="insert" >
<div xid="div51" >
<p >





弹出一个选择列表。可包含&quot;标题&quot;和&quot;取消&quot;功能项。用户选择后，返回选择项的索引，从1开始。</p>
<p >
<br />





 控制参数：<br />
<b >





title</b>





 : 列表的标题 <br />
<b >





buttonLabels</b>





 : 内容项，如：[&quot;微信&quot;,&quot;QQ&quot;]<br />
<b >





addCancelButtonWithLabel</b>





 : 功能按钮显示标签，如：“取消”<br />
<b >





androidEnableCancelButton</b>





 : 是否显示功能按钮</p>
<p >





以分享为例：</p>
</div>
<a class="btn btn-default" component="$UI/system/components/justep/button/button" label="带标题、取消的分享列表" onClick="showWithTitleClick" style="width:100%;" xid="show" >
<i xid="i1" />
<span xid="span211_1" >





delete</span>
</a>
<p />
<a class="btn btn-default" component="$UI/system/components/justep/button/button" label="不带标题、取消的分享列表 " onClick="showNoTitle" style="width:100%;" xid="delete" >
<i xid="i2" />
<span xid="span311_1" >





delete</span>
</a>
</div>
   <div xid="codeContent" style="padding:10px"  xui:update-mode="merge"/>
    <p xid="p1_1" xui:parent="codeContent" xui:update-mode="insert" >
<![CDATA[带标题、取消的列表]]>
</p>
    <div xid="showWithTitleClick" xui:parent="codeContent" xui:update-mode="insert" >
</div>
    <p xid="p22_1" xui:parent="codeContent" xui:update-mode="insert" >
<![CDATA[不带标题、取消的列表]]>
</p>
    <div xid="showNoTitle" xui:parent="codeContent" xui:update-mode="insert" />

</div>