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

  <div xid="row1" xui:update-mode="delete"/>
   <div xid="model" style="height:auto;left:420px;top:12px;"  xui:update-mode="merge"/>
    <div autoLoad="true" component="$UI/system/components/justep/data/data" idColumn="title" xid="readData" xui:parent="model" xui:update-mode="insert" >
<column label="标题" name="title" type="String" xid="xid1_4" />
<column label="图片" name="photo" type="String" xid="xid2_4" />
<data xid="default1_4" >

[{&quot;title&quot;:&quot;英语四六级阅读小窍门&quot;,&quot;photo&quot;:&quot;10.jpg&quot;},{&quot;title&quot;:&quot;段落信息匹配同技巧&quot;,&quot;photo&quot;:&quot;11.jpg&quot;},{&quot;title&quot;:&quot;四级英语长难句分析 &quot;,&quot;photo&quot;:&quot;12.jpg&quot;},{&quot;title&quot;:&quot;2015四级英语考试阅读&quot;,&quot;photo&quot;:&quot;13.jpg&quot;}]</data>
</div>
    <div class="x-scroll" component="$UI/system/components/justep/scrollView/scrollView" xid="scrollView1_13" xui:parent="content1" xui:update-mode="insert" >
<div class="x-content-center x-pull-down container" xid="div1_13" >
<i class="x-pull-down-img glyphicon x-icon-pull-down" xid="i1_13" />
<span class="x-pull-down-label" xid="span1_13" >
下拉刷新...</span>
</div>
<div class="x-scroll-content" xid="div2_13" >
<div __id="id_51" class="x-row" component="$UI/system/components/justep/row/row" style="background-color:#68c398;height:49px;" xid="row1" >
<div __id="id_52" class="x-col x-col-center" xid="col1" >
<a __id="id_53" class="btn btn-link" component="$UI/system/components/justep/button/button" label="英语角" style="color:#FFFFFF;font-size:18px;" xid="button2" >
<i __id="id_54" xid="i2" />
<span __id="id_55" xid="span2" >
英语角</span>
</a>
</div>
<div __id="id_56" class="x-col x-col-fixed" style="width:auto;" xid="col2" >
<a __id="id_57" class="btn btn-link btn-only-icon" component="$UI/system/components/justep/button/button" icon="icon-person" label="button" onClick="openDemo" style="font-size:20px;color:#FFFFFF;height:38px;margin-top:-8px;" urlMapping="login" xid="loginBtn" >
<i __id="id_58" class="icon-person" xid="i3" />
<span __id="id_59" xid="span3" />
</a>
</div>
<div __id="id_60" class="x-col x-col-fixed" style="width:auto;" xid="col3" >
<a __id="id_61" class="btn btn-link btn-only-icon" component="$UI/system/components/justep/button/button" icon="icon-drag" label="button" onClick="menuBtnClick" style="font-size:20px;color:#FFFFFF;height:38px;margin-top:-8px;" xid="menuBtn" >
<i __id="id_62" class="icon-drag" xid="i4" />
<span __id="id_63" xid="span4" />
</a>
</div>
</div>
<div class="x-control-group  x-scroll-view" component="$UI/system/components/justep/controlGroup/controlGroup" title="阅读热点推荐" xid="controlGroup11_13" xui:parent="content1" xui:update-mode="insert" >
<div class="x-control-group-title" xid="controlGroupTitle111_13" >
<span style="font-size:20px;" xid="span111_13" >
title</span>
</div>
<div class="x-list" component="$UI/system/components/justep/list/list" data="readData" xid="list111_13" >
<ul class="x-list-template" xid="listTemplateUl111_13" >
<li xid="li111_13" >
<div class="x-row" component="$UI/system/components/justep/row/row" xid="row111_13" >
<div class="x-col x-col-25" xid="col111_13" >
<img alt="" bind-attr-src=" $model.getImageUrl( $object.val(&quot;photo&quot;))" src="" style="width:100%;" xid="image111_13" />
</div>
<div class="x-col x-col-center" xid="col311_13" >
<div bind-ref="ref('title')" class="x-output" component="$UI/system/components/justep/output/output" style="color:#272727;font-size:20px;" xid="output111_13" />
</div>
</div>
</li>
</ul>
</div>
</div>
</div>
<div class="x-content-center x-pull-up" xid="div3_13" >
<span class="x-pull-up-label" xid="span2_13" >
加载更多...</span>
</div>
</div>

</div>