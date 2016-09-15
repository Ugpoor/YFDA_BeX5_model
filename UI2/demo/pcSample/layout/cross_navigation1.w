<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window" component="$UI/system/components/justep/window/window"
  design="device:pc">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:367px;top:236px;">
    <div component="$UI/system/components/justep/data/data" autoLoad="true"
      xid="textData" idColumn="fID">
      <column label="fID" name="fID" type="String" xid="xid1"/>  
      <column label="姓名" name="fName" type="String" xid="xid2"/>  
      <column label="年龄" name="fAge" type="String" xid="xid3"/>  
      <column label="地址" name="fAddress" type="String" xid="xid4"/>  
      <column label="备注" name="fRemark" type="String" xid="xid5"/>  
      <data xid="default1">[{"fID":"001","fName":"张三","fAge":"22","fAddress":"地址信息","fRemark":"备注信息"},{"fID":"002","fName":"张三","fAge":"22","fAddress":"地址信息","fRemark":"备注信息"},{"fID":"003","fName":"张三","fAge":"22","fAddress":"地址信息","fRemark":"备注信息"},{"fID":"004","fName":"张三","fAge":"22","fAddress":"地址信息","fRemark":"备注信息"},{"fID":"005","fName":"张三","fAge":"22","fAddress":"地址信息","fRemark":"备注信息"}]</data>
    </div>
  </div>  
  <div component="$UI/system/components/justep/button/buttonGroup" class="btn-group btn-group-justified"
    tabbed="true" xid="buttonGroup1" style="width:100%;height:34px;">
    <a component="$UI/system/components/justep/button/button" class="btn btn-default"
      label="button" xid="button1" style="width:100px;" onClick="buttonClick"> 
      <i xid="i1"/>  
      <span xid="span1"/>
    </a>  
    <a component="$UI/system/components/justep/button/button" class="btn btn-default"
      label="button" xid="button2" style="width:100px;" onClick="buttonClick"> 
      <i xid="i2"/>  
      <span xid="span2"/>
    </a>  
    <a component="$UI/system/components/justep/button/button" class="btn btn-default"
      label="button" xid="button3" style="width:100px;" onClick="buttonClick"> 
      <i xid="i3"/>  
      <span xid="span3"/>
    </a>  
    <a component="$UI/system/components/justep/button/button" class="btn btn-default"
      label="button" xid="button4" style="width:100px;" onClick="buttonClick"> 
      <i xid="i4"/>  
      <span xid="span4"/>
    </a>  
    <a component="$UI/system/components/justep/button/button" class="btn btn-default"
      label="button" xid="button5" style="width:100px;" onClick="buttonClick"> 
      <i xid="i5"/>  
      <span xid="span5"/>
    </a>
  </div>  
  <hr xid="hr1" class="hr"/>  
  <div component="$UI/system/components/justep/contents/contents" class="x-contents x-full"
    active="0" xid="contents1" style="top:35px;"> 
    <div class="x-contents-content" xid="content1"/>
  </div>
</div>
