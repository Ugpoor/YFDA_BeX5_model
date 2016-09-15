<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xmlns:xu="http://www.xmldb.org/xupdate"
  xmlns:xui="http://www.justep.com/xui" __id="id_1" extends="../parent/parent.w" component="$UI/system/components/justep/window/window"
  xid="window" class="window" design="device:m;">  
  <div autoLoad="true" component="$UI/system/components/justep/data/data" idColumn="name"
    xid="user" xui:parent="model" xui:update-mode="insert"> 
    <column label="姓名：" name="name" type="String" xid="xid7"/>  
    <column label="性别：" name="sex" type="String" xid="xid8"/>  
    <column label="电话：" name="tel" type="String" xid="xid9"/>  
    <column label="邮箱：" name="email" type="String" xid="xid10"/>  
    <rule xid="rule1"> 
      <col name="name" xid="ruleCol1"> 
        <required xid="required1"> 
          <expr xid="default2">true</expr>  
          <message xid="default3">姓名不能为空</message> 
        </required> 
      </col>  
      <col name="tel" xid="ruleCol2"> 
        <required xid="required2"> 
          <expr xid="default4">true</expr>  
          <message xid="default5">电话不能为空</message> 
        </required> 
      </col> 
    </rule> 
  </div>  
  <div class="x-control-group" component="$UI/system/components/justep/controlGroup/controlGroup"
    title="我要报名" xid="controlGroup2" xui:parent="content1" xui:update-mode="insert"> 
    <div class="x-control-group-title" xid="controlGroupTitle2"> 
      <span xid="span21">我要报名</span> 
    </div>  
    <div class="form-horizontal container-fluid" component="$UI/system/components/bootstrap/form/form"
      xid="form2"> 
      <div class="x-label-edit x-label30" component="$UI/system/components/justep/labelEdit/labelEdit"
        xid="labelInput5"> 
        <label bind-text="user.label('name')" class="pull-right x-label" xid="label5"/>  
        <input class="form-control x-edit" component="$UI/system/components/justep/input/input"
          xid="username"/> 
      </div>  
      <div class="x-label-edit x-label30" component="$UI/system/components/justep/labelEdit/labelEdit"
        xid="labelInput6"> 
        <label bind-text="user.label('sex')" class="x-label" xid="label6"/>  
        <input class="form-control x-edit" component="$UI/system/components/justep/input/input"
          xid="input9"/> 
      </div>  
      <div class="x-label-edit x-label30" component="$UI/system/components/justep/labelEdit/labelEdit"
        xid="labelInput7"> 
        <label bind-text="user.label('tel')" class="x-label" xid="label7"/>  
        <input class="form-control x-edit" component="$UI/system/components/justep/input/input"
          xid="tel"/> 
      </div>  
      <div class="x-label-edit x-label30" component="$UI/system/components/justep/labelEdit/labelEdit"
        xid="labelInput8"> 
        <label bind-text="user.label('email')" class="x-label" xid="label8"/>  
        <input class="form-control x-edit" component="$UI/system/components/justep/input/input"
          xid="input11"/> 
      </div>  
      <a class="btn btn-link btn-only-label pull-right" component="$UI/system/components/justep/button/button"
        label="提交" onClick="subBtnClick" style="font-size:20px;color:#FF0000;" xid="subBtn"> 
        <i xid="i19"/>  
        <span xid="span22">提交</span> 
      </a>  
      <span xid="userSpan"/> 
    </div> 
  </div> 
</div>
