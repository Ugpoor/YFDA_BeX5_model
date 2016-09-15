<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" component="$UI/system/components/justep/window/window" design="device:mobile" xid="window">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="left:18px;top:83px;height:244px;"> 
    <div component="$UI/system/components/justep/data/data" autoLoad="true" xid="productData" idColumn="id" onCustomRefresh="productDataCustomRefresh">
   <column label="id" name="id" type="String" xid="column1"></column>
  <column label="图片" name="fImg" type="String" xid="xid2"></column>
  <column label="标题" name="fTitle" type="String" xid="xid3"></column>
  <column label="要点" name="fMainPoints" type="String" xid="xid5"></column>
  <column label="内容" name="fContent" type="String" xid="xid4"></column>
  <data xid="default1"></data></div></div>  
  <div component="$UI/system/components/justep/panel/panel" class="x-panel x-full x-card"> 
    <div class="x-panel-top" xid="top1" height="88"> 
      <div component="$UI/system/components/justep/titleBar/titleBar" title="产品/服务"
        class="x-titlebar" xid="titleBar1"> 
        <div class="x-titlebar-left" xid="div1"> 
          <a component="$UI/system/components/justep/button/button" label=""
            class="btn btn-link btn-only-icon" icon="icon-chevron-left" onClick="{operation:'window.close'}"
            xid="backBtn"> 
            <i class="icon-chevron-left" xid="i1"/>  
            <span xid="span1"/> 
          </a> 
        </div>  
        <div class="x-titlebar-title" xid="div2">产品/服务</div>  
        <div class="x-titlebar-right reverse" xid="div3"></div> 
      </div>  
      <div component="$UI/system/components/justep/button/buttonGroup" class="btn-group btn-group-justified o-class" tabbed="true"><a component="$UI/system/components/justep/button/button" class="btn btn-link btn-only-label active" label="产品" xid="button1" target="content1">
   <i xid="i3"></i>
   <span xid="span8">产品</span></a>
  <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-only-label" label="服务" xid="button2" target="content2">
   <i xid="i4"></i>
   <span xid="span9">服务</span></a></div></div>  
    <div class="x-panel-content  x-cards"> 
      
    <div component="$UI/system/components/justep/contents/contents" class="x-contents x-full" active="0" xid="contents1">
   <div class="x-contents-content" xid="content1"><div class="x-scroll" component="$UI/system/components/justep/scrollView/scrollView" xid="scrollView1"> 
        <div class="x-content-center x-pull-down container" xid="div7"> 
          <i class="x-pull-down-img glyphicon x-icon-pull-down" xid="i2" />  
          <span class="x-pull-down-label" xid="span5">下拉刷新...</span>
        </div>  
        <div class="x-scroll-content panel-body" xid="div8">
          <div component="$UI/system/components/justep/list/list" class="x-list x-productList" xid="list2" data="productData" disablePullToRefresh="false" disableInfiniteLoad="false" limit="4"> 
            <div component="$UI/system/components/bootstrap/row/row" class="row x-grid-menu6 x-list-template x-min-height" xid="row1" componentname="$UI/system/components/bootstrap/row/row(bootstrap)" id="undefined_row1"> 
              <div class="col col-xs-6" xid="col1" componentname="$UI/system/components/bootstrap/row/row(bootstrap)#col" id="undefined_col1"> 
                <div bind-click="open"> 
                  <img bind-attr-src="$model.getImageUrl(&quot;.&quot;+val('fImg'))" class="img-responsive" xid="image1" />  
                    
                  <div class="panel-body"> 
                    <span bind-text="ref('fTitle')" xid="span7" class="x-flex h4" /><span bind-text="ref('fMainPoints')" class="text-muted" xid="span4" /> 
                  </div> 
                </div> 
              </div> 
            </div> 
          </div>
        </div>  
        <div class="x-content-center x-pull-up" xid="div9"> 
          <span class="x-pull-up-label" xid="span6">加载更多...</span>
        </div> 
      </div>
  <div xid="div12"></div></div>
  <div class="x-contents-content  x-scroll-view" xid="content2"><div class="x-scroll" component="$UI/system/components/justep/scrollView/scrollView" xid="scrollView2">
   <div class="x-content-center x-pull-down container" xid="div6">
    <i class="x-pull-down-img glyphicon x-icon-pull-down" xid="i5"></i>
    <span class="x-pull-down-label" xid="span13">下拉刷新...</span></div> 
   <div class="x-scroll-content panel-body" xid="div5">
    <div component="$UI/system/components/justep/list/list" class="x-list x-productList" xid="list1" data="productData" disablePullToRefresh="false" disableInfiniteLoad="false" limit="4">
     <div component="$UI/system/components/bootstrap/row/row" class="row x-grid-menu6 x-list-template x-min-height" xid="row2" componentname="$UI/system/components/bootstrap/row/row(bootstrap)" id="undefined_row1">
      <div class="col col-xs-6" xid="col2" componentname="$UI/system/components/bootstrap/row/row(bootstrap)#col" id="undefined_col1">
       <div bind-click="open">
   <img bind-attr-src="$model.getImageUrl(&quot;.&quot;+val('fImg'))" class="img-responsive" xid="image2"></img>
   <div class="panel-body" xid="div11">
    <span bind-text="ref('fTitle')" xid="span2" class="x-flex h4"></span>
    <span bind-text="ref('fMainPoints')" class="text-muted" xid="span3"></span></div> </div></div> </div> </div> </div> 
   <div class="x-content-center x-pull-up" xid="div4">
    <span class="x-pull-up-label" xid="span10">加载更多...</span></div> </div></div></div></div> 
  </div> 
</div>
