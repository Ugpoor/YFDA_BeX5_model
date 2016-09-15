<?xml version="1.0" encoding="utf-8"?>

<model xmlns="http://www.justep.com/model">  
  <action name="savePortalProfilesAction"  procedure="savePortalProfilesProcedure">
  	  <public name="name" type="String"/>													  
	  <public name="value" type="String"/>
      <public name="personID" type="String"/>
  </action>  
  <action name="selectPortalProfilesAction"  procedure="selectPortalProfilesProcedure">  
  	  <public name="name" type="String"/>		
	  <public name="personID" type="String"/>
  </action>
  <action name="removePortalProfilesAction"  procedure="removePortalProfilesProcedure">
  	  <public name="name" type="String"/>		
	  <public name="personID" type="String"/>
  </action> 
</model>
