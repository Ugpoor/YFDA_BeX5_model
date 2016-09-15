<div 
  xmlns:xui="http://www.justep.com/xui" 
  xmlns:xu="http://www.xmldb.org/xupdate" 
  xmlns="http://www.w3.org/1999/xhtml" 
  component="$UI/system/components/justep/window/window" 
  xid="window" 
  extends="$UI/demo/plugin/template/demo.w" 
  __id="id_1" 
  design="device:m;" 
  class="window" >

  <div xid="div3" xui:update-mode="delete"/>
  <div xid="div6" xui:update-mode="delete"/>
  <div xid="div7" xui:update-mode="delete"/>
   <div xid="model" onModelConstructDone="modelModelConstructDone"  xui:update-mode="merge"/>
   <div xid="titleBar" title="iFlytek"  xui:update-mode="merge"/>
   <p xid="p1"  xui:update-mode="merge-and-replace">
ID：com.justep.cordova.plugin.iFlytek</p>   <p xid="introduceP"  xui:update-mode="merge-and-replace">




这是一个集成了科大讯飞SDK的插件，提供了语音听写以及语音合成的能力！由于讯飞的机制，一个SDK对应一个appID，在此demo中提供了测试的appID还有与之对应的SDK，如果您自己申请appID，请将插件中的sdk替换为您自己的SDK！</p>   <p xid="platformP"  xui:update-mode="merge-and-replace">




iOS，Android</p>    <div style="height:50px;padding:40px" xid="div1_5" xui:parent="demoContent" xui:update-mode="insert" >
<p xid="p1_5" >
<![CDATA[语音听写：录入一段语音即可识别并将结果以文本形式返回。]]>
</p>
</div>
    <div style="height:50px;padding:0px 40px 40px 40px;" xid="div2_5" xui:parent="demoContent" xui:update-mode="insert" >
<a class="btn btn-default" component="$UI/system/components/justep/button/button" label="开始语音听写" onClick="startListenningClick" style="width:100%;" xid="startListenning" >
<i xid="i1_5" />
<span xid="span1_5" >








开始语音听写</span>
</a>
</div>
    <div style="height:50px;padding:40px" xid="div3_5" xui:parent="demoContent" xui:update-mode="insert" >
<a class="btn btn-default" component="$UI/system/components/justep/button/button" label="取消语音听写" onClick="cancleListenningClick" style="width:100%;" xid="cancleListenning" >
<i xid="i2_5" />
<span xid="span2_5" >








取消语音听写</span>
</a>
</div>
    <div style="height:50px;padding:40px" xid="div4_5" xui:parent="demoContent" xui:update-mode="insert" >
<a class="btn btn-default" component="$UI/system/components/justep/button/button" label="停止语音听写" onClick="stopListenningClick" style="width:100%;" xid="stopListenning" >
<i xid="i3_5" />
<span xid="span3_5" >








停止语音听写</span>
</a>
</div>
    <div style="height:50px;padding:40px" xid="div5_5" xui:parent="demoContent" xui:update-mode="insert" >
<p xid="p2_5" >
<![CDATA[语音合成：传入一段文本即可识别并文本读出来。]]>
</p>
</div>
    <div style="height:50px;padding:0px 40px 40px 40px;" xid="div6_5" xui:parent="demoContent" xui:update-mode="insert" >
<a class="btn btn-default" component="$UI/system/components/justep/button/button" label="开始语音合成" onClick="startSpeakingClick" style="width:100%;" xid="startSpeaking" >
<i xid="i4_5" />
<span xid="span4_5" >








开始语音合成</span>
</a>
</div>
    <div style="height:50px;padding:40px" xid="div7_5" xui:parent="demoContent" xui:update-mode="insert" >
<a class="btn btn-default" component="$UI/system/components/justep/button/button" label="暂停语音合成" onClick="pauseSpeakingClick" style="width:100%;" xid="pauseSpeaking" >
<i xid="i5_5" />
<span xid="span5_5" >








暂停语音合成</span>
</a>
</div>
    <div align="left" style="height:50px;padding:40px" xid="div8_5" xui:parent="demoContent" xui:update-mode="insert" >
<a class="btn btn-default" component="$UI/system/components/justep/button/button" label="恢复语音合成" onClick="resumeSpeakingClick" style="width:100%;" xid="resumeSpeaking" >
<i xid="i6_5" />
<span xid="span6_5" >








恢复语音合成</span>
</a>
</div>
    <div style="height:50px;padding:40px" xid="div9_5" xui:parent="demoContent" xui:update-mode="insert" >
<a class="btn btn-default" component="$UI/system/components/justep/button/button" label="停止语音合成" onClick="stopSpeakingClick" style="width:100%;" xid="stopSpeaking" >
<i xid="i7_5" />
<span xid="span7_5" >








停止语音合成</span>
</a>
</div>
    <div xid="div10_5" xui:parent="demoContent" xui:update-mode="insert" />
    <div xid="div11_5" xui:parent="demoContent" xui:update-mode="insert" />
   <div xid="codeContent" style="padding:10px"  xui:update-mode="merge"/>
    <p xid="p1_3" xui:parent="codeContent" xui:update-mode="insert" >
<![CDATA[开始语音听写]]>
</p>
    <div xid="startListenningClick" xui:parent="codeContent" xui:update-mode="insert" />
    <p xid="p2_3" xui:parent="codeContent" xui:update-mode="insert" >
<![CDATA[取消语音听写]]>
</p>
    <div xid="cancleListenningClick" xui:parent="codeContent" xui:update-mode="insert" />
    <p xid="p3-3" xui:parent="codeContent" xui:update-mode="insert" >
<![CDATA[停止语音听写]]>
</p>
    <div xid="stopListenningClick" xui:parent="codeContent" xui:update-mode="insert" />
    <p xid="p4_3" xui:parent="codeContent" xui:update-mode="insert" >
<![CDATA[开始语音合成]]>
</p>
    <div xid="startSpeakingClick" xui:parent="codeContent" xui:update-mode="insert" />
    <p xid="p5_3" xui:parent="codeContent" xui:update-mode="insert" >
<![CDATA[暂停语音合成]]>
</p>
    <div xid="pauseSpeakingClick" xui:parent="codeContent" xui:update-mode="insert" />
    <p xid="p6_3" xui:parent="codeContent" xui:update-mode="insert" >
<![CDATA[恢复语音合成]]>
</p>
    <div xid="resumeSpeakingClick" xui:parent="codeContent" xui:update-mode="insert" />
    <p xid="p7_3" xui:parent="codeContent" xui:update-mode="insert" >
<![CDATA[停止语音合成]]>
</p>
    <div xid="stopSpeakingClick" xui:parent="codeContent" xui:update-mode="insert" />
    <p xid="p8_3" xui:parent="codeContent" xui:update-mode="insert" />
    <p xid="p9_3" xui:parent="codeContent" xui:update-mode="insert" />

</div>