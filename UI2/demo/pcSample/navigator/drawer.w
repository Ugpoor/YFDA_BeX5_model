<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window" component="$UI/system/components/justep/window/window"
  design="device:pc">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:220px;top:1012px;">
    <div component="$UI/system/components/justep/data/data" autoLoad="true"
      xid="statusData" idColumn="one">
      <column name="one" type="String" xid="xid1"/>  
      <column name="two" type="String" xid="xid2"/>  
      <column name="three" type="String" xid="xid3"/>  
      <column name="first" type="String" xid="xid4"/>  
      <column name="second" type="String" xid="xid5"/>  
      <column name="third" type="String" xid="xid6"/>  
      <data xid="default1">[{"one":"1","two":"0","three":"0","first":"1","second":"0","third":"0"}]</data>
    </div> 
  </div>  
  <a component="$UI/system/components/justep/button/button" class="btn btn-link" label="js" xid="js" onClick="jsClick"> 
      <i xid="i1" />  
      <span xid="span2">js</span>
    </a><a component="$UI/system/components/justep/button/button" class="btn btn-link" label="源码" xid="source" onClick="sourceClick"> 
      <i xid="ii29" />  
      <span xid="span900">源码</span>
    </a><div component="$UI/system/components/justep/controlGroup/controlGroup" class="x-control-group"
    title="基本用法" xid="controlGroup1" style="height:570px;"> 
    <div class="x-control-group-title" xid="controlGroupTitle1"> 
      <span xid="span1"><![CDATA[基本用法]]></span>
    </div>  
    
    
    <div xid="oneDiv" style="height:33px;line-height:33px;" class="bg-info"
      bind-click="oneDivClick">
      <span xid="span4" style="text-align:center;"><![CDATA[第一部分]]></span>
    </div>
    <div xid="div6" style="height:138px;" bind-visible=" $model.statusData.val(&quot;one&quot;)==1">
      <div component="$UI/system/components/justep/row/row" class="x-row" xid="row1"> 
        <div class="x-col" xid="col1">
          <span xid="span5"><![CDATA[内容1]]></span>
        </div> 
      </div>  
      <div component="$UI/system/components/justep/row/row" class="x-row" xid="row2"> 
        <div class="x-col" xid="col4">
          <span xid="span6">内容1</span>
        </div> 
      </div>  
      <div component="$UI/system/components/justep/row/row" class="x-row" xid="row3"> 
        <div class="x-col" xid="col7">
          <span xid="span7">内容1</span>
        </div> 
      </div>  
      <div component="$UI/system/components/justep/row/row" class="x-row" xid="row4"> 
        <div class="x-col" xid="col10">
          <span xid="span8">内容1</span>
        </div> 
      </div>
    </div>  
    <div xid="twoDiv" style="height:33px;line-height:33px;" class="bg-success"
      bind-click="twoDivClick"> 
      <span xid="span9" style="text-align:center;"><![CDATA[第二部分]]></span>
    </div>  
    <div xid="div8" style="height:143px;" bind-visible=" $model.statusData.val(&quot;two&quot;)==1"> 
      <div component="$UI/system/components/justep/row/row" class="x-row" xid="row5"> 
        <div class="x-col" xid="col16"> 
          <span xid="span13"><![CDATA[内容2]]></span>
        </div> 
      </div>  
      <div component="$UI/system/components/justep/row/row" class="x-row" xid="row7"> 
        <div class="x-col" xid="col14"> 
          <span xid="span11"><![CDATA[内容2]]></span>
        </div> 
      </div>  
      <div component="$UI/system/components/justep/row/row" class="x-row" xid="row8"> 
        <div class="x-col" xid="col15"> 
          <span xid="span12"><![CDATA[内容2]]></span>
        </div> 
      </div>  
      <div component="$UI/system/components/justep/row/row" class="x-row" xid="row6"> 
        <div class="x-col" xid="col13"> 
          <span xid="span10"><![CDATA[内容2]]></span>
        </div> 
      </div> 
    </div>  
    <div xid="threeDiv" style="height:33px;line-height:33px;" class="bg-danger"
      bind-click="threeDivClick"> 
      <span xid="span14" style="text-align:center;"><![CDATA[第三部分]]></span>
    </div>  
    <div xid="div10" style="height:133px;" bind-visible=" $model.statusData.val(&quot;three&quot;)==1"> 
      <div component="$UI/system/components/justep/row/row" class="x-row" xid="row9"> 
        <div class="x-col" xid="col19"> 
          <span xid="span18"><![CDATA[内容3]]></span>
        </div> 
      </div>  
      <div component="$UI/system/components/justep/row/row" class="x-row" xid="row12"> 
        <div class="x-col" xid="col17"> 
          <span xid="span16"><![CDATA[内容3]]></span>
        </div> 
      </div>  
      <div component="$UI/system/components/justep/row/row" class="x-row" xid="row10"> 
        <div class="x-col" xid="col20"> 
          <span xid="span15"><![CDATA[内容3]]></span>
        </div> 
      </div>  
      <div component="$UI/system/components/justep/row/row" class="x-row" xid="row11"> 
        <div class="x-col" xid="col18"> 
          <span xid="span17"><![CDATA[内容3]]></span>
        </div> 
      </div> 
    </div> 
  </div>  
  <div component="$UI/system/components/justep/controlGroup/controlGroup" class="x-control-group"
    title="鼠标移入触发" xid="controlGroup2" style="height:640px;"> 
    <div class="x-control-group-title" xid="controlGroupTitle2"> 
      <span xid="span19">title</span>
    </div>  
    <div xid="firstDiv" style="height:33px;line-height:33px;" class="bg-info"
      bind-mouseover="firstDivMouseover"> 
      <span xid="span33" style="text-align:center;">第一部分</span>
    </div>  
    <div xid="div13" style="height:138px;" bind-visible="$model.statusData.val(&quot;first&quot;)==1"> 
      <div component="$UI/system/components/justep/row/row" class="x-row" xid="row13"> 
        <div class="x-col" xid="col32"> 
          <span xid="span34">内容1</span>
        </div> 
      </div>  
      <div component="$UI/system/components/justep/row/row" class="x-row" xid="row16"> 
        <div class="x-col" xid="col30"> 
          <span xid="span31">内容1</span>
        </div> 
      </div>  
      <div component="$UI/system/components/justep/row/row" class="x-row" xid="row17"> 
        <div class="x-col" xid="col31"> 
          <span xid="span32">内容1</span>
        </div> 
      </div>  
      <div component="$UI/system/components/justep/row/row" class="x-row" xid="row14"> 
        <div class="x-col" xid="col21"> 
          <span xid="span29">内容1</span>
        </div> 
      </div> 
    </div>  
    <div xid="secondDiv" style="height:33px;line-height:33px;" class="bg-success"
      bind-mouseover="secondDivMouseover"> 
      <span xid="span30" style="text-align:center;">第二部分</span>
    </div>  
    <div xid="div12" style="height:139px;" bind-visible="$model.statusData.val(&quot;second&quot;)==1"> 
      <div component="$UI/system/components/justep/row/row" class="x-row" xid="row15"> 
        <div class="x-col" xid="col27"> 
          <span xid="span26">内容2</span>
        </div> 
      </div>  
      <div component="$UI/system/components/justep/row/row" class="x-row" xid="row21"> 
        <div class="x-col" xid="col23"> 
          <span xid="span21">内容2</span>
        </div> 
      </div>  
      <div component="$UI/system/components/justep/row/row" class="x-row" xid="row18"> 
        <div class="x-col" xid="col28"> 
          <span xid="span20">内容2</span>
        </div> 
      </div>  
      <div component="$UI/system/components/justep/row/row" class="x-row" xid="row20"> 
        <div class="x-col" xid="col24"> 
          <span xid="span22">内容2</span>
        </div> 
      </div> 
    </div>  
    <div xid="thirdDiv" style="height:33px;line-height:33px;" class="bg-danger"
      bind-mouseover="thirdDivMouseover"> 
      <span xid="span25" style="text-align:center;">第三部分</span>
    </div>  
    <div xid="div15" style="height:219px;" bind-visible="$model.statusData.val(&quot;third&quot;)==1"> 
      <div component="$UI/system/components/justep/row/row" class="x-row" xid="row19"> 
        <div class="x-col" xid="col22"> 
          <span xid="span28">内容3</span>
        </div> 
      </div>  
      <div component="$UI/system/components/justep/row/row" class="x-row" xid="row23"> 
        <div class="x-col" xid="col26"> 
          <span xid="span23">内容3</span>
        </div> 
      </div>  
      <div component="$UI/system/components/justep/row/row" class="x-row" xid="row24"> 
        <div class="x-col" xid="col29"> 
          <span xid="span24">内容3</span>
        </div> 
      </div>  
      <div component="$UI/system/components/justep/row/row" class="x-row" xid="row22"> 
        <div class="x-col" xid="col25"> 
          <span xid="span27">内容3</span>
        </div> 
      </div> 
    </div>
  </div>
</div>
