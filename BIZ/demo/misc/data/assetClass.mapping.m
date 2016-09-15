<?xml version="1.0" encoding="UTF-8"?>
<model xmlns="http://www.justep.com/model">
	<store name="DEMO_AssetClass"/>
	<mapping concept="DEMO_AssetClass">
		<table name="DEMO_PubBase" type="owner-table">
			<key field="fID" type="String"/>
			<item field="fParentID" relation="fParentID" type="String"/>
			<discriminator field="fScode" value="DEMO_AssetClass"/>
		</table>
	</mapping>
</model>