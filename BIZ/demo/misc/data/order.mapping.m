<?xml version="1.0" encoding="UTF-8"?>
<model xmlns="http://www.justep.com/model">
 
	<mapping concept="DEMO_Order">
		<table type="owner-table" name="DEMO_Order">
			<key field="fID" type="String"/>
		</table>
	</mapping>

	<mapping concept="DEMO_OrderDetail">
		<table type="owner-table" name="DEMO_OrderDetail">
			<key field="fID" type="String" />
		</table>
	</mapping>

	<mapping concept="DEMO_Custemor">
		<table type="owner-table" name="DEMO_Custemor">
			<key field="fID" type="String"/>
		</table>
	</mapping>

	<mapping concept="DEMO_Product">
		<table type="owner-table" name="DEMO_Product">
			<key field="fID" type="String"/>
		</table>
	</mapping>
	<store name="DEMO_Order"></store>
	<store name="DEMO_OrderDetail" />
	<store name="DEMO_Custemor" />
	<store name="DEMO_Product" />
</model>
