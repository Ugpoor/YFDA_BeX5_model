<?xml version="1.0" encoding="utf-8"?>
<model xmlns="http://www.justep.com/model"
	xmlns:m="http://www.justep.com/model">
	<procedure name="bizQueryProcedure"
		code-model="/system/logic/code"
		code="BizProcedure.query">
		<parameter name="concept" type="String"/>
		<parameter name="idColumn" type="String"/>
		<parameter name="select" type="String"/>
		<parameter name="from" type="String"/>
		<parameter name="condition" type="String"/>
		<parameter name="range" type="List"/>
		<parameter name="filter" type="String"/>
		<parameter name="distinct" type="Boolean"/>
		<parameter name="offset" type="Integer"/>
		<parameter name="limit" type="Integer"/>
		<parameter name="columns" type="String"/>
		<parameter name="orderBy" type="String"/>
		<parameter name="aggregate" type="String"/>
		<parameter name="aggregateColumns" type="String"/>
		<parameter name="variables" type="Map"/>
		<parameter name="dataModel" type="String"/>
		<parameter name="fnModel" type="String"/>
	</procedure>

	<procedure name="bizSaveProcedure"
		code-model="/system/logic/code"
		code="BizProcedure.save">
		<parameter name="table" type="Table"/>
		<parameter name="concept" type="String"/>
		<parameter name="insertRange" type="List"/>
		<parameter name="deleteRange" type="List"/>
		<parameter name="updateRange" type="List"/>
		<parameter name="readOnly" type="String"/>
		<parameter name="notNull" type="String"/>
		<parameter name="dataModel" type="String"/>
		<parameter name="fnModel" type="String"/>
	</procedure>
	
	<procedure name="bizCreateProcedure"
		code-model="/system/logic/code"
		code="BizProcedure.create">
		<parameter name="table" type="Table"/>
		<parameter name="concept" type="String"/>
		<parameter name="defaultValues" type="Map"/>
		<parameter name="fnModel" type="String"/>
	</procedure>
</model>