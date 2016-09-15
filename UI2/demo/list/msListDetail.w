<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window" component="$UI/system/components/justep/window/window"
  design="device:pc;">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:27px;top:345px;"> 
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
  <div component="$UI/system/components/justep/controlGroup/controlGroup" class="x-control-group"
    title="订单" xid="controlGroup1"> 
    <div class="x-control-group-title" xid="controlGroupTitle1"> 
      <span xid="span9">title</span> 
    </div>  
    <div component="$UI/system/components/justep/toolBar/toolBar" class="x-toolbar x-toolbar-spliter"> 
      <div component="$UI/system/components/justep/smartFilter/smartFilter"
        xid="smartFilter1" filterData="orderData" class="pull-right"> 
        <input type="text" class="form-control" placeholder="搜索" data-bind="valueUpdate: ['input', 'afterkeydown']"
          bind-value="$model.comp($element.parentElement).searchText" bind-change="$model.comp($element.parentElement).onInputChange.bind($model.comp($element.parentElement))"
          xid="input1"/> 
      </div>  
      <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
        xid="newBtn" label="新建" onClick="{&quot;operation&quot;:&quot;orderData.new&quot;}"> 
        <i xid="i8"/>  
        <span xid="span8">新建</span> 
      </a>  
      <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
        xid="saveBtn" onClick="{&quot;operation&quot;:&quot;orderData.save&quot;}" label="保存"> 
        <i xid="i71"/>  
        <span xid="span7">保存</span> 
      </a>  
      <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
        xid="button2" label="编辑" icon="icon-edit"> 
        <i xid="i3" class="icon-edit"/>  
        <span xid="span3">编辑</span> 
      </a>  
      <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
        xid="button1" onClick="{&quot;operation&quot;:&quot;orderData.delete&quot;}"> 
        <i xid="i2"/>  
        <span xid="span2"/> 
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
<!--     <div component="$UI/system/components/justep/dataTables/dataTables" flexibleWidth="true" -->
<!--       rowActiveClass="active" class="table table-hover table-striped table-condensed table-hover" -->
<!--       xid="orderTables" data="orderData" pagingType="simple_numbers" lengthMenu="10,25,50,100">  -->
<!--       <columns xid="columns2">  -->
<!--         <column name="index" xid="column7" label="序号" orderable="false"/>   -->
<!--         <column name="fOrderCode"/>   -->
<!--         <column name="fReportID"/>   -->
<!--         <column name="fReporedDate"/>   -->
<!--         <column name="fEmploueeName"/>   -->
<!--         <column name="fCustomerName" xid="fCustomerName"/>   -->
<!--         <column name="fTolotalAmt" xid="fTolotalAmt"/>  -->
<!--       </columns>  -->
<!--     </div>   -->
    <div component="$UI/system/components/justep/grid/grid" hiddenCaptionbar="true"
      altRows="true" class="x-grid-no-bordered" xid="grid1" data="orderData" height="auto" width="100%"> 
      <columns xid="columns3">
        <column name="fOrderCode" xid="column1" editable="false"/>  
        <column name="fReportID" xid="column2" editable="false"/>  
        <column name="fReporedDate" xid="column3" editable="true"><editor xid="editor1">
   <input component="$UI/system/components/justep/input/input" class="form-control" xid="input2" bind-ref="ref('fReporedDate')"></input></editor></column>  
        <column name="fEmploueeName" xid="column4" editable="true"><editor xid="editor2">
   <input component="$UI/system/components/justep/input/input" class="form-control" xid="input3" bind-ref="ref('fEmploueeName')"></input></editor></column>
        <column name="fCustomerName" xid="column5" editable="true"><editor xid="editor3">
   <input component="$UI/system/components/justep/input/input" class="form-control" xid="input4" bind-ref="ref('fCustomerName')"></input></editor></column>  
        <column name="fTolotalAmt" xid="column6" editable="true"><editor xid="editor4">
   <input component="$UI/system/components/justep/input/input" class="form-control" xid="input5" bind-ref="ref('fTolotalAmt')"></input></editor></column>  
      </columns>
    </div>
    <div component="$UI/system/components/justep/pagerBar/pagerBar" class="x-pagerbar container-fluid"
      xid="pagerBar1" data="orderData"> 
      <div class="row" xid="div1"> 
        <div class="col-sm-3" xid="div2"> 
          <div class="x-pagerbar-length" xid="div3"> 
            <label component="$UI/system/components/justep/pagerLimitSelect/pagerLimitSelect"
              class="x-pagerlimitselect" xid="pagerLimitSelect1"> 
              <span xid="span4">显示</span>  
              <select component="$UI/system/components/justep/select/select" class="form-control input-sm"
                xid="select1"> 
                <option value="10" xid="default9">10</option>  
                <option value="20" xid="default10">20</option>  
                <option value="50" xid="default14">50</option>  
                <option value="100" xid="default15">100</option> 
              </select>  
              <span xid="span6">条</span> 
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
                  <span aria-hidden="true" xid="span14">«</span>  
                  <span class="sr-only" xid="span15">Previous</span> 
                </a> 
              </li>  
              <li class="next" xid="li2"> 
                <a href="#" xid="a2"> 
                  <span aria-hidden="true" xid="span16">»</span>  
                  <span class="sr-only" xid="span17">Next</span> 
                </a> 
              </li> 
            </ul> 
          </div> 
        </div> 
      </div> 
    </div> 
  </div>  
  <div component="$UI/system/components/justep/controlGroup/controlGroup" class="x-control-group"
    title="明细" xid="controlGroup2"> 
    <div class="x-control-group-title" xid="controlGroupTitle2"> 
      <span xid="span12">title</span> 
    </div>  
    <div component="$UI/system/components/justep/toolBar/toolBar" class="x-toolbar x-toolbar-spliter"> 
      <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
        xid="addProductBtn" icon="icon-plus" label="添加产品" onClick="addProductBtnClick"> 
        <i xid="i6" class="icon-plus"/>  
        <span xid="span10">添加产品</span> 
      </a>  
      <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
        label="编辑" xid="editProductBtn" icon="icon-edit" onClick="editProductBtnClick"
        bind-enable="$model.hasOrderDetail()"> 
        <i xid="i9" class="icon-edit"/>  
        <span xid="span13">编辑</span> 
      </a>  
      <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
        xid="deleteBtn" onClick="{operation:'orderDetailData.delete'}"> 
        <i xid="i7"/>  
        <span xid="span11">删除</span> 
      </a> 
    </div>  
    <div component="$UI/system/components/justep/dataTables/dataTables" flexibleWidth="true"
      class="table table-hover table-striped table-condensed table-hover" xid="detailTable"
      data="orderDetailData" pagingType="simple" rowActiveClass="active"> 
      <columns xid="columns1"> 
        <column name="index" xid="index" label="序号" orderable="false"/>  
        <column name="fProductName" xid="fProductName" label="产品名称"/>  
        <column name="fUnitprice" xid="fUnitprice" label="单价（元）"/>  
        <column name="fQuantity" xid="fQuantity" label="数量"/>  
        <column name="fDisCount" xid="fDisCount" label="折扣率（0.00）"/>  
        <column name="fFactAmt" xid="fFactAmt" label="实际金额（元）"/> 
      </columns> 
    </div>  
    <div component="$UI/system/components/justep/pagerBar/pagerBar" class="x-pagerbar container-fluid"
      xid="pagerBar2" data="orderDetailData"> 
      <div class="row" xid="div8"> 
        <div class="col-sm-3" xid="div9"> 
          <div class="x-pagerbar-length" xid="div10"> 
            <label component="$UI/system/components/justep/pagerLimitSelect/pagerLimitSelect"
              class="x-pagerlimitselect" xid="pagerLimitSelect2"> 
              <span xid="span18">显示</span>  
              <select component="$UI/system/components/justep/select/select" class="form-control input-sm"
                xid="select2"> 
                <option value="10" xid="default16">10</option>  
                <option value="20" xid="default17">20</option>  
                <option value="50" xid="default18">50</option>  
                <option value="100" xid="default19">100</option> 
              </select>  
              <span xid="span19">条</span> 
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
                <a href="#" xid="a3"> 
                  <span aria-hidden="true" xid="span20">«</span>  
                  <span class="sr-only" xid="span21">Previous</span> 
                </a> 
              </li>  
              <li class="next" xid="li4"> 
                <a href="#" xid="a4"> 
                  <span aria-hidden="true" xid="span22">»</span>  
                  <span class="sr-only" xid="span23">Next</span> 
                </a> 
              </li> 
            </ul> 
          </div> 
        </div> 
      </div> 
    </div> 
  </div>  
  <span component="$UI/system/components/justep/windowDialog/windowDialog" xid="productDialog"
    style="left:19px;top:214px;" src="$UI/demo/misc/process/order/prdocutDialog.w"
    title="产品详细" onReceive="productDialogReceive" status="normal" showTitle="true"
    height="400px" width="80%"/>  
  <span component="$UI/system/components/justep/bizFilter/bizFilter" xid="orderFilter"
    filterData="orderData" style="left:28px;top:290px;"/> 
</div>
