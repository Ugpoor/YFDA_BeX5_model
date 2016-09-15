<?xml version="1.0" encoding="UTF-8"?><model xmlns="http://www.justep.com/model">
	<action name="queryThemeDefineAction" procedure="bizQueryProcedure">
		<private name="concept" type="String" value="SA_ThemeDefine"/>
		<private name="select" type="String" value="SA_ThemeDefine.*"/>
		<private name="from" type="String" value="SA_ThemeDefine SA_ThemeDefine"/>
		<private name="aggregate" type="String"/>
		<private name="dataModel" type="String" value="/SA/theme/data"/>
		<private name="fnModel" type="String" value="/system/logic/fn"/>
		<protected name="condition" type="String"/>
		<permission name="range" type="List"/>
		<public name="distinct" type="Boolean" value="false"/>
		<public name="idColumn" type="String" value="SA_ThemeDefine"/>
		<public name="filter" type="String"/>
		<public name="limit" type="Integer"/>
		<public name="offset" type="Integer"/>
		<public name="columns" type="String"/>
		<public name="orderBy" type="String"/>
		<public name="aggregateColumns" type="String"/>
		<public name="variables" type="Map"/>
	</action>
	<action name="saveThemeDefineAction" procedure="bizSaveProcedure">
		<private name="concept" type="String" value="SA_ThemeDefine"/>
		
		<protected name="readOnly" type="String"/>
		<protected name="notNull" type="String"/>
		<public name="table" type="Table"/>
		<private name="dataModel" type="String" value="/SA/theme/data"/>	
	<permission name="insertRange" type="List"/><permission name="deleteRange" type="List"/><permission name="updateRange" type="List"/><private name="fnModel" type="String" value="/system/logic/fn"/></action>
	<action name="createThemeDefineAction" procedure="bizCreateProcedure">
		<private name="concept" type="String" value="SA_ThemeDefine"/>
		<public name="table" type="Table"/>
		<public name="defaultValues" type="Map"/>
		<private name="fnModel" type="String" value="/system/logic/fn"/>
	</action>
	<action name="queryThemeManagerAction" procedure="bizQueryProcedure">
		<private name="concept" type="String" value="SA_ThemeManager"/>
		<private name="select" type="String" value="s1.*,s2.sThemeName as sThemeName ,s3.sFName as sFName"/>
		<private name="from" type="String" value="SA_ThemeManager s1 Optional JOIN SA_ThemeDefine s2 ON s1.sThemeID = s2 Optional JOIN SA_OPOrg s3 ON s1.sOrgID = s3"/>
		<private name="aggregate" type="String"/>
		<private name="dataModel" type="String" value="/SA/theme/data"/>
		<private name="fnModel" type="String" value="/system/logic/fn"/>
		<protected name="condition" type="String"/>
		<permission name="range" type="List"/>
		<public name="distinct" type="Boolean" value="false"/>
		<public name="idColumn" type="String" value="s1"/>
		<public name="filter" type="String"/>
		<public name="limit" type="Integer"/>
		<public name="offset" type="Integer"/>
		<public name="columns" type="String"/>
		<public name="orderBy" type="String"/>
		<public name="aggregateColumns" type="String"/>
		<public name="variables" type="Map"/>		
	</action>
	<action name="saveThemeManagerAction" procedure="bizSaveProcedure">
		<private name="concept" type="String" value="SA_ThemeManager"/>
		<protected name="readOnly" type="String" value="sThemeName,sFName"/>
		<protected name="notNull" type="String"/>
		<public name="table" type="Table"/>
		<private name="dataModel" type="String" value="/SA/theme/data"/>	
	<permission name="insertRange" type="List"/><permission name="deleteRange" type="List"/><permission name="updateRange" type="List"/><private name="fnModel" type="String" value="/system/logic/fn"/></action>
	<action name="createThemeManagerAction" procedure="bizCreateProcedure">
		<private name="concept" type="String" value="SA_ThemeManager"/>
		<public name="table" type="Table"/>
		<public name="defaultValues" type="Map"/>
		<private name="fnModel" type="String" value="/system/logic/fn"/>
	</action>
	
	<action name="getThemeDefineAction" procedure="getThemeDifineProcedure">
		<public name="personID" type="String"/>
	</action>
	<action name="savePersonThemeAction" procedure="savePersonThemeProcedure">
		<public name="themeLayoutInfo" type="String"/>
		<public name="personID" type="String"/>
	</action>
	<action name="removeThemeDefineAction" procedure="removeThemeDifineProcedure">
		<public name="personID" type="String"/>
	</action>
</model>