<?xml version="1.0" encoding="UTF-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window" component="$UI/system/components/justep/window/window" design="device:pc">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:424px;top:349px;"><div component="$UI/system/components/justep/data/bizData" autoLoad="true" xid="dOrders" concept="DEMO_Orders"><reader xid="default2" action="/demo/common/logic/action/queryDEMO_OrdersAction"></reader></div></div> 
<div class="x-cell-layout" component="$UI/system/components/justep/cellLayout/cellLayout" style="width:100%; height: 100%;" xid="cellLayout1"><layout-content xid="default1"><![CDATA[
  <table cellspacing="0" cellpadding="0" rowHeight="19" columnWidth="80" style="border-collapse:collapse;table-layout:fixed;width:1px;">
     <tr><td ></td><td  style="width: 30px;"></td><td  style="width: 200px;"></td><td  style="width: 15px;"></td><td  style="width: 200px;"></td><td  style="width: 15px;"></td><td  style="width: 200px;"></td><td  style="width: 15px;"></td><td  style="width: 200px;"></td><td  style="width: 600px;"></td><td ></td></tr>
     <tr><td ></td><td  style="height: 19px;"></td><td  style="height: 19px;"></td><td  style="height: 19px;"></td><td  style="height: 19px;"></td><td  style="height: 19px;"></td><td  style="height: 19px;"></td><td  style="height: 19px;"></td><td  style="height: 19px;"></td><td  style="height: 19px;"></td><td  style="height: 19px;"></td></tr>
     <tr><td ></td><td  style="height: 19px;"></td><td  colSpan="8" style="height: 19px;">X5的业务动作（Action）是将Java函数通过模型描述定义的业务接口，动作的参数与Java函数的参数是一一对应的。</td><td  style="height: 19px;"></td></tr>
     <tr><td ></td><td  style="height: 19px;"></td><td  colSpan="8" style="height: 19px;">但是作为对外的服务接口，有时候要求不能把所有的参数作为对外的接口暴露出来，必须在服务端做一定程度的封装。</td><td  style="height: 19px;"></td></tr>
     <tr><td ></td><td  style="height: 19px;"></td><td  colSpan="8" style="height: 19px;">X5的动作参数支持以下四种访问权限：</td><td  style="height: 19px;"></td></tr>
     <tr><td ></td><td  style="height: 19px;"></td><td  colSpan="8" style="height: 19px;">　　public：公共参数（默认），是动作公布出来供外部调用时使用的参数，是真正的对外接口参数，由调用方给参数赋值。</td><td  style="height: 19px;"></td></tr>
     <tr><td ></td><td  style="height: 19px;"></td><td  colSpan="8" style="height: 19px;">　　protected：保护参数，只能在定义动作或引用动作时进行赋值。动作的保护参数在不同的功能中可以有不同的值，但是不能由调用方赋值。</td><td  style="height: 19px;"></td></tr>
     <tr><td ></td><td  style="height: 19px;"></td><td  colSpan="8" style="height: 19px;">　　private：私有参数，只能在定义动作时进行赋值。私有参数对于动作来说就是固定的值，无论这个动作在什么功能中使用，这些私有参数都是不变的，是在动作定义时就固定下来的。</td><td  style="height: 19px;"></td></tr>
     <tr><td ></td><td  style="height: 19px;"></td><td  colSpan="8" style="height: 19px;">　　permission：权限参数，只能通过数据权限来为参数赋值。权限参数是一种灵活的运行时参数，它的值不是在设计时由业务模型或代码逻辑决定的，而是在运行时由组织授权动态为参数赋值的。</td><td  style="height: 19px;"></td></tr>
     <tr><td ></td><td  style="height: 19px;"></td><td  colSpan="8" style="height: 19px;"></td><td  style="height: 19px;"></td></tr>
     <tr><td ></td><td  style="height: 19px;"></td><td  colSpan="8" style="height: 19px;">本案例的数据来源于概念DEMO_Orders和动作queryDEMO_OrdersAction，模型定义参见：/BIZ/demo/common/ontology/order.ontology.m。</td><td  style="height: 19px;"></td></tr>
     <tr><td ></td><td  style="height: 19px;"></td><td  colSpan="8" style="height: 19px;">本案例的功能模型参见：/BIZ/demo/actions/process/paramAccess/paramAccessProcess.process.m。</td><td  style="height: 19px;"></td></tr>
     <tr><td ></td><td  style="height: 19px;"></td><td  colSpan="8" style="height: 19px;">本案例的页面模型参见：/UI/demo/actions/process/paramAccess/mainActivity.w。</td><td  style="height: 19px;"></td></tr>
     <tr><td ></td><td  style="height: 19px;"></td><td  colSpan="8" style="height: 19px;">　　private（私有参数）：在动作queryDEMO_OrdersAction的模型定义中有很多私有参数（select、from、dataModel等），这些私有参数限定了当前动作无论在那个功能中被引用，都只能查询DEMO_Orders这个概念的数据。</td><td  style="height: 19px;"></td></tr>
     <tr><td ></td><td  style="height: 19px;"></td><td  colSpan="8" style="height: 19px;">　　protected（保护参数）：在功能引用动作queryDEMO_OrdersAction后，为保护参数condition赋值"DEMO_Orders.fStatus = 'checked'"，限定在当前这个功能中只能查询状态是"已审批"(checked)的订单。</td><td  style="height: 19px;"></td></tr>
     <tr><td ></td><td  style="height: 19px;"></td><td  colSpan="8" style="height: 19px;">　　public（公共参数）：点击下面的两个蓝色按钮，设置数据集dOrders的排序方式并刷新，数据集刷新时会通过queryDEMO_OrdersAction的公共参数orderBy传入排序方式。</td><td  style="height: 19px;"></td></tr>
     <tr><td ></td><td  style="height: 19px;"></td><td  colSpan="8" style="height: 19px;">　　permission（权限参数）：通过数据权限设置queryDEMO_OrdersAction的权限参数range的值，限定只能查询"华北"地区的数据。</td><td  style="height: 19px;"></td></tr>
     <tr><td ></td><td  style="height: 19px;"></td><td  colSpan="8" style="height: 19px;">　　　　1、点击下面的绿色按钮。自动创建数据角色，为queryDEMO_OrdersAction的range参数设置表达式"AND(DEMO_Orders.fShipRegion = '华北')"。</td><td  style="height: 19px;"></td></tr>
     <tr><td ></td><td  style="height: 19px;"></td><td  colSpan="8" style="height: 19px;">　　　　2、点击下面的橙色按钮。自动将前一步创建的角色授权给当前人。</td><td  style="height: 19px;"></td></tr>
     <tr><td ></td><td  style="height: 19px;"></td><td  colSpan="8" style="height: 19px;">　　　　3、重新登录后再次执行功能，观察通过权限参数影响动作的执行结果。</td><td  style="height: 19px;"></td></tr>
     <tr><td ></td><td  style="height: 19px;"></td><td  style="height: 19px;"></td><td  style="height: 19px;"></td><td  style="height: 19px;"></td><td  style="height: 19px;"></td><td  style="height: 19px;"></td><td  style="height: 19px;"></td><td  style="height: 19px;"></td><td  style="height: 19px;"></td><td  style="height: 19px;"></td></tr>
     <tr><td  style="height: 20px;"></td><td  style="height: 20px;"></td><td  style="height: 20px;" componentId="btnOrderByDesc"></td><td  style="height: 20px;"></td><td  style="height: 20px;" componentId="btnOrderByAsc"></td><td  style="height: 20px;"></td><td  style="height: 20px;" componentId="btnCreateDataPermission"></td><td  style="height: 20px;"></td><td  style="height: 20px;" componentId="btnAuthorize"></td><td  style="height: 20px;"></td><td  style="height: 20px;"></td></tr>
     <tr><td  style="height: 10px;"></td><td  style="height: 10px;"></td><td  style="height: 10px;"></td><td  style="height: 10px;"></td><td  style="height: 10px;"></td><td  style="height: 10px;"></td><td  style="height: 10px;"></td><td  style="height: 10px;"></td><td  style="height: 10px;"></td><td  style="height: 10px;"></td><td  style="height: 10px;"></td></tr>
     <tr><td  style="height: 200px;"></td><td  style="height: 200px;"></td><td  colSpan="8" style="height: 200px;" componentId="grid1"></td><td  style="height: 200px;"></td></tr>
  </table>
]]></layout-content>
  <a component="$UI/system/components/justep/button/button" class="btn btn-default x-cell-control" label="按需求日期降序排序" xid="btnOrderByDesc" onClick="btnOrderByDescClick">
   <i xid="i1"></i>
   <span xid="span1">按需求日期降序排序</span></a>
  <a component="$UI/system/components/justep/button/button" class="btn btn-default x-cell-control" label="按需求日期升序排序" xid="btnOrderByAsc" onClick="btnOrderByAscClick">
   <i xid="i2"></i>
   <span xid="span2">按需求日期升序排序</span></a>
  <a component="$UI/system/components/justep/button/button" class="btn btn-default x-cell-control" label="创建数据角色" xid="btnCreateDataPermission" onClick="btnCreateDataPermissionClick">
   <i xid="i3"></i>
   <span xid="span3">创建数据角色</span></a>
  <a component="$UI/system/components/justep/button/button" class="btn btn-default x-cell-control" label="给当前人授权" xid="btnAuthorize" onClick="btnAuthorizeClick">
   <i xid="i4"></i>
   <span xid="span4">给当前人授权</span></a>
  <div component="$UI/system/components/justep/grid/grid" hiddenCaptionbar="true" altRows="true" class="x-grid-no-bordered x-cell-control" xid="grid1" data="dOrders" height="auto" width="100%">
   <columns xid="columns1"><column width="100" name="fOrderNumber" xid="column1"></column>
  <column width="100" name="fOrderDate" xid="column2"></column>
  <column width="100" name="fRequiredDate" xid="column3"></column>
  <column width="100" name="fShippedDate" xid="column4"></column>
  <column width="100" name="fFreght" xid="column5"></column>
  <column width="100" name="fShipName" xid="column6"></column>
  <column width="100" name="fShipAddress" xid="column7"></column>
  <column width="100" name="fShipCity" xid="column8"></column>
  <column width="100" name="fShipRegion" xid="column9"></column>
  <column width="100" name="fShipPostalCode" xid="column10"></column>
  <column width="100" name="fStatus" xid="column11"></column></columns></div></div></div>