<?xml version="1.0" encoding="utf-8"?>
<model xmlns="http://www.justep.com/model"
	xmlns:m="http://www.justep.com/model">
	<procedure name="blobUpdateProcedure"
		code-model="/system/logic/code"
		code="BlobProcedure.update">
		<parameter name="blobDataModel" type="String"/>
		<parameter name="blobConcept" type="String"/>
		<parameter name="blobRelation" type="String"/>
		<parameter name="blobLastModifiedRelation" type="String"/>
		<parameter name="blobConceptValue" type="String"/>
		<parameter name="limitSize" type="String"/>
		<parameter name="blobData" type="Object"/>
	</procedure>
	<procedure name="blobDeleteProcedure"
		code-model="/system/logic/code"
		code="BlobProcedure.delete">
		<parameter name="blobDataModel" type="String"/>
		<parameter name="blobConcept" type="String"/>
		<parameter name="blobRelation" type="String"/>
		<parameter name="blobLastModifiedRelation" type="String"/>
		<parameter name="blobConceptValue" type="String"/>
	</procedure>
	<procedure name="blobDownloadProcedure"
		code-model="/system/logic/code"
		code="BlobProcedure.query">
		<parameter name="blobDataModel" type="String"/>
		<parameter name="blobConcept" type="String"/>
		<parameter name="blobRelation" type="String"/>
		<parameter name="blobConceptValue" type="String"/>
	</procedure>
	<procedure name="getBlobLastModifiedProcedure"
		code-model="/system/logic/code"
		code="BlobProcedure.queryLastModified">
		<parameter name="blobDataModel" type="String"/>
		<parameter name="blobConcept" type="String"/>
		<parameter name="blobLastModifiedRelation" type="String"/>
		<parameter name="blobConceptValue" type="String"/>
	</procedure>
</model>	