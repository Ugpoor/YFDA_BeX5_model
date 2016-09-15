<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window" component="$UI/system/components/justep/window/window"
  design="device:pc">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:890px;top:133px;"
    onModelConstruct="modelModelConstruct"> 
    <div component="$UI/system/components/justep/data/data" autoLoad="true"
      xid="dataDB" idColumn="name" onCustomRefresh="dataDBCustomRefresh" onValueChanged="dataDBValueChanged"> 
      <column label="选择" name="checked" type="Boolean" xid="xid2"/>  
      <column label="名称(*)" name="name" type="String" xid="xid1"/>
    </div> 
  </div>  
  <div component="$UI/system/components/justep/panel/panel" class="x-panel x-full"
    xid="panel1"> 
    <div class="x-panel-content" xid="content1"> 
      <div component="$UI/system/components/fragment/list/listTable" data="dataDB"
        masterData="" masterCol="" xid="listTable2" style="padding:8px;max-width:600px"> 
        <div component="$UI/system/components/justep/list/list" class="x-list"
          data="dataDB" xid="list2"> 
          <table class="table table-condensed table-hover table-striped" component="$UI/system/components/bootstrap/table/table"
            xid="table2"> 
            <thead xid="thead2"> 
              <tr xid="tr3"> 
                <th xid="col3" style="width:80px;"> 
                  <label bind-text="$model.dataDB.label('checked')" xid="label3"/>
                </th>  
                <th xid="col4"> 
                  <label bind-text="$model.dataDB.label('name')" xid="label4"/>
                </th> 
              </tr> 
            </thead>  
            <tbody class="x-list-template" bind-click="$model!=$object?$object.data.to($object):null"
              xid="tbody2"> 
              <tr xid="tr4"> 
                <td xid="td3" style="text-align:center;"> 
                  <span component="$UI/system/components/justep/button/checkbox"
                    class="x-checkbox" bind-ref="ref('checked')" xid="checkbox1"/>
                </td>  
                <td xid="td4"> 
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
</div>
