<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" component="$UI/system/components/justep/window/window">  
  <div xid="dialog" /><span component="$UI/system/components/justep/windowDialog/windowDialog" xid="windowDialog" style="left:523px;top:120px;" src="$UI/system/components/justep/windowDialog/demo/dialog.w" routable="true" status="normal" showTitle="false" onReceive="windowDialogReceive"> 
         
      <result concept="data" operation="edit" origin="data" xid="default6">
   <mapping from="id" to="id" locator="true" xid="default7"></mapping>
   <mapping from="name" to="name" xid="default8"></mapping>
   <mapping from="age" to="age" xid="default9"></mapping></result></span><div component="$UI/system/components/justep/model/model" xid="model" style="position:absolute;;left:396.0px;top:562.0px" onLoad="modelLoad"> 
    <div component="$UI/system/components/justep/data/data" autoLoad="true"
      xid="data" idColumn="id"> 
      <column label="id" name="id" type="String" xid="xid1"/>  
      <column label="name" name="name" type="String" xid="xid2"/>  
      <column label="age" name="age" type="String" xid="xid3"/>  
      <data xid="default5">[{"id":"1"}]</data>
    </div> 
  </div>  
  <div component="$UI/system/components/justep/panel/panel" class="x-panel x-full"
    xid="panel1"> 
    <div class="x-panel-top" xid="top1" style="width:100%;"> 
      <div component="$UI/system/components/justep/titleBar/titleBar" class="x-titlebar"
        xid="titleBar1" title="windowDialog"> 
        <div class="x-titlebar-left" xid="div1"> 
          <a component="$UI/system/components/justep/button/button" class="btn btn-link"
            xid="button1" icon="icon-chevron-left" onClick="closeWin"> 
            <i xid="i1" class="icon-chevron-left"/>  
            <span xid="span1"/> 
          </a> 
        </div>  
        <div class="x-titlebar-title" xid="div2">windowDialog</div>  
        <div class="x-titlebar-right reverse" xid="div3"/> 
      </div> 
    </div>  
    <div class="x-panel-content" xid="content1"> 
        
        
      <div component="$UI/system/components/justep/controlGroup/controlGroup"
        class="x-control-group" title="title" xid="controlGroup1"> 
        <h3 style="height:48px;vertical-align: middle;padding: 8px;display: inline-block;">windowDialog</h3>  
        <a component="$UI/system/components/justep/button/button" class="btn btn-link"
          label="js" xid="button5" onClick="showJsSource"> 
          <i xid="i5"/>  
          <span xid="span5">js</span> 
        </a>  
        <a component="$UI/system/components/justep/button/button" class="btn btn-link"
          label="源码" xid="button4" onClick="showWindowDialogSource" bind-visible="isVisible"> 
          <i xid="i4"/>  
          <span xid="span4">源码</span> 
        </a>  
        <p>动态创建windowDialog组件，并进行数据交互</p>  
        <p>1、通过windowDialog的open(data)方法进行传参</p>  
        <p>2、通过windowDialog的src设置的url传参</p>  
        <a component="$UI/system/components/justep/button/button" class="btn btn-default"
          label="openWindow" xid="button2" onClick="openDialog"> 
          <i xid="i2"/>  
          <span xid="span2">openWindow</span> 
        </a>  
        <div component="$UI/system/components/justep/output/output" class="x-output"
          xid="output"/>  
        <p>mapping用法，新增一行数据</p>  
        <a component="$UI/system/components/justep/button/button" class="btn btn-default"
          label="openWindow" xid="button3" onClick="mappingDailog" style="left:50px;"> 
          <i xid="i3"/>  
          <span xid="span3">openWindow</span> 
        </a> 
      </div>  
      <div component="$UI/system/components/justep/list/list" class="x-list"
        xid="list" data="data"> 
        <ul class="x-list-template" xid="listTemplateUl1"> 
          <li xid="li1"> 
            <div component="$UI/system/components/justep/labelEdit/labelEdit"
              class="x-label-edit x-label30" xid="labelOutput1"> 
              <label class="x-label" xid="label1" bind-text="ref('name')"/>  
              <div component="$UI/system/components/justep/output/output" class="x-output x-edit"
                xid="output1" bind-ref="ref('name')"/> 
            </div>  
            <div component="$UI/system/components/justep/labelEdit/labelEdit"
              class="x-label-edit x-label30" xid="labelOutput2"> 
              <label class="x-label" xid="label2" bind-text="ref('age')"/>  
              <div component="$UI/system/components/justep/output/output" class="x-output x-edit"
                xid="output2" bind-ref="ref('age')"/> 
            </div> 
          </li> 
        </ul> 
      </div> 
    </div> 
  </div> 
</div>
