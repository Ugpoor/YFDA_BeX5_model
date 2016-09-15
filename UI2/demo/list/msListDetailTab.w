<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window" component="$UI/system/components/justep/window/window"
  design="device:pc;">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:252px;top:223px;"> 
    <div component="$UI/system/components/justep/data/bizData" xid="orderData"
      concept="DEMO_Order" autoLoad="true" onSaveCommit="orderDataSaveCommit"> 
      <reader xid="default1" action="/demo/misc/logic/action/queryOrderAction"/>  
      <writer xid="default2" action="/demo/misc/logic/action/saveOrderAction"/>  
      <creator xid="default3" action="/demo/misc/logic/action/createOrderAction"/>  
      <calculateRelation relation="index" xid="calculateRelation1" type="Integer"/>  
      <rule xid="rule1"> 
        <readonly xid="readonly1"> 
          <expr xid="default7">false</expr> 
        </readonly>  
        <col name="index" xid="ruleCol1"> 
          <calculate xid="calculate1"> 
            <expr xid="default8">$row.index()+1</expr> 
          </calculate> 
        </col> 
      </rule> 
    </div>  
    <div component="$UI/system/components/justep/data/bizData" xid="orderDetailData"
      concept="DEMO_OrderDetail" autoLoad="true" limit="-1"> 
      <reader xid="default4" action="/demo/misc/logic/action/queryOrder_DAction"/>  
      <writer xid="default5" action="/demo/misc/logic/action/saveOrder_DAction"/>  
      <creator xid="default6" action="/demo/misc/logic/action/createOrder_DAction"/>  
      <master xid="default11" data="orderData" relation="fOrderID"/>  
      <calculateRelation relation="index" xid="calculateRelation3" type="Integer"/>  
      <rule xid="rule4"> 
        <readonly xid="readonly3"> 
          <expr xid="default12">true</expr> 
        </readonly>  
        <col name="index" xid="ruleCol3"> 
          <calculate xid="calculate3"> 
            <expr xid="default13">$row.index()+1</expr> 
          </calculate> 
        </col> 
      </rule> 
    </div> 
  </div>  
  <span component="$UI/system/components/justep/windowDialog/windowDialog" xid="productDialog"
    style="left:19px;top:214px;" src="$UI/demo/misc/process/order/prdocutDialog.w"
    title="产品详细" onReceive="productDialogReceive" status="normal" showTitle="true"
    height="400px" width="80%"/>  
  <span component="$UI/system/components/justep/bizFilter/bizFilter" xid="orderFilter"
    filterData="orderData" style="left:197px;top:256px;"/>  
  <div component="$UI/system/components/bootstrap/tabs/tabs" xid="tabs"> 
    <ul class="nav nav-tabs" xid="tabNav"> 
      <li class="active" xid="nav-list"> 
        <a content="listContent" xid="listTab"><![CDATA[列表]]></a> 
      </li>  
      <li role="presentation" xid="nav-detail"> 
        <a content="detailContent" xid="detailItem"><![CDATA[详细]]></a> 
      </li> 
    </ul>  
    <div class="tab-content" xid="tabContent"> 
      <div class="tab-pane active" xid="listContent"> 
        <div component="$UI/system/components/justep/toolBar/toolBar" class="x-toolbar x-toolbar-spliter"> 
          <div component="$UI/system/components/justep/smartFilter/smartFilter"
            xid="smartFilter2" filterData="orderData" class="pull-right"> 
            <input type="text" class="form-control" placeholder="搜索" data-bind="valueUpdate: ['input', 'afterkeydown']"
              bind-value="$model.comp($element.parentElement).searchText" bind-change="$model.comp($element.parentElement).onInputChange.bind($model.comp($element.parentElement))"
              xid="input2"/>
          </div>
          <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
            xid="newBtn" label="新建" onClick="newBtnClick" icon="icon-plus"> 
            <i xid="i8" class="icon-plus"/>  
            <span xid="span8">新建</span> 
          </a>  
          <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
            xid="saveBtn" onClick="{&quot;operation&quot;:&quot;orderData.save&quot;}" label="保存"> 
            <i xid="i71"/>  
            <span xid="span7">保存</span> 
          </a>  
          <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
            xid="button1" onClick="{&quot;operation&quot;:&quot;orderData.delete&quot;}"> 
            <i xid="i12"/>  
            <span xid="span12">保存</span> 
          </a>  
          <a component="$UI/system/components/justep/button/button" class="btn btn-link  btn-icon-left"
            xid="refreshBtn" onClick="{operation:'orderData.refresh'}"> 
            <i xid="i1"/>  
            <span xid="span1"/> 
          </a>  
          <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
            label="" xid="filterBtn" icon="icon-search" onClick="{operation:'orderFilter.menu'}"> 
            <i xid="i4" class="icon-search"/>  
            <span xid="span5"/> 
          </a>  
        </div>  
        <div component="$UI/system/components/justep/dataTables/dataTables"
          flexibleWidth="true" rowActiveClass="active" class="table table-hover table-striped table-condensed table-hover"
          xid="orderTables" data="orderData" pagingType="simple_numbers" lengthMenu="10,25,50,100"> 
          <columns xid="columns2"> 
            <column name="index" xid="column7" label="序号" orderable="false"/>  
            <column name="fOrderCode" xid="fOrderCode"/>  
            <column name="fReportID" xid="fReportID"/>  
            <column name="fReporedDate" xid="fReporedDate"/>  
            <column name="fEmploueeName" xid="fEmploueeName"/>  
            <column name="fCustomerName" xid="fCustomerName"/>  
            <column name="fTolotalAmt" xid="fTolotalAmt"/> 
          </columns> 
        </div>  
        <div component="$UI/system/components/justep/pagerBar/pagerBar" class="x-pagerbar container-fluid"
          xid="pagerBar1" data="orderData"> 
          <div class="row" xid="div1"> 
            <div class="col-sm-3" xid="div2"> 
              <div class="x-pagerbar-length" xid="div4"> 
                <label component="$UI/system/components/justep/pagerLimitSelect/pagerLimitSelect"
                  class="x-pagerlimitselect" xid="pagerLimitSelect1"> 
                  <span xid="span15">显示</span>  
                  <select component="$UI/system/components/justep/select/select"
                    class="form-control input-sm" xid="select1"> 
                    <option value="10" xid="default9">10</option>  
                    <option value="20" xid="default10">20</option>  
                    <option value="50" xid="default14">50</option>  
                    <option value="100" xid="default15">100</option> 
                  </select>  
                  <span xid="span16">条</span> 
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
                      <span aria-hidden="true" xid="span17">«</span>  
                      <span class="sr-only" xid="span18">Previous</span> 
                    </a> 
                  </li>  
                  <li class="next" xid="li2"> 
                    <a href="#" xid="a3"> 
                      <span aria-hidden="true" xid="span19">»</span>  
                      <span class="sr-only" xid="span20">Next</span> 
                    </a> 
                  </li> 
                </ul> 
              </div> 
            </div> 
          </div> 
        </div>
      </div>  
      <div class="tab-pane" xid="detailContent"> 
        <div component="$UI/system/components/justep/toolBar/toolBar" class="x-toolbar x-toolbar-spliter"> 
          <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
            xid="newBtn2" label="新建" onClick="{&quot;operation&quot;:&quot;orderData.new&quot;}"> 
            <i xid="i2"/>  
            <span xid="span2">新建</span> 
          </a>  
          <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
            xid="saveBtn2" onClick="{&quot;operation&quot;:&quot;orderData.save&quot;}" label="保存"> 
            <i xid="i10"/>  
            <span xid="span6">保存</span> 
          </a>  
          <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
            xid="button2" onClick="{&quot;operation&quot;:&quot;orderData.delete&quot;}"> 
            <i xid="i13"/>  
            <span xid="span14"/> 
          </a>  
          <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
            xid="button3" onClick="{&quot;operation&quot;:&quot;orderData.refresh&quot;}" label="刷新"> 
            <i xid="i11"/>  
            <span xid="span9">刷新</span> 
          </a>  
          <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
            xid="preBtn" onClick="{operation:'orderData.prevRow'}"> 
            <i xid="i3"/>  
            <span xid="span3"/> 
          </a>  
          <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
            xid="nextBtn" onClick="{operation:'orderData.nextRow'}"> 
            <i xid="i5"/>  
            <span xid="span4"/> 
          </a> 
        </div>  
        <div class="form-horizontal" style="margin:15px" component="$UI/system/components/bootstrap/form/form"> 
          <div class="form-group"> 
            <div class="col-sm-2"> 
              <label class="control-label">订单编号</label> 
            </div>  
            <div class="col-sm-4"> 
              <output component="$UI/system/components/justep/output/output" class="form-control"
                xid="code" bind-ref="orderData.ref('fOrderCode')"/> 
            </div>  
            <div class="col-sm-2"> 
              <label class="control-label">订购日期</label> 
            </div>  
            <div class="col-sm-4"> 
              <input component="$UI/system/components/justep/input/input" class="form-control"
                xid="orderDate" bind-ref="orderData.ref('fOrderDate')"/> 
            </div> 
          </div>  
          <div class="form-group"> 
            <div class="col-sm-2"> 
              <label class="control-label">客户名称</label> 
            </div>  
            <div class="col-sm-4"> 
              <input component="$UI/system/components/justep/input/input" class="form-control"
                xid="customer" bind-ref="orderData.ref('fCustomerName')"/> 
            </div>  
            <div class="col-sm-2"> 
              <label class="control-label">申请人</label> 
            </div>  
            <div class="col-sm-4"> 
              <output component="$UI/system/components/justep/output/output" class="form-control"
                bind-ref="orderData.ref('fReportID')" xid="report"/> 
            </div> 
          </div>  
          <div class="form-group"> 
            <div class="col-sm-2"> 
              <label class="control-label">雇员名称</label> 
            </div>  
            <div class="col-sm-4"> 
              <input component="$UI/system/components/justep/input/input" class="form-control"
                xid="emplouee" bind-ref="orderData.ref('fEmploueeName')"/> 
            </div>  
            <div class="col-sm-2"> 
              <label class="control-label">申请日期</label> 
            </div>  
            <div class="col-sm-4"> 
              <input component="$UI/system/components/justep/input/input" class="form-control"
                bind-ref="orderData.ref('fReporedDate')" xid="reportDate"/> 
            </div> 
          </div>  
          <div class="form-group"> 
            <div class="col-sm-2"> 
              <label class="control-label">发货日期</label> 
            </div>  
            <div class="col-sm-4"> 
              <input component="$UI/system/components/justep/input/input" class="form-control"
                bind-ref="orderData.ref('fShippedDate')" xid="shippedDate"/> 
            </div>  
            <div class="col-sm-2"> 
              <label class="control-label">到货日期</label> 
            </div>  
            <div class="col-sm-4"> 
              <input component="$UI/system/components/justep/input/input" class="form-control"
                bind-ref="orderData.ref('fRequiredDate')" xid="requiredDate"/> 
            </div> 
          </div>  
          <div class="form-group"> 
            <div class="col-sm-2"> 
              <label class="control-label">金额</label> 
            </div>  
            <div class="col-sm-10"> 
              <output component="$UI/system/components/justep/output/output" class="form-control"
                bind-ref="orderData.ref('fTolotalAmt')" xid="totalAmt"/> 
            </div> 
          </div>  
          <div component="$UI/system/components/justep/controlGroup/controlGroup"
            class="x-control-group" title="产品信息" xid="controlGroup1"> 
            <div class="x-control-group-title" xid="controlGroupTitle1"> 
              <span xid="span21">title</span>
            </div>  
            <div component="$UI/system/components/justep/toolBar/toolBar" class="x-toolbar x-toolbar-spliter"> 
              <a component="$UI/system/components/justep/button/button" class="btn btn-link"
                xid="addProductBtn" icon="icon-plus" label="添加产品" onClick="addProductBtnClick"> 
                <i xid="i6" class="icon-plus"/>  
                <span xid="span10">添加产品</span> 
              </a>  
              <a component="$UI/system/components/justep/button/button" class="btn btn-link"
                label="编辑" xid="editProductBtn" icon="icon-edit" onClick="editProductBtnClick"
                bind-enable="$model.hasOrderDetail()"> 
                <i xid="i9" class="icon-edit"/>  
                <span xid="span13">编辑</span> 
              </a>  
              <a component="$UI/system/components/justep/button/button" class="btn btn-link"
                xid="deleteBtn" onClick="{operation:'orderDetailData.delete'}"> 
                <i xid="i7"/>  
                <span xid="span11">删除</span> 
              </a> 
            </div>
            <div component="$UI/system/components/justep/dataTables/dataTables"
              flexibleWidth="true" class="table table-hover table-striped table-condensed table-hover"
              xid="detailTable" data="orderDetailData" pagingType="simple" rowActiveClass="active"> 
              <columns xid="columns1"> 
                <column name="index" xid="indexT" label="序号" orderable="false"/>  
                <column name="fProductName" xid="fProductNameT" label="产品名称"/>  
                <column name="fUnitprice" xid="fUnitpriceT" label="单价（元）"/>  
                <column name="fQuantity" xid="fQuantityT" label="数量"/>  
                <column name="fDisCount" xid="fDisCountT" label="折扣率（0.00）"/>  
                <column name="fFactAmt" xid="fFactAmtT" label="实际金额（元）"/> 
              </columns> 
            </div>  
            <div component="$UI/system/components/justep/pagerBar/pagerBar"
              class="x-pagerbar container-fluid" xid="pagerBar2" data="orderDetailData"> 
              <div class="row" xid="div3"> 
                <div class="col-sm-3" xid="div9"> 
                  <div class="x-pagerbar-length" xid="div10"> 
                    <label component="$UI/system/components/justep/pagerLimitSelect/pagerLimitSelect"
                      class="x-pagerlimitselect" xid="pagerLimitSelect2"> 
                      <span xid="span22">显示</span>  
                      <select component="$UI/system/components/justep/select/select"
                        class="form-control input-sm" xid="select2"> 
                        <option value="10" xid="default16">10</option>  
                        <option value="20" xid="default17">20</option>  
                        <option value="50" xid="default18">50</option>  
                        <option value="100" xid="default19">100</option>
                      </select>  
                      <span xid="span23">条</span>
                    </label> 
                  </div> 
                </div>  
                <div class="col-sm-3" xid="div11"> 
                  <div class="x-pagerbar-info" xid="div12">当前显示0条，共0条</div>
                </div>  
                <div class="col-sm-6" xid="div13"> 
                  <div class="x-pagerbar-pagination" xid="div14"> 
                    <ul class="pagination" component="$UI/system/components/bootstrap/pagination/pagination"
                      xid="pagination2"> 
                      <li class="prev" xid="li3"> 
                        <a href="#" xid="a2"> 
                          <span aria-hidden="true" xid="span24">«</span>  
                          <span class="sr-only" xid="span25">Previous</span>
                        </a> 
                      </li>  
                      <li class="next" xid="li4"> 
                        <a href="#" xid="a4"> 
                          <span aria-hidden="true" xid="span26">»</span>  
                          <span class="sr-only" xid="span27">Next</span>
                        </a> 
                      </li> 
                    </ul> 
                  </div> 
                </div> 
              </div> 
            </div>
          </div>
        </div> 
      </div> 
    </div> 
  </div> 
</div>
