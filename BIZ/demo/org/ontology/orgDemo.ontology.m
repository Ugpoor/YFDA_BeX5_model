<?xml version="1.0" encoding="UTF-8"?>
<model xmlns="http://www.justep.com/model">


<concept name="DEMO_ReportOrders" default-value-expr="guid()" keys="rOrderID"><has-relation relation="rOrderID" size="100" required="true"></has-relation>
<has-relation relation="rCustomerID" size="100"></has-relation>
<has-relation relation="rEmployeeID" size="100"></has-relation>
<has-relation relation="rOrderDate"></has-relation>
<has-relation relation="rRequiredDate"></has-relation>
<has-relation relation="rShippedDate"></has-relation>
<has-relation relation="rShipVia"></has-relation>
<has-relation relation="rFreght"><label language="zh_CN">运费</label>
</has-relation>
<has-relation relation="rShipName" size="100"></has-relation>
<has-relation relation="rShipAddress" size="100"></has-relation>
<has-relation relation="rShipCity" size="100"></has-relation>
<has-relation relation="rShipRegion" size="100"></has-relation>
<has-relation relation="rShipPostalCode" size="100"></has-relation>
<has-relation relation="rShipCountry" size="100"></has-relation>
<label language="zh_CN">订单</label>
</concept>
<relation name="rFreght" data-type="Decimal"><label language="zh_CN">货物重量</label>
</relation>
<relation name="rRequiredDate" data-type="DateTime"><label language="zh_CN">需要日期</label>
</relation>
<relation name="rShipVia" data-type="Integer"><label language="zh_CN">货运中转</label>
</relation>
<relation name="rOrderDate" data-type="DateTime"><label language="zh_CN">订单日期</label>
</relation>
<relation name="rEmployeeID" data-type="String"><label language="zh_CN">员工ID</label>
</relation>
<relation name="rShipCity" data-type="String"><label language="zh_CN">货运城市</label>
</relation>
<relation name="rShipPostalCode" data-type="String"><label language="zh_CN">货运邮编</label>
</relation>
<relation name="rShipRegion" data-type="String"><label language="zh_CN">区域</label>
</relation>
<relation name="rCustomerID" data-type="String"><label language="zh_CN">客户ID</label>
</relation>
<relation name="rOrderID" data-type="String"><label language="zh_CN">订单ID</label>
</relation>
<relation name="rShippedDate" data-type="DateTime"><label language="zh_CN">载运日期</label>
</relation>
<relation name="rShipName" data-type="String"><label language="zh_CN">货主姓名</label>
</relation>
<relation name="rShipAddress" data-type="String"><label language="zh_CN">货运地址</label>
</relation>
<relation name="rShipCountry" data-type="String"><label language="zh_CN">货运国家</label>
</relation>
</model>