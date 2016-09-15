<?xml version="1.0" encoding="UTF-8"?><model xmlns="http://www.justep.com/model">
<store name="DEMO_Suppliers"/>
<store name="DEMO_Shippers"/>
<store name="DEMO_Products"/>
<store name="DEMO_ProductCategory"/>
<store name="DEMO_Orders"/>
<store name="DEMO_OrderDetails"/>
  
  <store name="DEMO_Customers"/>  
  <mapping concept="DEMO_Customers">
    <table name="DEMO_Customers" type="owner-table">
      <key field="fCustomerID" type="String"/> 
    </table> 
  </mapping> 
<mapping concept="DEMO_OrderDetails"><table name="DEMO_OrderDetails" type="owner-table"><key field="fOrderDetailID" type="String"/>
<item field="fOrderID" relation="fOrderID" type="String"/>
<index fields="fOrderID" name="IDX_DEMO_OrderDetails_fOrderID" type="NORMAL"/>

<index fields="fProductID" name="IDX__1072437643" type="NORMAL"/>
</table>
</mapping>
<mapping concept="DEMO_Orders"><table name="DEMO_Orders" type="owner-table"><key field="fOrderID" type="String"/>

<index fields="fCustomerID" name="IDX_DEMO_Orders_fCustomerID" type="NORMAL"/>
<index fields="fShipperID" name="IDX_DEMO_Orders_fShipperID" type="NORMAL"/>
</table>
</mapping>
<mapping concept="DEMO_ProductCategory"><table name="DEMO_ProductCategory" type="owner-table"><key field="fCategoryID" type="String"/>
</table>
</mapping>
<mapping concept="DEMO_Products"><table name="DEMO_Products" type="owner-table"><key field="fProductID" type="String"/>
<index fields="fProductName,fQuantityPerUnit" name="IDX_701450938" type="UNIQUE"/>
</table>
</mapping>
<mapping concept="DEMO_Shippers"><table name="DEMO_Shippers" type="owner-table"><key field="fShipperID" type="String"/>
</table>
</mapping>
<mapping concept="DEMO_Suppliers"><table name="DEMO_Suppliers" type="owner-table"><key field="fSupplierID" type="String"/>
</table>
</mapping>
</model>