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
  <div xid="grid_div" style="margin:8px;height:400px;"> 
    <div component="$UI/system/components/justep/grid/grid" hiddenCaptionbar="true"
      altRows="true" class="x-grid-no-bordered" xid="grid2" data="mainData" height="100%"
      width="100%"> 
      <columns> 
        <column width="150" name="fCreateTime" xid="column1"/>  
        <column width="150" name="fDate" editable="false" xid="column2"/>  
        <column width="150" name="fMoney" xid="column3"/>  
        <column width="200" name="fDescription" editable="false" xid="column4"/>  
        <column width="100" name="fClass" xid="column5"/> 
      </columns> 
    </div> 
  </div>
  <div component="$UI/system/components/justep/pagerBar/pagerBar" class="x-pagerbar container-fluid" xid="pagerBar1" data="mainData">
   <div class="row" xid="div1">
    <div class="col-sm-3" xid="div2">
     <div class="x-pagerbar-length" xid="div3">
      <label component="$UI/system/components/justep/pagerLimitSelect/pagerLimitSelect" class="x-pagerlimitselect" xid="pagerLimitSelect1" defaultValue="10">
       <span xid="span20">显示</span>
       <select component="$UI/system/components/justep/select/select" class="form-control input-sm" xid="select1">
        <option value="10" xid="default3">10</option>
        <option value="20" xid="default4">20</option>
        <option value="50" xid="default5">50</option>
        <option value="100" xid="default6">100</option></select> 
       <span xid="span21">条</span></label> </div> </div> 
    <div class="col-sm-3" xid="div4">
     <div class="x-pagerbar-info" xid="div5">当前显示0条，共0条</div></div> 
    <div class="col-sm-6" xid="div6">
     <div class="x-pagerbar-pagination" xid="div7">
      <ul class="pagination" component="$UI/system/components/bootstrap/pagination/pagination" xid="pagination2">
       <li class="prev" xid="li5">
        <a href="#" xid="a5">
         <span aria-hidden="true" xid="span22">«</span>
         <span class="sr-only" xid="span23">Previous</span></a> </li> 
       <li class="next" xid="li6">
        <a href="#" xid="a6">
         <span aria-hidden="true" xid="span24">»</span>
         <span class="sr-only" xid="span25">Next</span></a> </li> </ul> </div> </div> </div> </div><div component="$UI/system/components/justep/controlGroup/controlGroup" class="x-control-group"
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
</div>
