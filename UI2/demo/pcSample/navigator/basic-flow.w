<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window" component="$UI/system/components/justep/window/window"
  design="device:pc">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:348px;top:2533px;">
    <div component="$UI/system/components/justep/data/data" autoLoad="true"
      xid="statusData" idColumn="status">
      <column name="status" type="String" xid="xid1"/>  
      <data xid="default1">[{"status":"0"}]</data>
    </div>  
    <div component="$UI/system/components/justep/data/data" autoLoad="true"
      xid="iframeStatusData" idColumn="status">
      <column name="status" type="String" xid="xid2"/>  
      <data xid="default2">[{"status":"0"}]</data>
    </div>
  </div>  
  <div component="$UI/system/components/justep/controlGroup/controlGroup" class="x-control-group"
    title="1、非iframe模式-基本使用" xid="controlGroup1" style="height:341px;"> 
    <div class="x-control-group-title" xid="controlGroupTitle1"> 
      <span xid="span1">title</span>
    </div>  
    <a component="$UI/system/components/justep/button/button" class="btn btn-link"
      label="js" xid="js" onClick="jsClick"> 
      <i xid="i29"/>  
      <span xid="span75">js</span>
    </a>
    <a component="$UI/system/components/justep/button/button" class="btn btn-link"
      label="源码" xid="source" onClick="sourceClick"> 
      <i xid="ii29"/>  
      <span xid="span755">source</span>
    </a>
    <div component="$UI/system/components/justep/button/buttonGroup" class="btn-group x-card x-tuniu"
      tabbed="true" xid="buttonGroup2" style="width:100%;"> 
      <div component="$UI/system/components/justep/row/row" class="x-row" xid="row37"> 
        <div class="x-col x-col-20" xid="col37">
          <hr xid="hr2" style="border-style:solid solid solid solid;border-width:5px 5px 5px 5px;border-color:#C0C0C0 #C0C0C0 #C0C0C0 #C0C0C0;width:100%;"
            class="pull-left"/>
        </div>  
        <div class="x-col x-col-fixed" xid="col38" style="width:auto;">
          <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-top pull-left"
            label="导航栏目1" xid="button8" icon="icon-ionic" style="width:13px;" target="content2"> 
            <i xid="i9" class="icon-ionic"/>  
            <span xid="span10">导航栏目1</span>
          </a>
        </div>  
        <div class="x-col" xid="col39">
          <hr xid="hr3" style="border-style:solid solid solid solid;border-width:5px 5px 5px 5px;border-color:#C0C0C0 #C0C0C0 #C0C0C0 #C0C0C0;width:100%;"
            class="pull-left"/>
        </div>  
        <div class="x-col x-col-fixed" xid="col40" style="width:auto;">
          <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-top"
            label="导航栏目2" xid="button9" icon="icon-ionic" style="width:15px;" target="content3"> 
            <i xid="i8" class="icon-ionic"/>  
            <span xid="span11">导航栏目2</span>
          </a>
        </div>  
        <div class="x-col" xid="col41">
          <hr xid="hr4" style="border-style:solid solid solid solid;border-width:5px 5px 5px 5px;border-color:#C0C0C0 #C0C0C0 #C0C0C0 #C0C0C0;width:100%;"
            class="pull-left"/>
        </div>  
        <div class="x-col x-col-fixed" xid="col42" style="width:auto;">
          <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-top"
            label="导航栏目3" xid="button1" icon="icon-ionic" style="width:20px;" target="content4"> 
            <i xid="i1" class="icon-ionic"/>  
            <span xid="span2">导航栏目3</span>
          </a>
        </div>  
        <div class="x-col" xid="col43">
          <hr xid="hr1" style="border-style:solid solid solid solid;border-width:5px 5px 5px 5px;border-color:#C0C0C0 #C0C0C0 #C0C0C0 #C0C0C0;width:100%;"
            class="pull-left"/>
        </div>  
        <div class="x-col x-col-fixed" xid="col49" style="width:auto;">
          <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-top"
            label="导航栏目4" xid="button2" icon="icon-ionic" style="width:21px;" target="content5"> 
            <i xid="i2" class="icon-ionic"/>  
            <span xid="span3">导航栏目4</span>
          </a>
        </div>  
        <div class="x-col" xid="col50">
          <hr xid="hr5" style="border-style:solid solid solid solid;border-width:5px 5px 5px 5px;border-color:#C0C0C0 #C0C0C0 #C0C0C0 #C0C0C0;width:100%;"
            class="pull-left"/>
        </div>  
        <div class="x-col x-col-fixed" xid="col52" style="width:auto;">
          <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-top"
            label="导航栏目5" xid="button6" icon="icon-ionic" style="width:21px;" target="content6"> 
            <i xid="i7" class="icon-ionic"/>  
            <span xid="span8">导航栏目5</span>
          </a>
        </div>  
        <div class="x-col x-col-25" xid="col53">
          <hr xid="hr6" style="border-style:solid solid solid solid;border-width:5px 5px 5px 5px;border-color:#C0C0C0 #C0C0C0 #C0C0C0 #C0C0C0;width:100%;"
            class="pull-left"/>
        </div>
      </div> 
    </div>  
    <div component="$UI/system/components/justep/contents/contents" class="x-contents"
      active="0" xid="contents2" style="height:150px;"> 
      <div class="x-contents-content" xid="content2" style="height:150px;">
        <div component="$UI/system/components/justep/row/row" class="x-row"
          xid="row1"> 
          <div class="x-col" xid="col1">
            <span xid="span4"><![CDATA[内容1]]></span>
          </div> 
        </div>  
        <div component="$UI/system/components/justep/row/row" class="x-row"
          xid="row2"> 
          <div class="x-col" xid="col4">
            <span xid="span6">内容1</span>
          </div> 
        </div>
      </div>  
      <div class="x-contents-content" xid="content3" style="height:150px;">
        <div component="$UI/system/components/justep/row/row" class="x-row"
          xid="row3"> 
          <div class="x-col" xid="col8"> 
            <span xid="span9"><![CDATA[内容2]]></span>
          </div> 
        </div>  
        <div component="$UI/system/components/justep/row/row" class="x-row"
          xid="row4"> 
          <div class="x-col" xid="col7"> 
            <span xid="span7"><![CDATA[内容2]]></span>
          </div> 
        </div>
      </div>  
      <div class="x-contents-content" xid="content4" style="height:150px;">
        <div component="$UI/system/components/justep/row/row" class="x-row"
          xid="row5"> 
          <div class="x-col" xid="col10"> 
            <span xid="span13"><![CDATA[内容3]]></span>
          </div> 
        </div>  
        <div component="$UI/system/components/justep/row/row" class="x-row"
          xid="row6"> 
          <div class="x-col" xid="col9"> 
            <span xid="span12"><![CDATA[内容3]]></span>
          </div> 
        </div>
      </div>  
      <div class="x-contents-content" xid="content5" style="height:150px;">
        <div component="$UI/system/components/justep/row/row" class="x-row"
          xid="row7"> 
          <div class="x-col" xid="col12"> 
            <span xid="span15"><![CDATA[内容4]]></span>
          </div> 
        </div>  
        <div component="$UI/system/components/justep/row/row" class="x-row"
          xid="row8"> 
          <div class="x-col" xid="col11"> 
            <span xid="span14"><![CDATA[内容4]]></span>
          </div> 
        </div>
      </div>  
      <div class="x-contents-content" xid="content6" style="height:150px;">
        <div component="$UI/system/components/justep/row/row" class="x-row"
          xid="row9"> 
          <div class="x-col" xid="col14"> 
            <span xid="span17"><![CDATA[内容5]]></span>
          </div> 
        </div>  
        <div component="$UI/system/components/justep/row/row" class="x-row"
          xid="row10"> 
          <div class="x-col" xid="col13"> 
            <span xid="span16"><![CDATA[内容5]]></span>
          </div> 
        </div>
      </div>
    </div> 
  </div>
  <div component="$UI/system/components/justep/controlGroup/controlGroup" class="x-control-group"
    title="2、非iframe模式-设定初始选中索引" xid="controlGroup2" style="height:341px;"> 
    <div class="x-control-group-title" xid="controlGroupTitle2"> 
      <span xid="span33">title</span>
    </div>  
    <div component="$UI/system/components/justep/button/buttonGroup" class="btn-group x-card x-tuniu"
      tabbed="true" xid="buttonGroup1" selected="button3" style="width:100%;"> 
      <div component="$UI/system/components/justep/row/row" class="x-row" xid="row38"> 
        <div class="x-col x-col-20" xid="col56"> 
          <hr xid="hr11" style="border-style:solid solid solid solid;border-width:5px 5px 5px 5px;border-color:#C0C0C0 #C0C0C0 #C0C0C0 #C0C0C0;width:100%;"
            class="pull-left"/>
        </div>  
        <div class="x-col x-col-fixed" xid="col55" style="width:auto;"> 
          <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-top pull-left"
            label="导航栏目1" xid="button3" icon="icon-ionic" style="width:22px;" target="content7"> 
            <i xid="i3" class="icon-ionic"/>  
            <span xid="span20">导航栏目1</span>
          </a>
        </div>  
        <div class="x-col" xid="col54"> 
          <hr xid="hr12" style="border-style:solid solid solid solid;border-width:5px 5px 5px 5px;border-color:#C0C0C0 #C0C0C0 #C0C0C0 #C0C0C0;width:100%;"
            class="pull-left"/>
        </div>  
        <div class="x-col x-col-fixed" xid="col63" style="width:auto;"> 
          <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-top"
            label="导航栏目2" xid="button4" icon="icon-ionic" style="width:15px;" target="content8"> 
            <i xid="i4" class="icon-ionic"/>  
            <span xid="span19">导航栏目2</span>
          </a>
        </div>  
        <div class="x-col" xid="col64"> 
          <hr xid="hr9" style="border-style:solid solid solid solid;border-width:5px 5px 5px 5px;border-color:#C0C0C0 #C0C0C0 #C0C0C0 #C0C0C0;width:100%;"
            class="pull-left"/>
        </div>  
        <div class="x-col x-col-fixed" xid="col58" style="width:auto;"> 
          <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-top"
            label="导航栏目3" xid="button10" icon="icon-ionic" style="width:20px;" target="content9"> 
            <i xid="i10" class="icon-ionic"/>  
            <span xid="span31">导航栏目3</span>
          </a>
        </div>  
        <div class="x-col" xid="col61"> 
          <hr xid="hr7" style="border-style:solid solid solid solid;border-width:5px 5px 5px 5px;border-color:#C0C0C0 #C0C0C0 #C0C0C0 #C0C0C0;width:100%;"
            class="pull-left"/>
        </div>  
        <div class="x-col x-col-fixed" xid="col57" style="width:auto;"> 
          <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-top"
            label="导航栏目4" xid="button7" icon="icon-ionic" style="width:21px;" target="content10"> 
            <i xid="i6" class="icon-ionic"/>  
            <span xid="span32">导航栏目4</span>
          </a>
        </div>  
        <div class="x-col x-col-25" xid="col59"> 
          <hr xid="hr8" style="border-style:solid solid solid solid;border-width:5px 5px 5px 5px;border-color:#C0C0C0 #C0C0C0 #C0C0C0 #C0C0C0;width:100%;"
            class="pull-left"/>
        </div> 
      </div> 
    </div>  
    <div component="$UI/system/components/justep/contents/contents" class="x-contents"
      active="0" xid="contents3" style="height:150px;"> 
      <div class="x-contents-content" xid="content7" style="height:150px;"> 
        <div component="$UI/system/components/justep/row/row" class="x-row"
          xid="row11"> 
          <div class="x-col" xid="col22"> 
            <span xid="span30">内容1</span>
          </div> 
        </div>  
        <div component="$UI/system/components/justep/row/row" class="x-row"
          xid="row14"> 
          <div class="x-col" xid="col20"> 
            <span xid="span28">内容1</span>
          </div> 
        </div> 
      </div>  
      <div class="x-contents-content" xid="content8" style="height:150px;"> 
        <div component="$UI/system/components/justep/row/row" class="x-row"
          xid="row15"> 
          <div class="x-col" xid="col24"> 
            <span xid="span27">内容2</span>
          </div> 
        </div>  
        <div component="$UI/system/components/justep/row/row" class="x-row"
          xid="row12"> 
          <div class="x-col" xid="col21"> 
            <span xid="span29">内容2</span>
          </div> 
        </div> 
      </div>  
      <div class="x-contents-content" xid="content9" style="height:150px;"> 
        <div component="$UI/system/components/justep/row/row" class="x-row"
          xid="row13"> 
          <div class="x-col" xid="col15"> 
            <span xid="span24">内容3</span>
          </div> 
        </div>  
        <div component="$UI/system/components/justep/row/row" class="x-row"
          xid="row18"> 
          <div class="x-col" xid="col23"> 
            <span xid="span18">内容3</span>
          </div> 
        </div> 
      </div>  
      <div class="x-contents-content" xid="content10" style="height:150px;"> 
        <div component="$UI/system/components/justep/row/row" class="x-row"
          xid="row19"> 
          <div class="x-col" xid="col18"> 
            <span xid="span22">内容4</span>
          </div> 
        </div>  
        <div component="$UI/system/components/justep/row/row" class="x-row"
          xid="row16"> 
          <div class="x-col" xid="col19"> 
            <span xid="span23">内容4</span>
          </div> 
        </div> 
      </div> 
    </div> 
  </div>
  <div component="$UI/system/components/justep/controlGroup/controlGroup" class="x-control-group"
    title="3、非iframe模式-禁止点击并由外部控制索引" xid="controlGroup3" style="height:700px;"> 
    <div class="x-control-group-title" xid="controlGroupTitle3"> 
      <span xid="span38">title</span>
    </div>  
    <div component="$UI/system/components/justep/row/row" class="x-row" xid="row31"> 
      <div class="x-col" xid="col35"> 
        <span xid="span50"><![CDATA[禁用全部选项卡：]]></span>
      </div> 
    </div>
    <div component="$UI/system/components/justep/button/buttonGroup" class="btn-group x-card x-tuniu"
      tabbed="true" xid="optionBtnGroup" selected="button14" style="width:100%;"> 
      <div component="$UI/system/components/justep/row/row" class="x-row" xid="row39"> 
        <div class="x-col x-col-20" xid="col68"> 
          <hr xid="hr18" style="border-style:solid solid solid solid;border-width:5px 5px 5px 5px;border-color:#C0C0C0 #C0C0C0 #C0C0C0 #C0C0C0;width:100%;"
            class="pull-left"/>
        </div>  
        <div class="x-col x-col-fixed" xid="col67" style="width:auto;"> 
          <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-top pull-left"
            label="导航栏目1" xid="button14" icon="icon-ionic" style="width:22px;" target="page14"
            disabled="true"> 
            <i xid="i14" class="icon-ionic"/>  
            <span xid="span48">导航栏目1</span>
          </a>
        </div>  
        <div class="x-col" xid="col75"> 
          <hr xid="hr17" style="border-style:solid solid solid solid;border-width:5px 5px 5px 5px;border-color:#C0C0C0 #C0C0C0 #C0C0C0 #C0C0C0;width:100%;"
            class="pull-left"/>
        </div>  
        <div class="x-col x-col-fixed" xid="col72" style="width:auto;"> 
          <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-top"
            label="导航栏目2" xid="button15" icon="icon-ionic" style="width:15px;" target="page15"
            disabled="true"> 
            <i xid="i13" class="icon-ionic"/>  
            <span xid="span34">导航栏目2</span>
          </a>
        </div>  
        <div class="x-col" xid="col73"> 
          <hr xid="hr14" style="border-style:solid solid solid solid;border-width:5px 5px 5px 5px;border-color:#C0C0C0 #C0C0C0 #C0C0C0 #C0C0C0;width:100%;"
            class="pull-left"/>
        </div>  
        <div class="x-col x-col-fixed" xid="col71" style="width:auto;"> 
          <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-top"
            label="导航栏目3" xid="button16" icon="icon-ionic" style="width:20px;" target="page16"
            disabled="true"> 
            <i xid="i15" class="icon-ionic"/>  
            <span xid="span36">导航栏目3</span>
          </a>
        </div>  
        <div class="x-col" xid="col74"> 
          <hr xid="hr15" style="border-style:solid solid solid solid;border-width:5px 5px 5px 5px;border-color:#C0C0C0 #C0C0C0 #C0C0C0 #C0C0C0;width:100%;"
            class="pull-left"/>
        </div>  
        <div class="x-col x-col-fixed" xid="col69" style="width:auto;"> 
          <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-top"
            label="导航栏目4" xid="button17" icon="icon-ionic" style="width:21px;" target="page17"
            disabled="true"> 
            <i xid="i11" class="icon-ionic"/>  
            <span xid="span37">导航栏目4</span>
          </a>
        </div>  
        <div class="x-col x-col-25" xid="col66"> 
          <hr xid="hr13" style="border-style:solid solid solid solid;border-width:5px 5px 5px 5px;border-color:#C0C0C0 #C0C0C0 #C0C0C0 #C0C0C0;width:100%;"
            class="pull-left"/>
        </div> 
      </div> 
    </div>  
    <div component="$UI/system/components/justep/contents/contents" class="x-contents"
      active="0" xid="pages" style="height:150px;"> 
      <div class="x-contents-content" xid="page14" style="height:150px;"> 
        <div component="$UI/system/components/justep/row/row" class="x-row"
          xid="row25"> 
          <div class="x-col" xid="col33"> 
            <span xid="span39">内容1</span>
          </div> 
        </div>  
        <div component="$UI/system/components/justep/row/row" class="x-row"
          xid="row30"> 
          <div class="x-col" xid="col30"> 
            <span xid="span41">内容1</span>
          </div> 
        </div> 
      </div>  
      <div class="x-contents-content" xid="page15" style="height:150px;"> 
        <div component="$UI/system/components/justep/row/row" class="x-row"
          xid="row27"> 
          <div class="x-col" xid="col34"> 
            <span xid="span43">内容2</span>
          </div> 
        </div>  
        <div component="$UI/system/components/justep/row/row" class="x-row"
          xid="row26"> 
          <div class="x-col" xid="col31"> 
            <span xid="span40">内容2</span>
          </div> 
        </div> 
      </div>  
      <div class="x-contents-content" xid="page16" style="height:150px;"> 
        <div component="$UI/system/components/justep/row/row" class="x-row"
          xid="row29"> 
          <div class="x-col" xid="col29"> 
            <span xid="span44">内容3</span>
          </div> 
        </div>  
        <div component="$UI/system/components/justep/row/row" class="x-row"
          xid="row22"> 
          <div class="x-col" xid="col32"> 
            <span xid="span35">内容3</span>
          </div> 
        </div> 
      </div>  
      <div class="x-contents-content" xid="page17" style="height:150px;"> 
        <div component="$UI/system/components/justep/row/row" class="x-row"
          xid="row23"> 
          <div class="x-col" xid="col26"> 
            <span xid="span46">内容4</span>
          </div> 
        </div>  
        <div component="$UI/system/components/justep/row/row" class="x-row"
          xid="row28"> 
          <div class="x-col" xid="col25"> 
            <span xid="span47">内容4</span>
          </div> 
        </div> 
      </div> 
    </div>  
    <a component="$UI/system/components/justep/button/button" class="btn btn-link"
      label="改变索引" xid="checkBtn" onClick="checkBtnClick"> 
      <i xid="i16"/>  
      <span xid="span51">改变索引</span>
    </a>  
    <div component="$UI/system/components/justep/row/row" class="x-row" xid="row17"> 
      <div class="x-col" xid="col2"> 
        <span xid="span5"><![CDATA[禁用部分选项卡：]]></span>
      </div> 
    </div>  
    <div component="$UI/system/components/justep/button/buttonGroup" class="btn-group x-card x-tuniu"
      tabbed="true" xid="buttonGroup3" selected="button5" style="width:100%;"> 
      <div component="$UI/system/components/justep/row/row" class="x-row" xid="row40"> 
        <div class="x-col x-col-25" xid="col78"> 
          <hr xid="hr21" style="border-style:solid solid solid solid;border-width:5px 5px 5px 5px;border-color:#C0C0C0 #C0C0C0 #C0C0C0 #C0C0C0;width:100%;"
            class="pull-left"/>
        </div>  
        <div class="x-col x-col-fixed" xid="col77" style="width:auto;"> 
          <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-top pull-left"
            label="导航栏目1" xid="button5" icon="icon-ionic" style="width:22px;" target="content1"> 
            <i xid="i5" class="icon-ionic"/>  
            <span xid="span53">导航栏目1</span>
          </a>
        </div>  
        <div class="x-col" xid="col84"> 
          <hr xid="hr20" style="border-style:solid solid solid solid;border-width:5px 5px 5px 5px;border-color:#C0C0C0 #C0C0C0 #C0C0C0 #C0C0C0;width:100%;"
            class="pull-left"/>
        </div>  
        <div class="x-col x-col-fixed" xid="col81" style="width:auto;"> 
          <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-top"
            label="导航栏目2" xid="button11" icon="icon-ionic" style="width:15px;" target="content11"> 
            <i xid="i18" class="icon-ionic"/>  
            <span xid="span45">导航栏目2</span>
          </a>
        </div>  
        <div class="x-col" xid="col82"> 
          <hr xid="hr10" style="border-style:solid solid solid solid;border-width:5px 5px 5px 5px;border-color:#C0C0C0 #C0C0C0 #C0C0C0 #C0C0C0;width:100%;"
            class="pull-left"/>
        </div>  
        <div class="x-col x-col-fixed" xid="col80" style="width:auto;"> 
          <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-top"
            label="导航栏目3" xid="button12" icon="icon-ionic" style="width:20px;" target="content12"
            bind-disable=" $model.statusData.val(&quot;status&quot;)==0"> 
            <i xid="i12" class="icon-ionic"/>  
            <span xid="span26">导航栏目3</span>
          </a>
        </div>  
        <div class="x-col" xid="col83"> 
          <hr xid="hr19" style="border-style:solid solid solid solid;border-width:5px 5px 5px 5px;border-color:#C0C0C0 #C0C0C0 #C0C0C0 #C0C0C0;width:100%;"
            class="pull-left"/>
        </div>  
        <div class="x-col x-col-fixed" xid="col79" style="width:auto;"> 
          <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-top"
            label="导航栏目4" xid="button13" icon="icon-ionic" style="width:21px;" target="content13"
            disabled="true"> 
            <i xid="i17" class="icon-ionic"/>  
            <span xid="span42">导航栏目4</span>
          </a>
        </div>  
        <div class="x-col x-col-25" xid="col76"> 
          <hr xid="hr16" style="border-style:solid solid solid solid;border-width:5px 5px 5px 5px;border-color:#C0C0C0 #C0C0C0 #C0C0C0 #C0C0C0;width:100%;"
            class="pull-left"/>
        </div> 
      </div> 
    </div>  
    <div component="$UI/system/components/justep/contents/contents" class="x-contents"
      active="0" xid="contents1" style="height:150px;"> 
      <div class="x-contents-content" xid="content1" style="height:150px;"> 
        <div component="$UI/system/components/justep/row/row" class="x-row"
          xid="row20"> 
          <div class="x-col" xid="col36"> 
            <span xid="span21">内容1</span>
          </div> 
        </div>  
        <div component="$UI/system/components/justep/row/row" class="x-row"
          xid="row36"> 
          <div class="x-col" xid="col16"> 
            <span xid="span57">内容1</span>
          </div> 
        </div> 
      </div>  
      <div class="x-contents-content" xid="content11" style="height:150px;"> 
        <div component="$UI/system/components/justep/row/row" class="x-row"
          xid="row21"> 
          <div class="x-col" xid="col28"> 
            <span xid="span52">内容2</span>
          </div> 
        </div>  
        <div component="$UI/system/components/justep/row/row" class="x-row"
          xid="row24"> 
          <div class="x-col" xid="col17"> 
            <span xid="span56">内容2</span>
          </div> 
        </div> 
      </div>  
      <div class="x-contents-content" xid="content12" style="height:150px;"> 
        <div component="$UI/system/components/justep/row/row" class="x-row"
          xid="row35"> 
          <div class="x-col" xid="col5"> 
            <span xid="span49">内容3</span>
          </div> 
        </div>  
        <div component="$UI/system/components/justep/row/row" class="x-row"
          xid="row33"> 
          <div class="x-col" xid="col27"> 
            <span xid="span25">内容3</span>
          </div> 
        </div> 
      </div>  
      <div class="x-contents-content" xid="content13" style="height:150px;"> 
        <div component="$UI/system/components/justep/row/row" class="x-row"
          xid="row32"> 
          <div class="x-col" xid="col3"> 
            <span xid="span54">内容4</span>
          </div> 
        </div>  
        <div component="$UI/system/components/justep/row/row" class="x-row"
          xid="row34"> 
          <div class="x-col" xid="col6"> 
            <span xid="span55">内容4</span>
          </div> 
        </div> 
      </div> 
    </div>  
    <a component="$UI/system/components/justep/button/button" class="btn btn-link"
      label="启用&quot;步骤3&quot;" xid="startUsingBtn" onClick="startUsingBtnClick"> 
      <i xid="i19"/>  
      <span xid="span58">启用"步骤3"</span>
    </a>  
    <a component="$UI/system/components/justep/button/button" class="btn btn-link"
      label="禁用&quot;步骤3&quot;" xid="forbiddenBtn" onClick="forbiddenBtnClick"> 
      <i xid="i20"/>  
      <span xid="span59">禁用"步骤3"</span>
    </a> 
  </div>
  <div component="$UI/system/components/justep/controlGroup/controlGroup" class="x-control-group"
    title="4、iframe模式-基本使用" xid="controlGroup4" style="height:341px;"> 
    <div class="x-control-group-title" xid="controlGroupTitle4"> 
      <span xid="span68">title</span>
    </div>  
    <div component="$UI/system/components/justep/button/buttonGroup" class="btn-group x-card x-tuniu"
      tabbed="true" xid="buttonGroup4" style="width:100%;"> 
      <div component="$UI/system/components/justep/row/row" class="x-row" xid="row41"> 
        <div class="x-col x-col-33" xid="col85">
          <hr xid="hr32" style="border-style:solid solid solid solid;border-width:5px 5px 5px 5px;border-color:#C0C0C0 #C0C0C0 #C0C0C0 #C0C0C0;width:100%;"
            class="pull-left"/>
        </div>  
        <div class="x-col x-col-fixed" xid="col86" style="width:auto;">
          <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-top pull-left"
            label="导航栏目1" xid="button27" icon="icon-ionic" style="width:22px;" target="content21"> 
            <i xid="i26" class="icon-ionic"/>  
            <span xid="span78">导航栏目1</span>
          </a>
        </div>  
        <div class="x-col" xid="col87">
          <hr xid="hr31" style="border-style:solid solid solid solid;border-width:5px 5px 5px 5px;border-color:#C0C0C0 #C0C0C0 #C0C0C0 #C0C0C0;width:100%;"
            class="pull-left"/>
        </div>  
        <div class="x-col x-col-fixed" xid="col88" style="width:auto;">
          <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-top"
            label="导航栏目2" xid="button25" icon="icon-ionic" style="width:15px;" target="content22"> 
            <i xid="i25" class="icon-ionic"/>  
            <span xid="span86">导航栏目2</span>
          </a>
        </div>  
        <div class="x-col x-col-33" xid="col97">
          <hr xid="hr23" style="border-style:solid solid solid solid;border-width:5px 5px 5px 5px;border-color:#C0C0C0 #C0C0C0 #C0C0C0 #C0C0C0;width:100%;"
            class="pull-left"/>
        </div>
      </div> 
    </div>  
    <div component="$UI/system/components/justep/contents/contents" class="x-contents"
      active="0" xid="contents5" style="height:169px;"> 
      <div class="x-contents-content" xid="content21" style="height:150px;"> 
        <iframe src="./iframe/iframe1.w" xid="iframe1" frameborder="0px"/>
      </div>  
      <div class="x-contents-content" xid="content22" style="height:150px;"> 
        <iframe src="./iframe/iframe2.w" xid="iframe2" frameborder="0px"/>
      </div> 
    </div> 
  </div>
  <div component="$UI/system/components/justep/controlGroup/controlGroup" class="x-control-group"
    title="5、iframe模式-设定初始选中索引" xid="controlGroup5" style="height:341px;"> 
    <div class="x-control-group-title" xid="controlGroupTitle5"> 
      <span xid="span70">title</span>
    </div>  
    <div component="$UI/system/components/justep/button/buttonGroup" class="btn-group x-card x-tuniu"
      tabbed="true" xid="buttonGroup5" selected="button21" style="width:100%;"> 
      <div component="$UI/system/components/justep/row/row" class="x-row" xid="row42"> 
        <div class="x-col x-col-33" xid="col98"> 
          <hr xid="hr29" style="border-style:solid solid solid solid;border-width:5px 5px 5px 5px;border-color:#C0C0C0 #C0C0C0 #C0C0C0 #C0C0C0;width:100%;"
            class="pull-left"/>
        </div>  
        <div class="x-col x-col-fixed" xid="col100" style="width:auto;"> 
          <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-top pull-left"
            label="导航栏目1" xid="button21" icon="icon-ionic" style="width:22px;" target="content16"> 
            <i xid="i21" class="icon-ionic"/>  
            <span xid="span81">导航栏目1</span>
          </a>
        </div>  
        <div class="x-col" xid="col99"> 
          <hr xid="hr30" style="border-style:solid solid solid solid;border-width:5px 5px 5px 5px;border-color:#C0C0C0 #C0C0C0 #C0C0C0 #C0C0C0;width:100%;"
            class="pull-left"/>
        </div>  
        <div class="x-col x-col-fixed" xid="col101" style="width:auto;"> 
          <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-top"
            label="导航栏目2" xid="button22" icon="icon-ionic" style="width:15px;" target="content17"> 
            <i xid="i22" class="icon-ionic"/>  
            <span xid="span80">导航栏目2</span>
          </a>
        </div>  
        <div class="x-col x-col-33" xid="col102"> 
          <hr xid="hr25" style="border-style:solid solid solid solid;border-width:5px 5px 5px 5px;border-color:#C0C0C0 #C0C0C0 #C0C0C0 #C0C0C0;width:100%;"
            class="pull-left"/>
        </div> 
      </div> 
    </div>  
    <div component="$UI/system/components/justep/contents/contents" class="x-contents"
      active="0" xid="contents4" style="height:173px;"> 
      <div class="x-contents-content" xid="content16" style="height:150px;"> 
        <iframe src="./iframe/iframe1.w" xid="iframe3" frameborder="0px"/>
      </div>  
      <div class="x-contents-content" xid="content17" style="height:150px;"> 
        <iframe src="./iframe/iframe2.w" xid="iframe4" frameborder="0px"/>
      </div> 
    </div> 
  </div>  
  <div component="$UI/system/components/justep/controlGroup/controlGroup" class="x-control-group"
    title="6、iframe模式-禁止点击并由外部控制索引" xid="controlGroup6" style="height:714px;"> 
    <div class="x-control-group-title" xid="controlGroupTitle6"> 
      <span xid="span113">title</span>
    </div>  
    <div component="$UI/system/components/justep/row/row" class="x-row" xid="row72"> 
      <div class="x-col" xid="col70"> 
        <span xid="span96">禁用全部选项卡：</span>
      </div> 
    </div>  
    <div component="$UI/system/components/justep/button/buttonGroup" class="btn-group x-card x-tuniu"
      tabbed="true" xid="iframeOptionBtnGroup" selected="button34" style="width:100%;"> 
      <div component="$UI/system/components/justep/row/row" class="x-row" xid="row43"> 
        <div class="x-col x-col-33" xid="col103"> 
          <hr xid="hr41" style="border-style:solid solid solid solid;border-width:5px 5px 5px 5px;border-color:#C0C0C0 #C0C0C0 #C0C0C0 #C0C0C0;width:100%;"
            class="pull-left"/>
        </div>  
        <div class="x-col x-col-fixed" xid="col105" style="width:auto;"> 
          <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-top pull-left"
            label="导航栏目1" xid="button34" icon="icon-ionic" style="width:22px;" target="iframePage34"
            disabled="true"> 
            <i xid="i34" class="icon-ionic"/>  
            <span xid="span103">导航栏目1</span>
          </a>
        </div>  
        <div class="x-col" xid="col104"> 
          <hr xid="hr40" style="border-style:solid solid solid solid;border-width:5px 5px 5px 5px;border-color:#C0C0C0 #C0C0C0 #C0C0C0 #C0C0C0;width:100%;"
            class="pull-left"/>
        </div>  
        <div class="x-col x-col-fixed" xid="col106" style="width:auto;"> 
          <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-top"
            label="导航栏目2" xid="button35" icon="icon-ionic" style="width:15px;" target="iframePage35"
            disabled="true"> 
            <i xid="i40" class="icon-ionic"/>  
            <span xid="span115">导航栏目2</span>
          </a>
        </div>  
        <div class="x-col " xid="col107"> 
          <hr xid="hr36" style="border-style:solid solid solid solid;border-width:5px 5px 5px 5px;border-color:#C0C0C0 #C0C0C0 #C0C0C0 #C0C0C0;width:100%;"
            class="pull-left"/>
        </div>  
        <div class="x-col x-col-fixed" xid="col108" style="width:auto;">
          <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-top"
            label="导航栏目3" xid="button36" icon="icon-ionic" style="width:15px;" target="iframePage36"
            disabled="true"> 
            <i xid="i35" class="icon-ionic"/>  
            <span xid="span111">导航栏目3</span>
          </a>
        </div>  
        <div class="x-col x-col-33" xid="col109">
          <hr xid="hr37" style="border-style:solid solid solid solid;border-width:5px 5px 5px 5px;border-color:#C0C0C0 #C0C0C0 #C0C0C0 #C0C0C0;width:100%;"
            class="pull-left"/>
        </div>
      </div> 
    </div>  
    <div component="$UI/system/components/justep/contents/contents" class="x-contents"
      active="0" xid="iframePages" style="height:166px;"> 
      <div class="x-contents-content" xid="iframePage34" style="height:150px;"> 
        <iframe src="./iframe/iframe1.w" xid="iframe5" frameborder="0px"/>
      </div>  
      <div class="x-contents-content" xid="iframePage35" style="height:150px;"> 
        <iframe src="./iframe/iframe2.w" xid="iframe6" frameborder="0px"/>
      </div>  
      <div class="x-contents-content" xid="iframePage36" style="height:150px;"> 
        <iframe src="./iframe/iframe3.w" xid="iframe7" frameborder="0px"/>
      </div> 
    </div>
    <a component="$UI/system/components/justep/button/button" class="btn btn-link"
      label="改变索引" xid="iframeCheckBtn" onClick="iframeCheckBtnClick"> 
      <i xid="i36"/>  
      <span xid="span97">改变索引</span>
    </a>  
    <div component="$UI/system/components/justep/row/row" class="x-row" xid="row55"> 
      <div class="x-col" xid="col60"> 
        <span xid="span114">禁用部分选项卡：</span>
      </div> 
    </div>  
    <div component="$UI/system/components/justep/button/buttonGroup" class="btn-group x-card x-tuniu"
      tabbed="true" xid="buttonGroup6" selected="button39" style="width:100%;"> 
      <div component="$UI/system/components/justep/row/row" class="x-row" xid="row50"> 
        <div class="x-col x-col-33" xid="col110"> 
          <hr xid="hr33" style="border-style:solid solid solid solid;border-width:5px 5px 5px 5px;border-color:#C0C0C0 #C0C0C0 #C0C0C0 #C0C0C0;width:100%;"
            class="pull-left"/>
        </div>  
        <div class="x-col x-col-fixed" xid="col112" style="width:auto;"> 
          <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-top pull-left"
            label="导航栏目1" xid="button39" icon="icon-ionic" style="width:22px;" target="content30"> 
            <i xid="i30" class="icon-ionic"/>  
            <span xid="span89">导航栏目1</span>
          </a>
        </div>  
        <div class="x-col" xid="col111"> 
          <hr xid="hr34" style="border-style:solid solid solid solid;border-width:5px 5px 5px 5px;border-color:#C0C0C0 #C0C0C0 #C0C0C0 #C0C0C0;width:100%;"
            class="pull-left"/>
        </div>  
        <div class="x-col x-col-fixed" xid="col113" style="width:auto;"> 
          <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-top"
            label="导航栏目2" xid="button31" icon="icon-ionic" style="width:15px;" target="content29"> 
            <i xid="i33" class="icon-ionic"/>  
            <span xid="span100">导航栏目2</span>
          </a>
        </div>  
        <div class="x-col " xid="col114"> 
          <hr xid="hr35" style="border-style:solid solid solid solid;border-width:5px 5px 5px 5px;border-color:#C0C0C0 #C0C0C0 #C0C0C0 #C0C0C0;width:100%;"
            class="pull-left"/>
        </div>  
        <div class="x-col x-col-fixed" xid="col115" style="width:auto;"> 
          <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-top"
            label="导航栏目3" xid="button32" icon="icon-ionic" style="width:20px;" target="content27"
            bind-disable=" $model.iframeStatusData.val(&quot;status&quot;)==0" disabled="false"> 
            <i xid="i39" class="icon-ionic"/>  
            <span xid="span116">导航栏目3</span>
          </a>
        </div>  
        <div class="x-col x-col-33" xid="col116" style="width:100%;"> 
          <hr xid="hr38" style="border-style:solid solid solid solid;border-width:5px 5px 5px 5px;border-color:#C0C0C0 #C0C0C0 #C0C0C0 #C0C0C0;width:100%;"
            class="pull-left"/>
        </div> 
      </div> 
    </div>  
    <div component="$UI/system/components/justep/contents/contents" class="x-contents"
      active="0" xid="contents7" style="height:167px;"> 
      <div class="x-contents-content" xid="content30" style="height:150px;"> 
        <iframe src="./iframe/iframe1.w" xid="iframe8" frameborder="0px"/>
      </div>  
      <div class="x-contents-content" xid="content29" style="height:150px;"> 
        <iframe src="./iframe/iframe2.w" xid="iframe9" frameborder="0px"/>
      </div>  
      <div class="x-contents-content" xid="content27" style="height:150px;"> 
        <iframe src="./iframe/iframe3.w" xid="iframe10" frameborder="0px"/>
      </div> 
    </div>  
    <a component="$UI/system/components/justep/button/button" class="btn btn-link"
      label="启用&quot;步骤3&quot;" xid="iframeStartUsingBtn" onClick="iframeStartUsingBtnClick"> 
      <i xid="i32"/>  
      <span xid="span94">启用"步骤3"</span>
    </a>  
    <a component="$UI/system/components/justep/button/button" class="btn btn-link"
      label="禁用&quot;步骤3&quot;" xid="iframeforbiddenBtn" onClick="iframeforbiddenBtnClick"> 
      <i xid="i31"/>  
      <span xid="span95">禁用"步骤3"</span>
    </a> 
  </div>  
  <div component="$UI/system/components/justep/controlGroup/controlGroup" class="x-control-group"
    title="7、iframe模式-切换标签式出现进度条" xid="controlGroup7" style="height:341px;"> 
    <div class="x-control-group-title" xid="controlGroupTitle7"> 
      <span xid="span129">title</span>
    </div>  
    <div component="$UI/system/components/justep/button/buttonGroup" class="btn-group x-card x-tuniu"
      tabbed="true" xid="buttonGroup8" style="width:100%;"> 
      <div component="$UI/system/components/justep/row/row" class="x-row" xid="row51"> 
        <div class="x-col x-col-33" xid="col154"> 
          <hr xid="hr44" style="border-style:solid solid solid solid;border-width:5px 5px 5px 5px;border-color:#C0C0C0 #C0C0C0 #C0C0C0 #C0C0C0;width:100%;"
            class="pull-left"/>
        </div>  
        <div class="x-col x-col-fixed" xid="col151" style="width:auto;"> 
          <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-top pull-left"
            label="导航栏目1" xid="progressBtn1" icon="icon-ionic" style="width:22px;"
            target="content37" onClick="progressBtn1Click"> 
            <i xid="i42" class="icon-ionic"/>  
            <span xid="span128">导航栏目1</span>
          </a>
        </div>  
        <div class="x-col" xid="col150"> 
          <hr xid="hr45" style="border-style:solid solid solid solid;border-width:5px 5px 5px 5px;border-color:#C0C0C0 #C0C0C0 #C0C0C0 #C0C0C0;width:100%;"
            class="pull-left"/>
        </div>  
        <div class="x-col x-col-fixed" xid="col152" style="width:auto;"> 
          <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-top"
            label="导航栏目2" xid="progressBtn2" icon="icon-ionic" style="width:15px;"
            target="content38" onClick="progressBtn2Click"> 
            <i xid="i41" class="icon-ionic"/>  
            <span xid="span127">导航栏目2</span>
          </a>
        </div>  
        <div class="x-col x-col-33" xid="col153"> 
          <hr xid="hr43" style="border-style:solid solid solid solid;border-width:5px 5px 5px 5px;border-color:#C0C0C0 #C0C0C0 #C0C0C0 #C0C0C0;width:100%;"
            class="pull-left"/>
        </div> 
      </div> 
    </div>  
    <div component="$UI/system/components/justep/contents/contents" class="x-contents"
      active="0" xid="contents9" style="height:169px;"> 
      <div class="x-contents-content" xid="content37" style="height:150px;"> 
        <iframe src="./iframe/iframe1.w" xid="iframe12" frameborder="0px"/>
      </div>  
      <div class="x-contents-content" xid="content38" style="height:150px;"> 
        <iframe src="./iframe/iframe2.w" xid="iframe11" frameborder="0px"/>
      </div> 
    </div> 
  </div>
  <div component="$UI/system/components/justep/controlGroup/controlGroup" class="x-control-group"
    title="8、选项卡点击事件" xid="controlGroup8" style="height:341px;"> 
    <div class="x-control-group-title" xid="controlGroupTitle8"> 
      <span xid="span132">title</span>
    </div>  
    <div component="$UI/system/components/justep/button/buttonGroup" class="btn-group x-card x-tuniu"
      tabbed="true" xid="buttonGroup9" style="width:100%;"> 
      <div component="$UI/system/components/justep/row/row" class="x-row" xid="row60"> 
        <div class="x-col x-col-33" xid="col208"> 
          <hr xid="hr47" style="border-style:solid solid solid solid;border-width:5px 5px 5px 5px;border-color:#C0C0C0 #C0C0C0 #C0C0C0 #C0C0C0;width:100%;"
            class="pull-left"/>
        </div>  
        <div class="x-col x-col-fixed" xid="col210" style="width:auto;"> 
          <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-top pull-left"
            label="导航栏目1" xid="optionEventBtn1" icon="icon-ionic" style="width:22px;"
            target="content39" onClick="optionEventBtn1Click"> 
            <i xid="i45" class="icon-ionic"/>  
            <span xid="span131">导航栏目1</span>
          </a>
        </div>  
        <div class="x-col" xid="col209"> 
          <hr xid="hr48" style="border-style:solid solid solid solid;border-width:5px 5px 5px 5px;border-color:#C0C0C0 #C0C0C0 #C0C0C0 #C0C0C0;width:100%;"
            class="pull-left"/>
        </div>  
        <div class="x-col x-col-fixed" xid="col211" style="width:auto;"> 
          <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-top"
            label="导航栏目2" xid="optionEventBtn2" icon="icon-ionic" style="width:15px;"
            target="content40" onClick="optionEventBtn2Click"> 
            <i xid="i44" class="icon-ionic"/>  
            <span xid="span130">导航栏目2</span>
          </a>
        </div>  
        <div class="x-col x-col-33" xid="col212"> 
          <hr xid="hr46" style="border-style:solid solid solid solid;border-width:5px 5px 5px 5px;border-color:#C0C0C0 #C0C0C0 #C0C0C0 #C0C0C0;width:100%;"
            class="pull-left"/>
        </div> 
      </div> 
    </div>  
    <div component="$UI/system/components/justep/contents/contents" class="x-contents"
      active="0" xid="contents10" style="height:169px;"> 
      <div class="x-contents-content" xid="content39" style="height:150px;"> 
        <iframe src="./iframe/iframe1.w" xid="iframe14" frameborder="0px"/>
      </div>  
      <div class="x-contents-content" xid="content40" style="height:150px;"> 
        <iframe src="./iframe/iframe2.w" xid="iframe13" frameborder="0px"/>
      </div> 
    </div> 
  </div>
  <div component="$UI/system/components/justep/controlGroup/controlGroup" class="x-control-group"
    title="9、获取当前选中索引" xid="controlGroup9" style="height:406px;"> 
    <div class="x-control-group-title" xid="controlGroupTitle9"> 
      <span xid="span135">title</span>
    </div>  
    <div component="$UI/system/components/justep/button/buttonGroup" class="btn-group x-card x-tuniu"
      tabbed="true" xid="optionsGroup" style="width:100%;" selected="optionsOne"> 
      <div component="$UI/system/components/justep/row/row" class="x-row" xid="row52"> 
        <div class="x-col x-col-33" xid="col159"> 
          <hr xid="hr50" style="border-style:solid solid solid solid;border-width:5px 5px 5px 5px;border-color:#C0C0C0 #C0C0C0 #C0C0C0 #C0C0C0;width:100%;"
            class="pull-left"/>
        </div>  
        <div class="x-col x-col-fixed" xid="col156" style="width:auto;"> 
          <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-top pull-left"
            label="导航栏目1" icon="icon-ionic" style="width:22px;" target="content41"
            xid="optionsOne" onClick="optionsOneClick"> 
            <i xid="i47" class="icon-ionic"/>  
            <span xid="span134">导航栏目1</span>
          </a>
        </div>  
        <div class="x-col" xid="col155"> 
          <hr xid="hr51" style="border-style:solid solid solid solid;border-width:5px 5px 5px 5px;border-color:#C0C0C0 #C0C0C0 #C0C0C0 #C0C0C0;width:100%;"
            class="pull-left"/>
        </div>  
        <div class="x-col x-col-fixed" xid="col157" style="width:auto;"> 
          <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-top"
            label="导航栏目2" xid="optionsTwo" icon="icon-ionic" style="width:15px;" target="content42"
            onClick="optionsTwoClick"> 
            <i xid="i46" class="icon-ionic"/>  
            <span xid="span133">导航栏目2</span>
          </a>
        </div>  
        <div class="x-col x-col-33" xid="col158"> 
          <hr xid="hr49" style="border-style:solid solid solid solid;border-width:5px 5px 5px 5px;border-color:#C0C0C0 #C0C0C0 #C0C0C0 #C0C0C0;width:100%;"
            class="pull-left"/>
        </div> 
      </div> 
    </div>  
    <div component="$UI/system/components/justep/contents/contents" class="x-contents"
      active="0" xid="contents11" style="height:169px;"> 
      <div class="x-contents-content" xid="content41" style="height:150px;"> 
        <iframe src="./iframe/iframe1.w" xid="iframe16" frameborder="0px"/>
      </div>  
      <div class="x-contents-content" xid="content42" style="height:150px;"> 
        <iframe src="./iframe/iframe2.w" xid="iframe15" frameborder="0px"/>
      </div> 
    </div>  
    <a component="$UI/system/components/justep/button/button" class="btn btn-link"
      label="获取当前索引值" xid="getIndexBtn" onClick="getIndexBtnClick"> 
      <i xid="i48"/>  
      <span xid="span136">获取当前索引值</span>
    </a> 
  </div>
  <div component="$UI/system/components/justep/controlGroup/controlGroup" class="x-control-group"
    title="10、鼠标移入切换标签" xid="controlGroup10" style="height:341px;"> 
    <div class="x-control-group-title" xid="controlGroupTitle11"> 
      <span xid="span162">title</span>
    </div>  
    <div component="$UI/system/components/justep/button/buttonGroup" class="btn-group x-card x-tuniu"
      tabbed="true" xid="programGroup" style="width:100%;"> 
      <div component="$UI/system/components/justep/row/row" class="x-row" xid="row53"> 
        <div class="x-col x-col-25" xid="col161"> 
          <hr xid="hr61" style="border-style:solid solid solid solid;border-width:5px 5px 5px 5px;border-color:#C0C0C0 #C0C0C0 #C0C0C0 #C0C0C0;width:100%;"
            class="pull-left"/>
        </div>  
        <div class="x-col x-col-fixed" xid="col160" style="width:auto;"> 
          <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-top pull-left"
            label="导航栏目1" xid="programBtnone" icon="icon-ionic" style="width:22px;"
            target="programPageone" bind-mouseover="programBtnoneMouseover"> 
            <i xid="i65" class="icon-ionic"/>  
            <span xid="span170">导航栏目1</span>
          </a>
        </div>  
        <div class="x-col" xid="col167"> 
          <hr xid="hr60" style="border-style:solid solid solid solid;border-width:5px 5px 5px 5px;border-color:#C0C0C0 #C0C0C0 #C0C0C0 #C0C0C0;width:100%;"
            class="pull-left"/>
        </div>  
        <div class="x-col x-col-fixed" xid="col163" style="width:auto;"> 
          <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-top"
            label="导航栏目2" xid="programBtntwo" icon="icon-ionic" style="width:15px;"
            target="programPagetwo" bind-mouseover="programBtntwoMouseover"> 
            <i xid="i64" class="icon-ionic"/>  
            <span xid="span171">导航栏目2</span>
          </a>
        </div>  
        <div class="x-col" xid="col166"> 
          <hr xid="hr58" style="border-style:solid solid solid solid;border-width:5px 5px 5px 5px;border-color:#C0C0C0 #C0C0C0 #C0C0C0 #C0C0C0;width:100%;"
            class="pull-left"/>
        </div>  
        <div class="x-col x-col-fixed" xid="col164" style="width:auto;"> 
          <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-top"
            label="导航栏目3" xid="programBtnthree" icon="icon-ionic" style="width:20px;"
            target="programPagethree" bind-mouseover="programBtnthreeMouseover"> 
            <i xid="i66" class="icon-ionic"/>  
            <span xid="span160">导航栏目3</span>
          </a>
        </div>  
        <div class="x-col" xid="col165"> 
          <hr xid="hr59" style="border-style:solid solid solid solid;border-width:5px 5px 5px 5px;border-color:#C0C0C0 #C0C0C0 #C0C0C0 #C0C0C0;width:100%;"
            class="pull-left"/>
        </div>  
        <div class="x-col x-col-fixed" xid="col162" style="width:auto;"> 
          <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-top"
            label="导航栏目4" xid="programBtnfour" icon="icon-ionic" style="width:21px;"
            target="programPagefour" bind-mouseover="programBtnfourMouseover"> 
            <i xid="i63" class="icon-ionic"/>  
            <span xid="span161">导航栏目4</span>
          </a>
        </div>  
        <div class="x-col x-col-25" xid="col168"> 
          <hr xid="hr57" style="border-style:solid solid solid solid;border-width:5px 5px 5px 5px;border-color:#C0C0C0 #C0C0C0 #C0C0C0 #C0C0C0;width:100%;"
            class="pull-left"/>
        </div> 
      </div> 
    </div>  
    <div component="$UI/system/components/justep/contents/contents" class="x-contents"
      active="0" xid="programPages" style="height:150px;"> 
      <div class="x-contents-content" xid="programPageone" style="height:150px;"> 
        <div component="$UI/system/components/justep/row/row" class="x-row"
          xid="row89"> 
          <div class="x-col" xid="col95"> 
            <span xid="span163">内容1</span>
          </div> 
        </div>  
        <div component="$UI/system/components/justep/row/row" class="x-row"
          xid="row94"> 
          <div class="x-col" xid="col92"> 
            <span xid="span165">内容1</span>
          </div> 
        </div> 
      </div>  
      <div class="x-contents-content" xid="programPagetwo" style="height:150px;"> 
        <div component="$UI/system/components/justep/row/row" class="x-row"
          xid="row91"> 
          <div class="x-col" xid="col96"> 
            <span xid="span166">内容2</span>
          </div> 
        </div>  
        <div component="$UI/system/components/justep/row/row" class="x-row"
          xid="row90"> 
          <div class="x-col" xid="col93"> 
            <span xid="span164">内容2</span>
          </div> 
        </div> 
      </div>  
      <div class="x-contents-content" xid="programPagethree" style="height:150px;"> 
        <div component="$UI/system/components/justep/row/row" class="x-row"
          xid="row93"> 
          <div class="x-col" xid="col91"> 
            <span xid="span167">内容3</span>
          </div> 
        </div>  
        <div component="$UI/system/components/justep/row/row" class="x-row"
          xid="row95"> 
          <div class="x-col" xid="col94"> 
            <span xid="span172">内容3</span>
          </div> 
        </div> 
      </div>  
      <div class="x-contents-content" xid="programPagefour" style="height:150px;"> 
        <div component="$UI/system/components/justep/row/row" class="x-row"
          xid="row96"> 
          <div class="x-col" xid="col90"> 
            <span xid="span168">内容4</span>
          </div> 
        </div>  
        <div component="$UI/system/components/justep/row/row" class="x-row"
          xid="row92"> 
          <div class="x-col" xid="col89"> 
            <span xid="span169">内容4</span>
          </div> 
        </div> 
      </div> 
    </div> 
  </div>  
  <div component="$UI/system/components/justep/controlGroup/controlGroup" class="x-control-group"
    title="11、单内容区域模式" xid="controlGroup11" style="height:341px;"> 
    <div class="x-control-group-title" xid="controlGroupTitle13"> 
      <span xid="span205">title</span>
    </div>  
    <div component="$UI/system/components/justep/button/buttonGroup" class="btn-group x-card x-tuniu"
      tabbed="true" xid="buttonGroup16" selected="button79" style="width:100%;"> 
      <div component="$UI/system/components/justep/row/row" class="x-row" xid="row54"> 
        <div class="x-col x-col-25" xid="col170"> 
          <hr xid="hr76" style="border-style:solid solid solid solid;border-width:5px 5px 5px 5px;border-color:#C0C0C0 #C0C0C0 #C0C0C0 #C0C0C0;width:100%;"
            class="pull-left"/>
        </div>  
        <div class="x-col x-col-fixed" xid="col169" style="width:auto;"> 
          <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-top pull-left"
            label="导航栏目1" xid="button79" icon="icon-ionic" style="width:22px;" target="content61"> 
            <i xid="i80" class="icon-ionic"/>  
            <span xid="span213">导航栏目1</span>
          </a>
        </div>  
        <div class="x-col" xid="col176"> 
          <hr xid="hr75" style="border-style:solid solid solid solid;border-width:5px 5px 5px 5px;border-color:#C0C0C0 #C0C0C0 #C0C0C0 #C0C0C0;width:100%;"
            class="pull-left"/>
        </div>  
        <div class="x-col x-col-fixed" xid="col172" style="width:auto;"> 
          <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-top"
            label="导航栏目2" xid="button78" icon="icon-ionic" style="width:15px;" target="content62"> 
            <i xid="i79" class="icon-ionic"/>  
            <span xid="span214">导航栏目2</span>
          </a>
        </div>  
        <div class="x-col" xid="col175"> 
          <hr xid="hr73" style="border-style:solid solid solid solid;border-width:5px 5px 5px 5px;border-color:#C0C0C0 #C0C0C0 #C0C0C0 #C0C0C0;width:100%;"
            class="pull-left"/>
        </div>  
        <div class="x-col x-col-fixed" xid="col173" style="width:auto;"> 
          <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-top"
            label="导航栏目3" xid="button76" icon="icon-ionic" style="width:20px;" target="content60"> 
            <i xid="i81" class="icon-ionic"/>  
            <span xid="span203">导航栏目3</span>
          </a>
        </div>  
        <div class="x-col x-col-25" xid="col177"> 
          <hr xid="hr72" style="border-style:solid solid solid solid;border-width:5px 5px 5px 5px;border-color:#C0C0C0 #C0C0C0 #C0C0C0 #C0C0C0;width:100%;"
            class="pull-left"/>
        </div> 
      </div> 
    </div>  
    <div component="$UI/system/components/justep/contents/contents" class="x-contents"
      active="0" xid="contents16" style="height:150px;"> 
      <div class="x-contents-content" xid="content61" style="height:150px;"> 
        <div component="$UI/system/components/justep/row/row" class="x-row"
          xid="row115"> 
          <div class="x-col" xid="col121"> 
            <span xid="span206">内容1</span>
          </div> 
        </div>  
        <div component="$UI/system/components/justep/row/row" class="x-row"
          xid="row120"> 
          <div class="x-col" xid="col118"> 
            <span xid="span208">内容1</span>
          </div> 
        </div> 
      </div>  
      <div class="x-contents-content" xid="content62" style="height:150px;"> 
        <div component="$UI/system/components/justep/row/row" class="x-row"
          xid="row117"> 
          <div class="x-col" xid="col122"> 
            <span xid="span209">内容2</span>
          </div> 
        </div>  
        <div component="$UI/system/components/justep/row/row" class="x-row"
          xid="row116"> 
          <div class="x-col" xid="col119"> 
            <span xid="span207">内容2</span>
          </div> 
        </div> 
      </div>  
      <div class="x-contents-content" xid="content60" style="height:150px;"> 
        <div component="$UI/system/components/justep/row/row" class="x-row"
          xid="row119"> 
          <div class="x-col" xid="col117"> 
            <span xid="span210">内容3</span>
          </div> 
        </div>  
        <div component="$UI/system/components/justep/row/row" class="x-row"
          xid="row121"> 
          <div class="x-col" xid="col120"> 
            <span xid="span215">内容3</span>
          </div> 
        </div> 
      </div> 
    </div> 
  </div>
  <div component="$UI/system/components/justep/controlGroup/controlGroup" class="x-control-group"
    title="12、含有标题" xid="controlGroup12" style="height:341px;"> 
    <div class="x-control-group-title" xid="controlGroupTitle14"> 
      <span xid="span217">title</span>
    </div>  
    <div component="$UI/system/components/justep/button/buttonGroup" class="btn-group x-card x-tuniu"
      tabbed="true" xid="buttonGroup17" selected="button80" style="width:100%;"> 
      <div component="$UI/system/components/justep/row/row" class="x-row" xid="row56"> 
        <div class="x-col x-col-10" xid="col178"> 
          <hr xid="hr81" style="border-style:solid solid solid solid;border-width:5px 5px 5px 5px;border-color:#C0C0C0 #C0C0C0 #C0C0C0 #C0C0C0;width:100%;"
            class="pull-left"/>
        </div>  
        <div class="x-col x-col-fixed" xid="col184" style="width:auto;"> 
          <a component="$UI/system/components/justep/button/button" class="btn btn-default"
            label="信息录入" xid="button84"> 
            <i xid="i86"/>  
            <span xid="span227">信息录入</span>
          </a>
        </div>  
        <div class="x-col" xid="col182"> 
          <hr xid="hr78" style="border-style:solid solid solid solid;border-width:5px 5px 5px 5px;border-color:#C0C0C0 #C0C0C0 #C0C0C0 #C0C0C0;width:100%;"
            class="pull-left"/>
        </div>  
        <div class="x-col x-col-fixed" xid="col180" style="width:auto;"> 
          <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-top pull-left"
            label="导航栏目1" xid="button80" icon="icon-ionic" style="width:22px;" target="content64"> 
            <i xid="i82" class="icon-ionic"/>  
            <span xid="span225">导航栏目1</span>
          </a>
        </div>  
        <div class="x-col" xid="col181"> 
          <hr xid="hr77" style="border-style:solid solid solid solid;border-width:5px 5px 5px 5px;border-color:#C0C0C0 #C0C0C0 #C0C0C0 #C0C0C0;width:100%;"
            class="pull-left"/>
        </div>  
        <div class="x-col x-col-fixed" xid="col179" style="width:auto;"> 
          <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-top"
            label="导航栏目2" xid="button81" icon="icon-ionic" style="width:16px;" target="content63"> 
            <i xid="i84" class="icon-ionic"/>  
            <span xid="span224">导航栏目2</span>
          </a>
        </div>  
        <div class="x-col " xid="col183"> 
          <hr xid="hr79" style="border-style:solid solid solid solid;border-width:5px 5px 5px 5px;border-color:#C0C0C0 #C0C0C0 #C0C0C0 #C0C0C0;width:100%;"
            class="pull-left"/>
        </div>  
        <div class="x-col x-col-fixed" xid="col185" style="width:auto;">
          <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-top"
            label="导航栏目3" xid="button82" icon="icon-ionic" style="width:20px;" target="content65"> 
            <i xid="i83" class="icon-ionic"/>  
            <span xid="span216">导航栏目3</span>
          </a>
        </div>  
        <div class="x-col" xid="col186">
          <hr xid="hr80" style="border-style:solid solid solid solid;border-width:5px 5px 5px 5px;border-color:#C0C0C0 #C0C0C0 #C0C0C0 #C0C0C0;width:100%;"
            class="pull-left"/>
        </div>
      </div> 
    </div>  
    <div component="$UI/system/components/justep/contents/contents" class="x-contents"
      active="0" xid="contents17" style="height:150px;"> 
      <div class="x-contents-content" xid="content64" style="height:150px;"> 
        <div component="$UI/system/components/justep/row/row" class="x-row"
          xid="row128"> 
          <div class="x-col" xid="col127"> 
            <span xid="span219">内容1</span>
          </div> 
        </div>  
        <div component="$UI/system/components/justep/row/row" class="x-row"
          xid="row124"> 
          <div class="x-col" xid="col124"> 
            <span xid="span220">内容1</span>
          </div> 
        </div> 
      </div>  
      <div class="x-contents-content" xid="content63" style="height:150px;"> 
        <div component="$UI/system/components/justep/row/row" class="x-row"
          xid="row126"> 
          <div class="x-col" xid="col126"> 
            <span xid="span221">内容2</span>
          </div> 
        </div>  
        <div component="$UI/system/components/justep/row/row" class="x-row"
          xid="row127"> 
          <div class="x-col" xid="col123"> 
            <span xid="span218">内容2</span>
          </div> 
        </div> 
      </div>  
      <div class="x-contents-content" xid="content65" style="height:150px;"> 
        <div component="$UI/system/components/justep/row/row" class="x-row"
          xid="row125"> 
          <div class="x-col" xid="col125"> 
            <span xid="span222">内容3</span>
          </div> 
        </div>  
        <div component="$UI/system/components/justep/row/row" class="x-row"
          xid="row123"> 
          <div class="x-col" xid="col128"> 
            <span xid="span223">内容3</span>
          </div> 
        </div> 
      </div> 
    </div> 
  </div>
  <div component="$UI/system/components/justep/controlGroup/controlGroup" class="x-control-group"
    title="13、标题含有图标" xid="controlGroup13" style="height:341px;"> 
    <div class="x-control-group-title" xid="controlGroupTitle15"> 
      <span xid="span236">title</span>
    </div>  
    <div component="$UI/system/components/justep/button/buttonGroup" class="btn-group x-card x-tuniu"
      tabbed="true" xid="buttonGroup18" selected="button88" style="width:100%;"> 
      <div component="$UI/system/components/justep/row/row" class="x-row" xid="row57"> 
        <div class="x-col x-col-10" xid="col187"> 
          <hr xid="hr85" style="border-style:solid solid solid solid;border-width:5px 5px 5px 5px;border-color:#C0C0C0 #C0C0C0 #C0C0C0 #C0C0C0;width:100%;"
            class="pull-left"/>
        </div>  
        <div class="x-col x-col-fixed" xid="col194" style="width:auto;"> 
          <a component="$UI/system/components/justep/button/button" class="btn btn-default"
            label="信息录入" xid="button86" icon="icon-android-note"> 
            <i xid="i90" class="icon-android-note" style="font-size:medium;color:#FF0080;"/>  
            <span xid="span230" style="color:#FF0080;">信息录入</span>
          </a>
        </div>  
        <div class="x-col" xid="col189"> 
          <hr xid="hr84" style="border-style:solid solid solid solid;border-width:5px 5px 5px 5px;border-color:#C0C0C0 #C0C0C0 #C0C0C0 #C0C0C0;width:100%;"
            class="pull-left"/>
        </div>  
        <div class="x-col x-col-fixed" xid="col191" style="width:auto;"> 
          <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-top pull-left"
            label="导航栏目1" xid="button88" icon="icon-ionic" style="width:22px;" target="content66"> 
            <i xid="i87" class="icon-ionic"/>  
            <span xid="span233">导航栏目1</span>
          </a>
        </div>  
        <div class="x-col" xid="col190"> 
          <hr xid="hr83" style="border-style:solid solid solid solid;border-width:5px 5px 5px 5px;border-color:#C0C0C0 #C0C0C0 #C0C0C0 #C0C0C0;width:100%;"
            class="pull-left"/>
        </div>  
        <div class="x-col x-col-fixed" xid="col188" style="width:auto;"> 
          <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-top"
            label="导航栏目2" xid="button87" icon="icon-ionic" style="width:15px;" target="content67"> 
            <i xid="i89" class="icon-ionic"/>  
            <span xid="span234">导航栏目2</span>
          </a>
        </div>  
        <div class="x-col " xid="col195"> 
          <hr xid="hr82" style="border-style:solid solid solid solid;border-width:5px 5px 5px 5px;border-color:#C0C0C0 #C0C0C0 #C0C0C0 #C0C0C0;width:100%;"
            class="pull-left"/>
        </div>  
        <div class="x-col x-col-fixed" xid="col193" style="width:auto;"> 
          <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-top"
            label="导航栏目3" xid="button85" icon="icon-ionic" style="width:20px;" target="content68"> 
            <i xid="i88" class="icon-ionic"/>  
            <span xid="span237">导航栏目3</span>
          </a>
        </div>  
        <div class="x-col" xid="col192"> 
          <hr xid="hr86" style="border-style:solid solid solid solid;border-width:5px 5px 5px 5px;border-color:#C0C0C0 #C0C0C0 #C0C0C0 #C0C0C0;width:100%;"
            class="pull-left"/>
        </div> 
      </div> 
    </div>  
    <div component="$UI/system/components/justep/contents/contents" class="x-contents"
      active="0" xid="contents18" style="height:150px;"> 
      <div class="x-contents-content" xid="content66" style="height:150px;"> 
        <div component="$UI/system/components/justep/row/row" class="x-row"
          xid="row130"> 
          <div class="x-col" xid="col132"> 
            <span xid="span238">内容1</span>
          </div> 
        </div>  
        <div component="$UI/system/components/justep/row/row" class="x-row"
          xid="row134"> 
          <div class="x-col" xid="col133"> 
            <span xid="span229">内容1</span>
          </div> 
        </div> 
      </div>  
      <div class="x-contents-content" xid="content67" style="height:150px;"> 
        <div component="$UI/system/components/justep/row/row" class="x-row"
          xid="row132"> 
          <div class="x-col" xid="col129"> 
            <span xid="span228">内容2</span>
          </div> 
        </div>  
        <div component="$UI/system/components/justep/row/row" class="x-row"
          xid="row129"> 
          <div class="x-col" xid="col134"> 
            <span xid="span235">内容2</span>
          </div> 
        </div> 
      </div>  
      <div class="x-contents-content" xid="content68" style="height:150px;"> 
        <div component="$UI/system/components/justep/row/row" class="x-row"
          xid="row131"> 
          <div class="x-col" xid="col130"> 
            <span xid="span232">内容3</span>
          </div> 
        </div>  
        <div component="$UI/system/components/justep/row/row" class="x-row"
          xid="row133"> 
          <div class="x-col" xid="col131"> 
            <span xid="span231">内容3</span>
          </div> 
        </div> 
      </div> 
    </div> 
  </div>
  <div component="$UI/system/components/justep/controlGroup/controlGroup" class="x-control-group"
    title="14、与box1合用" xid="controlGroup14" style="height:341px;"> 
    <div class="x-control-group-title" xid="controlGroupTitle16"> 
      <span xid="span240">title</span>
    </div>  
    <div component="$UI/system/components/justep/button/buttonGroup" class="btn-group x-card x-tuniu"
      tabbed="true" xid="buttonGroup19" selected="button92" style="width:100%;"> 
      <div component="$UI/system/components/justep/row/row" class="x-row" xid="row58"> 
        <div class="x-col x-col-10" xid="col196"> 
          <hr xid="hr89" style="border-style:solid solid solid solid;border-width:5px 5px 5px 5px;border-color:#C0C0C0 #C0C0C0 #C0C0C0 #C0C0C0;width:100%;"
            class="pull-left"/>
        </div>  
        <div class="x-col x-col-fixed" xid="col203" style="width:auto;"> 
          <a component="$UI/system/components/justep/button/button" class="btn btn-default"
            label="信息录入" xid="button90" icon="icon-android-note"> 
            <i xid="i94" class="icon-android-note" style="font-size:medium;color:#FF0080;"/>  
            <span xid="span247" style="color:#FF0080;">信息录入</span>
          </a>
        </div>  
        <div class="x-col" xid="col198"> 
          <hr xid="hr90" style="border-style:solid solid solid solid;border-width:5px 5px 5px 5px;border-color:#C0C0C0 #C0C0C0 #C0C0C0 #C0C0C0;width:100%;"
            class="pull-left"/>
        </div>  
        <div class="x-col x-col-fixed" xid="col200" style="width:auto;"> 
          <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-top pull-left"
            label="导航栏目1" xid="button92" icon="icon-ionic" style="width:25px;" target="content69"> 
            <i xid="i91" class="icon-ionic"/>  
            <span xid="span241">导航栏目1</span>
          </a>
        </div>  
        <div class="x-col" xid="col199"> 
          <hr xid="hr87" style="border-style:solid solid solid solid;border-width:5px 5px 5px 5px;border-color:#C0C0C0 #C0C0C0 #C0C0C0 #C0C0C0;width:100%;"
            class="pull-left"/>
        </div>  
        <div class="x-col x-col-fixed" xid="col197" style="width:auto;"> 
          <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-top"
            label="导航栏目2" xid="button91" icon="icon-ionic" style="width:15px;" target="content71"> 
            <i xid="i93" class="icon-ionic"/>  
            <span xid="span242">导航栏目2</span>
          </a>
        </div>  
        <div class="x-col " xid="col204"> 
          <hr xid="hr88" style="border-style:solid solid solid solid;border-width:5px 5px 5px 5px;border-color:#C0C0C0 #C0C0C0 #C0C0C0 #C0C0C0;width:100%;"
            class="pull-left"/>
        </div>  
        <div class="x-col x-col-fixed" xid="col202" style="width:auto;"> 
          <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-top"
            label="导航栏目3" xid="button89" icon="icon-ionic" style="width:20px;" target="content70"> 
            <i xid="i92" class="icon-ionic"/>  
            <span xid="span243">导航栏目3</span>
          </a>
        </div>  
        <div class="x-col" xid="col201"> 
          <hr xid="hr91" style="border-style:solid solid solid solid;border-width:5px 5px 5px 5px;border-color:#C0C0C0 #C0C0C0 #C0C0C0 #C0C0C0;width:240px;"
            class="pull-left"/>
        </div> 
      </div> 
    </div>  
    <div component="$UI/system/components/justep/contents/contents" class="x-contents"
      active="0" xid="contents19" style="border-style:solid solid solid solid;border-width:2px 2px 2px 2px;height:159px;"> 
      <div class="x-contents-content" xid="content69" style="height:150px;"> 
        <div component="$UI/system/components/justep/row/row" class="x-row"
          xid="row135"> 
          <div class="x-col" xid="col138"> 
            <span xid="span244">内容1</span>
          </div> 
        </div>  
        <div component="$UI/system/components/justep/row/row" class="x-row"
          xid="row139"> 
          <div class="x-col" xid="col137"> 
            <span xid="span248">内容1</span>
          </div> 
        </div> 
      </div>  
      <div class="x-contents-content" xid="content71" style="height:150px;"> 
        <div component="$UI/system/components/justep/row/row" class="x-row"
          xid="row137"> 
          <div class="x-col" xid="col135"> 
            <span xid="span249">内容2</span>
          </div> 
        </div>  
        <div component="$UI/system/components/justep/row/row" class="x-row"
          xid="row140"> 
          <div class="x-col" xid="col136"> 
            <span xid="span239">内容2</span>
          </div> 
        </div> 
      </div>  
      <div class="x-contents-content" xid="content70" style="height:150px;"> 
        <div component="$UI/system/components/justep/row/row" class="x-row"
          xid="row136"> 
          <div class="x-col" xid="col139"> 
            <span xid="span246">内容3</span>
          </div> 
        </div>  
        <div component="$UI/system/components/justep/row/row" class="x-row"
          xid="row138"> 
          <div class="x-col" xid="col140"> 
            <span xid="span245">内容3</span>
          </div> 
        </div> 
      </div> 
    </div> 
  </div>
  <div component="$UI/system/components/justep/controlGroup/controlGroup" class="x-control-group"
    title="15、tab过多左右滚动" xid="controlGroup17" style="height:381px;"> 
    <div class="x-control-group-title" xid="controlGroupTitle17"> 
      <span xid="span90">title</span>
    </div>  
    <div component="$UI/system/components/justep/row/row" class="x-row" xid="row49"> 
      <div class="x-col" xid="col51"> 
        <span xid="span63">非iframe模式</span>
      </div> 
    </div>  
    <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-only-icon pull-left"
      label="button" xid="scrollLeftBtn" onClick="scrollLeftBtnClick" icon="icon-chevron-left"> 
      <i xid="i102" class="icon-chevron-left"/>  
      <span xid="span61"/>
    </a>  
    <div xid="div4" style="overflow:auto;overflow-x:hidden;white-space:nowrap;background-color:#fafafa;height:35px;width:300px;"
      class="pull-left x-na" name="aa"> 
      <a component="$UI/system/components/justep/button/button" class="btn btn-link"
        label="选项1" xid="optionBtn1" target="optonContent1"> 
        <i xid="i101"/>  
        <span xid="span258">选项1</span>
      </a>
      <a component="$UI/system/components/justep/button/button" class="btn btn-link"
        label="选项2" xid="optionBtn2" target="optonContent2"> 
        <i xid="i100"/>  
        <span xid="span258">选项2</span>
      </a>
      <a component="$UI/system/components/justep/button/button" class="btn btn-link"
        label="选项3" xid="optionBtn3" target="optonContent3"> 
        <i xid="i99"/>  
        <span xid="span259">选项3</span>
      </a>
      <a component="$UI/system/components/justep/button/button" class="btn btn-link"
        label="选项4" xid="optionBtn4" target="optonContent4"> 
        <i xid="i98"/>  
        <span xid="span255">选项4</span>
      </a>
      <a component="$UI/system/components/justep/button/button" class="btn btn-link"
        label="选项5" xid="optionBtn5" target="optonContent5"> 
        <i xid="i97"/>  
        <span xid="span256">选项5</span>
      </a>
      <a component="$UI/system/components/justep/button/button" class="btn btn-link"
        label="选项6" xid="optionBtn6" target="optonContent6"> 
        <i xid="i96"/>  
        <span xid="span252">选项6</span>
      </a>
      <a component="$UI/system/components/justep/button/button" class="btn btn-link"
        label="选项7" xid="optionBtn7" target="optonContent7"> 
        <i xid="i95"/>  
        <span xid="span253">选项7</span>
      </a>
    </div>  
    <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-only-icon pull-left"
      label="button" xid="scrollRightBtn" onClick="scrollRightBtnClick" icon="icon-chevron-right"> 
      <i xid="i24" class="icon-chevron-right"/>  
      <span xid="span64"/>
    </a>  
    <div component="$UI/system/components/justep/contents/contents" class="x-contents"
      active="20" xid="contents20" style="height:150px;width:100%;"> 
      <div class="x-contents-content" xid="optonContent1"> 
        <div component="$UI/system/components/justep/row/row" class="x-row"
          xid="row149"> 
          <div class="x-col" xid="col144"> 
            <span xid="span265">内容1</span>
          </div> 
        </div>  
        <div component="$UI/system/components/justep/row/row" class="x-row"
          xid="row142"> 
          <div class="x-col" xid="col143"> 
            <span xid="span266">内容1</span>
          </div> 
        </div> 
      </div>  
      <div class="x-contents-content" xid="optonContent2"> 
        <div component="$UI/system/components/justep/row/row" class="x-row"
          xid="row141"> 
          <div class="x-col" xid="col146"> 
            <span xid="span263">内容2</span>
          </div> 
        </div>  
        <div component="$UI/system/components/justep/row/row" class="x-row"
          xid="row146"> 
          <div class="x-col" xid="col141"> 
            <span xid="span264">内容2</span>
          </div> 
        </div> 
      </div>  
      <div class="x-contents-content" xid="optonContent3"> 
        <div component="$UI/system/components/justep/row/row" class="x-row"
          xid="row145"> 
          <div class="x-col" xid="col147"> 
            <span xid="span262">内容3</span>
          </div> 
        </div>  
        <div component="$UI/system/components/justep/row/row" class="x-row"
          xid="row148"> 
          <div class="x-col" xid="col142"> 
            <span xid="span261">内容3</span>
          </div> 
        </div> 
      </div>  
      <div class="x-contents-content" xid="optonContent4"> 
        <div component="$UI/system/components/justep/row/row" class="x-row"
          xid="row147"> 
          <div class="x-col" xid="col149"> 
            <span xid="span260">内容4</span>
          </div> 
        </div>  
        <div component="$UI/system/components/justep/row/row" class="x-row"
          xid="row144"> 
          <div class="x-col" xid="col145"> 
            <span xid="span254">内容4</span>
          </div> 
        </div> 
      </div>  
      <div class="x-contents-content" xid="optonContent5"> 
        <div component="$UI/system/components/justep/row/row" class="x-row"
          xid="row143"> 
          <div class="x-col" xid="col44"> 
            <span xid="span257">内容5</span>
          </div> 
        </div>  
        <div component="$UI/system/components/justep/row/row" class="x-row"
          xid="row44"> 
          <div class="x-col" xid="col148"> 
            <span xid="span251">内容5</span>
          </div> 
        </div> 
      </div>  
      <div class="x-contents-content" xid="optonContent6"> 
        <div component="$UI/system/components/justep/row/row" class="x-row"
          xid="row45"> 
          <div class="x-col" xid="col46"> 
            <span xid="span250">内容6</span>
          </div> 
        </div>  
        <div component="$UI/system/components/justep/row/row" class="x-row"
          xid="row46"> 
          <div class="x-col" xid="col45"> 
            <span xid="span60">内容6</span>
          </div> 
        </div> 
      </div>  
      <div class="x-contents-content" xid="optonContent7"> 
        <div component="$UI/system/components/justep/row/row" class="x-row"
          xid="row47"> 
          <div class="x-col" xid="col48"> 
            <span xid="span67">内容7</span>
          </div> 
        </div>  
        <div component="$UI/system/components/justep/row/row" class="x-row"
          xid="row48"> 
          <div class="x-col" xid="col47"> 
            <span xid="span62">内容7</span>
          </div> 
        </div> 
      </div> 
    </div> 
  </div>
  <div component="$UI/system/components/justep/controlGroup/controlGroup" class="x-control-group"
    title="iframe模式" xid="controlGroup18" style="height:800px;"> 
    <div class="x-control-group-title" xid="controlGroupTitle18"> 
      <span xid="span65">title</span>
    </div>  
    <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-only-icon pull-left"
      label="button" xid="iframeScrollLeftBtn" icon="icon-chevron-left" onClick="iframeScrollLeftBtnClick"> 
      <i xid="i104" class="icon-chevron-left"/>  
      <span xid="span73"/>
    </a>  
    <div name="bb" xid="div5" style="overflow:auto;overflow-x:hidden;white-space:nowrap;background-color:#fafafa;height:35px;width:300px;"
      class="pull-left x-na"> 
      <a component="$UI/system/components/justep/button/button" class="btn btn-link"
        label="选项1" xid="optionBtn8" target="optonContent8"> 
        <i xid="i109"/>  
        <span xid="span71">选项1</span>
      </a>  
      <a component="$UI/system/components/justep/button/button" class="btn btn-link"
        label="选项2" xid="optionBtn9" target="optonContent9"> 
        <i xid="i108"/>  
        <span xid="span71">选项2</span>
      </a>  
      <a component="$UI/system/components/justep/button/button" class="btn btn-link"
        label="选项3" xid="optionBtn10" target="optonContent10"> 
        <i xid="i107"/>  
        <span xid="span72">选项3</span>
      </a>  
      <a component="$UI/system/components/justep/button/button" class="btn btn-link"
        label="选项4" xid="optionBtn11" target="optonContent11"> 
        <i xid="i106"/>  
        <span xid="span69">选项4</span>
      </a>  
      <a component="$UI/system/components/justep/button/button" class="btn btn-link"
        label="选项5" xid="optionBtn12" target="optonContent12"> 
        <i xid="i111"/>  
        <span xid="span267">选项5</span>
      </a>  
      <a component="$UI/system/components/justep/button/button" class="btn btn-link"
        label="选项6" xid="optionBtn13" target="optonContent13"> 
        <i xid="i110"/>  
        <span xid="span66">选项6</span>
      </a>  
      <a component="$UI/system/components/justep/button/button" class="btn btn-link"
        label="选项7" xid="optionBtn14" target="optonContent14"> 
        <i xid="i103"/>  
        <span xid="span268">选项7</span>
      </a> 
    </div>  
    <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-only-icon pull-left"
      label="button" xid="iframeScrollRightBtn" icon="icon-chevron-right" onClick="iframeScrollRightBtnClick"> 
      <i xid="i105" class="icon-chevron-right"/>  
      <span xid="span74"/>
    </a>  
    <div component="$UI/system/components/justep/contents/contents" class="x-contents "
      active="20" xid="contents21" style="width:100%;height:100%;" slidable="true"> 
      <div class="x-contents-content" xid="optonContent8" style="height:100%;width:100%;"> 
        <iframe src="https://www.baidu.com" xid="iframe18" height="100%" width="100%"
          frameborder="0px"/>
      </div>  
      <div class="x-contents-content" xid="optonContent9" style="height:100%;width:100%;"> 
        <iframe src="https://www.baidu.com" xid="iframe17" height="100%" width="100%"
          frameborder="0px"/>
      </div>  
      <div class="x-contents-content" xid="optonContent10"/>  
      <div class="x-contents-content" xid="optonContent11"/>  
      <div class="x-contents-content" xid="optonContent12"/>  
      <div class="x-contents-content" xid="optonContent13"/>  
      <div class="x-contents-content" xid="optonContent14"/>
    </div> 
  </div>
  <div component="$UI/system/components/justep/popOver/popOver" class="x-popOver"
    xid="loadPopOver"> 
    <div class="x-popOver-overlay" xid="div1"/>  
    <div class="x-popOver-content" xid="div2">
      <a component="$UI/system/components/justep/button/button" class="btn btn-link"
        label="正在加载" xid="button42" icon="icon-loading-a"> 
        <i xid="i43" class="icon-loading-a"/>  
        <span xid="span83">正在加载</span>
      </a>
    </div>
  </div>
</div>
