<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window" component="$UI/system/components/justep/window/window"
  design="device:m;">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:265px;top:67px;"/>  
  <div xid="div1" height="30px">1、提示
    <br/>  
    <span xid="span2"> 
      <a component="$UI/system/components/justep/button/button" class="btn btn-default"
        label="提示信息" xid="button2" onClick="button2Click"> 
        <i xid="i2"/>  
        <span xid="span3">提示信息</span> 
      </a>  
      <a component="$UI/system/components/justep/button/button" class="btn btn-default"
        label="提示自动" xid="button3" onClick="button3Click"> 
        <i xid="i3"/>  
        <span xid="span5">提示自动</span> 
      </a>  
      <a component="$UI/system/components/justep/button/button" class="btn btn-default"
        label="询问信息" xid="button4" onClick="button4Click"> 
        <i xid="i4"/>  
        <span xid="span6">询问信息</span> 
      </a> 
    </span> 
  </div>  
  <div xid="div3" height="30px">2、基本功能
    <br/> 弹出窗口参数见文档。
    <br/>  
    <span xid="span7"> 
      <a component="$UI/system/components/justep/button/button" class="btn btn-default"
        label="普通窗口" xid="button5" onClick="button5Click"> 
        <i xid="i5"/>  
        <span xid="span8">普通窗口</span> 
      </a>  
      <a component="$UI/system/components/justep/button/button" class="btn btn-default"
        label="自定义宽高" xid="button6" onClick="button6Click"> 
        <i xid="i6"/>  
        <span xid="span9">自定义宽高</span> 
      </a>  
      <a component="$UI/system/components/justep/button/button" class="btn btn-default"
        label="带说明栏窗口" xid="button7" onClick="button7Click"> 
        <i xid="i7"/>  
        <span xid="span10">带说明栏窗口</span> 
      </a>  
      <a component="$UI/system/components/justep/button/button" class="btn btn-default"
        label="无遮罩窗口" xid="button8" onClick="button8Click"> 
        <i xid="i8"/>  
        <span xid="span11">无遮罩窗口</span> 
      </a>  
      <a component="$UI/system/components/justep/button/button" class="btn btn-default"
        xid="button9" label="最大化与最小化" onClick="button9Click"> 
        <i xid="i9"/>  
        <span xid="span12">最大化与最小化</span> 
      </a>  
      <a component="$UI/system/components/justep/button/button" class="btn btn-default"
        label="初始时最大化窗口" xid="button10" onClick="button10Click"> 
        <i xid="i10"/>  
        <span xid="span13">初始时最大化窗口</span> 
      </a> 
    </span> 
  </div>  
  <span component="$UI/system/components/justep/windowDialog/windowDialog" xid="windowDialog1"
    src="page.w" width="80%" height="80%" status="normal" showTitle="true"/>  
  <span component="$UI/system/components/justep/windowDialog/windowDialog" xid="windowDialog2"
    showTitle="true" src="page.w" status="normal" forceRefreshOnOpen="false" style="left:156px;top:60px;"
    width="100%" height="100%"/>  
  <span component="$UI/system/components/justep/windowDialog/windowDialog" xid="windowDialog3"
    showTitle="true" title="这是标题" src="page.w"/>  
  <span component="$UI/system/components/justep/windowDialog/windowDialog" xid="windowDialog4"
    showTitle="true" src="page.w" resizable="false" width="80%" height="80%" status="normal"/>  
  <div xid="div4">3、额外功能
    <br/>  
    <span xid="span14"> 
      <a component="$UI/system/components/justep/button/button" class="btn btn-default"
        label="非iframe弹窗（简单内容）" xid="button11" onClick="button11Click"> 
        <i xid="i11"/>  
        <span xid="span15">非iframe弹窗（简单内容）</span> 
      </a>  
      <a component="$UI/system/components/justep/button/button" class="btn btn-default"
        label="非iframe（复杂内容）" xid="button12" onClick="button12Click"> 
        <i xid="i12"/>  
        <span xid="span16">非iframe（复杂内容）</span> 
      </a>  
      <a component="$UI/system/components/justep/button/button" class="btn btn-default"
        label="非iframe（复杂内容2）" xid="button13" onClick="button13Click"> 
        <i xid="i13"/>  
        <span xid="span17">非iframe（复杂内容2）</span> 
      </a> 
    </span>  
    <a component="$UI/system/components/justep/button/button" class="btn btn-default"
      label="指定弹出位置" xid="button1" onClick="button1Click"> 
      <i xid="i1"/>  
      <span xid="span1">指定弹出位置</span> 
    </a> 
  </div>  
  <span component="$UI/system/components/justep/windowDialog/windowDialog" xid="windowDialog18"
    src="page12.w" showTitle="true" status="normal" onReceive="windowDialog18Receive"/>
  <span component="$UI/system/components/justep/windowDialog/windowDialog" xid="windowDialog5"
    showTitle="true" src="page1.w" status="normal"/>  
  <span component="$UI/system/components/justep/windowDialog/windowDialog" xid="windowDialog6"/>  
  <span component="$UI/system/components/justep/windowDialog/windowDialog" xid="windowDialog7"
    src="page2.w" showTitle="true" status="normal"/>  
  <span component="$UI/system/components/justep/windowDialog/windowDialog" xid="windowDialog8"
    src="page.w" showTitle="true" status="normal" width="auto" height="auto" left="700px"
    top="520px"/>  
  <div xid="div2">4、事件与方法
    <br/>  
    <span xid="span4"> 
      <a component="$UI/system/components/justep/button/button" class="btn btn-default"
        label="确定、取消、最大化、最小化、关闭事件" xid="button14" onClick="button14Click"> 
        <i xid="i14"/>  
        <span xid="span18">确定、取消、最大化、最小化、关闭事件</span> 
      </a> 
    </span>  
    <a component="$UI/system/components/justep/button/button" class="btn btn-default"
      label="更改按钮" xid="button15" onClick="button15Click"> 
      <i xid="i15"/>  
      <span xid="span19">更改按钮</span> 
    </a>  
    <a component="$UI/system/components/justep/button/button" class="btn btn-default"
      label="创建新按钮" xid="button16" onClick="button16Click"> 
      <i xid="i16"/>  
      <span xid="span20">创建新按钮</span> 
    </a> 
  </div>  
  <span component="$UI/system/components/justep/windowDialog/windowDialog" xid="windowDialog9"
    showTitle="true" status="normal" src="page6.w"/>  
  <div xid="div5" style="width:476px;">5、父页面刷新
    <br/> 方法1：
    <br/>  
    <span xid="span21" style="height:24px;width:156px;"> 
      <a component="$UI/system/components/justep/button/button" class="btn btn-default"
        label="提交表单并刷新父页" xid="button17" onClick="button17Click"> 
        <i xid="i17"/>  
        <span xid="span22">提交表单并刷新父页</span> 
      </a>  
      <br/>此方法适合表单同步提交（页面跳转）的情况。
      <br/> 方法2：使用按钮栏：
      <a component="$UI/system/components/justep/button/button" class="btn btn-default"
        label="手动关闭窗口并刷新页面1" xid="button18" onClick="button18Click"> 
        <i xid="i18"/>  
        <span xid="span23">手动关闭窗口并刷新页面1</span> 
      </a>  
      <br/>方法3：不用按钮栏：
    </span>  
    <a component="$UI/system/components/justep/button/button" class="btn btn-default"
      label="手动关闭窗口并刷新页面2" xid="button19" onClick="button19Click"> 
      <i xid="i19"/>  
      <span xid="span24">手动关闭窗口并刷新页面2</span> 
    </a>  
    <br/>方法2和方法3适合表单异步提交或者无需表单提交的情况。
    <br/> 
  </div>  
  <span component="$UI/system/components/justep/windowDialog/windowDialog" xid="windowDialog11"
    showTitle="true" status="normal" src="page8.w"/>  
  <span component="$UI/system/components/justep/windowDialog/windowDialog" xid="windowDialog10"
    showTitle="true" status="normal" src="page7.w"/>  
  <span component="$UI/system/components/justep/windowDialog/windowDialog" xid="windowDialog12"
    showTitle="true" status="normal" src="page9.w"/>  
  <span component="$UI/system/components/justep/windowDialog/windowDialog" xid="windowDialog13"
    showTitle="true" status="normal" src="page10.w"/>  
  <div>6、手动关闭窗口
    <br/> 方法1：使用按钮栏
    <br/>  
    <span> 
      <a component="$UI/system/components/justep/button/button" class="btn btn-default"
        label="手动关闭窗口1" xid="button20" onClick="button20Click"> 
        <i xid="i20"/>  
        <span xid="span25">手动关闭窗口1</span> 
      </a> 
    </span>  
    <br/>方法2：不使用按钮栏
    <br/>  
    <a component="$UI/system/components/justep/button/button" class="btn btn-default"
      label="手动关闭窗口2" xid="button21" onClick="button21Click"> 
      <i xid="i21"/>  
      <span xid="span26">手动关闭窗口2</span> 
    </a>  
    <br/>方法3：参见上面的“父页面刷新”的方法1。
    <br/> 方法4：适合关闭特定的窗口。例如：
    <br/>  
    <a component="$UI/system/components/justep/button/button" class="btn btn-default"
      label="打开第二个窗口关闭前一个窗口" xid="button22" onClick="button22Click"> 
      <i xid="i22"/>  
      <span xid="span27">打开第二个窗口关闭前一个窗口</span> 
    </a> 
  </div>  
  <span component="$UI/system/components/justep/windowReceiver/windowReceiver"
    xid="windowReceiver1"/>  
  <span component="$UI/system/components/justep/windowDialog/windowDialog" xid="windowDialog14"
    src="page11.w" showTitle="true" status="normal"/> 7、传值
  <br/>  
  <span component="$UI/system/components/justep/windowDialog/windowDialog" xid="windowDialog15"
    src="page12.w" showTitle="true" status="normal" onReceive="windowDialog15Receive"/>  
  <div> 
    <span style="height:127px;"> 
      <a component="$UI/system/components/justep/button/button" class="btn btn-default"
        label="本页面获取窗口页的值" xid="button23" onClick="button23Click"> 
        <i xid="i23"/>  
        <span xid="span28">本页面获取窗口页的值</span> 
      </a>  
      <br/>  
      <a component="$UI/system/components/justep/button/button" class="btn btn-default"
        label="本页面调取窗口页的方法" xid="button24" onClick="button24Click"> 
        <i xid="i24"/>  
        <span xid="span29">本页面调取窗口页的方法</span> 
      </a>  
      <br/>  
      <a component="$UI/system/components/justep/button/button" class="btn btn-default"
        label="窗口将值传给本页" xid="button25" onClick="button25Click"> 
        <i xid="i25"/>  
        <span xid="span30">窗口将值传给本页</span> 
      </a>  
      <input component="$UI/system/components/justep/input/input" class="form-control"
        xid="input3" style="width:95px;"/>  
      <a component="$UI/system/components/justep/button/button" class="btn btn-default"
        label="窗口之间传值" xid="button26" onClick="button26Click"> 
        <i xid="i26"/>  
        <span xid="span31">窗口之间传值</span>
      </a>
    </span> 
  </div>  
  <span component="$UI/system/components/justep/windowDialog/windowDialog" xid="windowDialog17"
    showTitle="true" status="normal" src="page14.w"/>
  <span component="$UI/system/components/justep/windowDialog/windowDialog" xid="windowDialog16"
    showTitle="true" status="normal" src="page13.w"/> 8、改变窗口样式
  <br/> 9、任务栏管理
  <br/>  
  <span component="$UI/system/components/justep/windowDialog/windowDialog" xid="windowDialog19"
    showTitle="true" status="normal" src="page.w"/>
  <div xid="div6">
    <a component="$UI/system/components/justep/button/button" class="btn btn-default"
      label="窗口1" xid="button27" onClick="button27Click"> 
      <i xid="i27"/>  
      <span xid="span32">窗口1</span>
    </a>  
    <a component="$UI/system/components/justep/button/button" class="btn btn-default"
      label="窗口2" xid="button28" onClick="button28Click"> 
      <i xid="i28"/>  
      <span xid="span33">窗口2</span>
    </a>  
    <a component="$UI/system/components/justep/button/button" class="btn btn-default"
      label="窗口3" xid="button29" onClick="button29Click"> 
      <i xid="i29"/>  
      <span xid="span34">窗口3</span>
    </a>
  </div>
</div>
