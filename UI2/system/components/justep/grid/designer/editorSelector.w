<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" component="$UI/system/components/justep/window/window" xid="window">  
  <div component="$UI/system/components/justep/model/model" xid="model" onLoad="modelLoad">
    <div component="$UI/system/components/justep/data/data" autoLoad="true"
      xid="data" idColumn="type" confirmDelete="false" confirmRefresh="false">
      <column label="类型" name="type" type="String" xid="xid1"/>  
      <column label="选择" name="checked" type="Boolean" xid="xid2"/>  
      <column label="类型名称" name="name" type="String" xid="xid3"/>  
      <data xid="default1">[{"type":"input","checked":"","name":"输入框(input)"},{"type":"directcheckbox","name":"直接显示复选框(checkbox)"},{"type":"checkbox","name":"复选框(checkbox)"},{"type":"select","name":"下拉选择框(select)"},{"type":"textarea","name":"文本编辑框(textarea)"},{"type":"inputbtn","name":"输入框+按钮(inputButton)"},{"type":"gridselect","name":"列表下拉框(gridSelect)"}]</data>
    </div>
  </div>  
  <div component="$UI/system/components/justep/controlGroup/controlGroup" class="x-control-group"
    xid="controlGroup1"> 
    <div class="x-control-group-title" xid="controlGroupTitle1"> 
      <span xid="span1">title</span>
    </div>  
    <div component="$UI/system/components/fragment/list/listTable" data="data"
      masterData="" masterCol="" xid="listTable1"> 
      <div component="$UI/system/components/justep/list/list" class="x-list"
        data="data" xid="list1"> 
        <table class="table table-hover table-striped" component="$UI/system/components/bootstrap/table/table"
          xid="table1"> 
          <thead xid="thead1"> 
            <tr xid="tr1"> 
              <th xid="col1"> 
                <label bind-text="$model.data.label('checked')" xid="label1"/>
              </th>  
              <th xid="col2"> 
                <label bind-text="$model.data.label('name')" xid="label2"/>
              </th> 
            </tr> 
          </thead>  
          <tbody class="x-list-template" bind-click="$model!=$object?$object.data.to($object):null"
            xid="listTemplate1"> 
            <tr xid="tr2"> 
              <td xid="td1" style="width:20%;"> 
                <span component="$UI/system/components/justep/button/radio"
                  class="x-radio" bind-ref="ref('checked')" xid="radio1" name="select"
                  onChange="radio1Change"/>
              </td>  
              <td xid="td2" bind-click="td2Click"> 
                <div component="$UI/system/components/justep/output/output"
                  class="x-output" bind-ref="ref('name')" xid="output1"/>
              </td> 
            </tr> 
          </tbody> 
        </table> 
      </div> 
    </div>
  </div>
</div>
