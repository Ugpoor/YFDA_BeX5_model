<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window" component="$UI/system/components/justep/window/window"
  design="device:pc">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:162px;top:181px;">
    <div component="$UI/system/components/justep/data/data" autoLoad="true"
      xid="selectData" idColumn="options">
      <column name="options" type="String" xid="xid2"/>  
      <data xid="default1">[{"options":"请选择"},{"options":"类型1"},{"options":"类型2"},{"options":"类型3"}]</data>
    </div>
  </div>  
  <a component="$UI/system/components/justep/button/button" class="btn btn-link"
    label="js" xid="js" onClick="jsClick"> 
    <i xid="i1"/>  
    <span xid="span2">js</span>
  </a>
  <a component="$UI/system/components/justep/button/button" class="btn btn-link"
    label="源码" xid="source" onClick="sourceClick"> 
    <i xid="ii29"/>  
    <span xid="span900">源码</span>
  </a>
  <div component="$UI/system/components/justep/controlGroup/controlGroup" class="x-control-group"
    title="大尺寸工具栏" xid="controlGroup1"> 
    <div class="x-control-group-title" xid="controlGroupTitle1"> 
      <span xid="span1">title</span>
    </div>  
    <div component="$UI/system/components/justep/button/buttonGroup" class="btn-group btn-group-lg"
      tabbed="true" xid="buttonGroup1">
      <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-top"
        label="搜索" xid="searchBtn" icon="icon-android-search" onClick="searchBtnClick"> 
        <i xid="i2" class="icon-android-search" style="color:#80FF80;"/>  
        <span xid="span3" style="color:#000000;font-size:medium;">搜索</span>
      </a>  
      <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-top"
        label="应用" xid="applyBtn" icon="icon-social-windows-outline" onClick="applyBtnClick"> 
        <i xid="i3" class="icon-social-windows-outline" style="color:#8000FF;"/>  
        <span xid="span4" style="color:#000000;font-size:medium;">应用</span>
      </a>  
      <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-top"
        label="统计" xid="statisticsBtn" icon="icon-ios7-calculator-outline" onClick="statisticsBtnClick"> 
        <i xid="i4" class="icon-ios7-calculator-outline" style="color:#8080FF;"/>  
        <span xid="span5" style="color:#000000;font-size:medium;">统计</span>
      </a>  
      <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-top"
        label="导入" xid="toleadBtn" icon="icon-log-in" onClick="toleadBtnClick"> 
        <i xid="i5" class="icon-log-in" style="color:#00FF40;"/>  
        <span xid="span6" style="color:#000000;font-size:medium;">导入</span>
      </a>  
      <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-top"
        label="增加" xid="addBtn" icon="icon-android-add" onClick="addBtnClick"> 
        <i xid="i6" class="icon-android-add" style="color:#00FF40;"/>  
        <span xid="span7" style="color:#000000;font-size:medium;">增加</span>
      </a>  
      <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-top"
        label="删除" xid="deleteBtn" icon="icon-android-close" onClick="deleteBtnClick"> 
        <i xid="i7" class="icon-android-close" style="color:#FF0000;"/>  
        <span xid="span8" style="color:#000000;font-size:medium;">删除</span>
      </a>  
      <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-top"
        label="锁定" xid="lockBtn" icon="icon-android-locate" onClick="lockBtnClick"> 
        <i xid="i9" class="icon-android-locate" style="color:#00FF40;"/>  
        <span xid="span10" style="color:#000000;font-size:medium;">锁定</span>
      </a>  
      <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-top"
        label="导出" xid="exportBtn" icon="icon-log-out" onClick="exportBtnClick"> 
        <i xid="i10" class="icon-log-out" style="color:#FF0000;"/>  
        <span xid="span11" style="color:#000000;font-size:medium;">导出</span>
      </a>  
      <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-top"
        label="打印预览" xid="printpreviewBtn" icon="icon-printer" onClick="printpreviewBtnClick"> 
        <i xid="i11" class="icon-printer" style="color:#8000FF;"/>  
        <span xid="span12" style="color:#000000;font-size:medium;">打印预览</span>
      </a>  
      <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-top"
        label="打印" xid="printBtn" icon="icon-ios7-printer-outline" onClick="printBtnClick"> 
        <i xid="i12" class="icon-ios7-printer-outline" style="color:#00FF40;"/>  
        <span xid="span13" style="color:#000000;font-size:medium;">打印</span>
      </a>  
      <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-top"
        label="关于" xid="aboutBtn" icon="icon-information-circled" onClick="aboutBtnClick"> 
        <i xid="i13" class="icon-information-circled" style="color:#0000A0;"/>  
        <span xid="span14" style="color:#000000;font-size:medium;">关于</span>
      </a>
    </div> 
  </div>  
  <div component="$UI/system/components/justep/controlGroup/controlGroup" class="x-control-group"
    title="中尺寸工具栏" xid="controlGroup2"> 
    <div class="x-control-group-title" xid="controlGroupTitle2"> 
      <span xid="span15">title</span>
    </div>  
    <div component="$UI/system/components/justep/row/row" class="x-row" xid="row1"> 
      <div class="x-col x-col-fixed x-col-center" xid="col6" style="width:auto;">
        <span xid="span18"><![CDATA[请选择：]]></span>
      </div>
      <div class="x-col" xid="col1">
        <select component="$UI/system/components/justep/select/select" class="form-control"
          xid="select2" bind-options="selectData" bind-optionsValue="options"/> 
      </div>  
      <div class="x-col x-col-fixed x-col-center" xid="col7" style="width:auto;"> 
        <span xid="span19"><![CDATA[时间：]]></span>
      </div>
      <div class="x-col" xid="col2">
        <input component="$UI/system/components/justep/input/input" class="form-control"
          xid="input5" dataType="Date" format="yyyy-MM-dd"/> 
      </div>  
      <div class="x-col x-col-fixed x-col-center" xid="col8" style="width:auto;"> 
        <span xid="span20"><![CDATA[关键词：]]></span>
      </div>
      <div class="x-col" xid="col3">
        <input component="$UI/system/components/justep/input/input" class="form-control"
          xid="input6"/> 
      </div>  
      <div class="x-col x-col-fixed x-col-center" xid="col4" style="width:auto;">
        <span xid="span16"><![CDATA[全站搜索]]></span>
        <span component="$UI/system/components/justep/button/checkbox" class="x-checkbox"
          xid="checkbox1"/> 
      </div>  
      <div class="x-col x-col-center" xid="col5">
        <a component="$UI/system/components/justep/button/button" class="btn btn-link"
          label="查询" xid="button14" icon="icon-ios7-search"> 
          <i xid="i14" class="icon-ios7-search"/>  
          <span xid="span17">查询</span>
        </a>
      </div> 
    </div>
  </div>
  <div component="$UI/system/components/justep/controlGroup/controlGroup" class="x-control-group"
    title="迷你工具栏" xid="controlGroup3"> 
    <div class="x-control-group-title" xid="controlGroupTitle3"> 
      <span xid="span23"><![CDATA[迷你工具栏]]></span>
    </div>  
    <div component="$UI/system/components/justep/button/buttonGroup" class="btn-group btn-group-xs"
      tabbed="true" xid="buttonGroup2">
      <a component="$UI/system/components/justep/button/button" class="btn btn-link"
        label="查看" xid="button15" icon="icon-android-note"> 
        <i xid="i15" class="icon-android-note" style="color:#00FF40;"/>  
        <span xid="span24" style="color:#000000;">查看</span>
      </a>  
      <a component="$UI/system/components/justep/button/button" class="btn btn-link"
        label="修改" xid="button16" icon="icon-ios7-compose-outline"> 
        <i xid="i16" class="icon-ios7-compose-outline" style="color:#00FF40;"/>  
        <span xid="span25" style="color:#000000;">修改</span>
      </a>  
      <a component="$UI/system/components/justep/button/button" class="btn btn-link"
        label="增加" xid="button17" icon="icon-android-add"> 
        <i xid="i17" class="icon-android-add" style="color:#00FF40;"/>  
        <span xid="span26" style="color:#000000;">增加</span>
      </a>  
      <a component="$UI/system/components/justep/button/button" class="btn btn-link"
        label="删除" xid="button18" icon="icon-android-close"> 
        <i xid="i18" class="icon-android-close" style="color:#FF0000;"/>  
        <span xid="span27" style="color:#000000;">删除</span>
      </a>  
      <a component="$UI/system/components/justep/button/button" class="btn btn-link"
        label="查找" xid="button19" icon="icon-ios7-search"> 
        <i xid="i19" class="icon-ios7-search" style="color:#00FF40;"/>  
        <span xid="span28" style="color:#000000;">查找</span>
      </a>  
      <a component="$UI/system/components/justep/button/button" class="btn btn-link"
        label="标记" xid="button20" icon="icon-ios7-pricetag-outline"> 
        <i xid="i20" class="icon-ios7-pricetag-outline" style="color:#FF0000;"/>  
        <span xid="span29" style="color:#000000;">标记</span>
      </a>  
      <a component="$UI/system/components/justep/button/button" class="btn btn-link"
        label="取消" xid="button21" icon="icon-close-circled"> 
        <i xid="i21" class="icon-close-circled" style="color:#FF0080;"/>  
        <span xid="span30" style="color:#000000;">取消</span>
      </a>  
      <a component="$UI/system/components/justep/button/button" class="btn btn-link"
        label="打印" xid="button22" icon="icon-printer"> 
        <i xid="i22" class="icon-printer" style="color:#8000FF;"/>  
        <span xid="span31" style="color:#000000;">打印</span>
      </a>  
      <a component="$UI/system/components/justep/button/button" class="btn btn-link"
        label="刷新" xid="button23" icon="icon-loop"> 
        <i xid="i23" class="icon-loop" style="color:#00FF40;"/>  
        <span xid="span32" style="color:#000000;">刷新</span>
      </a>  
      <a component="$UI/system/components/justep/button/button" class="btn btn-link"
        label="保存" xid="button24" icon="icon-android-checkmark"> 
        <i xid="i24" class="icon-android-checkmark" style="color:#FF0080;"/>  
        <span xid="span33" style="color:#000000;">保存</span>
      </a>
    </div>
  </div>
  <span component="$UI/system/components/justep/messageDialog/messageDialog"
    xid="message" style="left:238px;top:11px;"/>
</div>
