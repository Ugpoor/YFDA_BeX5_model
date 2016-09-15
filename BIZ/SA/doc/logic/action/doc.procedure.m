<?xml version="1.0" encoding="utf-8"?>

<model xmlns="http://www.justep.com/model" xmlns:m="http://www.justep.com/model">  
  <procedure name="queryDocInfoProcedure" code-model="/SA/doc/logic/code" code="com.justep.doc.DocHelper.queryDocInfo">
    <parameter name="docID" type="Object"/>
  </procedure>
  <procedure name="getDocUrl" code-model="/SA/doc/logic/code" code="com.justep.doc.DocHelper.getDocUrl">
    <parameter name="docID" type="String"/>
    <parameter name="docPath" type="String"/>
    <parameter name="urlType" type="String"/>
    <parameter name="versionID" type="String"/>
    <parameter name="partType" type="String"/>
    <parameter name="resultID" type="String"/>
  </procedure>
  <procedure name="saveDoc" code-model="/SA/doc/logic/code" code="com.justep.doc.DocHelper.saveDoc">
    <parameter name="docID" type="String"/>
    <parameter name="docName" type="String"/>
    <parameter name="docPath" type="String"/>
    <parameter name="fileID" type="String"/>
    <parameter name="kind" type="String"/>
    <parameter name="size" type="String"/>
  </procedure>
  <procedure name="deleteDoc" code-model="/SA/doc/logic/code" code="com.justep.doc.DocHelper.deleteDoc">
    <parameter name="docID" type="String"/>
    <parameter name="versionID" type="String"/>
    <parameter name="isLogicDelete" type="Boolean"/>
  </procedure>
  <procedure name="reverseDoc" code-model="/SA/doc/logic/code" code="com.justep.doc.DocHelper.reverseDoc">
    <parameter name="docID" type="String"/>
  </procedure>
  
  <procedure name="changeDocName" code-model="/SA/doc/logic/code" code="com.justep.doc.DocHelper.changeDocName">
    <parameter name="docID" type="String"/>
    <parameter name="docName" type="String"/>
  </procedure>
  
</model>