<?xml version="1.0" encoding="UTF-8"?><model xmlns="http://www.justep.com/model">
<store name="SA_DocNameSpace"></store>
<store name="SA_DocLog"></store>
<store name="SA_DocLinkDefine"></store>
<store name="SA_DocLink"></store>
<store name="SA_DocAuth"></store>
<store name="SA_DocNode"></store>
	<mapping concept="SA_DocNode">
		<table name="SA_DocNode" type="owner-table">
			<key field="sID" type="String"/>
			<item field="sParentID" relation="sParentID" type="String"/>
		</table>
	</mapping>
	<mapping concept="SA_DocAuth">
		<table name="SA_DocAuth" type="owner-table">
			<key field="sID" type="String"/>
		</table>
	</mapping>
	<mapping concept="SA_DocLink">
		<table name="SA_DocLink" type="owner-table">
			<key field="sID" type="String"/>
		</table>
	</mapping>
	<mapping concept="SA_DocLinkDefine">
		<table name="SA_DocLinkDefine" type="owner-table">
			<key field="sID" type="String"/>
		</table>
	</mapping>
	<mapping concept="SA_DocLog">
		<table name="SA_DocLog" type="owner-table">
			<key field="sID" type="String"/>
			<item field="sDocID" relation="sDocID" type="String"/>
			<item field="sPersonFID" relation="sPersonFID" type="String"/>
			<item field="sPersonName" relation="sPersonName" type="String"/>
			<item field="sDeptName" relation="sDeptName" type="String"/>
			<item field="sTime" relation="sTime" type="DateTime"/>
			<item field="sAccessType" relation="sAccessType" type="String"/>
			<item field="sDocVersionID" relation="sDocVersionID" type="Integer"/>
			<item field="version" relation="version" type="Integer"/>
		</table>
	</mapping>
	<mapping concept="SA_DocNameSpace">
		<table name="SA_DocNameSpace" type="owner-table">
			<key field="sID" type="String"/>
   			<item field="sDisplayName" relation="sDisplayName" type="String"/>
			<item field="sHost" relation="sHost" type="String"/>
			<item field="sPort" relation="sPort" type="String"/>
			<item field="sFlag" relation="sFlag" type="Integer"/>
			<item field="version" relation="version" type="String"/>
		</table>
	</mapping>
</model>