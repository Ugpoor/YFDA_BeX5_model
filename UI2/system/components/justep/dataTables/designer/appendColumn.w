<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" component="$UI/system/components/justep/window/window">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="top:6px;height:auto;left:455px;"
    onLoad="modelLoad"> 
    <div component="$UI/system/components/justep/data/data" xid="data" idColumn="name"
      confirm-delete="false" confirm-refresh="false"> 
      <column label="名称" name="name" type="String" xid="xid1"></column>
  <column label="数据类型" name="type" type="String" xid="xid2"></column>
  <column label="显示名称" name="displayName" type="String" xid="xid3"></column>
  <column label="选中" name="selected" type="Boolean" xid="xid4"></column></div> 
  </div>  
  <div component="$UI/system/components/justep/controlGroup/controlGroup" class="x-control-group"> 
    <div component="$UI/system/components/fragment/list/listTable" data="data"
      masterData="" masterCol="" xid="listTable1"> 
      <div component="$UI/system/components/justep/list/list" class="x-list"
        data="data" xid="list1"> 
        <table class="table table-condensed table-hover table-striped" component="$UI/system/components/bootstrap/table/table"
          xid="table1"> 
          <thead xid="thead1"> 
            <tr xid="tr1"> 
              <th xid="col4" style="text-align:center;"> 
                <span component="$UI/system/components/justep/button/checkbox"
                  class="x-checkbox" xid="checkbox2" onChange="checkbox2Change"/> 
              </th>  
              <th xid="col1"> 
                <label bind-text="$model.data.label('name')" xid="label1"/> 
              </th>  
              <th xid="col3"> 
                <label bind-text="$model.data.label('displayName')" xid="label3"/> 
              </th>  
              <th xid="col2"> 
                <label bind-text="$model.data.label('type')" xid="label2"/> 
              </th> 
            </tr> 
          </thead>  
          <tbody class="x-list-template" bind-click="$model!=$object?$object.data.to($object):null"
            xid="listTemplate1"> 
            <tr xid="tr2"> 
              <td xid="td4" style="text-align:center;"> 
                <span component="$UI/system/components/justep/button/checkbox"
                  class="x-checkbox" bind-ref="ref('selected')" xid="checkbox1"/> 
              </td>  
              <td xid="td1"> 
                <div component="$UI/system/components/justep/output/output"
                  class="x-output" bind-ref="ref('name')" xid="output1"/> 
              </td>  
              <td xid="td3"> 
                <div component="$UI/system/components/justep/output/output"
                  class="x-output" bind-ref="ref('displayName')" xid="output3"/> 
              </td>  
              <td xid="td2"> 
                <div component="$UI/system/components/justep/output/output"
                  class="x-output" bind-ref="ref('type')" xid="output2"/> 
              </td> 
            </tr> 
          </tbody> 
        </table> 
      </div> 
    </div> 
  </div> 
</div>
