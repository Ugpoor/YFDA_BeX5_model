<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window" component="$UI/system/components/justep/window/window"
  design="device:pc;">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:274px;top:255px;"> 
    <div component="$UI/system/components/justep/data/bizData" xid="orgData"
      concept="SA_OPOrg" autoLoad="true" confirmRefresh="false"> 
      <reader xid="default1" action="/SA/OPM/logic/action/queryOPOrgAction"/> 
    </div> 
  </div>  
  <div component="$UI/system/components/justep/toolBar/toolBar" class="x-toolbar x-toolbar-spliter"
    xid="toolBar1"> 
    <div class="x-control" component="$UI/system/components/justep/smartFilter/smartFilter"
      xid="smartFilter1" style="float: right;" filterData="orgData" filterCols="sFName"> 
      <input type="text" class="form-control" placeholder="搜索" data-bind="valueUpdate: ['input', 'afterkeydown']"
        bind-value="$model.comp($element.parentElement).searchText" bind-change="$model.comp($element.parentElement).onInputChange.bind($model.comp($element.parentElement))"
        xid="input1"/> 
    </div>  
    <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
      label="清除" xid="deleteOrgBtn" icon="icon-android-close" onClick="deleteOrgBtnClick"> 
      <i xid="i3" class="icon-android-close"/>  
      <span xid="span3">清除</span> 
    </a>  
    <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
      label="还原" xid="restoreOrgBtn" icon="icon-ios7-undo" onClick="restoreOrgBtnClick"> 
      <i xid="i5" class="icon-ios7-undo"/>  
      <span xid="span4">还原</span> 
    </a>  
    <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
      label="清除全部" xid="clearAllBtn" icon="icon-close-circled" onClick="clearAllBtnClick"> 
      <i xid="i1" class="icon-close-circled"/>  
      <span xid="span1">清除全部</span> 
    </a> 
  </div>  
  <div component="$UI/system/components/justep/dataTables/dataTables" flexibleWidth="true"
    rowActiveClass="active" class="table table-hover" xid="orgDataTables" data="orgData"
    onCellRender="orgDataTablesCellRender"> 
    <columns xid="columns2"> 
      <column name="sOrgKindID" xid="column4" label="　" width="20px" orderable="false"
        className="x-dt-cell-center"/>  
      <column name="sFName" xid="column3" label="被删除的组织"/> 
    </columns> 
  </div>  
  <div component="$UI/system/components/justep/pagerBar/pagerBar" class="x-pagerbar container-fluid"
    xid="pagerBar1" data="orgData"> 
    <div class="row" xid="div1"> 
      <div class="col-sm-3" xid="div2"> 
        <div class="x-pagerbar-length" xid="div3"> 
          <label component="$UI/system/components/justep/pagerLimitSelect/pagerLimitSelect"
            class="x-pagerlimitselect" xid="pagerLimitSelect1"> 
            <span xid="span2">显示</span>  
            <select component="$UI/system/components/justep/select/select" class="form-control input-sm"
              xid="select1"> 
              <option value="10" xid="default2">10</option>  
              <option value="20" xid="default3">20</option>  
              <option value="50" xid="default4">50</option>  
              <option value="100" xid="default5">100</option>
            </select>  
            <span xid="span5">条</span>
          </label> 
        </div> 
      </div>  
      <div class="col-sm-3" xid="div4"> 
        <div class="x-pagerbar-info" xid="div5">当前显示0条，共0条</div>
      </div>  
      <div class="col-sm-6" xid="div6"> 
        <div class="x-pagerbar-pagination" xid="div7"> 
          <ul class="pagination" component="$UI/system/components/bootstrap/pagination/pagination"
            xid="pagination1"> 
            <li class="prev" xid="li1"> 
              <a href="#" xid="a1"> 
                <span aria-hidden="true" xid="span6">«</span>  
                <span class="sr-only" xid="span7">Previous</span>
              </a> 
            </li>  
            <li class="next" xid="li2"> 
              <a href="#" xid="a2"> 
                <span aria-hidden="true" xid="span8">»</span>  
                <span class="sr-only" xid="span9">Next</span>
              </a> 
            </li> 
          </ul> 
        </div> 
      </div> 
    </div> 
  </div>
</div>
