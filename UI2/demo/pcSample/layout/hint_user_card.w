<?xml version="1.0" encoding="UTF-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window" component="$UI/system/components/justep/window/window" design="device:pc">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:167px;top:12px;">
  <div component="$UI/system/components/justep/data/data" autoLoad="true" xid="userData" idColumn="fId" onCustomRefresh="userDataCustomRefresh"><column label="ID" name="fId" type="String" xid="xid1"></column>
  <column label="用户名" name="fUserName" type="String" xid="xid2"></column>
  <column label="姓名" name="fName" type="String" xid="xid3"></column>
  <column label="密码" name="fPassword" type="String" xid="xid4"></column>
  <column label="备注" name="fRemark" type="String" xid="xid5"></column></div>
  <div component="$UI/system/components/justep/data/data" autoLoad="true" xid="statusData" idColumn="edit"><column label="edit" name="edit" type="String" xid="xid6"></column>
  <data xid="default1">[{&quot;edit&quot;:&quot;0&quot;}]</data></div></div> 
<div component="$UI/system/components/justep/titleBar/titleBar" class="x-titlebar clearfix center-block" xid="titleBar2" title="操作用户信息">
   <div class="x-titlebar-left" xid="left2"></div>
   <div class="x-titlebar-title" xid="title2">操作用户信息</div>
   <div class="x-titlebar-right reverse" xid="right2"></div></div><a component="$UI/system/components/justep/button/button" class="btn btn-link" label="打开用户信息" xid="open" onClick="{operation:'popOver1.show'}" style="background-color:rgb(245, 239, 239);">
   <i xid="i1"></i>
   <span xid="span1">打开用户信息</span></a>
  <a component="$UI/system/components/justep/button/button" class="btn btn-link" label="js" xid="jsBtn" onClick="jsClick">
   <i xid="i2"></i>
   <span xid="span3">js</span></a><a component="$UI/system/components/justep/button/button" class="btn btn-link" label="源码" xid="sourceBtn" bind-visible="isVisible" onClick="sourceClick">
   <i xid="i3"></i>
   <span xid="span4">源码</span></a><div xid="div1" style="height:30px;" class="div1"><span xid="span2"><![CDATA[可用于首页弹出用户信息进行编辑。]]></span></div>
  <div component="$UI/system/components/justep/popOver/popOver" class="x-popOver" xid="popOver1" style="height:auto;width:auto;">
   <div class="x-popOver-overlay" xid="div2"></div>
   <div class="x-popOver-content" xid="div3"><div xid="div4" style="height:320px;width:380px;" class="div">
   <div xid="div8" style="height:auto;width:110px;" class="pull-left div2">
    <label xid="label3">用户信息</label>
    <hr xid="hr1" class="hr" style="width:100%;"></hr>
    <img src="$UI/demo/sample/layout/img/2.jpg" alt="" xid="image1" style="height:145px;width:100px;" class="image"></img></div> 
   <div xid="div9" class="pull-right div3" style="height:220px;width:210px;">
    <label xid="label9" bind-text="userData.label('fUserName')+':'" style="width:60px;height:20px;" class="pull-left label1">label</label>
    <div component="$UI/system/components/justep/output/output" class="x-output pull-left" xid="output5" style="width:85px;" bind-ref="userData.ref('fUserName')"></div>
    <label xid="label10" bind-text="userData.label('fPassword')+':'" style="width:60px;height:20px;" class="pull-left label1">label</label>
    <input component="$UI/system/components/justep/input/input" class="form-control pull-left input5" xid="input5" bind-ref="userData.ref('fPassword')" style="width:85px;height:30px;" bind-visible=' $model.statusData.val("edit")==1'></input>
    <div component="$UI/system/components/justep/output/output" class="x-output pull-left" xid="output6" style="width:85px;" bind-ref="userData.ref('fPassword')" bind-visible=' $model.statusData.val("edit") ==0'></div>
    <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-only-icon pull-right" label="button" xid="edit" icon="icon-edit" onClick="editClick" bind-visible=' $model.statusData.val("edit") ==0'>
     <i xid="i8" class="icon-edit"></i>
     <span xid="span8"></span></a> 
    <label xid="label11" bind-text="userData.label('fName')+':'" style="width:60px;height:20px;" class="pull-left label1">label</label>
    <div component="$UI/system/components/justep/output/output" class="x-output pull-left" xid="output7" style="width:85px;" bind-ref="userData.ref('fName')"></div>
    <label xid="label12" bind-text="userData.label('fRemark')+':'" style="width:60px;height:20px;" class="pull-left label1">label</label>
    <div component="$UI/system/components/justep/output/output" class="x-output pull-left" xid="output8" style="width:85px;" bind-ref="userData.ref('fRemark')"></div></div> 
   <div xid="div12" style="height:46px;width:214px;" class="pull-right div4">
    <a component="$UI/system/components/justep/button/button" class="btn1 btn btn-link" label="确定" xid="sure" onClick="sureClick">
     <i xid="i14"></i>
     <span xid="span14">确定</span></a> 
    <a component="$UI/system/components/justep/button/button" class="btn1 btn btn-link" label="取消" xid="cancel" onClick="{operation:'popOver1.hide'}">
     <i xid="i15"></i>
     <span xid="span15">取消</span></a> </div> </div></div></div>
  
  
  </div>