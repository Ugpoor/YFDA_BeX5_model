<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" component="$UI/system/components/justep/window/window" design="device:m;"
  xid="window" class="window">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="top:83px;height:auto;left:241px;"/>  
  <div xid="view"> 
    <h3 xid="Page4"><![CDATA[内嵌页面：Page4]]></h3>
    <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label30"
      xid="labelEdit1"> 
      <label class="x-label" xid="label5"><![CDATA[姓名：]]></label>  
      <input component="$UI/system/components/justep/input/input" class="form-control x-edit"
        xid="input3" bind-ref="$model.params.data.ref('name')"/>
    </div>
    <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label30"
      xid="labelEdit2"> 
      <label class="x-label" xid="label6"><![CDATA[年龄：]]></label>  
      <input component="$UI/system/components/justep/input/input" class="form-control x-edit"
        xid="input4" bind-ref="$model.params.data.ref('age')"/>
    </div> 
          <div component="$UI/system/components/fragment/list/listTable" data="$model.params.data"
        masterData="" masterCol="" xid="listTable2"> 
    
        <div component="$UI/system/components/justep/list/list" class="x-list"
          data="$model.params.data" xid="list4"> 
          <table class="table table-bordered table-hover table-striped table-condensed"
            component="$UI/system/components/bootstrap/table/table" xid="table2"> 
            <thead xid="thead3"> 
              <tr class="success" xid="tr5"> 
                <th width="60px" xid="col4"> 
                  <label xid="label7"/>
                </th>  
                <th xid="col5"> 
                  <label bind-text="$model.params.data.label('name')" xid="label8"/>
                </th>  
                <th xid="col6"> 
                  <label bind-text="$model.params.data.label('age')" xid="label9"/>
                </th> 
              </tr> 
            </thead>  
            <tbody class="x-list-template" bind-click="$model!=$object?$object.data.to($object):null"
              xid="tbody3"> 
              <tr class="info" xid="tr6"> 
                <td class="text-center" style="vertical-align:middle;" xid="td5"> 
                  <i class="x-expand-i " style="color:#808080;padding-right:6px;"
                    xid="i9"/>  
                  <label bind-text="$index()+1" xid="label10"/>
                </td>  
                <td xid="td6"> 
                  <input component="$UI/system/components/justep/input/input"
                    class="form-control" bind-ref="ref('name')" xid="input3"/>
                </td>  
                <td xid="td7"> 
                  <input component="$UI/system/components/justep/input/input"
                    class="form-control" bind-ref="ref('age')" xid="input4"/>
                </td> 
              </tr> 
            </tbody> 
          </table> 
        </div> 
    </div>
  </div> 
</div>
