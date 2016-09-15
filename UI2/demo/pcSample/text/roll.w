<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window" component="$UI/system/components/justep/window/window"
  design="device:pc">  
  <div component="$UI/system/components/justep/model/model" xid="model" onLoad="modelLoad"
    style="height:auto;left:211px;top:9px;"> 
    <div component="$UI/system/components/justep/data/data" autoLoad="true"
      xid="newData" idColumn="new" confirmDelete="false"> 
      <column label="新闻" name="new" type="String" xid="xid1"/>  
      <data xid="default1">[{"new":"滚动新闻1"},{"new":"滚动新闻2"},{"new":"滚动新闻3"},{"new":"滚动新闻4"},{"new":"滚动新闻5"}]</data> 
    </div>  
    <div component="$UI/system/components/justep/data/data" autoLoad="true"
      xid="customData" idColumn="customNew" confirmDelete="false"> 
      <column label="新闻" name="customNew" type="String" xid="column1"/>  
      <data xid="default2">[{"customNew":"滚动新闻1"},{"customNew":"滚动新闻2"},{"customNew":"滚动新闻3"},{"customNew":"滚动新闻4"},{"customNew":"滚动新闻5"}]</data> 
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
    title="1、普通滚动" xid="controlGroup1" style="height:123px;"> 
    <div class="x-control-group-title" xid="controlGroupTitle1"> 
      <span xid="span1">title</span> 
    </div>  
    <div xid="div6" style="position:absolute;border-width:1px 1px 1px 1px;overflow:auto;overflow-x:hidden;overflow-y:hidden;height:20px;width:450px;left:2px;top:110px;"> 
      <div style="position:absolute;height:20px;width:90px;left:0px;top:0px;"
        xid="rollDiv"> 
        <label xid="label1" style="width:87px;font-size:medium;"><![CDATA[滚动文字]]></label> 
      </div> 
    </div> 
  </div>  
  <div component="$UI/system/components/justep/controlGroup/controlGroup" class="x-control-group"
    title="2、上下滚动" xid="controlGroup2"> 
    <div class="x-control-group-title" xid="controlGroupTitle2"> 
      <span xid="span3">title</span> 
    </div>  
    <div component="$UI/system/components/justep/list/list" class="x-list"
      xid="newsList" data="newData" style="border-style:solid solid solid solid;border-width:1px 1px 1px 1px;overflow:auto;overflow-y:hidden;height:75px;"
      bind-mouseover="newsListMouseover" bind-mouseleave="newsListMouseleave"> 
      <ul class="x-list-template" xid="newsUl" style="position:relative;"> 
        <li xid="li1"> 
          <label xid="label2" bind-text="ref('new')">label</label> 
        </li> 
      </ul> 
    </div> 
  </div>  
  <div component="$UI/system/components/justep/controlGroup/controlGroup" class="x-control-group"
    title="3、自定义可见条数" xid="controlGroup3"> 
    <div class="x-control-group-title" xid="controlGroupTitle4"> 
      <span xid="span6">title</span> 
    </div>  
    <div component="$UI/system/components/justep/list/list" class="x-list"
      xid="customList" data="customData" style="border-style:solid solid solid solid;border-width:1px 1px 1px 1px;overflow:auto;overflow-y:hidden;height:25px;"
      bind-mouseover="customListMouseover" bind-mouseleave="customListMouseleave"> 
      <ul class="x-list-template" xid="customUl" style="position:relative;"> 
        <li xid="li3"> 
          <label xid="label4" bind-text="ref('customNew')">label</label> 
        </li> 
      </ul> 
    </div> 
  </div> 
</div>
