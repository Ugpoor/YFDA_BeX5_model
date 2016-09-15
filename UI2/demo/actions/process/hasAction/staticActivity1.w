<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window" component="$UI/system/components/justep/window/window"
  design="device:pc">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:351px;top:337px;"/>  
  <div class="panel panel-default" component="$UI/system/components/bootstrap/panel/panel"
    xid="panel3"> 
    <div class="panel-body" xid="body2"> 
      <h5 xid="h51">Action（动作）是X5中核心的模型元素，BIZ层所有的业务逻辑都是通过Action来实现并对外提供服务的，每个业务功能必须包含一定的动作来实现功能自身的业务逻辑。</h5>  
      <h5 xid="h52">对于业务功能来说，引用动作有以下几种方式：</h5>  
      <ol xid="ol1" style="list-style:decimal;padding-left:40px;"> 
        <li xid="li2">在Activity（活动）中引用Action，被引用的Action只能作用于当前这个Activity中；</li>  
        <li xid="li3">在Process（功能）中引用Action，被引用的Action可以作用于当前Process的所有Activity中；</li>  
        <li xid="li4">全局Action不需要显式引用，可见即可使用。如果当前模块或可见（use或include）模块中存在全局Action，这些Action可以直接使用，不需要显式引用。</li> 
      </ol>  
      <h5 xid="h53">本案例的模型文件参见：/BIZ/demo/actions/process/hasAction/hasActionProcess.process.m 和 /BIZ/demo/actions/logic/action/hasAction.action.m。</h5> 
    </div> 
  </div>  
  <div class="form-horizontal container-fluid" component="$UI/system/components/bootstrap/form/form"
    xid="form1"> 
    <div class="form-group" xid="formGroup1"> 
      <div class="col-sm-2" xid="col6"> 
        <a component="$UI/system/components/justep/button/button" class="btn x-green"
          label="执行 动作1" xid="action1Btn" style="width:100%;" onClick="action1BtnClick"> 
          <i xid="i2"/>  
          <span xid="span2">执行 动作1</span> 
        </a> 
      </div>  
      <div class="col-sm-8" xid="col5"> 
        <label class="control-label" xid="controlLabel1"><![CDATA[动作1：在activity1中引用，只能在activity1中执行]]></label> 
      </div> 
    </div>  
    <div class="form-group" xid="formGroup2"> 
      <div class="col-sm-2" xid="col10"> 
        <a component="$UI/system/components/justep/button/button" class="btn x-green"
          label="执行 动作2" xid="action2Btn" style="width:100%;" onClick="action2BtnClick"> 
          <i xid="i3"/>  
          <span xid="span3">执行 动作2</span> 
        </a> 
      </div>  
      <div class="col-sm-8" xid="col9"> 
        <label class="control-label" xid="controlLabel2"><![CDATA[动作2：在activity2中引用，只能在activity2中执行]]></label> 
      </div> 
    </div>  
    <div class="form-group" xid="formGroup3"> 
      <div class="col-sm-2" xid="col14"> 
        <a component="$UI/system/components/justep/button/button" class="btn x-blue"
          label="执行 动作3" xid="action3Btn" style="width:100%;" onClick="action3BtnClick"> 
          <i xid="i4"/>  
          <span xid="span4">执行 动作3</span> 
        </a> 
      </div>  
      <div class="col-sm-8" xid="col13"> 
        <label class="control-label" xid="controlLabel3"><![CDATA[动作3：在process中引用，可以在process的所有activity中执行]]></label> 
      </div> 
    </div>  
    <div class="form-group" xid="formGroup4"> 
      <div class="col-sm-2" xid="col18"> 
        <a component="$UI/system/components/justep/button/button" class="btn x-purple"
          label="执行 动作4" xid="action4Btn" style="width:100%;" onClick="action4BtnClick"> 
          <i xid="i5"/>  
          <span xid="span5">执行 动作4</span> 
        </a> 
      </div>  
      <div class="col-sm-8" xid="col17"> 
        <label class="control-label" xid="controlLabel4"><![CDATA[动作4：全局action，可见就可以执行]]></label> 
      </div> 
    </div> 
  </div> 
</div>
