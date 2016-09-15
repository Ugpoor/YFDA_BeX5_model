<?xml version="1.0" encoding="UTF-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window" component="$UI/system/components/justep/window/window" design="device:m;">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:51px;top:279px;"><div component="$UI/system/components/justep/data/data" autoLoad="true" xid="textData" idColumn="fID" onCustomRefresh="textDataCustomRefresh"><column label="fID" name="fID" type="String" xid="xid1"></column>
  <column label="姓名" name="fName" type="String" xid="xid2"></column>
  <column label="性别" name="fSex" type="String" xid="xid3"></column>
  <column label="地址" name="fAddress" type="String" xid="xid4"></column>
  <column label="备注" name="fRemark" type="String" xid="xid5"></column>
  <data xid="default1">[]</data></div>
  </div> 
<div component="$UI/system/components/justep/button/buttonGroup" class="btn-group" tabbed="true" xid="title" style="width:100%;height:34px;background-color:#F0F0F0;" selected="button1">
   <a component="$UI/system/components/justep/button/button" class="btn btn-link" label="项目1" xid="button1" style="height:100%;width:96px;" target="pageOne">
    <i xid="i1"></i>
    <span xid="span1">项目1</span></a> 
   <a component="$UI/system/components/justep/button/button" class="btn btn-link" label="项目2" xid="button2" style="width:96px;height:100%;" target="pageTwo">
    <i xid="i2"></i>
    <span xid="span2">项目2</span></a> 
   <a component="$UI/system/components/justep/button/button" class="btn btn-link" label="项目3" xid="button3" style="height:100%;width:96px;" target="pageThree">
    <i xid="i3"></i>
    <span xid="span3">项目3</span></a> 
   <a component="$UI/system/components/justep/button/button" class="btn btn-link" label="项目4" xid="button4" style="width:96px;height:100%;" target="pageFour">
    <i xid="i4"></i>
    <span xid="span4">项目4</span></a> 
   <a component="$UI/system/components/justep/button/button" class="btn btn-link" label="项目5" xid="button5" style="width:96px;height:100%;" target="pageFive">
    <i xid="i5"></i>
    <span xid="span5">项目5</span></a> 
  <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-lg pull-right" label="源码" onClick="sourceClick" bind-visible="isVisible" xid="sourceBtn">
   <i xid="i7"></i>
   <span xid="span12">源码</span></a><a component="$UI/system/components/justep/button/button" class="btn btn-link btn-lg pull-right" label="js" xid="jsBtn" onClick="jsClick">
   <i xid="i6"></i>
   <span xid="span11">js</span></a>
  </div>
  <hr xid="hr1" class="hr"></hr>
  <div component="$UI/system/components/justep/contents/contents" class="x-contents x-full" active="0" xid="contents" style="top:39px;" slidable="true">
   <div class="x-contents-content" xid="pageOne">
    <div component="$UI/system/components/justep/controlGroup/controlGroup" class="x-control-group" title="项目1内容" xid="controlGroup1" style="height:173px;">
     <div class="x-control-group-title" xid="controlGroupTitle1">
      <span xid="span6">项目1内容</span></div> 
     <div component="$UI/system/components/justep/dataTables/dataTables" flexibleWidth="true" rowActiveClass="active" class="table table-hover table-striped" xid="dataTables1" data="textData" ordering="false">
      <columns xid="columns1">
       <column name="fID" xid="column1"></column>
  <column name="fName" xid="column2"></column>
  <column name="fSex" xid="column3"></column>
  <column name="fAddress" xid="column4"></column>
  <column name="fRemark" xid="column5"></column></columns> </div> </div> 
  </div> 
   <div class="x-contents-content" xid="pageTwo">
    <div component="$UI/system/components/justep/controlGroup/controlGroup" class="x-control-group" title="title" xid="controlGroup3">
     <div class="x-control-group-title" xid="controlGroupTitle3">
      <span xid="span8">项目2内容</span></div> 
     <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label30" xid="labelInput1">
      <label class="x-label" xid="label3" bind-text="textData.label('fID')+':'"></label>
      <input component="$UI/system/components/justep/input/input" class="form-control x-edit" xid="input1" bind-ref="textData.ref('fID')"></input></div> 
     <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label30" xid="labelInput2">
      <label class="x-label" xid="label4" bind-text="textData.label('fName')+':'"></label>
      <input component="$UI/system/components/justep/input/input" class="form-control x-edit" xid="input2" bind-ref="textData.ref('fName')"></input></div> 
     <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label30" xid="labelInput3">
      <label class="x-label" xid="label5" bind-text="textData.label('fSex')+':'"></label>
      <input component="$UI/system/components/justep/input/input" class="form-control x-edit" xid="input3" bind-ref="textData.ref('fSex')"></input></div> 
     <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label30" xid="labelInput4">
      <label class="x-label" xid="label6" bind-text="textData.label('fAddress')+':'"></label>
      <input component="$UI/system/components/justep/input/input" class="form-control x-edit" xid="input4" bind-ref="textData.ref('fAddress')"></input></div> 
     <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label30" xid="labelInput5">
      <label class="x-label" xid="label7" bind-text="textData.label('fRemark')+':'"></label>
      <input component="$UI/system/components/justep/input/input" class="form-control x-edit" xid="input5" bind-ref="textData.ref('fRemark')"></input></div> </div> 
  </div> 
   <div class="x-contents-content" xid="pageThree">
    <div component="$UI/system/components/justep/controlGroup/controlGroup" class="x-control-group" title="title" xid="controlGroup4">
     <div class="x-control-group-title" xid="controlGroupTitle4">
      <span xid="span9">项目3内容</span></div> 
     <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label30" xid="labelInput10">
      <label class="x-label" xid="label12" bind-text="textData.label('fID')+':'"></label>
      <input component="$UI/system/components/justep/input/input" class="form-control x-edit" xid="input10" bind-ref="textData.ref('fID')"></input></div> 
     <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label30" xid="labelInput9">
      <label class="x-label" xid="label11" bind-text="textData.label('fName')+':'"></label>
      <input component="$UI/system/components/justep/input/input" class="form-control x-edit" xid="input7" bind-ref="textData.ref('fName')"></input></div> 
     <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label30" xid="labelInput8">
      <label class="x-label" xid="label10" bind-text="textData.label('fSex')+':'"></label>
      <input component="$UI/system/components/justep/input/input" class="form-control x-edit" xid="input6" bind-ref="textData.ref('fSex')"></input></div> 
     <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label30" xid="labelInput7">
      <label class="x-label" xid="label9" bind-text="textData.label('fAddress')+':'"></label>
      <input component="$UI/system/components/justep/input/input" class="form-control x-edit" xid="input9" bind-ref="textData.ref('fAddress')"></input></div> 
     <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label30" xid="labelInput6">
      <label class="x-label" xid="label8" bind-text="textData.label('fRemark')+':'"></label>
      <input component="$UI/system/components/justep/input/input" class="form-control x-edit" xid="input8" bind-ref="textData.ref('fRemark')"></input></div> </div> 
  </div> 
   <div class="x-contents-content" xid="pageFour">
    <div component="$UI/system/components/justep/controlGroup/controlGroup" class="x-control-group" title="项目1内容" xid="controlGroup2" style="height:173px;">
     <div class="x-control-group-title" xid="controlGroupTitle2">
      <span xid="span7">项目4内容</span></div> 
     <div component="$UI/system/components/justep/dataTables/dataTables" flexibleWidth="true" rowActiveClass="active" class="table table-hover table-striped" xid="dataTables2" data="textData">
      <columns xid="columns2">
       <column name="fID" xid="column6"></column>
       <column name="fName" xid="column8"></column>
       <column name="fAge" xid="column7"></column>
       <column name="fAddress" xid="column10"></column>
       <column name="fRemark" xid="column9"></column></columns> </div> </div> 
  </div> 
   <div class="x-contents-content" xid="pageFive">
    <div component="$UI/system/components/justep/controlGroup/controlGroup" class="x-control-group" title="title" xid="controlGroup5">
     <div class="x-control-group-title" xid="controlGroupTitle5">
      <span xid="span10">项目5内容</span></div> 
     <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label30" xid="labelInput15">
      <label class="x-label" xid="label17" bind-text="textData.label('fID')+':'"></label>
      <input component="$UI/system/components/justep/input/input" class="form-control x-edit" xid="input15" bind-ref="textData.ref('fID')"></input></div> 
     <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label30" xid="labelInput14">
      <label class="x-label" xid="label16" bind-text="textData.label('fName')+':'"></label>
      <input component="$UI/system/components/justep/input/input" class="form-control x-edit" xid="input12" bind-ref="textData.ref('fName')"></input></div> 
     <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label30" xid="labelInput13">
      <label class="x-label" xid="label15" bind-text="textData.label('fSex')+':'"></label>
      <input component="$UI/system/components/justep/input/input" class="form-control x-edit" xid="input11" bind-ref="textData.ref('fSex')"></input></div> 
     <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label30" xid="labelInput12">
      <label class="x-label" xid="label14" bind-text="textData.label('fAddress')+':'"></label>
      <input component="$UI/system/components/justep/input/input" class="form-control x-edit" xid="input14" bind-ref="textData.ref('fAddress')"></input></div> 
     <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label30" xid="labelInput11">
      <label class="x-label" xid="label13" bind-text="textData.label('fRemark')+':'"></label>
      <input component="$UI/system/components/justep/input/input" class="form-control x-edit" xid="input13" bind-ref="textData.ref('fRemark')"></input></div> </div> 
  </div> </div></div>