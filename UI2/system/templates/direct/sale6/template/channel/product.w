<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" component="$UI/system/components/justep/window/window" design="device:mobile">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="left:18px;top:83px;height:244px;"> 
    <div component="$UI/system/components/justep/data/data" autoLoad="true"
      xid="data" idColumn="id"> 
      <column label="id" name="id" type="String" xid="default7"/>  
      <column label="imgSrc" name="imgSrc" type="String" xid="default8"/>  
      <column label="title" name="title" type="String" xid="default10"/>  
      <column label="price" name="price" type="Float" xid="default9"/>  
      <column label="number" name="number" type="Integer" xid="xid1"/>  
      <data xid="default11">[{"id":"1","imgSrc":"../img/pic1.jpg","title":"高梵2015韩版新款冬装时尚立领羽绒服","price":199,"number":3332},{"id":"2","imgSrc":"../img/pic2.jpg","title":"EIN言A型修身显瘦连帽羽绒服","price":1945,"number":292},{"id":"3","imgSrc":"../img/pic3.jpg","title":"皇冠绒级进口水貂皮草外套中长款整貂裘皮大衣","price":6000,"number":71},{"id":"4","imgSrc":"../img/pic4.jpg","title":"明星设计师高品质羽绒服","price":269,"number":1001},{"id":"5","imgSrc":"../img/pic5.jpg","title":"2015秋冬新款中长款宽松毛呢外套韩版时尚大码茧型毛呢大衣女","price":99,"number":3251},{"id":"6","imgSrc":"../img/pic6.jpg","title":"2015秋装新款一粒扣长袖小西装女外套修身中长款大码休闲女装西服","price":109,"number":127}]</data> 
    </div> 
  </div>  
  <div component="$UI/system/components/justep/panel/panel" class="x-panel x-full x-card"> 
    <div class="x-panel-top" xid="top1" height="96"> 
      <div component="$UI/system/components/justep/titleBar/titleBar" title="产品中心"
        class="x-titlebar" xid="titleBar1"> 
        <div class="x-titlebar-left" xid="div1"> 
          <a component="$UI/system/components/justep/button/button" label=""
            class="btn btn-link btn-only-icon" icon="icon-chevron-left" onClick="backBtnClick"
            xid="backBtn"> 
            <i class="icon-chevron-left" xid="i1"/>  
            <span xid="span1"/> 
          </a> 
        </div>  
        <div class="x-titlebar-title" xid="div2">产品中心</div>  
        <div class="x-titlebar-right reverse" xid="div3"><a component="$UI/system/components/justep/button/button" class="btn btn-link btn-only-icon" label="button" xid="classBtn" icon="icon-android-sort" onClick="classBtnClick">
   <i xid="i3" class="icon-android-sort"></i>
   <span xid="span8"></span></a></div> 
      </div>  
      <div class="form-group has-feedback"> 
        <input type="text" class="form-control input-sm" id="inputSuccess2" aria-describedby="inputSuccess2Status"/>  
        <span class="glyphicon glyphicon-search form-control-feedback" aria-hidden="true"/> 
      </div> 
    </div>  
    <div class="x-panel-content  x-scroll-view" style="bottom: 0px;"> 
      <div class="x-scroll" component="$UI/system/components/justep/scrollView/scrollView"
        xid="scrollView1"> 
        <div class="x-content-center x-pull-down container" xid="div7"> 
          <i class="x-pull-down-img glyphicon x-icon-pull-down" xid="i2"/>  
          <span class="x-pull-down-label" xid="span5">下拉刷新...</span>
        </div>  
        <div class="x-scroll-content panel-body" xid="div8">
          <div component="$UI/system/components/justep/list/list" class="x-list x-productList"
            xid="list2" data="data" disablePullToRefresh="false" disableInfiniteLoad="false"
            limit="4"> 
            <div component="$UI/system/components/bootstrap/row/row" class="row x-grid-menu6 x-list-template x-min-height"
              xid="row1" componentname="$UI/system/components/bootstrap/row/row(bootstrap)"
              id="undefined_row1"> 
              <div class="col col-xs-6" xid="col1" componentname="$UI/system/components/bootstrap/row/row(bootstrap)#col"
                id="undefined_col1"> 
                <div bind-click="open" xid="div4"> 
                  <img bind-attr-src="$model.getImageUrl(val('imgSrc'))" class="x-img2"
                    xid="image1"/>  
                  <span bind-text="ref('title')" xid="span7" class="x-flex h5 text-black"/>  
                  <div xid="div5"> 
                    <span bind-text="data.ref('number')" class="pull-right"
                      xid="span2"/>  
                    <span xid="span3">￥</span>  
                    <span bind-text="data.ref('price')" class="text-yellow"
                      xid="span4"/> 
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
    </div> 
  </div> 
</div>
