<?xml version="1.0" encoding="UTF-8"?><model xmlns="http://www.justep.com/model">  
  <store name="SA_PortalProfiles"/>  
  <store name="SA_ThemeDefine"/>  
  <store name="SA_ThemeManager"/>  
  <store name="SA_OPOrg"/>  
  <mapping concept="SA_ThemeDefine"> 
    <table name="SA_ThemeDefine" type="owner-table"> 
      <key field="sID" type="String"/>  
      <item field="version" relation="version" type="Integer"/>  
      <item field="sThemeName" relation="sThemeName" type="String"/>  
      <item field="sThemeLayoutInfo" relation="sThemeLayoutInfo" type="String"/>  
      <item field="sThemePublishType" relation="sThemePublishType" type="String"/>  
      <item field="sThemeActivity" relation="sThemeActivity" type="String"/>  
      <item field="sCreatorID" relation="sCreatorID" type="String"/> 
    </table> 
  </mapping>  
  <mapping concept="SA_ThemeManager"> 
    <table name="SA_ThemeManager" type="owner-table"> 
      <key field="sID" type="String"/>  
      <item field="version" relation="version" type="Integer"/>  
      <item field="sThemeID" relation="sThemeID" type="String"/>  
      <item field="sOrgID" relation="sOrgID" type="String"/>  
      <item field="sThemeActivity" relation="sThemeActivity" type="String"/> 
    </table> 
  </mapping>  
  <mapping concept="SA_OPOrg"> 
    <table name="SA_OPOrg" type="owner-table"> 
      <key field="sID" type="String"/>  
      <item field="sParent" relation="sParent" type="String"/>  
      <item field="sFName" relation="sFName" type="String"/>  
      <item field="sFID" relation="sFID" type="String"/> 
    </table> 
  </mapping>  
  <mapping concept="SA_PortalProfiles"> 
    <table name="SA_PortalProfiles" type="owner-table"> 
      <key field="sID" type="String"/>  
      <item field="version" relation="version"/>  
      <item field="sName" relation="sName"/>  
      <item field="sPersonID" relation="sPersonID" type="String"/>  
      <item field="sValue" relation="sValue"/> 
    </table> 
  </mapping> 
</model>