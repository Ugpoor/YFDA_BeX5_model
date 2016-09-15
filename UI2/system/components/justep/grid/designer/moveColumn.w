<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" component="$UI/system/components/justep/window/window">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="top:6px;height:auto;left:455px;"
    onLoad="modelLoad"> 
    <div component="$UI/system/components/justep/data/data" xid="data" idColumn="xid"
      confirm-delete="false" confirm-refresh="false"> 
      <column label="显示名" name="names" type="String" xid="xid3"/>  
      <column label="ID" name="xid" type="String" xid="xid4"/>
    </div> 
  </div>  
  <div component="$UI/system/components/justep/controlGroup/controlGroup" class="x-control-group"
    title="移动列" xid="controlGroup2"> 
    <div component="$UI/system/components/justep/toolBar/toolBar" class="x-toolbar form-inline x-toolbar-spliter"
      xid="toolBar1"> 
      <a component="$UI/system/components/justep/button/button" class="btn btn-default btn-icon-left"
        label="上移" xid="up" icon="icon-chevron-up" onClick="upClick"> 
        <i class="icon-chevron-up" xid="i3"/>  
        <span xid="span6">上移</span>
      </a>  
      <a component="$UI/system/components/justep/button/button" class="btn btn-default btn-icon-left"
        label="下移" xid="down" icon="icon-chevron-down" onClick="downClick"> 
        <i class="icon-chevron-down" xid="i4"/>  
        <span xid="span7">下移</span>
      </a> 
    </div> 
  </div>  
  <div component="$UI/system/components/fragment/list/listTable" data="data"
    masterData="" masterCol="" xid="listTable1"> 
    <div component="$UI/system/components/justep/list/list" class="x-list"
      data="data" xid="list1"> 
      <table class="table table-bordered table-hover table-striped table-condensed"
        component="$UI/system/components/bootstrap/table/table" xid="table1"> 
        <thead xid="thead1"> 
          <tr class="success" xid="tr1"> 
            <th xid="col1"> 
              <label bind-text="$model.data.label('names')" xid="label1"/>
            </th> 
          </tr> 
        </thead>  
        <tbody class="x-list-template" bind-click="$model!=$object?$object.data.to($object):null"
          xid="listTemplate1"> 
          <tr class="info" xid="tr2"> 
            <td xid="td1" style="background-color:white;"> 
              <div component="$UI/system/components/justep/output/output" class="x-output"
                bind-ref="ref('names')" xid="output1" bind-css="{'bg-success':val('names')==data.val('names')}"/>
            </td> 
          </tr> 
        </tbody> 
      </table> 
    </div> 
  </div> 
</div>
