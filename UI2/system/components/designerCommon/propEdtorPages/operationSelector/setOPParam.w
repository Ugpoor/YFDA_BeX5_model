<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window" component="$UI/system/components/justep/window/window"
  design="device:pc">  
  <div component="$UI/system/components/justep/model/model" xid="model" onParamsReceive="modelParamsReceive"> 
    <div component="$UI/system/components/justep/data/data" autoLoad="true"
      xid="data" idColumn="name"> 
      <column label="参数名" name="name" type="String" xid="xid1"></column>
  <column label="显示名" name="displayName" type="String" xid="xid2"></column>
  <column label="参数值" name="value" type="String" xid="xid3"></column>
  <column label="默认值" name="defaultValue" type="String" xid="xid4"></column>
  <column label="参数类型" name="type" type="String" xid="xid5"></column></div> 
  </div>  
  <div component="$UI/system/components/justep/panel/panel" class="x-panel x-full"
    xid="panel1"> 
    <div class="x-panel-content" xid="content1">
      <div component="$UI/system/components/fragment/list/listTable" data="data"
        masterData="" masterCol="" xid="listTable1"> 
        <div component="$UI/system/components/justep/list/list" class="x-list"
          data="data" xid="list1"> 
          <table class="table table-condensed table-hover table-striped" component="$UI/system/components/bootstrap/table/table"
            xid="table1"> 
            <thead xid="thead1"> 
              <tr xid="tr1"> 
                <th width="60px" xid="col1" style="width:20px;"> 
                  <label xid="label1"/>
                </th>  
                <th xid="col2" style="width:20%;"> 
                  <label bind-text="$model.data.label('name')" xid="label2"/>
                </th>  
                <th xid="col3" style="width:20%;"> 
                  <label bind-text="$model.data.label('displayName')" xid="label3"/>
                </th>  
                <th style="width:25%;"> 
                  <label bind-text="$model.data.label('defaultValue')"/>
                </th>  
                <th xid="col4" style="width:30%;"> 
                  <label bind-text="$model.data.label('value')" xid="label4"/>
                </th> 
              </tr> 
            </thead>  
            <tbody class="x-list-template" bind-click="$model!=$object?$object.data.to($object):null"
              xid="listTemplate1"> 
              <tr xid="tr2" bind-css="{'info':$object==$model.data.getCurrentRow()}"> 
                <td class="text-center" style="vertical-align:middle;" xid="td1"> 
                  <i class="x-expand-i " style="color:#808080;padding-right:6px;"
                    xid="i3"/>  
                  <label bind-text="$index()+1" xid="label5"/>
                </td>  
                <td xid="td2"> 
                  <div component="$UI/system/components/justep/output/output"
                    class="x-output" bind-ref="ref('name')" xid="output1"/>
                </td>  
                <td xid="td3"> 
                  <div component="$UI/system/components/justep/output/output"
                    class="x-output" bind-ref="ref('displayName')" xid="output2"/>
                </td>  
                <td> 
                  <div component="$UI/system/components/justep/output/output"
                    class="x-output" bind-ref="ref('defaultValue')"/>
                </td>  
                <td xid="td4"> 
                  <div class="input-group" component="$UI/system/components/bootstrap/inputGroup/inputGroup" xid="inputGroup1">
   <input type="text" class="form-control" component="$UI/system/components/justep/input/input" xid="input1" bind-ref='ref("value")' readonly="true"></input>
  <div class="input-group-btn" xid="layoutWizard1">
   <a component="$UI/system/components/justep/button/button" class="btn btn-default btn-only-icon" label="button" xid="button1" icon="icon-more" bind-click="button1Click">
    <i xid="i4" class="icon-more"></i>
    <span xid="span3"></span></a> </div></div></td> 
              </tr> 
            </tbody> 
          </table> 
        </div> 
      </div>
    </div>  
    <div class="x-panel-bottom" xid="bottom1"> 
      <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-only-label x-dialog-button"
        label="取消" xid="cancelBtn" onClick="{operation:'window.close'}"> 
        <i xid="i2"/>  
        <span xid="span2">取消</span> 
      </a>  
      <a component="$UI/system/components/justep/button/button" class="btn btn-primary x-dialog-button"
        label="确定" xid="OKBtn" onClick="OKBtnClick"> 
        <i xid="i1"/>  
        <span xid="span1">确定</span> 
      </a> 
    </div> 
  </div> 
</div>
