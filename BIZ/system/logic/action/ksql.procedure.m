<model xmlns="http://www.justep.com/model"
	xmlns:m="http://www.justep.com/model">
	<procedure name="ksqlQueryProcedure"
		code-model="/system/logic/code"
		code="KSQLProcedure.query">
		<parameter name="ksql" type="String"/>
		<parameter name="variables" type="Map"/>
		<parameter name="dataModel" type="String"/>
		<parameter name="fnModel" type="String"/>
	</procedure>
</model>