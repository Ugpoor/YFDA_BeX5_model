<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window" component="$UI/system/components/justep/window/window"
  design="device:pc;">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:344px;top:194px;"> 
    <div component="$UI/system/components/justep/data/bizData" xid="orderData"
      concept="DEMO_Order" autoLoad="true"> 
      <reader xid="default1" action="/demo/misc/logic/action/queryOrderAction"/>  
      <writer xid="default2" action="/demo/misc/logic/action/saveOrderAction"/>  
      <creator xid="default3" action="/demo/misc/logic/action/createOrderAction"/>  
      <rule xid="rule2"> 
        <readonly xid="readonly1"> 
          <expr xid="default8">true</expr> 
        </readonly> 
      </rule> 
    </div>  
    <div component="$UI/system/components/justep/data/bizData" xid="orderDetailData"
      concept="DEMO_OrderDetail" autoLoad="true" limit="-1"> 
      <reader xid="default4" action="/demo/misc/logic/action/queryOrder_DAction"/>  
      <writer xid="default5" action="/demo/misc/logic/action/saveOrder_DAction"/>  
      <creator xid="default6" action="/demo/misc/logic/action/createOrder_DAction"/>  
      <master xid="default11" data="orderData" relation="fOrderID"/>  
      <rule xid="rule4"> 
        <readonly xid="readonly3"> 
          <expr xid="default12">true</expr> 
        </readonly> 
      </rule> 
    </div> 
    <div component="$UI/system/components/justep/data/bizData" xid="personData"
      concept="SA_OPPerson"> 
      <reader xid="default9" action="/demo/misc/logic/action/queryOPPersonAction"/> 
    </div> 
  </div>  
  <span component="$UI/system/components/justep/bizFilter/bizFilter" xid="orderFilter"
    filterData="orderData"/>  
  <div component="$UI/system/components/justep/process/process" xid="process"
    autoStart="false" autoSave="false" autoFilter="false" autoClose="false"/>  
  <div component="$UI/system/components/bootstrap/tabs/tabs" xid="tab"> 
    <ul class="nav nav-tabs" xid="nav"> 
      <li class="active" xid="listLi"> 
        <a content="listContent" xid="listItem"><![CDATA[列表]]></a> 
      </li>  
      <li role="presentation" xid="detailLi"> 
        <a content="detailContent" xid="detailItem"><![CDATA[详细]]></a> 
      </li> 
    </ul>  
    <div class="tab-content" xid="tabContent"> 
      <div class="tab-pane active" xid="listContent"> 
        <div component="$UI/system/components/justep/toolBar/toolBar" xid="listBar"
          class="x-toolbar x-toolbar-spliter form-inline"> 
          <a component="$UI/system/components/justep/button/button" class="btn btn-link  btn-icon-left"
            xid="chartBtn" onClick="chartBtnClick" label="流程图" icon="icon-image"> 
            <i xid="i8" class="icon-image"/>  
            <span xid="span8">流程图</span> 
          </a>  
          <a component="$UI/system/components/justep/button/button" xid="refreshBtn"
            onClick="{operation:'orderData.refresh'}" class="btn btn-link  btn-icon-left"> 
            <i xid="i1"/>  
            <span xid="span1"/> 
          </a>  
          <a component="$UI/system/components/justep/button/button" label=""
            xid="filterBtn" icon="icon-search" onClick="{operation:'orderFilter.menu'}"
            class="btn btn-link  btn-icon-left"> 
            <i xid="i4" class="icon-search"/>  
            <span xid="span5"/> 
          </a>  
          <div class="input-group" component="$UI/system/components/justep/smartFilter/smartFilter"
            xid="smartFilter" filterData="orderData" filterCols="fOrderCode,fReportID,fReporedDate,fEmploueeName,fCustomerName,fTolotalAmt"> 
            <input type="text" class="form-control" placeholder="搜索" data-bind="valueUpdate: ['input', 'afterkeydown']"
              bind-value="$model.comp($element.parentElement).searchText" bind-change="$model.comp($element.parentElement).onInputChange.bind($model.comp($element.parentElement))"
              xid="input1"/>  
            <span class="input-group-addon x-smartFilter-refresh" bind-click="$model.comp($element.parentElement).refresh.bind($model.comp($element.parentElement))"
              xid="span2"> 
              <i class="icon-android-search" xid="i2"/> 
            </span> 
          </div> 
        </div>  
        <div component="$UI/system/components/justep/dataTables/dataTables"
          flexibleWidth="true" rowActiveClass="active" class="table  table-hover table-striped"
          xid="orderTables" data="orderData" pagingType="simple_numbers"> 
          <columns xid="columns"> 
            <column name="fOrderCode" xid="fOrderCodeD"/>  
            <column name="fReportID" xid="fReportIDD"/>  
            <column name="fReporedDate" xid="fReporedDateD"/>  
            <column name="fEmploueeName" xid="fEmploueeNameD"/>  
            <column name="fCustomerName" xid="fCustomerNameD"/>  
            <column name="fTolotalAmt" xid="fTolotalAmtD"/> 
          </columns> 
        </div>  
        <div component="$UI/system/components/justep/pagerBar/pagerBar" class="x-pagerbar container-fluid"
          xid="pagerBar" data="orderData"> 
          <div class="row" xid="div1"> 
            <div class="col-sm-3" xid="div2"> 
              <div class="x-pagerbar-length" xid="div4"> 
                <label component="$UI/system/components/justep/pagerLimitSelect/pagerLimitSelect"
                  class="x-pagerlimitselect" xid="pagerLimitSelect2"> 
                  <span xid="span71">显示</span>  
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
        <div component="$UI/system/components/justep/toolBar/toolBar" class="x-toolbar x-toolbar-spliter form-inline"
          xid="detailBar"> 
          <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
            xid="chart2Btn" onClick="chart2BtnClick" label="流程图" icon="icon-image"> 
            <i xid="i9" class="icon-image"/>  
            <span xid="span9">流程图</span> 
          </a>  
          <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
            xid="preBtn" onClick="{operation:'orderData.prevRow'}"> 
            <i xid="i3"/>  
            <span xid="span3"/> 
          </a>  
          <a component="$UI/system/components/justep/button/button" class="btn btn-link"
            xid="nextBtn" onClick="{operation:'orderData.nextRow'}"> 
            <i xid="i5"/>  
            <span xid="span4"/> 
          </a> 
        </div>  
        <div class="form-horizontal container-fluid" component="$UI/system/components/bootstrap/form/form"
          xid="detailForm"> 
          <div class="form-group" xid="formGroup1"> 
            <div class="col-sm-2" xid="col1"> 
              <label class="control-label" xid="fOrderCodeL">订单编号</label> 
            </div>  
            <div class="col-sm-4" xid="col2"> 
              <output component="$UI/system/components/justep/output/output" class="form-control"
                xid="fOrderCode" bind-ref="orderData.ref('fOrderCode')"/> 
            </div>  
            <div class="col-sm-2" xid="col3"> 
              <label class="control-label" xid="fOrderDateL">订购日期</label> 
            </div>  
            <div class="col-sm-4" xid="col4"> 
              <input component="$UI/system/components/justep/input/input" class="form-control"
                xid="fOrderDate" bind-ref="orderData.ref('fOrderDate')"/> 
            </div> 
          </div>  
          <div class="form-group" xid="fromGroup2"> 
            <div class="col-sm-2" xid="col5"> 
              <label class="control-label" xid="fCustomerNameL">客户名称</label> 
            </div>  
            <div class="col-sm-4" xid="col6"> 
              <output component="$UI/system/components/justep/output/output" class="form-control"
                xid="fCustomerName" bind-ref="orderData.ref('fCustomerName')"/> 
            </div>  
            <div class="col-sm-2" xid="col7"> 
              <label class="control-label" xid="fReportIDL">申请人</label> 
            </div>  
            <div class="col-sm-4" xid="col8"> 
              <output component="$UI/system/components/justep/output/output" class="form-control"
                bind-ref="orderData.ref('fReportID')" xid="fReportID"/> 
            </div> 
          </div>  
          <div class="form-group" xid="fromGroup3"> 
            <div class="col-sm-2" xid="col9"> 
              <label class="control-label" xid="fEmploueeNameL">雇员名称</label> 
            </div>  
            <div class="col-sm-4" xid="col10"> 
              <output component="$UI/system/components/justep/output/output" class="form-control"
                xid="fEmploueeName" bind-ref="orderData.ref('fEmploueeName')"/> 
            </div>  
            <div class="col-sm-2" xid="col11"> 
              <label class="control-label" xid="fReporedDateL">申请日期</label> 
            </div>  
            <div class="col-sm-4" xid="col12"> 
              <input component="$UI/system/components/justep/input/input" class="form-control"
                bind-ref="orderData.ref('fReporedDate')" xid="fReporedDate"/> 
            </div> 
          </div>  
          <div class="form-group" xid="fromGroup4"> 
            <div class="col-sm-2" xid="col13"> 
              <label class="control-label" xid="fShippedDateL">发货日期</label> 
            </div>  
            <div class="col-sm-4" xid="col14"> 
              <input component="$UI/system/components/justep/input/input" class="form-control"
                bind-ref="orderData.ref('fShippedDate')" xid="fShippedDate"/> 
            </div>  
            <div class="col-sm-2" xid="col15"> 
              <label class="control-label" xid="fRequiredDateL">到货日期</label> 
            </div>  
            <div class="col-sm-4" xid="col16"> 
              <input component="$UI/system/components/justep/input/input" class="form-control"
                bind-ref="orderData.ref('fRequiredDate')" xid="fRequiredDate"/> 
            </div> 
          </div>  
          <div class="form-group" xid="fromGroup5"> 
            <div class="col-sm-2" xid="col17"> 
              <label class="control-label" xid="fTolotalAmtL">金额</label> 
            </div>  
            <div class="col-sm-10" xid="col18"> 
              <output component="$UI/system/components/justep/output/output" class="form-control"
                bind-ref="orderData.ref('fTolotalAmt')" xid="fTolotalAmt"/> 
            </div> 
          </div>  
          <div component="$UI/system/components/justep/controlGroup/controlGroup"
            class="x-control-group" title="产品信息" xid="productGroup" collapsible="true"> 
            <div class="x-control-group-title" xid="productTitle"> 
              <span xid="span7">title</span> 
            </div>  
            <div> 
              <div component="$UI/system/components/justep/dataTables/dataTables"
                flexibleWidth="true" class="table  table-hover table-striped" xid="detailTable"
                data="orderDetailData" pagingType="simple" rowActiveClass="active"> 
                <columns xid="columns1"> 
                  <column name="fProductName" xid="fProductNameT" label="产品名称"/>  
                  <column name="fUnitprice" xid="fUnitpriceT" label="单价（元）"/>  
                  <column name="fQuantity" xid="fQuantityT" label="数量"/>  
                  <column name="fDisCount" xid="fDisCountT" label="折扣率（0.00）"/>  
                  <column name="fFactAmt" xid="fFactAmtT" label="实际金额（元）"/> 
                </columns> 
              </div> 
            </div> 
          </div>  
          <div component="$UI/system/components/justep/controlGroup/controlGroup"
            class="x-control-group" title="主管审核信息" xid="auditorGroup" collapsible="true"> 
            <div class="x-control-group-title" xid="auditorTitle"> 
              <span xid="span72">title</span> 
            </div>  
            <div xid="auditorContent"> 
              <div class="form-group" xid="formGroup6"> 
                <div class="col-sm-2" xid="col19"> 
                  <label class="control-label" xid="auditorL">主管审核意见</label> 
                </div>  
                <div class="col-sm-10" xid="col20"> 
                  <textarea component="$UI/system/components/justep/textarea/textarea"
                    class="form-control" rows="3" bind-ref="orderData.ref('fAuditor')"
                    xid="auditor"/> 
                </div> 
              </div>  
              <div class="form-group" xid="form-group7"> 
                <div class="col-sm-2" xid="col21"> 
                  <label class="control-label" xid="auditorIsArgeeL">是否同意</label> 
                </div>  
                <div class="col-sm-4" xid="col22"> 
                  <span component="$UI/system/components/justep/button/checkbox"
                    class="x-checkbox" xid="auditorIsArgee" bind-ref="orderData.ref('fAuditorIsArgee')"
                    checkedValue="1"/> 
                </div>  
                <div class="col-sm-2" xid="col23"> 
                  <label class="control-label" xid="auditorDateL">审核日期</label> 
                </div>  
                <div class="col-sm-4" xid="col24"> 
                  <input component="$UI/system/components/justep/input/input"
                    class="form-control" xid="auditorDate" bind-ref="orderData.ref('fAuditorDate')"/> 
                </div> 
              </div>  
              <div class="form-group" xid="formGroup8"> 
                <div class="col-sm-2" xid="col25"> 
                  <label class="control-label" xid="auditorPersonL">主管审核</label> 
                </div>  
                <div class="col-sm-10" xid="col26"> 
                  <div class="x-gridSelect" component="$UI/system/components/justep/gridSelect/gridSelect"
                    xid="auditorPerson" bind-ref="orderData.ref('fAuditorID')" bind-labelRef="orderData.ref('fAuditorName')"> 
                    <option xid="aduditorOption" data="personData" value="SA_OPPerson"
                      label="sName"/> 
                  </div> 
                </div> 
              </div> 
            </div> 
          </div>  
          <div component="$UI/system/components/justep/controlGroup/controlGroup"
            class="x-control-group" title="领导审核信息" xid="examineGroup" collapsible="true"> 
            <div class="x-control-group-title" xid="examineTitle"> 
              <span xid="span77">title</span> 
            </div>  
            <div xid="examineContent"> 
              <div class="form-group" xid="formGroup9"> 
                <div class="col-sm-2" xid="col27"> 
                  <label class="control-label" xid="examineL">领导审核意见</label> 
                </div>  
                <div class="col-sm-10" xid="col28"> 
                  <textarea component="$UI/system/components/justep/textarea/textarea"
                    class="form-control" rows="3" xid="examine" bind-ref="orderData.ref('fExamine')"/> 
                </div> 
              </div>  
              <div class="form-group" xid="formGroup10"> 
                <div class="col-sm-2" xid="col29"> 
                  <label class="control-label" xid="examineIsArgeeL">是否同意</label> 
                </div>  
                <div class="col-sm-4" xid="col30"> 
                  <span component="$UI/system/components/justep/button/checkbox"
                    class="x-checkbox" xid="examineIsArgee" bind-ref="orderData.ref('fExamineIsArgee')"
                    checkedValue="1"/> 
                </div>  
                <div class="col-sm-2" xid="col31"> 
                  <label class="control-label" xid="examineDateL">审核日期</label> 
                </div>  
                <div class="col-sm-4" xid="col32"> 
                  <input component="$UI/system/components/justep/input/input"
                    class="form-control" xid="examineDate" bind-ref="orderData.ref('fExamineDate')"/> 
                </div> 
              </div>  
              <div class="form-group" xid="formGroup11"> 
                <div class="col-sm-2" xid="col33"> 
                  <label class="control-label" xid="examinePersonL">领导审核</label> 
                </div>  
                <div class="col-sm-10" xid="col34"> 
                  <div class="x-gridSelect" component="$UI/system/components/justep/gridSelect/gridSelect"
                    xid="examinePerson" bind-ref="orderData.ref('fExamineID')" bind-labelRef="orderData.ref('fExamineName')"> 
                    <option xid="examineOption" data="personData" value="SA_OPPerson"
                      label="sName"/> 
                  </div> 
                </div> 
              </div> 
            </div> 
          </div>  
          <!-- 
          <div component="$UI/system/components/bootstrap/accordion/accordion"
            class="panel-group" xid="accordion2" tabbed="false"> 
            <div class="panel panel-default " component="$UI/system/components/bootstrap/panel/panel"
              xid="productPanel"> 
              <div class="panel-heading" xid="heading5"> 
                <h4 class="panel-title" xid="h45"> 
                  <a href="javascript:void(0)" xid="a2"><![CDATA[产品信息]]></a> 
                </h4> 
              </div>  
              <div class="panel-collapse in" xid="div3"> 
                <div component="$UI/system/components/justep/dataTables/dataTables"
                  flexibleWidth="true" class="table  table-hover table-striped" xid="detailTable"
                  data="orderDetailData" pagingType="simple" rowActiveClass="active"> 
                  <columns xid="columns1"> 
                    <column name="fProductName" xid="column5" label="产品名称"/>  
                    <column name="fUnitprice" xid="column1" label="单价（元）"/>  
                    <column name="fQuantity" xid="column2" label="数量"/>  
                    <column name="fDisCount" xid="column3" label="折扣率（0.00）"/>  
                    <column name="fFactAmt" xid="column4" label="实际金额（元）"/> 
                  </columns> 
                </div> 
              </div> 
            </div>  
            <div class="panel panel-default " component="$UI/system/components/bootstrap/panel/panel"
              xid="managerPanel"> 
              <div class="panel-heading" xid="heading6"> 
                <h4 class="panel-title" xid="h46"> 
                  <a href="javascript:void(0)" xid="a3"><![CDATA[主管审核信息]]></a> 
                </h4> 
              </div>  
              <div class="panel-collapse in" xid="div5"> 
                <div class="panel-body" xid="div6"> 
                  <div class="form-group"> 
                    <div class="col-sm-2"> 
                      <label class="control-label">主管审核意见</label> 
                    </div>  
                    <div class="col-sm-10"> 
                      <textarea component="$UI/system/components/justep/textarea/textarea"
                        class="form-control" rows="3" bind-ref="orderData.ref('fAuditor')"
                        xid="auditor"/> 
                    </div> 
                  </div>  
                  <div class="form-group"> 
                    <div class="col-sm-2"> 
                      <label class="control-label">是否同意</label> 
                    </div>  
                    <div class="col-sm-4"> 
                      <span component="$UI/system/components/justep/button/checkbox"
                        class="x-checkbox" xid="auditorIsArgee" bind-ref="orderData.ref('fAuditorIsArgee')"
                        checkedValue="1"/> 
                    </div>  
                    <div class="col-sm-2"> 
                      <label class="control-label">审核日期</label> 
                    </div>  
                    <div class="col-sm-4"> 
                      <input component="$UI/system/components/justep/input/input"
                        class="form-control" xid="auditorDate" bind-ref="orderData.ref('fAuditorDate')"/> 
                    </div> 
                  </div>  
                  <div class="form-group"> 
                    <div class="col-sm-2"> 
                      <label class="control-label">主管审核</label> 
                    </div>  
                    <div class="col-sm-10"> 
                      <output component="$UI/system/components/justep/output/output"
                        class="form-control" bind-ref="orderData.ref('fAuditorName')"
                        xid="auditorPerson"/> 
                    </div> 
                  </div> 
                </div> 
              </div> 
            </div>  
            <div class="panel panel-default" component="$UI/system/components/bootstrap/panel/panel"
              xid="manager2Panel"> 
              <div class="panel-heading" xid="heading7"> 
                <h4 class="panel-title" xid="h47"> 
                  <a href="javascript:void(0)" xid="a4"><![CDATA[领导审核信息]]></a> 
                </h4> 
              </div>  
              <div class="panel-collapse in" xid="div7"> 
                <div class="panel-body" xid="div8"> 
                  <div class="form-group"> 
                    <div class="col-sm-2"> 
                      <label class="control-label">领导审核意见</label> 
                    </div>  
                    <div class="col-sm-10"> 
                      <textarea component="$UI/system/components/justep/textarea/textarea"
                        class="form-control" rows="3" xid="examine" bind-ref="orderData.ref('fExamine')"/> 
                    </div> 
                  </div>  
                  <div class="form-group"> 
                    <div class="col-sm-2"> 
                      <label class="control-label">是否同意</label> 
                    </div>  
                    <div class="col-sm-4"> 
                      <span component="$UI/system/components/justep/button/checkbox"
                        class="x-checkbox" xid="examineIsArgee" bind-ref="orderData.ref('fExamineIsArgee')"
                        checkedValue="1"/> 
                    </div>  
                    <div class="col-sm-2"> 
                      <label class="control-label">审核日期</label> 
                    </div>  
                    <div class="col-sm-4"> 
                      <input component="$UI/system/components/justep/input/input"
                        class="form-control" xid="examineDate" bind-ref="orderData.ref('fExamineDate')"/> 
                    </div> 
                  </div>  
                  <div class="form-group"> 
                    <div class="col-sm-2"> 
                      <label class="control-label">领导审核</label> 
                    </div>  
                    <div class="col-sm-10"> 
                      <output component="$UI/system/components/justep/output/output"
                        class="form-control" bind-ref="orderData.ref('fExamineName')"
                        xid="examinePerson"/> 
                    </div> 
                  </div> 
                </div> 
              </div> 
            </div> 
          </div> 
          --> 
        </div> 
      </div> 
    </div> 
  </div> 
</div>
