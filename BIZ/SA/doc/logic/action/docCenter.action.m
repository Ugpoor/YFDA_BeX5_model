<?xml version="1.0" encoding="UTF-8"?><model xmlns="http://www.justep.com/model">  
  <!--自定java调用 	-->
  <!--<action global="true" name="testAction" procedure="testProcedure"> 
    <label language="zh_CN">docHandler</label>   
  </action>-->
  <action global="true" name="queryCommentFileContent" procedure="queryCommentFileContentProcedure"> 
    <label language="zh_CN">docHandler</label>
    <public name="isHttps" type="Boolean"/>
    <public name="docPath" type="String"/>  
    <public name="fileID" type="String"/>
    <public name="docVersionID" type="String"/>
  </action>
    
  <action global="true" name="deleteNameSpace" procedure="deleteNameSpaceProcedure"> 
    <label language="zh_CN">docHandler</label>
    <public name="isHttps" type="Boolean"/>  
    <public name="sID" type="String"/>
  </action>
  
  <action global="true" name="queryNoPermissionHostAction" procedure="queryNoPermissionHostProcedure"> 
    <label language="zh_CN">docHandler</label>
    <public name="isHttps" type="Boolean"/>  
    <public name="docPath" type="String"/>
    <public name="urlPattern" type="String"/>
    <public name="isFormAction" type="Boolean"/> 
  </action>
  
  <action global="true" name="queryHostAction" procedure="queryHostProcedure"> 
    <label language="zh_CN">docHandler</label>
    <public name="isHttps" type="Boolean"/>  
    <public name="docPath" type="String"/>
    <public name="urlPattern" type="String"/>
    <public name="isFormAction" type="Boolean"/> 
  </action>
    
  <action global="true" name="queryExistDefineAction" procedure="queryExistDefineProcedure"> 
    <label language="zh_CN">docHandler</label>  
    <public name="param" type="Xml"/> 
  </action>  
  <action global="true" name="saveAttachAction" procedure="saveAttachProcedure"> 
    <public name="changeLog" type="String"/> 
    <public name="isSaveDocLink" type="Boolean"/>
  </action>  
  <action global="true" name="commitDocFlagAction" procedure="commitDocFlagProcedure"> 
    <public name="changeLog" type="String"/> 
  </action>
  <action global="true" name="syncCustomFiledsAction" procedure="syncCustomFiledsProcedure"> 
    <public name="sDocID" type="String"/>
    <public name="isHttps" type="Boolean"/> 
  </action>
  
  <action global="true" name="commitDocAction" procedure="commitDocProcedure"> 
    <public name="changeLog" type="String"/> 
  </action>
  <action name="commitDocCacheAction" global="true" procedure="commitDocCacheProcedure">
	<public name="changeLog" type="String"/>
  </action>		
	  
  <action global="true" name="commitAttachAction" procedure="commitAttachProcedure"> 
    <public name="changeLog" type="String"/> 
  </action>
   
   <action global="true" name="deleteDocAction" procedure="deleteDocProcedure"> 
    <public name="changeLog" type="String"/> 
  </action> 
  
  <action global="true" name="queryLinkDefineMap" procedure="queryLinkDefineMapProcedure"> 
    <label language="zh_CN">docHandler</label>  
    <public name="linkProcess" type="String"/>  
    <public name="linkActivity" type="String"/> 
  </action>  
  <action global="true" name="deleteLinkDefineAction" procedure="deleteLinkDefineProcedure"> 
    <label language="zh_CN">docHandler</label>  
    <public name="linkProcess" type="String"/>  
    <public name="linkActivity" type="String"/> 
  </action>  
  <action global="true" name="delDefineItemsAction" procedure="delDefineItemsProcedure"> 
    <label language="zh_CN">docHandler</label>  
    <public name="linkProcess" type="String"/>  
    <public name="linkActivity" type="String"/>  
    <public name="settingDoc" type="Xml"/> 
  </action>  
  <action global="true" name="editKeyNodeAction" procedure="editKeyNodeProcedure"> 
    <label language="zh_CN">docHandler</label>  
    <public name="linkProcess" type="String"/>  
    <public name="linkActivity" type="String"/>  
    <public name="settingDoc" type="Xml"/> 
  </action>  
  <action global="true" name="addKeyAction" procedure="addKeyProcedure"> 
    <label language="zh_CN">docHandler</label>  
    <public name="linkProcess" type="String"/>  
    <public name="linkActivity" type="String"/>  
    <public name="settingDoc" type="Xml"/> 
  </action>  
  <action global="true" name="setDefineItemsAction" procedure="setDefineItemsProcedure"> 
    <label language="zh_CN">docHandler</label>  
    <public name="linkProcess" type="String"/>  
    <public name="linkActivity" type="String"/>  
    <public name="settingDoc" type="Xml"/> 
  </action>  
  <action global="true" name="querySettingAction" procedure="querySettingProcedure"> 
    <label language="zh_CN">docHandler</label>  
    <public name="linkProcess" type="String"/>  
    <public name="linkActivity" type="String"/>  
    <public name="keyId" type="String"/> 
  </action>  
  <action global="true" name="deleteKeyByIdAction" procedure="deleteKeyByIdProcedure"> 
    <label language="zh_CN">docHandler</label>  
    <public name="linkProcess" type="String"/>  
    <public name="linkActivity" type="String"/>  
    <public name="keyId" type="String"/> 
  </action>  
  <action global="true" name="queryKeyListAction" procedure="queryKeyListProcedure"> 
    <label language="zh_CN">docHandler</label>  
    <public name="linkProcess" type="String"/>  
    <public name="linkActivity" type="String"/> 
  </action>  
  <action global="true" name="queryPermissionAction" procedure="queryPermissionProcedure"> 
    <label language="zh_CN">docHandler</label>  
    <public name="deptPath" type="String"/>  
    <public name="personId" type="String"/> 
  </action>  
  <action global="true" name="queryDocAction" procedure="queryDocProcedure"> 
    <label language="zh_CN">docHandler</label>  
    <public name="docID" type="String"/>  
    <public name="docPath" type="String"/>  
    <public name="pattern" type="String"/>  
    <public name="orderBy" type="String"/>  
    <public name="custom" type="String"/> 
  </action>  
  <action global="true" name="addAccessRecordAction" procedure="addAccessRecordProcedure"> 
    <label language="zh_CN">docHandler</label>  
    <public name="param" type="String"/> 
  </action>  
  <action global="true" name="dispatchOptAction" procedure="dispatchOptProcedure"> 
    <label language="zh_CN">AttachmentHandler</label>  
    <public name="param" type="Xml"/> 
  </action>
  
  <action global="true" name="changeDocStateAction" procedure="changeDocStateProcedure"> 
    <label language="zh_CN">LockHandler</label>  
    <public name="isLockDoc" type="Boolean"/>
    <public name="sDocID" type="String"/>
  </action>
  
  <action global="true" name="deleteVersionAction"
  		procedure="deleteVersionProcedure">
  		<label language="zh_CN">deleteVersion</label>
  		<public name="sDocPath" type="String" />
  		<public name="sFileID" type="String" />
  		<public name="sLogID" type="String" />
  		<public name="sDocVersion" type="String" />
  		<public name="isHttps" type="Boolean" />
  </action>


  <action global="true" name="createVersionAction" procedure="createVersionProcedure"> 
    <label language="zh_CN">CreateVersion</label>
    <public name="sDocID" type="String"/>
    <public name="isSaveDocLink" type="Boolean"/>
    <public name="isHttps" type="Boolean"/>
    <public type="String" name="sDocName" required="false"></public>
