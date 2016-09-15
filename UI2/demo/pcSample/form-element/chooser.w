<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window" component="$UI/system/components/justep/window/window"
  design="device:pc">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:108px;top:277px;">
    <div component="$UI/system/components/justep/data/data" autoLoad="true"
      xid="chooseData" idColumn="name" confirmRefresh="false" confirmDelete="false">
      <column label="名称" name="name" type="String" xid="xid1"/>  
      <data xid="default1">[{"name":"员工1"},{"name":"员工2"},{"name":"员工3"},{"name":"员工4"},{"name":"员工5"},{"name":"员工6"},{"name":"员工7"}]</data>
    </div>  
    <div component="$UI/system/components/justep/data/data" autoLoad="true"
      xid="selectedData" idColumn="name" confirmRefresh="false" confirmDelete="false">
      <column label="员工" name="name" type="String" xid="xid2"/>
    </div>
  </div>  
  <div component="$UI/system/components/justep/contents/contents" class="x-contents x-full"
    active="0" xid="contents"> 
    <div class="x-contents-content" xid="content1">
      <h4 xid="h41"><![CDATA[双向选择器  ]]>
  <a component="$UI/system/components/justep/button/button" class="btn btn-link" label="js" xid="jsBtn" onClick="jsBtnClick">
   <i xid="i6"></i>
   <span xid="span7">js</span></a>
  <a component="$UI/system/components/justep/button/button" class="btn btn-link" label="源码" xid="sourceBtn" bind-visible="isVisible" onClick="sourceClick">
   <i xid="i7"></i>
   <span xid="span8">源码</span></a></h4><div component="$UI/system/components/justep/controlGroup/controlGroup"
        class="x-control-group" xid="controlGroup1" style="height:381px;"> 
        <div class="x-control-group-title" xid="controlGroupTitle1"> 
          <span xid="span1">title</span>
        </div>  
        <div component="$UI/system/components/justep/row/row" class="x-row"
          xid="row2"> 
          <div class="x-col x-col-fixed" xid="col5" style="width:45%;">
            <div xid="chooseDiv" style="height:auto;"> 
              <div component="$UI/system/components/justep/dataTables/dataTables"
                flexibleWidth="true" rowActiveClass="active" class="table table-hover table-striped"
                xid="chooseDataTables" data="chooseData" onRowDblClick="chooseDataTablesRowDblClick"> 
                <columns xid="columns1"> 
                  <column name="name" xid="column1" label="员工" orderable="false"/>
                </columns> 
              </div> 
            </div>
          </div>  
          <div class="x-col css" xid="col6" style="width:10%;">
            <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left btn-block"
              label="全选" xid="addAllBtn" icon="icon-chevron-right" onClick="addAllBtnClick"> 
              <i xid="i1" class="icon-chevron-right"/>  
              <span xid="span2">全选</span>
            </a>  
            <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left btn-block"
              label="添加" xid="addBtn" icon="icon-chevron-right" onClick="addBtnClick"> 
              <i xid="i3" class="icon-chevron-right"/>  
              <span xid="span4">添加</span>
            </a>
            <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left btn-block"
              label="移除" xid="remove" icon="icon-chevron-left" onClick="removeClick"> 
              <i xid="i4" class="icon-chevron-left"/>  
              <span xid="span5">移除</span>
            </a>  
            <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left btn-block"
              label="清空" xid="removeAllBtn" icon="icon-chevron-left" onClick="removeAllBtnClick"> 
              <i xid="i2" class="icon-chevron-left"/>  
              <span xid="span3">清空</span>
            </a>
          </div>  
          <div class="x-col x-col-fixed" xid="col7" style="width:45%;">
            <div xid="div2" style="height:auto;"> 
              <div component="$UI/system/components/justep/dataTables/dataTables"
                flexibleWidth="true" rowActiveClass="active" class="table table-hover table-striped"
                xid="selecteDdataTables" data="selectedData" onRowDblClick="selecteDdataTablesRowDblClick"> 
                <columns xid="columns2"> 
                  <column name="name" xid="column2" label="员工" orderable="false"/>
                </columns> 
              </div> 
            </div>
          </div>
        </div>  
        <div component="$UI/system/components/bootstrap/row/row" class="row"
          xid="row1"> 
          <div class="col col-xs-4 pull-right" xid="col3">
            <a component="$UI/system/components/justep/button/button" class="btn btn-link pull-right"
              label="获取选中值" xid="valueBtn" onClick="valueBtnClick"> 
              <i xid="i5"/>  
              <span xid="span6">获取选中值</span>
            </a>
          </div>
        </div> 
      </div>
    </div>
  </div>
</div>
