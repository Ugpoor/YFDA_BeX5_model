<?xml version="1.0" encoding="UTF-8" standalone="no"?><model xmlns="http://www.justep.com/model">
	<store name="SA_FilterPattern"/>
	<mapping concept="SA_FilterPattern">
		<table name="SA_FilterPattern" type="owner-table">
			<key field="sID" type="String"/>
			<item field="sName" relation="sName" type="String"/>
			<item field="sPerson" relation="sPerson" type="String"/>
			<item field="sProcess" relation="sProcess" type="String"/>
			<item field="sActivity" relation="sActivity" type="String"/>
			<item field="sInstance" relation="sInstance" type="String"/>
			<item field="sContent" relation="sContent" type="String"/>
			<item field="sOrderNum" relation="sOrderNum" type="Integer"/>
			<item field="version" relation="version" type="Integer"/>
		</table>
	</mapping>
</model>