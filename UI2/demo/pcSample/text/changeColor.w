<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window" component="$UI/system/components/justep/window/window"
  design="device:pc">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:243px;top:72px;"> 
    <div component="$UI/system/components/justep/data/data" autoLoad="true"
      xid="colorData" idColumn="colorID"> 
      <column label="颜色" name="colorID" type="String" xid="xid1"/>  
      <data xid="default1">[{"colorID":"0"}]</data> 
    </div>  
    <div component="$UI/system/components/justep/data/data" autoLoad="true"
      xid="informationData" idColumn="name"> 
      <column label="姓名" name="name" type="String" xid="xid2"/>  
      <column label="性别" name="sex" type="String" xid="xid3"/>  
      <column label="年龄" name="age" type="String" xid="xid4"/>  
      <data xid="default2">[{"name":"张三","sex":"男","age":"22"},{"name":"张三","sex":"男","age":"22"},{"name":"张三","sex":"男","age":"22"},{"name":"张三","sex":"男","age":"22"}]</data> 
    </div>  
    <div component="$UI/system/components/justep/data/data" autoLoad="true"
      xid="multiLineData" idColumn="colorID"> 
      <column label="颜色ID" name="colorID" type="String" xid="xid5"/>  
      <data xid="default3">[{"colorID":"0"}]</data> 
    </div> 
  </div>  
  <div xid="div2" style="margin-left:20px;margin-top:20px;"> 
    <a component="$UI/system/components/justep/button/button" class="btn btn-link"
      label="js" xid="showJs" onClick="showJsSource"> 
      <i xid="i5"/>  
      <span xid="span7">js</span> 
    </a>  
    <a component="$UI/system/components/justep/button/button" class="btn btn-link"
      label="源码" xid="sourceBtn" onClick="sourceBtnClick"> 
      <i xid="i5"/>  
      <span xid="span7">源码</span> 
    </a> 
  </div>  
  <div component="$UI/system/components/justep/controlGroup/controlGroup" class="x-control-group"
    title="1、单行变色" xid="controlGroup1"> 
    <div class="x-control-group-title" xid="controlGroupTitle1"> 
      <span xid="span1">title</span> 
    </div>  
    <div xid="div1" bind-css="{'red': $model.colorData.val(&quot;colorID&quot;)==1,'yellow': $model.colorData.val(&quot;colorID&quot;)==2,'pink': $model.colorData.val(&quot;colorID&quot;)==3,'blue': $model.colorData.val(&quot;colorID&quot;)==4,'orange': $model.colorData.val(&quot;colorID&quot;)==5,'green': $model.colorData.val(&quot;colorID&quot;)==6}"> 
      <label xid="label1"><![CDATA[提醒：您有新的消息!]]></label> 
    </div>  
    <a component="$UI/system/components/justep/button/button" class="btn btn-link"
      label="开始" xid="startBtn" onClick="startBtnClick"> 
      <i xid="i1"/>  
      <span xid="span2">开始</span> 
    </a>  
    <a component="$UI/system/components/justep/button/button" class="btn btn-link"
      label="结束" xid="endBtn" onClick="endBtnClick"> 
      <i xid="i2"/>  
      <span xid="span3">结束</span> 
    </a> 
  </div>  
  <div component="$UI/system/components/justep/controlGroup/controlGroup" class="x-control-group"
    title="2、多行变色" xid="controlGroup2"> 
    <div class="x-control-group-title" xid="controlGroupTitle2"> 
      <span xid="span4">title</span> 
    </div>  
    <a component="$UI/system/components/justep/button/button" class="btn btn-link"
      label="开始" xid="multiLineStartBtn" onClick="multiLineStartBtnClick"> 
      <i xid="i4"/>  
      <span xid="span5">开始</span> 
    </a>  
    <a component="$UI/system/components/justep/button/button" class="btn btn-link"
      label="结束" xid="multLineEndBtn" onClick="multLineEndBtnClick"> 
      <i xid="i3"/>  
      <span xid="span6">结束</span> 
    </a>  
    <div component="$UI/system/components/justep/row/row" class="x-row" xid="row8"> 
      <div class="x-col" xid="col28" style="border-style:solid solid solid solid;border-width:1px 1px 1px 1px;"> 
        <label xid="label9"><![CDATA[姓名]]></label> 
      </div>  
      <div class="x-col" xid="col29" style="border-width:1px 1px 1px 1px;border-top-style:solid;border-bottom-style:solid;"> 
        <label xid="label10"><![CDATA[性别]]></label> 
      </div>  
      <div class="x-col" xid="col30" style="border-style:solid solid solid solid;border-width:1px 1px 1px 1px;"> 
        <label xid="label11"><![CDATA[年龄]]></label> 
      </div> 
    </div>  
    <div component="$UI/system/components/justep/list/list" class="x-list"
      xid="list5" data="informationData"> 
      <ul class="x-list-template" xid="listTemplateUl4"> 
        <li xid="li4"> 
          <div component="$UI/system/components/justep/row/row" class="x-row"
            xid="row7"> 
            <div class="x-col" xid="col25" style="border-width:1px 1px 1px 1px;border-right-style:solid;border-bottom-style:solid;border-left-style:solid;"> 
              <label xid="label6" bind-text="ref('name')" bind-css="{'red':  $model.multiLineData.val(&quot;colorID&quot;)==1,'yellow': $model.multiLineData.val(&quot;colorID&quot;)==2,'pink': $model.multiLineData.val(&quot;colorID&quot;)==3,'blue': $model.multiLineData.val(&quot;colorID&quot;)==4,'orange': $model.multiLineData.val(&quot;colorID&quot;)==5,'green': $model.multiLineData.val(&quot;colorID&quot;)==6}">label</label> 
            </div>  
            <div class="x-col" xid="col26" style="border-width:1px 1px 1px 1px;border-bottom-style:solid;"> 
              <label xid="label7" bind-text="ref('sex')" bind-css="{'red':  $model.multiLineData.val(&quot;colorID&quot;)==1,'yellow': $model.multiLineData.val(&quot;colorID&quot;)==2,'pink': $model.multiLineData.val(&quot;colorID&quot;)==3,'blue': $model.multiLineData.val(&quot;colorID&quot;)==4,'orange': $model.multiLineData.val(&quot;colorID&quot;)==5,'green': $model.multiLineData.val(&quot;colorID&quot;)==6}">label</label> 
            </div>  
            <div class="x-col" xid="col27" style="border-width:1px 1px 1px 1px;border-right-style:solid;border-bottom-style:solid;border-left-style:solid;"> 
              <label xid="label8" bind-text="ref('age')" bind-css="{'red':  $model.multiLineData.val(&quot;colorID&quot;)==1,'yellow': $model.multiLineData.val(&quot;colorID&quot;)==2,'pink': $model.multiLineData.val(&quot;colorID&quot;)==3,'blue': $model.multiLineData.val(&quot;colorID&quot;)==4,'orange': $model.multiLineData.val(&quot;colorID&quot;)==5,'green': $model.multiLineData.val(&quot;colorID&quot;)==6}">label</label> 
            </div> 
          </div> 
        </li> 
      </ul> 
    </div> 
  </div> 
</div>
