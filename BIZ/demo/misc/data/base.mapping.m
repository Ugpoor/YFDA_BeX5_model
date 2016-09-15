<?xml version="1.0" encoding="UTF-8"?>
<model xmlns="http://www.justep.com/model">
	<mapping concept="DEMO_Unit">
		<table type="owner-table" name="DEMO_PubBase">
			<key field="fID" type="String"/>
			<discriminator field="fScode" value="DEMO_Unit"/>
		</table>
	</mapping>
	<mapping concept="DEMO_ExigenceLevel">
		<table type="owner-table" name="DEMO_PubBase">
			<key field="fID" type="String"/>
			<discriminator field="fScode" value="DEMO_ExigenceLevel"/>
		</table>
	</mapping>
	<mapping concept="DEMO_SecretLevel">
		<table type="owner-table" name="DEMO_PubBase">
			<key field="fID" type="String"/>
			<discriminator field="fScode" value="DEMO_SecretLevel"/>
		</table>
	</mapping>
	<mapping concept="DEMO_SendDirect">
		<table type="owner-table" name="DEMO_PubBase">
			<key field="fID" type="String"/>
			<discriminator field="fScode" value="DEMO_SendDirect"/>
		</table>
	</mapping>
	<!-- 
	<mapping concept="SA_OPOrg">
		<table type="owner-table" name="SA_OPOrg">
			<key field="sID" type="String"/>
			<item relation="sParent" field="sParent" type="String"/>
			<item relation="sFName" field="sFName" type="String"/>
			<item relation="sFID" field="sFID" type="String"/>
		</table>
	</mapping>
	 -->
	<store name="DEMO_Unit"/>
	<store name="DEMO_ExigenceLevel"/>
	<store name="DEMO_SecretLevel"/>
	<store name="DEMO_SendDirect"/>
	<!-- 
	<store name="SA_OPPerson"/>
	<store name="SA_OPOrg"/>
	 -->
</model>