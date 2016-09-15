<?xml version="1.0" encoding="UTF-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window" component="$UI/system/components/justep/window/window" design="device:pc">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:113px;top:107px;"><div component="$UI/system/components/justep/data/data" autoLoad="true" xid="dictionaryData" idColumn="fID" onCustomRefresh="dictionaryDataCustomRefresh"><column label="ID" name="fID" type="String" xid="xid1"></column>
  <column label="字典名称" name="fName" type="String" xid="xid2"></column>
  <column label="字典描述" name="fDescribe" type="String" xid="xid3"></column>
  <column label="字典类型" name="fType" type="String" xid="xid4"></column>
  <data xid="default1">[]</data></div>
  <div component="$UI/system/components/justep/data/data" autoLoad="true" xid="recordData" idColumn="fID" limit="2" onCustomRefresh="recordDataCustomRefresh">
   <column label="   " name="fID" type="String" xid="column1"></column>
  <column label="字典项值" name="fValue" type="String" xid="column2"></column>
  <column label="字典项名称" name="fName" type="String" xid="column3"></column>
  <column label="字典项说明" name="fRemark" type="String" xid="column4"></column>
  <column label="字典项排列顺序" name="fOrder" type="String" xid="xid5"></column>
  <data xid="default2">[]</data></div></div> 
