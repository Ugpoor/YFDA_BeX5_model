<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window" component="$UI/system/components/justep/window/window"
  design="device:pc;">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:331px;top:247px;"> 
    <div component="$UI/system/components/justep/data/bizData" xid="orderData"
      concept="DEMO_Order" limit="1" autoNew="true"> 
      <reader xid="default1" action="/demo/misc/logic/action/queryOrderAction"/>  
      <writer xid="default2" action="/demo/misc/logic/action/saveOrderAction"/>  
      <creator xid="default3" action="/demo/misc/logic/action/createOrderAction"/> 
    <rule xid="rule1">
   <col name="fTolotalAmt" xid="ruleCol1">
    <calculate xid="calculate1">
     <expr xid="default11">$model.orderDetailData.sum(&quot;fFactAmt&quot;)</expr></calculate> </col> </rule></div>  
    <div component="$UI/system/components/justep/data/bizData" xid="orderDetailData"
      concept="DEMO_OrderDetail" autoLoad="true" confirmDelete="true"> 
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
    <div component="$UI/system/components/justep/data/bizData" xid="prdocutData"
      concept="DEMO_Product" limit="20"> 
      <reader xid="default10" action="/demo/misc/logic/action/queryProductAction"/> 
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
        <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
          xid="backBtn" onClick="{operation:'process.back'}"> 
          <i xid="i8"/>  
          <span xid="span6"/> 
        </a> 
      </li>  
      <li class="x-menu-item" xid="suspendItem"> 
        <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
          xid="suspendBtn" onClick="{operation:'process.suspend'}"> 
          <i xid="i3"/>  
          <span xid="span3"/> 
        </a> 
      </li>  
      <li class="x-menu-item" xid="abortItem"> 
        <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
          xid="abortBtn" onClick="{operation:'process.abort'}"> 
          <i xid="i4"/>  
          <span xid="span4"/> 
        </a> 
      </li>  
      <li class="x-menu-item" xid="chartItem"> 
        <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
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
  <div xid="view"> 
    <div component="$UI/system/components/justep/toolBar/toolBar" class="x-toolbar x-toolbar-spliter form-inline"
      xid="mainBar"> 
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
      <div class="form-horizontal container-fluid" component="$UI/system/components/bootstrap/form/form"> 
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
            <div component="$UI/system/components/justep/toolBar/toolBar" class="x-toolbar x-toolbar-spliter form-inline"
              xid="detailBar"> 
              <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
                xid="addProductBtn" icon="icon-plus" onClick="{operation:'orderDetailData.new'}"> 
                <i xid="i6" class="icon-plus"/>  
                <span xid="span10"/> 
              </a>  
              <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
                xid="deleteBtn" onClick="{operation:'orderDetailData.delete'}"> 
                <i xid="i7"/>  
                <span xid="span11"/> 
              </a> 
            </div>  
            <div component="$UI/system/components/justep/grid/grid" hiddenCaptionbar="true"
              xid="products" data="orderDetailData" width="100%" height="auto" class="x-grid-no-bordered"> 
              <columns xid="columns3"> 
                <column name="fProductName" xid="column5" editable="true"> 
                  <editor xid="editor5"> 
		          <div class="x-gridSelect" component="$UI/system/components/justep/gridSelect/gridSelect"
		            xid="gridSelect1" bind-ref="ref('fProductCode')" bind-labelRef="ref('fProductName')"> 
		            <option xid="option2" data="prdocutData" value="fProductCode" label="fProductName"/>
		          </div>
                  </editor> 
                </column>  
                <column name="fUnitprice" xid="column1" editable="true"> 
                  <editor xid="editor1"> 
                    <input component="$UI/system/components/justep/input/input"
                      class="form-control" xid="price" bind-ref="ref('fUnitprice')"/> 
                  </editor> 
                </column>  
                <column name="fQuantity" xid="column2" editable="true"> 
                  <editor xid="editor2"> 
                    <input component="$UI/system/components/justep/input/input"
                      class="form-control" xid="quantity" bind-ref="ref('fQuantity')"/> 
                  </editor> 
                </column>  
                <column name="fDisCount" xid="column3" editable="true"> 
                  <editor xid="editor3"> 
                    <input component="$UI/system/components/justep/input/input"
                      class="form-control" xid="discount" bind-ref="ref('fDisCount')"/> 
                  </editor> 
                </column>  
                <column name="fFactAmt" xid="column7" editable="true"> 
                  <editor xid="editor6"> 
                    <input component="$UI/system/components/justep/input/input"
                      class="form-control" xid="factAmt" bind-ref="ref('fFactAmt')"/> 
                  </editor> 
                </column> 
              </columns> 
            </div> 
          </div> 
        </div>  
        <div component="$UI/system/components/justep/controlGroup/controlGroup"
          class="x-control-group" title="主管审核信息" xid="auditorGroup" collapsible="true"> 
          <div class="x-control-group-title" xid="auditorTitle"> 
            <span xid="span72">title</span> 
          </div>  
          <div> 
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
            <div class="form-group" xid="formGroup7"> 
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
            <span xid="span73">title</span> 
          </div>  
          <div> 
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
