<?xml version="1.0" encoding="utf-8"?>

<model xmlns="http://www.justep.com/model">  
  <action name="queryOPManagementAction" procedure="bizQueryProcedure"> 
    <public name="concept" type="String" value="SA_OPManagement"/>  
    <private name="select" type="String" value="SA_OPManagement.*,manageOrg.sOrgKindID as manageOrgKindID,manageOrg.sValidState as manageOrgValidState,manageOrg.sSequence as manageSequence,manageType.sName as manageTypeName"/>  
    <private name="from" type="String" value="SA_OPManagement SA_OPManagement  join SA_OPOrg manageOrg on SA_OPManagement.sManageOrgID = manageOrg join SA_OPManageType manageType on SA_OPManagement.sManageTypeID = manageType"/>  
    <private name="aggregate" type="String"/>  
    <private name="dataModel" type="String" value="/system/data"/>  
    <private name="fnModel" type="String"/>  
    <protected name="condition" type="String" value="manageOrg.sValidState = 1"/>  
    <permission name="range" type="List"/>  
    <public name="distinct" type="Boolean" value="false"/>  
    <public name="idColumn" type="String" value="SA_OPManagement"/>  
    <public name="filter" type="String"/>  
    <public name="limit" type="Integer"/>  
    <public name="offset" type="Integer"/>  
    <public name="columns" type="String"/>  
    <public name="orderBy" type="String" value="manageOrg.sSequence asc"/>  
    <public name="aggregateColumns" type="String"/>  
    <public name="variables" type="Map"/>  
    <label language="zh_CN">查询组织管理权限</label> 
  </action>  
  <action name="appendManagementsAction" global="false" procedure="appendManagementsProcedure">
    <label language="zh_CN">添加组织管理权限</label>  
    <public type="String" name="manageTypeID" required="true"/>  
    <public type="String" name="orgID" required="true"/>  
    <public type="List" name="manageOrgIDs" required="true"/> 
  </action>  
  <action name="deleteManagementsAction" global="false" procedure="deleteManagementsProcedure">
    <label language="zh_CN">删除组织管理权限</label>  
    <public type="Map" name="managements" required="true"/> 
  </action> 
  <action name="queryOPManageTypeAction" procedure="bizQueryProcedure"> 
    <public name="concept" type="String" value="SA_OPManageType"/>  
    <private name="select" type="String" value="SA_OPManageType.*"/>  
    <private name="from" type="String" value="SA_OPManageType SA_OPManageType"/>  
    <private name="aggregate" type="String"/>  
    <private name="dataModel" type="String" value="/system/data"/>  
    <private name="fnModel" type="String"/>  
    <protected name="condition" type="String"/>  
    <permission name="range" type="List"/>  
    <public name="distinct" type="Boolean" value="false"/>  
    <public name="idColumn" type="String" value="SA_OPManageType"/>  
    <public name="filter" type="String"/>  
    <public name="limit" type="Integer"/>  
    <public name="offset" type="Integer"/>  
    <public name="columns" type="String"/>  
    <public name="orderBy" type="String" value="SA_OPManageType.sCode asc"/>  
    <public name="aggregateColumns" type="String"/>  
    <public name="variables" type="Map"/>  
    <label language="zh_CN">查询组织管理权限类型</label> 
  </action>  
  <action name="saveOPManageTypeAction" procedure="bizSaveProcedure">
    <permission name="insertRange" type="List"/>  
    <permission name="deleteRange" type="List"/>  
    <permission name="updateRange" type="List"/>  
    <private name="concept" type="String" value="SA_OPManageType"/>  
    <private name="dataModel" type="String" value="/system/data"/>  
    <private name="fnModel" type="String"/>  
    <protected name="readOnly" type="String"/>  
    <protected name="notNull" type="String"/>  
    <public name="table" required="true" type="Table"/> 
  <label language="zh_CN">保存组织管理权限类型</label>
</action>  
  <action name="createOPManageTypeAction" procedure="bizCreateProcedure">
    <private name="concept" type="String" value="SA_OPManageType"/>  
    <private name="fnModel" type="String"/>  
    <public name="table" required="true" type="Table"/>  
    <public name="defaultValues" type="Map"/> 
  <label language="zh_CN">创建组织管理权限类型</label>
</action> 
</model>
