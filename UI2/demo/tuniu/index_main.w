<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" class="main13" component="$UI/system/components/justep/window/window"
  design="device:m;" xid="window">  
  <span component="$UI/system/components/justep/windowDialog/windowDialog" xid="windowDialog"
    title="选择城市" showTitle="true" onReceive="{&quot;operation&quot;:&quot;dataOperation1.setValue&quot;,&quot;args&quot;:{&quot;data&quot;:&quot;js:'data'&quot;,&quot;col&quot;:&quot;js:\&quot;cityName\&quot;&quot;,&quot;value&quot;:&quot;js:$event.fName&quot;}}" style="left:120px;top:10px;"/>  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:13px;top:202px;"> 
    <div component="$UI/system/components/justep/data/data" autoLoad="true" xid="data" idColumn="inputVal"><column name="inputVal" type="String" xid="xid6"></column>
  <column name="useTopClass" type="Integer" xid="xid7"></column>
  <column name="cityName" type="String" xid="xid8"></column>
  <data xid="default1">[{&quot;inputVal&quot;:&quot;马尔代夫&quot;,&quot;useTopClass&quot;:0,&quot;cityName&quot;:&quot;北京&quot;}]</data></div>
  <div component="$UI/system/components/justep/shell/shell" xid="shell"></div><div component="$UI/system/components/justep/data/data" autoLoad="true"
      xid="productData" idColumn="fID" onCustomRefresh="{&quot;operation&quot;:&quot;dataOperation1.refreshByGET&quot;,&quot;args&quot;:{&quot;url&quot;:&quot;js: $model.toUrl('./json/productData.json')&quot;,&quot;sync&quot;:&quot;js:true&quot;}}"> 
      <column label="id" name="fID" type="String" xid="xid1"/>  
      <column label="标题" name="fTitle" type="String" xid="xid2"/>  
      <column label="图片" name="fImg" type="String" xid="xid3"/>  
      <column label="价格" name="fPrice" type="String" xid="xid4"/>  
      <column label="满意度" name="fSatisfaction" type="String" xid="xid5"/> 
    </div> 
  <div component="$UI/system/components/justep/dataOperation/dataOperation" xid="dataOperation1"></div></div>  
  <div component="$UI/system/components/justep/panel/panel" class="x-panel x-full x-card top-trans"
    xid="panel1" bind-css="{'top-trans': 0===$model.data.val(&quot;useTopClass&quot;)}"> 
    <div class="x-panel-top" xid="top1"> 
      <div component="$UI/system/components/justep/titleBar/titleBar" class="x-titlebar"
        xid="titleBar1"> 
        <div class="x-titlebar-left text-success" xid="div1"> 
          <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-only-icon"
            label="button" xid="button1" icon="icon-ios7-location-outline"> 
            <i xid="i1" class="icon-ios7-location-outline"/>  
            <span xid="span1"/> 
          </a>  
          <span xid="cityName" bind-click="{&quot;operation&quot;:&quot;windowDialog.open&quot;,&quot;args&quot;:{&quot;option&quot;:&quot;js:{src:$model.toUrl('$UI/demo/tuniu/city.w')}&quot;}}" class="h5 text-success" bind-text='$model.data.ref("cityName")'><![CDATA[昆明]]></span> 
        </div>  
        <div class="x-titlebar-title"> 
          <!--<div class="form-group has-feedback text-muted"> 
            <input type="text" class="form-control" id="inputSuccess2" aria-describedby="inputSuccess2Status"
              xid="key"/>  
            <span class="glyphicon glyphicon glyphicon-search form-control-feedback"
              aria-hidden="true"/> 
          </div>   -->          
          <div class="form-group has-feedback text-muted"> 
            <input component="$UI/system/components/justep/input/input" class="form-control x-inputText" xid="key" bind-ref='$model.data.ref("inputVal")'/>
            <i class="icon-ios7-search-strong form-control-feedback" xid="col1"></i>
          </div> 
        </div>  
        <div class="x-titlebar-right reverse text-success" xid="div3"> 
          <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-only-icon"
            label="button" xid="button2" icon="icon-ios7-telephone-outline"> 
            <i xid="i2" class="icon-ios7-telephone-outline"/>  
            <span xid="span3"/> 
          </a> 
        </div> 
      </div> 
    </div>  
    <div class="x-panel-content x-cards" xid="content"> 
      <div component="$UI/system/components/justep/contents/contents" class="x-contents x-full"
        active="0" xid="contents1" onActiveChange="{&quot;operation&quot;:&quot;dataOperation1.setValue&quot;,&quot;args&quot;:{&quot;data&quot;:&quot;js:'data'&quot;,&quot;col&quot;:&quot;js:\&quot;useTopClass\&quot;&quot;,&quot;value&quot;:&quot;js:$event.to&quot;}}"> 
        <div class="x-contents-content" xid="homeContent">
          <div component="$UI/system/components/bootstrap/carousel/carousel"
            class="x-carousel carousel iBanner" xid="carousel1"> 
            <ol class="carousel-indicators" xid="ol1"/>  
            <div class="x-contents carousel-inner" role="listbox" component="$UI/system/components/justep/contents/contents"
              active="0" slidable="true" wrap="true" swipe="true" xid="bannerContents"> 
              <div class="x-contents-content" xid="content3"> 
                <img alt="" xid="image1" id="image1" class="image-wall img1" src="./img/4.jpg"/>
              </div>
              <div class="x-contents-content" xid="content4"> 
                <img alt="" xid="image2" id="image2" class="image-wall img1" src="./img/2.jpg"/>
              </div>  
              <div class="x-contents-content" xid="content5"> 
                <img alt="" xid="image13" id="image13" class="image-wall img1" src="./img/3.jpg"/>
              </div>  
              <div class="x-contents-content" xid="content6"> 
                <img alt="" xid="image14" id="image14" class="image-wall img1" src="./img/1.jpg"/>
              </div>  
              <div class="x-contents-content" xid="content7"> 
                <img alt="" xid="image15" id="image15" class="image-wall img1" src="./img/5.jpg"/>
              </div> 
            </div> 
          </div>  
          <div component="$UI/system/components/justep/panel/panel" class="panel panel-default x-card x-tuniu"
            xid="panel2"> 
            <table class="table x-noborder" component="$UI/system/components/bootstrap/table/table"
              xid="table1"> 
              <tbody class="x-list-template" xid="listTemplate1" bind-click="{&quot;operation&quot;:&quot;shell.showPage&quot;,&quot;args&quot;:{&quot;url&quot;:&quot;js:'searchList'&quot;}}"> 
                <tr xid="tr2" class="text-center"> 
                  <td xid="td1"> 
                    <a><img alt="" xid="image37"
                      class="img5 img-responsive center-block" src="./img/home_group.png"/></a> 
                    <div xid="div32" bind-text="'跟团游'" class="h6">跟团游</div>
                  </td>  
                  <td xid="td2"> 
                    <a><img alt=""
                      xid="image33" class="img5 img-responsive center-block" src="./img/home_self_service.png"/></a>  
                    <div xid="div33" bind-text="'自助游'" class="h6">自助游</div>
                  </td>  
                  <td xid="td3"> 
                    <a><img alt="" xid="image34"
                      class="img5 img-responsive center-block" src="./img/home_ship.png"/></a>  
                    <div xid="div31" bind-text="'游轮'" class="h6">游轮</div>
                  </td>  
                  <td xid="td4"> 
                    <a><img alt="" xid="image35"
                      class="img5 img-responsive center-block" src="./img/home_drive.png"/></a>  
                    <div xid="div37" bind-text="'自驾游'" class="h6">自驾游</div>
                  </td>  
                  <td xid="td5"> 
                    <a><img alt="" xid="image36"
                      class="img5 img-responsive center-block" src="./img/home_ticket.png"/></a>  
                    <div xid="div38" bind-text="'自驾游'" class="h6">自驾游</div>
                  </td> 
                </tr>  
                <tr xid="tr3" class="text-center"> 
                  <td xid="td8"> 
                    <a><img alt="" xid="image42"
                      class="img5 center-block" src="./img/home_visa.png"/></a>  
                    <div xid="div44" bind-text="'签证'" class="h6">签证</div>
                  </td>  
                  <td xid="td9"> 
                    <a><img alt="" xid="image41"
                      class="img5 center-block" src="./img/home_hotel.png"/></a>  
                    <div xid="div40" bind-text="'酒店'" class="h6">酒店</div>
                  </td>  
                  <td xid="td10"> 
                    <a><img alt="" xid="image39"
                      class="img5 center-block" src="./img/home_plane.png"/></a>  
                    <div xid="div45" bind-text="'机票'" class="h6">机票</div>
                  </td>  
                  <td xid="td11"> 
                    <a><img alt="" xid="image43"
                      class="img5 center-block" src="./img/home_train.png"/></a>  
                    <div xid="div42" bind-text="'火车票'" class="h6">火车票</div>
                  </td>  
                  <td xid="td12"> 
                    <a><img alt="" xid="image40"
                      class="img5 center-block" src="./img/home_hotspot.png"/></a>  
                    <div xid="div43" bind-text="'客服'" class="h6">客服</div>
                  </td> 
                </tr> 
              </tbody> 
            </table> 
          </div>  
          <div component="$UI/system/components/justep/panel/panel" class="panel panel-default x-tuniu"
            xid="panel3"> 
            <table class="table table-bordered x-fill" component="$UI/system/components/bootstrap/table/table"
              xid="table3" style="height:34.35468895078923vw;"> 
              <tbody class="x-list-template" xid="listTemplate2" bind-click="{&quot;operation&quot;:&quot;shell.showPage&quot;,&quot;args&quot;:{&quot;url&quot;:&quot;js:'searchList'&quot;}}"> 
                <tr xid="tr5"> 
                  <td xid="td13"> 
                    <a><img alt="" xid="image44"
                      class="img-responsive" src="./img/activity1.jpg"/></a>
                  </td>  
                  <td xid="td14"> 
                    <a><img alt="" xid="image45"
                      class="img-responsive" src="./img/activity2.jpg"/></a>
                  </td>  
                  <td xid="td15"> 
                    <a><img alt="" xid="image46"
                      class="img-responsive" src="./img/activity3.jpg"/></a>
                  </td> 
                </tr>  
                <tr xid="tr6"> 
                  <td xid="td17"> 
                    <a><img alt="" xid="image49"
                      class="img-responsive" src="./img/activity4.jpg"/></a>
                  </td>  
                  <td xid="td18"> 
                    <a><img alt="" xid="image47"
                      class="img-responsive" src="./img/activity5.jpg"/></a>
                  </td>  
                  <td xid="td19"> 
                    <a><img alt="" xid="image48"
                      class="img-responsive" src="./img/activity6.jpg"/></a>
                  </td> 
                </tr> 
              </tbody> 
            </table> 
          </div>  
          <div class="panel panel-default x-card x-tuniu" component="$UI/system/components/bootstrap/panel/panel"
            xid="panel4"> 
            <div class="panel-heading text-muted" xid="heading2"> 
              <h4 class="panel-title" xid="h42">手机特卖
                <span xid="span20" class="text-success pull-right" bind-click="{&quot;operation&quot;:&quot;shell.showPage&quot;,&quot;args&quot;:{&quot;url&quot;:&quot;js:'searchList'&quot;}}">更多&gt;</span>
              </h4> 
            </div>  
            <table class="table x-noborder iSale" component="$UI/system/components/bootstrap/table/table"
              xid="table4"> 
              <tbody class="x-list-template" xid="listTemplate3" bind-click="{&quot;operation&quot;:&quot;shell.showPage&quot;,&quot;args&quot;:{&quot;url&quot;:&quot;js:'searchList'&quot;}}"> 
                <tr xid="tr4"> 
                  <td xid="td6"> 
                    <a><img alt="" xid="image22"
                      class="img-rounded img-responsive center-block" src="./img/a1.jpg"/></a> 
                    <div xid="div15" class="text text-center">
                      <h4 xid="h43" class="text-white">限时秒杀</h4>  
                      <h5 xid="h51" class="text-white">长城</h5>  
                      <h5 xid="h54" class="text-danger">￥2922</h5>
                    </div>
                  </td>  
                  <td xid="td7"> 
                    <a><img alt="" xid="image23"
                      class="img-rounded img-responsive center-block" src="./img/a2.jpg"/></a>
                    <div xid="div17" class="text text-center"> 
                      <h4 xid="h44" class="text-white">尾货物价</h4>  
                      <h5 xid="h56" class="text-white">泰国</h5>  
                      <h5 xid="h55" class="text-danger">￥2129</h5>
                    </div>
                  </td>  
                  <td xid="td16"> 
                    <a><img alt="" xid="image24"
                      class="img-rounded img-responsive center-block" src="./img/a3.jpg"/></a>  
                    <div xid="div18" class="text text-center"> 
                      <h4 xid="h45" class="text-white">专场精选</h4>  
                      <h5 xid="h58" class="text-white">说走就走</h5>  
                      <h5 xid="h57" class="text-danger">￥3472</h5>
                    </div>
                  </td> 
                </tr>  
                <tr xid="tr7"> 
                  <td xid="td20"> 
                    <a><img alt="" xid="image25"
                      class="img-rounded img-responsive center-block" src="./img/a4.jpg"/></a>  
                    <div xid="div19" class="text text-center"> 
                      <h4 xid="h46" class="text-white">预售钜惠</h4>  
                      <h5 xid="h510" class="text-white">早订早惠</h5>  
                      <h5 xid="h59" class="text-danger">￥2510</h5>
                    </div> 
                  </td>  
                  <td xid="td21"> 
                    <a><img alt="" xid="image26"
                      class="img-rounded img-responsive center-block" src="./img/a5.jpg"/></a>  
                    <div xid="div20" class="text text-center"> 
                      <h4 xid="h47" class="text-white">超值爆款</h4>  
                      <h5 xid="h512" class="text-white">黄河</h5>  
                      <h5 xid="h511" class="text-danger">￥2999</h5>
                    </div> 
                  </td>  
                  <td xid="td22"> 
                    <a><img alt="" xid="image27"
                      class="img-rounded img-responsive center-block" src="./img/a6.jpg"/></a>  
                    <div xid="div21" class="text text-center"> 
                      <h4 xid="h48" class="text-white">老于推荐</h4>  
                      <h5 xid="h514" class="text-white">苏州园林</h5>  
                      <h5 xid="h513" class="text-danger">￥1160</h5>
                    </div> 
                  </td> 
                </tr> 
              </tbody> 
            </table> 
          </div>  
          <div class="panel panel-default x-card x-tuniu" component="$UI/system/components/bootstrap/panel/panel"
            xid="panel5"> 
            <div class="panel-heading" xid="heading1"> 
              <h4 class="panel-title" xid="h41">产品经理推荐
                <span xid="span7" class="text-success pull-right" bind-click="{&quot;operation&quot;:&quot;shell.showPage&quot;,&quot;args&quot;:{&quot;url&quot;:&quot;js:'searchList'&quot;}}">更多&gt;</span>
              </h4> 
            </div>  
            <div component="$UI/system/components/justep/list/list" class="x-list"
              xid="list1" data="productData" limit="6"> 
              <ul class="x-list-template" xid="listTemplateUl1" bind-click="{&quot;operation&quot;:&quot;shell.showPage&quot;,&quot;args&quot;:{&quot;url&quot;:&quot;js:'detail'&quot;}}"> 
                <li xid="li1" class="list-group-item x-flex"> 
                  <div xid="div8" class="media-left"> 
                    <a xid="a1"> 
                      <img alt="" xid="image4" class="img-rounded img-responsive"
                        style="width:64px" bind-attr-src="$model.getImageUrl(val('fImg'))"/>
                    </a> 
                  </div>  
                  <div class="x-flex1" xid="col26"> 
                    <span xid="span21" bind-text="ref('fTitle')" style="text-align: justify;"/>
                  </div>  
                  <div class="" xid="col25"> 
                    <div xid="div34" class="text-danger text-right"> 
                      <span xid="span22">￥</span>  
                      <span xid="span23" bind-text="ref('fPrice')"/>
                    </div>  
                    <div xid="div35" class="text-muted text-right"> 
                      <span xid="span24" bind-text="ref('fSatisfaction')"/>  
                      <span xid="span25">%满意</span>
                    </div> 
                  </div> 
                </li> 
              </ul> 
            </div> 
          </div>  
          <div component="$UI/system/components/justep/panel/panel" class="panel panel-default x-card x-tuniu panel-heading"
            xid="panel6"> 
            <h5 xid="h52">北京起步科技有限公司</h5>  
            <p xid="p2"> 
              <span xid="span27" class="text-muted">客服电话：</span>  
              <span xid="span28" class="text-success">400-797-5098（免长途费）</span>
            </p>  
            <p xid="p3"> 
              <span xid="span30" class="text-muted">营业时间：周一至周日： 9：00－18：00</span>
            </p>  
            <p xid="p4"> 
              <span xid="span32" class="text-muted">公司地址：</span>  
              <span xid="span31" class="text-success">朝阳区东三环南路98号高和蓝峰大厦18层</span>
            </p>  
            <div xid="div48" class="iEnsure"> 
              <span xid="span34" class="badge">三大阳光保证</span>  
              <div component="$UI/system/components/justep/button/buttonGroup"
                class="btn-group btn-group-justified" tabbed="true" xid="buttonGroup2"> 
                <a component="$UI/system/components/justep/button/button"
                  class="btn btn-link btn-icon-left" label="阳光行程" xid="button3" icon="icon-ios7-lightbulb"> 
                  <i xid="i9" class="icon-ios7-lightbulb"/>  
                  <span xid="span35">阳光行程</span>
                </a>  
                <a component="$UI/system/components/justep/button/button"
                  class="btn btn-link btn-icon-left" label="阳光价格" xid="button4" icon="icon-ios7-heart"> 
                  <i xid="i10" class="icon-ios7-heart"/>  
                  <span xid="span36">阳光价格</span>
                </a>  
                <a component="$UI/system/components/justep/button/button"
                  class="btn btn-link btn-icon-left" label="阳光服务" xid="button5" icon="icon-leaf"> 
                  <i xid="i11" class="icon-leaf"/>  
                  <span xid="span37">阳光服务</span>
                </a> 
              </div> 
            </div> 
          </div>
        </div>  
        <div class="x-contents-content" xid="purposeContent">
          <div component="$UI/system/components/justep/windowContainer/windowContainer"
            class="x-window-container" xid="purposeContainer" src="./index-purpose.w"/>
        </div>  
        <div class="x-contents-content" xid="classContent">
          <div component="$UI/system/components/justep/windowContainer/windowContainer"
            class="x-window-container" xid="classContainer" src="./index-class.w"/>
        </div>  
        <div class="x-contents-content" xid="userContent">
          <div component="$UI/system/components/justep/windowContainer/windowContainer"
            class="x-window-container" xid="userContainer" src="./index-user.w"/>
        </div>
      </div>
    </div>  
    <div class="x-panel-bottom" xid="bottom1"> 
      <div component="$UI/system/components/justep/button/buttonGroup" class="btn-group btn-group-justified x-card x-tuniu"
        tabbed="true" xid="buttonGroup1"> 
        <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-top active"
          label="首页" xid="homeBtn" icon="icon-home" target="homeContent"> 
          <i xid="i4" class="icon-home icon"/>  
          <span xid="span6">首页</span> 
        </a>  
        <!-- <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-top"
          label="发现" xid="foundBtn" icon="icon-ios7-eye-outline" target="foundContent"> 
          <i xid="i3" class="icon icon-ios7-eye-outline"/>  
          <span xid="span4">发现</span> 
        </a>   -->  
        <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-top"
          label="目的地" xid="purposeBtn" icon="icon-android-earth" target="purposeContent"> 
          <i xid="i3" class="icon icon-android-earth"/>  
          <span xid="span5">目的地</span> 
        </a>  
        <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-top"
          label="分类" xid="classBtn" icon="icon-android-sort" target="classContent"> 
          <i xid="i5" class="icon icon-android-sort"/>  
          <span xid="span4">分类</span> 
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
