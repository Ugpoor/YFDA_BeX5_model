<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" component="$UI/system/components/justep/window/window" design="device:mobile">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="left:18px;top:83px;height:244px;"
    onLoad="modelLoad"> 
    <div component="$UI/system/components/justep/data/data" autoLoad="true"
      xid="productData" idColumn="id" onCustomRefresh="productDataCustomRefresh"> 
      <column label="id" name="id" type="String" xid="xid1"/>  
      <column label="图片" name="fImg" type="String" xid="xid2"/>  
      <column label="标题" name="fTitle" type="String" xid="xid3"/>  
      <column label="要点" name="fMainPoints" type="String" xid="xid5"/>  
      <column label="内容" name="fContent" type="String" xid="xid4"/>  
      <data xid="default1"/>
    </div> 
  </div>  
  <div component="$UI/system/components/justep/panel/panel" class="x-panel x-full"> 
    <div class="x-panel-top" height="88"> 
      <div component="$UI/system/components/justep/titleBar/titleBar" class="x-titlebar"> 
        <div class="x-titlebar-left"> 
          <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-xs btn-icon-left o-logo"
            label="汽修" xid="button1" icon="icon-wrench"> 
            <i xid="i1" class="icon-wrench"/>  
            <span xid="span6">汽修</span> 
          </a> 
        </div>  
        <div class="x-titlebar-title"/>  
        <div class="x-titlebar-right reverse"> 
          <a component="$UI/system/components/justep/button/button" label=""
            class="btn btn-link btn-only-icon" icon="icon-android-search"> 
            <i class="icon-android-search"/>  
            <span/> 
          </a>  
          <a component="$UI/system/components/justep/button/button" label=""
            class="btn btn-link btn-only-icon" icon="icon-android-reminder"> 
            <i class="icon-android-reminder" xid="i7"/>  
            <span xid="span12"/> 
          </a>  
          <a component="$UI/system/components/justep/button/button" label=""
            class="btn btn-link btn-only-icon" icon="icon-android-mail"> 
            <i class="icon-android-mail" xid="i8"/>  
            <span xid="span13"/> 
          </a> 
        </div> 
      </div>  
      <div component="$UI/system/components/justep/button/buttonGroup" class="btn-group btn-group-justified o-nav"
        tabbed="true" xid="buttonGroup1"> 
        <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-only-label active"
          label="汽修首页" pagename="home" bind-click="pageClick"> 
          <i xid="i2"/>  
          <span xid="span7">汽修首页</span> 
        </a>  
        <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-only-label"
          label="产品/服务" pagename="product" bind-click="pageClick"> 
          <i xid="i3"/>  
          <span xid="span8">产品/服务</span> 
        </a>  
        <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-only-label"
          label="资讯中心" pagename="news" bind-click="pageClick"> 
          <i xid="i4"/>  
          <span xid="span9">资讯中心</span> 
        </a>  
        <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-only-label"
          label="促销活动" pagename="promotion" bind-click="pageClick"> 
          <i xid="i5"/>  
          <span xid="span10">促销活动</span> 
        </a>  
        <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-only-label"
          label="联系我们" pagename="contactUs" bind-click="pageClick"> 
          <i xid="i6"/>  
          <span xid="span11">联系我们</span> 
        </a> 
      </div> 
    </div>  
    <div class="x-panel-content x-cards"> 
      <div class="x-scroll" component="$UI/system/components/justep/scrollView/scrollView"
        xid="scrollView1"> 
        <div class="x-content-center x-pull-down container" xid="div4"> 
          <i class="x-pull-down-img glyphicon x-icon-pull-down" xid="i9"/>  
          <span class="x-pull-down-label" xid="span14">下拉刷新...</span> 
        </div>  
        <div class="x-scroll-content" xid="div5"> 
          <div class="row x-grid-menu7-4"> 
            <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-only-icon pull-left o-nopaddingLR"
              label="button" xid="button9" icon="icon-android-volume"> 
              <i class="icon-android-volume"/>  
              <span xid="span17"/> 
            </a>  
            <span class="pull-left">通知公告：</span>  
            <div class="col cell pull-left"> 
              <div class="card"> 
                <a> 
                  <span bind-click="open">关于我们</span> 
                </a> 
              </div>  
              <div class="card"> 
                <a> 
                  <span bind-click="open">1</span> 
                </a> 
              </div>  
              <div class="card"> 
                <a> 
                  <span bind-click="open">2</span> 
                </a> 
              </div> 
            </div> 
          </div>  
          <div class="panel-body"> 
            <div component="$UI/system/components/bootstrap/carousel/carousel"
              class="x-carousel carousel" xid="carousel1"> 
              <ol class="carousel-indicators" xid="ol1"/>  
              <div class="x-contents carousel-inner" role="listbox" component="$UI/system/components/justep/contents/contents"
                active="0" slidable="true" wrap="true" swipe="true" xid="bannerContents"> 
                <div class="x-contents-content" xid="content1"> 
                  <img class="image-wall o-imgBanner" url="./contents/content1.w"
                    xid="image1" bind-attr-src="$model.getImageUrl('./img/banner1.jpg')"/> 
                </div>  
                <div class="x-contents-content" xid="content2"> 
                  <img class="image-wall o-imgBanner" url="./contents/content2.w"
                    xid="image2" bind-attr-src="$model.getImageUrl('./img/banner2.jpg')"/> 
                </div> 
              </div> 
            </div>  
            <div class="panel-heading o-nopaddingLR o-title" bind-click="pageClick"
              pagename="product"> 
              <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-xs btn-only-icon pull-right o-nopaddingLR text-black"
                label="button" icon="icon-ios7-arrow-forward"> 
                <i xid="i11" class="icon-ios7-arrow-forward"/>  
                <span xid="span18"/>
              </a>
              <span class="h4 text-black"><![CDATA[产品]]></span> 
            </div>  
            <div component="$UI/system/components/justep/list/list" class="x-list o-list"
              data="productData" limit="5"> 
              <ul class="x-list-template" xid="ul2"> 
                <li xid="li2" class="col-xs-12 list-group-item" bind-click="detailOpen"> 
                  <div class="media"> 
                    <div class="media-left"> 
                      <img src="" alt="" class="o-img2" bind-attr-src=" $model.getImageUrl(val(&quot;fImg&quot;))"/> 
                    </div>  
                    <div class="media-body"> 
                      <h5 bind-text="ref('fTitle')"><![CDATA[]]></h5>  
                      <span bind-text="ref('fMainPoints')"/> 
                    </div> 
                  </div> 
                </li> 
              </ul> 
            </div> 
          </div> 
        </div>  
        <div class="x-content-center x-pull-up" xid="div6"> 
          <span class="x-pull-up-label" xid="span15">加载更多...</span> 
        </div> 
      </div>
    </div> 
  </div> 
</div>