</action>
  
  
  
  <action global="true" name="createVersionBatchAction" procedure="createVersionBatchProcedure"> 
    <label language="zh_CN">CreateVersionBatch</label>
    <public name="billIDs" type="List"/>
    <public name="isHttps" type="Boolean"/>
    <public name="process" type="String"/>
    <public name="activity" type="String"/>
  </action>
    
  <action global="true" name="queryLinkDirAction" procedure="queryLinkDirProcedure"> 
    <label language="zh_CN">AttachmentHandler</label>  
    <public name="rootPath" type="String"/>
    <public name="subPath" type="String"/> 
    <public name="billID" type="String"/>
    <public name="process" type="String"/>  
    <public name="activity" type="String"/>  
    <public name="isTree" type="Boolean"/>  
  </action>  
  <action global="true" name="queryDocSearch" procedure="queryDocSearchProcedure"> 
    <label language="zh_CN">DocHandler</label>  
    <public name="param" type="Xml"/> 
  </action>  
  <action global="true" name="queryDocInfoByIdAction" procedure="queryDocInfoByIdProcedure"> 
    <label language="zh_CN">docHandler</label>
    <public name="isHttps" type="Boolean"/>     
    <public name="host" type="String"/>  
    <public name="fileId" type="String"/>  
    <public name="docVersion" type="String"/> 
  </action>  
  <action global="true" name="checkSessionAction" procedure="checkSessionProcedure"> 
    <label language="zh_CN">checkSession</label>
    <public name="key" type="String"/>  
    <public name="path" type="String"/>  
  </action>  
  <!--/自定java调用 	-->  
    
  
    
    
  <!--<action name="queryAuthAction" procedure="bizQueryProcedure"
		data-model="/system/data">
		<label language="zh_CN"></label>
		
		<private name="concept" type="CONS" value="(SA_DocAuth :AS p)" />
		<private name="select" type="CONS" value="p.*" />
		<private name="from" type="CONS" value="" />
		<protected name="condition" type="String" value="" />
		<permission name="range" />
		<public name="filter" type="String" value="" />
		<public name="distinct" type="String" value="FALSE" />
		<public name="offset" type="String" value="" />
		<public name="limit" type="String" value="" />
		<public name="columns" type="CONS" value="" />
		<public name="orderBy" type="String" value="" />
		<private name="aggregate" type="CONS" value="" />
		<public name="aggregateColumns" type="CONS" value="" />
		<private name="functionModel" type="String" value="/system/logic/fn" />
		<private name="dataModel" type="String" value="/system/data" />
	</action>-->  
  <action name="queryAuthAction" procedure="queryAuthProcedure"> 
    <public name="concept" type="String" value="SA_DocAuth"/>  
    <private name="select" type="String" value="SA_DocAuth.*"/>  
    <private name="from" type="String" value="SA_DocAuth SA_DocAuth"/>  
    <private name="aggregate" type="String"/>  
    <private name="dataModel" type="String" value="/system/data"/>  
    <private name="fnModel" type="String"/>  
    <protected name="condition" type="String"/>  
    <permission name="range" type="List"/>  
    <public name="distinct" type="Boolean" value="false"/>  
    <public name="idColumn" type="String" value="SA_DocAuth"/>  
    <public name="filter" type="String"/>  
    <public name="limit" type="Integer"/>  
    <public name="offset" type="Integer"/>  
    <public name="columns" type="String"/>  
    <public name="orderBy" type="String"/>  
    <public name="aggregateColumns" type="String"/>  
    <public name="variables" type="Map"/>  
    <!-- <private name="functionModel" type="String" value="/system/logic/fn"/> --> 
  </action>  
  <action name="createAuthAction" procedure="bizCreateProcedure"> 
    <public name="concept" type="String" value="SA_DocAuth"/>  
    <public name="table" type="Table"/>  
    <public name="defaultValues" type="Map"/>  
    <!-- <private name="dataModel" type="String" value="/system/data"/> -->  
    <private name="fnModel" type="String"/> 
  </action>  
  <action name="saveAuthAction" procedure="saveAuthProcedure"> 
    <public name="concept" type="String" value="SA_DocAuth"/>  
    <protected name="readOnly" type="String"/>  
    <protected name="notNull" type="String"/>  
    <public name="table" type="Table"/>  
    <private name="dataModel" type="String" value="/system/data"/>  
    <permission name="insertRange" type="List"/>
    <permission name="deleteRange" type="List"/>
    <permission name="updateRange" type="List"/>
    <private name="fnModel" type="String" value="/system/logic/fn"/>
  </action>  
  <!--<action name="queryDocLinkDefineAction" procedure="bizQueryProcedure"
		data-model="/system/data">
		<label language="zh_CN"></label>
		<private name="concept" type="CONS" value="(SA_DOCLINKDEFINE :AS p)" />
		<private name="select" type="CONS" value="p.*" />
		<private name="from" type="CONS" value="" />
		<protected name="condition" type="String" value="" />
		<permission name="range" />
		<public name="filter" type="String" value="" />
		<public name="distinct" type="String" value="FALSE" />
		<public name="offset" type="String" value="" />
		<public name="limit" type="String" value="" />
		<public name="columns" type="CONS" value="" />
		<public name="orderBy" type="String" value="" />
		<private name="aggregate" type="CONS" value="" />
		<public name="aggregateColumns" type="CONS" value="" />
	    <private name="functionModel" type="String" value="/system/logic/fn" />
		<private name="dataModel" type="String" value="/system/data" />
	</action>-->  
  <action name="queryDocLinkDefineAction" procedure="queryDocLinkDefineProcedure"> 
    <public name="concept" type="String" value="SA_DocLinkDefine"/>  
    <private name="select" type="String" value="SA_DocLinkDefine,SA_DocLinkDefine.sProcess,SA_DocLinkDefine.sActivity,SA_DocLinkDefine.sDisplayName,SA_DocLinkDefine.version"/>  
    <private name="from" type="String" value="SA_DocLinkDefine SA_DocLinkDefine"/>  
    <private name="aggregate" type="String"/>  
    <private name="dataModel" type="String" value="/system/data"/>  
    <private name="fnModel" type="String"/>  
    <protected name="condition" type="String"/>  
    <permission name="range" type="List"/>  
    <public name="distinct" type="Boolean" value="true"/>  
    <public name="idColumn" type="String" value="SA_DocLinkDefine"/>  
    <public name="filter" type="String"/>  
    <public name="limit" type="Integer"/>  
    <public name="offset" type="Integer"/>  
    <public name="columns" type="String"/>  
    <public name="orderBy" type="String"/>  
    <public name="aggregateColumns" type="String"/>  
    <public name="variables" type="Map"/>  
    <public name="linkProcess" type="String"/>  
    <public name="linkActivity" type="String"/>  
    <!-- <private name="functionModel" type="String" value="/system/logic/fn"/> --> 
  </action>  
  <action data-model="/system/data" name="createDocLinkDefineAction" procedure="bizCreateProcedure"> 
    <public name="concept" type="String" value="SA_DocLinkDefine"/>  
    <private name="fnModel" type="String"/>  
    <public name="table" type="Table"/>  
    <public name="defaultValues" type="Map"/>  
    <!-- <private name="dataModel" type="String" value="/system/data"/> --> 
  </action>  
  <action data-model="/system/data" name="saveDocLinkDefineAction" procedure="bizSaveProcedure"> 
    <public name="concept" type="String" value="SA_DocLinkDefine"/>  
    <protected name="readOnly" type="String"/>  
    <protected name="notNull" type="String"/>  
    <public name="table" type="Table"/>  
    <private name="dataModel" type="String" value="/system/data"/>  
    <permission name="insertRange" type="List"/>
    <permission name="deleteRange" type="List"/>
    <permission name="updateRange" type="List"/>
    <private name="fnModel" type="String" value="/system/logic/fn"/>
  </action>  
  <!--<action name="queryActivityAuthAction" procedure="bizQueryProcedure"
		data-model="/system/data">
		<label language="zh_CN"></label>
		<private name="concept" type="CONS" value="(SA_DocActivityAuth :AS p)" />
		<private name="select" type="CONS" value="p.*" />
		<private name="from" type="CONS" value="" />
		<protected name="condition" type="String" value="" />
		<permission name="range" />
		<public name="filter" type="String" value="" />
		<public name="distinct" type="String" value="FALSE" />
		<public name="offset" type="String" value="" />
		<public name="limit" type="String" value="" />
		<public name="columns" type="CONS" value="" />
		<public name="orderBy" type="String" value="" />
		<private name="aggregate" type="CONS" value="" />
		<public name="aggregateColumns" type="CONS" value="" />
	    <private name="functionModel" type="String" value="/system/logic/fn" />
		<private name="dataModel" type="String" value="/system/data" />
	</action>-->  
  <action name="queryActivityAuthAction" procedure="bizQueryProcedure"> 
    <private name="select" type="String" value="SA_DocActivityAuth.*"/>  
    <public name="concept" type="String" value="SA_DocActivityAuth"/>  
    <private name="from" type="String" value="SA_DocActivityAuth SA_DocActivityAuth"/>  
    <private name="aggregate" type="String"/>  
    <private name="dataModel" type="String" value="/system/data"/>  
    <private name="fnModel" type="String"/>  
    <protected name="condition" type="String"/>  
    <permission name="range" type="List"/>  
    <public name="distinct" type="Boolean" value="false"/>  
    <public name="idColumn" type="String" value="SA_DocActivityAuth"/>  
    <public name="filter" type="String"/>  
    <public name="limit" type="Integer"/>  
    <public name="offset" type="Integer"/>  
    <public name="columns" type="String"/>  
    <public name="orderBy" type="String"/>  
    <public name="aggregateColumns" type="String"/>  
    <public name="variables" type="Map"/>  
    <!-- <private name="functionModel" type="String" value="/system/logic/fn"/> --> 
  </action>  
  <action data-model="/system/data" name="createActivityAuthAction" procedure="bizCreateProcedure"> 
    <public name="concept" type="String" value="SA_DocActivityAuth"/>  
    <private name="fnModel" type="String"/>  
    <public name="table" type="Table"/>  
    <public name="defaultValues" type="Map"/>  
    <!-- <private name="dataModel" type="String" value="/system/data"/> --> 
  </action>  
  <action data-model="/system/data" name="saveActivityAuthAction" procedure="bizSaveProcedure"> 
    <public name="concept" type="String" value="SA_DocActivityAuth"/>  
    <protected name="readOnly" type="String"/>  
    <protected name="notNull" type="String"/>  
    <public name="table" type="Table"/>  
    <private name="dataModel" type="String" value="/system/data"/>  
    <permission name="insertRange" type="List"/>
    <permission name="deleteRange" type="List"/>
    <permission name="updateRange" type="List"/>
    <private name="fnModel" type="String" value="/system/logic/fn"/>
  </action>  
  <!--<action name="queryActivityTemplateAction" procedure="bizQueryProcedure"
		data-model="/system/data">
		<label language="zh_CN"></label>
		<private name="concept" type="CONS" value="(SA_DocActivityTemplate :AS p)" />
		<private name="select" type="CONS" value="p.*" />
		<private name="from" type="CONS" value="" />
		<protected name="condition" type="String" value="" />
		<permission name="range" />
		<public name="filter" type="String" value="" />
		<public name="distinct" type="String" value="FALSE" />
		<public name="offset" type="String" value="" />
		<public name="limit" type="String" value="" />
		<public name="columns" type="CONS" value="" />
		<public name="orderBy" type="String" value="" />
		<private name="aggregate" type="CONS" value="" />
		<public name="aggregateColumns" type="CONS" value="" />
	    <private name="functionModel" type="String" value="/system/logic/fn" />
		<private name="dataModel" type="String" value="/system/data" />
	</action>-->  
  <action name="queryActivityTemplateAction" procedure="bizQueryProcedure"> 
    <public name="concept" type="String" value="SA_DocActivityTemplate"/>  
    <private name="select" type="String" value="SA_DocActivityTemplate.*"/>  
    <private name="from" type="String" value="SA_DocActivityTemplate SA_DocActivityTemplate"/>  
    <private name="aggregate" type="String"/>  
    <private name="dataModel" type="String" value="/system/data"/>  
    <private name="fnModel" type="String"/>  
    <protected name="condition" type="String"/>  
    <permission name="range" type="List"/>  
    <public name="distinct" type="Boolean" value="false"/>  
    <public name="idColumn" type="String" value="SA_DocActivityTemplate"/>  
    <public name="filter" type="String"/>  
    <public name="limit" type="Integer"/>  
    <public name="offset" type="Integer"/>  
    <public name="columns" type="String"/>  
    <public name="orderBy" type="String"/>  
    <public name="aggregateColumns" type="String"/>  
    <public name="variables" type="Map"/>  
    <!-- <private name="functionModel" type="String" value="/system/logic/fn"/> --> 
  </action>  
  <!--(DEFACTION createActivityTemplateAction
    (PROCEDURE bizCreateProcedure)
    (DATA-MODULE "/system/data")   
    (PUBLIC conceptMap CONS)
    (PUBLIC relations CONS))-->  
  <action data-model="/system/data" name="createActivityTemplateAction" procedure="bizCreateProcedure"> 
    <public name="concept" type="String" value="SA_DocActivityTemplate"/>  
    <private name="fnModel" type="String"/>  
    <public name="table" type="Table"/>  
    <public name="defaultValues" type="Map"/>  
    <!-- <private name="dataModel" type="String" value="/system/data"/> --> 
  </action>  
  <!--(DEFACTION saveActivityTemplateAction
    (PROCEDURE bizSaveProcedure)
    (DATA-MODULE "/system/data")
    (PUBLIC concept CONS :DEFAULT ())
    (PUBLIC graph NGRAPH)
    (PUBLIC range CONS :DEFAULT ())    
    (PUBLIC readOnly CONS :DEFAULT ())
    (PUBLIC notNull CONS :DEFAULT ()))-->  
  <action name="saveActivityTemplateAction" procedure="bizSaveProcedure"> 
    <public name="concept" type="String" value="SA_DocActivityTemplate"/>  
    <protected name="readOnly" type="String"/>  
    <protected name="notNull" type="String"/>  
    <public name="table" type="Table"/>  
    <private name="dataModel" type="String" value="/system/data"/>  
    <permission name="insertRange" type="List"/>
    <permission name="deleteRange" type="List"/>
    <permission name="updateRange" type="List"/>
    <private name="fnModel" type="String" value="/system/logic/fn"/>
  </action>  
  <!--<action name="queryActivityTemplateFieldAction" procedure="bizQueryProcedure"
		data-model="/system/data">
		<label language="zh_CN"></label>
		<private name="concept" type="CONS"
			value="(SA_DocActivityTemplateField :AS p)" />
		<private name="select" type="CONS" value="p.*" />
		<private name="from" type="CONS" value="" />
		<protected name="condition" type="String" value="" />
		<permission name="range" />
		<public name="filter" type="String" value="" />
		<public name="distinct" type="String" value="FALSE" />
		<public name="offset" type="String" value="" />
		<public name="limit" type="String" value="" />
		<public name="columns" type="CONS" value="" />
		<public name="orderBy" type="String" value="" />
		<private name="aggregate" type="CONS" value="" />
		<public name="aggregateColumns" type="CONS" value="" />
	    <private name="functionModel" type="String" value="/system/logic/fn" />
		<private name="dataModel" type="String" value="/system/data" />
	</action>-->  
  <action name="queryActivityTemplateFieldAction" procedure="bizQueryProcedure"> 
    <public name="concept" type="String" value="SA_DocActivityTemplateField"/>  
    <private name="select" type="String" value="SA_DocActivityTemplateField.*"/>  
    <private name="from" type="String" value="SA_DocActivityTemplateField SA_DocActivityTemplateField"/>  
    <private name="aggregate" type="String"/>  
    <private name="dataModel" type="String" value="/system/data"/>  
    <private name="fnModel" type="String"/>  
    <protected name="condition" type="String"/>  
    <permission name="range" type="List"/>  
    <public name="distinct" type="Boolean" value="false"/>  
    <public name="idColumn" type="String" value="SA_DocActivityTemplateField"/>  
    <public name="filter" type="String"/>  
    <public name="limit" type="Integer"/>  
    <public name="offset" type="Integer"/>  
    <public name="columns" type="String"/>  
    <public name="orderBy" type="String"/>  
    <public name="aggregateColumns" type="String"/>  
    <public name="variables" type="Map"/>  
    <!-- <private name="functionModel" type="String" value="/system/logic/fn"/> --> 
  </action>  
  <action name="createActivityTemplateFieldAction" procedure="bizCreateProcedure"> 
    <public name="concept" type="String" value="SA_DocActivityTemplateField"/>  
    <private name="fnModel" type="String"/>  
    <public name="table" type="Table"/>  
    <public name="defaultValues" type="Map"/>  
    <!-- <private name="dataModel" type="String" value="/system/data"/> --> 
  </action>  
  <action name="saveActivityTemplateFieldAction" procedure="bizSaveProcedure"> 
    <public name="concept" type="String" value="SA_DocActivityTemplateField"/>  
    <protected name="readOnly" type="String"/>  
    <protected name="notNull" type="String"/>  
    <public name="table" type="Table"/>  
    <private name="dataModel" type="String" value="/system/data"/>  
    <permission name="insertRange" type="List"/>
    <permission name="deleteRange" type="List"/>
    <permission name="updateRange" type="List"/>
    <private name="fnModel" type="String" value="/system/logic/fn"/>
  </action>  
  <!--<action name="queryNameSpaceAction" procedure="bizQueryProcedure"
		data-model="/system/data">
		<label language="zh_CN"></label>
		<private name="concept" type="CONS" value="(SA_DocNameSpace :AS p)" />
		<private name="select" type="CONS" value="p.*" />
		<private name="from" type="CONS" value="" />
		<protected name="condition" type="String" value="" />
		<permission name="range" />
		<public name="filter" type="String" value="" />
		<public name="distinct" type="String" value="FALSE" />
		<public name="offset" type="String" value="" />
		<public name="limit" type="String" value="" />
		<public name="columns" type="CONS" value="" />
		<public name="orderBy" type="String" value="" />
		<private name="aggregate" type="CONS" value="" />
		<public name="aggregateColumns" type="CONS" value="" />
	    <private name="functionModel" type="String" value="/system/logic/fn" />
		<private name="dataModel" type="String" value="/system/data" />
	</action>-->  
  <action name="queryNameSpaceAction" procedure="bizQueryProcedure"> 
    <public name="concept" type="String" value="SA_DocNameSpace"/>  
    <private name="select" type="String" value="SA_DocNameSpace.*"/>  
    <private name="from" type="String" value="SA_DocNameSpace SA_DocNameSpace"/>  
    <private name="aggregate" type="String"/>  
    <private name="dataModel" type="String" value="/system/data"/>  
    <private name="fnModel" type="String"/>  
    <protected name="condition" type="String"/>  
    <permission name="range" type="List"/>  
    <public name="distinct" type="Boolean" value="false"/>  
    <public name="idColumn" type="String" value="SA_DocNameSpace"/>  
    <public name="filter" type="String"/>  
    <public name="limit" type="Integer"/>  
    <public name="offset" type="Integer"/>  
    <public name="columns" type="String"/>  
    <public name="orderBy" type="String"/>  
    <public name="aggregateColumns" type="String"/>  
    <public name="variables" type="Map"/>  
    <!-- <private name="functionModel" type="String" value="/system/logic/fn"/> --> 
  </action>  
  <!--(DEFACTION createNameSpaceAction
    (PROCEDURE bizCreateProcedure)
    (DATA-MODULE "/system/data")   
    (PUBLIC conceptMap CONS)
    (PUBLIC relations CONS))-->  
  <action name="createNameSpaceAction" procedure="bizCreateProcedure"> 
    <public name="concept" type="String" value="SA_DocNameSpace"/>  
    <private name="fnModel" type="String"/>  
    <public name="table" type="Table"/>  
    <public name="defaultValues" type="Map"/>  
    <!-- <private name="dataModel" type="String" value="/system/data"/> --> 
  </action>  
  <!--(DEFACTION saveNameSpaceAction
    (PROCEDURE bizSaveProcedure)
    (DATA-MODULE "/system/data")
    (PUBLIC concept CONS :DEFAULT ())
    (PUBLIC graph NGRAPH)
    (PUBLIC range CONS :DEFAULT ())    
    (PUBLIC readOnly CONS :DEFAULT ())
    (PUBLIC notNull CONS :DEFAULT ()))-->  
  <action data-model="/system/data" name="saveNameSpaceAction" procedure="bizSaveProcedure"> 
    <public name="concept" type="String" value="SA_DocNameSpace"/>  
    <protected name="readOnly" type="String"/>  
    <protected name="notNull" type="String"/>  
    <public name="table" type="Table"/>  
    <private name="dataModel" type="String" value="/system/data"/>  
    <permission name="insertRange" type="List"/>
    <permission name="deleteRange" type="List"/>
    <permission name="updateRange" type="List"/>
    <private name="fnModel" type="String" value="/system/logic/fn"/>
  </action> 


<action name="queryDocCacheAction" global="true" procedure="queryDocCacheProcedure">
	<public name="docID" type="String"></public>
</action>
<action name="uploadFile" global="false" procedure="uploadFileProcedure"><public type="String" name="title" required="false"></public>
<label language="zh_CN">上传文件到文档服务器</label>

<public type="String" name="rootPath"></public>
<public type="String" name="subPath"></public>
<public type="Object" name="file" required="true"></public>
<public type="String" name="filename" required="true"></public>
</action>
<action name="queryDocFileIDs" global="false" procedure="queryDocFileIDsProcedure"><public type="String" name="rootPath"></public><public type="String" name="subPath" required="true"></public>
<label language="zh_CN">获取目录下的文件列表</label>

<public type="Integer" name="limit" value="20" required="true"></public>
<public type="Integer" name="offset" value="0" required="true"></public>
<public type="String" name="filter"></public>
</action>
<action name="querySettingAction2" global="true" procedure="querySettingAction2Procedure">
<label language="zh_CN">docHandler</label>
<public name="linkProcess" type="String"></public>
<public name="linkActivity" type="String"></public>
<public name="keyId" type="String"></public>
</action>
</model>