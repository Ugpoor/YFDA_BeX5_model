<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" class="main13" component="$UI/system/components/justep/window/window"
  design="device:m;" xid="window">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;top:6px;left:139px;">
    </div>  
  <div component="$UI/system/components/justep/popMenu/popMenu" class="x-popMenu"
    xid="popMenu" direction="right-bottom" anchor="popMenuBtn"> 
    <div class="x-popMenu-overlay" xid="div3"/>  
    <ul component="$UI/system/components/justep/menu/menu" class="x-menu dropdown-menu x-popMenu-content"
      xid="menu2">
      <li class="x-menu-item" xid="shareItem" bind-click="shareClick"> 
        <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
          label="分享" xid="button11" icon="icon-ios7-redo"> 
          <i xid="i10" class="icon-ios7-redo"/>  
          <span xid="span21">分享</span>
        </a> 
      </li>  
      <li class="x-menu-item" xid="item2"> 
        <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
          label="收藏" xid="button15" icon="icon-ios7-star-outline"> 
          <i xid="i14" class="icon-ios7-star-outline"/>  
          <span xid="span25">收藏</span>
        </a> 
      </li>
      <li class="x-menu-item" xid="item3"> 
        <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
          label="截屏" xid="button13" icon="icon-ios7-albums-outline"> 
          <i xid="i12" class="icon-ios7-albums-outline"/>  
          <span xid="span23">截屏</span>
        </a> 
      </li>  
      <li class="x-menu-divider divider" xid="divider1"/>
      <li class="x-menu-item" xid="item4"> 
        <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
          label="夜间模式" xid="button14" icon="icon-android-display"> 
          <i xid="i13" class="icon-android-display"/>  
          <span xid="span24">夜间模式</span>
        </a> 
      </li> 
    </ul>
  </div>
  <div component="$UI/system/components/justep/panel/panel" class="x-panel x-full x-card x-has-iosstatusbar"> 
    <div class="x-panel-top" height="49"> 
      <div component="$UI/system/components/justep/titleBar/titleBar" class="x-titlebar"> 
        <div class="x-titlebar-left text-white"> 
          <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-only-icon"
            label="搜索" xid="button6" icon="icon-arrow-left-c" onClick="{operation:'window.close'}"> 
            <i xid="i6" class="icon-arrow-left-c"/>  
            <span xid="span6">搜索</span> 
          </a> 
        </div>  
        <div class="x-titlebar-title"><a class="pull-right"><span bind-click="postClick" class="badge"><![CDATA[1915跟贴]]></span></a></div>  
        <div class="x-titlebar-right reverse text-white"> 
          <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-only-icon" xid="popMenuBtn" icon="icon-android-more" onClick="popMenuBtnClick">
   <i xid="i1" class="icon-android-more"></i>
   <span xid="span1"></span></a>
        </div> 
      </div> 
    </div>  
    <div class="x-panel-content x-cards panel-body"> 
      <h3 class=" text-black"><![CDATA[全国约1亿人口跨省流动 迁移致养老压力失衡]]></h3>  
      <div class="h6 text-muted"> 
        <span>学习小组</span>  
        <span>10-12 09：31</span> 
      <a component="$UI/system/components/justep/button/button" class="btn btn-link pull-right" label="分享" xid="share" icon="icon-ios7-redo" onClick="shareClick">
   <i xid="i3" class="icon-ios7-redo"></i>
   <span xid="span3">分享</span></a></div>  
      <div class="h6">
        <img alt="" class="img-responsive" bind-attr-src="$model.getImageUrl('./img/4.jpg')"/>
      </div>
      <div class="text-black lead">目前，全国约有一亿的人口在跨省流动，其中九成以上是劳动年龄人口。这种不平衡的人口迁移流动使得人口净流入地和净流出地的老龄化程度差异较大，给就业、养老带来了巨大的压力。10日举行的“人口、劳动力流动与空间集聚”全国学术研讨会探讨了这一困局，并提出了尽快提高养老和医疗保险统筹层次等建议。 生育、死亡、迁移是人口变化的三大主要特征。由于生育、死亡的变化相对稳定，中国未来人口变化更多取决于迁移。
      	 <br/>根据第六次人口普查数据，2010年全国跨省流动人口数量为8587万，约占总人口的38.8%。南开大学经济学院人口与发展研究所所长陈卫民认为，跨省流动人口正在持续增加中，2014年全国跨省流动人口数量估计达9830万人。 对跨省流动人口进行分析可以发现，90%以上流动人口是劳动年龄人口，65岁以上的人口仅占1.32%。 
        <br/>大量劳动年龄人口的迁移流动直接影响了各个省市的老龄化程度。广东、上海、浙江、北京、江苏等人口净流入地的老龄化程度因此减轻，同时河南、四川、安徽、贵州等人口净流出地的老龄化程度加剧。 这种人口迁移流动状况导致了目前养老保险的不公平：经济越发达的地区，吸引了更多更优质的劳动力流入，缴纳养老保险的人数更多，养老压力相对更低;而经济越落后的地区，更多劳动力流出，缴纳养老保险的人数减少，老年抚养比更高，养老压力更大。数据显示，2013年制度抚养比最低的后几位省市都是人口净流入较大的省市，而制度抚养比高的省市多为人口净流出的省市。 
        <br/>陈卫民认为，鉴于劳动力流动对流出地和流入地社会保障制度的不同影响，我国的养老社会保险需要继续提高统筹层次，直至实现全国统筹。由于医疗社会保险统筹层次更低，绝大部分是地市级，提高医疗保险统筹层次更具有紧迫性。
      </div>  
      <div class="h5">
        <span><![CDATA[来源：]]></span>  
        <span><![CDATA[新华社]]></span>
      </div>  
      </div>  
    <div class="x-panel-bottom" xid="bottom1">
   <div class="input-group" xid="div1">
    <span class="input-group-addon" xid="span2">
     <i xid="i2" class="icon-edit text-muted"></i></span> 
    <input component="$UI/system/components/justep/input/input" class="form-control x-inputText" xid="nameInput"></input></div> 
   <span class="form-control-feedback" aria-hidden="true" xid="span4">
    <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-only-label o-nopadding" label="发送" xid="button9">
     <i xid="i8"></i>
     <span class="text-muted" xid="span5">发送</span></a> </span> </div></div> 
</div>
