<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window" component="$UI/system/components/justep/window/window">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:486px;top:185px;" onModelConstructDone="modelModelConstructDone"> 
    <div component="$UI/system/components/justep/data/data" autoLoad="true"
      xid="sendData" idColumn="targets"> 
      <column label="发送目标" name="targets" type="String" xid="xid1"/>  
      <column label="发送目标名称" name="targetNames" type="String" xid="xid2"/>  
      <column label="消息标题" name="title" type="String" xid="xid3"/>  
      <column label="消息类型" name="type" type="String" xid="xid4"/>  
      <column label="消息url" name="url" type="String" xid="xid5"/>  
      <rule xid="rule1">
   <col name="targets" xid="ruleCol1">
    <required xid="required1">
     <expr xid="default2">true</expr>
     <message xid="default3">请选择消息接收者</message></required> </col> 
   <col name="title" xid="ruleCol2">
    <required xid="required2">
     <expr xid="default4">true</expr>
     <message xid="default5">请输出消息标题</message></required> </col> </rule>
  <data xid="default1">[{&quot;targets&quot;:&quot;&quot;,&quot;targetNames&quot;:&quot;&quot;,&quot;title&quot;:&quot;hello&quot;,&quot;type&quot;:&quot;default&quot;,&quot;url&quot;:&quot;/UI2/demo/misc/message/message.m.w?process=/demo/components/process/ui2/ui2Process&amp;activity=mainActivity&quot;}]</data></div> 
  </div>  
  <div component="$UI/system/components/justep/panel/panel" class="x-panel x-full"
    xid="panel1"> 
    <div class="x-panel-top" xid="top1"> 
      <div component="$UI/system/components/justep/titleBar/titleBar" class="x-titlebar"
        xid="titleBar1" title="消息推送"> 
        <div class="x-titlebar-left" xid="div1"> 
          <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-only-icon"
            xid="button1" icon="icon-chevron-left" onClick="{operation:'window.close'}"> 
            <i xid="i1" class="icon-chevron-left"/>  
            <span xid="span1"/> 
          </a> 
        </div>  
        <div class="x-titlebar-title" xid="div2">消息推送</div>  
        <div class="x-titlebar-right reverse" xid="div3"/> 
      </div> 
    </div>  
    <div class="x-panel-content" style="padding:8.75px" xid="content1"> 
      <div component="$UI/system/components/justep/controlGroup/controlGroup"
        class="x-control-group" xid="controlGroup1"> 
        <div class="x-control-group-title" xid="controlGroupTitle1"> 
          <span xid="span2"><![CDATA[]]></span> 
        </div>  
        <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label30"
          xid="labelEdit1"> 
          <label class="x-label" xid="label1"><![CDATA[发送给：]]></label>  
          <div class="x-edit" xid="div4"> 
            <div class="input-group" component="$UI/system/components/justep/org/orgSelect"
              xid="orgSelect1" bind-ref="sendData.ref('targets')" bind-labelRef="sendData.ref('targetNames')"
              itemValue="sFID"> 
              <input component="$UI/system/components/justep/input/input" class="form-control"
                readonly="true" xid="input1"/>  
              <span class="input-group-btn" xid="span3"> 
                <a component="$UI/system/components/justep/button/button"
                  class="btn btn-default" icon="icon-android-search" xid="button2"> 
                  <i class="icon-android-search" xid="i2"/>  
                  <span xid="span4"/> 
                </a> 
              </span> 
            </div> 
          </div> 
        </div>  
        <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label30"
          xid="labelTextarea1"> 
          <label class="x-label" xid="label2"><![CDATA[消息标题：]]></label>  
          <input component="$UI/system/components/justep/input/input" class="form-control x-edit"
            xid="input20" bind-ref="sendData.ref('title')"/>
        </div>
        <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label30"
          xid="labelInput1"> 
          <label class="x-label" xid="label3"><![CDATA[消息类型：]]></label>  
          <input component="$UI/system/components/justep/input/input" class="form-control x-edit"
            xid="input2" bind-ref="sendData.ref('type')"/>
        </div>  
        <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label30"
          xid="labelInput2"> 
          <label class="x-label" xid="label4"><![CDATA[消息页面：]]></label>  
          <input component="$UI/system/components/justep/input/input" class="form-control x-edit"
            xid="input3" bind-ref="sendData.ref('url')"/>
        </div>
        <a component="$UI/system/components/justep/button/button" class="btn btn-default center-block"
          label="发送" xid="send" onClick="sendClick"> 
          <i xid="i3"/>  
          <span xid="span5">发送</span>
        </a>
      </div> 
    <h3 xid="h31" class="text-center"><![CDATA[注意：打开此功能后，接收到消息时，将会提示alert]]></h3></div> 
  </div>  
  <span component="$UI/system/components/justep/windowDialog/windowDialog" xid="windowDialog"
    src="$UI/system/components/justep/common/demo/dialog.w" status="normal"/> 
</div>
