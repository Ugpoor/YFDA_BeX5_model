<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window" component="$UI/system/components/justep/window/window"
  design="device:pc">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:350px;top:1271px;"> 
    <div component="$UI/system/components/justep/data/data" autoLoad="true"
      xid="statusData" idColumn="status"> 
      <column label="状态" name="status" type="String" xid="xid1"/>  
      <data xid="default1">[{"status":"0"}]</data>
    </div>  
    <div component="$UI/system/components/justep/data/data" autoLoad="true"
      xid="contentData" idColumn="status">
      <column label="状态" name="status" type="String" xid="xid2"/>  
      <data xid="default2">[{"status":"0"}]</data>
    </div>  
    <div component="$UI/system/components/justep/data/data" autoLoad="true"
      xid="cityData" idColumn="fName">
      <column label="内容" name="fName" type="String" xid="xid3"/>  
      <data xid="default3">[{"fName":"北京"},{"fName":"天津"},{"fName":"上海"},{"fName":"重庆"},{"fName":"河北"},{"fName":"河南"},{"fName":"云南"},{"fName":"辽宁"},{"fName":"黑龙江"},{"fName":"湖南"},{"fName":"安徽"},{"fName":"山东"},{"fName":"新疆"},{"fName":"江苏"},{"fName":"浙江"},{"fName":"江西"},{"fName":"湖北"},{"fName":"广西"},{"fName":"甘肃"},{"fName":"山西"},{"fName":"内蒙古"},{"fName":"陕西"},{"fName":"吉林"},{"fName":"福建"},{"fName":"贵州"},{"fName":"广东"},{"fName":"青海"},{"fName":"西藏"},{"fName":"四川"},{"fName":"宁夏"},{"fName":"海南"},{"fName":"台湾"},{"fName":"香港"},{"fName":"澳门"},{"fName":"钓鱼岛"}]</data>
    </div>  
    <div component="$UI/system/components/justep/data/data" autoLoad="true"
      xid="areaData" idColumn="fName">
      <column label="name" name="fName" type="String" xid="xid4"/>  
      <data xid="default4">[{"fName":"-----请选择-------"},{"fName":"朝阳区"},{"fName":"海淀区"},{"fName":"东城区"},{"fName":"石景山区"},{"fName":"丰台区"},{"fName":"宣武区"},{"fName":"崇文区"},{"fName":"顺义区"},{"fName":"怀柔区"},{"fName":"密云县"},{"fName":"延庆县"},{"fName":"昌平区"},{"fName":"平谷区"},{"fName":"门沟区"},{"fName":"房山区"},{"fName":"通州区"}]</data>
    </div>  
    <div component="$UI/system/components/justep/data/data" autoLoad="true"
      xid="selectData" idColumn="fCity">
      <column label="城市" name="fCity" type="String" xid="xid5"/>  
      <column label="区域" name="fArea" type="String" xid="xid7"/>  
      <column label="是否显示" name="fStatus" type="String" xid="xid6"/>  
      <data xid="default5">[{"fCity":"----请选择-----","fArea":"","fStatus":"0"}]</data>
    </div> 
  </div>  
  <a component="$UI/system/components/justep/button/button" class="btn btn-link"
    label="js" xid="js" onClick="jsClick"> 
    <i xid="i22"/>  
    <span xid="span26">js</span>
    <a component="$UI/system/components/justep/button/button" class="btn btn-link "
      label="源码" xid="source" onClick="sourceClick"> 
      <i xid="ii29"/>  
      <span xid="span900">源码</span>
    </a>
  </a>
  <div component="$UI/system/components/justep/controlGroup/controlGroup" class="x-control-group"
    title="1.白色背景模式" xid="controlGroup1"> 
    <div class="x-control-group-title" xid="controlGroupTitle1"> 
      <span xid="span1"><![CDATA[1.白色背景模式]]></span> 
    </div>  
    <label xid="label1"><![CDATA[鼠标经过时弹出菜单，设置按钮的class属性过得想要的效果]]></label>  
    <div component="$UI/system/components/justep/row/row" class="x-row" xid="row1"> 
      <div class="x-col" xid="col1"> 
        <div class="dropdown btn-group dropdown-hover" component="$UI/system/components/bootstrap/dropdown/dropdown"
          xid="dropdown1" autoHideMenu="true"> 
          <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-right btn-only-label dropdown-toggle"
            label="选择" icon="icon-arrow-down-b" xid="button2"> 
            <i class="icon-arrow-down-b" xid="i1"/>  
            <span xid="span8">选择</span> 
          </a>  
          <ul component="$UI/system/components/justep/menu/menu" class="x-menu dropdown-menu"
            xid="menu"> 
            <li class="x-menu-item" xid="item1"> 
              <a component="$UI/system/components/justep/button/button" class="btn btn-link"
                xid="button3" label="状态"> 
                <i xid="i2"/>  
                <span xid="span9">状态</span> 
              </a> 
            </li>  
            <li class="x-menu-item" xid="item2"> 
              <a component="$UI/system/components/justep/button/button" class="btn btn-link"
                label="分享" xid="button4"> 
                <i xid="i3"/>  
                <span xid="span10">分享</span> 
              </a> 
            </li>  
            <li class="x-menu-item" xid="item3"> 
              <a component="$UI/system/components/justep/button/button" class="btn btn-link"
                label="相册" xid="button5"> 
                <i xid="i4"/>  
                <span xid="span11">相册</span> 
              </a> 
            </li>  
            <li class="x-menu-item" xid="item4"> 
              <a component="$UI/system/components/justep/button/button" class="btn btn-link"
                label="日志" xid="button6"> 
                <i xid="i5"/>  
                <span xid="span12">日志</span> 
              </a> 
            </li> 
          </ul> 
        </div> 
      </div> 
    </div> 
  </div>  
  <div component="$UI/system/components/justep/controlGroup/controlGroup" class="x-control-group"
    title="2.自定义尺寸" xid="controlGroup2"> 
    <div class="x-control-group-title" xid="controlGroupTitle2"> 
      <span xid="span7"><![CDATA[]]></span> 
    </div>  
    <label xid="label2"><![CDATA[导航的大小会随着你写入字的多少自适应，如需自定义，需自己添加CSS样式]]></label>  
    <div component="$UI/system/components/justep/row/row" class="x-row" xid="row2"> 
      <div class="x-col" xid="col4"> 
        <div class="dropdown btn-group " component="$UI/system/components/bootstrap/dropdown/dropdown"
          xid="dropdown2" autoHideMenu="true"> 
          <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-right dropdown-toggle"
            label="全部操作" icon="icon-arrow-down-b" xid="button9" style="border-width:thin thin thin thin;"> 
            <i class="icon-arrow-down-b" xid="i10"/>  
            <span xid="span5">全部操作</span> 
          </a>  
          <ul component="$UI/system/components/justep/menu/menu" class="x-menu dropdown-menu"
            xid="menu1"> 
            <li class="x-menu-item" xid="item6"> 
              <a component="$UI/system/components/justep/button/button" class="btn btn-link"
                xid="button10" label="状态"> 
                <i xid="i9"/>  
                <span xid="span6">状态</span> 
              </a> 
            </li>  
            <li class="x-menu-item" xid="item5"> 
              <a component="$UI/system/components/justep/button/button" class="btn btn-link"
                label="分享" xid="button7"> 
                <i xid="i8"/>  
                <span xid="span4">分享</span> 
              </a> 
            </li>  
            <li class="x-menu-item" xid="item8"> 
              <a component="$UI/system/components/justep/button/button" class="btn btn-link"
                label="相册" xid="button8"> 
                <i xid="i7"/>  
                <span xid="span3">相册</span> 
              </a> 
            </li>  
            <li class="x-menu-item" xid="item7"> 
              <a component="$UI/system/components/justep/button/button" class="btn btn-link"
                label="日志" xid="button1"> 
                <i xid="i6"/>  
                <span xid="span2">日志</span> 
              </a> 
            </li> 
          </ul> 
        </div> 
      </div> 
    </div> 
  </div>  
  <div component="$UI/system/components/justep/controlGroup/controlGroup" class="x-control-group"
    title="3.图片背景模式" xid="controlGroup3"> 
    <div class="x-control-group-title" xid="controlGroupTitle3"> 
      <span xid="span14"><![CDATA[3.图片背景模式]]></span> 
    </div>  
    <label xid="label3"><![CDATA[调整dropdown组件下的组件属性调整背景颜色]]></label>  
    <div component="$UI/system/components/justep/row/row" class="x-row" xid="row3"> 
      <div class="x-col" xid="col2"> 
        <div class="dropdown btn-group" component="$UI/system/components/bootstrap/dropdown/dropdown"
          xid="dropdown3" autoHideMenu="true"> 
          <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-right dropdown-toggle"
            label="选择" icon="icon-arrow-down-b" xid="button13"> 
            <i class="icon-arrow-down-b" xid="i12"/>  
            <span xid="span16">选择</span> 
          </a>  
          <ul component="$UI/system/components/justep/menu/menu" class="x-menu bg-info dropdown-menu"
            xid="menu2"> 
            <li class="x-menu-item bg-success" xid="item9"> 
              <a component="$UI/system/components/justep/button/button" class="btn btn-link"
                xid="button12" label="状态"> 
                <i xid="i11"/>  
                <span xid="span13">状态</span> 
              </a> 
            </li>  
            <li class="x-menu-item bg-info" xid="item10"> 
              <a component="$UI/system/components/justep/button/button" class="btn btn-link"
                label="分享" xid="button14"> 
                <i xid="i13"/>  
                <span xid="span15">分享</span> 
              </a> 
            </li>  
            <li class="x-menu-item" xid="item11"> 
              <a component="$UI/system/components/justep/button/button" class="btn btn-link"
                label="相册" xid="button11"> 
                <i xid="i14"/>  
                <span xid="span18">相册</span> 
              </a> 
            </li>  
            <li class="x-menu-item" xid="item12"> 
              <a component="$UI/system/components/justep/button/button" class="btn btn-link"
                label="日志" xid="button15"> 
                <i xid="i15"/>  
                <span xid="span17">日志</span> 
              </a> 
            </li> 
          </ul> 
        </div> 
      </div> 
    </div> 
  </div>  
  <div component="$UI/system/components/justep/controlGroup/controlGroup" class="x-control-group"
    title="4.图标模式" xid="controlGroup4"> 
    <div class="x-control-group-title" xid="controlGroupTitle4"> 
      <span xid="span21">3.图片背景模式</span> 
    </div>  
    <label xid="label4"><![CDATA[调整按钮的icon添加自己想要的图标]]></label>  
    <div component="$UI/system/components/justep/row/row" class="x-row" xid="row4"> 
      <div class="x-col" xid="col3"> 
        <div class="dropdown btn-group " component="$UI/system/components/bootstrap/dropdown/dropdown"
          xid="dropdown4" autoHideMenu="true"> 
          <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-right dropdown-toggle"
            label="操作" icon="icon-arrow-down-b" xid="button18"> 
            <i class="icon-arrow-down-b" xid="i19"/>  
            <span xid="span19">操作</span> 
          </a>  
          <ul component="$UI/system/components/justep/menu/menu" class="x-menu bg-info dropdown-menu"
            xid="menu3"> 
            <li class="x-menu-item" xid="item16"> 
              <a component="$UI/system/components/justep/button/button" class="btn btn-link"
                xid="button17" label="新增" icon="icon-android-add"> 
                <i xid="i18" class="icon-android-add"/>  
                <span xid="span22">新增</span> 
              </a> 
            </li>  
            <li class="x-menu-item" xid="item13"> 
              <a component="$UI/system/components/justep/button/button" class="btn btn-link"
                label="修改" xid="button19" icon="icon-compose"> 
                <i xid="i20" class="icon-compose"/>  
                <span xid="span20">修改</span> 
              </a> 
            </li>  
            <li class="x-menu-item" xid="item14"> 
              <a component="$UI/system/components/justep/button/button" class="btn btn-link"
                label="删除" xid="button16" icon="icon-android-close"> 
                <i xid="i16" class="icon-android-close"/>  
                <span xid="span24">删除</span> 
              </a> 
            </li>  
            <li class="x-menu-item" xid="item15"> 
              <a component="$UI/system/components/justep/button/button" class="btn btn-link"
                label="查看" xid="button20" icon="icon-android-note"> 
                <i xid="i17" class="icon-android-note"/>  
                <span xid="span23">查看</span> 
              </a> 
            </li> 
          </ul> 
        </div> 
      </div> 
    </div> 
  </div>  
  <div component="$UI/system/components/justep/controlGroup/controlGroup" class="x-control-group"
    title="5.多列模式" xid="controlGroup5"> 
    <div class="x-control-group-title" xid="controlGroupTitle6"> 
      <span xid="span31">title</span> 
    </div>  
    <label xid="label6">调整按钮的icon添加自己想要的图标</label>  
    <div component="$UI/system/components/justep/row/row" class="x-row" xid="row7"> 
      <div class="x-col" xid="col7"> 
        <a component="$UI/system/components/justep/button/button" class="btn btn-link test"
          label="操作" xid="multiseriateBtn" bind-mouseover="multiseriateBtnMouseover"> 
          <i xid="i68"/>  
          <span xid="span74">操作</span> 
        </a> 
      </div> 
    </div>  
    <div xid="multiseriateDiv" bind-mouseleave="multiseriateDivMouseleave"
      bind-visible=" $model.statusData.val(&quot;status&quot;)==1" style="height:200px;width:500px;">
      <div component="$UI/system/components/justep/row/row" class="x-row" xid="menuRow1"> 
        <div class="x-col" xid="col6"> 
          <ul component="$UI/system/components/justep/menu/menu" class="x-menu"
            xid="menu7"> 
            <li class="x-menu-item bg-success" xid="item55"> 
              <a component="$UI/system/components/justep/button/button" class="btn btn-link"
                label="分类1" xid="button62"> 
                <i xid="i62"/>  
                <span xid="span68">分类1</span> 
              </a> 
            </li>  
            <li class="x-menu-item" xid="item27"> 
              <a component="$UI/system/components/justep/button/button" class="btn btn-link"
                label="选项一" xid="button34"> 
                <i xid="i34"/>  
                <span xid="span40">选项一</span> 
              </a> 
            </li>  
            <li class="x-menu-item" xid="item28"> 
              <a component="$UI/system/components/justep/button/button" class="btn btn-link"
                label="选项二" xid="button35"> 
                <i xid="i35"/>  
                <span xid="span41">选项二</span> 
              </a> 
            </li>  
            <li class="x-menu-item" xid="item29"> 
              <a component="$UI/system/components/justep/button/button" class="btn btn-link"
                label="选项三" xid="button36"> 
                <i xid="i36"/>  
                <span xid="span42">选项三</span> 
              </a> 
            </li>  
            <li class="x-menu-item" xid="item30"> 
              <a component="$UI/system/components/justep/button/button" class="btn btn-link"
                label="选项四" xid="button37"> 
                <i xid="i37"/>  
                <span xid="span43">选项四</span> 
              </a> 
            </li> 
          </ul> 
        </div>  
        <div class="x-col" xid="col10"> 
          <ul component="$UI/system/components/justep/menu/menu" class="x-menu"
            xid="menu8"> 
            <li class="x-menu-item bg-success" xid="item56"> 
              <a component="$UI/system/components/justep/button/button" class="btn btn-link"
                label="分类2" xid="button63"> 
                <i xid="i63"/>  
                <span xid="span69">分类2</span> 
              </a> 
            </li>  
            <li class="x-menu-item" xid="item32"> 
              <a component="$UI/system/components/justep/button/button" class="btn btn-link"
                label="选项一" xid="button41"> 
                <i xid="i39"/>  
                <span xid="span46">选项一</span> 
              </a> 
            </li>  
            <li class="x-menu-item" xid="item31"> 
              <a component="$UI/system/components/justep/button/button" class="btn btn-link"
                label="选项二" xid="button40"> 
                <i xid="i38"/>  
                <span xid="span47">选项二</span> 
              </a> 
            </li>  
            <li class="x-menu-item" xid="item33"> 
              <a component="$UI/system/components/justep/button/button" class="btn btn-link"
                label="选项三" xid="button39"> 
                <i xid="i41"/>  
                <span xid="span44">选项三</span> 
              </a> 
            </li>  
            <li class="x-menu-item" xid="item34"> 
              <a component="$UI/system/components/justep/button/button" class="btn btn-link"
                label="选项四" xid="button38"> 
                <i xid="i40"/>  
                <span xid="span45">选项四</span> 
              </a> 
            </li> 
          </ul> 
        </div>  
        <div class="x-col" xid="col11"> 
          <ul component="$UI/system/components/justep/menu/menu" class="x-menu"
            xid="menu9"> 
            <li class="x-menu-item bg-success" xid="item57"> 
              <a component="$UI/system/components/justep/button/button" class="btn btn-link"
                label="分类31" xid="button64"> 
                <i xid="i64"/>  
                <span xid="span70">分类31</span> 
              </a> 
            </li>  
            <li class="x-menu-item" xid="item36"> 
              <a component="$UI/system/components/justep/button/button" class="btn btn-link"
                label="选项一" xid="button45"> 
                <i xid="i43"/>  
                <span xid="span50">选项一</span> 
              </a> 
            </li>  
            <li class="x-menu-item" xid="item35"> 
              <a component="$UI/system/components/justep/button/button" class="btn btn-link"
                label="选项二" xid="button44"> 
                <i xid="i42"/>  
                <span xid="span51">选项二</span> 
              </a> 
            </li>  
            <li class="x-menu-item" xid="item37"> 
              <a component="$UI/system/components/justep/button/button" class="btn btn-link"
                label="选项三" xid="button43"> 
                <i xid="i45"/>  
                <span xid="span48">选项三</span> 
              </a> 
            </li>  
            <li class="x-menu-item" xid="item38"> 
              <a component="$UI/system/components/justep/button/button" class="btn btn-link"
                label="选项四" xid="button42"> 
                <i xid="i44"/>  
                <span xid="span49">选项四</span> 
              </a> 
            </li> 
          </ul> 
        </div> 
      </div>
      <div component="$UI/system/components/justep/row/row" class="x-row" xid="menuRow2"> 
        <div class="x-col" xid="col14"> 
          <ul component="$UI/system/components/justep/menu/menu" class="x-menu"
            xid="menu13"> 
            <li class="x-menu-item bg-success" xid="item58"> 
              <a component="$UI/system/components/justep/button/button" class="btn btn-link"
                label="分类4" xid="button65"> 
                <i xid="i65"/>  
                <span xid="span71">分类4</span> 
              </a> 
            </li>  
            <li class="x-menu-item" xid="item54"> 
              <a component="$UI/system/components/justep/button/button" class="btn btn-link"
                label="选项一" xid="button58"> 
                <i xid="i61"/>  
                <span xid="span67">选项一</span> 
              </a> 
            </li>  
            <li class="x-menu-item" xid="item53"> 
              <a component="$UI/system/components/justep/button/button" class="btn btn-link"
                label="选项二" xid="button59"> 
                <i xid="i60"/>  
                <span xid="span66">选项二</span> 
              </a> 
            </li>  
            <li class="x-menu-item" xid="item51"> 
              <a component="$UI/system/components/justep/button/button" class="btn btn-link"
                label="选项三" xid="button60"> 
                <i xid="i59"/>  
                <span xid="span64">选项三</span> 
              </a> 
            </li>  
            <li class="x-menu-item" xid="item52"> 
              <a component="$UI/system/components/justep/button/button" class="btn btn-link"
                label="选项四" xid="button61"> 
                <i xid="i58"/>  
                <span xid="span65">选项四</span> 
              </a> 
            </li> 
          </ul> 
        </div>  
        <div class="x-col" xid="col12"> 
          <ul component="$UI/system/components/justep/menu/menu" class="x-menu"
            xid="menu10"> 
            <li class="x-menu-item bg-success" xid="item59"> 
              <a component="$UI/system/components/justep/button/button" class="btn btn-link"
                label="分类5" xid="button66"> 
                <i xid="i66"/>  
                <span xid="span72">分类5</span> 
              </a> 
            </li>  
            <li class="x-menu-item" xid="item47"> 
              <a component="$UI/system/components/justep/button/button" class="btn btn-link"
                label="选项一" xid="button47"> 
                <i xid="i56"/>  
                <span xid="span60">选项一</span> 
              </a> 
            </li>  
            <li class="x-menu-item" xid="item48"> 
              <a component="$UI/system/components/justep/button/button" class="btn btn-link"
                label="选项二" xid="button46"> 
                <i xid="i57"/>  
                <span xid="span61">选项二</span> 
              </a> 
            </li>  
            <li class="x-menu-item" xid="item46"> 
              <a component="$UI/system/components/justep/button/button" class="btn btn-link"
                label="选项三" xid="button52"> 
                <i xid="i47"/>  
                <span xid="span54">选项三</span> 
              </a> 
            </li>  
            <li class="x-menu-item" xid="item45"> 
              <a component="$UI/system/components/justep/button/button" class="btn btn-link"
                label="选项四" xid="button53"> 
                <i xid="i48"/>  
                <span xid="span55">选项四</span> 
              </a> 
            </li> 
          </ul> 
        </div>  
        <div class="x-col" xid="col13"> 
          <ul component="$UI/system/components/justep/menu/menu" class="x-menu"
            xid="menu12"> 
            <li class="x-menu-item bg-success" xid="item60"> 
              <a component="$UI/system/components/justep/button/button" class="btn btn-link"
                label="分类6" xid="button67"> 
                <i xid="i67"/>  
                <span xid="span73">分类6</span> 
              </a> 
            </li>  
            <li class="x-menu-item" xid="item43"> 
              <a component="$UI/system/components/justep/button/button" class="btn btn-link"
                label="选项一" xid="button50"> 
                <i xid="i51"/>  
                <span xid="span52">选项一</span> 
              </a> 
            </li>  
            <li class="x-menu-item" xid="item44"> 
              <a component="$UI/system/components/justep/button/button" class="btn btn-link"
                label="选项二" xid="button51"> 
                <i xid="i46"/>  
                <span xid="span53">选项二</span> 
              </a> 
            </li>  
            <li class="x-menu-item" xid="item42"> 
              <a component="$UI/system/components/justep/button/button" class="btn btn-link"
                label="选项三" xid="button48"> 
                <i xid="i49"/>  
                <span xid="span58">选项三</span> 
              </a> 
            </li>  
            <li class="x-menu-item" xid="item50"> 
              <a component="$UI/system/components/justep/button/button" class="btn btn-link"
                label="选项四" xid="button49"> 
                <i xid="i50"/>  
                <span xid="span59">选项四</span> 
              </a> 
            </li> 
          </ul> 
        </div> 
      </div>
    </div> 
  </div>  
  <div xid="div3" style="height:200px;"/>  
  <div component="$UI/system/components/justep/controlGroup/controlGroup" class="x-control-group"
    title="6.自定义菜单示例(仿人人网)" xid="controlGroup6"> 
    <div class="x-control-group-title" xid="controlGroupTitle7"> 
      <span xid="span75">title</span>
    </div>  
    <div class="media" xid="contentDiv" bind-mouseover="contentDivMouseover"
      bind-mouseleave="contentDivMouseleave"> 
      <div xid="div5" class="media-left"> 
        <img src="$UI/demo/sample/navigator/img/1.jpg" alt="" xid="image1"
          style="height:83px;width:110px;" class="img-rounded"/>
      </div>  
      <div xid="div6" class="media-body"> 
        <div xid="menuDiv" bind-visible=" $model.contentData.val(&quot;status&quot;)==1">
          <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-sm pull-right"
            xid="deleteBtn" icon="icon-android-close"> 
            <i xid="i71" class="icon-android-close"/>  
            <span xid="span79"/>
          </a>  
          <div class="dropdown pull-right btn-group dropdown-hover" component="$UI/system/components/bootstrap/dropdown/dropdown"
            xid="dropdown5" autoHideMenu="true"> 
            <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-right btn-only-icon dropdown-toggle"
              icon="icon-arrow-down-b" xid="button28"> 
              <i class="icon-arrow-down-b" xid="i29"/>  
              <span xid="span33"/>
            </a>  
            <ul component="$UI/system/components/justep/menu/menu" class="x-menu dropdown-menu"
              xid="menu6"> 
              <li class="x-menu-item" xid="item20"> 
                <a component="$UI/system/components/justep/button/button"
                  class="btn btn-link" xid="button29" label="关注"> 
                  <i xid="i28"/>  
                  <span xid="span34">关注</span>
                </a> 
              </li>  
              <li class="x-menu-item" xid="item19"> 
                <a component="$UI/system/components/justep/button/button"
                  class="btn btn-link" label="忽略" xid="button26"> 
                  <i xid="i27"/>  
                  <span xid="span32">忽略</span>
                </a> 
              </li> 
            </ul> 
          </div>
        </div>  
        <span xid="span36"><![CDATA[这雨下的好啊 ,小菜园不用浇水了]]></span>
      </div> 
    </div>  
    <div class="media" xid="div7" bind-mouseover="contentDivMouseover" bind-mouseleave="contentDivMouseleave"> 
      <div xid="div9" class="media-left"> 
        <img src="$UI/demo/sample/navigator/img/1.jpg" alt="" xid="image2"
          style="height:83px;width:110px;" class="img-rounded"/>
      </div>  
      <div xid="div8" class="media-body"> 
        <div xid="div4" bind-visible=" $model.contentData.val(&quot;status&quot;)==1"> 
          <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-sm pull-right"
            xid="button33" icon="icon-android-close"> 
            <i xid="i30" class="icon-android-close"/>  
            <span xid="span57"/>
          </a>  
          <div class="dropdown pull-right btn-group dropdown-hover" component="$UI/system/components/bootstrap/dropdown/dropdown"
            xid="dropdown6" autoHideMenu="true"> 
            <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-right btn-only-icon dropdown-toggle"
              icon="icon-arrow-down-b" xid="button31"> 
              <i class="icon-arrow-down-b" xid="i31"/>  
              <span xid="span39"/>
            </a>  
            <ul component="$UI/system/components/justep/menu/menu" class="x-menu dropdown-menu"
              xid="menu11"> 
              <li class="x-menu-item" xid="item24"> 
                <a component="$UI/system/components/justep/button/button"
                  class="btn btn-link" xid="button32" label="关注"> 
                  <i xid="i33"/>  
                  <span xid="span56">关注</span>
                </a> 
              </li>  
              <li class="x-menu-item" xid="item23"> 
                <a component="$UI/system/components/justep/button/button"
                  class="btn btn-link" label="忽略" xid="button30"> 
                  <i xid="i32"/>  
                  <span xid="span38">忽略</span>
                </a> 
              </li> 
            </ul> 
          </div> 
        </div>  
        <span xid="span37">这雨下的好啊 ,小菜园不用浇水了</span> 
      </div> 
    </div> 
  </div>  
  <div component="$UI/system/components/justep/controlGroup/controlGroup" class="x-control-group"
    title="7.自定义菜单示例(仿京东网)" xid="controlGroup7"> 
    <div class="x-control-group-title" xid="controlGroupTitle5"> 
      <span xid="span62">title</span>
    </div>  
    <div xid="selectDiv" bind-mouseover="selectDivMouseover" bind-mouseleave="selectDivMouseleave"> 
      <div component="$UI/system/components/justep/row/row" class="x-row" xid="row5"
        style="width:200px;"> 
        <div class="x-col x-col-fixed" xid="col5"> 
          <div class="x-edit" xid="div18" style="width:auto;"> 
            <div class="input-group" xid="div"> 
              <div component="$UI/system/components/justep/output/output" class="x-output form-control"
                xid="output3" bind-text=" $model.selectData.val(&quot;fCity&quot;) + $model.selectData.val(&quot;fArea&quot;)"/>
              <span class="input-group-btn" xid="span84"> 
                <a component="$UI/system/components/justep/button/button"
                  class="btn btn-default" icon="icon-arrow-down-b" xid="button72"> 
                  <i class="icon-arrow-down-b" xid="i75"/>
                </a>
              </span> 
            </div> 
          </div>
        </div>
      </div>
      <div component="$UI/system/components/justep/row/row" class="x-row" xid="row6"> 
        <div class="x-col x-col-fixed" xid="col8" style="width:auto;">
          <div xid="div10" bind-visible=" $model.selectData.val(&quot;fStatus&quot;)==1">
            <select component="$UI/system/components/justep/select/select" class="form-control pull-left"
              SIZE="10" xid="citySelect" bind-options="cityData" bind-optionsValue="fName"
              style="width:100px;" onChange="citySelectChange"/>  
            <select component="$UI/system/components/justep/select/select" class="form-control pull-left"
              SIZE="10" xid="areaSelect" bind-options="areaData" bind-optionsValue="fName"
              style="width:100px;" onChange="areaSelectChange"/> 
          </div>
        </div> 
      </div> 
    </div>
  </div>  
  <div xid="div2" style="height:200px;"/>  
  <div component="$UI/system/components/justep/popMenu/popMenu" class="x-popMenu "
    xid="popMenu" anchor="Btn"> 
    <div class="x-popMenu-overlay" xid="div14"/>  
    <ul component="$UI/system/components/justep/menu/menu" class="x-menu dropdown-menu x-popMenu-content"
      xid="menu16">
      <li class="x-menu-item" xid="item39"> 
        <a component="$UI/system/components/justep/button/button" class="btn btn-link"
          xid="button55" label="状态"> 
          <i xid="i54"/>  
          <span xid="span77">状态</span>
        </a> 
      </li>  
      <li class="x-menu-item" xid="item40"> 
        <a component="$UI/system/components/justep/button/button" class="btn btn-link"
          label="相册" xid="button56"> 
          <i xid="i55"/>  
          <span xid="span78">相册</span>
        </a> 
      </li>
    </ul>
  </div>
  <div component="$UI/system/components/justep/controlGroup/controlGroup" class="x-control-group"
    title="8.动态添加" xid="controlGroup8" style="height:404px;"> 
    <div class="x-control-group-title" xid="controlGroupTitle8"> 
      <span xid="span25">title</span>
    </div>  
    <a component="$UI/system/components/justep/button/button" class="btn btn-link"
      label="点击生成" xid="creatBtn" onClick="creatBtnClick"> 
      <i xid="i21"/>  
      <span xid="span27">点击生成</span>
    </a> 
  </div>
</div>
