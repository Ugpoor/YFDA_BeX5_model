<?xml version="1.0" encoding="UTF-8"?>
<model xmlns="http://www.justep.com/model">
	<store name="SA_WorkTask"/>
	<mapping concept="SA_WorkTask">
		<table type="owner-table" name="SA_Task">
			<key field="sID" type="String"/>
			
			<discriminator field="sTypeID" value="WORKTASK"/>
		</table>
	</mapping>
</model>