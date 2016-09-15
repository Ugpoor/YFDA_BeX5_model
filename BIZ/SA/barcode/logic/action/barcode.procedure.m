<?xml version="1.0" encoding="utf-8"?>
<model xmlns="http://www.justep.com/model"
	xmlns:m="http://www.justep.com/model">
	<procedure name="barcodeGenProcedure"
		code-model="/SA/barcode/logic/code"
		code="com.justep.system.barcode.BarcodeUtils.execute">
		<parameter name="type" type="String"/>
		<parameter name="code" type="String"/>
		<parameter name="config" type="String"/>
	</procedure>
</model>	