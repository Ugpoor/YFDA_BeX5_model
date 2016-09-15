<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window" component="$UI/system/components/justep/window/window"
  design="device:pc">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:363px;top:2488px;"> 
    <div component="$UI/system/components/justep/data/data" autoLoad="true"
      xid="statusData" idColumn="edit"> 
      <column name="edit" type="String" xid="xid2"/>  
      <data xid="default1">[{"edit":"0"}]</data> 
    </div> 
  </div>  
  <div component="$UI/system/components/justep/controlGroup/controlGroup" class="x-control-group"
    title="1、非iframe模式-基本使用" xid="controlGroup1"> 
    <a component="$UI/system/components/justep/button/button" class="btn btn-link pull-right" label="js" xid="js" onClick="jsClick"> 
          <i xid="i39" />  
          <span xid="span54">js</span>
        </a><a component="$UI/system/components/justep/button/button" class="btn btn-link pull-right" label="源码" xid="source" onClick="sourceClick"> 
          <i xid="i339" />  
          <span xid="span534">源码</span>
        </a><div class="x-control-group-title" xid="controlGroupTitle1"> 
      <span xid="span1">title</span> 
    </div>
    <div xid="div3" style="height:200px;"> 
      <div component="$UI/system/components/justep/panel/panel" class="x-panel x-full"
        xid="panel2" style="top:50px;"> 
        
        
        <div class="x-panel-top" xid="top2"> 
          <div component="$UI/system/components/justep/button/buttonGroup"
            class="btn-group" tabbed="true" xid="buttonGroup2"> 
            <a component="$UI/system/components/justep/button/button" class="btn btn-link text-success"
              label="选项1" xid="page1Btn" target="page1"> 
              <i xid="i5"/>  
              <span xid="span8">选项1</span> 
            </a>  
            <a component="$UI/system/components/justep/button/button" class="btn btn-link"
              label="选项2" xid="page2Btn" target="page2"> 
              <i xid="i6"/>  
              <span xid="span9">选项2</span> 
            </a>  
            <a component="$UI/system/components/justep/button/button" class="btn btn-link"
              label="选项3" xid="page3Btn" target="page3"> 
              <i xid="i7"/>  
              <span xid="span10">选项3</span> 
            </a>  
            <a component="$UI/system/components/justep/button/button" class="btn btn-link"
              label="选项4" xid="page4Btn" target="page4"> 
              <i xid="i8"/>  
              <span xid="span11">选项4</span> 
            </a> 
          </div> 
        </div>  
        <div class="x-panel-content" xid="content6"> 
          <div component="$UI/system/components/justep/contents/contents" class="x-contents x-full"
            active="0" xid="contents2"> 
            <div class="x-contents-content" xid="page1"> 
              <div component="$UI/system/components/justep/row/row" class="x-row"
                xid="row2"> 
                <div class="x-col" xid="col4"> 
                  <span xid="span12">内容1</span> 
                </div> 
              </div>  
              <div component="$UI/system/components/justep/row/row" class="x-row"
                xid="row3"> 
                <div class="x-col" xid="col7"> 
                  <span xid="span13">内容1</span> 
                </div> 
              </div> 
            </div>  
            <div class="x-contents-content" xid="page2"> 
              <div component="$UI/system/components/justep/row/row" class="x-row"
                xid="row4"> 
                <div class="x-col" xid="col10"> 
                  <span xid="span14">内容2</span> 
                </div> 
              </div>  
              <div component="$UI/system/components/justep/row/row" class="x-row"
                xid="row5"> 
                <div class="x-col" xid="col11"> 
                  <span xid="span15">内容2</span> 
                </div> 
              </div> 
            </div>  
            <div class="x-contents-content" xid="page3"> 
              <div component="$UI/system/components/justep/row/row" class="x-row"
                xid="row6"> 
                <div class="x-col" xid="col12"> 
                  <span xid="span16">内容3</span> 
                </div> 
              </div>  
              <div component="$UI/system/components/justep/row/row" class="x-row"
                xid="row7"> 
                <div class="x-col" xid="col13"> 
                  <span xid="span17">内容3</span> 
                </div> 
              </div> 
            </div>  
            <div class="x-contents-content" xid="page4"> 
              <div component="$UI/system/components/justep/row/row" class="x-row"
                xid="row8"> 
                <div class="x-col" xid="col14"> 
                  <span xid="span18">内容4</span> 
                </div> 
              </div>  
              <div component="$UI/system/components/justep/row/row" class="x-row"
                xid="row9"> 
                <div class="x-col" xid="col15"> 
                  <span xid="span19">内容4</span> 
                </div> 
              </div> 
            </div> 
          </div> 
        </div> 
      </div> 
    </div> 
  </div>  
  <div component="$UI/system/components/justep/controlGroup/controlGroup" class="x-control-group"
    title="2、非iframe模式-设定初始选中索引" xid="controlGroup2"> 
    <div class="x-control-group-title" xid="controlGroupTitle3"> 
      <span xid="span32">title</span> 
    </div>  
    <div xid="div4" style="height:200px;"> 
      <div component="$UI/system/components/justep/panel/panel" class="x-panel x-full "
        xid="panel4" style="top:320px;"> 
        <div class="x-panel-top" xid="top4"> 
          <div component="$UI/system/components/justep/button/buttonGroup"
            class="btn-group" tabbed="true" xid="buttonGroup4" selected="pageBtn5"> 
            <a component="$UI/system/components/justep/button/button" class="btn btn-link"
              label="选项1" xid="pageBtn5" target="page5"> 
              <i xid="i13"/>  
              <span xid="span33">选项1</span> 
            </a>  
            <a component="$UI/system/components/justep/button/button" class="btn btn-link"
              label="选项2" xid="pageBtn6" target="page6"> 
              <i xid="i14"/>  
              <span xid="span34">选项2</span> 
            </a>  
            <a component="$UI/system/components/justep/button/button" class="btn btn-link"
              label="选项3" xid="pageBtn7" target="page7"> 
              <i xid="i15"/>  
              <span xid="span35">选项3</span> 
            </a>  
            <a component="$UI/system/components/justep/button/button" class="btn btn-link"
              label="选项4" xid="pageBtn8" target="page8"> 
              <i xid="i16"/>  
              <span xid="span36">选项4</span> 
            </a> 
          </div> 
        </div>  
        <div class="x-panel-content" xid="content16"> 
          <div component="$UI/system/components/justep/contents/contents" class="x-contents x-full"
            active="0" xid="contents4"> 
            <div class="x-contents-content" xid="page5"> 
              <div component="$UI/system/components/justep/row/row" class="x-row"
                xid="row18"> 
                <div class="x-col" xid="col24"> 
                  <span xid="span37">内容1</span> 
                </div> 
              </div>  
              <div component="$UI/system/components/justep/row/row" class="x-row"
                xid="row19"> 
                <div class="x-col" xid="col25"> 
                  <span xid="span38">内容1</span> 
                </div> 
              </div> 
            </div>  
            <div class="x-contents-content" xid="page6"> 
              <div component="$UI/system/components/justep/row/row" class="x-row"
                xid="row20"> 
                <div class="x-col" xid="col26"> 
                  <span xid="span39"><![CDATA[内容2]]></span> 
                </div> 
              </div>  
              <div component="$UI/system/components/justep/row/row" class="x-row"
                xid="row23"> 
                <div class="x-col" xid="col29"> 
                  <span xid="span42"><![CDATA[内容2]]></span> 
                </div> 
              </div> 
            </div>  
            <div class="x-contents-content" xid="page7"> 
              <div component="$UI/system/components/justep/row/row" class="x-row"
                xid="row21"> 
                <div class="x-col" xid="col27"> 
                  <span xid="span40"><![CDATA[内容3]]></span> 
                </div> 
              </div>  
              <div component="$UI/system/components/justep/row/row" class="x-row"
                xid="row24"> 
                <div class="x-col" xid="col30"> 
                  <span xid="span43"><![CDATA[内容3]]></span> 
                </div> 
              </div> 
            </div>  
            <div class="x-contents-content" xid="page8"> 
              <div component="$UI/system/components/justep/row/row" class="x-row"
                xid="row22"> 
                <div class="x-col" xid="col28"> 
                  <span xid="span41"><![CDATA[内容4]]></span> 
                </div> 
              </div>  
              <div component="$UI/system/components/justep/row/row" class="x-row"
                xid="row25"> 
                <div class="x-col" xid="col31"> 
                  <span xid="span44"><![CDATA[内容4]]></span> 
                </div> 
              </div> 
            </div> 
          </div> 
        </div> 
      </div> 
    </div> 
  </div>  
  <div component="$UI/system/components/justep/controlGroup/controlGroup" class="x-control-group"
    title="3、非iframe模式-禁止点击并由外部控制索引" xid="controlGroup3"> 
    <div class="x-control-group-title" xid="controlGroupTitle4"> 
      <span xid="span60">title</span> 
    </div>  
    <div component="$UI/system/components/justep/row/row" class="x-row" xid="row1"> 
      <div class="x-col" xid="col1"> 
        <span xid="span2"><![CDATA[禁用全部选项卡]]> </span> 
      </div> 
    </div>  
    <div component="$UI/system/components/justep/button/buttonGroup" class="btn-group"
      tabbed="true" xid="checkbBtnGroup" selected="pageBtn9"> 
      <a component="$UI/system/components/justep/button/button" class="btn btn-link"
        label="选项1" xid="pageBtn9" target="page9" disabled="true"> 
        <i xid="i24"/>  
        <span xid="span61">选项1</span> 
      </a>  
      <a component="$UI/system/components/justep/button/button" class="btn btn-link"
        label="选项2" xid="pageBtn10" target="page10" disabled="true"> 
        <i xid="i25"/>  
        <span xid="span62">选项2</span> 
      </a>  
      <a component="$UI/system/components/justep/button/button" class="btn btn-link"
        label="选项3" xid="pageBtn11" target="page11" disabled="true"> 
        <i xid="i26"/>  
        <span xid="span63">选项3</span> 
      </a>  
      <a component="$UI/system/components/justep/button/button" class="btn btn-link"
        label="选项4" xid="pageBtn12" target="page12" disabled="true"> 
        <i xid="i27"/>  
        <span xid="span64">选项4</span> 
      </a> 
    </div>  
    <div xid="div7"> 
      <div component="$UI/system/components/justep/contents/contents" class="x-contents"
        active="0" xid="contents6" style="height:200px;"> 
        <div class="x-contents-content" xid="page9"> 
          <div component="$UI/system/components/justep/row/row" class="x-row"
            xid="row36"> 
            <div class="x-col" xid="col47"> 
              <span xid="span65">内容1</span> 
            </div> 
          </div>  
          <div component="$UI/system/components/justep/row/row" class="x-row"
            xid="row37"> 
            <div class="x-col" xid="col46"> 
              <span xid="span66">内容1</span> 
            </div> 
          </div> 
        </div>  
        <div class="x-contents-content" xid="page10"> 
          <div component="$UI/system/components/justep/row/row" class="x-row"
            xid="row38"> 
            <div class="x-col" xid="col48"> 
              <span xid="span68">内容2</span> 
            </div> 
          </div>  
          <div component="$UI/system/components/justep/row/row" class="x-row"
            xid="row39"> 
            <div class="x-col" xid="col49"> 
              <span xid="span67">内容2</span> 
            </div> 
          </div> 
        </div>  
        <div class="x-contents-content" xid="page11"> 
          <div component="$UI/system/components/justep/row/row" class="x-row"
            xid="row41"> 
            <div class="x-col" xid="col50"> 
              <span xid="span70">内容3</span> 
            </div> 
          </div>  
          <div component="$UI/system/components/justep/row/row" class="x-row"
            xid="row40"> 
            <div class="x-col" xid="col51"> 
              <span xid="span69">内容3</span> 
            </div> 
          </div> 
        </div>  
        <div class="x-contents-content" xid="page12"> 
          <div component="$UI/system/components/justep/row/row" class="x-row"
            xid="row44"> 
            <div class="x-col" xid="col53"> 
              <span xid="span73">内容4</span> 
            </div> 
          </div>  
          <div component="$UI/system/components/justep/row/row" class="x-row"
            xid="row43"> 
            <div class="x-col" xid="col54"> 
              <span xid="span72">内容4</span> 
            </div> 
          </div> 
        </div> 
      </div>  
      <a component="$UI/system/components/justep/button/button" class="btn btn-link"
        label="改变索引" xid="checkBtn" onClick="checkBtnClick"> 
        <i xid="i35"/>  
        <span xid="span82">改变索引</span> 
      </a> 
    </div>  
    <div component="$UI/system/components/justep/row/row" class="x-row" xid="row10"> 
      <div class="x-col" xid="col5"> 
        <span xid="span3"><![CDATA[禁用部分选项卡]]></span> 
      </div> 
    </div>  
    <div component="$UI/system/components/justep/row/row" class="x-row" xid="row11"> 
      <div class="x-col" xid="col9"> 
        <div component="$UI/system/components/justep/button/buttonGroup" class="btn-group"
          tabbed="true" xid="buttonGroup1"> 
          <a component="$UI/system/components/justep/button/button" class="btn btn-link"
            label="选项1" xid="pageBtn13" target="page13"> 
            <i xid="i1"/>  
            <span xid="span4">选项1</span> 
          </a>  
          <a component="$UI/system/components/justep/button/button" class="btn btn-link"
            label="选项2" xid="pageBtn14" target="page14"> 
            <i xid="i2"/>  
            <span xid="span5">选项2</span> 
          </a>  
          <a component="$UI/system/components/justep/button/button" class="btn btn-link"
            label="选项3" xid="pageBtn15" target="page15" disabled="true"> 
            <i xid="i3"/>  
            <span xid="span6">选项3</span> 
          </a>  
          <a component="$UI/system/components/justep/button/button" class="btn btn-link"
            label="选项4" xid="pageBtn16" target="page16" disabled="true"> 
            <i xid="i4"/>  
            <span xid="span7">选项4</span> 
          </a> 
        </div> 
      </div> 
    </div>  
    <div xid="div1"> 
      <div component="$UI/system/components/justep/contents/contents" class="x-contents"
        active="0" xid="contents3" style="height:200px;"> 
        <div class="x-contents-content" xid="page13"> 
          <div component="$UI/system/components/justep/row/row" class="x-row"
            xid="row45"> 
            <div class="x-col" xid="col41"> 
              <span xid="span50">内容1</span> 
            </div> 
          </div>  
          <div component="$UI/system/components/justep/row/row" class="x-row"
            xid="row42"> 
            <div class="x-col" xid="col40"> 
              <span xid="span49">内容1</span> 
            </div> 
          </div> 
        </div>  
        <div class="x-contents-content" xid="page14"> 
          <div component="$UI/system/components/justep/row/row" class="x-row"
            xid="row35"> 
            <div class="x-col" xid="col38"> 
              <span xid="span47">内容2</span> 
            </div> 
          </div>  
          <div component="$UI/system/components/justep/row/row" class="x-row"
            xid="row30"> 
            <div class="x-col" xid="col39"> 
              <span xid="span48">内容2</span> 
            </div> 
          </div> 
        </div>  
        <div class="x-contents-content" xid="page15"> 
          <div component="$UI/system/components/justep/row/row" class="x-row"
            xid="row31"> 
            <div class="x-col" xid="col45"> 
              <span xid="span31">内容3</span> 
            </div> 
          </div>  
          <div component="$UI/system/components/justep/row/row" class="x-row"
            xid="row32"> 
            <div class="x-col" xid="col44"> 
              <span xid="span46">内容3</span> 
            </div> 
          </div> 
        </div>  
        <div class="x-contents-content" xid="page16"> 
          <div component="$UI/system/components/justep/row/row" class="x-row"
            xid="row34"> 
            <div class="x-col" xid="col43"> 
              <span xid="span30">内容4</span> 
            </div> 
          </div>  
          <div component="$UI/system/components/justep/row/row" class="x-row"
            xid="row33"> 
            <div class="x-col" xid="col42"> 
              <span xid="span29">内容4</span> 
            </div> 
          </div> 
        </div> 
      </div>  
      <a component="$UI/system/components/justep/button/button" class="btn btn-link"
        label="启用步骤3" xid="enabledBtn" onClick="enabledBtnClick"> 
        <i xid="i9"/>  
        <span xid="span45">启用步骤3</span> 
      </a>  
      <a component="$UI/system/components/justep/button/button" class="btn btn-link"
        label="禁用步骤3" xid="disabledBtn" onClick="disabledBtnClick"> 
        <i xid="i10"/>  
        <span xid="span51">禁用步骤3</span> 
      </a> 
    </div> 
  </div>  
  <div component="$UI/system/components/justep/controlGroup/controlGroup" class="x-control-group"
    title="4、iframe模式-基本使用" xid="controlGroup4"> 
    <div class="x-control-group-title" xid="controlGroupTitle2"> 
      <span xid="span52">title</span> 
    </div>  
    <div component="$UI/system/components/justep/tabs/tabs" class="x-tabs"
      xid="tabs2" style="height:285px;"> 
      <div component="$UI/system/components/justep/panel/panel" class="x-panel"
        xid="panel3"> 
        <div class="x-panel-top" xid="top3"> 
          <ul class="nav nav-pills" xid="navs2"> 
            <li class="active" xid="li4"> 
              <a content="tabContent_1" xid="tabItem4"><![CDATA[选项1]]></a> 
            </li>  
            <li xid="li5"> 
              <a content="tabContent3" xid="tabItem5"><![CDATA[选项2]]></a> 
            </li> 
          </ul> 
        </div>  
        <div class="x-panel-content" xid="content13"> 
          <div component="$UI/system/components/justep/contents/contents" class="x-contents"
            active="0" xid="contents7"> 
            <div class="x-contents-content active" xid="content1"> 
              <iframe src="./iframe/iframe1.w" xid="iframe4" frameborder="0px"/> 
            </div>  
            <div class="x-contents-content" xid="content14"> 
              <iframe src="./iframe/iframe2.w" xid="iframe5" frameborder="0px"/> 
            </div> 
          </div> 
        </div> 
      </div> 
    </div> 
  </div>  
  <div component="$UI/system/components/justep/controlGroup/controlGroup" class="x-control-group"
    title="5、iframe模式-设定初始选中索引" xid="controlGroup5"> 
    <div class="x-control-group-title" xid="controlGroupTitle5"> 
      <span xid="span56">title</span> 
    </div>  
    <div component="$UI/system/components/justep/tabs/tabs" class="x-tabs"
      xid="tabs4" style="height:285px;"> 
      <div component="$UI/system/components/justep/panel/panel" class="x-panel"
        xid="panel6"> 
        <div class="x-panel-top" xid="top6"> 
          <ul class="nav nav-pills" xid="navs4"> 
            <li xid="li8" class="active"> 
              <a content="tabContent_1" xid="tabItem7">选项1</a> 
            </li>  
            <li xid="li7"> 
              <a content="tabContent3" xid="tabItem8">选项2</a> 
            </li> 
          </ul> 
        </div>  
        <div class="x-panel-content" xid="content18"> 
          <div component="$UI/system/components/justep/contents/contents" class="x-contents"
            active="0" xid="contents9"> 
            <div class="x-contents-content active" xid="content19"> 
              <iframe src="./iframe/iframe1.w" xid="iframe7" frameborder="0px"/> 
            </div>  
            <div class="x-contents-content" xid="content17"> 
              <iframe src="./iframe/iframe2.w" xid="iframe6" frameborder="0px"/> 
            </div> 
          </div> 
        </div> 
      </div> 
    </div> 
  </div>  
  <div component="$UI/system/components/justep/controlGroup/controlGroup" class="x-control-group"
    title="6、iframe模式-禁止点击并由外部控制索引" xid="controlGroup6"> 
    <div class="x-control-group-title" xid="controlGroupTitle7"> 
      <span xid="span75">title</span> 
    </div>  
    <div component="$UI/system/components/justep/row/row" class="x-row" xid="row50"> 
      <div class="x-col" xid="col66"> 
        <span xid="span76"><![CDATA[禁用全部选项卡：]]></span> 
      </div> 
    </div>  
    <div component="$UI/system/components/justep/tabs/tabs" class="x-tabs"
      xid="iframeCheckTabs" style="height:231px;"> 
      <div component="$UI/system/components/justep/panel/panel" class="x-panel"
        xid="panel9"> 
        <div class="x-panel-top" xid="top9"> 
          <ul class="nav nav-tabs" xid="navs7"> 
            <li class="active" xid="li9" bind-disable="true"> 
              <a content="tabContent_1" xid="tabItem15"><![CDATA[选项1]]></a> 
            </li>  
            <li xid="li10" bind-disable="true"> 
              <a content="tabContent6" xid="tabItem16"><![CDATA[选项2]]></a> 
            </li>  
            <li xid="li11" bind-disable="true"> 
              <a content="tabContent7" xid="tabItem17"><![CDATA[选项3]]></a> 
            </li> 
          </ul> 
        </div>  
        <div class="x-panel-content" xid="content27"> 
          <div component="$UI/system/components/justep/contents/contents" class="x-contents"
            active="0" xid="contents12"> 
            <div class="x-contents-content active" xid="content1"> 
              <iframe src="./iframe/iframe1.w" xid="iframe14" frameborder="0px"/> 
            </div>  
            <div class="x-contents-content" xid="content28"> 
              <iframe src="./iframe/iframe2.w" xid="iframe15" frameborder="0px"/> 
            </div>  
            <div class="x-contents-content" xid="content29"> 
              <iframe src="./iframe/iframe3.w" xid="iframe16" frameborder="0px"/> 
            </div> 
          </div> 
        </div> 
      </div> 
    </div>  
    <a component="$UI/system/components/justep/button/button" class="btn btn-link"
      label="改变索引" xid="checkIframeBtn" onClick="checkIframeBtnClick"> 
      <i xid="i19"/>  
      <span xid="span77">改变索引</span> 
    </a>  
    <div component="$UI/system/components/justep/row/row" class="x-row" xid="row51"> 
      <div class="x-col" xid="col69"> 
        <span xid="span78"><![CDATA[禁用部分选项卡：]]></span> 
      </div> 
    </div>  
    <div component="$UI/system/components/justep/tabs/tabs" class="x-tabs"
      xid="tabs8" style="height:231px;"> 
      <div component="$UI/system/components/justep/panel/panel" class="x-panel"
        xid="panel10"> 
        <div class="x-panel-top" xid="top10"> 
          <ul class="nav nav-tabs" xid="navs8"> 
            <li class="active" xid="li20"> 
              <a content="tabContent_1" xid="tabItem19">选项1</a> 
            </li>  
            <li xid="li18"> 
              <a content="tabContent6" xid="tabItem20">选项2</a> 
            </li>  
            <li xid="li19" bind-disable=" $model.statusData.val(&quot;edit&quot;)==0"> 
              <a content="tabContent7" xid="tabItem18">选项3</a> 
            </li> 
          </ul> 
        </div>  
        <div class="x-panel-content" xid="content31"> 
          <div component="$UI/system/components/justep/contents/contents" class="x-contents"
            active="0" xid="contents13"> 
            <div class="x-contents-content active" xid="content33"> 
              <iframe src="./iframe/iframe1.w" xid="iframe17" frameborder="0px"/> 
            </div>  
            <div class="x-contents-content" xid="content32"> 
              <iframe src="./iframe/iframe2.w" xid="iframe18" frameborder="0px"/> 
            </div>  
            <div class="x-contents-content" xid="content30"> 
              <iframe src="./iframe/iframe3.w" xid="iframe19" frameborder="0px"/> 
            </div> 
          </div> 
        </div> 
      </div> 
    </div>  
    <a component="$UI/system/components/justep/button/button" class="btn btn-link"
      label="启用&quot;步骤3&quot;" xid="startBtn" onClick="startBtnClick"> 
      <i xid="i20"/>  
      <span xid="span79">启用"步骤3"</span> 
    </a>  
    <a component="$UI/system/components/justep/button/button" class="btn btn-link"
      label="禁用&quot;步骤3&quot;" xid=" forbiddenBtn" onClick=" forbiddenBtnClick"> 
      <i xid="i21"/>  
      <span xid="span80">禁用"步骤3"</span> 
    </a> 
  </div>  
  <div component="$UI/system/components/justep/controlGroup/controlGroup" class="x-control-group"
    title="7、iframe模式-切换标签式出现进度条" xid="controlGroup7" style="height:297px;"> 
    <div class="x-control-group-title" xid="controlGroupTitle8"> 
      <span xid="span81">title</span> 
    </div>  
    <div component="$UI/system/components/justep/tabs/tabs" class="x-tabs"
      xid="tabs9" style="height:285px;"> 
      <div component="$UI/system/components/justep/panel/panel" class="x-panel"
        xid="panel11"> 
        <div class="x-panel-top" xid="top11"> 
          <ul class="nav nav-pills" xid="navs9"> 
            <li xid="progressBarLi1" class="active" bind-click="progressBarLi1Click"> 
              <a content="tabContent_1" xid="tabItem21">选项1</a> 
            </li>  
            <li xid="progressBarLi2" bind-click="progressBarLi2Click"> 
              <a content="tabContent3" xid="tabItem22">选项2</a> 
            </li> 
          </ul> 
        </div>  
        <div class="x-panel-content" xid="content36"> 
          <div component="$UI/system/components/justep/contents/contents" class="x-contents"
            active="0" xid="contents14"> 
            <div class="x-contents-content active" xid="content35"> 
              <iframe src="./iframe/iframe1.w" xid="iframe20" frameborder="0px"/> 
            </div>  
            <div class="x-contents-content" xid="content34"> 
              <iframe src="./iframe/iframe2.w" xid="iframe21" frameborder="0px"/> 
            </div> 
          </div> 
        </div> 
      </div> 
    </div> 
  </div>  
  <div component="$UI/system/components/justep/controlGroup/controlGroup" class="x-control-group"
    title="8、自定义内容区样式" xid="controlGroup8" style="height:370px;"> 
    <div class="x-control-group-title" xid="controlGroupTitle9"> 
      <span xid="span84">title</span> 
    </div>  
    <div component="$UI/system/components/justep/tabs/tabs" class="x-tabs"
      xid="tabs10" style="height:285px;"> 
      <div component="$UI/system/components/justep/panel/panel" class="x-panel"
        xid="panel12"> 
        <div class="x-panel-top" xid="top12"> 
          <ul class="nav nav-pills" xid="navs10"> 
            <li xid="li24" class="active"> 
              <a content="tabContent_1" xid="tabItem23">选项1</a> 
            </li>  
            <li xid="li23"> 
              <a content="tabContent3" xid="tabItem24">选项2</a> 
            </li> 
          </ul> 
        </div>  
        <div class="x-panel-content" xid="content39"> 
          <div component="$UI/system/components/justep/contents/contents" class="x-contents"
            active="0" xid="contents15"> 
            <div class="x-contents-content active" xid="content37"> 
              <iframe src="./iframe/iframe1.w" xid="iframe22" frameborder="0px"/> 
            </div>  
            <div class="x-contents-content" xid="content38"> 
              <iframe src="./iframe/iframe2.w" xid="iframe23" frameborder="0px"
                style="height:244px;width:362px;"/> 
            </div> 
          </div> 
        </div> 
      </div> 
    </div> 
  </div>  
  <div component="$UI/system/components/justep/controlGroup/controlGroup" class="x-control-group"
    title="9、选项卡点击事件" xid="controlGroup9" style="height:297px;top:300px;"> 
    <div class="x-control-group-title" xid="controlGroupTitle10"> 
      <span xid="span85">title</span> 
    </div>  
    <div component="$UI/system/components/justep/tabs/tabs" class="x-tabs"
      xid="tabs11" style="height:285px;"> 
      <div component="$UI/system/components/justep/panel/panel" class="x-panel"
        xid="panel13"> 
        <div class="x-panel-top" xid="top13"> 
          <ul class="nav nav-pills" xid="navs11"> 
            <li xid="li26" class="active" bind-click="li26Click"> 
              <a content="tabContent_1" xid="tabItem25">选项1</a> 
            </li>  
            <li xid="li25" bind-click="li25Click"> 
              <a content="tabContent3" xid="tabItem26">选项2</a> 
            </li> 
          </ul> 
        </div>  
        <div class="x-panel-content" xid="content42"> 
          <div component="$UI/system/components/justep/contents/contents" class="x-contents"
            active="0" xid="contents16"> 
            <div class="x-contents-content active" xid="content40"> 
              <iframe src="./iframe/iframe1.w" xid="iframe24" frameborder="0px"/> 
            </div>  
            <div class="x-contents-content" xid="content41"> 
              <iframe src="./iframe/iframe2.w" xid="iframe25" frameborder="0px"/> 
            </div> 
          </div> 
        </div> 
      </div> 
    </div> 
  </div>  
  <div component="$UI/system/components/justep/controlGroup/controlGroup" class="x-control-group"
    title="10、获取当前选中索引" xid="controlGroup10" style="height:376px;"> 
    <div class="x-control-group-title" xid="controlGroupTitle11"> 
      <span xid="span86">title</span> 
    </div>  
    <div component="$UI/system/components/justep/tabs/tabs" class="x-tabs"
      xid="tabs12" style="height:285px;"> 
      <div component="$UI/system/components/justep/panel/panel" class="x-panel"
        xid="panel14"> 
        <div class="x-panel-top" xid="top14"> 
          <ul class="nav nav-pills" xid="navs12"> 
            <li xid="li28" class="active"> 
              <a content="tabContent_1" xid="tabItem27">选项1</a> 
            </li>  
            <li xid="li27"> 
              <a content="tabContent3" xid="tabItem28">选项2</a> 
            </li> 
          </ul> 
        </div>  
        <div class="x-panel-content" xid="content44"> 
          <div component="$UI/system/components/justep/contents/contents" class="x-contents"
            active="0" xid="options"> 
            <div class="x-contents-content active" xid="option1"> 
              <iframe src="./iframe/iframe1.w" xid="iframe26" frameborder="0px"/> 
            </div>  
            <div class="x-contents-content" xid="option2"> 
              <iframe src="./iframe/iframe2.w" xid="iframe27" frameborder="0px"/> 
            </div> 
          </div> 
        </div> 
      </div> 
    </div>  
    <a component="$UI/system/components/justep/button/button" class="btn btn-link"
      label="获取当前索引" xid="button15" onClick="button15Click"> 
      <i xid="i23"/>  
      <span xid="span87">获取当前索引</span> 
    </a> 
  </div>  
  <div component="$UI/system/components/justep/controlGroup/controlGroup" class="x-control-group"
    title="11、鼠标移入切换标签" xid="controlGroup11"> 
    <div class="x-control-group-title" xid="controlGroupTitle12"> 
      <span xid="span88">title</span> 
    </div>  
    <div component="$UI/system/components/justep/tabs/tabs" class="x-tabs"
      xid="mouseOverTabs" style="height:231px;"> 
      <div component="$UI/system/components/justep/panel/panel" class="x-panel"
        xid="panel15"> 
        <div class="x-panel-top" xid="top15"> 
          <ul class="nav nav-tabs" xid="navs13"> 
            <li class="active" xid="menuOption1" bind-mouseover="menuOption1Mouseover"> 
              <a content="tabContent_1" xid="tabItem31">选项1</a> 
            </li>  
            <li xid="menuOption2" bind-mouseover="menuOption2Mouseover"> 
              <a content="tabContent6" xid="tabItem29">选项2</a> 
            </li>  
            <li xid="menuOption3" bind-mouseover="menuOption3Mouseover"> 
              <a content="tabContent7" xid="tabItem30">选项3</a> 
            </li> 
          </ul> 
        </div>  
        <div class="x-panel-content" xid="content46"> 
          <div component="$UI/system/components/justep/contents/contents" class="x-contents"
            active="0" xid="contents18"> 
            <div class="x-contents-content active" xid="content48"> 
              <iframe src="./iframe/iframe1.w" xid="iframe28" frameborder="0px"/> 
            </div>  
            <div class="x-contents-content" xid="content49"> 
              <iframe src="./iframe/iframe2.w" xid="iframe29" frameborder="0px"/> 
            </div>  
            <div class="x-contents-content" xid="content47"> 
              <iframe src="./iframe/iframe3.w" xid="iframe30" frameborder="0px"/> 
            </div> 
          </div> 
        </div> 
      </div> 
    </div> 
  </div>  
  <div component="$UI/system/components/justep/controlGroup/controlGroup" class="x-control-group"
    title="12、单内容区域模式" xid="controlGroup12"> 
    <div class="x-control-group-title" xid="controlGroupTitle13"> 
      <span xid="span89">title</span> 
    </div>  
    <div component="$UI/system/components/justep/tabs/tabs" class="x-tabs"
      xid="tabs14" style="height:231px;"> 
      <div component="$UI/system/components/justep/panel/panel" class="x-panel"
        xid="panel16"> 
        <div class="x-panel-top" xid="top16"> 
          <ul class="nav nav-tabs" xid="navs14"> 
            <li class="active" xid="li34"> 
              <a content="tabContent_1" xid="tabItem33">选项1</a> 
            </li>  
            <li xid="li32"> 
              <a content="tabContent6" xid="tabItem34">选项2</a> 
            </li>  
            <li xid="li33"> 
              <a content="tabContent7" xid="tabItem32">选项3</a> 
            </li> 
          </ul> 
        </div>  
        <div class="x-panel-content" xid="content51"> 
          <div component="$UI/system/components/justep/contents/contents" class="x-contents"
            active="0" xid="contents19"> 
            <div class="x-contents-content active" xid="content53"> 
              <iframe src="./iframe/iframe1.w" xid="iframe31" frameborder="0px"/> 
            </div>  
            <div class="x-contents-content" xid="content52"> 
              <iframe src="./iframe/iframe2.w" xid="iframe32" frameborder="0px"/> 
            </div>  
            <div class="x-contents-content" xid="content50"> 
              <iframe src="./iframe/iframe3.w" xid="iframe33" frameborder="0px"/> 
            </div> 
          </div> 
        </div> 
      </div> 
    </div> 
  </div>  
  <div component="$UI/system/components/justep/controlGroup/controlGroup" class="x-control-group"
    title="16、tab过多左右滚动" xid="controlGroup16" style="height:344px;"> 
    <div class="x-control-group-title" xid="controlGroupTitle19"> 
      <span xid="span113">title</span>
    </div>  
    <div component="$UI/system/components/justep/row/row" class="x-row" xid="row79"> 
      <div class="x-col" xid="col6"> 
        <span xid="span114">非iframe模式</span>
      </div> 
    </div>  
    <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-only-icon pull-left"
      label="button" xid="scrollLeftBtn" icon="icon-chevron-left" onClick="scrollLeftBtnClick"> 
      <i xid="i33" class="icon-chevron-left"/>  
      <span xid="span53"/>
    </a>  
    <div xid="div8" name="aa" style="overflow:auto;overflow-x:hidden;white-space:nowrap;background-color:#fafafa;width:303px;height:35px;"
      class="pull-left"> 
      <a component="$UI/system/components/justep/button/button" class="btn btn-link"
        label="选项1" xid="optionBtn1" target="optonContent1"> 
        <i xid="i11"/>  
        <span xid="span119">选项1</span>
      </a>  
      <a component="$UI/system/components/justep/button/button" class="btn btn-link"
        label="选项2" xid="optionBtn2" target="optonContent2"> 
        <i xid="i12"/>  
        <span xid="span119">选项2</span>
      </a>  
      <a component="$UI/system/components/justep/button/button" class="btn btn-link"
        label="选项3" xid="optionBtn3" target="optonContent3"> 
        <i xid="i29"/>  
        <span xid="span120">选项3</span>
      </a>  
      <a component="$UI/system/components/justep/button/button" class="btn btn-link"
        label="选项4" xid="optionBtn4" target="optonContent4"> 
        <i xid="i28"/>  
        <span xid="span117">选项4</span>
      </a>  
      <a component="$UI/system/components/justep/button/button" class="btn btn-link"
        label="选项5" xid="optionBtn5" target="optonContent5"> 
        <i xid="i18"/>  
        <span xid="span118">选项5</span>
      </a>  
      <a component="$UI/system/components/justep/button/button" class="btn btn-link"
        label="选项6" xid="optionBtn6" target="optonContent6"> 
        <i xid="i17"/>  
        <span xid="span115">选项6</span>
      </a>  
      <a component="$UI/system/components/justep/button/button" class="btn btn-link"
        label="选项7" xid="optionBtn7" target="optonContent7"> 
        <i xid="i12"/>  
        <span xid="span116">选项7</span>
      </a> 
    </div>  
    <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-only-icon pull-left"
      label="button" xid="scrollRightBtn" icon="icon-chevron-right" onClick="scrollRightBtnClick"> 
      <i xid="i31" class="icon-chevron-right"/>  
      <span xid="span22"/>
    </a>  
    <div component="$UI/system/components/justep/contents/contents" class="x-contents x-full"
      active="0" xid="contents1" style="height:206px;top:4700px"> 
      <div class="x-contents-content" xid="optonContent1"> 
        <div component="$UI/system/components/justep/row/row" class="x-row"
          xid="row91"> 
          <div class="x-col" xid="col80"> 
            <span xid="span24">内容1</span>
          </div> 
        </div>  
        <div component="$UI/system/components/justep/row/row" class="x-row"
          xid="row81"> 
          <div class="x-col" xid="col79"> 
            <span xid="span25">内容1</span>
          </div> 
        </div> 
      </div>  
      <div class="x-contents-content" xid="optonContent2"> 
        <div component="$UI/system/components/justep/row/row" class="x-row"
          xid="row80"> 
          <div class="x-col" xid="col82"> 
            <span xid="span128">内容2</span>
          </div> 
        </div>  
        <div component="$UI/system/components/justep/row/row" class="x-row"
          xid="row84"> 
          <div class="x-col" xid="col77"> 
            <span xid="span129">内容2</span>
          </div> 
        </div> 
      </div>  
      <div class="x-contents-content" xid="optonContent3"> 
        <div component="$UI/system/components/justep/row/row" class="x-row"
          xid="row83"> 
          <div class="x-col" xid="col83"> 
            <span xid="span127">内容3</span>
          </div> 
        </div>  
        <div component="$UI/system/components/justep/row/row" class="x-row"
          xid="row85"> 
          <div class="x-col" xid="col78"> 
            <span xid="span126">内容3</span>
          </div> 
        </div> 
      </div>  
      <div class="x-contents-content" xid="optonContent4"> 
        <div component="$UI/system/components/justep/row/row" class="x-row"
          xid="row13"> 
          <div class="x-col" xid="col84"> 
            <span xid="span125">内容4</span>
          </div> 
        </div>  
        <div component="$UI/system/components/justep/row/row" class="x-row"
          xid="row12"> 
          <div class="x-col" xid="col81"> 
            <span xid="span123">内容4</span>
          </div> 
        </div> 
      </div>  
      <div class="x-contents-content" xid="optonContent5"> 
        <div component="$UI/system/components/justep/row/row" class="x-row"
          xid="row82"> 
          <div class="x-col" xid="col3"> 
            <span xid="span124">内容5</span>
          </div> 
        </div>  
        <div component="$UI/system/components/justep/row/row" class="x-row"
          xid="row87"> 
          <div class="x-col" xid="col2"> 
            <span xid="span122">内容5</span>
          </div> 
        </div> 
      </div>  
      <div class="x-contents-content" xid="optonContent6"> 
        <div component="$UI/system/components/justep/row/row" class="x-row"
          xid="row86"> 
          <div class="x-col" xid="col86"> 
            <span xid="span121">内容6</span>
          </div> 
        </div>  
        <div component="$UI/system/components/justep/row/row" class="x-row"
          xid="row89"> 
          <div class="x-col" xid="col88"> 
            <span xid="span131">内容6</span>
          </div> 
        </div> 
      </div>  
      <div class="x-contents-content" xid="optonContent7"> 
        <div component="$UI/system/components/justep/row/row" class="x-row"
          xid="row88"> 
          <div class="x-col" xid="col85"> 
            <span xid="span26">内容7</span>
          </div> 
        </div>  
        <div component="$UI/system/components/justep/row/row" class="x-row"
          xid="row90"> 
          <div class="x-col" xid="col87"> 
            <span xid="span130">内容7</span>
          </div> 
        </div> 
      </div> 
    </div> 
  </div>
  <div component="$UI/system/components/justep/controlGroup/controlGroup" class="x-control-group"
    title="iframe模式" xid="controlGroup17" style="height:800px;"> 
    <div class="x-control-group-title" xid="controlGroupTitle20"> 
      <span xid="span28">title</span>
    </div>  
    <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-only-icon pull-left"
      label="button" xid="iframeScrollLeftBtn" icon="icon-chevron-left" onClick="iframeScrollLeftBtnClick"> 
      <i xid="i32" class="icon-chevron-left"/>  
      <span xid="span74"/>
    </a>  
    <div name="bb" xid="div2" style="overflow:auto;overflow-x:hidden;white-space:nowrap;background-color:#fafafa;width:300px;height:35px;"
      class="pull-left"> 
      <a component="$UI/system/components/justep/button/button" class="btn btn-link"
        label="选项1" xid="optionBtn8" target="optonContent8"> 
        <i xid="i17"/>  
        <span xid="span71">选项1</span>
      </a>
      <a component="$UI/system/components/justep/button/button" class="btn btn-link"
        label="选项2" xid="optionBtn9" target="optonContent9"> 
        <i xid="i37"/>  
        <span xid="span71">选项2</span>
      </a>
      <a component="$UI/system/components/justep/button/button" class="btn btn-link"
        label="选项3" xid="optionBtn10" target="optonContent10"> 
        <i xid="i36"/>  
        <span xid="span21">选项3</span>
      </a>
      <a component="$UI/system/components/justep/button/button" class="btn btn-link"
        label="选项4" xid="optionBtn11" target="optonContent11"> 
        <i xid="i34"/>  
        <span xid="span24">选项4</span>
      </a>
      <a component="$UI/system/components/justep/button/button" class="btn btn-link"
        label="选项5" xid="optionBtn12" target="optonContent12"> 
        <i xid="i38"/>  
        <span xid="span23">选项5</span>
      </a>
      <a component="$UI/system/components/justep/button/button" class="btn btn-link"
        label="选项6" xid="optionBtn13" target="optonContent13"> 
        <i xid="i12"/>  
        <span xid="span27">选项6</span>
      </a>
      <a component="$UI/system/components/justep/button/button" class="btn btn-link"
        label="选项7" xid="optionBtn14" target="optonContent14"> 
        <i xid="i12"/>  
        <span xid="span25">选项7</span>
      </a>
    </div>  
    <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-only-icon pull-left"
      label="button" xid="iframeScrollRightBtn" icon="icon-chevron-right" onClick="iframeScrollRightBtnClick"> 
      <i xid="i30" class="icon-chevron-right"/>  
      <span xid="span20"/>
    </a>  
    <div component="$UI/system/components/justep/contents/contents" class="x-contents "
      active="0" xid="contents17" style="width:100%;height:100%;" slidable="true"
      wrap="true"> 
      <div class="x-contents-content" xid="optonContent8" style="height:100%;width:100%;"> 
        <iframe src="https://www.baidu.com" xid="iframe12" frameborder="0px" height="100%"
          width="100%"/>
      </div>  
      <div class="x-contents-content" xid="optonContent9" style="height:100%;width:100%;"> 
        <iframe src="https://www.baidu.com" xid="iframe1" frameborder="0px" width="100%"
          height="100%"/>
      </div>  
      <div class="x-contents-content" xid="optonContent10"/>  
      <div class="x-contents-content" xid="optonContent11"/>  
      <div class="x-contents-content" xid="optonContent12"/>  
      <div class="x-contents-content" xid="optonContent13"/>  
      <div class="x-contents-content" xid="optonContent14"/>
    </div> 
  </div>
  <div component="$UI/system/components/justep/popOver/popOver" class="x-popOver"
    xid="loadPopOver" dismissible="true"> 
    <div class="x-popOver-overlay" xid="div5"/>  
    <div class="x-popOver-content" xid="div6" style="border-style:double double double double;border-width:medium medium medium medium;"> 
      <a component="$UI/system/components/justep/button/button" class="btn btn-link"
        label="正在加载" xid="button14" icon="icon-loading-a"> 
        <i xid="i22" class="icon-loading-a"/>  
        <span xid="span83">正在加载</span> 
      </a> 
    </div> 
  </div> 
</div>
