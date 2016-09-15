<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" component="$UI/system/components/justep/window/window" xid="window">  
  <div component="$UI/system/components/justep/model/model" style="height:auto;left:520px;top:248px;"> 
    <div component="$UI/system/components/justep/data/bizData" xid="mainData"
      autoLoad="true" concept="DEMO_TABLE1" columns="DEMO_TABLE1,version,fString,fInteger,fFloat,fDecimal,fDate,fDateTime,fTime,fText,fParent,fString0"
      limit="10" isTree="false"> 
      <reader action="/demo/components/logic/action/queryDEMO_TABLE1Action"/>  
      <writer action="/demo/components/logic/action/saveDEMO_TABLE1Action"/>  
      <creator action="/demo/components/logic/action/createDEMO_TABLE1Action"/>  
      <treeOption xid="default14" parentRelation="fParent" delayLoad="true" nodeKindRelation="fString0"/>  
      <rule xid="rule1"> 
        <col name="fDecimal" xid="ruleCol2"> 
          <readonly xid="readonly2"> 
            <expr xid="default2">js:true</expr> 
          </readonly> 
        </col> 
      </rule> 
    </div> 
  </div>
  <div component="$UI/system/components/justep/excel/exportExcel" class="x-export-excel" xid="exportExcel1" data="mainData" style="left:551px;top:328px;"/>  
  <div component="$UI/system/components/justep/toolBar/toolBar" class="x-toolbar form-inline x-toolbar-spliter"
    xid="toolBar1">
    <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
      onClick="{'operation':'exportExcel1.exportExcel'}" xid="button1"> 
      <i xid="i1"/>  
      <span xid="span5"/>
    </a>
  <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left" onClick="{'operation':'importExcel1.importExcel'}" xid="button2">
   <i xid="i2"></i>
   <span xid="span6"></span></a></div>
  <div data="mainData" component="$UI/system/components/justep/dataTables/dataTables"
    class="table table-striped table-hover" xid="example" lengthMenu="10,20,50,100"
    flexibleWidth="false" rowActiveClass="active" multiSelect="true"> 
    <columns> 
      <column name="fString" label="字符串" orderable="false" className="x-dt-title-center x-dt-cell-center"></column>  
      <column name="fInteger" label="整形" className="x-dt-title-center x-dt-cell-right"></column>  
      <column name="fDateTime" label="日期时间" format="yyyy-MM-dd hh:mm"></column>  
      <column name="fFloat" xid="column1" className="x-dt-title-center x-dt-cell-right"/>  
      <column name="fDecimal" xid="column2" className="x-dt-title-center x-dt-cell-right x-text-right"/>
    </columns> 
  </div>  
  <div component="$UI/system/components/justep/pagerBar/pagerBar" class="x-pagerbar container-fluid"
    xid="pagerBar1" data="mainData"> 
    <div class="row" xid="div1"> 
      <div class="col-sm-3" xid="div2"> 
        <div class="x-pagerbar-length" xid="div3"> 
          <label component="$UI/system/components/justep/pagerLimitSelect/pagerLimitSelect"
            class="x-pagerlimitselect" xid="pagerLimitSelect1"> 
            <span xid="span1">显示</span>  
            <select component="$UI/system/components/justep/select/select" class="form-control input-sm"
              xid="select1"> 
              <option value="10" xid="default1">10</option>  
              <option value="20" xid="default3">20</option>  
              <option value="50" xid="default4">50</option>  
              <option value="100" xid="default5">100</option>
            </select>  
            <span xid="span2">条</span>
          </label> 
        </div> 
      </div>  
      <div class="col-sm-3" xid="div5"> 
        <div class="x-pagerbar-info" xid="div6">当前显示1-10条，共16条</div>
      </div>  
      <div class="col-sm-6" xid="div7"> 
        <div class="x-pagerbar-pagination" xid="div8"> 
          <ul class="pagination" component="$UI/system/components/bootstrap/pagination/pagination"
            xid="pagination1"> 
            <li class="prev" xid="li1"> 
              <a href="#" xid="a1"> 
                <span aria-hidden="true" xid="span3">«</span>  
                <span class="sr-only" xid="span4">Previous</span>
              </a> 
            </li>  
            <li class="next" xid="li2"> 
              <a href="#" xid="a2"> 
                <span aria-hidden="true" xid="span10">»</span>  
                <span class="sr-only" xid="span11">Next</span>
              </a> 
            </li> 
          </ul> 
        </div> 
      </div> 
    </div> 
  </div> 
<div component="$UI/system/components/justep/excel/importExcel" xid="importExcel1" style="left:578px;top:328px;" data="mainData" mappings="$UI/system/components/justep/excel/demo/import.mapping.xml" to="DB"></div></div>
