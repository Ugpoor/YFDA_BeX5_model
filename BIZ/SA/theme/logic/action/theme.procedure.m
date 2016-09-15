<model xmlns="http://www.justep.com/model"
	xmlns:m="http://www.justep.com/model">
	<procedure name="getThemeDifineProcedure" code-model="/SA/theme/logic/code" code="com.justep.theme.ThemeControl.selectThemeByOrgID">								                                          										  
		<parameter name="personID" type="String"/>
	</procedure>
	<procedure name="savePersonThemeProcedure" code-model="/SA/theme/logic/code" code="com.justep.theme.ThemeControl.savePersonTheme">
		<parameter name="themeLayoutInfo" type="String"/>
		<parameter name="personID" type="String"/>
	</procedure>
	<procedure name="removeThemeDifineProcedure" code-model="/SA/theme/logic/code" code="com.justep.theme.ThemeControl.removeThemeByPersonID">								                                          										  
		<parameter name="personID" type="String"/>
	</procedure>
</model>