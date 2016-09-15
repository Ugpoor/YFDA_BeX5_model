<?xml version="1.0" encoding="utf-8"?>

<model xmlns="http://www.justep.com/model">  
  <relation name="fContactTitle" data-type="String" size="64"> 
    <label language="zh_CN">联系人职位</label> 
  </relation>  
  <relation name="fPostalCode" data-type="String" size="16"> 
    <label language="zh_CN">邮编</label> 
  </relation>  
  <relation name="fPhone" data-type="String" size="64"> 
    <label language="zh_CN">电话</label> 
  </relation>  
  <relation name="fCity" data-type="String" size="64"> 
    <label language="zh_CN">城市</label> 
  </relation>  
  <relation name="fAddress" data-type="String" size="256"> 
    <label language="zh_CN">地址</label> 
  </relation>  
  <relation name="fCompanyName" data-type="String" size="64"> 
    <label language="zh_CN">公司名称</label> 
  </relation>  
  <relation name="fFax" data-type="String" size="64"> 
    <label language="zh_CN">传真</label> 
  </relation>  
  <relation name="fCountry" data-type="String" size="64"> 
    <label language="zh_CN">国家</label> 
  </relation>  
  <relation name="fContactName" data-type="String" size="64"> 
    <label language="zh_CN">联系人名称</label> 
  </relation>  
  <relation name="fQuantityPerUnit" data-type="String" size="64"> 
    <label language="zh_CN">规格</label> 
  </relation>  
  <relation name="fShipCity" data-type="String" size="64"> 
    <label language="zh_CN">收货城市</label> 
  </relation>  
  <relation name="fFreght" data-type="Decimal" size="20" scale="4"> 
    <label language="zh_CN">运费</label> 
  </relation>  
  <relation name="fShippedDate" data-type="Date"> 
    <label language="zh_CN">发货日期</label> 
  </relation>  
  <relation name="fEmployeeID" data-type="String" size="32"> 
    <label language="zh_CN">员工ID</label> 
  </relation>  
  <relation name="fUnitPrice" data-type="Decimal" size="20" scale="4"> 
    <label language="zh_CN">单价</label> 
  </relation>  
  <relation name="fShipPostalCode" data-type="String" size="16"> 
    <label language="zh_CN">收货邮编</label> 
  </relation>  
  <relation name="fProductName" data-type="String" size="64"> 
    <label language="zh_CN">产品名称</label> 
  </relation>  
  <relation name="fCategoryID" data-type="String" size="32"> 
    <label language="zh_CN">产品分类ID</label> 
  </relation>  
  <relation name="fOrderID" data-type="String" size="32"> 
    <label language="zh_CN">订单ID</label> 
  </relation>  
  <relation name="fRequiredDate" data-type="Date"> 
    <label language="zh_CN">需求日期</label> 
  </relation>  
  <relation name="fCategoryDesc" data-type="Text"> 
    <label language="zh_CN">产品分类说明</label> 
  </relation>  
  <relation name="fShipAddress" data-type="String" size="256"> 
    <label language="zh_CN">收货地址</label> 
  </relation>  
  <relation name="fOrderDate" data-type="Date"> 
    <label language="zh_CN">订单日期</label> 
  </relation>  
  <relation name="fHomePage" data-type="Text"> 
    <label language="zh_CN">首页</label> 
  </relation>  
  <relation name="fCompanyname" data-type="String" size="64"> 
    <label language="zh_CN">公司名称</label> 
  </relation>  
  <relation name="fUnitsinstock" data-type="Integer"> 
    <label language="zh_CN">单位库存</label> 
  </relation>  
  <relation name="fShipName" data-type="String" size="64"> 
    <label language="zh_CN">收货人</label> 
  </relation>  
  <relation name="fQuantity" data-type="Integer"> 
    <label language="zh_CN">数量</label> 
  </relation>  
  <relation name="fCustomerID" data-type="String" size="32"> 
    <label language="zh_CN">客户ID</label> 
  </relation>  
  <relation name="fProductID" data-type="String" size="32"> 
    <label language="zh_CN">产品ID</label> 
  </relation>  
  <relation name="fCategoryName" data-type="String" size="64"> 
    <label language="zh_CN">产品分类名称</label> 
  </relation>  
  <relation name="fSupplierID" data-type="String" size="32"> 
    <label language="zh_CN">供应商ID</label> 
  </relation>  
  <relation name="fDiscount" data-type="Decimal" size="5" scale="2"> 
    <label language="zh_CN">折扣</label> 
  </relation>  
  <relation name="fShipCountry" data-type="String" size="64"> 
    <label language="zh_CN">收货国家</label> 
  </relation>  
  <relation name="fShipperID" data-type="String" size="32"> 
    <label language="zh_CN">物流公司ID</label> 
  </relation>  
  <relation name="fOrderDetails" data-type="DEMO_OrderDetails" single-valued="false"> 
    <label language="zh_CN">订单明细</label> 
  </relation>  
  <relation name="fOrderNumber" data-type="String" size="32"> 
    <label language="zh_CN">订单号</label> 
  </relation>  
  <concept name="DEMO_Orders" default-value-expr="guid()"> 
    <has-relation relation="version" required="true"/>  
    <has-relation relation="fOrderDetails" inverse-of="fOrderID" whole-part="composition"
      unique="false"/>  
    <has-relation relation="fOrderNumber" unique="true" required="true" default-value-expr="nextSeqString(dateFormat(currentDate(), 'yyyyMMdd'), '0000')"/>  
    <has-relation relation="fCustomerID"/>  
    <has-relation relation="fEmployeeID" default-value-expr="currentPersonID()"/>  
    <has-relation relation="fOrderDate" required="true" default-value-expr="currentDate()"/>  
    <has-relation relation="fRequiredDate"/>  
    <has-relation relation="fShippedDate"/>  
    <has-relation relation="fShipperID"/>  
    <has-relation relation="fFreght"/>  
    <has-relation relation="fShipName"/>  
    <has-relation relation="fShipAddress"/>  
    <has-relation relation="fShipCity"/>  
    <has-relation relation="fShipRegion"/>  
    <has-relation relation="fShipPostalCode"/>  
    <has-relation relation="fShipCountry"/>  
    <label language="zh_CN">订单</label>  
    <has-relation relation="fStatus" data-type="String" required="true"/> 
  </concept>  
  <concept name="DEMO_OrderDetails" default-value-expr="guid()"> 
    <has-relation relation="version" required="true"/>  
    <has-relation relation="fOrderID" required="true"/>  
    <has-relation relation="fProductID" required="true"/>  
    <has-relation relation="fUnitPrice" required="true"/>  
    <has-relation relation="fQuantity" required="true"/>  
    <has-relation relation="fDiscount" required="true" default-value-expr="0"/>  
    <label language="zh_CN">订单明细</label> 
  </concept>  
  <concept name="DEMO_ProductCategory" default-value-expr="guid()"> 
    <has-relation relation="version" required="true"/>  
    <has-relation relation="fCategoryName" required="true" unique="true"/>  
    <has-relation relation="fCategoryDesc"/>  
    <label language="zh_CN">产品分类</label> 
  </concept>  
  <concept name="DEMO_Products" default-value-expr="guid()"> 
    <has-relation relation="version" required="true"/>  
    <has-relation relation="fProductName" required="true"/>  
    <has-relation relation="fSupplierID"/>  
    <has-relation relation="fCategoryID" required="true"/>  
    <has-relation relation="fQuantityPerUnit" required="true"/>  
    <has-relation relation="fUnitPrice" required="true"/>  
    <has-relation relation="fUnitsinstock" required="true"/>  
    <label language="zh_CN">产品</label> 
  </concept>  
  <concept name="DEMO_Shippers" default-value-expr="guid()"> 
    <has-relation relation="version" required="true"/>  
    <has-relation relation="fCompanyname" required="true" unique="true"/>  
    <has-relation relation="fPhone"/>  
    <label language="zh_CN">物流公司</label> 
  </concept>  
  <concept name="DEMO_Customers" default-value-expr="guid()"> 
    <has-relation relation="version" required="true"/>  
    <has-relation relation="fCompanyName" required="true" unique="true"/>  
    <has-relation relation="fContactName"/>  
    <has-relation relation="fContactTitle"/>  
    <has-relation relation="fAddress"/>  
    <has-relation relation="fCity"/>  
    <has-relation relation="fRegion"/>  
    <has-relation relation="fPostalCode"/>  
    <has-relation relation="fCountry"/>  
    <has-relation relation="fPhone"/>  
    <has-relation relation="fFax"/>  
    <label language="zh_CN">客户</label> 
  </concept>  
  <concept name="DEMO_Suppliers" default-value-expr="guid()"> 
    <has-relation relation="version" single-valued="true" required="true"/>  
    <has-relation relation="fCompanyName" required="true" unique="true"/>  
    <has-relation relation="fContactName"/>  
    <has-relation relation="fContactTitle"/>  
    <has-relation relation="fAddress"/>  
    <has-relation relation="fCity"/>  
    <has-relation relation="fRegion"/>  
    <has-relation relation="fPostalCode"/>  
    <has-relation relation="fCountry"/>  
    <has-relation relation="fPhone"/>  
    <has-relation relation="fFax"/>  
    <has-relation relation="fHomePage"/>  
    <label language="zh_CN">供应商</label> 
  </concept>  
  <relation name="fStatus" data-type="String" size="16"> 
    <label language="zh_CN">状态</label> 
  </relation>  
  <relation name="fRegion" data-type="String" size="64"> 
    <label language="zh_CN">地区</label> 
  </relation>  
  <relation name="fShipRegion" data-type="String" size="64"> 
    <label language="zh_CN">收货地区</label> 
  </relation> 
</model>
