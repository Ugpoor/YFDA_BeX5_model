<?xml version="1.0" encoding="UTF-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window" component="$UI/system/components/justep/window/window" design="device:pc">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:266px;top:262px;"></div> 

  
  
  
  
  
  
  
  
  <div component="$UI/system/components/justep/panel/panel" class="x-panel x-full" xid="panel">
   <div class="x-panel-top" xid="top1" height="60"><div component="$UI/system/components/justep/button/buttonGroup" class="btn-group center-block" tabbed="true" xid="title" style="height:60px;white-space:nowrap;" selected="stepOne"><hr xid="hr7" style="height:5px;width:17%;" class="pull-left hr"></hr>
  <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-top pull-left" label="导航栏目1" icon="icon-ios7-circle-filled" style="width:25px;" xid="stepOne" target="pageOne">
   <i xid="i11" class="icon-ios7-circle-filled"></i>
   <span xid="span12">导航栏目1</span></a>
  <hr xid="hr8" style="height:5px;width:15%;" class="pull-left hr"></hr>
  <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-top pull-left" label="导航栏目2" xid="stepTwo" style="width:1%;" target="pageTwo" icon="icon-ios7-circle-filled">
   <i xid="i13" class="icon-ios7-circle-filled"></i>
   <span xid="span14">导航栏目2</span></a>
  <hr xid="hr10" style="height:5px;width:15%;" class="pull-left hr"></hr>
  <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-top pull-left" label="导航栏目3" xid="stepThree" style="width:1%;" icon="icon-ios7-circle-filled" target="pageThree">
   <i xid="i14" class="icon-ios7-circle-filled"></i>
   <span xid="span15">导航栏目3</span></a>
  <hr xid="hr11" style="height:5px;width:15%;" class="pull-left hr"></hr>
  <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-top pull-left" label="导航栏目4" xid="stepFour" style="width:1%;" icon="icon-ios7-circle-filled" target="pageFour">
   <i xid="i12" class="icon-ios7-circle-filled"></i>
   <span xid="span13">导航栏目4</span></a>
  <hr xid="hr9" style="height:5px;width:17%;" class="pull-left hr"></hr></div></div>
   <div class="x-panel-content" xid="content1"><div component="$UI/system/components/justep/contents/contents" class="x-contents" active="0" xid="page" slidable="true">
   <div class="x-contents-content" xid="pageOne"><div xid="div1"><a component="$UI/system/components/justep/button/button" class="btn btn-link btn-lg pull-right" label="源码" xid="sourceBtnOne" onClick="sourceClickOne" bind-visible="isVisible">
   <i xid="i7"></i>
   <span xid="span17">源码</span></a><a component="$UI/system/components/justep/button/button" class="btn btn-link btn-lg pull-right" label="js" xid="jsBtn" onClick="jsBtnClick">
   <i xid="i6"></i>
   <span xid="span11">js</span></a></div><div xid="div17"><label xid="label1" class="label1"><![CDATA[流程导航是纯静态元素组成，相对于流程选项卡的优势在于有非常好的性能。]]></label></div><div xid="div2" style="height:124px;width:139px;"><label xid="label2"><![CDATA[这是页面1]]></label></div><div xid="div3" style="height:124px;width:139px;">
   <label xid="label3">这是页面1</label></div><div xid="div4" style="height:124px;width:139px;">
   <label xid="label4">这是页面1</label></div>
  <div xid="div5" style="height:124px;width:139px;">
   <label xid="label5">这是页面1</label></div>
  <div xid="div6" style="height:124px;width:139px;">
   <label xid="label6">这是页面1</label></div>
  <label xid="label7">这是页面1</label>
  
  </div>
  <div class="x-contents-content" xid="pageTwo"><div xid="div18">
   <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-lg pull-right" label="源码" xid="sourceBtnTwo" bind-visible="isVisible" onClick="sourceClickTwo">
    <i xid="i1"></i>
    <span xid="span1">源码</span></a> 
   <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-lg pull-right" label="js" xid="jsBtnTwo" onClick="jsBtnClick">
    <i xid="i2"></i>
    <span xid="span2">js</span></a> </div><label xid="label12" class="label1">流程导航是纯静态元素组成，相对于流程选项卡的优势在于有非常好的性能。</label>
  <div xid="div11" style="height:124px;width:139px;">
   <label xid="label13"><![CDATA[这是页面2]]></label></div>
  <div xid="div10" style="height:124px;width:139px;">
   <label xid="label14"><![CDATA[这是页面2]]></label></div>
  <div xid="div9" style="height:124px;width:139px;">
   <label xid="label11"><![CDATA[这是页面2]]></label></div>
  <div xid="div8" style="height:124px;width:139px;">
   <label xid="label10"><![CDATA[这是页面2]]></label></div>
  <div xid="div7" style="height:124px;width:139px;">
   <label xid="label9"><![CDATA[这是页面2]]></label></div>
  
  <label xid="label8"><![CDATA[这是页面2]]></label></div>
  <div class="x-contents-content" xid="pageThree"><div xid="div24">
   <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-lg pull-right" label="源码" xid="sourceBtnThree" onClick="sourceClickThree" bind-visible="isVisible">
    <i xid="i4"></i>
    <span xid="span4">源码</span></a> 
   <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-lg pull-right" label="js" xid="jsBtnThree" onClick="jsBtnClick">
    <i xid="i3"></i>
    <span xid="span3">js</span></a> </div><label xid="label19" class="label1">流程导航是纯静态元素组成，相对于流程选项卡的优势在于有非常好的性能。</label>
  <div xid="div16" style="height:124px;width:139px;">
   <label xid="label20"><![CDATA[这是页面3]]></label></div>
  <div xid="div15" style="height:124px;width:139px;">
   <label xid="label21"><![CDATA[这是页面3]]></label></div>
  <div xid="div14" style="height:124px;width:139px;">
   <label xid="label18"><![CDATA[这是页面3]]></label></div>
  <div xid="div13" style="height:124px;width:139px;">
   <label xid="label17"><![CDATA[这是页面3]]></label></div>
  <div xid="div12" style="height:124px;width:139px;">
   <label xid="label16"><![CDATA[这是页面3]]></label></div>
  <label xid="label15"><![CDATA[这是页面3]]></label>
  </div>
  <div class="x-contents-content" xid="pageFour">
  
  
  <div xid="div25">
   <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-lg pull-right" label="源码" xid="sourceBtnFour" onClick="sourceClickFour" bind-visible="isVisible">
    <i xid="i8"></i>
    <span xid="span6">源码</span></a> 
   <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-lg pull-right" label="js" xid="jsBtnFour" onClick="jsBtnClick">
    <i xid="i5"></i>
    <span xid="span5">js</span></a> </div><img src="$UI/demo/sample/layout/img/end.png" alt="" xid="image2" style="width:100%;" height="100%"></img>
  </div></div></div>
   </div>
  </div>