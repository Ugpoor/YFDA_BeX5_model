<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window" component="$UI/system/components/justep/window/window"
  design="device:pc">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:63px;top:478px;"> 
    <div component="$UI/system/components/justep/data/data" autoLoad="true"
      xid="selectData" idColumn="mName"> 
      <column label="民族" name="mName" type="String" xid="xid1"/>  
      <data xid="default5">[{"mName":"汉族"},{"mName":"满族"},{"mName":"维吾尔族"}]</data> 
    </div> 
  </div>  
  <h4 xid="h41"><![CDATA[表单-可收缩的表单]]>  
    <a component="$UI/system/components/justep/button/button" class="btn btn-link"
      label="JS" xid="jsButton" onClick="jsButtonClick"> 
      <i xid="i1"/>  
      <span xid="span1">JS</span> 
    </a>  
    <a component="$UI/system/components/justep/button/button" class="btn btn-link"
      label="源码" xid="source" onClick="sourceClick"> 
      <i xid="i2"/>  
      <span xid="span2">源码</span> 
    </a> 
  </h4>  
  <div component="$UI/system/components/justep/controlGroup/controlGroup" class="x-control-group"
    title="表单标题" xid="controlGroup1" collapsible="true"> 
    <div class="x-control-group-title" xid="controlGroupTitle1"> 
      <span xid="span5"><![CDATA[表单标题]]></span> 
    </div>  
    <div component="$UI/system/components/bootstrap/form/form(bootstrap)" xid="form1"
      class="form-horizontal container-fluid"> 
      <div class="form-group" xid="formGroup1"> 
        <div class="col-sm-2" xid="col13"> 
          <label class="control-label pull-right" xid="controlLabel1"><![CDATA[用户名：]]></label> 
        </div>  
        <div class="col-sm-4" xid="col14"> 
          <input component="$UI/system/components/justep/input/input" class="form-control"
            xid="input6" style="width:70%;"/> 
        </div> 
      </div>  
      <div class="form-group" xid="formGroup2"> 
        <div class="col-sm-2" xid="col17"> 
          <label class="control-label pull-right" xid="controlLabel3"><![CDATA[密码：]]></label> 
        </div>  
        <div class="col-sm-4" xid="col18"> 
          <input component="$UI/system/components/justep/input/password" class="form-control"
            xid="password1" style="width:70%;"/> 
        </div> 
      </div>  
      <div class="form-group" xid="formGroup3"> 
        <div class="col-sm-2" xid="col3"> 
          <label class="control-label pull-right" xid="controlLabel5"><![CDATA[民族：]]></label> 
        </div>  
        <div class="col-sm-4" xid="col2"> 
          <select component="$UI/system/components/justep/select/select" class="form-control"
            xid="select2" bind-options="selectData" bind-optionsValue="mName" bind-optionsLabel="mName"
            style="width:70%;" bind-optionsCaption="--请选择--"/> 
        </div> 
      </div>  
      <div class="form-group" xid="formGroup4"> 
        <div class="col-sm-2" xid="col5"> 
          <label class="control-label pull-right" xid="controlLabel7"><![CDATA[常用地址：]]></label> 
        </div>  
        <div class="col-sm-4" xid="col6"> 
          <textarea component="$UI/system/components/justep/textarea/textarea" class="form-control"
            xid="textarea1" style="height:90px;"/> 
        </div> 
      </div>  
      <div component="$UI/system/components/justep/row/row" class="x-row" xid="row1"> 
        <div class="x-col" xid="col31"/>  
        <div class="x-col" xid="col32"> 
          <a component="$UI/system/components/justep/button/button" class="btn btn-link"
            label="提交" xid="button3"> 
            <i xid="i4"/>  
            <span xid="span4">提交</span> 
          </a>  
          <a component="$UI/system/components/justep/button/button" class="btn btn-link"
            label="重置" xid="button4"> 
            <i xid="i3"/>  
            <span xid="span3">重置</span> 
          </a> 
        </div>  
        <div class="x-col" xid="col33"/> 
      </div> 
    </div> 
  </div> 
</div>
