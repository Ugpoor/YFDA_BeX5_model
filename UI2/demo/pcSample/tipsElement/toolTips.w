<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window" component="$UI/system/components/justep/window/window"
  design="device:m;">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:355px;top:425px;"/> 第一种类型： 
  <br/> 1、span标签
  <br/>  
  <div xid="div1" title="不超过5个字"> 
    <span xid="span1"><![CDATA[小尺寸提示]]></span> 
  </div>  
  <div xid="div2" title="图片过大会撑坏网页结构"> 
    <span xid="span2"><![CDATA[中尺寸提示]]></span> 
  </div>  
  <div xid="div4" title="图片过大会撑坏网页结构。对于大图可以强制设置Width（不要设置Height），这样可以对大图片等比例缩小。图片过大会撑坏网页结构。对于大图可以强制设置Width（不要设置Height），这样可以对大图片等比例缩小。图片过大会撑坏网页结构。对于大图可以强制设置Width（不要设置Height），这样可以对大图片等比例缩小。"> 
    <span xid="span4"><![CDATA[大尺寸提示]]></span> 
  </div>  
  <div xid="div6" title="图片过大会撑坏网页结构"> 
    <span xid="span5"><![CDATA[提示信息含html元素]]></span> 
  </div> 2、div标签
  <br/>  
  <div xid="div7" title="在div标签加入title属性"> 
    <p>这是在div中的内容</p>  
    <br/> 
  </div> 3、a标签
  <br/>  
  <div xid="div8" title="这是一个链接提示"> 
    <a xid="a1">查看</a> 
  </div> 4、表单元素
  <br/>  
  <div xid="div9" title="这里输入查询条件">
    <input component="$UI/system/components/justep/input/input" class="form-control"
      xid="input1" style="width:249px;"/> 
  </div>  
  <div xid="div10" title="请限制在200字以内">
    <textarea component="$UI/system/components/justep/textarea/textarea" class="form-control"
      xid="textarea1" style="width:251px;"/> 
  </div>
  5、图片
  <div xid="div11" title="图片提示信息">
    <img src="./img/demo.jpg" xid="image1"/>
  </div>
</div>
