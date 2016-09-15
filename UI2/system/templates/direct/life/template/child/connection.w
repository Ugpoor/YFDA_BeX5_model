<div 
  xmlns:xu="http://www.xmldb.org/xupdate" 
  xmlns:xui="http://www.justep.com/xui" 
  __id="id_1" 
  component="$UI/system/components/justep/window/window" 
  extends="../parent/parent.w" 
  xid="window" 
  class="window" 
  xmlns="http://www.w3.org/1999/xhtml" 
  design="device:m;" >

   <div xid="model" style="height:auto;left:138px;top:3px;"  xui:update-mode="merge"/>
    <div autoLoad="true" component="$UI/system/components/justep/data/data" idColumn="title" xid="connectData" xui:parent="model" xui:update-mode="insert" >
<column label="标题" name="title" type="String" xid="xid1_4" />
<column label="内容" name="content" type="String" xid="xid2_4" />
<data xid="default1_4" >

[{&quot;title&quot;:&quot;QQ：&quot;,&quot;content&quot;:&quot;XXXXXXXXXXX&quot;},{&quot;title&quot;:&quot;微信：&quot;,&quot;content&quot;:&quot;XXXXXXXXXX&quot;},{&quot;title&quot;:&quot;地址：&quot;,&quot;content&quot;:&quot;XXXXXXXXX&quot;}]</data>
</div>
    <div class="x-control-group" component="$UI/system/components/justep/controlGroup/controlGroup" title="联系方式" xid="controlGroup1_4" xui:parent="content1" xui:update-mode="insert" >
<div class="x-control-group-title" xid="controlGroupTitle1_4" >
<span xid="span1_4" >
<![CDATA[联系方式]]>
</span>
</div>
<div class="x-list" component="$UI/system/components/justep/list/list" data="connectData" xid="list1_4" >
<ul class="x-list-template" xid="listTemplateUl1_4" >
<li xid="li1_4" >
<div class="x-row" component="$UI/system/components/justep/row/row" style="font-size:16px;" xid="row1_4" >
<div class="x-col x-col-fixed" style="width:auto;" xid="col1_4" >
<label bind-text="ref('title')" style="font-size:16px;" xid="label1_4" >

label</label>
</div>
<div class="x-col" xid="col3_4" >
<div bind-ref="ref('content')" class="x-output" component="$UI/system/components/justep/output/output" style="margin-top:-5px;font-size:16px;" xid="output1_4" />
</div>
</div>
</li>
</ul>
</div>
<div class="x-row" component="$UI/system/components/justep/row/row" xid="row2_4" >
<div class="x-col" xid="col4_4" >
<a class="btn btn-link" component="$UI/system/components/justep/button/button" icon="icon-android-call" label="电话联系" style="background-color:#e63d3e;border-radius:8px;color:#FFFFFF;font-size:16px;" xid="telBtn" >
<i class="icon-android-call" xid="i1_4" />
<span xid="span2_4" >

电话联系</span>
</a>
</div>
<div class="x-col" xid="col6_4" >
<a class="btn btn-link" component="$UI/system/components/justep/button/button" icon="icon-android-mail" label="短信联系" style="background-color:#e63d3e;border-radius:8px;color:#FFFFFF;font-size:16px;" xid="messBtn" >
<i class="icon-android-mail" xid="i2_4" />
<span xid="span3_4" >

短信联系</span>
</a>
</div>
</div>
</div>

</div>