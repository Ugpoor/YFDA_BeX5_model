<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window" component="$UI/system/components/justep/window/window"
  design="device:pc">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:295px;top:2546px;"> 
    <div component="$UI/system/components/justep/data/data" autoLoad="true" xid="statusData" idColumn="edit"> 
      <column name="edit" type="String" xid="xid2" />  
      <data xid="default1">[{"edit":"0"}]</data> 
    </div>  
    <div component="$UI/system/components/justep/data/data" autoLoad="true" xid="iframeStatusData" idColumn="edit"> 
      <column name="edit" type="String" xid="xid1" />  
      <data xid="default2">[{"edit":"0"}]</data> 
    </div> 
  </div><a component="$UI/system/components/justep/button/button" class="btn btn-link" label="js" xid="js" onClick="jsClick" style="color:#337AB7;"> 
      <i xid="i1" />  
      <span xid="span2">js</span> 
    </a><a component="$UI/system/components/justep/button/button" class="btn btn-link" label="源码" xid="source" onClick="sourceClick" style="color:#337AB7;"> 
      <i xid="ii29" />  
      <span xid="span900">源码</span> 
    </a>  
  <div component="$UI/system/components/justep/controlGroup/controlGroup" class="x-control-group"
    title="1、非iframe模式-基本使用" xid="controlGroup1" style="height:259px;"> 
    <div class="x-control-group-title" xid="controlGroupTitle1"> 
      <span xid="span1">title</span> 
    </div>  
    
    
    <div component="$UI/system/components/justep/tabs/tabs" class="x-tabs"
      xid="tabs7"> 
      <div component="$UI/system/components/justep/panel/panel" class="x-panel"
        xid="panel5"> 
        <div class="x-panel-top" xid="top5"> 
          <ul class="nav nav-tabs" xid="navs5"> 
            <li class="active" xid="li40"> 
              <a content="tabContent_1" xid="tabItem45"><![CDATA[选项1]]></a> 
            </li>  
            <li xid="li41"> 
              <a content="tabContent19" xid="tabItem46"><![CDATA[选项2]]></a> 
            </li>  
            <li xid="li42"> 
              <a content="tabContent20" xid="tabItem47"><![CDATA[选项3]]></a> 
            </li>  
            <li xid="li43"> 
              <a content="tabContent21" xid="tabItem48"><![CDATA[选项4]]></a> 
            </li> 
          </ul> 
        </div>  
        <div class="x-panel-content" xid="content12"> 
          <div component="$UI/system/components/justep/contents/contents" class="x-contents"
            active="0" xid="contents5"> 
            <div class="x-contents-content active" xid="content1"> 
              <div component="$UI/system/components/justep/row/row" class="x-row"
                xid="row2"> 
                <div class="x-col" xid="col3"> 
                  <span xid="span8">内容1</span> 
                </div> 
              </div>  
              <div component="$UI/system/components/justep/row/row" class="x-row"
                xid="row3"> 
                <div class="x-col" xid="col2"> 
                  <span xid="span9">内容1</span> 
                </div> 
              </div> 
            </div>  
            <div class="x-contents-content" xid="content15"> 
              <div component="$UI/system/components/justep/row/row" class="x-row"
                xid="row4"> 
                <div class="x-col" xid="col6"> 
                  <span xid="span10"><![CDATA[内容2]]></span> 
                </div> 
              </div>  
              <div component="$UI/system/components/justep/row/row" class="x-row"
                xid="row5"> 
                <div class="x-col" xid="col4"> 
                  <span xid="span11"><![CDATA[内容2]]></span> 
                </div> 
              </div> 
            </div>  
            <div class="x-contents-content" xid="content20"> 
              <div component="$UI/system/components/justep/row/row" class="x-row"
                xid="row6"> 
                <div class="x-col" xid="col8"> 
                  <span xid="span12"><![CDATA[内容3]]></span> 
                </div> 
              </div>  
              <div component="$UI/system/components/justep/row/row" class="x-row"
                xid="row7"> 
                <div class="x-col" xid="col7"> 
                  <span xid="span13"><![CDATA[内容3]]></span> 
                </div> 
              </div> 
            </div>  
            <div class="x-contents-content" xid="content21"> 
              <div component="$UI/system/components/justep/row/row" class="x-row"
                xid="row8"> 
                <div class="x-col" xid="col11"> 
                  <span xid="span14"><![CDATA[内容4]]></span> 
                </div> 
              </div>  
              <div component="$UI/system/components/justep/row/row" class="x-row"
                xid="row9"> 
                <div class="x-col" xid="col10"> 
                  <span xid="span15"><![CDATA[内容4]]></span> 
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
    <div component="$UI/system/components/justep/tabs/tabs" class="x-tabs"
      xid="tabs13" style="height:293px;"> 
      <div component="$UI/system/components/justep/panel/panel" class="x-panel"
        xid="panel7"> 
        <div class="x-panel-top" xid="top7"> 
          <ul class="nav nav-tabs" xid="navs6"> 
            <li class="active" xid="li47"> 
              <a content="tabContent_1" xid="tabItem50">选项1</a> 
            </li>  
            <li xid="li46"> 
              <a content="tabContent19" xid="tabItem52">选项2</a> 
            </li>  
            <li xid="li45"> 
              <a content="tabContent20" xid="tabItem51">选项3</a> 
            </li>  
            <li xid="li44"> 
              <a content="tabContent21" xid="tabItem49">选项4</a> 
            </li> 
          </ul> 
        </div>  
        <div class="x-panel-content" xid="content23"> 
          <div component="$UI/system/components/justep/contents/contents" class="x-contents"
            active="0" xid="contents8"> 
            <div class="x-contents-content active" xid="content25"> 
              <div component="$UI/system/components/justep/row/row" class="x-row"
                xid="row14"> 
                <div class="x-col" xid="col15"> 
                  <span xid="span22">内容1</span> 
                </div> 
              </div>  
              <div component="$UI/system/components/justep/row/row" class="x-row"
                xid="row15"> 
                <div class="x-col" xid="col16"> 
                  <span xid="span23">内容1</span> 
                </div> 
              </div> 
            </div>  
            <div class="x-contents-content" xid="content22"> 
              <div component="$UI/system/components/justep/row/row" class="x-row"
                xid="row12"> 
                <div class="x-col" xid="col14"> 
                  <span xid="span18">内容2</span> 
                </div> 
              </div>  
              <div component="$UI/system/components/justep/row/row" class="x-row"
                xid="row13"> 
                <div class="x-col" xid="col12"> 
                  <span xid="span17">内容2</span> 
                </div> 
              </div> 
            </div>  
            <div class="x-contents-content" xid="content26"> 
              <div component="$UI/system/components/justep/row/row" class="x-row"
                xid="row18"> 
                <div class="x-col" xid="col17"> 
                  <span xid="span16">内容3</span> 
                </div> 
              </div>  
              <div component="$UI/system/components/justep/row/row" class="x-row"
                xid="row19"> 
                <div class="x-col" xid="col13"> 
                  <span xid="span21">内容3</span> 
                </div> 
              </div> 
            </div>  
            <div class="x-contents-content" xid="content24"> 
              <div component="$UI/system/components/justep/row/row" class="x-row"
                xid="row16"> 
                <div class="x-col" xid="col19"> 
                  <span xid="span20">内容4</span> 
                </div> 
              </div>  
              <div component="$UI/system/components/justep/row/row" class="x-row"
                xid="row17"> 
                <div class="x-col" xid="col18"> 
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
    title="3、非iframe模式-禁止点击并由外部控制索引" xid="controlGroup3" style="height:758px;"> 
    <div class="x-control-group-title" xid="controlGroupTitle4"> 
      <span xid="span34">title</span> 
    </div>  
    <div component="$UI/system/components/justep/row/row" class="x-row" xid="row26"> 
      <div class="x-col" xid="col26"> 
        <span xid="span35">禁用全部选项卡：</span> 
      </div> 
    </div>  
    <div component="$UI/system/components/justep/tabs/tabs" class="x-tabs"
      xid="checkTabs" style="height:276px;"> 
      <div component="$UI/system/components/justep/panel/panel" class="x-panel"
        xid="panel19"> 
        <div class="x-panel-top" xid="top19"> 
          <ul class="nav nav-tabs" xid="navs18"> 
            <li class="active" xid="li62" bind-disable="true"> 
              <a content="tabContent_1" xid="tabItem67"><![CDATA[选项1]]></a> 
            </li>  
            <li xid="li63" bind-disable="true"> 
              <a content="tabContent29" xid="tabItem68"><![CDATA[选项2]]></a> 
            </li>  
            <li xid="li64" bind-disable="true"> 
              <a content="tabContent30" xid="tabItem69"><![CDATA[选项3]]></a> 
            </li>  
            <li xid="li65" bind-disable="true"> 
              <a content="tabContent31" xid="tabItem70"><![CDATA[选项4]]></a> 
            </li> 
          </ul> 
        </div>  
        <div class="x-panel-content" xid="content70"> 
          <div component="$UI/system/components/justep/contents/contents" class="x-contents"
            active="0" xid="contents20"> 
            <div class="x-contents-content active" xid="content1"> 
              <div component="$UI/system/components/justep/row/row" class="x-row"
                xid="row28"> 
                <div class="x-col" xid="col28"> 
                  <span xid="span38">内容1</span> 
                </div> 
              </div>  
              <div component="$UI/system/components/justep/row/row" class="x-row"
                xid="row27"> 
                <div class="x-col" xid="col27"> 
                  <span xid="span39">内容1</span> 
                </div> 
              </div>  
              <div class="x-contents-content active" xid="content74"/> 
            </div>  
            <div class="x-contents-content" xid="content71"> 
              <div component="$UI/system/components/justep/row/row" class="x-row"
                xid="row30"> 
                <div class="x-col" xid="col30"> 
                  <span xid="span40"><![CDATA[内容2]]></span> 
                </div> 
              </div>  
              <div component="$UI/system/components/justep/row/row" class="x-row"
                xid="row29"> 
                <div class="x-col" xid="col29"> 
                  <span xid="span41"><![CDATA[内容2]]></span> 
                </div> 
              </div>  
              <div class="x-contents-content active" xid="content75"/> 
            </div>  
            <div class="x-contents-content" xid="content72"> 
              <div component="$UI/system/components/justep/row/row" class="x-row"
                xid="row32"> 
                <div class="x-col" xid="col32"> 
                  <span xid="span42"><![CDATA[内容3]]></span> 
                </div> 
              </div>  
              <div component="$UI/system/components/justep/row/row" class="x-row"
                xid="row31"> 
                <div class="x-col" xid="col31"> 
                  <span xid="span43"><![CDATA[内容3]]></span> 
                </div> 
              </div>  
              <div class="x-contents-content active" xid="content76"/> 
            </div>  
            <div class="x-contents-content" xid="content73"> 
              <div component="$UI/system/components/justep/row/row" class="x-row"
                xid="row34"> 
                <div class="x-col" xid="col34"> 
                  <span xid="span44"><![CDATA[内容4]]></span> 
                </div> 
              </div>  
              <div component="$UI/system/components/justep/row/row" class="x-row"
                xid="row33"> 
                <div class="x-col" xid="col33"> 
                  <span xid="span45"><![CDATA[内容4]]></span> 
                </div> 
              </div> 
            </div> 
          </div> 
        </div> 
      </div> 
    </div>  
    <a component="$UI/system/components/justep/button/button" class="btn btn-link"
      label="改变索引" xid="checkBtn" onClick="checkBtnClick" style="color:#000000;"> 
      <i xid="i9"/>  
      <span xid="span37">改变索引</span> 
    </a>  
    <div component="$UI/system/components/justep/row/row" class="x-row" xid="row43"> 
      <div class="x-col" xid="col43"> 
        <span xid="span55"><![CDATA[禁用部分选项卡：]]></span> 
      </div> 
    </div>  
    <div component="$UI/system/components/justep/tabs/tabs" class="x-tabs"
      xid="tabs19" style="height:276px;"> 
      <div component="$UI/system/components/justep/panel/panel" class="x-panel"
        xid="panel20"> 
        <div class="x-panel-top" xid="top20"> 
          <ul class="nav nav-tabs" xid="navs19"> 
            <li class="active" xid="li68"> 
              <a content="tabContent_1" xid="tabItem74">选项1</a> 
            </li>  
            <li xid="li67"> 
              <a content="tabContent29" xid="tabItem72">选项2</a> 
            </li>  
            <li xid="optionsThree" bind-disable=" $model.statusData.val(&quot;edit&quot;)==0"> 
              <a content="tabContent30" xid="tabItem73">选项3</a> 
            </li>  
            <li xid="li69" bind-disable="true"> 
              <a content="tabContent31" xid="tabItem71">选项4</a> 
            </li> 
          </ul> 
        </div>  
        <div class="x-panel-content" xid="content79"> 
          <div component="$UI/system/components/justep/contents/contents" class="x-contents"
            active="0" xid="contents21"> 
            <div class="x-contents-content active" xid="content85"> 
              <div component="$UI/system/components/justep/row/row" class="x-row"
                xid="row36"> 
                <div class="x-col" xid="col37"> 
                  <span xid="span54">内容1</span> 
                </div> 
              </div>  
              <div component="$UI/system/components/justep/row/row" class="x-row"
                xid="row35"> 
                <div class="x-col" xid="col35"> 
                  <span xid="span53">内容1</span> 
                </div> 
              </div> 
            </div>  
            <div class="x-contents-content" xid="content80"> 
              <div component="$UI/system/components/justep/row/row" class="x-row"
                xid="row38"> 
                <div class="x-col" xid="col38"> 
                  <span xid="span50">内容2</span> 
                </div> 
              </div>  
              <div component="$UI/system/components/justep/row/row" class="x-row"
                xid="row37"> 
                <div class="x-col" xid="col36"> 
                  <span xid="span51">内容2</span> 
                </div> 
              </div>  
              <div class="x-contents-content active" xid="content84"/> 
            </div>  
            <div class="x-contents-content" xid="content81"> 
              <div component="$UI/system/components/justep/row/row" class="x-row"
                xid="row41"> 
                <div class="x-col" xid="col40"> 
                  <span xid="span48">内容3</span> 
                </div> 
              </div>  
              <div component="$UI/system/components/justep/row/row" class="x-row"
                xid="row42"> 
                <div class="x-col" xid="col39"> 
                  <span xid="span49">内容3</span> 
                </div> 
              </div>  
              <div class="x-contents-content active" xid="content78"/> 
            </div>  
            <div class="x-contents-content" xid="content82"> 
              <div component="$UI/system/components/justep/row/row" class="x-row"
                xid="row39"> 
                <div class="x-col" xid="col41"> 
                  <span xid="span46">内容4</span> 
                </div> 
              </div>  
              <div component="$UI/system/components/justep/row/row" class="x-row"
                xid="row40"> 
                <div class="x-col" xid="col42"> 
                  <span xid="span47">内容4</span> 
                </div> 
              </div> 
            </div> 
          </div> 
        </div> 
      </div> 
    </div>  
    <a component="$UI/system/components/justep/button/button" class="btn btn-link"
      label="启用&quot;步骤3&quot;" xid="optionThreeBtn" onClick="optionThreeBtnClick" style="color:#000000;"> 
      <i xid="i10"/>  
      <span xid="span57">启用"步骤3"</span> 
    </a>  
    <a component="$UI/system/components/justep/button/button" class="btn btn-link"
      label="禁用&quot;步骤3&quot;" xid="optionThreeUnBtn" onClick="optionThreeUnBtnClick" style="color:#000000;"> 
      <i xid="i11"/>  
      <span xid="span58">禁用"步骤3"</span> 
    </a> 
  </div>  
  <div component="$UI/system/components/justep/controlGroup/controlGroup" class="x-control-group"
    title="4、iframe模式-基本使用" xid="controlGroup4" style="height:357px;"> 
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
              <iframe src="./iframe/iframe1.w" xid="iframe14" style="height:167px;width:364px;"
                frameborder="0px"/> 
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
      label="改变索引" xid="checkIframeBtn" onClick="checkIframeBtnClick" style="color:#000000;"> 
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
            <li xid="li19" bind-disable=" $model.iframeStatusData.val(&quot;edit&quot;)==0"> 
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
      label="启用&quot;步骤3&quot;" xid="startBtn" onClick="startBtnClick" style="color:#000000;"> 
      <i xid="i20"/>  
      <span xid="span79">启用"步骤3"</span> 
    </a>  
    <a component="$UI/system/components/justep/button/button" class="btn btn-link"
      label="禁用&quot;步骤3&quot;" xid=" forbiddenBtn" onClick=" forbiddenBtnClick" style="color:#000000;"> 
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
    title="8、选项卡点击事件" xid="controlGroup8" style="height:297px;top:300px;"> 
    <div class="x-control-group-title" xid="controlGroupTitle10"> 
      <span xid="span85">title</span> 
    </div>  
    <div component="$UI/system/components/justep/tabs/tabs" class="x-tabs"
      xid="tabs11" style="height:285px;"> 
      <div component="$UI/system/components/justep/panel/panel" class="x-panel"
        xid="panel13"> 
        <div class="x-panel-top" xid="top13"> 
          <ul class="nav nav-pills" xid="navs11"> 
            <li xid="optionOne" class="active" bind-click="optionOneClick"> 
              <a content="tabContent_1" xid="tabItem25">选项1</a> 
            </li>  
            <li xid="optionTwo" bind-click="optionTwoClick"> 
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
    title="9、获取当前选中索引" xid="controlGroup9" style="height:376px;"> 
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
      label="获取当前索引" xid="getIndexBtn" onClick="getIndexBtnClick" style="color:#000000;"> 
      <i xid="i23"/>  
      <span xid="span87">获取当前索引</span> 
    </a> 
  </div>  
  <div component="$UI/system/components/justep/controlGroup/controlGroup" class="x-control-group"
    title="10、鼠标移入切换标签" xid="controlGroup10"> 
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
    title="11、单内容区域模式" xid="controlGroup11"> 
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
    title="12、单选项模式" xid="controlGroup12" style="height:349px;"> 
    <div class="x-control-group-title" xid="controlGroupTitle6"> 
      <span xid="span2">title</span> 
    </div>  
    <div component="$UI/system/components/justep/tabs/tabs" class="x-tabs"
      xid="tabs1"> 
      <div component="$UI/system/components/justep/panel/panel" class="x-panel"
        xid="panel1"> 
        <div class="x-panel-top" xid="top1"> 
          <ul class="nav nav-tabs" xid="navs1"> 
            <li class="active" xid="li1"> 
              <a content="tabContent_1" xid="tabItem1"><![CDATA[基础信息]]></a> 
            </li>  
            <li xid="li2"> 
              <a content="tabContent_1" xid="tabItem1"><![CDATA[二级标题内容部分]]></a> 
            </li>  
            <li xid="li2" class="pull-right"> 
              <a content="tabContent_1" xid="tabItem1"><![CDATA[更多...]]></a> 
            </li> 
          </ul> 
        </div>  
        <div class="x-panel-content" xid="content2"> 
          <div component="$UI/system/components/justep/contents/contents" class="x-contents"
            active="0" xid="contents1"> 
            <div class="x-contents-content active" xid="content1"> 
              <div component="$UI/system/components/justep/row/row" class="x-row"
                xid="row1"> 
                <div class="x-col" xid="col1"> 
                  <span xid="span4">内容1</span> 
                </div> 
              </div>  
              <div component="$UI/system/components/justep/row/row" class="x-row"
                xid="row10"> 
                <div class="x-col" xid="col5"> 
                  <span xid="span3">内容1</span> 
                </div> 
              </div> 
            </div> 
          </div> 
        </div> 
      </div> 
    </div> 
  </div>  
  <div component="$UI/system/components/justep/controlGroup/controlGroup" class="x-control-group"
    title="13、含有标题" xid="controlGroup13" style="height:259px;"> 
    <div class="x-control-group-title" xid="controlGroupTitle9"> 
      <span xid="span29">title</span> 
    </div>  
    <div component="$UI/system/components/justep/tabs/tabs" class="x-tabs"
      xid="tabs3"> 
      <div component="$UI/system/components/justep/panel/panel" class="x-panel"
        xid="panel2"> 
        <div class="x-panel-top" xid="top2"> 
          <a component="$UI/system/components/justep/button/button" class="btn btn-link pull-left"
            label="信息录入" xid="button1" style="color:#000000;font-weight:bold;"> 
            <i xid="i1"/>  
            <span xid="span30">信息录入</span> 
          </a>  
          <ul class="nav nav-tabs pull-right" xid="navs3"> 
            <li class="active" xid="li13"> 
              <a content="tabContent_1" xid="tabItem3"><![CDATA[基础信息]]></a> 
            </li>  
            <li xid="li12"> 
              <a content="tabContent19" xid="tabItem9"><![CDATA[体貌特征]]></a> 
            </li>  
            <li xid="li6"> 
              <a content="tabContent20" xid="tabItem6"><![CDATA[交通工具]]></a> 
            </li> 
          </ul> 
        </div>  
        <div class="x-panel-content" xid="content4"> 
          <div component="$UI/system/components/justep/contents/contents" class="x-contents"
            active="0" xid="contents2"> 
            <div class="x-contents-content active" xid="content6"> 
              <div component="$UI/system/components/justep/row/row" class="x-row"
                xid="row21"> 
                <div class="x-col" xid="col22"> 
                  <span xid="span27">内容1</span> 
                </div> 
              </div>  
              <div component="$UI/system/components/justep/row/row" class="x-row"
                xid="row22"> 
                <div class="x-col" xid="col23"> 
                  <span xid="span28">内容1</span> 
                </div> 
              </div> 
            </div>  
            <div class="x-contents-content" xid="content3"> 
              <div component="$UI/system/components/justep/row/row" class="x-row"
                xid="row11"> 
                <div class="x-col" xid="col21"> 
                  <span xid="span7">内容2</span> 
                </div> 
              </div>  
              <div component="$UI/system/components/justep/row/row" class="x-row"
                xid="row20"> 
                <div class="x-col" xid="col9"> 
                  <span xid="span6">内容2</span> 
                </div> 
              </div> 
            </div>  
            <div class="x-contents-content" xid="content7"> 
              <div component="$UI/system/components/justep/row/row" class="x-row"
                xid="row25"> 
                <div class="x-col" xid="col24"> 
                  <span xid="span5">内容3</span> 
                </div> 
              </div>  
              <div component="$UI/system/components/justep/row/row" class="x-row"
                xid="row44"> 
                <div class="x-col" xid="col20"> 
                  <span xid="span26">内容3</span> 
                </div> 
              </div> 
            </div> 
          </div> 
        </div> 
      </div> 
    </div> 
  </div>  
  <div component="$UI/system/components/justep/controlGroup/controlGroup" class="x-control-group"
    title="14、标题含有图标" xid="controlGroup14" style="height:363px;"> 
    <div class="x-control-group-title" xid="controlGroupTitle14"> 
      <span xid="span60">title</span> 
    </div>  
    <div component="$UI/system/components/justep/tabs/tabs" class="x-tabs"
      xid="tabs5"> 
      <div component="$UI/system/components/justep/panel/panel" class="x-panel"
        xid="panel4"> 
        <div class="x-panel-top" xid="top4"> 
          <a component="$UI/system/components/justep/button/button" class="btn btn-link pull-left"
            label="信息录入" xid="button2" style="color:#000000;font-weight:bold;" icon="icon-compose"> 
            <i xid="i2" class="icon-compose" style="font-size:medium;color:#FF8040;"/>  
            <span xid="span59">信息录入</span> 
          </a>  
          <ul class="nav nav-tabs pull-right" xid="navs10"> 
            <li class="active" xid="li15"> 
              <a content="tabContent_1" xid="tabItem10">基础信息</a> 
            </li>  
            <li xid="li14"> 
              <a content="tabContent19" xid="tabItem12">体貌特征</a> 
            </li>  
            <li xid="li16"> 
              <a content="tabContent20" xid="tabItem11">交通工具</a> 
            </li> 
          </ul> 
        </div>  
        <div class="x-panel-content" xid="content9"> 
          <div component="$UI/system/components/justep/contents/contents" class="x-contents"
            active="0" xid="contents3"> 
            <div class="x-contents-content active" xid="content10"> 
              <div component="$UI/system/components/justep/row/row" class="x-row"
                xid="row47"> 
                <div class="x-col" xid="col47"> 
                  <span xid="span63">内容1</span> 
                </div> 
              </div>  
              <div component="$UI/system/components/justep/row/row" class="x-row"
                xid="row49"> 
                <div class="x-col" xid="col46"> 
                  <span xid="span61">内容1</span> 
                </div> 
              </div> 
            </div>  
            <div class="x-contents-content" xid="content8"> 
              <div component="$UI/system/components/justep/row/row" class="x-row"
                xid="row52"> 
                <div class="x-col" xid="col50"> 
                  <span xid="span33">内容2</span> 
                </div> 
              </div>  
              <div component="$UI/system/components/justep/row/row" class="x-row"
                xid="row48"> 
                <div class="x-col" xid="col45"> 
                  <span xid="span31">内容2</span> 
                </div> 
              </div> 
            </div>  
            <div class="x-contents-content" xid="content11"> 
              <div component="$UI/system/components/justep/row/row" class="x-row"
                xid="row45"> 
                <div class="x-col" xid="col48"> 
                  <span xid="span36">内容3</span> 
                </div> 
              </div>  
              <div component="$UI/system/components/justep/row/row" class="x-row"
                xid="row46"> 
                <div class="x-col" xid="col49"> 
                  <span xid="span62">内容3</span> 
                </div> 
              </div> 
            </div> 
          </div> 
        </div> 
      </div> 
    </div> 
  </div>  
  <div component="$UI/system/components/justep/controlGroup/controlGroup" class="x-control-group"
    title="15、与box1合用" xid="controlGroup15" style="height:308px;"> 
    <div class="x-control-group-title" xid="controlGroupTitle21"> 
      <span xid="span136">title</span> 
    </div>  
    <div component="$UI/system/components/justep/tabs/tabs" class="x-tabs"
      xid="tabs6" style="height:252px;"> 
      <div component="$UI/system/components/justep/panel/panel" class="x-panel"
        xid="panel8"> 
        <div class="x-panel-top" xid="top8"> 
          <a component="$UI/system/components/justep/button/button" class="btn btn-link pull-left"
            label="信息录入" xid="button3" style="color:#000000;font-weight:bold;"> 
            <i xid="i18"/>  
            <span xid="span135">信息录入</span> 
          </a>  
          <ul class="nav nav-tabs pull-right" xid="navs15"> 
            <li class="active" xid="li22"> 
              <a content="tabContent_1" xid="tabItem13">基础信息</a> 
            </li>  
            <li xid="li21"> 
              <a content="tabContent19" xid="tabItem23">体貌特征</a> 
            </li>  
            <li xid="li17"> 
              <a content="tabContent20" xid="tabItem14">交通工具</a> 
            </li> 
          </ul> 
        </div>  
        <div class="x-panel-content" xid="content37" style="border-style:solid solid solid solid;"> 
          <div component="$UI/system/components/justep/contents/contents" class="x-contents"
            active="0" xid="contents22" style="border-width:2px;"> 
            <div class="x-contents-content active" xid="content38"> 
              <div component="$UI/system/components/justep/row/row" class="x-row"
                xid="row94"> 
                <div class="x-col" xid="col93"> 
                  <span xid="span139">内容1</span> 
                </div> 
              </div>  
              <div component="$UI/system/components/justep/row/row" class="x-row"
                xid="row96"> 
                <div class="x-col" xid="col92"> 
                  <span xid="span137">内容1</span> 
                </div> 
              </div> 
            </div>  
            <div class="x-contents-content" xid="content16"> 
              <div component="$UI/system/components/justep/row/row" class="x-row"
                xid="row92"> 
                <div class="x-col" xid="col90"> 
                  <span xid="span133">内容2</span> 
                </div> 
              </div>  
              <div component="$UI/system/components/justep/row/row" class="x-row"
                xid="row95"> 
                <div class="x-col" xid="col91"> 
                  <span xid="span132">内容2</span> 
                </div> 
              </div> 
            </div>  
            <div class="x-contents-content" xid="content39"> 
              <div component="$UI/system/components/justep/row/row" class="x-row"
                xid="row93"> 
                <div class="x-col" xid="col94"> 
                  <span xid="span134">内容3</span> 
                </div> 
              </div>  
              <div component="$UI/system/components/justep/row/row" class="x-row"
                xid="row97"> 
                <div class="x-col" xid="col89"> 
                  <span xid="span138">内容3</span> 
                </div> 
              </div> 
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
      <div class="x-col" xid="col51"> 
        <span xid="span114">非iframe模式</span> 
      </div> 
    </div>  
    <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-only-icon pull-left"
      label="button" xid="scrollLeftBtn" icon="icon-chevron-left" onClick="scrollLeftBtnClick"
      style="color:#000000;"> 
      <i xid="i24" class="icon-chevron-left"/>  
      <span xid="span64"/> 
    </a>  
    <div xid="div1" name="aa" style="background-color:#0065CA;overflow:auto;overflow-x:hidden;white-space:nowrap;width:303px;height:35px;"
      class="pull-left"> 
      <a component="$UI/system/components/justep/button/button" class="btn btn-link"
        label="选项1" xid="optionBtn1" target="optonContent1"> 
        <i xid="i8"/>  
        <span xid="span119">选项1</span> 
      </a>  
      <a component="$UI/system/components/justep/button/button" class="btn btn-link"
        label="选项2" xid="optionBtn2" target="optonContent2"> 
        <i xid="i7"/>  
        <span xid="span119">选项2</span> 
      </a>  
      <a component="$UI/system/components/justep/button/button" class="btn btn-link"
        label="选项3" xid="optionBtn3" target="optonContent3"> 
        <i xid="i3"/>  
        <span xid="span120">选项3</span> 
      </a>  
      <a component="$UI/system/components/justep/button/button" class="btn btn-link"
        label="选项4" xid="optionBtn4" target="optonContent4"> 
        <i xid="i4"/>  
        <span xid="span117">选项4</span> 
      </a>  
      <a component="$UI/system/components/justep/button/button" class="btn btn-link"
        label="选项5" xid="optionBtn5" target="optonContent5"> 
        <i xid="i5"/>  
        <span xid="span118">选项5</span> 
      </a>  
      <a component="$UI/system/components/justep/button/button" class="btn btn-link"
        label="选项6" xid="optionBtn6" target="optonContent6"> 
        <i xid="i6"/>  
        <span xid="span115">选项6</span> 
      </a>  
      <a component="$UI/system/components/justep/button/button" class="btn btn-link"
        label="选项7" xid="optionBtn7" target="optonContent7"> 
        <i xid="i7"/>  
        <span xid="span116">选项7</span> 
      </a> 
    </div>  
    <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-only-icon pull-left"
      label="button" xid="scrollRightBtn" icon="icon-chevron-right" onClick="scrollRightBtnClick"
      style="color:#000000;"> 
      <i xid="i25" class="icon-chevron-right"/>  
      <span xid="span73"/> 
    </a>  
    <div component="$UI/system/components/justep/contents/contents" class="x-contents x-full"
      active="0" xid="contents15" style="height:192px;top:5790px"> 
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
          xid="row23"> 
          <div class="x-col" xid="col84"> 
            <span xid="span125">内容4</span> 
          </div> 
        </div>  
        <div component="$UI/system/components/justep/row/row" class="x-row"
          xid="row24"> 
          <div class="x-col" xid="col81"> 
            <span xid="span123">内容4</span> 
          </div> 
        </div> 
      </div>  
      <div class="x-contents-content" xid="optonContent5"> 
        <div component="$UI/system/components/justep/row/row" class="x-row"
          xid="row82"> 
          <div class="x-col" xid="col44"> 
            <span xid="span124">内容5</span> 
          </div> 
        </div>  
        <div component="$UI/system/components/justep/row/row" class="x-row"
          xid="row87"> 
          <div class="x-col" xid="col25"> 
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
            <span xid="span67">内容7</span> 
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
      <span xid="span65">title</span> 
    </div>  
    <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-only-icon pull-left"
      label="button" xid="iframeScrollLeftBtn" icon="icon-chevron-left" onClick="iframeScrollLeftBtnClick"
      style="color:#000000;"> 
      <i xid="i26" class="icon-chevron-left"/>  
      <span xid="span74"/> 
    </a>  
    <div name="bb" xid="div4" style="overflow:auto;overflow-x:hidden;white-space:nowrap;background-color:#0065CA;width:300px;height:35px;"
      class="pull-left"> 
      <a component="$UI/system/components/justep/button/button" class="btn btn-link"
        label="选项1" xid="optionBtn8" target="optonContent8"> 
        <i xid="i17"/>  
        <span xid="span71">选项1</span> 
      </a>  
      <a component="$UI/system/components/justep/button/button" class="btn btn-link"
        label="选项2" xid="optionBtn9" target="optonContent9"> 
        <i xid="i16"/>  
        <span xid="span71">选项2</span> 
      </a>  
      <a component="$UI/system/components/justep/button/button" class="btn btn-link"
        label="选项3" xid="optionBtn10" target="optonContent10"> 
        <i xid="i15"/>  
        <span xid="span72">选项3</span> 
      </a>  
      <a component="$UI/system/components/justep/button/button" class="btn btn-link"
        label="选项4" xid="optionBtn11" target="optonContent11"> 
        <i xid="i14"/>  
        <span xid="span69">选项4</span> 
      </a>  
      <a component="$UI/system/components/justep/button/button" class="btn btn-link"
        label="选项5" xid="optionBtn12" target="optonContent12"> 
        <i xid="i13"/>  
        <span xid="span70">选项5</span> 
      </a>  
      <a component="$UI/system/components/justep/button/button" class="btn btn-link"
        label="选项6" xid="optionBtn13" target="optonContent13"> 
        <i xid="i12"/>  
        <span xid="span66">选项6</span> 
      </a>  
      <a component="$UI/system/components/justep/button/button" class="btn btn-link"
        label="选项7" xid="optionBtn14" target="optonContent14"> 
        <i xid="i12"/>  
        <span xid="span68">选项7</span> 
      </a> 
    </div>  
    <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-only-icon pull-left"
      label="button" xid="iframeScrollRightBtn" icon="icon-chevron-right" onClick="iframeScrollRightBtnClick"
      style="color:#000000;"> 
      <i xid="i27" class="icon-chevron-right"/>  
      <span xid="span82"/> 
    </a>  
    <div component="$UI/system/components/justep/contents/contents" class="x-contents"
      active="12" xid="contents17" style="width:100%;height:100%;" slidable="true"> 
      <div class="x-contents-content" xid="optonContent8" style="width:100%;height:100%;"> 
        <iframe xid="iframe12" frameborder="0px" src="https://www.baidu.com" style="height:100%;width:100%;"
          height="100%" width="100%" scrolling="no"/> 
      </div>  
      <div class="x-contents-content" xid="optonContent9" style="width:100%;height:100%;"> 
        <iframe src="https://www.baidu.com" xid="iframe1" height="100%" width="100%"
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
