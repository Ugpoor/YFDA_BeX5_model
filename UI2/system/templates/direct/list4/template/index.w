<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window" component="$UI/system/components/justep/window/window"
  design="device:m;">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:146px;top:232px;"> 
    <div component="$UI/system/components/justep/data/data" autoLoad="true"
      xid="booksData" idColumn="id" confirmRefresh="true" limit="20"> 
      <column label="id" name="id" type="String" xid="xid1"/>  
      <column label="店铺ID" name="fShopID " type="String" xid="xid2"/>  
      <column label="标题" name="fTitle " type="String" xid="xid3"/>  
      <column label="图片" name="fImg " type="String" xid="xid4"/>  
      <column label="价格" name="fPrice " type="String" xid="xid5"/>  
      <column label="人气" name="fRecord " type="Integer" xid="xid6"/>  
      <column label="原价" name="fOder" type="String" xid="xid7"/>  
      <data xid="default1">[{"id":"1","fShopID ":"f00105411","fTitle ":"疯狂Java讲义精粹(第2版)","fImg ":"./img/1.jpg","fPrice ":"52","fRecord ":125,"fOder":"￥89"},{"id":"2","fShopID ":"f00105411","fTitle ":"Java从入门到精通","fImg ":"./img/2.jpg","fPrice ":"31","fRecord ":250,"fOder":"￥50"},{"id":"3","fShopID ":"f00105411","fTitle ":"疯狂Java讲义精粹(第2版)","fImg ":"./img/1.jpg","fPrice ":"52","fRecord ":125,"fOder":"￥89"},{"id":"4","fShopID ":"f00105411","fTitle ":"Java从入门到精通","fImg ":"./img/2.jpg","fPrice ":"31","fRecord ":250,"fOder":"￥50"},{"id":"5","fShopID ":"f00105411","fTitle ":"疯狂Java讲义精粹(第2版)","fImg ":"./img/1.jpg","fPrice ":"52","fRecord ":125,"fOder":"￥89"},{"id":"6","fShopID ":"f00105411","fTitle ":"Java从入门到精通","fImg ":"./img/2.jpg","fPrice ":"31","fRecord ":250,"fOder":"￥50"}]</data> 
    </div> 
  </div>  
  <div component="$UI/system/components/justep/panel/panel" class="x-panel x-full"
    xid="panel2"> 
    <div class="x-panel-top" xid="top1" height="100"> 
      <div component="$UI/system/components/justep/titleBar/titleBar" class="x-titlebar"
        xid="titleBar1" title="我的书库"> 
        <div class="x-titlebar-left" xid="left1"/>  
        <div class="x-titlebar-title" xid="title1">我的书库</div>  
        <div class="x-titlebar-right reverse" xid="right1"> 
          <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-only-icon"
            label="button" xid="cBtn" icon="icon-compose"> 
            <i xid="i4" class="icon-compose"/>  
            <span xid="span4"/> 
          </a> 
        </div> 
      </div>  
      <div xid="div4"> 
        <div component="$UI/system/components/justep/row/row" class="x-row"
          xid="row1"> 
          <div xid="col2" class="x-col "/>  
          <div class="x-col x-col-90 pull-right" xid="col1"> 
            <div component="$UI/system/components/justep/button/buttonGroup"
              class="btn-group btn-group-justified" tabbed="true" xid="buttonGroup3"
              style="height:10px;"> 
              <a component="$UI/system/components/justep/button/button" class="btn btn-default"
                label="宝贝收藏" xid="addBtn" target="bookshelvesContent"> 
                <i xid="i8"/>  
                <span xid="span11">宝贝收藏</span> 
              </a>  
              <a component="$UI/system/components/justep/button/button" class="btn btn-default"
                label="店铺收藏" xid="collectionBtn" target="content3"> 
                <i xid="i10"/>  
                <span xid="span12">店铺收藏</span> 
              </a> 
            </div> 
          </div>  
          <div class="x-col" xid="col3"/> 
        </div> 
      </div> 
    </div>  
    <div class="x-panel-content  x-scroll-view" xid="content1" _xid="C6F5A9AD87B000014B2C1F702F301BBF"> 
      <div component="$UI/system/components/justep/contents/contents" class="x-contents x-full"
        active="0" xid="contents1"> 
        <div class="x-contents-content" xid="bookshelvesContent"> 
          <div class="x-scroll" component="$UI/system/components/justep/scrollView/scrollView"
            xid="scrollView1"> 
            <div class="x-content-center x-pull-down container" xid="div1"> 
              <i class="x-pull-down-img glyphicon x-icon-pull-down" xid="i5"/>  
              <span class="x-pull-down-label" xid="span5">下拉刷新...</span> 
            </div>  
            <div class="x-scroll-content" xid="div2"> 
              <div component="$UI/system/components/justep/list/list" class="x-list"
                xid="bookList" data="booksData" disablePullToRefresh="false"> 
                <ul class="x-list-template list-group" xid="listTemplateUl1"> 
                  <li xid="li1" class="list-group-item"> 
                    <div xid="div25" class="media"> 
                      <div xid="div5" class="media-left"> 
                        <img alt="" xid="image" class="img-rounded media-object"
                          dir="rtl" bind-attr-src=" $model.toUrl(val(&quot;fImg &quot;))" style="height:80px;width:70px;"/> 
                      </div>  
                      <div xid="div6" class="media-body"> 
                        <h5 xid="h51" bind-text="ref('fTitle ')" class="media-heading lead text-black"
                          style="color:#000000;font-size:medium;"><![CDATA[]]></h5>  
                        <div xid="div7"> 
                          <span xid="span9" style="color:#FF0000;font-size:x-large;"><![CDATA[￥]]></span>  
                          <span xid="price" class="text-danger" bind-text="ref('fPrice ')"
                            style="color:#FF0000;font-size:x-large;"/>  
                          <span xid="olderPrice" bind-text="ref('fOder')" class="tb-text-del"
                            style="font-size:xx-small; margin-left:10px;"/> 
                        </div>  
                        <div xid="div11"> 
                          <span xid="span18" style="font-size:xx-small;"><![CDATA[人气]]></span>  
                          <span xid="span19" bind-text="ref('fRecord ')" style="font-size:xx-small;"/> 
                        </div> 
                      </div>  
                      <div xid="nextDiv" class="media-right"> 
                        <a component="$UI/system/components/justep/button/button"
                          class="btn btn-link btn-only-icon" label="button" xid="nextBtn"
                          icon="icon-chevron-right" target="content3"> 
                          <i xid="i9" class="icon-chevron-right" style="color:#C0C0C0;"/>  
                          <span xid="span14"/> 
                        </a> 
                      </div> 
                    </div> 
                  </li> 
                </ul> 
              </div> 
            </div>  
            <div class="x-content-center x-pull-up" xid="div3"> 
              <span class="x-pull-up-label" xid="span6">加载更多...</span> 
            </div> 
          </div> 
        </div>  
        <div class="x-contents-content" xid="content3"/> 
      </div> 
    </div>  
    <div class="x-panel-bottom" xid="bottom1"> 
      <div component="$UI/system/components/justep/button/buttonGroup" class="btn-group x-card btn-group-justified"
        tabbed="true" xid="buttonGroup1" selected="bookshelvesBtn"> 
        <a component="$UI/system/components/justep/button/button" class="btn btn-default btn-icon-top"
          label="书架" xid="bookshelvesBtn" icon="icon-android-note" target="bookshelvesContent"> 
          <i xid="i1" class="icon-android-note"/>  
          <span xid="span1">书架</span> 
        </a>  
        <a component="$UI/system/components/justep/button/button" class="btn btn-default btn-icon-top"
          xid="bookcityBtn" icon="icon-stats-bars" label="书城" target="content3"> 
          <i xid="i2" class="icon-stats-bars"/>  
          <span xid="span2">书城</span> 
        </a>  
        <a component="$UI/system/components/justep/button/button" class="btn btn-default btn-icon-top"
          label="个人中心" xid="ownBtn" icon="icon-android-contact"> 
          <i xid="i3" class="icon-android-contact"/>  
          <span xid="span3">个人中心</span> 
        </a> 
      </div> 
    </div> 
  </div> 
</div>
