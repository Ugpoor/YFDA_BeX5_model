<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window" component="$UI/system/components/justep/window/window"
  design="device:pc">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:191px;top:40px;"> 
    <div component="$UI/system/components/justep/data/data" autoLoad="true"
      xid="data" idColumn="tID" confirmDelete="false"> 
      <column label="编号" name="tID" type="String" xid="xid5"/>  
      <column label="姓名" name="tName" type="String" xid="xid1"/>  
      <column label="性别" name="tSex" type="String" xid="xid3"/>  
      <column label="年龄" name="tAge" type="String" xid="xid2"/>  
      <column label="地址" name="tAddress" type="String" xid="xid4"/>  
      <column label="操作" name="tOperation" type="String" xid="xid6"/>  
      <data xid="default1">[{"tID":"1","tName":"李四","tSex":"女","tAge":"20","tAddress":"北京市海淀区中关村","tOperation":""}]</data> 
    </div>  
    <div component="$UI/system/components/justep/data/data" autoLoad="true"
      xid="createTableData" idColumn="name"> 
      <column label="姓名" name="name" type="String" xid="xid8"/>  
      <column label="性别" name="sex" type="String" xid="xid9"/>  
      <column label="年龄" name="age" type="String" xid="xid10"/>  
      <column label="手机" name="phone" type="String" xid="xid11"/>  
      <column label="地址" name="address" type="String" xid="xid12"/>  
      <data xid="default2">[{"name":"张三","sex":"男","age":"38","phone":"18736982573","address":"北京海淀中关村"},{"name":"张小三","sex":"男","age":"15","phone":"13568715996","address":"北京海淀牡丹园"}]</data> 
    </div>  
    <div component="$UI/system/components/justep/data/data" autoLoad="true"
      xid="sexData" idColumn="sType"> 
      <column label="性别" name="sType" type="String" xid="column2"/>  
      <data xid="default3">[{"sType":"男"},{"sType":"女"}]</data> 
    </div> 
  </div>  
  <h4 xid="h41"><![CDATA[表格动态操作]]>  
    <a component="$UI/system/components/justep/button/button" class="btn btn-link"
      label="JS" xid="showJSButton" onClick="showJSButtonClick"> 
      <i xid="i5"/>  
      <span xid="span6">JS</span> 
    </a>  
    <a component="$UI/system/components/justep/button/button" class="btn btn-link"
      label="源码" xid="showSourceBtn" onClick="showSourceBtnClick"> 
      <i xid="i6"/>  
      <span xid="span7">源码</span> 
    </a> 
  </h4>  
  <div component="$UI/system/components/justep/controlGroup/controlGroup" class="x-control-group"
    xid="controlGroup1" collapsible="true" title="新增"> 
    <div class="x-control-group-title x-control-group-title-info" xid="controlGroupTitle1"> 
      <span xid="span5"><![CDATA[新增]]></span> 
    </div>  
    <div class="form-horizontal container-fluid" component="$UI/system/components/bootstrap/form/form(bootstrap)"
      xid="form1"> 
      <div class="form-group" xid="formGroup1"> 
        <div class="col-sm-1" xid="col13"> 
          <label class="control-label pull-right" xid="controlLabel1"><![CDATA[姓名:]]></label> 
        </div>  
        <div class="col-sm-2" xid="col14"> 
          <input component="$UI/system/components/justep/input/input" class="form-control"
            xid="nameInput" dataType="String" maxLength="5" pattern="[a-zA-Z\u4e00-\u9fa5]"/> 
        </div>  
        <div class="col-sm-1" xid="col15"> 
          <label class="control-label pull-right" xid="controlLabel2"><![CDATA[性别:]]></label> 
        </div>  
        <div class="col-sm-2" xid="col16"> 
          <span component="$UI/system/components/justep/select/radioGroup" class="x-radios x-edit"
            xid="radioGroup" bind-itemset="sexData" bind-itemsetValue="ref('sType')"
            bind-itemsetLabel="ref('sType')"/> 
        </div>  
        <div class="col-sm-1" xid="col17"> 
          <label class="control-label pull-right" xid="controlLabel3"><![CDATA[年龄:]]></label> 
        </div>  
        <div class="col-sm-2" xid="col18"> 
          <input component="$UI/system/components/justep/input/input" class="form-control"
            xid="ageInput" maxLength="2" placeHolder="年龄必须小于100" pattern="[0-9]"/> 
        </div>  
        <div class="col-sm-1" xid="col19"> 
          <label class="control-label pull-right" xid="controlLabel4"><![CDATA[地址:]]></label> 
        </div>  
        <div class="col-sm-2" xid="col20"> 
          <input component="$UI/system/components/justep/input/input" class="form-control"
            xid="addressInput" dataType="String" maxLength="20"/> 
        </div> 
      </div>  
      <div xid="div1" class="text-center"> 
        <a component="$UI/system/components/justep/button/button" class="btn btn-info"
          label="添加" xid="addButton" onClick="addButtonClick"> 
          <i xid="i1"/>  
          <span xid="span1">添加</span> 
        </a>  
        <a component="$UI/system/components/justep/button/button" class="btn btn-default o-marginLeft"
          label="撤销" xid="backButton" onClick="backButtonClick"> 
          <i xid="i2"/>  
          <span xid="span2">撤销</span> 
        </a> 
      </div> 
    </div> 
  </div>  
  <div component="$UI/system/components/justep/dataTables/dataTables" flexibleWidth="true"
    rowActiveClass="active" class="table table-bordered table-hover table-striped"
    xid="dataTables" data="data" multiSelect="false" onCellRender="dataTablesCellRender"
    onRowClick="dataTablesRowClick" stateSave="false"> 
    <columns xid="columns1"> 
      <column name="tName" xid="column6" orderable="false" width="200" className="x-dt-title-center x-dt-cell-center"/>  
      <column name="tSex" xid="column7" orderable="false" width="150" className="x-dt-title-center x-dt-cell-center"/>  
      <column name="tAge" xid="column8" orderable="false" width="150" className="x-dt-title-center x-dt-cell-center"/>  
      <column name="tAddress" xid="column9" orderable="false" searchable="false"/>  
      <column name="tOperation" xid="column1" orderable="false" label="操作" width="240"
        className="x-dt-title-center x-dt-cell-center"/> 
    </columns> 
  </div>  
  <a component="$UI/system/components/justep/button/button" class="btn btn-info btn-icon-left o-marginTop"
    label="动态创建表格" xid="createTableBtn" icon="icon-android-add" onClick="createTableBtnClick"> 
    <i xid="i3" class="icon-android-add"/>  
    <span xid="span3">动态创建表格</span> 
  </a>  
  <div xid="tableDiv"/>  
  <span component="$UI/system/components/justep/windowDialog/windowDialog" xid="windowsDialog"
    title="修改" showTitle="true" src="$UI/demo/sample/table/dynamicCreate/toDetail.w"
    status="normal" onReceive="windowsDialogReceive" width="50%" height="50%"/>  
  <a component="$UI/system/components/justep/button/button" class="btn btn-info btn-icon-left o-marginTop"
    label="动态生成表单" xid="createFormBtn" icon="icon-plus-round" onClick="createFormBtnClick"> 
    <i xid="i4" class="icon-plus-round"/>  
    <span xid="span4">动态生成表单</span> 
  </a>  
  <div xid="formDiv"/> 
</div>
