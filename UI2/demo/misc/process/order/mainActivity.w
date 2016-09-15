<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window" component="$UI/system/components/justep/window/window" 
  design="device:pc;">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:331px;top:247px;" onLoad="modelLoad"> 
    <div component="$UI/system/components/justep/data/bizData" xid="orderData"
      concept="DEMO_Order" limit="1" autoNew="true"> 
      <reader xid="default1" action="/demo/misc/logic/action/queryOrderAction"/>  
      <writer xid="default2" action="/demo/misc/logic/action/saveOrderAction"/>  
      <creator xid="default3" action="/demo/misc/logic/action/createOrderAction"/>  
      <rule xid="rule5"> 
        <col name="fAuditorID" xid="ruleCol5"> 
          <readonly xid="readonly1"> 
            <expr xid="default15">true</expr> 
          </readonly> 
        </col>  
        <col name="fAuditorIsArgee" xid="ruleCol6"> 
          <readonly xid="readonly2"> 
            <expr xid="default16">true</expr> 
          </readonly> 
        </col>  
        <col name="fAuditor" xid="ruleCol7"> 
          <readonly xid="readonly3"> 
            <expr xid="default17">true</expr> 
          </readonly> 
        </col>  
        <col name="fAuditorDate" xid="ruleCol8"> 
          <readonly xid="readonly4"> 
            <expr xid="default18">true</expr> 
          </readonly> 
        </col>  
        <col name="fExamineID" xid="ruleCol9"> 
          <readonly xid="readonly5"> 
            <expr xid="default19">true</expr> 
          </readonly> 
        </col>  
        <col name="fExamine" xid="ruleCol10"> 
          <readonly xid="readonly6"> 
            <expr xid="default20">true</expr> 
          </readonly> 
        </col>  
        <col name="fExamineDate" xid="ruleCol11"> 
          <readonly xid="readonly7"> 
            <expr xid="default21">true</expr> 
          </readonly> 
        </col>  
        <col name="fExamineIsArgee" xid="ruleCol12"> 
          <readonly xid="readonly8"> 
            <expr xid="default22">true</expr> 
          </readonly> 
        </col>  
        <col name="fTolotalAmt" xid="ruleCol13"> 
          <calculate xid="calculate4"> 
            <expr xid="default23">$model.orderDetailData.sum("fFactAmt")</expr> 
          </calculate> 
        </col>  
        <col name="fAuditorName" xid="ruleCol14"> 
          <readonly xid="readonly9"> 
            <expr xid="default24">true</expr> 
          </readonly> 
        </col>  
        <col name="fExamineName" xid="ruleCol15"> 
          <readonly xid="readonly10"> 
            <expr xid="default25">true</expr> 
          </readonly> 
        </col> 
      </rule> 
    </div>  
    <div component="$UI/system/components/justep/data/bizData" xid="orderDetailData"
      concept="DEMO_OrderDetail" autoLoad="true"> 
      <reader xid="default4" action="/demo/misc/logic/action/queryOrder_DAction"/>  
      <writer xid="default5" action="/demo/misc/logic/action/saveOrder_DAction"/>  
      <creator xid="default6" action="/demo/misc/logic/action/createOrder_DAction"/>  
      <master xid="default7" data="orderData" relation="fOrderID"/> 
    </div>  
    <div component="$UI/system/components/justep/data/bizData" xid="customerData"
      concept="DEMO_Custemor" confirmDelete="true"> 
      <reader xid="default8" action="/demo/misc/logic/action/queryCustemorAction"/> 
    </div>  
    <div component="$UI/system/components/justep/data/bizData" xid="personData"
      concept="SA_OPPerson"> 
      <reader xid="default9" action="/demo/misc/logic/action/queryOPPersonAction"/> 
    </div> 
  </div>  
  <div component="$UI/system/components/justep/process/process" xid="process"
    data="orderData"/>  
  <div component="$UI/system/components/justep/popMenu/popMenu" class="x-popMenu"
    xid="moreMenu" opacity="0" anchor="moreBtn" direction="left-bottom"> 
    <div class="x-popMenu-overlay" xid="moreMenuOverlay"/>  
    <ul component="$UI/system/components/justep/menu/menu" class="x-menu dropdown-menu x-popMenu-content"
      xid="moreContent"> 
      <li class="x-menu-item" xid="backItem"> 
        <a component="$UI/system/components/justep/button/button" class="btn btn-link  btn-icon-left"
          xid="backBtn" onClick="{operation:'process.back'}"> 
          <i xid="i8"/>  
          <span xid="span6"/> 
        </a> 
      </li>  
      <li class="x-menu-item" xid="suspendItem"> 
        <a component="$UI/system/components/justep/button/button" class="btn btn-link  btn-icon-left"
          xid="suspendBtn" onClick="{operation:'process.suspend'}"> 
          <i xid="i3"/>  
          <span xid="span3"/> 
        </a> 
      </li>  
      <li class="x-menu-item" xid="abortItem"> 
        <a component="$UI/system/components/justep/button/button" class="btn btn-link  btn-icon-left"
          xid="abortBtn" onClick="{operation:'process.abort'}"> 
          <i xid="i4"/>  
          <span xid="span4"/> 
        </a> 
      </li>  
      <li class="x-menu-item" xid="chartItem"> 
        <a component="$UI/system/components/justep/button/button" class="btn btn-link  btn-icon-left"
          xid="chartBtn" onClick="{operation:'process.showChart'}"> 
          <i xid="i5"/>  
          <span xid="span5"/> 
        </a> 
      </li>  
      <li class="x-menu-item" xid="recordItem"> 
        <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
          xid="recordBtn" onClick="{operation:'process.processRecord'}"> 
          <i xid="i55"/>  
          <span xid="span55"/> 
        </a> 
      </li> 
    </ul> 
  </div>  
  <span component="$UI/system/components/justep/windowDialog/windowDialog" xid="productDialog"
    style="left:100px;top:86px;" src="$UI/demo/misc/process/order/prdocutDialog.w"
    title="产品详细" onReceive="productDialogReceive" status="normal" showTitle="true"
    height="400px" width="80%"/>  
  <div xid="view"> 
    <div component="$UI/system/components/justep/toolBar/toolBar" class="x-toolbar x-toolbar-spliter form-inline" xid="mainBar"> 
      <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
        xid="advanceBtn" onClick="{operation:'process.advance'}"> 
        <i xid="i2"/>  
        <span xid="span2">流转</span> 
      </a>  
      <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
        xid="saveBtn" onClick="{operation:'orderData.save'}"> 
        <i xid="i1"/>  
        <span xid="span1"/> 
      </a>  
      <a component="$UI/system/components/justep/button/button" class="btn btn-link"
        label="更多" xid="moreBtn" onClick="{operation:'moreMenu.show'}"> 
        <i xid="i15"/>  
        <span xid="span15">更多</span> 
      </a> 
    </div>  
    <div xid="content"> 
      <h1 xid="title" class="text-center"><![CDATA[阳光集团销售审批单]]></h1>  
      <div class="form-horizontal container-fluid" component="$UI/system/components/bootstrap/form/form" xid="form"> 
        <div class="form-group" xid="formGroup1"> 
          <div class="col-sm-2" xid="col1"> 
            <label class="control-label" xid="codeL">订单编号</label> 
          </div>  
          <div class="col-sm-4" xid="col2"> 
            <output component="$UI/system/components/justep/output/output" class="form-control"
              xid="code" bind-ref="orderData.ref('fOrderCode')"/> 
          </div>  
          <div class="col-sm-2" xid="col3"> 
            <label class="control-label" xid="orderDateL">订购日期</label> 
          </div>  
          <div class="col-sm-4" xid="col4"> 
            <input component="$UI/system/components/justep/input/input" class="form-control"
              xid="orderDate" bind-ref="orderData.ref('fOrderDate')"/> 
          </div> 
        </div>  
        <div class="form-group" xid="formGroup2"> 
          <div class="col-sm-2" xid="col5"> 
            <label class="control-label" xid="customerL">客户名称</label> 
          </div>  
          <div class="col-sm-4" xid="col6"> 
            <div class="x-gridSelect" component="$UI/system/components/justep/gridSelect/gridSelect"
              xid="customer" bind-ref="orderData.ref('fCustomerID')" bind-labelRef="orderData.ref('fCustomerName')"> 
              <option xid="customerOption" data="customerData" value="DEMO_Custemor"
                label="fCustomerName"/> 
            </div> 
          </div>  
          <div class="col-sm-2" xid="col7"> 
            <label class="control-label" xid="reportL">申请人</label> 
          </div>  
          <div class="col-sm-4" xid="col8"> 
            <output component="$UI/system/components/justep/output/output" class="form-control"
              bind-ref="orderData.ref('fReportID')" xid="report"/> 
          </div> 
        </div>  
        <div class="form-group" xid="formGroup3"> 
          <div class="col-sm-2" xid="col9"> 
            <label class="control-label" xid="emploueeL">雇员名称</label> 
          </div>  
          <div class="col-sm-4" xid="col10"> 
            <div class="x-gridSelect" component="$UI/system/components/justep/gridSelect/gridSelect"
              xid="emplouee" bind-ref="orderData.ref('fEmploueeID')" bind-labelRef="orderData.ref('fEmploueeName')"> 
              <option xid="emploueeOption" data="personData" value="SA_OPPerson"
                label="sName"/> 
            </div> 
          </div>  
          <div class="col-sm-2" xid="col11"> 
            <label class="control-label" xid="reportDateL">申请日期</label> 
          </div>  
          <div class="col-sm-4" xid="col12"> 
            <input component="$UI/system/components/justep/input/input" class="form-control"
              bind-ref="orderData.ref('fReporedDate')" xid="reportDate"/> 
          </div> 
        </div>  
        <div class="form-group" xid="formGroup4"> 
          <div class="col-sm-2" xid="col13"> 
            <label class="control-label" xid="shippedDateL">发货日期</label> 
          </div>  
          <div class="col-sm-4" xid="col14"> 
            <input component="$UI/system/components/justep/input/input" class="form-control"
              bind-ref="orderData.ref('fShippedDate')" xid="shippedDate"/> 
          </div>  
          <div class="col-sm-2" xid="col15"> 
            <label class="control-label" xid="requiredDateL">到货日期</label> 
          </div>  
          <div class="col-sm-4" xid="col16"> 
            <input component="$UI/system/components/justep/input/input" class="form-control"
              bind-ref="orderData.ref('fRequiredDate')" xid="requiredDate"/> 
          </div> 
        </div>  
        <div class="form-group" xid="formGroup5"> 
          <div class="col-sm-2" xid="col17"> 
            <label class="control-label" xid="totalAmtL">金额</label> 
          </div>  
          <div class="col-sm-10" xid="col18"> 
            <output component="$UI/system/components/justep/output/output" class="form-control"
              bind-ref="orderData.ref('fTolotalAmt')" xid="totalAmt"/> 
          </div> 
        </div>  
        <div component="$UI/system/components/justep/controlGroup/controlGroup"
          class="x-control-group" title="产品信息" xid="productGroup" collapsible="true"> 
          <div class="x-control-group-title" xid="productTitle"> 
            <span xid="span71">title</span> 
          </div>  
          <div xid="productContent"> 
            <div component="$UI/system/components/justep/toolBar/toolBar" class="x-toolbar x-toolbar-spliter form-inline" xid="detailBar"> 
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
        <div component="$UI/system/components/justep/controlGroup/controlGroup"
          class="x-control-group" title="主管审核信息" xid="auditorGroup" collapsible="true"> 
          <div class="x-control-group-title" xid="auditorTitle"> 
            <span xid="span7">title</span> 
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
                <input component="$UI/system/components/justep/input/input" class="form-control"
                  xid="auditorDate" bind-ref="orderData.ref('fAuditorDate')"/> 
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
                <input component="$UI/system/components/justep/input/input" class="form-control"
                  xid="examineDate" bind-ref="orderData.ref('fExamineDate')"/> 
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
      </div> 
    </div> 
  </div> 
</div>
