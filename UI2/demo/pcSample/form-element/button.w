<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window" component="$UI/system/components/justep/window/window"
  design="device:pc">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:142px;top:286px;"/>  
  <div component="$UI/system/components/justep/contents/contents" class="x-contents x-full"
    active="0" xid="contents"> 
    <div class="x-contents-content" xid="content1"> 
      <h4 xid="h41"><![CDATA[各类型按钮   
    ]]><a component="$UI/system/components/justep/button/button" class="btn btn-link " label="js" xid="jsBtn" onClick="jsBtnClick">
   <i xid="i15"></i>
   <span xid="span16">js</span></a><a component="$UI/system/components/justep/button/button" class="btn btn-link" label="源码" xid="sourceBtn" bind-visible="isVisible" onClick="sourceClick"> 
        <i xid="i16" />  
        <span xid="span17">源码</span> 
      </a>
  </h4>  
        
      <div component="$UI/system/components/justep/controlGroup/controlGroup"
        class="x-control-group" title="1.各种类型按钮" xid="controlGroup1" collapsible="true"
        style="height:184px;"> 
        <div class="x-control-group-title" xid="controlGroupTitle1"> 
          <span xid="span5"/> 
        </div>  
        <div component="$UI/system/components/bootstrap/row/row" class="row"
          xid="row3"> 
          <div class="col-sm-1" xid="col1" style="width:auto;height:auto;"> 
            <a component="$UI/system/components/justep/button/button" class="btn btn-default btn-lg"
              label=" btn-lg" xid="button1"> 
              <i xid="i1"/>  
              <span xid="span2">btn-lg</span> 
            </a>  
            <a component="$UI/system/components/justep/button/button" class="btn btn-default btn-sm"
              label=" btn-sm" xid="button2"> 
              <i xid="i2"/>  
              <span xid="span3">btn-sm</span> 
            </a>  
            <a component="$UI/system/components/justep/button/button" class="btn btn-default btn-xs"
              label="btn-xs" xid="button3"> 
              <i xid="i3"/>  
              <span xid="span4">btn-xs</span> 
            </a>  
            <a component="$UI/system/components/justep/button/button" class="btn btn-success"
              label="btn-success" xid="button4"> 
              <i xid="i4"/>  
              <span xid="span6">btn-success</span> 
            </a>  
            <a component="$UI/system/components/justep/button/button" class="btn btn-primary"
              label="btn-primary" xid="button5"> 
              <i xid="i5"/>  
              <span xid="span7">btn-primary</span> 
            </a>  
            <a component="$UI/system/components/justep/button/button" class="btn btn-info"
              label="btn-info" xid="button6"> 
              <i xid="i6"/>  
              <span xid="span8">btn-info</span> 
            </a>  
            <a component="$UI/system/components/justep/button/button" class="btn btn-warning"
              label="btn-warning" xid="button7"> 
              <i xid="i7"/>  
              <span xid="span9">btn-warning</span> 
            </a>  
            <a component="$UI/system/components/justep/button/button" class="btn btn-danger"
              label="btn-danger" xid="button8"> 
              <i xid="i8"/>  
              <span xid="span10">btn-danger</span> 
            </a>  
            <a component="$UI/system/components/justep/button/button" class="btn btn-link"
              label="btn-link" xid="button9"> 
              <i xid="i9"/>  
              <span xid="span11">btn-link</span> 
            </a>  
            <a component="$UI/system/components/justep/button/button" class="btn btn-link text-success"
              label="text-success" xid="button10"> 
              <i xid="i10"/>  
              <span xid="span1">text-success</span> 
            </a>  
            <a component="$UI/system/components/justep/button/button" class="btn btn-link text-warning"
              label="text-warning" xid="button11"> 
              <i xid="i11"/>  
              <span xid="span12">text-warning</span> 
            </a>  
            <a component="$UI/system/components/justep/button/button" class="btn btn-default bg-success"
              label="bg-success" xid="button12"> 
              <i xid="i12"/>  
              <span xid="span13">bg-success</span> 
            </a>  
            <a component="$UI/system/components/justep/button/button" class="btn btn-default bg-primary"
              label="bg-primary" xid="button13"> 
              <i xid="i13"/>  
              <span xid="span14">bg-primary</span> 
            </a>  
            <a component="$UI/system/components/justep/button/button" class="btn btn-default bg-danger"
              label="bg-danger" xid="button14"> 
              <i xid="i14"/>  
              <span xid="span15">bg-danger</span> 
            </a>  
            <a component="$UI/system/components/justep/button/button" class="btn btn-default"
              label="disabled" xid="button79" disabled="true"> 
              <i xid="i79"/>  
              <span xid="span84">disabled</span> 
            </a> 
          </div> 
        </div> 
      </div>  
      <div component="$UI/system/components/justep/controlGroup/controlGroup"
        class="x-control-group" title="2.图标按钮" xid="controlGroup2" collapsible="true"
        style="height:auto;width:auto;"> 
        <div class="x-control-group-title" xid="controlGroupTitle2"> 
          <span xid="span27"/> 
        </div>  
        <div component="$UI/system/components/bootstrap/row/row" class="row"
          xid="row5"> 
          <div class="col-sm-1" xid="col3" style="height:auto;width:auto;"> 
            <a component="$UI/system/components/justep/button/button" class="btn btn-default"
              label="add" xid="button29" icon="icon-android-add"> 
              <i xid="i29" class="icon-android-add"/>  
              <span xid="span31">add</span> 
            </a>  
            <a component="$UI/system/components/justep/button/button" class="btn btn-default btn-icon-right"
              label="checkmark" xid="button30" icon="icon-android-checkmark"> 
              <i xid="i30" class="icon-android-checkmark"/>  
              <span xid="span32">checkmark</span> 
            </a>  
            <a component="$UI/system/components/justep/button/button" class="btn btn-default btn-icon-top"
              label="gear-b" xid="button32" icon="icon-gear-b"> 
              <i xid="i32" class="icon-gear-b"/>  
              <span xid="span33">gear-b</span> 
            </a>  
            <a component="$UI/system/components/justep/button/button" class="btn btn-default btn-icon-bottom"
              label="close" xid="button31" icon="icon-android-close"> 
              <i xid="i31" class="icon-android-close"/>  
              <span xid="span34">close</span> 
            </a>  
            <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-top"
              label="button" xid="button36" icon="icon-android-contact"> 
              <i xid="i36" class="icon-android-contact"/>  
              <span xid="span35"/> 
            </a>  
            <a component="$UI/system/components/justep/button/button" class="btn btn-default btn-only-icon"
              label="button" xid="button33" icon="icon-android-call"> 
              <i xid="i34" class="icon-android-call"/>  
              <span xid="span36"/> 
            </a>  
            <span xid="span47" style="height:auto;width:auto;"><![CDATA[图标可以使用工具自带的也可以使用自定义图片,可以选择图标在文字的上下左右任何一个位置，也可以选择只显示图标]]> </span> 
          </div> 
        </div> 
      </div>  
      <div component="$UI/system/components/justep/controlGroup/controlGroup"
        class="x-control-group" title="3.动态生成按钮" xid="controlGroup3" collapsible="true"
        style="height:169px;"> 
        <div class="x-control-group-title" xid="controlGroupTitle3"> 
          <span xid="span61"/> 
        </div>  
        <div class="form-horizontal container-fluid" component="$UI/system/components/bootstrap/form/form(bootstrap)"
          xid="div2"> 
          <div class="form-group" xid="formGroup3" style="width:auto;height:auto;"> 
            <div component="$UI/system/components/justep/row/row" class="x-row"
              xid="row2"> 
              <div class="col-sm-6" xid="col4" style="width:auto;height:auto;"/> 
            </div>  
            <div component="$UI/system/components/justep/row/row" class="x-row"
              xid="row1"> 
              <div class="col-sm-6" xid="col5" style="width:auto;height:auto;"/> 
            </div> 
          </div> 
        </div>  
        <div component="$UI/system/components/bootstrap/row/row" class="row"
          xid="row6"> 
          <div class="col col-xs-6" xid="addDefaultBtn"> 
            <a component="$UI/system/components/justep/button/button" class="btn btn-default"
              label="动态生成按钮" xid="addBtn" onClick="addBtnClick"> 
              <i xid="i61"/>  
              <span xid="span65">动态生成按钮</span> 
            </a> 
          </div>  
          <div class="col col-xs-6" xid="addiconBtn"> 
            <a component="$UI/system/components/justep/button/button" class="btn btn-default"
              label="动态生成图标按钮" xid="addIconBtn" onClick="addIconBtnClick"> 
              <i xid="i62"/>  
              <span xid="span66">动态生成图标按钮</span> 
            </a> 
          </div> 
        </div> 
      </div>  
      <div component="$UI/system/components/justep/controlGroup/controlGroup"
        class="x-control-group" title="4.toggle模式" xid="controlGroup4" collapsible="true"
        style="height:308px;"> 
        <div class="x-control-group-title" xid="controlGroupTitle4"> 
          <span xid="span78"/> 
        </div>  
        <div class="form-horizontal container-fluid" component="$UI/system/components/bootstrap/form/form(bootstrap)"
          xid="div3"> 
          <div class="form-group" xid="formGroup4" style="width:auto;height:auto;"/> 
        </div>  
        <div component="$UI/system/components/bootstrap/row/row" class="row"
          xid="row7"> 
          <div class="col-sm-1" xid="col12" style="width:auto;height:auto;"> 
            <span component="$UI/system/components/justep/button/toggle" class="x-toggle"
              xid="toggleValue" name="toggle" value="0" checkedValue="1" checked="true"/>  
            <a component="$UI/system/components/justep/button/button" class="btn btn-link"
              label="获取值" xid="toggleBtn" onClick="toggleBtnClick"> 
              <i xid="i77"/>  
              <span xid="span82">获取值</span> 
            </a> 
          </div>  
          <div class="col-sm-1" xid="col13" style="width:auto;height:auto;"> 
            <span component="$UI/system/components/justep/button/toggle" class="x-toggle text-success"
              xid="toggleVal" value="1" checkedValue="0" ON="开" OFF="关"/>  
            <a component="$UI/system/components/justep/button/button" class="btn btn-link"
              label="获取值" xid="buttonToggle" onClick="buttonToggleClick"> 
              <i xid="i78"/>  
              <span xid="span83">获取值</span> 
            </a> 
          </div> 
        </div> 
      </div> 
    </div> 
  </div> 
</div>
