<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window" component="$UI/system/components/justep/window/window"
  design="device:m;">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:298px;top:704px;"> 
    <div component="$UI/system/components/justep/data/data" autoLoad="true"
      xid="hotSoftware" idColumn="id" onCustomRefresh="hotSoftwareCustomRefresh"> 
      <column label="ID" name="id" type="String" xid="xid1"/>  
      <column label="图片" name="image" type="String" xid="xid2"/>  
      <column label="名称" name="name" type="String" xid="xid3"/>  
      <column label="大小" name="size" type="String" xid="xid4"/>  
      <column label="下载次数" name="count" type="String" xid="xid5"/>  
      <rule xid="rule1"> 
        <col name="imageURL" xid="ruleCol1"> 
          <calculate xid="calculate1"> 
            <expr xid="default2"/> 
          </calculate> 
        </col> 
      </rule>  
      <data xid="default1">[]</data>
    </div> 
  </div>  
  <div component="$UI/system/components/justep/bar/bar" class="x-bar" xid="bar1"
    style="height:62px;"> 
    <div component="$UI/system/components/justep/row/row" class="x-row" xid="row6"> 
      <div class="x-col x-col-33" xid="col8">
        <img alt="" xid="image1" class="img-responsive" bind-attr-src='$model.toURL("./main/img/justep.png")'/>
      </div>  
      <div class="x-col" xid="col17">
        <span xid="span9" style="font-size:large;font-weight:normal;"><![CDATA[应用中心案例]]></span>
      </div>
    </div>
  </div>  
  <div component="$UI/system/components/justep/row/row" class="x-row" xid="row2"
    style="background-color:#F2F2F2;"> 
    <div class="x-col x-col-80" xid="col3"> 
      <div class="form-group  has-feedback text-muted" xid="formGroup2"> 
        <input type="text" class="form-control x-inputText" component="$UI/system/components/justep/input/input"
          xid="searchInput" placeHolder="站内素材"/>  
        <i xid="i7" class="form-control-feedback icon-android-search"/>
      </div> 
    </div>  
    <div class="x-col x-col-20" xid="col5"> 
      <a component="$UI/system/components/justep/button/button" class="btn btn-link"
        label="搜索" xid="searchBtn"> 
        <i xid="i3"/>  
        <span xid="span4">搜索</span> 
      </a> 
    </div> 
  </div>  
  <div component="$UI/system/components/bootstrap/carousel/carousel" class="x-carousel"
    xid="carousel1" auto="true" interval="2"> 
    <div class="x-contents carousel-inner" role="listbox" component="$UI/system/components/justep/contents/contents"
      active="0" slidable="true" wrap="true" swipe="true" routable="false" xid="contents1"> 
      <div class="x-contents-content" xid="content1"> 
        <img alt="" xid="image2" class="img-wall img-responsive" style="width:640px;"
          bind-attr-src="$model.toURL('./main/img/lb1.jpg')"/> 
      </div>  
      <div class="x-contents-content" xid="content2"> 
        <img alt="" xid="image3" class="img-wall  img-responsive" bind-attr-src="$model.toURL('./main/img/lb2.jpg')"/> 
      </div>  
      <div class="x-contents-content" xid="content3"> 
        <img alt="" xid="image4" class="img-wall  img-responsive" bind-attr-src="$model.toURL('./main/img/lb3.jpg')"/> 
      </div>  
      <div class="x-contents-content" xid="content4"> 
        <img alt="" xid="image5" class="img-wall  img-responsive" bind-attr-src="$model.toURL('./main/img/lb4.jpg')"/> 
      </div>  
      <div class="x-contents-content" xid="content5"> 
        <img alt="" xid="image6" class="img-wall  img-responsive" bind-attr-src="$model.toURL('./main/img/lb5.jpg')"/> 
      </div> 
    </div> 
  </div>  
  <div component="$UI/system/components/justep/row/row" class="x-row" xid="row4"> 
    <div class="x-col" xid="col10"> 
      <img alt="" xid="app" class="img-responsive" bind-attr-src='$model.toURL("./main/img/app_01.png")'  align="top" bind-click="imgOpenDemo(event)" urlMapping="moreApp"/> 
    </div>  
    <div class="x-col" xid="col11"> 
      <img alt="" xid="playGames" class="img-responsive" bind-attr-src='$model.toURL("./main/img/app_02.png")' bind-click="imgOpenDemo(event)" urlMapping="photo"/> 
    </div>  
    <div class="x-col" xid="col12"> 
      <img alt="" xid="wallpaper" class="img-responsive" bind-attr-src='$model.toURL("./main/img/app_03.png")' bind-click="imgOpenDemo(event)" urlMapping="photo"/> 
    </div>  
    <div class="x-col" xid="col13"> 
      <img alt="" xid="specialTopic" class="img-responsive" bind-attr-src='$model.toURL("./main/img/app_04.png")' bind-click="imgOpenDemo(event)" urlMapping="specialTopic"/> 
    </div> 
  </div>  
  <div xid="div1" style="background-color:#F2F2F2;"> 
    <div component="$UI/system/components/justep/row/row" class="x-row" xid="row1"> 
      <div class="x-col" xid="col1">
        <span xid="span10" style="font-size:x-large;" class="sTitle"><![CDATA[最热软件]]></span></div>  
      <div class="x-col x-col-50" xid="col4"> 
        <div xid="div2" align="center">
          <div component="$UI/system/components/justep/button/buttonGroup"
            class="btn-group" tabbed="true" xid="buttonGroup1"> 
            <a component="$UI/system/components/justep/button/button" class="btn btn-default"
              label="推荐" xid="recommendbtn" target="content6"> 
              <i xid="i4"/>  
              <span xid="span3">推荐</span> 
            </a>  
            <a component="$UI/system/components/justep/button/button" class="btn btn-primary"
              label="分类" xid="classifybtn" target="content7"> 
              <i xid="i5"/>  
              <span xid="span5">分类</span> 
            </a> 
          </div>
        </div>
      </div>
    </div>
  </div>  
  <div component="$UI/system/components/justep/contents/contents" class="x-contents"
    active="0" xid="contents2"> 
    <div class="x-contents-content" xid="content6">
      <div xid="recommend" class="recommend">
        <div component="$UI/system/components/justep/list/list" class="x-list" xid="list1" data="hotSoftware">
   <ul class="x-list-template list-group" xid="listTemplateUl1">
    <li xid="li2" class="col-xs-6 list-group-item"><div xid="div4" class="media"><div xid="div5" class="media-left"><img src="" alt="" xid="image7" class="media-object" bind-attr-src='$model.toURL("./main/img/"+ $object.val("image"))' height="40px"></img></div>
  <div xid="div6" class="media-body"><div xid="div9"><span xid="span1" bind-text="ref('name')"></span></div>
  <div xid="div10"><span xid="span2" bind-text="ref('size')" style="font-size:x-small;"></span></div>
  <div xid="div11"><span xid="span6" bind-text="ref('count')" style="font-size:x-small;"></span></div></div></div></li></ul> </div></div>
    </div>  
    <div class="x-contents-content" xid="content7">
      <div xid="classify">
        <div component="$UI/system/components/justep/list/list" class="x-list " xid="list2" data="hotSoftware">
   <ul class="x-list-template list-group" xid="listTemplateUl2">
    <li xid="li3" class="list-group-item"><div xid="div12" class="media"><div xid="div13" class="media-left"><img src="" alt="" xid="image8" height="60px" class="media-object" bind-attr-src='$model.toURL("./main/img/"+ $object.val("image"))'></img></div>
  <div xid="div14" class="media-body"><h5 xid="h51" bind-text="ref('name')">h5</h5>
  <span xid="span7" bind-text="ref('size')"></span></div></div></li></ul> </div><div component="$UI/system/components/justep/row/row" class="x-row more"
          xid="row3"> 
          <div class="x-col x-col-10" xid="col6"/>  
          <div class="x-col" xid="col7">
            <a component="$UI/system/components/justep/button/button" class="moreClassify btn btn-primary btn-block"
              label="更多分类" xid="moreClassify" onClick="btnOpenDemo" urlMapping="moreApp"> 
              <i xid="i1"/>  
              <span xid="span8">更多分类</span>
            </a>
          </div>  
          <div class="x-col x-col-10" xid="col9"/>
        </div>
      </div>
    </div>
  </div>
</div>
