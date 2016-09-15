<?xml version="1.0" encoding="utf-8"?>

<model xmlns="http://www.justep.com/model">  
  <action name="queryDEMO_CustomersAction" procedure="bizQueryProcedure"> 
    <permission name="range" type="List"/>  
    <private name="concept" type="String" value="DEMO_Customers"/>  
    <private name="select" type="String" value="DEMO_Customers.*"/>  
    <private name="from" type="String" value="DEMO_Customers DEMO_Customers"/>  
    <private name="aggregate" type="String"/>  
    <private name="dataModel" type="String" value="/demo/common/data"/>  
    <private name="fnModel" type="String"/>  
    <protected name="condition" type="String"/>  
    <public name="distinct" type="Boolean" value="false"/>  
    <public name="idColumn" type="String" value="DEMO_Customers"/>  
    <public name="filter" type="String"/>  
    <public name="limit" type="Integer"/>  
    <public name="offset" type="Integer"/>  
    <public name="columns" type="String"/>  
    <public name="orderBy" type="String"/>  
    <public name="aggregateColumns" type="String"/>  
    <public name="variables" type="Map"/> 
  </action>  
  <action name="saveDEMO_CustomersAction" procedure="bizSaveProcedure"> 
    <permission name="insertRange" type="List"/>  
    <permission name="deleteRange" type="List"/>  
    <permission name="updateRange" type="List"/>  
    <private name="concept" type="String" value="DEMO_Customers"/>  
    <private name="dataModel" type="String" value="/demo/common/data"/>  
    <private name="fnModel" type="String"/>  
    <protected name="readOnly" type="String"/>  
    <protected name="notNull" type="String"/>  
    <public name="table" required="true" type="Table"/> 
  </action>  
  <action name="createDEMO_CustomersAction" procedure="bizCreateProcedure"> 
    <private name="concept" type="String" value="DEMO_Customers"/>  
    <private name="fnModel" type="String"/>  
    <public name="table" required="true" type="Table"/>  
    <public name="defaultValues" type="Map"/> 
  </action>  
  <action name="queryDEMO_OrderDetailsAction" procedure="bizQueryProcedure"> 
    <permission name="range" type="List"/>  
    <private name="concept" type="String" value="DEMO_OrderDetails"/>  
    <private name="select" type="String" value="DEMO_OrderDetails.*,(DEMO_OrderDetails.fUnitPrice * DEMO_OrderDetails.fQuantity * (1 - DEMO_OrderDetails.fDiscount)) as fMoney,DEMO_Products.fProductName as fProductName,DEMO_Products.fQuantityPerUnit as fQuantityPerUnit"/>  
    <private name="from" type="String" value="DEMO_OrderDetails DEMO_OrderDetails  optional  join DEMO_Products DEMO_Products on DEMO_OrderDetails.fProductID = DEMO_Products"/>  
    <private name="aggregate" type="String"/>  
    <private name="dataModel" type="String" value="/demo/common/data"/>  
    <private name="fnModel" type="String"/>  
    <protected name="condition" type="String"/>  
    <public name="distinct" type="Boolean" value="false"/>  
    <public name="idColumn" type="String" value="DEMO_OrderDetails"/>  
    <public name="filter" type="String"/>  
    <public name="limit" type="Integer"/>  
    <public name="offset" type="Integer"/>  
    <public name="columns" type="String"/>  
    <public name="orderBy" type="String"/>  
    <public name="aggregateColumns" type="String"/>  
    <public name="variables" type="Map"/>  
    <label language="zh_CN">查询订单明细动作</label> 
  </action>  
  <action name="saveDEMO_OrderDetailsAction" procedure="bizSaveProcedure"> 
    <permission name="insertRange" type="List"/>  
    <permission name="deleteRange" type="List"/>  
    <permission name="updateRange" type="List"/>  
    <private name="concept" type="String" value="DEMO_OrderDetails"/>  
    <private name="dataModel" type="String" value="/demo/common/data"/>  
    <private name="fnModel" type="String"/>  
    <protected name="readOnly" type="String"/>  
    <protected name="notNull" type="String"/>  
    <public name="table" required="true" type="Table"/> 
  </action>  
  <action name="createDEMO_OrderDetailsAction" procedure="bizCreateProcedure"> 
    <private name="concept" type="String" value="DEMO_OrderDetails"/>  
    <private name="fnModel" type="String"/>  
    <public name="table" required="true" type="Table"/>  
    <public name="defaultValues" type="Map"/> 
  </action>  
  <action name="queryDEMO_ProductCategoryAction" procedure="bizQueryProcedure"> 
    <permission name="range" type="List"/>  
    <private name="concept" type="String" value="DEMO_ProductCategory"/>  
    <private name="select" type="String" value="DEMO_ProductCategory.*"/>  
    <private name="from" type="String" value="DEMO_ProductCategory DEMO_ProductCategory"/>  
    <private name="aggregate" type="String"/>  
    <private name="dataModel" type="String" value="/demo/common/data"/>  
    <private name="fnModel" type="String"/>  
    <protected name="condition" type="String"/>  
    <public name="distinct" type="Boolean" value="false"/>  
    <public name="idColumn" type="String" value="DEMO_ProductCategory"/>  
    <public name="filter" type="String"/>  
    <public name="limit" type="Integer"/>  
    <public name="offset" type="Integer"/>  
    <public name="columns" type="String"/>  
    <public name="orderBy" type="String"/>  
    <public name="aggregateColumns" type="String"/>  
    <public name="variables" type="Map"/> 
  </action>  
  <action name="saveDEMO_ProductCategoryAction" procedure="bizSaveProcedure"> 
    <permission name="insertRange" type="List"/>  
    <permission name="deleteRange" type="List"/>  
    <permission name="updateRange" type="List"/>  
    <private name="concept" type="String" value="DEMO_ProductCategory"/>  
    <private name="dataModel" type="String" value="/demo/common/data"/>  
    <private name="fnModel" type="String"/>  
    <protected name="readOnly" type="String"/>  
    <protected name="notNull" type="String"/>  
    <public name="table" required="true" type="Table"/> 
  </action>  
  <action name="createDEMO_ProductCategoryAction" procedure="bizCreateProcedure"> 
    <private name="concept" type="String" value="DEMO_ProductCategory"/>  
    <private name="fnModel" type="String"/>  
    <public name="table" required="true" type="Table"/>  
    <public name="defaultValues" type="Map"/> 
  </action>  
  <action name="queryDEMO_ProductsAction" procedure="bizQueryProcedure"> 
    <permission name="range" type="List"/>  
    <private name="concept" type="String" value="DEMO_Products"/>  
    <private name="select" type="String" value="DEMO_Products.*"/>  
    <private name="from" type="String" value="DEMO_Products DEMO_Products"/>  
    <private name="aggregate" type="String"/>  
    <private name="dataModel" type="String" value="/demo/common/data"/>  
    <private name="fnModel" type="String"/>  
    <protected name="condition" type="String"/>  
    <public name="distinct" type="Boolean" value="false"/>  
    <public name="idColumn" type="String" value="DEMO_Products"/>  
    <public name="filter" type="String"/>  
    <public name="limit" type="Integer"/>  
    <public name="offset" type="Integer"/>  
    <public name="columns" type="String"/>  
    <public name="orderBy" type="String"/>  
    <public name="aggregateColumns" type="String"/>  
    <public name="variables" type="Map"/> 
  </action>  
  <action name="saveDEMO_ProductsAction" procedure="bizSaveProcedure"> 
    <permission name="insertRange" type="List"/>  
    <permission name="deleteRange" type="List"/>  
    <permission name="updateRange" type="List"/>  
    <private name="concept" type="String" value="DEMO_Products"/>  
    <private name="dataModel" type="String" value="/demo/common/data"/>  
    <private name="fnModel" type="String"/>  
    <protected name="readOnly" type="String"/>  
    <protected name="notNull" type="String"/>  
    <public name="table" required="true" type="Table"/> 
  </action>  
  <action name="createDEMO_ProductsAction" procedure="bizCreateProcedure"> 
    <private name="concept" type="String" value="DEMO_Products"/>  
    <private name="fnModel" type="String"/>  
    <public name="table" required="true" type="Table"/>  
    <public name="defaultValues" type="Map"/> 
  </action>  
  <action name="queryDEMO_ShippersAction" procedure="bizQueryProcedure"> 
    <permission name="range" type="List"/>  
    <private name="concept" type="String" value="DEMO_Shippers"/>  
    <private name="select" type="String" value="DEMO_Shippers.*"/>  
    <private name="from" type="String" value="DEMO_Shippers DEMO_Shippers"/>  
    <private name="aggregate" type="String"/>  
    <private name="dataModel" type="String" value="/demo/common/data"/>  
    <private name="fnModel" type="String"/>  
    <protected name="condition" type="String"/>  
    <public name="distinct" type="Boolean" value="false"/>  
    <public name="idColumn" type="String" value="DEMO_Shippers"/>  
    <public name="filter" type="String"/>  
    <public name="limit" type="Integer"/>  
    <public name="offset" type="Integer"/>  
    <public name="columns" type="String"/>  
    <public name="orderBy" type="String"/>  
    <public name="aggregateColumns" type="String"/>  
    <public name="variables" type="Map"/> 
  </action>  
  <action name="saveDEMO_ShippersAction" procedure="bizSaveProcedure"> 
    <permission name="insertRange" type="List"/>  
    <permission name="deleteRange" type="List"/>  
    <permission name="updateRange" type="List"/>  
    <private name="concept" type="String" value="DEMO_Shippers"/>  
    <private name="dataModel" type="String" value="/demo/common/data"/>  
    <private name="fnModel" type="String"/>  
    <protected name="readOnly" type="String"/>  
    <protected name="notNull" type="String"/>  
    <public name="table" required="true" type="Table"/> 
  </action>  
  <action name="createDEMO_ShippersAction" procedure="bizCreateProcedure"> 
    <private name="concept" type="String" value="DEMO_Shippers"/>  
    <private name="fnModel" type="String"/>  
    <public name="table" required="true" type="Table"/>  
    <public name="defaultValues" type="Map"/> 
  </action>  
  <action name="queryDEMO_SuppliersAction" procedure="bizQueryProcedure"> 
    <permission name="range" type="List"/>  
    <private name="concept" type="String" value="DEMO_Suppliers"/>  
    <private name="select" type="String" value="DEMO_Suppliers.*"/>  
    <private name="from" type="String" value="DEMO_Suppliers DEMO_Suppliers"/>  
    <private name="aggregate" type="String"/>  
    <private name="dataModel" type="String" value="/demo/common/data"/>  
    <private name="fnModel" type="String"/>  
    <protected name="condition" type="String"/>  
    <public name="distinct" type="Boolean" value="false"/>  
    <public name="idColumn" type="String" value="DEMO_Suppliers"/>  
    <public name="filter" type="String"/>  
    <public name="limit" type="Integer"/>  
    <public name="offset" type="Integer"/>  
    <public name="columns" type="String"/>  
    <public name="orderBy" type="String"/>  
    <public name="aggregateColumns" type="String"/>  
    <public name="variables" type="Map"/> 
  </action>  
  <action name="saveDEMO_SuppliersAction" procedure="bizSaveProcedure"> 
    <permission name="insertRange" type="List"/>  
    <permission name="deleteRange" type="List"/>  
    <permission name="updateRange" type="List"/>  
    <private name="concept" type="String" value="DEMO_Suppliers"/>  
    <private name="dataModel" type="String" value="/demo/common/data"/>  
    <private name="fnModel" type="String"/>  
    <protected name="readOnly" type="String"/>  
    <protected name="notNull" type="String"/>  
    <public name="table" required="true" type="Table"/> 
  </action>  
  <action name="createDEMO_SuppliersAction" procedure="bizCreateProcedure"> 
    <private name="concept" type="String" value="DEMO_Suppliers"/>  
    <private name="fnModel" type="String"/>  
    <public name="table" required="true" type="Table"/>  
    <public name="defaultValues" type="Map"/> 
  </action>  
  <action name="queryDEMO_OrdersAction" procedure="queryDEMO_OrdersProcedure"> 
    <permission name="range" type="List"/>  
    <private name="concept" type="String" value="DEMO_Orders"/>  
    <private name="select" type="String" value="DEMO_Orders.*,DEMO_Customers.fCompanyName as fCompanyName,DEMO_Customers.fContactName as fContactName,DEMO_Customers.fPhone as fPhone,(select  (SUM( DEMO_OrderDetails.fUnitPrice * DEMO_OrderDetails.fQuantity * ( 1 - DEMO_OrderDetails.fDiscount ))) as sumMoney from DEMO_OrderDetails DEMO_OrderDetails  where DEMO_OrderDetails.fOrderID = DEMO_Orders) as fTotalMoney,((CASE     WHEN DEMO_Orders.fStatus = 'checking' THEN '审批中'     WHEN DEMO_Orders.fStatus = 'checked' THEN '已审批'     WHEN DEMO_Orders.fStatus = 'shipped' THEN '已发货'   END)) as fStatusName, '' as fChineseTotalMoney, '' as fChineseFreght"/>  
    <private name="from" type="String" value="DEMO_Orders DEMO_Orders  optional  join DEMO_Customers DEMO_Customers on DEMO_Orders.fCustomerID = DEMO_Customers"/>  
    <private name="aggregate" type="String"/>  
    <private name="dataModel" type="String" value="/demo/common/data"/>  
    <private name="fnModel" type="String"/>  
    <protected name="condition" type="String"/>  
    <public name="distinct" type="Boolean" value="false"/>  
    <public name="idColumn" type="String" value="DEMO_Orders"/>  
    <public name="filter" type="String"/>  
    <public name="limit" type="Integer"/>  
    <public name="offset" type="Integer"/>  
    <public name="columns" type="String"/>  
    <public name="orderBy" type="String"/>  
    <public name="aggregateColumns" type="String"/>  
    <public name="variables" type="Map"/>  
    <label language="zh_CN">查询订单动作</label> 
  </action>  
  <action name="saveDEMO_OrdersAction" procedure="bizSaveProcedure"> 
    <permission name="insertRange" type="List"/>  
    <permission name="deleteRange" type="List"/>  
    <permission name="updateRange" type="List"/>  
    <private name="concept" type="String" value="DEMO_Orders"/>  
    <private name="dataModel" type="String" value="/demo/common/data"/>  
    <private name="fnModel" type="String"/>  
    <protected name="readOnly" type="String"/>  
    <protected name="notNull" type="String"/>  
    <public name="table" required="true" type="Table"/> 
  </action>  
  <action name="createDEMO_OrdersAction" procedure="bizCreateProcedure"> 
    <private name="concept" type="String" value="DEMO_Orders"/>  
    <private name="fnModel" type="String"/>  
    <public name="table" required="true" type="Table"/>  
    <public name="defaultValues" type="Map"/> 
  </action>  
  <action name="queryDistinctShipCityAction" procedure="bizQueryProcedure"> 
    <permission name="range" type="List"/>  
    <private name="concept" type="String" value="DEMO_Orders"/>  
    <private name="select" type="String" value="DEMO_Orders.fShipCity as fShipCity"/>  
    <private name="from" type="String" value="DEMO_Orders DEMO_Orders"/>  
    <private name="aggregate" type="String"/>  
    <private name="dataModel" type="String" value="/demo/common/data"/>  
    <private name="fnModel" type="String"/>  
    <protected name="condition" type="String"/>  
    <public name="distinct" type="Boolean" value="true"/>  
    <public name="idColumn" type="String" value="fShipCity"/>  
    <public name="filter" type="String"/>  
    <public name="limit" type="Integer"/>  
    <public name="offset" type="Integer"/>  
    <public name="columns" type="String"/>  
    <public name="orderBy" type="String"/>  
    <public name="aggregateColumns" type="String"/>  
    <public name="variables" type="Map"/>  
    <label language="zh_CN">查询发货城市</label> 
  </action> 
</model>
