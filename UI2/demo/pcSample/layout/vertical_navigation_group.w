<?xml version="1.0" encoding="UTF-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window" component="$UI/system/components/justep/window/window" design="device:pc">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:207px;top:168px;"><div component="$UI/system/components/justep/data/data" autoLoad="true" xid="statusData" idColumn="edit"><column label="edit" name="edit" type="String" xid="xid1"></column>
  <data xid="default1">[{&quot;edit&quot;:&quot;1&quot;}]</data></div></div> 

  <h4 xid="h41"><![CDATA[纵向导航分组]]>
  <a component="$UI/system/components/justep/button/button" class="btn btn-link" label="JS" xid="jsBtn" onClick="jsBtnClick">
   <i xid="i6"></i>
   <span xid="span10">JS</span></a>
  <a component="$UI/system/components/justep/button/button" class="btn btn-link" label="源码" xid="sourceBtn" onClick="sourceBtnClick">
   <i xid="i7"></i>
   <span xid="span11">源码</span></a></h4><div component="$UI/system/components/justep/row/row" class="x-row" xid="row1" style="height:100%;">
   <div class="x-col x-col-fixed" xid="col1" style="width:auto;height:100%;"><div xid="menu" style="height:100%;width:100%;overflow:hidden;" class="pull-left div1"><div component="$UI/system/components/justep/controlGroup/controlGroup" class="x-control-group" xid="controlGroup1" style="height:100%;width:90%;" title="一级栏目1">
   <div class="x-control-group-title" xid="controlGroupTitle1" style="background-color:#599FD2;">
    <span xid="span1"><![CDATA[一级栏目1]]></span></div> 
   <a component="$UI/system/components/justep/button/button" class="btn1 btn btn-link" label="二级栏目1" xid="select1" style="width:80%;" bind-css="{'cli' : $model.statusData.val(&quot;edit&quot;) == 1}" onClick="selectOneClick" target="content1">
   <i xid="i1"></i>
   <span xid="span2">二级栏目1</span></a>
  <a component="$UI/system/components/justep/button/button" class="btn1 btn btn-link" label="二级栏目2" xid="select2" style="width:80%;" onClick="selectTwoClick" bind-css="{'cli' : $model.statusData.val(&quot;edit&quot;) == 2}" target="content2">
   <i xid="i2"></i>
   <span xid="span3">二级栏目2</span></a>
  <div class="x-control-group-title" xid="controlGroupTitle3" style="background-color:#599FD2;">
   <span xid="span8"><![CDATA[一级栏目2]]></span></div><a component="$UI/system/components/justep/button/button" class="btn1 btn btn-link" label="二级栏目3" xid="select3" style="width:80%;" onClick="selectThreeClick" bind-css="{'cli' : $model.statusData.val(&quot;edit&quot;) == 3}" target="content3">
   <i xid="i3"></i>
   <span xid="span4">二级栏目3</span></a>
  <a component="$UI/system/components/justep/button/button" class="btn1 btn btn-link" label="二级栏目4" xid="select4" style="width:80%;" onClick="selectFourClick" bind-css="{'cli' : $model.statusData.val(&quot;edit&quot;) == 4}" target="content4">
   <i xid="i4"></i>
   <span xid="span5">二级栏目4</span></a>
  
  
  <div class="x-control-group-title" xid="controlGroupTitle4" style="background-color:#599FD2;">
   <span xid="span9"><![CDATA[一级栏目3]]></span></div><a component="$UI/system/components/justep/button/button" class="btn1 btn btn-link" label="二级栏目5" xid="select5" style="width:80%;" onClick="selectFiveClick" bind-css="{'cli' : $model.statusData.val(&quot;edit&quot;) == 5}" target="content5">
   <i xid="i5"></i>
   <span xid="span6">二级栏目5</span></a>
  </div></div>
  </div>
   <div class="x-col" xid="col3" style="height:100%;"><div xid="page" class="pull-left div2" style="width:100%;height:100%;overflow:hidden;"><div component="$UI/system/components/justep/controlGroup/controlGroup" class="x-control-group pull-right" title="内容部分" xid="controlGroup2" style="width:100%;height:100%;">
   <div class="x-control-group-title" xid="controlGroupTitle2" style="background-color:#47A2D1;height:55px;">
    <span xid="span7">title</span></div> 
  <div component="$UI/system/components/justep/contents/contents" class="x-contents " active="0" xid="contents1" style="width:100%;white-space:nowrap;overflow-y:scroll;height:88%;">
   <div class="x-contents-content" xid="content1" style="height:100%;"><div xid="div3" style="height:160px;width:100px;"><label xid="label1"><![CDATA[一级栏目1]]></label></div>
  <div xid="div4" style="height:160px;width:100px;">
   <label xid="label2">一级栏目1</label></div>
  <div xid="div5" style="height:160px;width:100px;">
   <label xid="label3">一级栏目1</label></div>
  <div xid="div6" style="height:160px;width:100px;">
   <label xid="label4">一级栏目1</label></div>
  <div xid="div7" style="height:160px;width:100px;">
   <label xid="label5">一级栏目1</label></div></div>
  <div class="x-contents-content" xid="content2" style="height:100%;"><div xid="div12" style="height:160px;width:100px;">
   <label xid="label8"><![CDATA[一级栏目2]]></label></div>
  
  <div xid="div11" style="height:160px;width:100px;">
   <label xid="label9"><![CDATA[一级栏目2]]></label></div>
  <div xid="div10" style="height:160px;width:100px;">
   <label xid="label10"><![CDATA[一级栏目2]]></label></div>
  <div xid="div9" style="height:160px;width:100px;">
   <label xid="label7"><![CDATA[一级栏目2]]></label></div>
  <div xid="div8" style="height:160px;width:100px;">
   <label xid="label6"><![CDATA[一级栏目2]]></label></div></div>
  <div class="x-contents-content" xid="content3" style="height:100%;"><div xid="div15" style="height:160px;width:100px;">
   <label xid="label15"><![CDATA[一级栏目3]]></label></div>
  <div xid="div16" style="height:160px;width:100px;">
   <label xid="label14"><![CDATA[一级栏目3]]></label></div>
  <div xid="div17" style="height:160px;width:100px;">
   <label xid="label11"><![CDATA[一级栏目3]]></label></div>
  <div xid="div13" style="height:160px;width:100px;">
   <label xid="label12"><![CDATA[一级栏目3]]></label></div>
  <div xid="div14" style="height:160px;width:100px;">
   <label xid="label13"><![CDATA[一级栏目3]]></label></div></div>
  <div class="x-contents-content" xid="content4" style="height:100%;"><div xid="div20" style="height:160px;width:100px;">
   <label xid="label20"><![CDATA[一级栏目4]]></label></div>
  <div xid="div21" style="height:160px;width:100px;">
   <label xid="label19"><![CDATA[一级栏目4]]></label></div>
  <div xid="div22" style="height:160px;width:100px;">
   <label xid="label16"><![CDATA[一级栏目4]]></label></div>
  <div xid="div18" style="height:160px;width:100px;">
   <label xid="label17"><![CDATA[一级栏目4]]></label></div>
  <div xid="div19" style="height:160px;width:100px;">
   <label xid="label18"><![CDATA[一级栏目4]]></label></div></div>
  <div class="x-contents-content" xid="content5" style="height:100%;"><div xid="div25" style="height:160px;width:100px;">
   <label xid="label25"><![CDATA[一级栏目5]]></label></div>
  <div xid="div26" style="height:160px;width:100px;">
   <label xid="label24"><![CDATA[一级栏目5]]></label></div>
  <div xid="div27" style="height:160px;width:100px;">
   <label xid="label21"><![CDATA[一级栏目5]]></label></div>
  <div xid="div23" style="height:160px;width:100px;">
   <label xid="label22"><![CDATA[一级栏目5]]></label></div>
  <div xid="div24" style="height:160px;width:100px;">
   <label xid="label23"><![CDATA[一级栏目5]]></label></div></div></div></div>
  </div></div></div>
  
  </div>