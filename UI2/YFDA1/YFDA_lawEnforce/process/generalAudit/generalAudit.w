<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window" component="$UI/system/components/justep/window/window"
  design="device:pc">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:204px;top:225px;">
    <div component="$UI/system/components/justep/data/bizData" xid="mainData"
      directDelete="true" autoLoad="true" concept="YF_mainApplication" limit="15" columns=""
      autoNew="false" onSaveCommit="dataSaveCommit"> 
      <reader action="/YFDA1/YFDA_lawEnforce/logic/action/queryYF_mainApplicationAction"/>  
      <writer action="/YFDA1/YFDA_lawEnforce/logic/action/saveYF_mainApplicationAction"/>  
      <creator action="/YFDA1/YFDA_lawEnforce/logic/action/createYF_mainApplicationAction"/> 
    </div>
  </div>  
  <div component="$UI/system/components/justep/toolBar/toolBar" class="x-toolbar x-toolbar-spliter form-inline"
    xid="bar"> 
    <div component="$UI/system/components/justep/smartFilter/smartFilter" xid="smartFilter"
      filterData="mainData" filterCols="fApplicationId,fApplicationType,fApplyTime,fApplicationStatus,fUser" class="pull-right"> 
      <input type="text" class="form-control" placeholder="搜索" data-bind="valueUpdate: ['input', 'afterkeydown']"
        bind-value="$model.comp($element.parentElement).searchText" bind-change="$model.comp($element.parentElement).onInputChange.bind($model.comp($element.parentElement))"
        xid="input1"/> 
    </div>  
    <a component="$UI/system/components/justep/button/button" label=" 新建"
      class="btn btn-link btn-icon-left" icon="icon-plus" onClick="addBtn" xid="newBtn"> 
      <i class="icon-plus"/>  
      <span>新建</span> 
    </a>  
    <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
      label="编辑" xid="editBtn" icon="icon-edit" onClick="editBtnClick"> 
      <i xid="i1" class="icon-edit"/>  
      <span xid="span1">编辑</span> 
    </a>  
    <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
      label="保存" xid="saveBtn" onClick="{&quot;operation&quot;:&quot;mainData.save&quot;}"> 
      <i xid="i3"/>  
      <span xid="label7">保存</span> 
    </a>  
    <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
      label="删除" xid="deleteBtn" onClick="{&quot;operation&quot;:&quot;mainData.delete&quot;}"> 
      <i xid="i4"/>  
      <span xid="span7">删除</span> 
    </a>  
    <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
      xid="refreshBtn" onClick="{&quot;operation&quot;:&quot;mainData.refresh&quot;}" label="刷新"> 
      <i xid="i2"/>  
      <span xid="span2">刷新</span> 
    </a>  
    <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
      label="查询" xid="filterBtn" icon="icon-android-search" onClick="{&quot;operation&quot;:&quot;filter.menu&quot;}"> 
      <i xid="i5" class="icon-android-search"/>  
      <span xid="span8">查询</span> 
    </a> 
  </div>  
  <span component="$UI/system/components/justep/bizFilter/bizFilter" xid="filter"
    filterData="mainData"/>  
  <div component="$UI/system/components/justep/dataTables/dataTables" flexibleWidth="true"
    rowActiveClass="active" class="table table-hover table-striped" xid="list" data="mainData"
    onRowDblClick="editBtnClick"> 
    <columns xid="column">
      <column name="fApplicationId" label="申请表Id"/>
      <column name="fApplicationType" label="申请表类型"/>
      <column name="fApplyTime" label="申请时间"/>
      <column name="fApplicationStatus" label="申请状态"/>
      <column name="fUser" label="申请人用户名"/>
    </columns> 
  </div>  
  <div component="$UI/system/components/justep/pagerBar/pagerBar" class="x-pagerbar container-fluid"
    xid="pagerBar" data="mainData"> 
    <div class="row" xid="div1"> 
      <div class="col-sm-3" xid="div2"> 
        <div class="x-pagerbar-length" xid="div3"> 
          <label component="$UI/system/components/justep/pagerLimitSelect/pagerLimitSelect"
            class="x-pagerlimitselect" xid="pagerLimitSelect1"> 
            <span xid="span3">显示</span>  
            <select component="$UI/system/components/justep/select/select" class="form-control input-sm"
              xid="select1"> 
              <option value="10" xid="default1">10</option>  
              <option value="20" xid="default2">20</option>  
              <option value="50" xid="default3">50</option>  
              <option value="100" xid="default4">100</option> 
            </select>  
            <span xid="span4">条</span> 
          </label> 
        </div> 
      </div>  
      <div class="col-sm-3" xid="div4"> 
        <div class="x-pagerbar-info" xid="div5">当前显示1-10条，共16条</div> 
      </div>  
      <div class="col-sm-6" xid="div6"> 
        <div class="x-pagerbar-pagination" xid="div7"> 
          <ul class="pagination" component="$UI/system/components/bootstrap/pagination/pagination"
            xid="pagination1"> 
            <li class="prev" xid="li1"> 
              <a href="#" xid="a1"> 
                <span aria-hidden="true" xid="span5">«</span>  
                <span class="sr-only" xid="span6">Previous</span> 
              </a> 
            </li>  
            <li class="next" xid="li2"> 
              <a href="#" xid="a2"> 
                <span aria-hidden="true" xid="span9">»</span>  
                <span class="sr-only" xid="span10">Next</span> 
              </a> 
            </li> 
          </ul> 
        </div> 
      </div> 
    </div> 
  </div>  
  <span component="$UI/system/components/justep/windowDialog/windowDialog" xid="windowDialog"
    title="详细" status="normal" showTitle="true" height="70%" width="60%" src="detailDialog.w"
    onReceive="windowDialogReceive">
    	<result concept="mainData" operation="edit" origin="dialogData" xid="default10">
    		<mapping from="YF_mainApplication" to="YF_mainApplication" locator="true" xid="YF_mainApplicationM"/>
    		<mapping from="fApplicationId" to="fApplicationId" xid="fApplicationIdM"/>
    		<mapping from="fApplicationType" to="fApplicationType" xid="fApplicationTypeM"/>
    		<mapping from="fApplyTime" to="fApplyTime" xid="fApplyTimeM"/>
    		<mapping from="fApplicationStatus" to="fApplicationStatus" xid="fApplicationStatusM"/>
    		<mapping from="fUser" to="fUser" xid="fUserM"/>
    	</result>
    </span> 
</div>