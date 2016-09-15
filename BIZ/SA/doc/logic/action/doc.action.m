<?xml version="1.0" encoding="utf-8"?>

<model xmlns="http://www.justep.com/model">  
  <action name="queryDocInfoAction" global="true" procedure="queryDocInfoProcedure"> 
    <label language="zh_CN">queryDocInfo</label>  
    <public type="String" name="docID"/> 
  </action>  
  <action name="getDocUrlAction" global="true" procedure="getDocUrl"> 
    <public name="docID" type="String"/>  
    <public name="docPath" type="String"/>  
    <public name="urlType" type="String"/>  
    <public name="versionID" type="String"/>  
    <public name="partType" type="String"/>  
    <public name="resultID" type="String"/>  
    <label language="zh_CN">getDocUrl</label> 
  </action>  
  <action name="saveDocAction" global="true" procedure="saveDoc"> 
    <label language="zh_CN">saveDoc</label>  
    <public name="docID" type="String"/>  
    <public name="docName" type="String"/>  
    <public name="docPath" type="String"/>  
    <public name="fileID" type="String"/>  
    <public name="kind" type="String"/>  
    <public name="size" type="String"/> 
  </action>  
  <action name="changeDocNameAction" global="true" procedure="changeDocName"> 
    <public name="docID" type="String"/>  
    <public name="docName" type="String"/> 
  </action>  
  <action name="deleteDocByIDAction" global="true" procedure="deleteDoc"> 
    <label language="zh_CN">deleteDocAction</label>  
    <public name="docID" type="String"/>  
    <public name="isLogicDelete" type="Boolean" value="true"/>  
    <public type="String" name="versionID"/> 
  </action>  
  <action name="reverseDocAction" global="true" procedure="reverseDoc">
    <public name="docID" type="String"/> 
  </action> 
</model>
