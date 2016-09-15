<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window" component="$UI/system/components/justep/window/window"
  design="device:pc">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:303px;top:3272px;"> 
    <div component="$UI/system/components/justep/data/data" autoLoad="true"
      xid="statusData" idColumn="firstStatus"> 
      <column label="第一部分" name="firstStatus" type="String" xid="xid1"/>  
      <column label="第二部分" name="secondStatus" type="String" xid="xid2"/>  
      <column label="第三部分" name="thirdStatus" type="String" xid="xid3"/>  
      <column label="第四部分" name="fourthStatus" type="String" xid="xid4"/>  
      <column label="第五部分" name="fifthStatus" type="String" xid="xid5"/>  
      <column label="第六部分" name="sixthStatus" type="String" xid="xid6"/>  
      <column label="第七部分" name="seventhStatus" type="String" xid="xid7"/>  
      <column label="第八部分" name="eighthStatus" type="String" xid="xid8"/>  
      <column label="第九部分" name="ninthStatus" type="String" xid="xid9"/>  
      <column label="第十部分" name="tenthStatus" type="String" xid="xid10"/>  
      <column label="第十部分隐藏的" name="tenthDivStatus" type="String" xid="xid11"/>  
      <column label="第十一部分" name="eleventhStatus" type="String" xid="xid12"/>  
      <data xid="default1">[{"firstStatus":"0","secondStatus":"1","thirdStatus":"0","fourthStatus":"1","fifthStatus":"0","sixthStatus":"1","seventhStatus":"0","eighthStatus":"1","ninthStatus":"1","tenthStatus":"1","tenthDivStatus":"0","eleventhStatus":"0"}]</data>
    </div> 
  </div>  
  <a component="$UI/system/components/justep/button/button" class="btn btn-link" label="js" xid="js" onClick="jsClick"> 
      <i xid="i1" />  
      <span xid="span2">js</span>
    </a><a component="$UI/system/components/justep/button/button" class="btn btn-link" label="源码" xid="source" onClick="sourceClick"> 
      <i xid="ii29" />  
      <span xid="span900">源码</span>
    </a><div component="$UI/system/components/justep/controlGroup/controlGroup" class="x-control-group"
    title="1、关闭上侧-初始时关闭" xid="controlGroup1" style="height:320px;"> 
    <div class="x-control-group-title" xid="controlGroupTitle1"> 
      <span xid="span1">title</span> 
    </div>  
    
    
    <div xid="div1" style="height:100px;width:270px;border-top-style:solid;border-right-style:solid;border-left-style:solid;border-top-width:1px;border-right-width:1px;border-left-width:1px;"
      bind-visible=" $model.statusData.val(&quot;firstStatus&quot;)==1"> 
      <span xid="span4"><![CDATA[内容区域1]]></span> 
    </div>  
    <div xid="firstToggleDiv" style="padding-top:2px;border-width:1px;border-style:solid solid solid solid;height:10px;width:270px;"
      align="center" bind-click="firstToggleDivClick"> 
      <div xid="div4" style="height:5px;width:207px;border-style:solid solid solid solid;border-width:thin thin thin thin;background-color:#0000FF;"/> 
    </div>  
    <div xid="div5" style="width:270px;height:100px;border-right-style:solid;border-right-width:1px;border-bottom-style:solid;border-bottom-width:1px;border-left-style:solid;border-left-width:1px;"> 
      <span xid="span5"><![CDATA[内容区域2]]></span> 
    </div> 
  </div>  
  <div component="$UI/system/components/justep/controlGroup/controlGroup" class="x-control-group"
    title="2、关闭上侧-初始时打开" xid="controlGroup2" style="height:320px;"> 
    <div class="x-control-group-title" xid="controlGroupTitle2"> 
      <span xid="span6">title</span> 
    </div>  
    <div xid="div9" style="height:100px;width:270px;border-top-style:solid;border-right-style:solid;border-left-style:solid;border-top-width:1px;border-right-width:1px;border-left-width:1px;"
      bind-visible=" $model.statusData.val(&quot;secondStatus&quot;)==1"> 
      <span xid="span9">内容区域1</span> 
    </div>  
    <div xid="secondToggleDiv" style="padding-top:2px;border-width:1px;border-style:solid solid solid solid;height:10px;width:270px;"
      align="center" bind-click="secondToggleDivClick"> 
      <div xid="div8" style="height:5px;width:207px;border-style:solid solid solid solid;border-width:thin thin thin thin;background-color:#0000FF;"/> 
    </div>  
    <div xid="div6" style="width:270px;height:100px;border-right-style:solid;border-right-width:1px;border-bottom-style:solid;border-bottom-width:1px;border-left-style:solid;border-left-width:1px;"> 
      <span xid="span10">内容区域2</span> 
    </div> 
  </div>  
  <div component="$UI/system/components/justep/controlGroup/controlGroup" class="x-control-group"
    title="3、关闭下侧-初始时关闭" xid="controlGroup3" style="height:320px;"> 
    <div class="x-control-group-title" xid="controlGroupTitle3"> 
      <span xid="span7">title</span> 
    </div>  
    <div xid="div13" style="height:100px;width:270px;border-top-style:solid;border-right-style:solid;border-left-style:solid;border-top-width:1px;border-right-width:1px;border-left-width:1px;"> 
      <span xid="span11">内容区域1</span> 
    </div>  
    <div xid="thirdToggleDiv" style="padding-top:2px;border-width:1px;border-style:solid solid solid solid;height:10px;width:270px;"
      align="center" bind-click="thirdToggleDivClick"> 
      <div xid="div12" style="height:5px;width:207px;border-style:solid solid solid solid;border-width:thin thin thin thin;background-color:#0000FF;"/> 
    </div>  
    <div xid="div10" style="width:270px;height:100px;border-right-style:solid;border-right-width:1px;border-bottom-style:solid;border-bottom-width:1px;border-left-style:solid;border-left-width:1px;"
      bind-visible=" $model.statusData.val(&quot;thirdStatus&quot;)==1"> 
      <span xid="span12">内容区域2</span> 
    </div> 
  </div>  
  <div component="$UI/system/components/justep/controlGroup/controlGroup" class="x-control-group"
    title="4、关闭下侧-初始时打开" xid="controlGroup4" style="height:320px;"> 
    <div class="x-control-group-title" xid="controlGroupTitle5"> 
      <span xid="span15">title</span> 
    </div>  
    <div xid="div15" style="height:100px;width:270px;border-top-style:solid;border-right-style:solid;border-left-style:solid;border-top-width:1px;border-right-width:1px;border-left-width:1px;"> 
      <span xid="span14">内容区域1</span> 
    </div>  
    <div xid="fourthToggleDiv" style="padding-top:2px;border-width:1px;border-style:solid solid solid solid;height:10px;width:270px;"
      align="center" bind-click="fourthToggleDivClick"> 
      <div xid="div16" style="height:5px;width:207px;border-style:solid solid solid solid;border-width:thin thin thin thin;background-color:#0000FF;"/> 
    </div>  
    <div xid="div17" style="width:270px;height:100px;border-right-style:solid;border-right-width:1px;border-bottom-style:solid;border-bottom-width:1px;border-left-style:solid;border-left-width:1px;"
      bind-visible=" $model.statusData.val(&quot;fourthStatus&quot;)==1"> 
      <span xid="span13">内容区域2</span> 
    </div> 
  </div>  
  <div component="$UI/system/components/justep/controlGroup/controlGroup" class="x-control-group"
    title="5、关闭左侧-初始时关闭" xid="controlGroup5" style="height:320px;"> 
    <div class="x-control-group-title" xid="controlGroupTitle6"> 
      <span xid="span16">title</span> 
    </div>  
    <div xid="div19" style="height:170px;"> 
      <div xid="div18" style="height:170px;width:100px;border-width:1px 1px 1px 1px;border-top-style:solid;border-bottom-style:solid;border-left-style:solid;"
        class="pull-left" bind-visible=" $model.statusData.val(&quot;fifthStatus&quot;)==1">
        <span xid="span17"><![CDATA[内容区域1]]></span>
      </div>  
      <div xid="fifthToggleDiv" style="padding-top:30px;border-style:solid solid solid solid;border-width:1px 1px 1px 1px;height:170px;width:10px;"
        class="pull-left" align="center" bind-click="fifthToggleDivClick"> 
        <div xid="div22" style="border-style:solid solid solid solid;border-width:1px 1px 1px 1px;height:120px;background-color:#0000FF;width:5px;"
          align="center"/> 
      </div>  
      <div xid="div21" style="height:170px;width:100px;border-width:1px 1px 1px 1px;border-top-style:solid;border-right-style:solid;border-bottom-style:solid;"
        class="pull-left">
        <span xid="span18"><![CDATA[内容区域2]]></span>
      </div> 
    </div> 
  </div>  
  <div component="$UI/system/components/justep/controlGroup/controlGroup" class="x-control-group"
    title="6、关闭左侧-初始时打开" xid="controlGroup6" style="height:320px;"> 
    <div class="x-control-group-title" xid="controlGroupTitle7"> 
      <span xid="span19">title</span>
    </div>  
    <div xid="div26" style="height:170px;"> 
      <div xid="div27" style="height:170px;width:100px;border-width:1px 1px 1px 1px;border-top-style:solid;border-bottom-style:solid;border-left-style:solid;"
        class="pull-left" bind-visible=" $model.statusData.val(&quot;sixthStatus&quot;)==1"> 
        <span xid="span20">内容区域1</span>
      </div>  
      <div xid="sixthToggleDiv" style="padding-top:30px;border-style:solid solid solid solid;border-width:1px 1px 1px 1px;height:170px;width:10px;"
        class="pull-left" align="center" bind-click="sixthToggleDivClick"> 
        <div xid="div24" style="border-style:solid solid solid solid;border-width:1px 1px 1px 1px;height:120px;background-color:#0000FF;width:5px;"
          align="center"/>
      </div>  
      <div xid="div23" style="height:170px;width:100px;border-width:1px 1px 1px 1px;border-top-style:solid;border-right-style:solid;border-bottom-style:solid;"
        class="pull-left"> 
        <span xid="span21">内容区域2</span>
      </div> 
    </div> 
  </div>
  <div component="$UI/system/components/justep/controlGroup/controlGroup" class="x-control-group"
    title="7、关闭右侧-初始时关闭" xid="controlGroup7" style="height:320px;"> 
    <div class="x-control-group-title" xid="controlGroupTitle8"> 
      <span xid="span22">title</span>
    </div>  
    <div xid="div28" style="height:170px;"> 
      <div xid="div29" style="height:170px;width:100px;border-width:1px 1px 1px 1px;border-top-style:solid;border-bottom-style:solid;border-left-style:solid;"
        class="pull-left"> 
        <span xid="span23">内容区域1</span>
      </div>  
      <div xid="seventhToggleDiv" style="padding-top:30px;border-style:solid solid solid solid;border-width:1px 1px 1px 1px;height:170px;width:10px;"
        class="pull-left" align="center" bind-click="seventhToggleDivClick"> 
        <div xid="div31" style="border-style:solid solid solid solid;border-width:1px 1px 1px 1px;height:120px;background-color:#0000FF;width:5px;"
          align="center"/>
      </div>  
      <div xid="div30" style="height:170px;width:100px;border-width:1px 1px 1px 1px;border-top-style:solid;border-right-style:solid;border-bottom-style:solid;"
        class="pull-left" bind-visible=" $model.statusData.val(&quot;seventhStatus&quot;)==1"> 
        <span xid="span24">内容区域2</span>
      </div> 
    </div> 
  </div>
  <div component="$UI/system/components/justep/controlGroup/controlGroup" class="x-control-group"
    title="8、关闭右侧-初始时打开" xid="controlGroup8" style="height:320px;"> 
    <div class="x-control-group-title" xid="controlGroupTitle9"> 
      <span xid="span26">title</span>
    </div>  
    <div xid="div34" style="height:170px;"> 
      <div xid="div33" style="height:170px;width:100px;border-width:1px 1px 1px 1px;border-top-style:solid;border-bottom-style:solid;border-left-style:solid;"
        class="pull-left"> 
        <span xid="span27">内容区域1</span>
      </div>  
      <div xid="eighthToggleDiv" style="padding-top:30px;border-style:solid solid solid solid;border-width:1px 1px 1px 1px;height:170px;width:10px;"
        class="pull-left" align="center" bind-click="eighthToggleDivClick"> 
        <div xid="div35" style="border-style:solid solid solid solid;border-width:1px 1px 1px 1px;height:120px;background-color:#0000FF;width:5px;"
          align="center"/>
      </div>  
      <div xid="div36" style="height:170px;width:100px;border-width:1px 1px 1px 1px;border-top-style:solid;border-right-style:solid;border-bottom-style:solid;"
        class="pull-left" bind-visible=" $model.statusData.val(&quot;eighthStatus&quot;)==1"> 
        <span xid="span25">内容区域2</span>
      </div> 
    </div> 
  </div>
  <div component="$UI/system/components/justep/controlGroup/controlGroup" class="x-control-group"
    xid="controlGroup9" style="height:320px;" title="9、外部控制"> 
    <div class="x-control-group-title" xid="controlGroupTitle10"> 
      <span xid="span30">title</span>
    </div>  
    <div xid="div41" style="height:100px;width:270px;border-top-style:solid;border-right-style:solid;border-left-style:solid;border-top-width:1px;border-right-width:1px;border-left-width:1px;"
      bind-visible=" $model.statusData.val(&quot;ninthStatus&quot;)==1"> 
      <span xid="span28">内容区域1</span>
    </div>  
    <div xid="ninthToggleDiv" style="padding-top:2px;border-width:1px;border-style:solid solid solid solid;height:10px;width:270px;"
      align="center" bind-click="ninthToggleDivClick"> 
      <div xid="div40" style="height:5px;width:207px;border-style:solid solid solid solid;border-width:thin thin thin thin;background-color:#0000FF;"/>
    </div>  
    <div xid="div38" style="width:270px;height:100px;border-right-style:solid;border-right-width:1px;border-bottom-style:solid;border-bottom-width:1px;border-left-style:solid;border-left-width:1px;"> 
      <span xid="span29">内容区域2</span>
    </div>  
    <a component="$UI/system/components/justep/button/button" class="btn btn-link "
      label="点击切换区域状态" xid="ninthToggleBtn" onClick="ninthToggleBtnClick"> 
      <i xid="i3"/>  
      <span xid="span31">点击切换区域状态</span>
    </a>  
    <a component="$UI/system/components/justep/button/button" class="btn btn-link"
      label="得到区域状态" xid="getStatusBtn" onClick="getStatusBtnClick"> 
      <i xid="i4"/>  
      <span xid="span32">得到区域状态</span>
    </a>  
    <a component="$UI/system/components/justep/button/button" class="btn btn-link"
      label="点击打开" xid="openBtn" onClick="openBtnClick"> 
      <i xid="i5"/>  
      <span xid="span33">点击打开</span>
    </a>  
    <a component="$UI/system/components/justep/button/button" class="btn btn-link"
      label="点击关闭" xid="closeBtn" onClick="closeBtnClick"> 
      <i xid="i6"/>  
      <span xid="span34">点击关闭</span>
    </a> 
  </div>  
  <div component="$UI/system/components/justep/controlGroup/controlGroup" class="x-control-group"
    xid="controlGroup10" style="height:320px;" title="10、动态创建"> 
    <div class="x-control-group-title" xid="controlGroupTitle11"> 
      <span xid="span39">title</span>
    </div>  
    <a component="$UI/system/components/justep/button/button" class="btn btn-link"
      label="点击创建" xid="createBtn" onClick="createBtnClick"> 
      <i xid="i11"/>  
      <span xid="span42">点击创建</span>
    </a>
    <div xid="div46" bind-visible=" $model.statusData.val(&quot;tenthDivStatus&quot;)==1">
      <div xid="div45" style="height:100px;width:270px;border-top-style:solid;border-right-style:solid;border-left-style:solid;border-top-width:1px;border-right-width:1px;border-left-width:1px;"
        bind-visible=" $model.statusData.val(&quot;tenthStatus&quot;)==1"> 
        <span xid="span41">内容区域1</span>
      </div>
      <div xid="tenthToggleDiv" style="padding-top:2px;border-width:1px;border-style:solid solid solid solid;height:10px;width:270px;"
        align="center" bind-click="tenthToggleDivClick"> 
        <div xid="div44" style="height:5px;width:207px;border-style:solid solid solid solid;border-width:thin thin thin thin;background-color:#0000FF;"/>
      </div>
      <div xid="div43" style="width:270px;height:100px;border-right-style:solid;border-right-width:1px;border-bottom-style:solid;border-bottom-width:1px;border-left-style:solid;border-left-width:1px;"> 
        <span xid="span40">内容区域2</span>
      </div>
    </div> 
  </div>
  <div component="$UI/system/components/justep/controlGroup/controlGroup" class="x-control-group"
    title="11、事件" xid="controlGroup11" style="height:320px;"> 
    <div class="x-control-group-title" xid="controlGroupTitle12"> 
      <span xid="span45">title</span>
    </div>  
    <div xid="div50" style="height:100px;width:270px;border-top-style:solid;border-right-style:solid;border-left-style:solid;border-top-width:1px;border-right-width:1px;border-left-width:1px;"
      bind-visible=" $model.statusData.val(&quot;eleventhStatus&quot;)==1"> 
      <span xid="span43">内容区域1</span>
    </div>  
    <div xid="eleventhToggleDiv" style="padding-top:2px;border-width:1px;border-style:solid solid solid solid;height:10px;width:270px;"
      align="center" bind-click="eleventhToggleDivClick"> 
      <div xid="div49" style="height:5px;width:207px;border-style:solid solid solid solid;border-width:thin thin thin thin;background-color:#0000FF;"/>
    </div>  
    <div xid="div47" style="width:270px;height:100px;border-right-style:solid;border-right-width:1px;border-bottom-style:solid;border-bottom-width:1px;border-left-style:solid;border-left-width:1px;"> 
      <span xid="span44">内容区域2</span>
    </div> 
  </div>
</div>
