<?xml version="1.0" encoding="UTF-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window" component="$UI/system/components/justep/window/window" design="device:pc">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:453px;top:497px;"><div component="$UI/system/components/justep/data/data" autoLoad="true" xid="userData" idColumn="fID"><column label="会员ID" name="fID" type="String" xid="xid1"></column>
  <column label="姓名" name="fName" type="String" xid="xid2"></column>
  <column label="电话" name="fPhoneNumber" type="String" xid="xid3"></column>
  <column label="地址" name="fAddress" type="String" xid="xid4"></column></div></div> 

  <div component="$UI/system/components/justep/panel/panel" class="x-panel x-full" xid="panel2">
   <div class="x-panel-content" xid="content1"><div class="panel panel-default" component="$UI/system/components/bootstrap/panel/panel" xid="panel1">
   
   <div class="panel-body" xid="body1"><div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label30" xid="labelEdit1">
   <label class="x-label" xid="label1" bind-text="userData.label('fID')"></label>
   <input component="$UI/system/components/justep/input/input" class="form-control x-edit" xid="input1" bind-ref="userData.ref('fID')"></input></div>
  <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label30" xid="labelEdit2">
   <label class="x-label" xid="label2" bind-text="userData.label('fName')"></label>
   <input component="$UI/system/components/justep/input/input" class="form-control x-edit" xid="input2" bind-ref="userData.ref('fName')"></input></div>
  <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label30" xid="labelEdit3">
   <label class="x-label" xid="label3" bind-text="userData.label('fPhoneNumber')"></label>
   <input component="$UI/system/components/justep/input/input" class="form-control x-edit" xid="input3" bind-ref="userData.ref('fPhoneNumber')"></input></div>
  <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label30" xid="labelEdit5">
   <label class="x-label" xid="label5" bind-text="userData.label('fAddress')"></label>
   <textarea component="$UI/system/components/justep/textarea/textarea" class="form-control x-edit" xid="textarea1" bind-ref="userData.ref('fAddress')"></textarea></div></div>
   </div></div>
   <div class="x-panel-bottom" xid="bottom1"><a component="$UI/system/components/justep/button/button" class="btn btn-link x-dialog-button" label="取消" xid="cancel" onClick="cancelClick">
   <i xid="i1"></i>
   <span xid="span1">取消</span></a>
  <a component="$UI/system/components/justep/button/button" class="btn btn-primary x-dialog-button" label="确定" xid="okbtn" onClick="okbtnClick">
   <i xid="i2"></i>
   <span xid="span2">确定</span></a></div></div>
  <span component="$UI/system/components/justep/windowReceiver/windowReceiver" xid="windowReceiver" onReceive="windowReceiverReceive"></span></div>