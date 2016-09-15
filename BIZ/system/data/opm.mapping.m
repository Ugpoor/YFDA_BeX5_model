<?xml version="1.0" encoding="utf-8"?>

<model xmlns="http://www.justep.com/model">  
  <store name="SA_OPOrgVer"/>  
  <store name="SA_TerminalType"/>  
  <store name="SA_Terminal"/>  
  <store name="SA_OPCustomGroup"/>  
  <store name="SA_OrgLevel"/>  
  <store name="SA_ResourceControl"/>  
  <store name="SA_OPOrg"/>  
  <store name="SA_OPPerson"/>  
  <store name="SA_OPAgent"/>  
  <store name="SA_OPParentRole"/>  
  <store name="SA_OPAuthorize"/>  
  <store name="SA_OPPermission"/>  
  <store name="SA_OPRole"/>  
  <mapping concept="SA_OPOrg"> 
    <table name="SA_OPOrg" type="owner-table"> 
      <key field="sID" type="String"/>  
      <item field="sParent" relation="sParent" type="String"/>  
      <item field="sFName" relation="sFName" type="String"/>  
      <item field="sFID" relation="sFID" type="String"/> 
    </table> 
  </mapping>  
  <mapping concept="SA_OPRole"> 
    <table name="SA_OPRole" type="owner-table"> 
      <key field="sID" type="String"/>  
      <item field="sParentRolesNames" relation="sParentRolesNames" type="String"/> 
    </table>  
    <table name="SA_OPParentRole" type="relation-table"> 
      <key field="sRoleID" type="String"/>  
      <item field="sParentRoleID" relation="sParentRole" type="String"/> 
    </table> 
  </mapping>  
  <mapping concept="SA_OPPerson"> 
    <table name="SA_OPPerson" type="owner-table"> 
      <key field="sID" type="String"/> 
    </table> 
  </mapping>  
  <mapping concept="SA_OPAuthorize"> 
    <table name="SA_OPAuthorize" type="owner-table"> 
      <key field="sID" type="String"/>  
      <item field="sAuthorizeRoleID" relation="sAuthorizeRoleID" type="String"/> 
    </table> 
  </mapping>  
  <mapping concept="SA_OPPermission"> 
    <table name="SA_OPPermission" type="owner-table"> 
      <key field="sID" type="String"/>  
      <item field="sPermissionRoleID" relation="sPermissionRoleID" type="String"/> 
    </table> 
  </mapping>  
  <mapping concept="SA_OPAgent"> 
    <table name="SA_OPAgent" type="owner-table"> 
      <key field="sID" type="String"/> 
    </table> 
  </mapping>  
  <!-- <mapping concept="SA_OPPersonMember">
		<table type="owner-table" name="SA_OPPERSONMEMBER">
			<key field="SID" type="String" />
		</table>
	</mapping>-->  
  <mapping concept="SA_OPParentRole"> 
    <table name="SA_OPParentRole" type="owner-table"> 
      <key field="sID" type="String"/>  
      <item field="sParentRoleID" relation="sParentRoleID" type="String"/> 
    </table> 
  </mapping>  
  <mapping concept="SA_ResourceControl"> 
    <table name="SA_ResourceControl" type="owner-table"> 
      <key field="sID" type="String"/>  
      <item field="sResourceID" relation="sResourceID" type="String"/> 
    </table> 
  </mapping>  
  <mapping concept="SA_OrgLevel"> 
    <table name="SA_Code" type="owner-table"> 
      <key field="sID" type="String"/>  
      <discriminator field="sType" value="orgLevel"/> 
    </table> 
  </mapping>  
  <mapping concept="SA_OPCustomGroup"> 
    <table name="SA_OPCustomGroup" type="owner-table"> 
      <key field="sID" type="String"/> 
    </table> 
  </mapping>  
  <mapping concept="SA_Terminal">
    <table name="SA_Terminal" type="owner-table">
      <key field="sID" type="String"/> 
    </table> 
  </mapping>  
  <mapping concept="SA_TerminalType">
    <table name="SA_Code" type="owner-table">
      <key field="sID" type="String"/>  
      <discriminator field="sType" value="terminal"/> 
    </table> 
  </mapping>
  	<mapping concept="SA_OPOrgVer">
		<table name="SA_Code" type="owner-table">
			<key field="sID" type="String"/>
			<discriminator field="sType" value="orgVersion"/>
		</table>
	</mapping>
    
</model>
