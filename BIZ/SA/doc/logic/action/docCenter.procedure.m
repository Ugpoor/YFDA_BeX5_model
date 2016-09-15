<?xml version="1.0" encoding="utf-8"?>

<model xmlns="http://www.justep.com/model" xmlns:m="http://www.justep.com/model">  
  <procedure name="queryCommentFileContentProcedure" code-model="/SA/doc/logic/code" code="com.justep.doc.DocAdapter.queryCommentFileContent"> 
    <parameter name="isHttps" type="Boolean"/>  
    <parameter name="docPath" type="String"/>  
    <parameter name="fileID" type="String"/>  
    <parameter name="docVersionID" type="String"/> 
  </procedure>  
  <procedure name="deleteNameSpaceProcedure" code-model="/SA/doc/logic/code" code="com.justep.doc.DocAdapter.deleteDocNameSpace"> 
    <parameter name="isHttps" type="Boolean"/>  
    <parameter name="sID" type="String"/> 
  </procedure>  
  <procedure name="queryHostProcedure" code-model="/SA/doc/logic/code" code="com.justep.doc.DocAdapter.queryHost"> 
    <parameter name="isHttps" type="Boolean"/>  
    <parameter name="docPath" type="String"/>  
    <parameter name="urlPattern" type="String"/>  
    <parameter name="isFormAction" type="Boolean"/> 
  </procedure>  
  <procedure name="queryNoPermissionHostProcedure" code-model="/SA/doc/logic/code" code="com.justep.doc.DocAdapter.queryNoPermissionHost"> 
    <parameter name="isHttps" type="Boolean"/>  
    <parameter name="docPath" type="String"/>  
    <parameter name="urlPattern" type="String"/>  
    <parameter name="isFormAction" type="Boolean"/> 
  </procedure>  
  <procedure name="createVersionProcedure" code-model="/SA/doc/logic/code" code="com.justep.doc.DocAdapter.createVersion"> 
    <parameter name="sDocID" type="String"/>  
    <parameter name="isSaveDocLink" type="Boolean"/>  
    <parameter name="isHttps" type="Boolean"/>  
    <parameter name="sDocName" type="String"/> 
  </procedure>  
  <procedure name="deleteVersionProcedure" code-model="/SA/doc/logic/code" code="com.justep.doc.DocAdapter.deleteVersion"> 
    <parameter name="sDocPath" type="String"/>  
    <parameter name="sFileID" type="String"/>  
    <parameter name="sLogID" type="String"/>  
    <parameter name="sDocVersion" type="String"/>  
    <parameter name="isHttps" type="Boolean"/> 
  </procedure>  
  <procedure name="createVersionBatchProcedure" code-model="/SA/doc/logic/code" code="com.justep.doc.DocAdapter.createVersionBatch"> 
    <parameter name="billIDs" type="List"/>  
    <parameter name="isHttps" type="Boolean"/>  
    <parameter name="process" type="String"/>  
    <parameter name="activity" type="String"/> 
  </procedure>  
  <procedure name="changeDocStateProcedure" code-model="/SA/doc/logic/code" code="com.justep.doc.DocAdapter.updateDocState"> 
    <parameter name="isLockDoc" type="Boolean"/>  
    <parameter name="sDocID" type="String"/> 
  </procedure>  
  <procedure name="queryExistDefineProcedure" code-model="/SA/doc/logic/code" code="com.justep.doc.attachment.AttachmentDefine.queryExistDefine"> 
    <parameter name="param" type="Xml"/> 
  </procedure>  
  <procedure name="saveAttachProcedure" code-model="/SA/doc/logic/code" code="com.justep.doc.DocAdapter.saveAttachAdapter"> 
    <parameter name="changeLog" type="String"/>  
    <parameter name="isSaveDocLink" type="Boolean"/> 
  </procedure>  
  <procedure name="commitDocFlagProcedure" code-model="/SA/doc/logic/code" code="com.justep.doc.DocAdapter.commitDocFlag"> 
    <parameter name="changeLog" type="String"/> 
  </procedure>  
  <procedure name="syncCustomFiledsProcedure" code-model="/SA/doc/logic/code" code="com.justep.doc.DocAdapter.syncCustomFileds"> 
    <parameter name="sDocID" type="String"/>  
    <parameter name="isHttps" type="Boolean"/> 
  </procedure>  
  <procedure name="commitDocProcedure" code-model="/SA/doc/logic/code" code="com.justep.doc.DocAdapter.commitDocAdapter"> 
    <parameter name="changeLog" type="String"/> 
  </procedure>  
  <procedure name="commitDocCacheProcedure" code-model="/SA/doc/logic/code" code="com.justep.doc.DocAdapter.commitDocCacheAdapter"> 
    <parameter name="changeLog" type="String"/> 
  </procedure>  
  <procedure name="commitAttachProcedure" code-model="/SA/doc/logic/code" code="com.justep.doc.DocAdapter.commitAttachAdapter"> 
    <parameter name="changeLog" type="String"/> 
  </procedure>  
  <procedure name="deleteDocProcedure" code-model="/SA/doc/logic/code" code="com.justep.doc.DocAdapter.deleteDocAdapter"> 
    <parameter name="changeLog" type="String"/> 
  </procedure>  
  <procedure name="queryLinkDefineMapProcedure" code-model="/SA/doc/logic/code" code="com.justep.doc.attachment.AttachmentDefine.queryLinkDefineMap"> 
    <parameter name="linkProcess" type="String"/>  
    <parameter name="linkActivity" type="String"/> 
  </procedure>  
  <procedure name="deleteLinkDefineProcedure" code-model="/SA/doc/logic/code" code="com.justep.doc.attachment.AttachmentDefine.deleteLinkDefine"> 
    <parameter name="linkProcess" type="String"/>  
    <parameter name="linkActivity" type="String"/> 
  </procedure>  
  <procedure name="delDefineItemsProcedure" code-model="/SA/doc/logic/code" code="com.justep.doc.attachment.AttachmentDefine.delDefineItemsProcedure"> 
    <parameter name="linkProcess" type="String"/>  
    <parameter name="linkActivity" type="String"/>  
    <parameter name="settingDoc" type="Xml"/> 
  </procedure>  
  <procedure name="editKeyNodeProcedure" code-model="/SA/doc/logic/code" code="com.justep.doc.attachment.AttachmentDefine.editKeyNodeProcedure"> 
    <parameter name="linkProcess" type="String"/>  
    <parameter name="linkActivity" type="String"/>  
    <parameter name="settingDoc" type="Xml"/> 
  </procedure>  
  <procedure name="addKeyProcedure" code-model="/SA/doc/logic/code" code="com.justep.doc.attachment.AttachmentDefine.addKeyProcedure"> 
    <parameter name="linkProcess" type="String"/>  
    <parameter name="linkActivity" type="String"/>  
    <parameter name="settingDoc" type="Xml"/> 
  </procedure>  
  <procedure name="setDefineItemsProcedure" code-model="/SA/doc/logic/code" code="com.justep.doc.attachment.AttachmentDefine.setDefineItemsProcedure"> 
    <parameter name="linkProcess" type="String"/>  
    <parameter name="linkActivity" type="String"/>  
    <parameter name="settingDoc" type="Xml"/> 
  </procedure>  
  
  <procedure name="querySettingAction2Procedure" code-model="/SA/doc/logic/code" code="com.justep.doc.attachment.AttachmentDefine.querySettingProcedure2">
    <parameter name="linkProcess" type="String"/>
    <parameter name="linkActivity" type="String"/>
    <parameter name="keyId" type="String"/>
  </procedure>
  <procedure name="querySettingProcedure" code-model="/SA/doc/logic/code" code="com.justep.doc.attachment.AttachmentDefine.querySettingProcedure"> 
    <parameter name="linkProcess" type="String"/>  
    <parameter name="linkActivity" type="String"/>  
    <parameter name="keyId" type="String"/> 
  </procedure>  
  <procedure name="deleteKeyByIdProcedure" code-model="/SA/doc/logic/code" code="com.justep.doc.attachment.AttachmentDefine.deleteKeyByIdProcedure"> 
    <parameter name="linkProcess" type="String"/>  
    <parameter name="linkActivity" type="String"/>  
    <parameter name="keyId" type="String"/> 
  </procedure>  
  <procedure name="queryKeyListProcedure" code-model="/SA/doc/logic/code" code="com.justep.doc.attachment.AttachmentDefine.queryKeyListProcedure"> 
    <parameter name="linkProcess" type="String"/>  
    <parameter name="linkActivity" type="String"/> 
  </procedure>  
  <procedure name="queryPermissionProcedure" code-model="/SA/doc/logic/code" code="com.justep.doc.DocAdapter.queryPermission"> 
    <parameter name="deptPath" type="String"/>  
    <parameter name="personId" type="String"/> 
  </procedure>  
  <procedure name="queryDocProcedure" code-model="/SA/doc/logic/code" code="com.justep.doc.DocAdapter.queryDoc"> 
    <parameter name="docID" type="String"/>  
    <parameter name="docPath" type="String"/>  
    <parameter name="pattern" type="String"/>  
    <parameter name="orderBy" type="String"/>  
    <parameter name="custom" type="String"/> 
  </procedure>  
  <procedure name="addAccessRecordProcedure" code-model="/SA/doc/logic/code" code="com.justep.doc.DocAdapter.addAccessRecord"> 
    <parameter name="param" type="String"/> 
  </procedure>  
  <procedure name="dispatchOptProcedure" code-model="/SA/doc/logic/code" code="com.justep.doc.DocAdapter.docDispatchOptT"> 
    <parameter name="param" type="Xml"/> 
  </procedure>  
  <procedure name="queryLinkDirProcedure" code-model="/SA/doc/logic/code" code="com.justep.doc.DocAdapter.queryLinkDirAdapter"> 
    <parameter name="rootPath" type="String"/>  
    <parameter name="subPath" type="String"/>  
    <parameter name="billID" type="String"/>  
    <parameter name="process" type="String"/>  
    <parameter name="activity" type="String"/>  
    <parameter name="isTree" type="Boolean"/> 
  </procedure>  
  <procedure name="queryDocSearchProcedure" code-model="/SA/doc/logic/code" code="com.justep.doc.DocAdapter.queryDocSearch"> 
    <parameter name="param" type="Xml"/> 
  </procedure>  
  <procedure name="queryDocInfoByIdProcedure" code-model="/SA/doc/logic/code" code="com.justep.doc.DocAdapter.queryDocInfoById"> 
    <parameter name="isHttps" type="Boolean"/>  
    <parameter name="host" type="String"/>  
    <parameter name="fileId" type="String"/>  
    <parameter name="docVersion" type="String"/> 
  </procedure>  
  <procedure name="queryDocCacheProcedure" code-model="/SA/doc/logic/code" code="com.justep.doc.DocAdapter.queryDocCacheById"> 
    <parameter name="docID" type="String"/> 
  </procedure>  
  <procedure name="checkSessionProcedure" code-model="/SA/doc/logic/code" code="com.justep.doc.DocAdapter.checkSession"> 
    <parameter name="key" type="String"/>  
    <parameter name="path" type="String"/> 
  </procedure>  
  <procedure name="docNodeSaveProcedure" code-model="/SA/doc/logic/code" code="com.justep.doc.DocAdapter.saveDocNode"> 
    <parameter name="table" type="Table"/>  
    <parameter name="concept" type="String"/>  
    <parameter name="dataModel" type="String"/>  
    <parameter name="fnModel" type="String"/>  
    <parameter name="insertRange" type="List"/>  
    <parameter name="deleteRange" type="List"/>  
    <parameter name="updateRange" type="List"/>  
    <parameter name="readOnly" type="String"/>  
    <parameter name="notNull" type="String"/> 
  </procedure>  
  <procedure name="queryDocLinkDefineProcedure" code-model="/SA/doc/logic/code" code="com.justep.doc.attachment.AttachmentDefine.queryLinkDefine"> 
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
    <parameter name="linkProcess" type="String"/>  
    <parameter name="linkActivity" type="String"/> 
  </procedure>  
  <procedure name="queryDocNodeProcedure" code-model="/SA/doc/logic/code" code="com.justep.doc.DocAdapter.queryDocNode"> 
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
    <parameter name="linkProcess" type="String"/>  
    <parameter name="linkActivity" type="String"/> 
  </procedure>  
  <procedure name="queryAuthProcedure" code-model="/SA/doc/logic/code" code="com.justep.doc.DocAdapter.queryDocAuth"> 
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
  <procedure name="saveAuthProcedure" code-model="/SA/doc/logic/code" code="com.justep.doc.DocAdapter.saveDocAuth"> 
    <parameter name="table" type="Table"/>  
    <parameter name="concept" type="String"/>  
    <parameter name="dataModel" type="String"/>  
    <parameter name="fnModel" type="String"/>  
    <parameter name="insertRange" type="List"/>  
    <parameter name="deleteRange" type="List"/>  
    <parameter name="updateRange" type="List"/>  
    <parameter name="readOnly" type="String"/>  
    <parameter name="notNull" type="String"/> 
  </procedure>  
  <!--
  		富文本先关逻辑 
   -->  
  <procedure name="uploadFileProcedure" code-model="/SA/doc/logic/code" code="Doc.uploadFile"> 
    <parameter name="title" type="String"/>  
    <parameter name="rootPath" type="String"/>  
    <parameter name="subPath" type="String"/>  
    <parameter name="file" type="Object"/>  
    <parameter name="filename" type="String"/> 
  </procedure>  
  <procedure name="queryDocFileIDsProcedure" code-model="/SA/doc/logic/code" code="Doc.queryDocFileIDs"> 
    <parameter name="subPath" type="String"/>  
    <parameter name="rootPath" type="String"/>  
    <parameter name="limit" type="Integer"/>  
    <parameter name="offset" type="Integer"/>  
    <parameter name="filter" type="String"/> 
  </procedure>
</model>
