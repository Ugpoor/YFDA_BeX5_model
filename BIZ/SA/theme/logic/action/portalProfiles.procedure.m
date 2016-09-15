<?xml version="1.0" encoding="UTF-8"?>
<model xmlns="http://www.justep.com/model">
	<procedure name="savePortalProfilesProcedure" code-model="/SA/theme/logic/code" code="com.justep.portal.PortalProfilesControl.savePortalProfiles">								                                          	
		<parameter name="name" type="String"/>													  
		<parameter name="value" type="String"/>
		<parameter name="personID" type="String"/>
	</procedure>
	<procedure name="selectPortalProfilesProcedure" code-model="/SA/theme/logic/code" code="com.justep.portal.PortalProfilesControl.selectPortalProfiles">								                                          	
		<parameter name="name" type="String"/>		
		<parameter name="personID" type="String"/>
	</procedure>
	<procedure name="removePortalProfilesProcedure" code-model="/SA/theme/logic/code" code="com.justep.portal.PortalProfilesControl.removePortalProfiles">								                                          	
		<parameter name="name" type="String"/>		
		<parameter name="personID" type="String"/>
	</procedure>
</model>