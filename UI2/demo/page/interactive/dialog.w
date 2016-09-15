<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" component="$UI/system/components/justep/window/window" design="device:m;"
  xid="window" class="window">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="top:83px;height:auto;left:241px;"
    onParamsReceive="modelParamsReceive">
    <div component="$UI/system/components/justep/data/data" autoLoad="true"
      xid="dlgData" idColumn="name"> 
      <column label="姓名" name="name" type="String" xid="xid1"/>  
      <column label="年龄" name="age" type="Integer" xid="xid2"/>  
      <data xid="default1">[]</data>
    </div>
  </div>  
  <div component="$UI/system/components/justep/panel/panel" class="x-panel x-full"
    xid="panel1"> 
    <div class="x-panel-top" xid="top1"> 
      <div component="$UI/system/components/justep/titleBar/titleBar" title="对话框"
        class="x-titlebar"> 
        <div class="x-titlebar-left"> 
          <a component="$UI/system/components/justep/button/button" label=""
            class="btn btn-link btn-only-icon" icon="icon-chevron-left" onClick="{operation:'window.close'}"
            xid="backBtn"> 
            <i class="icon-chevron-left"/>  
            <span/> 
          </a> 
        </div>  
        <div class="x-titlebar-title">对话框</div>  
        <div class="x-titlebar-right reverse">
          <a component="$UI/system/components/justep/button/button" class="btn btn-link"
            label="显示所有参数" xid="button1" onClick="button1Click"> 
            <i xid="i1"/>  
            <span xid="span1">显示所有参数</span>
          </a>
        </div> 
      </div> 
    </div>  
    <div class="x-panel-content container" xid="content1"> 
      <div component="$UI/system/components/fragment/list/listTable" data="dlgData"
        masterData="" masterCol="" xid="listTable1"> 
        <div component="$UI/system/components/justep/list/list" class="x-list"
          data="dlgData" xid="list1"> 
          <table class="table table-bordered table-hover table-striped table-condensed"
            component="$UI/system/components/bootstrap/table/table" xid="table1"> 
            <thead xid="thead1"> 
              <tr class="success" xid="tr1"> 
                <th width="60px" xid="col1"> 
                  <label xid="label1"/>
                </th>  
                <th xid="col2"> 
                  <label bind-text="$model.dlgData.label('name')" xid="label2"/>
                </th>  
                <th xid="col3"> 
                  <label bind-text="$model.dlgData.label('age')" xid="label3"/>
                </th> 
              </tr> 
            </thead>  
            <tbody class="x-list-template" bind-click="$model!=$object?$object.data.to($object):null"
              xid="tbody1"> 
              <tr class="info" xid="tr2"> 
                <td class="text-center" style="vertical-align:middle;" xid="td1"> 
                  <i class="x-expand-i " style="color:#808080;padding-right:6px;"
                    xid="i3"/>  
                  <label bind-text="$index()+1" xid="label4"/>
                </td>  
                <td xid="td2"> 
                  <input component="$UI/system/components/justep/input/input"
                    class="form-control" bind-ref="ref('name')" xid="input1"/>
                </td>  
                <td xid="td3"> 
                  <input component="$UI/system/components/justep/input/input"
                    class="form-control" bind-ref="ref('age')" xid="input2"/>
                </td> 
              </tr> 
            </tbody> 
          </table> 
        </div> 
      </div>  
      <a component="$UI/system/components/justep/button/button" class="btn btn-default"
        label="通过Mapping机制把data当前行数据传回去" xid="button3" onClick="button3Click"> 
        <i xid="i4"/>  
        <span xid="span3">通过Mapping机制把data当前行数据传回去</span>
      </a>
    </div> 
  </div> 
</div>
