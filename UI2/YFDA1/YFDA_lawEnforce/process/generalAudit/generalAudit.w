<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" component="$UI/system/components/justep/window/window" xid="window">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:431px;top:134px;">
    <div component="$UI/system/components/justep/data/bizData" xid="mainData"
      directDelete="true" autoLoad="true" autoNew="false" concept="YF_mainApplication"
      columns=""> 
      <reader action="/YFDA1/YFDA_lawEnforce/logic/action/queryYF_mainApplicationAction"/>  
      <writer action="/YFDA1/YFDA_lawEnforce/logic/action/saveYF_mainApplicationAction"/>  
      <creator action="/YFDA1/YFDA_lawEnforce/logic/action/createYF_mainApplicationAction"/>  
      <rule xid="rule2"> 
        <readonly xid="readonly1"> 
          <expr xid="default8">true</expr> 
        </readonly> 
      </rule> 
    </div>
    <div component="$UI/system/components/justep/data/bizData" xid="detailData"
      directDelete="true" autoLoad="true" autoNew="false" concept="YF_Acce"
      limit="-1" columns=""> 
      <reader action="/YFDA1/YFDA_lawEnforce/logic/action/queryYF_AcceAction"/>  
      <writer action="/YFDA1/YFDA_lawEnforce/logic/action/saveYF_AcceAction"/>  
      <creator action="/YFDA1/YFDA_lawEnforce/logic/action/createYF_AcceAction"/>  
      <master xid="default1" data="mainData" relation="fApplicationId"/>  
      <rule xid="rule4"> 
        <readonly xid="readonly3"> 
          <expr xid="default12">true</expr> 
        </readonly> 
      </rule> 
    </div>
  </div>  
  <span component="$UI/system/components/justep/bizFilter/bizFilter" xid="filter"
    filterData="mainData"/>  
  <div component="$UI/system/components/justep/process/process" xid="process"
    data="mainData" autoClose="false" autoStart="false" autoSave="false" autoFilter="false"/>  
  <span component="$UI/system/components/justep/windowDialog/windowDialog" xid="windowDialog3" src="$UI/YFDA1/YFDA_lawEnforce/process/generalAudit/generalAudit_audit.w" height="100%" width="100%" forceRefreshOnOpen="true" status="normal" showTitle="true" resizable="true" routable="false"><result concept="mainData" operation="new" origin="mainData" xid="default9">
   <mapping from="fApplicationId" to="fApplicationId" xid="default10"></mapping></result></span>
  <div component="$UI/system/components/bootstrap/tabs/tabs" xid="tabs" style="height:100%;"> 
    <ul class="nav nav-tabs" xid="nav"> 
      <li class="active" xid="listLi"> 
        <a content="listContent" xid="listItem"><![CDATA[列表]]></a> 
      </li>  
      <li role="presentation" xid="detailLi"> 
        <a content="detailContent" xid="detailItem"><![CDATA[详细]]></a> 
      </li> 
    </ul>  
    <div class="tab-content" xid="content"> 
      <div class="tab-pane active container-fluid" xid="listContent"> 
        <div component="$UI/system/components/justep/toolBar/toolBar" class="x-toolbar x-toolbar-spliter form-inline" xid="listBar"> 
          <a component="$UI/system/components/justep/button/button" class="btn btn-link  btn-icon-left"
            xid="chartBtn" onClick="chartBtnClick" label="流程图" icon="icon-image" style="background-color:transparent;width:15%;"> 
            <i xid="i8" class="icon-image"/>  
            <span xid="span8">流程图</span> 
          </a>  
          <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
            xid="refreshBtn" onClick="{operation:'mainData.refresh'}"> 
            <i xid="i1"/>  
            <span xid="span1"/> 
          </a>  
          <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
            label="" xid="filterBtn" icon="icon-search" onClick="{operation:'filter.menu'}"> 
            <i xid="i4" class="icon-search"/>  
            <span xid="span5"/> 
          </a>  
          <div component="$UI/system/components/justep/smartFilter/smartFilter"
          xid="smartFilter1" filterData="mainData" style="float: right;" filterCols="fApplicationId,fApplicationType,fApplyTime,fApplicationStatus,fIdCode"> 
          <input type="text" class="form-control" placeholder="搜索" data-bind="valueUpdate: ['input', 'afterkeydown']"
            bind-value="$model.comp($element.parentElement).searchText" bind-change="$model.comp($element.parentElement).onInputChange.bind($model.comp($element.parentElement))"
            xid="input1"/> 
        </div>
        </div>  
        <div component="$UI/system/components/justep/dataTables/dataTables"
          flexibleWidth="true" rowActiveClass="active" class="table table-condensed table-hover"
          xid="list" data="mainData" pagingType="simple_numbers" onRowDblClick="listTablesRowDblClick"> 
          <columns xid="column">
            <column name="fApplicationId"/>
            <column name="fApplicationType"/>
            <column name="fApplyTime"/>
            <column name="fApplicationStatus"/>
            <column name="fIdCode"/>
          </columns> 
        </div>  
        <div component="$UI/system/components/justep/pagerBar/pagerBar" class="x-pagerbar container-fluid"
          xid="pagerBar" data="mainData"> 
          <div class="row" xid="div1"> 
            <div class="col-sm-3" xid="div2"> 
              <div class="x-pagerbar-length" xid="div4"> 
                <label component="$UI/system/components/justep/pagerLimitSelect/pagerLimitSelect"
                  class="x-pagerlimitselect" xid="pagerLimitSelect2"> 
                  <span xid="span7">显示</span>  
                  <select component="$UI/system/components/justep/select/select"
                    class="form-control input-sm" xid="select2"> 
                    <option value="10" xid="default14">10</option>  
                    <option value="20" xid="default15">20</option>  
                    <option value="50" xid="default16">50</option>  
                    <option value="100" xid="default17">100</option> 
                  </select>  
                  <span xid="span10">条</span> 
                </label> 
              </div> 
            </div>  
            <div class="col-sm-3" xid="div9"> 
              <div class="x-pagerbar-info" xid="div10">当前显示1-10条，共16条</div> 
            </div>  
            <div class="col-sm-6" xid="div11"> 
              <div class="x-pagerbar-pagination" xid="div12"> 
                <ul class="pagination" component="$UI/system/components/bootstrap/pagination/pagination"
                  xid="pagination1"> 
                  <li class="prev" xid="li3"> 
                    <a href="#" xid="a1"> 
                      <span aria-hidden="true" xid="span11">«</span>  
                      <span class="sr-only" xid="span12">Previous</span> 
                    </a> 
                  </li>  
                  <li class="next" xid="li4"> 
                    <a href="#" xid="a5"> 
                      <span aria-hidden="true" xid="span13">»</span>  
                      <span class="sr-only" xid="span14">Next</span> 
                    </a> 
                  </li> 
                </ul> 
              </div> 
            </div> 
          </div> 
        </div> 
      </div>  
      <div class="tab-pane" xid="detailContent"> 
        <div component="$UI/system/components/justep/toolBar/toolBar" class="x-toolbar x-toolbar-spliter form-inline" xid="detailBar" style="height:100%;"> 
          <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
            xid="chart2Btn" onClick="chart2BtnClick" label="流程图" icon="icon-image" style="height:100%;" disabled="true"> 
            <i xid="i9" class="icon-image"/>  
            <span xid="span9">流程图</span> 
          </a>  
          <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
            xid="preBtn" onClick="{operation:'mainData.prevRow'}"> 
            <i xid="i3"/>  
            <span xid="span3"/> 
          </a>  
          <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
            xid="nextBtn" onClick="{operation:'mainData.nextRow'}"> 
            <i xid="i5"/>  
            <span xid="span4"/> 
          </a> 
        <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left" label="审核" xid="button" onClick="buttonClick" style="height:100%;">
   <i xid="i2"></i>
   <span xid="span2">审核</span></a></div>  
        <div xid="mainForm" class="form-horizontal container-fluid" component="$UI/system/components/bootstrap/form/form">
          <div xid="formGroup1" class="form-group"> 
            <div xid="col11" class="col-sm-2">
              <label xid="fApplicationIdL" class="control-label" bind-text="mainData.label('fApplicationId')"/> 
            </div>  
            <div xid="col12" class="col-sm-4"> 
              <output component="$UI/system/components/justep/output/output" class="form-control"
                xid="fApplicationId" bind-ref="mainData.ref('fApplicationId')"/> 
            </div>  
            <div xid="col13" class="col-sm-2"> 
              <label xid="fApplicationTypeL" class="control-label" bind-text="mainData.label('fApplicationType')"/> 
            </div>  
            <div xid="col14" class="col-sm-4"> 
              <output xid="fApplicationType" component="$UI/system/components/justep/output/output" class="form-control"
                bind-ref="mainData.ref('fApplicationType')"/> 
            </div> 
          </div>
          <div xid="formGroup2" class="form-group"> 
            <div xid="col21" class="col-sm-2">
              <label xid="fApplyTimeL" class="control-label" bind-text="mainData.label('fApplyTime')"/> 
            </div>  
            <div xid="col22" class="col-sm-4"> 
              <output component="$UI/system/components/justep/output/output" class="form-control"
                xid="fApplyTime" bind-ref="mainData.ref('fApplyTime')"/> 
            </div>  
            <div xid="col23" class="col-sm-2"> 
              <label xid="fApplicationStatusL" class="control-label" bind-text="mainData.label('fApplicationStatus')"/> 
            </div>  
            <div xid="col24" class="col-sm-4"> 
              <output xid="fApplicationStatus" component="$UI/system/components/justep/output/output" class="form-control"
                bind-ref="mainData.ref('fApplicationStatus')"/> 
            </div> 
          </div>
          <div xid="formGroup3" class="form-group"> 
            <div xid="col31" class="col-sm-2">
              <label xid="fUserL" class="control-label" bind-text="mainData.label('fUser')"/> 
            </div>  
            <div xid="col32" class="col-sm-4"> 
              <output component="$UI/system/components/justep/output/output" class="form-control"
                xid="fUser" bind-ref="mainData.ref('fUser')"/> 
            </div>  
            <div xid="col33" class="col-sm-2"> 
              <label xid="fIdCodeL" class="control-label" bind-text="mainData.label('fIdCode')"/> 
            </div>  
            <div xid="col34" class="col-sm-4"> 
              <output xid="fIdCode" component="$UI/system/components/justep/output/output" class="form-control"
                bind-ref="mainData.ref('fIdCode')"/> 
            </div> 
          </div>
          <div xid="formGroup4" class="form-group"> 
            <div xid="col41" class="col-sm-2">
              <label xid="fAppComL" class="control-label" bind-text="mainData.label('fAppCom')"/> 
            </div>  
            <div xid="col42" class="col-sm-4"> 
              <output component="$UI/system/components/justep/output/output" class="form-control"
                xid="fAppCom" bind-ref="mainData.ref('fAppCom')"/> 
            </div>  
            <div xid="col43" class="col-sm-2"> 
              <label xid="fAppComRepL" class="control-label" bind-text="mainData.label('fAppComRep')"/> 
            </div>  
            <div xid="col44" class="col-sm-4"> 
              <output xid="fAppComRep" component="$UI/system/components/justep/output/output" class="form-control"
                bind-ref="mainData.ref('fAppComRep')"/> 
            </div> 
          </div>
          <div xid="formGroup5" class="form-group"> 
            <div xid="col51" class="col-sm-2">
              <label xid="fCompanyTypeL" class="control-label" bind-text="mainData.label('fCompanyType')"/> 
            </div>  
            <div xid="col52" class="col-sm-4"> 
              <output component="$UI/system/components/justep/output/output" class="form-control"
                xid="fCompanyType" bind-ref="mainData.ref('fCompanyType')"/> 
            </div>  
            <div xid="col53" class="col-sm-2"> 
              <label xid="fComDistrictL" class="control-label" bind-text="mainData.label('fComDistrict')"/> 
            </div>  
            <div xid="col54" class="col-sm-4"> 
              <output xid="fComDistrict" component="$UI/system/components/justep/output/output" class="form-control"
                bind-ref="mainData.ref('fComDistrict')"/> 
            </div> 
          </div>
          <div xid="formGroup6" class="form-group"> 
            <div xid="col61" class="col-sm-2">
              <label xid="fComAveL" class="control-label" bind-text="mainData.label('fComAve')"/> 
            </div>  
            <div xid="col62" class="col-sm-4"> 
              <output component="$UI/system/components/justep/output/output" class="form-control"
                xid="fComAve" bind-ref="mainData.ref('fComAve')"/> 
            </div>  
            <div xid="col63" class="col-sm-2"> 
              <label xid="fComTelL" class="control-label" bind-text="mainData.label('fComTel')"/> 
            </div>  
            <div xid="col64" class="col-sm-4"> 
              <output xid="fComTel" component="$UI/system/components/justep/output/output" class="form-control"
                bind-ref="mainData.ref('fComTel')"/> 
            </div> 
          </div>
          <div xid="formGroup7" class="form-group"> 
            <div xid="col71" class="col-sm-2">
              <label xid="fComZipL" class="control-label" bind-text="mainData.label('fComZip')"/> 
            </div>  
            <div xid="col72" class="col-sm-4"> 
              <output component="$UI/system/components/justep/output/output" class="form-control"
                xid="fComZip" bind-ref="mainData.ref('fComZip')"/> 
            </div>  
            <div xid="col73" class="col-sm-2"> 
              <label xid="fComRegAddrL" class="control-label" bind-text="mainData.label('fComRegAddr')"/> 
            </div>  
            <div xid="col74" class="col-sm-4"> 
              <output xid="fComRegAddr" component="$UI/system/components/justep/output/output" class="form-control"
                bind-ref="mainData.ref('fComRegAddr')"/> 
            </div> 
          </div>
          <div xid="formGroup8" class="form-group"> 
            <div xid="col81" class="col-sm-2">
              <label xid="fComContactManL" class="control-label" bind-text="mainData.label('fComContactMan')"/> 
            </div>  
            <div xid="col82" class="col-sm-4"> 
              <output component="$UI/system/components/justep/output/output" class="form-control"
                xid="fComContactMan" bind-ref="mainData.ref('fComContactMan')" style="height:100%;width:100%;"/> 
            </div>  
            <div xid="col83" class="col-sm-2"> 
              <label xid="fComContactManTelL" class="control-label" bind-text="mainData.label('fComContactManTel')"/> 
            </div>  
            <div xid="col84" class="col-sm-4"> 
              <output xid="fComContactManTel" component="$UI/system/components/justep/output/output" class="form-control"
                bind-ref="mainData.ref('fComContactManTel')"/> 
            </div> 
          </div>
          <div xid="formGroup9" class="form-group"> 
            <div xid="col91" class="col-sm-2">
              <label xid="fComContactManAddrL" class="control-label" bind-text="mainData.label('fComContactManAddr')"/> 
            </div>  
            <div xid="col92" class="col-sm-4"> 
              <output component="$UI/system/components/justep/output/output" class="form-control"
                xid="fComContactManAddr" bind-ref="mainData.ref('fComContactManAddr')"/> 
            </div>  
            <div xid="col93" class="col-sm-2"> 
              <label xid="fProcessIdL" class="control-label" bind-text="mainData.label('fProcessId')"/> 
            </div>  
            <div xid="col94" class="col-sm-4"> 
              <output xid="fProcessId" component="$UI/system/components/justep/output/output" class="form-control"
                bind-ref="mainData.ref('fProcessId')"/> 
            </div> 
          </div>
          <div xid="formGroup10" class="form-group"> 
            <div xid="col101" class="col-sm-2">
              <label xid="fTimeL" class="control-label" bind-text="mainData.label('fTime')"/> 
            </div>  
            <div xid="col102" class="col-sm-4"> 
              <output component="$UI/system/components/justep/output/output" class="form-control"
                xid="fTime" bind-ref="mainData.ref('fTime')"/> 
            </div>  
            <div xid="col103" class="col-sm-2"> 
              <label xid="fProcessMemoL" class="control-label" bind-text="mainData.label('fProcessMemo')"/> 
            </div>  
            <div xid="col104" class="col-sm-4"> 
              <output xid="fProcessMemo" component="$UI/system/components/justep/output/output" class="form-control"
                bind-ref="mainData.ref('fProcessMemo')" style="height:100%;width:100%;"/> 
            </div> 
          </div>
          <div xid="formGroup11" class="form-group"> 
            <div xid="col111" class="col-sm-2">
              <label xid="fperInChargeIdL" class="control-label" bind-text="mainData.label('fperInChargeId')"/> 
            </div>  
            <div xid="col112" class="col-sm-4"> 
              <output component="$UI/system/components/justep/output/output" class="form-control"
                xid="fperInChargeId" bind-ref="mainData.ref('fperInChargeId')"/> 
            </div> 
          </div>
          <div component="$UI/system/components/bootstrap/accordion/accordion"
            class="panel-group" xid="accordion2" tabbed="false"> 
            <div class="panel panel-default " component="$UI/system/components/bootstrap/panel/panel"
              xid="productPanel"> 
              <div class="panel-heading" xid="heading5"> 
                <h4 class="panel-title" xid="h45" style="height:100%;width:100%;background-color:white;"> 
                  <a xid="a2">从列表</a> 
                </h4> 
              </div>  
              <div class="panel-collapse in" xid="div3"> 
                <div component="$UI/system/components/justep/dataTables/dataTables"
                  flexibleWidth="true" class="table table-condensed table-hover" xid="detailTable"
                  data="detailData" pagingType="simple" rowActiveClass="active"> 
                  <columns xid="columns">
                    <column name="fAcceId" xid="fAcceId" label="附件Id"/>
                    <column name="fAcceName" xid="fAcceName" label="附件名称"/>
                    <column name="fAcceLink" xid="fAcceLink" label="附件链接"/>
                    <column name="fAcceValid" xid="fAcceValid" label="是否有效"/>
                  </columns> 
                </div> 
              </div> 
            </div> 
          </div> 
        </div> 
      </div> 
    </div> 
  </div> 
</div>