<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window" component="$UI/system/components/justep/window/window"
  design="device:pc">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:7px;top:283px;"> 
    <div component="$UI/system/components/justep/data/data" autoLoad="true"
      xid="dataM" idColumn="fid"> 
      <column label="ID" name="fid" type="String" xid="xid1"/>  
      <column label="名称" name="name" type="String" xid="xid2"/>  
      <data xid="default2">[{"fid":"1","name":"上衣"},{"fid":"2","name":"裤子"},{"fid":"3","name":"帽子"}]</data> 
    </div>  
    <div component="$UI/system/components/justep/data/data" autoLoad="true"
      xid="dataD" idColumn="fid"> 
      <column label="ID" name="fid" type="String"/>  
      <column label="颜色" name="color" type="String"/>  
      <column label="尺寸" name="size" type="String"/>  
      <column label="parent" name="parent" type="String"/>  
      <data xid="default3">[{"fid":"1","color":"红色","size":"185","parent":"1"},{"fid":"2","color":"蓝色","size":"160","parent":"1"},{"fid":"3","color":"黑色","size":"175","parent":"1"},{"fid":"4","color":"白色","size":"155","parent":"2"},{"fid":"5","color":"黑色","size":"180","parent":"2"},{"fid":"6","color":"白色","size":"7","parent":"3"}]</data> 
    </div>  
    <div component="$UI/system/components/justep/data/data" autoLoad="true"
      xid="dataType" idColumn="value"> 
      <column label="值" name="value" type="String" xid="xid5"/>  
      <column label="显示名" name="label" type="String" xid="xid6"/>  
      <data xid="default1">[{"value":"上衣","label":"上衣"},{"value":"裤子","label":"裤子"},{"value":"帽子","label":"帽子"},{"value":"手套","label":"手套"}]</data> 
    </div> 
  </div>  
  <div component="$UI/system/components/justep/panel/panel" class="x-panel x-full"
    xid="panel1"> 
    <div class="x-panel-top" xid="top1"><div component="$UI/system/components/justep/titleBar/titleBar" class="x-titlebar" xid="titleBar1" title="listTable">
   <div class="x-titlebar-left" xid="div1"><a component="$UI/system/components/justep/button/button" class="btn btn-link btn-only-icon" xid="button1" icon="icon-chevron-left" onClick="{operation:'window.close'}">
   <i xid="i3" class="icon-chevron-left"></i>
   <span xid="span1"></span></a></div>
   <div class="x-titlebar-title" xid="div2">listTable</div>
   <div class="x-titlebar-right reverse" xid="div3"></div></div></div>  
    <div class="x-panel-content" xid="content1">
      <a component="$UI/system/components/justep/button/button" class="btn btn-link"
        label="js" onClick="showJsSource"> 
        <i/>  
        <span>js</span> 
      </a>  
      <a component="$UI/system/components/justep/button/button" class="btn btn-link"
        label="源码" onClick="showSource" bind-visible="isVisible"> 
        <i/>  
        <span>源码</span> 
      </a>  
      <p xid="p1">两层listTable嵌套展现，点击主数据行可折叠显示子数据，table、tr样式可通过对应组件的class修改</p>  
      <div component="$UI/system/components/fragment/list/listTable" data="dataM"
        masterData="" masterCol="" xid="listTable1"> 
        <div component="$UI/system/components/justep/list/list" class="x-list"
          data="dataM" xid="list1"> 
          <table class="table table-bordered table-hover table-striped table-condensed"
            component="$UI/system/components/bootstrap/table/table" xid="table1"> 
            <thead xid="thead1"> 
              <tr class="success" xid="tr1"> 
                <th width="60px" xid="col1"> 
                  <label xid="label1"/> 
                </th>  
                <th xid="col2"> 
                  <label bind-text="$model.dataM.label('name')" xid="label2"/> 
                </th> 
              </tr> 
            </thead>  
            <tbody class="x-list-template" bind-click="$model!=$object?$object.data.to($object):null"
              xid="listTemplate1"> 
              <tr class="info" bind-click="function(){var $e = $($element);$('&gt;td&gt;i.x-expand-i',$e).toggleClass('icon-arrow-right-b');$e.next().toggleClass('hide');}"
                xid="tr2"> 
                <td class="text-center" style="vertical-align:middle;" xid="td1"> 
                  <i class="x-expand-i " style="color:#808080;padding-right:6px;"
                    xid="i1"/>  
                  <label bind-text="$index()+1" xid="label3"/> 
                </td>  
                <td xid="td2"> 
                  <select component="$UI/system/components/justep/select/select"
                    class="form-control" bind-ref="ref('name')" xid="select1" bind-options="$model.dataType"
                    bind-optionsValue="value" bind-optionsLabel="label"/> 
                </td> 
              </tr>  
              <tr xid="tr3"> 
                <td colspan="2" xid="td3"> 
                  <div component="$UI/system/components/fragment/list/listTable"
                    data="dataD" masterData="dataM" masterCol="parent" xid="listTable2"> 
                    <div component="$UI/system/components/justep/list/list"
                      class="x-list" data="dataD" xid="list2"> 
                      <table class="table table-bordered table-hover table-striped table-condensed"
                        component="$UI/system/components/bootstrap/table/table" xid="table2"> 
                        <thead xid="thead2"> 
                          <tr class="danger" xid="tr4"> 
                            <th width="60px" xid="col3"> 
                              <label xid="label4"/> 
                            </th>  
                            <th xid="col4"> 
                              <label bind-text="$model.dataD.label('color')"
                                xid="label5"/> 
                            </th>  
                            <th xid="col5"> 
                              <label bind-text="$model.dataD.label('size')" xid="label6"/> 
                            </th> 
                          </tr> 
                        </thead>  
                        <tbody class="x-list-template" bind-click="$model!=$object?$object.data.to($object):null"
                          xid="listTemplate2"> 
                          <tr class="warning" xid="tr5"> 
                            <td class="text-center" style="vertical-align:middle;"
                              xid="td4"> 
                              <i class="x-expand-i " style="color:#808080;padding-right:6px;"
                                xid="i2"/>  
                              <label bind-text="$index()+1" xid="label7"/> 
                            </td>  
                            <td xid="td5"> 
                              <input component="$UI/system/components/justep/input/input"
                                class="form-control" bind-ref="ref('color')" xid="input1"/> 
                            </td>  
                            <td xid="td6"> 
                              <input component="$UI/system/components/justep/input/input"
                                class="form-control" bind-ref="ref('size')" xid="input2"/> 
                            </td> 
                          </tr> 
                        </tbody> 
                      </table> 
                    </div> 
                  </div> 
                </td> 
              </tr> 
            </tbody> 
          </table> 
        </div> 
      </div>
    </div>  
    <div class="x-panel-bottom" xid="bottom1"/>
  </div>
</div>
