<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" component="$UI/system/components/justep/window/window">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="width:106px;height:auto;left:566px;top:353px;"
    onLoad="modelLoad"> 
    <div component="$UI/system/components/justep/data/data" autoLoad="true"
      xid="dataList" idColumn="col0" autoNew="true"> 
      <column label="dataid" name="col0" type="String" xid="default1"/> 
    </div>  
    <div component="$UI/system/components/justep/data/data" autoLoad="true"
      xid="setting" idColumn="id" isTree="true"> 
      <treeOption parentRelation="parent" xid="default4"/>  
      <data xid="default5">[{"id":"1","useIndex":true,"expand":true}]</data>  
      <column label="主键" name="id" type="String" xid="xid2"/>  
      <column label="关联data" name="data" type="String" xid="default2"/>  
      <column label="关联主Data列" name="masterCol" type="String" xid="default3"/>  
      <column label="父主键" name="parent" type="String" xid="xid3"/>  
      <column label="使用索引列" name="useIndex" type="Boolean" xid="xid5"/>  
      <column label="默认展开" name="expand" type="Boolean"/> 
    </div>  
    <div component="$UI/system/components/justep/data/data" autoLoad="true"
      xid="relationList" idColumn="name"> 
      <column label="关系名" name="name" type="String" xid="default21"/>  
      <column label="标签名 " name="label" type="String" xid="default22"/>  
      <column label="组件类型" name="compType" type="String" xid="default23"/>  
      <column label="数据类型" name="data-type" type="String" xid="default24"/>  
      <column label="选择" name="selected" type="Boolean" xid="default25"/>  
      <column label="主从关联列" name="masterCol" type="Boolean" xid="xid1"/>  
      <column label="data" name="data" type="String" xid="xid4"/> 
    </div>  
    <div component="$UI/system/components/justep/data/data" autoLoad="true"
      xid="compType" idColumn="name"> 
      <column label="组件名" name="name" type="String" xid="default8"/>  
      <column label="描述" name="text" type="String" xid="default9"/>  
      <data xid="default15">[{"name":"$UI/system/components/justep/input/input","text":"输入框"},{"name":"$UI/system/components/justep/textarea/textarea","text":"文本域"},{"name":"$UI/system/components/justep/output/output","text":"输出框"},{"name":"$UI/system/components/justep/select/select","text":"选择框"},{"name":"$UI/system/components/justep/button/radio","text":"单选框"},{"name":"$UI/system/components/justep/button/checkbox","text":"复选框"}]</data> 
    </div> 
  </div>  
  <div component="$UI/system/components/justep/controlGroup/controlGroup" class="x-control-group"> 
    <div class="x-control-group-title"> 
      <span/> 
    </div>  
    <div class="form-horizontal container-fluid" component="$UI/system/components/bootstrap/form/form"
      xid="form1"> 
      <div class="form-group" xid="formGroup1"> 
        <div class="col-sm-4"> 
          <div component="$UI/system/components/justep/labelEdit/labelEdit"
            class="x-label-edit" xid="labelSelect1"> 
            <label class="x-label control-label" xid="label1"><![CDATA[选择主data:]]></label>  
            <select component="$UI/system/components/justep/select/select" class="form-control x-edit"
              xid="select2" bind-options="dataList" bind-ref="setting.ref('data')"
              onChange="select2Change" bind-optionsValue="col0"/> 
          </div> 
        </div>  
        <div class="col-sm-2" xid="col14"> 
          <div component="$UI/system/components/justep/labelEdit/labelEdit"
            class="x-label-edit"> 
            <label class="x-label control-label"><![CDATA[生成序号列:]]></label>  
            <span component="$UI/system/components/justep/button/checkbox" class="x-checkbox x-edit"
              xid="checkbox1" bind-ref="setting.ref('useIndex')"/> 
          </div> 
        </div>  
        <div class="col-sm-2" xid="col5"> 
          <div component="$UI/system/components/justep/labelEdit/labelEdit"
            class="x-label-edit"> 
            <label class="x-label control-label"><![CDATA[默认展开:]]></label>  
            <span component="$UI/system/components/justep/button/checkbox" class="x-checkbox x-edit"
              xid="checkbox3" bind-ref="setting.ref('expand')"/> 
          </div> 
        </div>  
        <div class="col-sm-4"> 
          <div component="$UI/system/components/justep/labelEdit/labelEdit"
            class="x-label-edit"> 
            <label class="x-label control-label"><![CDATA[展开图标:]]></label>  
            <select class="form-control x-edit" bind-value="extendIcon"> 
              <option value="">无</option>  
              <option value="icon-arrow-right-b">icon-arrow-right-b</option>  
              <option value="icon-android-add">icon-android-add</option>  
              <option value="icon-chevron-right">icon-chevron-right</option> 
            </select> 
          </div> 
        </div> 
      </div> 
    </div>  
    <table class="table table-bordered table-hover table-striped" component="$UI/system/components/bootstrap/table/table"
      xid="table1"> 
      <thead xid="thead1"> 
        <tr xid="tr1"> 
          <th xid="col19" style="width:100px;text-align:center;"> 
            <span component="$UI/system/components/justep/button/checkbox" class="x-checkbox"
              xid="checkAllM" onChange="checkAllChange"/> 
          </th>  
          <th xid="col12" style="text-align:center;">关系名</th>  
          <th xid="col17" style="text-align:center;">标签名</th>  
          <th xid="col18" style="text-align:center;">组件类型</th> 
        </tr> 
      </thead>  
      <tbody class="x-list-template" bind-foreach="getRelations(setting.val('data'))"> 
        <tr xid="tr2"> 
          <td xid="td5" style="text-align:center;"> 
            <span component="$UI/system/components/justep/button/checkbox" class="x-checkbox"
              xid="checkbox5" bind-ref="ref('selected')"/> 
          </td>  
          <td xid="td2" bind-text="ref('name')"/>  
          <td xid="td3" bind-text="ref('label')"/>  
          <td xid="td4" style="padding:2px"> 
            <select component="$UI/system/components/justep/select/select" class="form-control"
              xid="select1" bind-ref="ref('compType')" bind-options="$model.compType"
              bind-optionsValue="name" bind-optionsLabel="text" style="margin:0"/> 
          </td> 
        </tr> 
      </tbody> 
    </table>  
    <div bind-foreach="getRows()"> 
      <div class="form-horizontal container-fluid" component="$UI/system/components/bootstrap/form/form"> 
        <div class="form-group"> 
          <div class="col-sm-2"> 
            <label class="control-label"><![CDATA[选择从data:]]></label> 
          </div>  
          <div class="col-sm-2"> 
            <select component="$UI/system/components/justep/select/select" class="form-control"
              bind-options="$model.dataList" bind-ref="ref('data')" onChange="select2Change"
              bind-optionsValue="col0"/> 
          </div>  
          <div class="col-sm-2"> 
            <label class="control-label" xid="controlLabel1"><![CDATA[选择关联主数据列:]]></label> 
          </div>  
          <div class="col-sm-2"> 
            <select component="$UI/system/components/justep/select/select" class="form-control"
              bind-options="$model.getRelations(val('data'))" bind-ref="ref('masterCol')"
              bind-optionsValue="name"/> 
          </div>  
          <div class="col-sm-2"> 
            <label class="control-label" xid="controlLabel4">生成序号列:</label> 
          </div>  
          <div class="col-sm-1"> 
            <span component="$UI/system/components/justep/button/checkbox" class="x-checkbox"
              xid="checkbox2" bind-ref="ref('useIndex')"/> 
          </div> 
        </div> 
      </div>  
      <table class="table table-bordered table-hover table-striped" component="$UI/system/components/bootstrap/table/table"> 
        <thead> 
          <tr> 
            <th style="width:100px;text-align:center;"> 
              <span component="$UI/system/components/justep/button/checkbox"
                class="x-checkbox" xid="checkAllD" onChange="checkAllChange"/> 
            </th>  
            <th style="text-align:center;">关系名</th>  
            <th style="text-align:center;">标签名</th>  
            <th style="text-align:center;">组件类型</th> 
          </tr> 
        </thead>  
        <tbody class="x-list-template" bind-foreach="$model.getRelations(val('data'))"> 
          <tr> 
            <td style="text-align:center;"> 
              <span component="$UI/system/components/justep/button/checkbox"
                class="x-checkbox" bind-ref="ref('selected')"/> 
            </td>  
            <td bind-text="ref('name')"/>  
            <td bind-text="ref('label')"/>  
            <td style="padding:2px"> 
              <select component="$UI/system/components/justep/select/select" class="form-control"
                bind-ref="ref('compType')" bind-options="$model.compType" bind-optionsValue="name"
                bind-optionsLabel="text" style="margin:0"/> 
            </td> 
          </tr> 
        </tbody> 
      </table> 
    </div> 
  </div> 
</div>
