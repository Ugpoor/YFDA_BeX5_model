<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" component="$UI/system/components/justep/window/window" design="device:m;"
  xid="window" class="window">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="left:18px;top:83px;height:244px;" onActive="modelActive"> 
    <div component="$UI/system/components/justep/data/data" autoLoad="true"
      xid="data1" idColumn="name"> 
      <column label="姓名" name="name" type="String" xid="xid1"/>  
      <column label="年龄" name="age" type="String" xid="xid2"/>  
      <data xid="default1">[{"name":"张三","age":21},{"name":"李四","age":22}]</data> 
    </div> 
  </div>  
    <span component="$UI/system/components/justep/windowDialog/windowDialog" xid="dialog"
    src="./dialog.w" onReceive="dialogReceive" onClose="dialogClose" style="left:46px;top:14px;" routable="true">
    <result concept="data1" operation="edit" origin="dlgData" xid="default30"> 
      <mapping from="name" to="name" locator="true" xid="default31"/>  
      <mapping from="age" to="age" xid="default32"/>
    </result>
  </span>  
  <div component="$UI/system/components/justep/panel/panel" class="x-panel x-full"
    xid="panel1"> 
    <div class="x-panel-top" xid="top1"> 
      <div component="$UI/system/components/justep/titleBar/titleBar" title="WeX5页面间交互"
        class="x-titlebar"> 
        <div class="x-titlebar-left"> 
          <a component="$UI/system/components/justep/button/button" label=""
            class="btn btn-link btn-only-icon" icon="icon-chevron-left" onClick="{operation:'window.close'}"
            xid="backBtn"> 
            <i class="icon-chevron-left"/>  
            <span/> 
          </a> 
        </div>  
        <div class="x-titlebar-title">WeX5页面间交互</div>  
        <div class="x-titlebar-right reverse"/> 
      </div> 
    </div>  
    <div class="x-panel-content" xid="content1"> 
      <div component="$UI/system/components/justep/contents/contents" class="x-contents x-full"
        active="0" xid="contents1"> 
        <div class="x-contents-content container" xid="shellContent"> 
          <div component="$UI/system/components/justep/button/buttonGroup"
            class="btn-group btn-group-justified" tabbed="true" xid="buttonGroup2"> 
            <a component="$UI/system/components/justep/button/button" class="btn btn-default"
              label="使用页面标识打开页面" xid="button5" onClick="button5Click"> 
              <i xid="i5"/>  
              <span xid="span5">使用页面标识打开页面</span> 
            </a>  
            <a component="$UI/system/components/justep/button/button" class="btn btn-default"
              label="使用url打开页面" xid="button6" onClick="button6Click"> 
              <i xid="i6"/>  
              <span xid="span6">使用url打开页面</span> 
            </a>  
            <a component="$UI/system/components/justep/button/button" class="btn btn-default"
              label="打开页面传参数" xid="button7" onClick="button7Click"> 
              <i xid="i7"/>  
              <span xid="span7">打开页面传参数</span> 
            </a> 
          </div> 
        </div>  
        <div class="x-contents-content container" xid="dialogContent"> 
          <div component="$UI/system/components/fragment/list/listTable" data="data1"
            masterData="" masterCol="" xid="listTable2"> 
            <div component="$UI/system/components/justep/list/list" class="x-list"
              data="data1" xid="list4"> 
              <table class="table table-bordered table-hover table-striped table-condensed"
                component="$UI/system/components/bootstrap/table/table" xid="table2"> 
                <thead xid="thead3"> 
                  <tr class="success" xid="tr5"> 
                    <th width="60px" xid="col4"> 
                      <label xid="label7"/> 
                    </th>  
                    <th xid="col5"> 
                      <label bind-text="$model.data1.label('name')" xid="label8"/> 
                    </th>  
                    <th xid="col6"> 
                      <label bind-text="$model.data1.label('age')" xid="label9"/> 
                    </th> 
                  </tr> 
                </thead>  
                <tbody class="x-list-template" bind-click="$model!=$object?$object.data.to($object):null"
                  xid="tbody3"> 
                  <tr class="info" xid="tr6"> 
                    <td class="text-center" style="vertical-align:middle;"
                      xid="td5"> 
                      <i class="x-expand-i " style="color:#808080;padding-right:6px;"
                        xid="i9"/>  
                      <label bind-text="$index()+1" xid="label10"/> 
                    </td>  
                    <td xid="td6"> 
                      <input component="$UI/system/components/justep/input/input"
                        class="form-control" bind-ref="ref('name')" xid="input3"/> 
                    </td>  
                    <td xid="td7"> 
                      <input component="$UI/system/components/justep/input/input"
                        class="form-control" bind-ref="ref('age')" xid="input4"/> 
                    </td> 
                  </tr> 
                </tbody> 
              </table> 
            </div> 
          </div>  
          <a component="$UI/system/components/justep/button/button" class="btn btn-default"
            label="打开对话框" xid="button1" onClick="button1Click"> 
            <i xid="i1"/>  
            <span xid="span1">打开对话框</span> 
          </a> 
        </div>  
        <div class="x-contents-content container" xid="containerContent"> 
            
          <h3 xid="h31"><![CDATA[1. 向内嵌页面传简单参数]]></h3><a component="$UI/system/components/justep/button/button" class="btn btn-default" label="刷新内嵌页面" xid="button8" onClick="button8Click"> 
            <i xid="i5" />  
            <span xid="span5">刷新内嵌页面</span> 
          </a><div component="$UI/system/components/justep/windowContainer/windowContainer"
            class="x-window-container" xid="windowContainer1" src="./page3.w?p1=p1&amp;p2=p2"
            style="border-style:solid solid solid solid;border-width:thin thin thin thin;"
            params="{a1: &quot;a1&quot;, a2: &quot;a2&quot;}" onReceive="windowContainer1Receive"/>  
          <h3 xid="h32"><![CDATA[2. 向内嵌页面传复杂参数]]></h3><div component="$UI/system/components/fragment/list/listTable" data="data1" masterData="" masterCol="" xid="listTable1">
   <div component="$UI/system/components/justep/list/list" class="x-list" data="data1" xid="list1">
    <table class="table table-bordered table-hover table-striped table-condensed" component="$UI/system/components/bootstrap/table/table" xid="table1">
     <thead xid="thead1">
      <tr class="success" xid="tr1">
       <th width="60px" xid="col1">
        <label xid="label1"></label></th> 
       <th xid="col2">
        <label bind-text="$model.data1.label('name')" xid="label2"></label></th> 
       <th xid="col3">
        <label bind-text="$model.data1.label('age')" xid="label3"></label></th> </tr> </thead> 
     <tbody class="x-list-template" bind-click="$model!=$object?$object.data.to($object):null" xid="tbody1">
      <tr class="info" xid="tr2">
       <td class="text-center" style="vertical-align:middle;" xid="td1">
        <i class="x-expand-i " style="color:#808080;padding-right:6px;" xid="i8"></i>
        <label bind-text="$index()+1" xid="label4"></label></td> 
       <td xid="td2">
        <input component="$UI/system/components/justep/input/input" class="form-control" bind-ref="ref('name')" xid="input1"></input></td> 
       <td xid="td3">
        <input component="$UI/system/components/justep/input/input" class="form-control" bind-ref="ref('age')" xid="input2"></input></td> </tr> </tbody> </table> </div> </div><div component="$UI/system/components/justep/windowContainer/windowContainer"
            class="x-window-container" xid="windowContainer2" src="./page4.w" params="{data: $model.data1}"
            style="border-style:solid solid solid solid;"/> 
        </div> 
      </div> 
    </div>  
    <div class="x-panel-bottom" xid="bottom1"> 
      <div component="$UI/system/components/justep/button/buttonGroup" class="btn-group x-card btn-group-justified"
        tabbed="true" xid="buttonGroup1"> 
        <a component="$UI/system/components/justep/button/button" class="btn btn-link"
          label="Shell打开页面" xid="shellBtn" target="shellContent"> 
          <i xid="i2"/>  
          <span xid="span2">Shell打开页面</span> 
        </a>  
        <a component="$UI/system/components/justep/button/button" class="btn btn-link"
          label="页面与对话框交互" xid="dialogBtn" target="dialogContent"> 
          <i xid="i3"/>  
          <span xid="span3">页面与对话框交互</span> 
        </a>  
        <a component="$UI/system/components/justep/button/button" class="btn btn-link"
          label="页面与内嵌页面交互" xid="containerBtn" target="containerContent"> 
          <i xid="i4"/>  
          <span xid="span4">页面与内嵌页面交互</span> 
        </a> 
      </div> 
    </div> 
  </div> 
</div>
