<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" class="window" component="$UI/system/components/justep/window/window">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="position:absolute;;left:109.0px;top:262.0px" onParamsReceive="modelParamsReceive"> 
    <div component="$UI/system/components/justep/data/data" autoLoad="true"
      xid="data" idColumn="id"> 
      <column label="id" name="id" type="String" xid="xid1"/>  
      <column label="name" name="name" type="String" xid="xid2"/>  
      <column label="age" name="age" type="String" xid="xid3"/>  
      <data xid="default1">[{"id":"1","name":"张三","age":"23"}]</data>
    </div> 
  </div>  
  <div component="$UI/system/components/justep/panel/panel" class="x-panel x-full"
    xid="panel1"> 
    <div class="x-panel-top" xid="top1"> 
      <div component="$UI/system/components/justep/titleBar/titleBar" class="x-titlebar"
        xid="titleBar1" title="windowDialog"> 
        <div class="x-titlebar-left" xid="div1"> 
          <a component="$UI/system/components/justep/button/button" class="btn btn-link"
            xid="button1" icon="icon-chevron-left" onClick="cancel"> 
            <i xid="i1" class="icon-chevron-left"/>  
            <span xid="span1"/> 
          </a> 
        </div>  
        <div class="x-titlebar-title" xid="div2">windowDialog</div>  
        <div class="x-titlebar-right reverse" xid="div3"> 
          <a component="$UI/system/components/justep/button/button" class="btn btn-link"
            xid="button2" icon="icon-checkmark-round" onClick="ok"> 
            <i xid="i2" class="icon-checkmark-round"/>  
            <span xid="span2"/> 
          </a> 
        </div> 
      </div> 
    </div>  
    <div class="x-panel-content" xid="content1"> 
      <h3 style="height:48px;vertical-align: middle;padding: 8px;display: inline-block;"><![CDATA[windowDialog]]></h3>  
      <a component="$UI/system/components/justep/button/button" class="btn btn-link"
        label="js" xid="button4" onClick="jsSource"> 
        <i xid="i4"/>  
        <span xid="span4">js</span> 
      </a>  
      <a component="$UI/system/components/justep/button/button" class="btn btn-link"
        label="源码" xid="button3" onClick="showWindowRevSource" bind-visible="isVisible"> 
        <i xid="i3"/>  
        <span xid="span3">源码</span> 
      </a>  
      <p><![CDATA[1、onParamsReceive事件接收调用者页面传来的数据]]></p>  
      <div style="margin-top: 20px;"> 
        <div component="$UI/system/components/justep/output/output" class="x-output x-edit"
          xid="urlData"/>  
        <div component="$UI/system/components/justep/output/output" class="x-output x-edit"
          xid="openData"/> 
      </div>
      <p>2、点击左上角直接关闭本页面，点击右上角，关闭本页面，并返回data当前行的数据)</p>  
      </div> 
  </div> 
</div>
