<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" component="$UI/system/components/justep/window/window" xid="window" design="device:pc;">  
  <div component="$UI/system/components/justep/model/model" style="height:auto;left:520px;top:248px;"> 
    <div component="$UI/system/components/justep/data/baasData" autoLoad="true"
      xid="mainData" idColumn="fID" limit="5" saveAction="saveAccount" queryAction="queryAccount"
      tableName="account" url="/justep/account" onBeforeNew="mainDataBeforeNew"> 
      <column label="主键" name="fID" type="String" xid="xid3"/>  
      <column label="创建时间" name="fCreateTime" type="DateTime" xid="xid4"/>  
      <column label="日期" name="fDate" type="Date" xid="xid5"/>  
      <column label="金额" name="fMoney" type="Decimal" xid="xid6"/>  
      <column label="备注" name="fDescription" type="String" xid="xid7"/>  
      <column label="收入\支出" name="fType" type="String" xid="xid8"/>  
      <column label="分类" name="fClass" type="String" xid="xid9"/>  
      <data xid="default2">[]</data> 
    </div>  
    <div component="$UI/system/components/justep/data/baasData" autoLoad="true"
      xid="classData" idColumn="fID" queryAction="queryAccount_class" tableName="account_class"
      url="/justep/account" directDelete="true"> 
      <column label="主键" name="fID" type="String" xid="xid1"/>  
      <column label="支出\收入" name="fType" type="String" xid="xid2"/>  
      <column label="分类" name="fClass" type="String" xid="xid10"/>  
      <data xid="default1">[]</data> 
    </div> 
  </div>  
  <div component="$UI/system/components/justep/controlGroup/controlGroup" class="x-control-group"
    title="MainData" xid="controlGroup1"> 
    <div class="x-control-group-title" xid="controlGroupTitle1"> 
      <span xid="span2">title</span> 
    </div>  
    <div component="$UI/system/components/justep/toolBar/toolBar" class="x-toolbar form-inline" xid="toolBar1"><a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left" onClick="{'operation':'mainData.new'}" xid="button10">
   <i xid="i10"></i>
   <span xid="span15"></span></a><a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left" onClick="{'operation':'mainData.delete'}" xid="button5">
   <i xid="i5"></i>
   <span xid="span14"></span></a><a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left" onClick="{'operation':'mainData.save'}" xid="button3">
   <i xid="i3"></i>
   <span xid="span13"></span></a>
  
  
  <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left" onClick="{'operation':'mainData.firstRow'}" xid="button11">
   <i xid="i11"></i>
   <span xid="span16"></span></a>
  <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left" onClick="{'operation':'mainData.prevRow'}" xid="button12">
   <i xid="i12"></i>
   <span xid="span17"></span></a>
  <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left" onClick="{'operation':'mainData.nextRow'}" xid="button13">
   <i xid="i13"></i>
   <span xid="span18"></span></a>
  <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left" onClick="{'operation':'mainData.lastRow'}" xid="button14">
   <i xid="i14"></i>
   <span xid="span19"></span></a></div><div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label20" xid="labelInput2"> 
      <label class="x-label" xid="label2" bind-text="mainData.label('fClass')" />  
      <div component="$UI/system/components/justep/gridSelect/gridSelect" bind-label="mainData.ref('fString')" bind-ref="mainData.ref('fClass')" multiselect="false" class="x-gridSelect x-edit" autoOptionWidth="false"> 
        <option data="classData" value="fClass"> 
          <columns> 
            <column name="fClass" label="类型" />  
            <column align="right" name="fType" label="支出类型" /> 
          </columns> 
        </option> 
      </div> 
    </div><div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label20"
      xid="labelInput1"> 
      <label class="x-label" xid="label1" bind-text="mainData.label('fCreateTime')"/>  
      <input component="$UI/system/components/justep/input/input" class="form-control x-edit"
        xid="input1" bind-ref="mainData.ref('fCreateTime')"/> 
    </div>  
      
    <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label20"
      xid="labelInput3"> 
      <label class="x-label" xid="label3" bind-text="mainData.label('fDate')"/>  
      <input component="$UI/system/components/justep/input/input" class="form-control x-edit"
        xid="input3" bind-ref="mainData.ref('fDate')"/> 
    </div>  
    <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label20"
      xid="labelInput4"> 
      <label class="x-label" xid="label4" bind-text="mainData.label('fMoney')"/>  
      <input component="$UI/system/components/justep/input/input" class="form-control x-edit"
        xid="input4" bind-ref="mainData.ref('fMoney')"/> 
    </div>  
    <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label20"
      xid="labelTextarea1"> 
      <label class="x-label" xid="label9" bind-text="mainData.label('fDescription')"/>  
      <textarea component="$UI/system/components/justep/textarea/textarea" class="form-control x-edit"
        xid="textarea1" bind-ref="mainData.ref('fDescription')" style="height:89px;"/> 
    </div> 
  
  </div> 
<div component="$UI/system/components/justep/controlGroup/controlGroup" class="x-control-group" title="动态创建gridSelect" xid="controlGroup2">
   <div class="x-control-group-title" xid="controlGroupTitle2">
    <span xid="span1">title</span></div> 
  <div component="$UI/system/components/justep/toolBar/toolBar" class="x-toolbar form-inline" xid="toolBar2"><a component="$UI/system/components/justep/button/button" class="btn btn-default" label="创建" xid="button1" onClick="button1Click">
   <i xid="i1"></i>
   <span xid="span3">创建</span></a>
  <a component="$UI/system/components/justep/button/button" class="btn btn-default" label="释放" xid="button2" onClick="button2Click">
   <i xid="i2"></i>
   <span xid="span4">释放</span></a></div></div></div>
