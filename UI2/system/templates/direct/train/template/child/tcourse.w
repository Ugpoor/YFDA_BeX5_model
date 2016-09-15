<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xmlns:xu="http://www.xmldb.org/xupdate"
  xmlns:xui="http://www.justep.com/xui" __id="id_1" component="$UI/system/components/justep/window/window" extends="../parent/parent.w"
  xid="window" class="window" design="device:m;">  
  <div autoLoad="true" component="$UI/system/components/justep/data/data" idColumn="course"
    xid="train" xui:parent="model" xui:update-mode="insert"> 
    <column label="培训科目：" name="course" type="String" xid="xid3"/>  
    <column label="培训时间：" name="time" type="String" xid="xid4"/>  
    <column label="授课信息：" name="infomation" type="String" xid="xid5"/>  
    <column label="授课教师：" name="teacher" type="String" xid="xid6"/> 
  </div>  
  <div class="x-control-group" component="$UI/system/components/justep/controlGroup/controlGroup"
    title="高考培训" xid="controlGroup1" xui:parent="content1" xui:update-mode="insert"> 
    <div class="x-control-group-title" xid="controlGroupTitle1"> 
      <span xid="span18">title</span> 
    </div>  
    <div class="form-horizontal container-fluid" component="$UI/system/components/bootstrap/form/form"
      xid="form1"> 
      <div class="x-label-edit x-label30" component="$UI/system/components/justep/labelEdit/labelEdit"
        xid="labelInput1"> 
        <label bind-text="train.label('course')" class="pull-right x-label" xid="label1"/>  
        <input class="form-control x-edit" component="$UI/system/components/justep/input/input"
          xid="input4"/> 
      </div>  
      <div class="x-label-edit x-label30" component="$UI/system/components/justep/labelEdit/labelEdit"
        xid="labelInput2"> 
        <label bind-text="train.label('time')" class="pull-right x-label" xid="label2"/>  
        <input class="form-control x-edit" component="$UI/system/components/justep/input/input"
          xid="input5"/> 
      </div>  
      <div class="x-label-edit x-label30" component="$UI/system/components/justep/labelEdit/labelEdit"
        xid="labelInput3"> 
        <label bind-text="train.label('infomation')" class="x-label" xid="label3"/>  
        <input class="form-control x-edit" component="$UI/system/components/justep/input/input"
          xid="input6"/> 
      </div>  
      <div class="x-label-edit x-label30" component="$UI/system/components/justep/labelEdit/labelEdit"
        xid="labelInput4"> 
        <label bind-text="train.label('teacher')" class="x-label" xid="label4"/>  
        <input class="form-control x-edit" component="$UI/system/components/justep/input/input"
          xid="input7"/> 
      </div>  
      <a class="btn btn-link pull-right" component="$UI/system/components/justep/button/button"
        label="我要报名" onClick="toBtnClick" style="font-size:18px;color:#C60000;" xid="toBtn"> 
        <i xid="i17"/>  
        <span xid="span19">我要报名</span> 
      </a> 
    </div> 
  </div> 
</div>
