<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window" component="$UI/system/components/justep/window/window"
  design="device:pc">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:369px;top:569px;"> 
    <div component="$UI/system/components/justep/data/data" autoLoad="true"
      xid="employee" idColumn="name" onCustomRefresh="employeeCustomRefresh"> 
      <column label="姓名" name="name" type="String" xid="xid1"/>  
      <column label="性别" name="sex" type="String" xid="xid2"/>  
      <column label="部门" name="dept" type="String" xid="xid3"/>  
      <column label="学历" name="enducation" type="String" xid="xid4"/> 
    </div> 
  </div>  
  <div component="$UI/system/components/justep/panel/panel" class="x-panel x-full"
    xid="panel1"> 
    <div class="x-panel-top" xid="top1" height="130">
      <h3 xid="h31"><![CDATA[控制滚动条
    
    ]]>  
        <a component="$UI/system/components/justep/button/button" class="btn btn-link"
          label="js" xid="js" onClick="jsClick"> 
          <i xid="i16"/>  
          <span xid="span16">js</span>
        </a>
      <a component="$UI/system/components/justep/button/button" class="btn btn-link" label="源码" xid="source" onClick="sourceClick">
   <i xid="i17"></i>
   <span xid="span17">源码</span></a></h3>
      <div component="$UI/system/components/justep/toolBar/toolBar" class="x-toolbar form-inline x-toolbar-spliter"
        xid="toolBar1"> 
        <a component="$UI/system/components/justep/button/button" class="btn btn-link"
          xid="bottom" label="滚动到底部" onClick="bottomClick"> 
          <i xid="i1"/>  
          <span xid="span1">滚动到底部</span> 
        </a>  
        <a component="$UI/system/components/justep/button/button" class="btn btn-link"
          label="滚动到顶部" xid="top" onClick="topClick"> 
          <i xid="i2"/>  
          <span xid="span2">滚动到顶部</span> 
        </a>  
        <a component="$UI/system/components/justep/button/button" class="btn btn-link"
          label="滚动到底部（缓动）" xid="slowBottom" onClick="slowBottomClick"> 
          <i xid="i3"/>  
          <span xid="span3">滚动到底部（缓动）</span> 
        </a>  
        <a component="$UI/system/components/justep/button/button" class="btn btn-link"
          label="滚动到顶部（缓动）" xid="slowTop" onClick="slowTopClick"> 
          <i xid="i4"/>  
          <span xid="span4">滚动到顶部（缓动）</span> 
        </a>  
        <a component="$UI/system/components/justep/button/button" class="btn btn-link"
          label="滚动到右侧" xid="right" onClick="rightClick"> 
          <i xid="i5"/>  
          <span xid="span5">滚动到右侧</span> 
        </a>  
        <a component="$UI/system/components/justep/button/button" class="btn btn-link"
          label="滚动到左侧" xid="left" onClick="leftClick"> 
          <i xid="i6"/>  
          <span xid="span6">滚动到左侧</span> 
        </a>  
        <a component="$UI/system/components/justep/button/button" class="btn btn-link"
          label="滚动到右侧（缓动）" xid="slowRight" onClick="slowRightClick"> 
          <i xid="i7"/>  
          <span xid="span7">滚动到右侧（缓动）</span>
        </a>  
        <a component="$UI/system/components/justep/button/button" class="btn btn-link"
          label="滚动到左侧（缓动）" xid="slowLeft" onClick="slowLeftClick"> 
          <i xid="i8"/>  
          <span xid="span8">滚动到左侧（缓动）</span>
        </a>  
        <a component="$UI/system/components/justep/button/button" class="btn btn-link"
          label="滚动到右下侧" xid="rightBottom" onClick="rightBottomClick"> 
          <i xid="i9"/>  
          <span xid="span9">滚动到右下侧</span>
        </a>  
        <a component="$UI/system/components/justep/button/button" class="btn btn-link"
          label="滚动到左上侧" xid="leftTop" onClick="leftTopClick"> 
          <i xid="i10"/>  
          <span xid="span10">滚动到左上侧</span>
        </a>  
        <a component="$UI/system/components/justep/button/button" class="btn btn-link"
          label="滚动到右下侧（缓动）" xid="slowRightBottom" onClick="slowRightBottomClick"> 
          <i xid="i11"/>  
          <span xid="span11">滚动到右下侧（缓动）</span>
        </a>  
        <a component="$UI/system/components/justep/button/button" class="btn btn-link"
          label="滚动到左上侧（缓动）" xid="slowLeftTop" onClick="slowLeftTopClick"> 
          <i xid="i12"/>  
          <span xid="span12">滚动到左上侧（缓动）</span>
        </a> 
      </div> 
    </div>  
    <div class="x-panel-content" name="aa" xid="content">
      <div component="$UI/system/components/justep/grid/grid" hiddenCaptionbar="true"
        name="grid" altRows="true" xid="employeeGrid" data="employee" width="auto"
        height="auto" showRowNumber="true" multiselect="true"> 
        <columns xid="columns1"> 
          <column name="name" xid="column1" width="600"/>  
          <column name="sex" xid="column2" width="600"/>  
          <column name="dept" xid="column3" width="600"/>  
          <column name="enducation" xid="column4" width="600"/> 
        </columns> 
      </div>
    </div> 
  </div>
</div>
