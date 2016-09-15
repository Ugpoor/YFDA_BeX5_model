<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" class="main13" component="$UI/system/components/justep/window/window"
  design="device:m;" xid="window">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:13px;top:202px;"
    onLoad="modelLoad"> 
    <div component="$UI/system/components/justep/data/data" autoLoad="true"
      xid="newsData" idColumn="fID" onCustomRefresh="productDataCustomRefresh"> 
      <column label="id" name="fID" type="String" xid="xid1"/>  
      <column label="标题" name="fTitle" type="String" xid="xid2"/>  
      <column label="图片" name="fImg" type="String" xid="xid3"/>  
      <column label="摘要" name="fOmit" type="String" xid="xid4"/>  
      <column label="跟帖" name="fPostNumber" type="Integer" xid="xid5"/>  
      <rule xid="rule1"> 
        <col name="fPostNumber" xid="ruleCol1"> 
          <calculate xid="calculate1"> 
            <expr xid="default1">$row.val("fPostNumber")&gt;=0?$row.val("fPostNumber")+"跟贴":"";</expr> 
          </calculate> 
        </col> 
      </rule> 
    </div>  
    <div component="$UI/system/components/justep/data/data" autoLoad="true"
      xid="navData" onCustomRefresh="navDataCustomRefresh"/> 
  </div>  
  <div component="$UI/system/components/justep/popOver/popOver" class="x-popOver x-wangyiOver"
    xid="popOver" style="height:100%;" anchor="navMenuTop" direction="right-bottom"
    opacity="0.5"> 
    <div class="x-popOver-overlay" xid="div2"/>  
    <div xid="div4" class="x-full x-popOver-content panel"> 
      <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-only-icon pull-right"
        icon="icon-ios7-arrow-up" onClick="{operation:'popOver.hide'}" xid="button1"> 
        <i xid="i9" class="text-muted icon-ios7-arrow-up"/> 
      </a>  
      <h5 class="text-muted">切换栏目</h5>  
      <div component="$UI/system/components/bootstrap/row/row" class="row o-nomargin x-navGroup panel-body"
        xid="row2"> 
        <div class="col col-xs-3 " xid="col4"> 
          <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-only-label active"
            label="头条" xid="button3" target="navContent1" onClick="{operation:'popOver.hide'}"> 
            <i xid="i10"/>  
            <span xid="span18">头条</span> 
          </a> 
        </div>  
        <div class="col col-xs-3" xid="col5"> 
          <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-only-label"
            label="娱乐" xid="button4" target="navContent2" onClick="{operation:'popOver.hide'}"> 
            <i xid="i11"/>  
            <span xid="span19">娱乐</span> 
          </a> 
        </div>  
        <div class="col col-xs-3" xid="col6"> 
          <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-only-label"
            label="热点" xid="button6" target="navContent3" onClick="{operation:'popOver.hide'}"> 
            <i xid="i22"/>  
            <span xid="span26">热点</span> 
          </a> 
        </div>  
        <div class="col col-xs-3" xid="col7"> 
          <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-only-label"
            label="体育" xid="button7" target="navContent4" onClick="{operation:'popOver.hide'}"> 
            <i xid="i23"/>  
            <span xid="span27">体育</span> 
          </a> 
        </div>  
        <div class="col col-xs-3" xid="col5"> 
          <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-only-label"
            label="昆明" xid="button4" target="navContent5" onClick="{operation:'popOver.hide'}"> 
            <i xid="i11"/>  
            <span xid="span19">昆明</span> 
          </a> 
        </div>  
        <div class="col col-xs-3" xid="col5"> 
          <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-only-label"
            label="财经" xid="button4" target="navContent6" onClick="{operation:'popOver.hide'}"> 
            <i xid="i11"/>  
            <span xid="span19">财经</span> 
          </a> 
        </div>  
        <div class="col col-xs-3" xid="col5"> 
          <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-only-label"
            label="科技" xid="button4" target="navContent7" onClick="{operation:'popOver.hide'}"> 
            <i xid="i11"/>  
            <span xid="span19">科技</span> 
          </a> 
        </div>  
        <div class="col col-xs-3" xid="col5"> 
          <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-only-label"
            label="图片" xid="button4" target="navContent8" onClick="{operation:'popOver.hide'}"> 
            <i xid="i11"/>  
            <span xid="span19">图片</span> 
          </a> 
        </div>  
        <div class="col col-xs-3" xid="col5"> 
          <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-only-label"
            label="跟帖" xid="button4" target="navContent9" onClick="{operation:'popOver.hide'}"> 
            <i xid="i11"/>  
            <span xid="span19">跟帖</span> 
          </a> 
        </div>  
        <div class="col col-xs-3" xid="col5"> 
          <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-only-label"
            label="直播" xid="button4" target="" onClick="{operation:'popOver.hide'}"> 
            <i xid="i11"/>  
            <span xid="span19">直播</span> 
          </a> 
        </div>  
        <div class="col col-xs-3" xid="col5"> 
          <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-only-label"
            label="时尚" xid="button4" target="" onClick="{operation:'popOver.hide'}"> 
            <i xid="i11"/>  
            <span xid="span19">时尚</span> 
          </a> 
        </div>  
        <div class="col col-xs-3" xid="col5"> 
          <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-only-label o-nopadding"
            label="轻松一刻" xid="button4" target="" onClick="{operation:'popOver.hide'}"> 
            <i xid="i11"/>  
            <span xid="span19">轻松一刻</span> 
          </a> 
        </div>  
        <div class="col col-xs-3" xid="col5"> 
          <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-only-label"
            label="汽车" xid="button4" target="" onClick="{operation:'popOver.hide'}"> 
            <i xid="i11"/>  
            <span xid="span19">汽车</span> 
          </a> 
        </div>  
        <div class="col col-xs-3" xid="col5"> 
          <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-only-label"
            label="段子" xid="button4" target="" onClick="{operation:'popOver.hide'}"> 
            <i xid="i11"/>  
            <span xid="span19">段子</span> 
          </a> 
        </div>  
        <div class="col col-xs-3" xid="col5"> 
          <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-only-label"
            label="军事" xid="button4" target="" onClick="{operation:'popOver.hide'}"> 
            <i xid="i11"/>  
            <span xid="span19">军事</span> 
          </a> 
        </div>  
        <div class="col col-xs-3" xid="col5"> 
          <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-only-label"
            label="房产" xid="button4" target="" onClick="{operation:'popOver.hide'}"> 
            <i xid="i11"/>  
            <span xid="span19">房产</span> 
          </a> 
        </div> 
      </div>  
      <div xid="div9" class="panel-heading" bind-text="'点击添加更多栏目'"/>  
      <div component="$UI/system/components/bootstrap/row/row" class="row o-nomargin x-navGroup panel-body bg-muted"
        xid="row3"> 
        <div class="col col-xs-3" xid="col9"> 
          <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-only-label"
            label="NBA" xid="button11" target=""> 
            <i xid="i25"/>  
            <span xid="span31">NBA</span> 
          </a> 
        </div>  
        <div class="col col-xs-3" xid="col8"> 
          <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-only-label"
            label="社会" xid="button10" target=""> 
            <i xid="i26"/>  
            <span xid="span29">社会</span> 
          </a> 
        </div>  
        <div class="col col-xs-3" xid="col11"> 
          <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-only-label"
            label="哒哒" xid="button8" target=""> 
            <i xid="i27"/>  
            <span xid="span28">哒哒</span> 
          </a> 
        </div>  
        <div class="col col-xs-3" xid="col10"> 
          <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-only-label"
            label="影视" xid="button9" target=""> 
            <i xid="i24"/>  
            <span xid="span30">影视</span> 
          </a> 
        </div>  
        <div class="col col-xs-3" xid="col8"> 
          <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-only-label"
            label="彩票" xid="button10" target=""> 
            <i xid="i26"/>  
            <span xid="span29">彩票</span> 
          </a> 
        </div>  
        <div class="col col-xs-3" xid="col8"> 
          <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-only-label o-nopadding"
            label="中国足球" xid="button10" target=""> 
            <i xid="i26"/>  
            <span xid="span29">中国足球</span> 
          </a> 
        </div>  
        <div class="col col-xs-3" xid="col8"> 
          <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-only-label"
            label="CBA" xid="button10" target=""> 
            <i xid="i26"/>  
            <span xid="span29">CBA</span> 
          </a> 
        </div>  
        <div class="col col-xs-3" xid="col8"> 
          <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-only-label"
            label="跑步" xid="button10" target=""> 
            <i xid="i26"/>  
            <span xid="span29">跑步</span> 
          </a> 
        </div>  
        <div class="col col-xs-3" xid="col8"> 
          <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-only-label"
            label="手机" xid="button10" target=""> 
            <i xid="i26"/>  
            <span xid="span29">手机</span> 
          </a> 
        </div>  
        <div class="col col-xs-3" xid="col8"> 
          <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-only-label"
            label="数码" xid="button10" target=""> 
            <i xid="i26"/>  
            <span xid="span29">数码</span> 
          </a> 
        </div>  
        <div class="col col-xs-3" xid="col8"> 
          <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-only-label o-nopadding"
            label="移动互联" xid="button10" target=""> 
            <i xid="i26"/>  
            <span xid="span29">移动互联</span> 
          </a> 
        </div>  
        <div class="col col-xs-3" xid="col8"> 
          <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-only-label o-nopadding"
            label="云课堂" xid="button10" target=""> 
            <i xid="i26"/>  
            <span xid="span29">云课堂</span> 
          </a> 
        </div> 
      </div> 
    </div> 
  </div>  
  <div component="$UI/system/components/justep/popOver/popOver" class="x-popOver"
    xid="popOverMore" anchor="titleBar" position="center" style="height:100%;"> 
    <div class="x-popOver-overlay" xid="div13"/>  
    <div class="x-full x-popOver-content panel" xid="div14"> 
      <div xid="div15" class="panel-body"> 
        <div xid="div19" class="col-xs-6 pull-left media"> 
          <h1 xid="h11" class="media-left text-danger"><![CDATA[21]]></h1>  
          <div xid="div27" class="media-body"> 
            <span xid="span14" class="text-danger"><![CDATA[℃]]></span>  
            <p xid="p1" bind-text="'10/22℃'"/> 
          </div> 
        </div>  
        <div xid="div26" class="col-xs-6 pull-left text-right"> 
          <img src="" alt="" xid="image15" bind-attr-src="$model.getImageUrl('./main/img/cloud.png')"
            class="img_cloud"/>  
          <div xid="div28" bind-text="'多云 微风'"/>  
          <div xid="div29" bind-text="'昆明'"/> 
        </div>  
        <div xid="div30" class="col-xs-12 pull-left"> 
          <span xid="span21"><![CDATA[2015/10/14 星期五]]></span>  
          <p xid="p2" bind-text="'PM2.5 24 优'"/> 
        </div> 
      </div>  
      <div component="$UI/system/components/bootstrap/row/row" class="row text-center panel-body o-nomargin o-nopadding"
        xid="row4"> 
        <div class="col col-xs-4 o-nopadding" xid="col12"> 
          <img src="" alt="" bind-attr-src="$model.getImageUrl('./main/img/more1.png')"
            class="img3" xid="image5"/>  
          <div bind-text="'搜索'" xid="div25" class="text-muted h6"/> 
        </div>  
        <div class="col col-xs-4 o-nopadding" xid="col14"> 
          <img src="" alt="" bind-attr-src="$model.getImageUrl('./main/img/more2.png')"
            class="img3" xid="image12"/>  
          <div bind-text="'上头条'" xid="div24" class="text-muted h6"/> 
        </div>  
        <div class="col col-xs-4 o-nopadding" xid="col13"> 
          <img src="" alt="" xid="image5" bind-attr-src="$model.getImageUrl('./main/img/more3.png')"
            class="img3"/>  
          <div bind-text="'离线'" xid="div23" class="text-muted h6"/> 
        </div>  
        <div class="col col-xs-4 o-nopadding" xid="col12"> 
          <img src="" alt="" bind-attr-src="$model.getImageUrl('./main/img/more4.png')"
            class="img3" xid="image5"/>  
          <div bind-text="'夜间'" xid="div25" class="text-muted h6"/> 
        </div>  
        <div class="col col-xs-4 o-nopadding" xid="col12"> 
          <img src="" alt="" bind-attr-src="$model.getImageUrl('./main/img/more5.png')"
            class="img3" xid="image5"/>  
          <div bind-text="'扫一扫'" xid="div25" class="text-muted h6"/> 
        </div>  
        <div class="col col-xs-4 o-nopadding" xid="col12"> 
          <img src="" alt="" bind-attr-src="$model.getImageUrl('./main/img/more6.png')"
            class="img3" xid="image5"/>  
          <div bind-text="'邀请好友'" xid="div25" class="text-muted h6"/> 
        </div> 
      </div> 
    </div> 
  </div>  
  <div component="$UI/system/components/justep/panel/panel" class="x-panel x-full x-card top-trans"
    xid="panel1"> 
    <div class="x-panel-content x-cards" xid="content"> 
      <div component="$UI/system/components/justep/contents/contents" class="x-contents x-full"
        active="0" xid="contents1" wrap="false" swipe="false"> 
        <div class="x-contents-content" xid="newsContent"> 
          <div component="$UI/system/components/justep/panel/panel" class="x-panel x-full x-has-iosstatusbar"
            xid="panel7"> 
            <div class="x-panel-top" xid="top1" height="48"> 
              <div component="$UI/system/components/justep/titleBar/titleBar"
                class="x-titlebar" xid="titleBar"> 
                <div class="x-titlebar-left" xid="div1"> 
                  <img src="./main/img/navbar_logo.png" alt="" xid="image3"
                    height="26px"/> 
                </div>  
                <div class="x-titlebar-title"></div>  
                <div class="x-titlebar-right reverse" xid="div3"> 
                  <a component="$UI/system/components/justep/button/button"
                    class="btn btn-link btn-only-icon" label="button" xid="moreBtn"
                    icon="icon-android-more" onClick="{operation:'popOverMore.show'}"> 
                    <i xid="i2" class="icon-android-more"/>  
                    <span xid="span3"/> 
                  </a>  
                  <a> 
                    <img src="./main/img/icon24.png" alt="" xid="importantBtn"
                      height="26px" bind-click="importantBtnClick"/> 
                  </a> 
                </div> 
              </div> 
            </div>  
            <div class="x-panel-content" xid="content1"> 
              <div component="$UI/system/components/justep/panel/panel" class="x-panel x-full"
                xid="panel2"> 
                <div class="x-panel-top" xid="navMenuTop"> 
                  <div component="$UI/system/components/justep/row/row" class="x-row x-nav"
                    xid="row5"> 
                    <div class="x-col" xid="col15">
                      <div class="x-navbox">
                        <div component="$UI/system/components/justep/button/buttonGroup"
                          class="btn-group" tabbed="true" xid="buttonGroup2"> 
                          <a component="$UI/system/components/justep/button/button"
                            class="btn btn-link btn-only-label active" label="头条"
                            target="navContent1" xid="button24"> 
                            <i xid="i33"/>  
                            <span xid="span44">头条</span>
                          </a>  
                          <a component="$UI/system/components/justep/button/button"
                            class="btn btn-link btn-only-label" label="娱乐" target="navContent2"
                            xid="button22"> 
                            <i xid="i34"/>  
                            <span xid="span43">娱乐</span>
                          </a>  
                          <a component="$UI/system/components/justep/button/button"
                            class="btn btn-link btn-only-label" label="热点" target="navContent3"
                            xid="button20"> 
                            <i xid="i32"/>  
                            <span xid="span41">热点</span>
                          </a>  
                          <a component="$UI/system/components/justep/button/button"
                            class="btn btn-link btn-only-label" label="体育" target="navContent4"
                            xid="button21"> 
                            <i xid="i30"/>  
                            <span xid="span42">体育</span>
                          </a>  
                          <a component="$UI/system/components/justep/button/button"
                            class="btn btn-link btn-only-label" label="昆明" target="navContent5"
                            xid="button23"> 
                            <i xid="i31"/>  
                            <span xid="span25">昆明</span>
                          </a>  
                          <a component="$UI/system/components/justep/button/button"
                            class="btn btn-link btn-only-label" label="财经" target="navContent6"
                            xid="button25"> 
                            <i xid="i21"/>  
                            <span xid="span20">财经</span>
                          </a>  
                          <a component="$UI/system/components/justep/button/button"
                            class="btn btn-link btn-only-label" label="科技" target="navContent7"
                            xid="button26"> 
                            <i xid="i28"/>  
                            <span xid="span40">科技</span>
                          </a>  
                          <a component="$UI/system/components/justep/button/button"
                            class="btn btn-link btn-only-label" label="图片" target="navContent8"
                            xid="button27"> 
                            <i xid="i29"/>  
                            <span xid="span33">图片</span>
                          </a>  
                          <a component="$UI/system/components/justep/button/button"
                            class="btn btn-link btn-only-label" label="跟贴" target="navContent9"
                            xid="button28"> 
                            <i xid="i20"/>  
                            <span xid="span32">跟贴</span>
                          </a> 
                        </div>
                      </div> 
                    </div>  
                    <div class="x-col x-col-fixed" xid="col16">
                      <a component="$UI/system/components/justep/button/button"
                        class="btn btn-link btn-only-icon pull-right center-block navMoreBtn"
                        label="button" xid="button19" icon="icon-ios7-arrow-down"
                        onClick="{operation:'popOver.show'}"> 
                        <i xid="i15" class="text-muted icon-ios7-arrow-down"/>  
                        <span xid="span7"/>
                      </a>
                    </div> 
                  </div>
                </div>  
                <div class="x-panel-content" xid="content2"> 
                  <div component="$UI/system/components/justep/contents/contents"
                    class="x-contents x-full" active="0" xid="navContents" wrap="false"> 
                    <div class="x-contents-content" xid="navContent1" bind-touchmove="navContent1Touchmove"
                      bind-touchstart="navContent1Touchstart"> 
                      <div class="list-group-item x-seach" xid="div16"> 
                        <input component="$UI/system/components/justep/input/input"
                          class="form-control x-inputText" xid="keyInput"/>  
                        <span class="glyphicon glyphicon-search form-control-feedback"
                          aria-hidden="true" xid="span34"/> 
                      </div>  
                      <div component="$UI/system/components/bootstrap/carousel/carousel"
                        class="x-carousel carousel x-banner" xid="carousel1"> 
                        <ol class="carousel-indicators" xid="ol1"/>  
                        <div class="x-contents carousel-inner" role="listbox"
                          component="$UI/system/components/justep/contents/contents"
                          active="0" slidable="true" wrap="true" swipe="true" xid="bannerContents"> 
                          <div class="x-contents-content" xid="banner1"> 
                            <img alt="" xid="image1" id="image1" class="image-wall img1"
                              bind-attr-src="$model.getImageUrl('./main/img/1.jpg')"/>  
                            <div class="x-title" xid="div17"> 
                              <img alt="" class="img_small" bind-attr-src="$model.getImageUrl('./main/img/icon1.png')"
                                xid="image4"/>  
                              <span xid="span35">一周图片：马来西亚青年躺河里纳凉</span> 
                            </div> 
                          </div>  
                          <div class="x-contents-content" xid="banner2"> 
                            <img alt="" xid="image2" id="image2" class="image-wall img1"
                              bind-attr-src="$model.getImageUrl('./main/img/2.jpg')"/>  
                            <div class="x-title" xid="div10"> 
                              <img alt="" class="img_small" xid="image8" bind-attr-src="$model.getImageUrl('./main/img/icon5.png')"/>  
                              <span xid="span22">福特旗舰座驾金牛座开启预售</span> 
                            </div> 
                          </div>  
                          <div class="x-contents-content" xid="banner3"> 
                            <img alt="" xid="image13" id="image13" class="image-wall img1"
                              bind-attr-src="$model.getImageUrl('./main/img/3.jpg')"/>  
                            <div class="x-title" xid="div11"> 
                              <img alt="" class="img_small" xid="image9" bind-attr-src="$model.getImageUrl('./main/img/icon1.png')"/>  
                              <span xid="span23">俯瞰上海迪士尼在建大城堡露真容</span> 
                            </div> 
                          </div>  
                          <div class="x-contents-content" xid="banner4"> 
                            <img alt="" xid="image14" id="image14" class="image-wall img1"
                              bind-attr-src="$model.getImageUrl('./main/img/4.jpg')"/>  
                            <div class="x-title" xid="div12"> 
                              <img alt="" class="img_small" xid="image10" bind-attr-src="$model.getImageUrl('./main/img/icon1.png')"/>  
                              <span xid="span24">全新迈锐宝驾问世竞猜赢好礼</span> 
                            </div> 
                          </div> 
                        </div> 
                      </div>  
                      <div class="panel panel-default x-card x-wangyi" component="$UI/system/components/bootstrap/panel/panel"
                        xid="panel5"> 
                        <div component="$UI/system/components/justep/list/list"
                          class="x-list" data="newsData" limit="3" xid="list1"> 
                          <ul class="x-list-template" xid="listTemplateUl1"
                            bind-click="detailClick"> 
                            <li xid="li1" class="list-group-item x-flex"> 
                              <div xid="div8" class="media-left"> 
                                <a xid="a1"> 
                                  <img alt="" xid="image4" class="img-responsive img_new"
                                    bind-attr-src="$model.getImageUrl(val('fImg'))"/> 
                                </a> 
                              </div>  
                              <div class="x-flex1" xid="col26"> 
                                <h5 bind-text="ref('fTitle')" class="o-nomargintop"/>  
                                <span style="text-align: justify;" bind-text="ref('fOmit')"
                                  class="text-muted" xid="span36"/>  
                                <span bind-text="ref('fPostNumber')" class="pull-right"
                                  xid="span37"/> 
                              </div> 
                            </li> 
                          </ul> 
                        </div>  
                        <div xid="div18"> 
                          <h5 class="panel-heading">广州女子为追回爱犬贼轧双腿
                            <span xid="span12" class="pull-right text-muted">16071跟帖</span> 
                          </h5>  
                          <div component="$UI/system/components/bootstrap/row/row"
                            class="row o-nomargin panel" xid="row1"> 
                            <div class="col col-xs-4" xid="col1"> 
                              <img src="" alt="" xid="image6" class="img-responsive"
                                bind-attr-src="$model.getImageUrl('./main/img/a3.jpg')"/> 
                            </div>  
                            <div class="col col-xs-4" xid="col2"> 
                              <img src="" alt="" xid="image7" class="img-responsive"
                                bind-attr-src="$model.getImageUrl('./main/img/a4.jpg')"/> 
                            </div>  
                            <div class="col col-xs-4" xid="col3"> 
                              <img src="" alt="" xid="image11" class="img-responsive"
                                bind-attr-src="$model.getImageUrl('./main/img/a5.jpg')"/> 
                            </div> 
                          </div> 
                        </div>  
                        <div component="$UI/system/components/justep/list/list"
                          class="x-list" data="newsData" limit="3" xid="list2"> 
                          <ul class="x-list-template" xid="listTemplateUl1"
                            bind-click="detailClick"> 
                            <li xid="li1" class="list-group-item x-flex"> 
                              <div xid="div8" class="media-left"> 
                                <a xid="a1"> 
                                  <img alt="" xid="image4" class="img-responsive img_new"
                                    bind-attr-src="$model.getImageUrl(val('fImg'))"/> 
                                </a> 
                              </div>  
                              <div class="x-flex1" xid="col26"> 
                                <h5 bind-text="ref('fTitle')" class="o-nomargintop"/>  
                                <span style="text-align: justify;" bind-text="ref('fOmit')"
                                  class="text-muted" xid="span38"/>  
                                <span bind-text="ref('fPostNumber')" class="pull-right"
                                  xid="span39"/> 
                              </div> 
                            </li> 
                          </ul> 
                        </div> 
                      </div> 
                    </div>  
                    <div class="x-contents-content" xid="navContent2"> 
                      <div component="$UI/system/components/justep/windowContainer/windowContainer"
                        class="x-window-container" xid="navContainer2" style="height:100%;width:100%;"
                        autoLoad="true"/> 
                    </div>  
                    <div class="x-contents-content" xid="navContent3"> 
                      <div component="$UI/system/components/justep/windowContainer/windowContainer"
                        class="x-window-container" xid="navContainer3" style="height:100%;width:100%;"
                        autoLoad="true"/> 
                    </div>  
                    <div class="x-contents-content" xid="navContent4"> 
                      <div component="$UI/system/components/justep/windowContainer/windowContainer"
                        class="x-window-container" xid="navContainer4" style="height:100%;width:100%;"
                        autoLoad="true"/> 
                    </div>  
                    <div class="x-contents-content" xid="navContent5"> 
                      <div component="$UI/system/components/justep/windowContainer/windowContainer"
                        class="x-window-container" xid="navContainer5" style="height:100%;width:100%;"
                        autoLoad="true"/> 
                    </div>  
                    <div class="x-contents-content" xid="navContent6"> 
                      <div component="$UI/system/components/justep/windowContainer/windowContainer"
                        class="x-window-container" xid="navContainer6" style="height:100%;width:100%;"
                        autoLoad="true"/> 
                    </div>  
                    <div class="x-contents-content" xid="navContent7"> 
                      <div component="$UI/system/components/justep/windowContainer/windowContainer"
                        class="x-window-container" xid="navContainer7" style="height:100%;width:100%;"
                        autoLoad="true"/> 
                    </div>  
                    <div class="x-contents-content" xid="navContent8"> 
                      <div component="$UI/system/components/justep/windowContainer/windowContainer"
                        class="x-window-container" xid="navContainer8" style="height:100%;width:100%;"
                        autoLoad="true"/> 
                    </div>  
                    <div class="x-contents-content" xid="navContent9"> 
                      <div component="$UI/system/components/justep/windowContainer/windowContainer"
                        class="x-window-container" xid="navContainer9" style="height:100%;width:100%;"
                        autoLoad="true"/> 
                    </div> 
                  </div> 
                </div> 
              </div> 
            </div> 
          </div> 
        </div>  
        <div class="x-contents-content" xid="readContent"> 
          <div component="$UI/system/components/justep/windowContainer/windowContainer"
            class="x-window-container" xid="readContainer" style="height:100%;width:100%;"
            autoLoad="true"/> 
        </div>  
        <div class="x-contents-content" xid="audioContent"> 
          <div component="$UI/system/components/justep/windowContainer/windowContainer"
            class="x-window-container" xid="audioContainer" autoLoad="true"/> 
        </div>  
        <div class="x-contents-content" xid="foundContent"> 
          <div component="$UI/system/components/justep/windowContainer/windowContainer"
            class="x-window-container" xid="foundContainer" autoLoad="true"/> 
        </div>  
        <div class="x-contents-content" xid="userContent"> 
          <div component="$UI/system/components/justep/windowContainer/windowContainer"
            class="x-window-container" xid="userContainer" autoLoad="true"/> 
        </div> 
      </div> 
    </div>  
    <div class="x-panel-bottom" xid="bottom1"> 
      <div component="$UI/system/components/justep/button/buttonGroup" class="btn-group btn-group-justified x-card x-wangyi"
        tabbed="true" xid="buttonGroup1"> 
        <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-top active"
          label="新闻" xid="newsBtn" icon="icon-android-note" target="newsContent"> 
          <i xid="i4" class="icon icon-android-note"/>  
          <span xid="span6">新闻</span> 
        </a>  
        <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-top"
          label="阅读" xid="readBtn" icon="icon-ios7-bookmarks-outline" target="readContent"> 
          <i xid="i3" class="icon icon-ios7-bookmarks-outline"/>  
          <span xid="span5">阅读</span> 
        </a>  
        <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-top"
          label="视听" xid="audioBtn" icon="icon-arrow-right-b" target="audioContent"> 
          <i xid="i5" class="icon icon-arrow-right-b"/>  
          <span xid="span4">视听</span> 
        </a>  
        <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-top"
          label="发现" xid="foundBtn" icon="icon-android-locate" target="foundContent"> 
          <i xid="i3" class="icon icon-android-locate"/>  
          <span xid="span4">发现</span> 
        </a>  
        <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-top"
          label="我的" xid="userBtn" icon="icon-ios7-contact-outline" target="userContent"> 
          <i xid="i6" class="icon icon-ios7-contact-outline"/>  
          <span xid="span71">我的</span> 
        </a> 
      </div> 
    </div> 
  </div> 
</div>
