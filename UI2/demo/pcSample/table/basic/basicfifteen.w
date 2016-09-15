<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window" component="$UI/system/components/justep/window/window"
  design="device:pc">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:29px;top:456px;"> 
    <div component="$UI/system/components/justep/data/data" autoLoad="true"
      xid="data" idColumn="mName"> 
      <column label="民族" name="mName" type="String" xid="xid1"/>  
      <data xid="default1">[{"mName":"汉族"},{"mName":"满族"},{"mName":"维吾尔族"}]</data> 
    </div> 
  </div>  
  <h4 xid="h41"><![CDATA[表单-table表单]]>  
    <a component="$UI/system/components/justep/button/button" class="btn btn-link"
      label="JS" xid="showJSButton" onClick="showJSButtonClick"> 
      <i xid="i3"/>  
      <span xid="span3">JS</span> 
    </a>  
    <a component="$UI/system/components/justep/button/button" class="btn btn-link"
      label="源码" xid="source" onClick="sourceClick"> 
      <i xid="i4"/>  
      <span xid="span4">源码</span> 
    </a> 
  </h4>  
  <table class="table table-bordered" component="$UI/system/components/bootstrap/table/table"
    xid="dataTables"> 
    <thead xid="thead1"> 
      <tr xid="tr1"> 
        <th xid="col3" colspan="2" class="h4 text-center"><![CDATA[表单标题]]></th> 
      </tr> 
    </thead>  
    <tbody class="x-list-template" xid="listTemplate1"> 
      <tr xid="tr2"> 
        <td xid="td2"> 
          <label xid="label15" class="pull-right">用户名：</label> 
        </td>  
        <td xid="td3"> 
          <input component="$UI/system/components/justep/input/input" class="form-control"
            xid="input1" style="width:30%;"/> 
        </td> 
      </tr>  
      <tr xid="tr4"> 
        <td xid="td8"> 
          <label xid="label22" class="pull-right"><![CDATA[密码：]]></label>
        </td>  
        <td xid="td9"> 
          <input component="$UI/system/components/justep/input/password" class="form-control"
            xid="password1" style="width:30%;"/> 
        </td> 
      </tr>  
      <tr xid="tr5"> 
        <td xid="td10"> 
          <label xid="label23" class="pull-right"><![CDATA[民族：]]></label>
        </td>  
        <td xid="td11"> 
          <select component="$UI/system/components/justep/select/select" class="form-control"
            xid="select1" optionsAutoLoad="true" bind-options="$model.data" bind-optionsValue="mName"
            bind-optionsLabel="mName" style="width:30%;" bind-optionsCaption="--请选择--"/> 
        </td> 
      </tr>  
      <tr xid="tr6"> 
        <td xid="td12"> 
          <label xid="label24" class="pull-right"><![CDATA[常用地址：]]></label>
        </td>  
        <td xid="td13"> 
          <textarea component="$UI/system/components/justep/textarea/textarea" class="form-control"
            xid="textarea1" style="width:50%;height:100px;"/> 
        </td> 
      </tr>  
      <tr xid="tr7"> 
        <td xid="td4"/>  
        <td xid="td5"> 
          <a component="$UI/system/components/justep/button/button" class="btn btn-info"
            label="提交" xid="button1"> 
            <i xid="i1"/>  
            <span xid="span1">提交</span> 
          </a>  
          <a component="$UI/system/components/justep/button/button" class="btn btn-default o-marginLeft"
            label="清空" xid="button2"> 
            <i xid="i2"/>  
            <span xid="span2">清空</span> 
          </a> 
        </td> 
      </tr> 
    </tbody> 
  </table> 
</div>
