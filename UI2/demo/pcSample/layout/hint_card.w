<?xml version="1.0" encoding="UTF-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window" component="$UI/system/components/justep/window/window" design="device:pc">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:31px;top:275px;"><div component="$UI/system/components/justep/data/data" autoLoad="true" xid="editStatusData" idColumn="edit">
   <column label="编辑状态" name="edit" type="String" xid="xid7"></column>
   <data xid="default3">[{&quot;edit&quot;:&quot;0&quot;}]</data></div>
  <div component="$UI/system/components/justep/data/data" autoLoad="true" xid="userData" idColumn="fId">
   <column label="ID" name="fId" type="String" xid="xid2"></column>
   <column label="用户名" name="fUserName" type="String" xid="xid3"></column>
   <column label="姓名" name="fName" type="String" xid="xid4"></column>
   <column label="密码" name="fPassword" type="String" xid="xid5"></column>
   <column label="备注" name="fRemark" type="String" xid="xid6"></column>
   <data xid="default2">[{&quot;fId&quot;:&quot;001&quot;,&quot;fUserName&quot;:&quot;admin&quot;,&quot;fName&quot;:&quot;张三&quot;,&quot;fPassword&quot;:&quot;123456&quot;,&quot;fRemark&quot;:&quot;备注&quot;}]</data></div></div> 
<span component="$UI/system/components/justep/windowReceiver/windowReceiver" xid="windowReceiver1"></span>
  <div xid="div1" style="height:320px;width:380px;" class="div"><div xid="div3"><a component="$UI/system/components/justep/button/button" class="btn btn-link pull-right" label="源码" xid="sourceBtn" onClick="sourceClick">
   <i xid="i2"></i>
   <span xid="span2">源码</span></a><a component="$UI/system/components/justep/button/button" class="btn btn-link pull-right" label="js" xid="jsBtn" onClick="jsClick">
   <i xid="i1"></i>
   <span xid="span1">js</span></a></div><div xid="div8" style="height:auto;width:110px;" class="pull-left div2">
   <label xid="label3">用户信息</label>
   <hr xid="hr1" class="hr" style="width:100%;"></hr>
   <img src="$UI/demo/sample/layout/img/2.jpg" alt="" xid="image1" style="height:145px;width:100px;" class="image"></img></div>
  <div xid="div9" class="pull-right div3" style="height:220px;width:210px;">
   <label xid="label9" bind-text="userData.label('fUserName')+':'" style="width:60px;height:20px;" class="pull-left label1">label</label>
   <div component="$UI/system/components/justep/output/output" class="x-output pull-left" xid="output5" style="width:85px;" bind-ref="userData.ref('fUserName')"></div>
   <label xid="label10" bind-text="userData.label('fPassword')+':'" style="width:60px;height:20px;" class="pull-left label1">label</label>
   <input component="$UI/system/components/justep/input/input" class="form-control pull-left input5" xid="input5" bind-ref="userData.ref('fPassword')" style="width:85px;height:30px;" bind-visible='$model.editStatusData.val("edit") ==1'></input>
   <div component="$UI/system/components/justep/output/output" class="x-output pull-left" xid="output6" style="width:85px;" bind-ref="userData.ref('fPassword')" bind-visible=' $model.editStatusData.val("edit") ==0'></div>
   <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-only-icon pull-right" label="button" xid="edit" icon="icon-edit" onClick="editClick" bind-visible='$model.editStatusData.val("edit") ==0'>
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
   <a component="$UI/system/components/justep/button/button" class="btn1 btn btn-link" label="取消" xid="cancel" onClick="cancelClick">
    <i xid="i15"></i>
    <span xid="span15">取消</span></a> </div>
  </div><div class="x-panel-content" xid="content1"></div></div>