<div component="$UI/system/components/justep/controlGroup/controlGroup" class="x-control-group" xid="controlGroup" title="字典列表">
   <div class="x-control-group-title" xid="controlGroupTitle1" style="height:45px;">
    <span xid="span1">title</span><a component="$UI/system/components/justep/button/button" class="btn btn-link" label="js" xid="jsBtn" onClick="showjsSource">
   <i xid="i9"></i>
   <span xid="span11">js</span></a><a component="$UI/system/components/justep/button/button" class="btn btn-link" label="源码" xid="sourceBtn" onClick="showSource" bind-visible="isVisible">
   <i xid="i8"></i>
   <span xid="span10">源码</span></a></div> 
  <div component="$UI/system/components/justep/list/list" class="x-list" xid="list1" data="dictionaryData">
   <ul class="x-list-template" xid="listTemplateUl1">
    <li xid="li1" style="height:auto;width:294px;" class="pull-left li"><div xid="div1" style="height:163px;width:291px;" class="div"><div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label30" xid="labelOutput1">
   <label class="x-label" xid="label1" bind-text="label('fName')+':'"></label>
   <div component="$UI/system/components/justep/output/output" class="x-output x-edit" xid="output1" bind-ref="ref('fName')"></div></div>
  <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label30" xid="labelOutput2">
   <label class="x-label" xid="label2" bind-text="label('fDescribe')+':'"></label>
   <div component="$UI/system/components/justep/output/output" class="x-output x-edit" xid="output2" bind-ref="ref('fDescribe')"></div></div>
  <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label30" xid="labelOutput3">
   <label class="x-label" xid="label3" bind-text="label('fType')+':'"></label>
   <div component="$UI/system/components/justep/output/output" class="x-output x-edit" xid="output3" bind-ref="ref('fType')"></div></div>
  <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-sm" label="基本维护" xid="button1" icon="icon-edit" onClick="{operation:'popOver1.show'}">
   <i xid="i1" class="icon-edit"></i>
   <span xid="span2">基本维护</span></a>
  <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-sm" label="数据维护" xid="button2" icon="icon-android-note" onClick="{operation:'dataMaintenance.show'}">
   <i xid="i2" class="icon-android-note"></i>
   <span xid="span3">数据维护</span></a>
  <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-sm" label="删除字典" xid="button3" icon="icon-trash-a">
   <i xid="i3" class="icon-trash-a"></i>
   <span xid="span4">删除字典</span></a></div></li></ul> </div></div>
  <div component="$UI/system/components/justep/popOver/popOver" class="x-popOver" xid="popOver1">
   <div class="x-popOver-overlay" xid="div2"></div>
   <div class="x-popOver-content" xid="div3" style="height:163px;width:291px;"><div component="$UI/system/components/justep/controlGroup/controlGroup" class="x-control-group" title="基本信息维护" xid="controlGroup2" style="height:auto;">
   <div class="x-control-group-title" xid="controlGroupTitle2" style="height:40px;background-color:#A7DFEB;">
    <span xid="span5">title<a component="$UI/system/components/justep/button/button" class="btn btn-link btn-only-icon pull-right" label="button" xid="button4" icon="icon-android-close" style="height:28px;">
   <i xid="i4" class="icon-android-close"></i>
   <span xid="span6"></span></a></span><a component="$UI/system/components/justep/button/button" class="btn btn-link btn-sm btn-only-icon pull-right" label="button" xid="button7" icon="icon-android-close" onClick="{operation:'popOver1.hide'}">
   <i xid="i7" class="icon-android-close"></i>
   <span xid="span9"></span></a></div> 
  <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label30" xid="labelInput1" style="width:241px;">
   <label class="x-label" xid="label4" bind-text="dictionaryData.label('fName')+':'"></label>
   <input component="$UI/system/components/justep/input/input" class="form-control x-edit" xid="input1" bind-ref="dictionaryData.ref('fName')"></input></div>
  <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label30" xid="labelInput2">
   <label class="x-label" xid="label5" bind-text="dictionaryData.label('fDescribe')+':'"></label>
   <input component="$UI/system/components/justep/input/input" class="form-control x-edit" xid="input2" bind-ref="dictionaryData.ref('fDescribe')"></input></div>
  <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label30" xid="labelInput3">
   <label class="x-label" xid="label6" bind-text="dictionaryData.label('fType')+':'"></label>
   <input component="$UI/system/components/justep/input/input" class="form-control x-edit" xid="input3" bind-ref="dictionaryData.ref('fType')"></input></div>
  <a component="$UI/system/components/justep/button/button" class="btn btn-link" label="确定" xid="button5" onClick="{operation:'popOver1.hide'}" style="background-color:#F0F0F0;">
   <i xid="i5"></i>
   <span xid="span7">确定</span></a>
  <a component="$UI/system/components/justep/button/button" class="btn btn-link" label="取消" xid="button6" onClick="{operation:'popOver1.hide'}" style="background-color:#F0F0F0;">
   <i xid="i6"></i>
   <span xid="span8">取消</span></a>
  </div></div></div>
  <div component="$UI/system/components/justep/popOver/popOver" class="x-popOver" xid="dataMaintenance">
   <div class="x-popOver-overlay" xid="div6"></div>
   <div class="x-popOver-content" xid="div7" style="height:80%;width:80%;"><div component="$UI/system/components/justep/controlGroup/controlGroup" class=" x-control-group" title="数据维护" xid="controlGroup4" style="width:100%;height:100%;">
   <div class="x-control-group-title" xid="controlGroupTitle4" style="background-color:#298CC7;height:44px;">
    <span xid="span22">title</span>
    <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-only-icon pull-right" label="button" xid="button10" icon="icon-android-close" onClick="{operation:'dataMaintenance.hide'}">
     <i xid="i18" class="icon-android-close"></i>
     <span xid="span20"></span></a> <a component="$UI/system/components/justep/button/button" class="btn btn-link" label="源码" xid="button11" onClick="showDataMaintenanceSource" bind-visible="isVisible">
   <i xid="i10"></i>
   <span xid="span12">源码</span></a></div> 
   <div component="$UI/system/components/justep/button/buttonGroup" class="btn-group" tabbed="true" xid="buttonGroup1" style="width:100%;background-color:#77BBE3;">
    <a component="$UI/system/components/justep/button/button" class="btn btn-link text-warning btn1" label="新增" xid="add" style="width:80px;" icon="icon-android-add">
     <i xid="i17" class="icon-android-add"></i>
     <span xid="span21">新增</span></a> 
    <a component="$UI/system/components/justep/button/button" class="btn btn-link text-warning btn1" label="修改" xid="edit" style="width:80px;" icon="icon-edit">
     <i xid="i16" class="icon-edit"></i>
     <span xid="span18">修改</span></a> 
    <a component="$UI/system/components/justep/button/button" class="btn btn-link text-warning btn1" label="删除" xid="delete" style="width:80px;" icon="icon-trash-b">
     <i xid="i15" class="icon-trash-b"></i>
     <span xid="span19">删除</span></a> 
    <a component="$UI/system/components/justep/button/button" class="btn btn-link text-warning btn1" label="保存" xid="save" style="width:80px;" icon="icon-android-checkmark">
     <i xid="i14" class="icon-android-checkmark"></i>
     <span xid="span17">保存</span></a> </div> 
   <div component="$UI/system/components/justep/dataTables/dataTables" flexibleWidth="true" rowActiveClass="active" class="table table-hover table-striped" xid="dataTables3" data="recordData" ordering="false">
    <columns xid="columns3">
     <column name="fID" xid="column10"></column>
     <column name="fValue" xid="column11"></column>
     <column name="fName" xid="column12"></column>
     <column name="fRemark" xid="column13"></column>
     <column name="fOrder" xid="column14"></column></columns> </div> 
   <div component="$UI/system/components/justep/pagerBar/pagerBar" class="x-pagerbar container-fluid" xid="pagerBar2" data="recordData">
    <div class="row" xid="div9">
     <div class="col-sm-3" xid="div10">
      <div class="x-pagerbar-length" xid="div11">
       <label component="$UI/system/components/justep/pagerLimitSelect/pagerLimitSelect" class="x-pagerlimitselect" xid="pagerLimitSelect2">
        <span xid="span13">显示</span>
        <select component="$UI/system/components/justep/select/select" class="form-control input-sm" xid="select2">
         <option value="10" xid="default6">10</option>
         <option value="20" xid="default7">20</option>
         <option value="50" xid="default8">50</option>
         <option value="100" xid="default9">100</option></select> 
        <span xid="span14">条</span></label> </div> </div> 
     <div class="col-sm-3" xid="div12">
      <div class="x-pagerbar-info" xid="div13">当前显示0条，共0条</div></div> 
     <div class="col-sm-6" xid="div14">
      <div class="x-pagerbar-pagination" xid="div15">
       <ul class="pagination" component="$UI/system/components/bootstrap/pagination/pagination" xid="pagination2">
        <li class="prev" xid="li3">
         <a href="#" xid="a3">
          <span aria-hidden="true" xid="span15">«</span>
          <span class="sr-only" xid="span16">Previous</span></a> </li> 
        <li class="next" xid="li4">
         <a href="#" xid="a4">
          <span aria-hidden="true" xid="span17">»</span>
          <span class="sr-only" xid="span18">Next</span></a> </li> </ul> </div> </div> </div> </div> 
  </div>
  </div></div></div>