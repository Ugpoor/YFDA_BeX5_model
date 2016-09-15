<?xml version="1.0" encoding="UTF-8"?>
<model xmlns="http://www.justep.com/model">
	<store name="SA_OPManageType"/>
	<store name="SA_OPManagement"/>
	<store name="SA_OPRoleManagement"/>
	<mapping concept="SA_OPManageType">
		<table type="owner-table" name="SA_OPManageType">
			<key field="sID" type="String"/>
		</table>
	</mapping>
	<mapping concept="SA_OPManagement">
		<table type="owner-table" name="SA_OPManagement">
			<key field="sID" type="String"/>
		</table>
	</mapping>
	<mapping concept="SA_OPRoleManagement">
		<table type="owner-table" name="SA_OPRoleManagement">
			<key field="sID" type="String"/>
		</table>
	</mapping>
</model>