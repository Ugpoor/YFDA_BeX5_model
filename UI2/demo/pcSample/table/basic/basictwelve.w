<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window" component="$UI/system/components/justep/window/window"
  design="device:pc">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:94px;top:421px;"> 
    <div component="$UI/system/components/justep/data/data" autoLoad="true"
      xid="selectData" idColumn="mName"> 
      <column label="民族" name="mName" type="String" xid="xid1"/>  
      <data xid="default1">[{"mName":"汉族"},{"mName":"满族"},{"mName":"维吾尔族"},{"mName":"朝鲜族"},{"mName":"蒙古族"},{"mName":"回族"},{"mName":"苗族"}]</data> 
    </div> 
  </div>  
  <h4 xid="h41"><![CDATA[表单-无样式表单]]>  
    <a component="$UI/system/components/justep/button/button" class="btn btn-link"
      label="JS" xid="jsButton" onClick="jsButtonClick"> 
      <i xid="i3"/>  
      <span xid="span3">JS</span> 
    </a>  
    <a component="$UI/system/components/justep/button/button" class="btn btn-link"
      label="源码" xid="source" onClick="sourceClick"> 
      <i xid="i4"/>  
      <span xid="span4">源码</span> 
    </a> 
  </h4>  
  <div xid="div1" style="width:500px;">
    <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label30"
      xid="labelInput1"> 
      <label class="x-label" xid="label1" style="text-align:right;">用户名：</label>  
      <input component="$UI/system/components/justep/input/input" class="form-control x-edit"
        xid="input1"/>
    </div>  
    <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label30"
      xid="labelPassword1"> 
      <label class="x-label" xid="label2" style="text-align:right;">密码：</label>  
      <input component="$UI/system/components/justep/input/password" class="form-control x-edit"
        xid="password1"/>
    </div>  
    <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label30"
      xid="labelSelect1"> 
      <label class="x-label" xid="label3" style="text-align:right;">民族：</label>  
      <select component="$UI/system/components/justep/select/select" class="form-control x-edit"
        xid="select1" bind-options="$model.selectData" bind-optionsValue="mName" bind-optionsLabel="mName"
        bind-optionsCaption="--请选择--"/>
    </div>  
    <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label30"
      xid="labelTextarea1"> 
      <label class="x-label" xid="label4" style="text-align:right;">常用地址：</label>  
      <textarea component="$UI/system/components/justep/textarea/textarea" class="form-control x-edit"
        xid="textarea1" style="height:79px;"/>
    </div>  
    <div xid="div2" class="text-center panel-body">
      <a component="$UI/system/components/justep/button/button" class="btn btn-default"
        label="提交" xid="button1"> 
        <i xid="i1"/>  
        <span xid="span1">提交</span>
      </a>
      <a component="$UI/system/components/justep/button/button" class="btn btn-default"
        label="重置" xid="button2"> 
        <i xid="i2"/>  
        <span xid="span2">重置</span>
      </a>
    </div>
  </div> 
</div>
