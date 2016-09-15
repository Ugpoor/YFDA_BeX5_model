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

   <div xid="model" style="height:auto;left:100px;top:1px;"  xui:update-mode="merge"/>
    <div autoLoad="true" component="$UI/system/components/justep/data/data" idColumn="title" xid="categoryData" xui:parent="model" xui:update-mode="insert" >
<column label="名称" name="title" type="String" xid="xid1_1" />
<column label="图片" name="photo" type="String" xid="xid2_1" />
<data xid="default111_1" >

[{&quot;title&quot;:&quot;日常新闻&quot;,&quot;photo&quot;:&quot;2.jpg&quot;},{&quot;title&quot;:&quot;生活社区&quot;,&quot;photo&quot;:&quot;3.jpg&quot;},{&quot;title&quot;:&quot;休闲娱乐&quot;,&quot;photo&quot;:&quot;4.jpg&quot;},{&quot;title&quot;:&quot;联盟商家&quot;,&quot;photo&quot;:&quot;5.jpg&quot;},{&quot;title&quot;:&quot;本地商城&quot;,&quot;photo&quot;:&quot;6.jpg&quot;},{&quot;title&quot;:&quot;日常咨询&quot;,&quot;photo&quot;:&quot;7.jpg&quot;},{&quot;title&quot;:&quot;商场优惠&quot;,&quot;photo&quot;:&quot;8.jpg&quot;},{&quot;title&quot;:&quot;团购商家&quot;,&quot;photo&quot;:&quot;9.jpg&quot;},{&quot;title&quot;:&quot;品牌商家&quot;,&quot;photo&quot;:&quot;10.jpg&quot;},{&quot;title&quot;:&quot;急速快递&quot;,&quot;photo&quot;:&quot;11.jpg&quot;},{&quot;title&quot;:&quot;快餐外卖&quot;,&quot;photo&quot;:&quot;12.jpg&quot;},{&quot;title&quot;:&quot;超市折扣&quot;,&quot;photo&quot;:&quot;13.jpg&quot;}]</data>
</div>
    <div class="btn-group btn-group-justified" component="$UI/system/components/justep/button/buttonGroup" style="background-color:#e63d3e;margin-top:-2px;" tabbed="true" xid="buttonGroup1_1" xui:parent="content1" xui:update-mode="insert" >
<a class="btn btn-link" component="$UI/system/components/justep/button/button" label="折扣商家" onClick="openDemo" style="color:#FFFFFF;" urlMapping="business" xid="busiBtn" >
<i xid="i1_1" />
<span xid="span1_1" >

折扣商家</span>
</a>
<a class="btn btn-link" component="$UI/system/components/justep/button/button" label="信息百科" onClick="openDemo" style="color:#FFFFFF;" urlMapping="information" xid="infoBtn" >
<i xid="i2_1" />
<span xid="span2_1" >

信息百科</span>
</a>
<a class="btn btn-link" component="$UI/system/components/justep/button/button" label="便民电话" onClick="openDemo" style="color:#FFFFFF;" urlMapping="phone" xid="phoneBtn" >
<i xid="i3_1" />
<span xid="span3_1" >

便民电话</span>
</a>
<a class="btn btn-link" component="$UI/system/components/justep/button/button" label="联系我们" onClick="openDemo" style="color:#FFFFFF;" urlMapping="connection" xid="connectBtn" >
<i xid="i4_1" />
<span xid="span4_1" >

联系我们</span>
</a>
</div>
    <img alt="" bind-attr-src=" $model.getImageUrl('1.jpg')" src="" style="width:100%;" xid="image1_3" xui:parent="content1" xui:update-mode="insert" />
    <a class="btn btn-link center-block" component="$UI/system/components/justep/button/button" label="签到挣积分" style="background-color:#e63d3e;width:50%;color:#FFFFFF;font-size:18px;border-radius:8px;margin-top:10px;" xid="signBtn" xui:parent="content1" xui:update-mode="insert" >
<i xid="i1_4" />
<span xid="span1_4" >

签到挣积分</span>
</a>
    <div style="border-bottom: 2px #e63d3e solid;margin-top:10px;" xid="div1_1" xui:parent="content1" xui:update-mode="insert" />
    <div class="x-control-group" component="$UI/system/components/justep/controlGroup/controlGroup" style="height:auto;" title="便民生活导航" xid="controlGroup1_1" xui:parent="content1" xui:update-mode="insert" >
<div class="x-control-group-title" style="font-size:18px;" xid="controlGroupTitle1_1" >
<span xid="span5_1" >
<![CDATA[便民生活导航]]>
</span>
</div>
<div class="x-list x-cards" component="$UI/system/components/justep/list/list" data="categoryData" style="width:100%;" xid="list1_1" >
<ul class="x-list-template" xid="listTemplateUl1_1" >
<li bind-click="categoryClick" class="pull-left" style="width:33.33%;height:120px;" xid="category" >
<img alt="" bind-attr-src=" $model.getImageUrl( $object.val(&quot;photo&quot;))" class="center-block" src="" style="width:80%;" xid="image1_2" />
<div bind-ref="ref('title')" class="x-output center-block" component="$UI/system/components/justep/output/output" style="width:60%;font-size:14px;" xid="output11_1" />
</li>
</ul>
</div>
<div class="x-row" component="$UI/system/components/justep/row/row" style="width:100%;margin-top:0px;" xid="row15" xui:parent="content1" xui:update-mode="insert" >
<div class="x-col x-col-25 x-col-center" xid="col11" >
<label class="pull-right" xid="label9" >

分享到：</label>
</div>
<div class="x-col x-col-fixed" style="width:auto;" xid="col12" >
<img alt="" bind-attr-src="$model.getImageUrl('2.gif')" style="width:95%;" xid="image10" />
</div>
<div class="x-col x-col-fixed" style="width:auto;" xid="col13" >
<img alt="" bind-attr-src="$model.getImageUrl('3.gif')" style="width:95%;" xid="image11" />
</div>
<div class="x-col x-col-fixed" style="width:auto;" xid="col20" >
<img alt="" bind-attr-src="$model.getImageUrl('4.gif')" style="width:95%;" xid="image12" />
</div>
<div class="x-col x-col-fixed" style="width:auto;" xid="col21" >
<img alt="" bind-attr-src="$model.getImageUrl('5.gif')" style="width:95%;" xid="image13" />
</div>
<div class="x-col x-col-fixed" style="width:auto;" xid="col24" >
<img alt="" bind-attr-src="$model.getImageUrl('6.gif')" style="width:95%;" xid="image14" />
</div>
</div>
</div>

</div>