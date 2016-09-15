<?xml version="1.0" encoding="UTF-8" standalone="no"?><model xmlns="http://www.justep.com/model">
<store name="SA_TaskRelation"/>
	<store name="SA_Task"/>
	<store name="SA_TaskScope"/>
	<store name="SA_TaskKind"/>
	<store name="SA_TaskStatus"/>
	<store name="SA_Importance"/>
	<store name="SA_Emergency"/>
	<store name="SA_TaskExecuteMode"/>
	<store name="SA_TaskPreemptMode"/>
	<store name="SA_TaskType"/>
	<store name="SA_ProcessControl"/>
	<store name="SA_TokenInstance"/>
	<mapping concept="SA_Task">
		<table name="SA_Task" type="owner-table" shard-strategy="shardInContext()" shards="histroy">
			<key field="sID" type="String"/>
			<item field="sParentID" relation="sParent" type="String"/>
		</table>
		<table name="SA_TaskRelation" type="relation-table" shard-strategy="shardInContext()" shards="histroy">
			<key field="sTaskID1" type="String"/>
			<item field="sTaskID2" relation="sNext" type="String"/>
		</table>
	</mapping>
	<mapping concept="SA_TaskScope">
		<table name="SA_Code" type="owner-table">
			<key field="sID" type="String"/>
			<discriminator field="sType" value="taskScope"/>
		</table>
	</mapping>
	<mapping concept="SA_TaskKind">
		<table name="SA_Code" type="owner-table">
			<key field="sID" type="String"/>
			<discriminator field="sType" value="taskKind"/>
		</table>
	</mapping>
	<mapping concept="SA_TaskStatus">
		<table name="SA_Code" type="owner-table">
			<key field="sID" type="String"/>
			<discriminator field="sType" value="executeStatus"/>
		</table>
	</mapping>
	<mapping concept="SA_Importance">
		<table name="SA_Code" type="owner-table">
			<key field="sID" type="String"/>
			<discriminator field="sType" value="importance"/>
		</table>
	</mapping>
	<mapping concept="SA_Emergency">
		<table name="SA_Code" type="owner-table">
			<key field="sID" type="String"/>
			<discriminator field="sType" value="emergency"/>
		</table>
	</mapping>
	<mapping concept="SA_TaskExecuteMode">
		<table name="SA_Code" type="owner-table">
			<key field="sID" type="String"/>
			<discriminator field="sType" value="taskExecuteMode"/>
		</table>
	</mapping>
	<mapping concept="SA_TaskPreemptMode">
		<table name="SA_Code" type="owner-table">
			<key field="sID" type="String"/>
			<discriminator field="sType" value="taskPreemptMode"/>
		</table>
	</mapping>
	<mapping concept="SA_TaskType">
		<table name="SA_TaskType" type="owner-table">
			<key field="sID" type="String"/>
		</table>
	</mapping>
<mapping concept="SA_TaskRelation"><table name="SA_TaskRelation" type="owner-table" shard-strategy="shardInContext()" shards="histroy">
</table>
</mapping>
</model>