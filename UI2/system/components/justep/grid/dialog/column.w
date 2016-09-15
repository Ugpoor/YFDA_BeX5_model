<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" component="$UI/system/components/justep/window/window" xid="window">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:471px;top:147px;"
    onLoad="modelLoad" onParamsReceive="modelParamsReceive"> 
    <div component="$UI/system/components/justep/data/data" xid="data" idColumn="name"
      confirm-delete="false" confirm-refresh="false" onCustomRefresh="dataCustomRefresh"
      autoLoad="false" confirmDelete="false" confirmRefresh="false"> 
      <column label="列" name="name" type="String" xid="xid1"/>  
      <column label="列名" name="displayName" type="String" xid="xid3"/>  
      <column label="选中" name="selected" type="Boolean" xid="xid4"/>
    </div> 
  </div>  
  <div component="$UI/system/components/justep/panel/panel" class="x-panel x-full"
    xid="panel1"> 
    <div class="x-panel-top" xid="top2">
      <div component="$UI/system/components/justep/toolBar/toolBar" class="x-toolbar form-inline x-toolbar-spliter"
        xid="toolBar1">
        <a component="$UI/system/components/justep/button/button" class="btn btn-link"
          label="移到头" onClick="btnFirstClick"> 
          <i/>  
          <span>移到头</span>
        </a>
        <a component="$UI/system/components/justep/button/button" class="btn btn-link"
          label="上移" onClick="btnPrevClick"> 
          <i/>  
          <span>上移</span>
        </a>
        <a component="$UI/system/components/justep/button/button" class="btn btn-link"
          label="下移" onClick="btnNextClick"> 
          <i/>  
          <span>下移</span>
        </a>
        <a component="$UI/system/components/justep/button/button" class="btn btn-link"
          label="移到尾" onClick="btnLastClick"> 
          <i/>  
          <span>移到尾</span>
        </a>
      </div>
    </div>
    <div class="x-panel-content" xid="content1">
      <div component="$UI/system/components/justep/controlGroup/controlGroup"
        class="x-control-group"> 
        <div component="$UI/system/components/fragment/list/listTable" data="data"
          masterData="" masterCol="" xid="listTable1"> 
          <div component="$UI/system/components/justep/list/list" class="x-list"
            data="data" xid="list1"> 
            <table class="table table-condensed table-hover table-striped" component="$UI/system/components/bootstrap/table/table"
              xid="table1"> 
              <thead xid="thead1"> 
                <tr xid="tr1"> 
                  <th xid="col4" style="text-align:center;width:80px;"> 
                    <span component="$UI/system/components/justep/button/checkbox"
                      class="x-checkbox" xid="checkbox2" onChange="checkbox2Change"/> 
                  </th>  
                  <th xid="col3" style="width:240px;"> 
                    <label bind-text="$model.data.label('displayName')" xid="label3"/> 
                  </th>  
                  <th xid="col1" style="width:180px;text-align:center;">调整顺序</th>
                </tr> 
              </thead>  
              <tbody class="x-list-template" bind-click="$model!=$object?$object.data.to($object):null"
                xid="listTemplate1"> 
                <tr xid="tr2" bind-css="{info:$object==$object.data.getCurrentRow()}"> 
                  <td xid="td4" style="text-align:center;"> 
                    <span component="$UI/system/components/justep/button/checkbox"
                      class="x-checkbox" bind-ref="ref('selected')" xid="checkbox1"/> 
                  </td>  
                  <td xid="td3"> 
                    <div component="$UI/system/components/justep/output/output"
                      class="x-output" bind-ref="ref('displayName')" xid="output3"/> 
                  </td>  
                  <td xid="td1" style="text-align:center;">
                    <button xid="btnFirst" class="btn-link" bind-click="btnFirstClick">到头</button>
                    <!-- 
                    <button xid="btnPrev" class="btn-link" bind-click="btnPrevClick">上移</button>  
                    <button xid="btnNext" class="btn-link" bind-click="btnNextClick">下移</button>  
                    -->  
                    <button xid="btnLast" class="btn-link" bind-click="btnLastClick">到尾</button>
                  </td>
                </tr> 
              </tbody> 
            </table> 
          </div> 
        </div> 
      </div> 
    </div>  
    <div class="x-panel-bottom" xid="bottom1" style="padding-top:6px;">
      <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-only-label  x-dialog-button"
        label="取消" onClick="{operation:'window.close'}" xid="button1"> 
        <i xid="i2"/>  
        <span xid="span2">取消</span>
      </a>
      <a component="$UI/system/components/justep/button/button" class="btn btn-primary  x-dialog-button"
        label="确定" onClick="btnOKClick" xid="btnOK"> 
        <i xid="i1"/>  
        <span xid="span1">确定</span>
      </a>
    </div>
  </div>
</div>
