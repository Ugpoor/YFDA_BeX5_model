<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window" component="$UI/system/components/justep/window/window"
  design="device:m;">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:21px;top:272px;"/>  
  <table class="table table-bordered table-hover table-striped" component="$UI/system/components/bootstrap/table/table"
    xid="table1"> 
    <tbody class="x-list-template" xid="listTemplate1"> 
      <tr xid="tr2"> 
        <td xid="td1">姓名：</td>  
        <td xid="td2">
          <input component="$UI/system/components/justep/input/input" class="form-control"
            xid="input1"/>
        </td> 
      </tr>  
      <tr xid="tr3"> 
        <td xid="td3">曾用名：</td>  
        <td xid="td4">
          <input component="$UI/system/components/justep/input/input" class="form-control"
            xid="input2"/>
        </td> 
      </tr>  
      <tr> 
        <td>民族：</td>  
        <td>
          <select component="$UI/system/components/justep/select/select" class="form-control"
            xid="select1"> 
            <option selected="selected">汉族</option>
          </select>
        </td> 
      </tr> 
      <tr>
      	<td>邮政编码：</td>
      	<td><input component="$UI/system/components/justep/input/input" class="form-control" xid="input3"></input></td>
      </tr>
      <tr>
      	<td>常用地址：</td>
      	<td><input component="$UI/system/components/justep/input/input" class="form-control" xid="input4"></input></td>
      </tr>
      <tr>
      	<td>备注：</td>
      	<td><textarea component="$UI/system/components/justep/textarea/textarea" class="form-control" xid="textarea1"></textarea></td>
      </tr>
    </tbody> 
  </table> 
<div xid="div1" style="width:161px;" class="pull-right"><a component="$UI/system/components/justep/button/button" class="btn btn-default" label="提交" xid="button1" onClick="button1Click">
   <i xid="i1"></i>
   <span xid="span1">提交</span></a>
  <a component="$UI/system/components/justep/button/button" class="btn btn-default" label="取消" xid="button2" onClick="button2Click">
   <i xid="i2"></i>
   <span xid="span2">取消</span></a></div></div>
