<?xml version="1.0" encoding="UTF-8"?><model xmlns="http://www.justep.com/model" xmlns:m="http://www.justep.com/model">  
  	<action global="true" name="queryOrgCommonGroupAction" procedure="queryOrgCommonGroupProcedure"> 
	    <label language="zh_CN">查询常用组</label> 
	    <private name="concept" type="String" value="SA_OPOrg"/>  
	    <private name="select" type="String" value="SA_OPOrg.*"/>  
	    <private name="from" type="String" value="SA_OPOrg SA_OPOrg"/>  
	    <private name="aggregate" type="String"/>  
	    <private name="dataModel" type="String" value="/system/data"/>  
	    <private name="fnModel" type="String"/>  
	    <protected name="condition" type="String" value="SA_OPOrg.sValidState &gt;= 0"/>  
	    <permission name="range" type="List"/>  
	    <public name="distinct" type="Boolean" value="false"/>  
	    <public name="idColumn" type="String" value="SA_OPOrg"/>  
	    <public name="filter" type="String"/>  
	    <public name="limit" type="Integer"/>  
	    <public name="offset" type="Integer"/>  
	    <public name="columns" type="String"/>  
	    <public name="orderBy" type="String" value="SA_OPOrg.sSequence asc"/>  
	    <public name="aggregateColumns" type="String"/>  
	    <public name="variables" type="Map"/>  
		<public name="parentID" type="String"/>
	</action>  
  <action global="false" log-enabled="true" name="loginAction" procedure="loginProcedure"> 
    <label language="zh_CN">登录</label>  
    <public name="name" type="String"/>  
    <public name="loginDate" type="Date"/>  
    <public name="pwd" type="String"/>  
    <public name="lang" type="String"/>  
    <public name="ip" type="String"/>  
    <public name="options" type="Map"/> 
  </action>  
  <action log-enabled="true" name="ntLoginAction" procedure="ntLoginProcedure"> 
    <public name="name" type="String"/>  
    <public name="loginDate" type="Date"/>  
    <public name="lang" type="String"/>  
    <public name="ip" type="String"/>  
    <public name="options" type="Map"/>  
    <label language="zh_CN">域登录</label> 
  </action>  
  <action global="false" log-enabled="true" name="logoutAction" procedure="logoutProcedure"> 
    <label language="zh_CN">退出</label>  
    <public name="sessionID" type="String"/> 
  </action>  
  <action log-enabled="true" name="changePasswordAction" procedure="changePasswordProcedure"> 
    <public name="name" type="String"/>  
    <public name="opwd" type="String"/>  
    <public name="npwd" type="String"/>  
    <label language="zh_CN">修改密码</label> 
  </action>  
  <action log-enabled="true" name="recoverPasswordAction" procedure="recoverPasswordProcedure"> 
    <public name="code" type="String"/>  
    <label language="zh_CN">重置密码</label> 
  </action>

  <action global="true" log-enabled="true" name="updatePersonNumAction" procedure="updatePersonNumProcedure"> 
    <public name="num" type="Integer"/>  
    <public name="personID" type="String"/>  
    <label language="zh_CN">更新人员Num</label> 
  </action>  
    
  <action global="true" name="queryOrgAction" procedure="queryOrgProcedure"> 
    <private name="concept" type="String" value="SA_OPOrg"/>  
    <private name="select" type="String" value="SA_OPOrg.*"/>  
    <private name="from" type="String" value="SA_OPOrg SA_OPOrg"/>  
    <private name="aggregate" type="String"/>  
    <private name="dataModel" type="String" value="/system/data"/>  
    <private name="fnModel" type="String"/>  
    <protected name="condition" type="String" value="SA_OPOrg.sValidState &gt;= 0"/>  
    <permission name="range" type="List"/>  
    <public name="distinct" type="Boolean" value="false"/>  
    <public name="idColumn" type="String" value="SA_OPOrg"/>  
    <public name="filter" type="String"/>  
    <public name="limit" type="Integer"/>  
    <public name="offset" type="Integer"/>  
    <public name="columns" type="String"/>  
    <public name="orderBy" type="String" value="SA_OPOrg.sSequence asc"/>  
    <public name="aggregateColumns" type="String"/>  
    <public name="variables" type="Map"/>  
    <public name="manageCodes" type="String" value=""/>  
    <label language="zh_CN">查询组织机构</label> 
  <public name="includeChildrenOfManage" required="false" type="Boolean" value="false"/>
<public name="includePersonPhotoLastModified" required="false" type="Boolean" value="false"/>
<public type="Map" required="false" name="cacheFilter"></public>
<public type="Integer" name="includeChildren" required="false" value="-1"></public>
</action>  
  <action name="queryResourceControlAction" procedure="bizQueryProcedure"> 
    <permission name="range" type="List"/>  
    <private name="concept" type="String" value="SA_ResourceControl"/>  
    <private name="select" type="String" value="SA_ResourceControl.*"/>  
    <private name="from" type="String" value="SA_ResourceControl SA_ResourceControl  join SA_OPOrg SA_OPOrg on SA_ResourceControl.sOrgFID = SA_OPOrg.sFID"/>  
    <private name="aggregate" type="String"/>  
    <private name="dataModel" type="String" value="/system/data"/>  
    <private name="fnModel" type="String"/>  
    <protected name="condition" type="String" value="SA_OPOrg.sValidState = 1"/>  
    <public name="distinct" type="Boolean" value="false"/>  
    <public name="idColumn" type="String" value="SA_ResourceControl"/>  
    <public name="filter" type="String"/>  
    <public name="limit" type="Integer"/>  
    <public name="offset" type="Integer"/>  
    <public name="columns" type="String"/>  
    <public name="orderBy" type="String"/>  
    <public name="aggregateColumns" type="String"/>  
    <public name="variables" type="Map"/>  
    <label language="zh_CN">查询资源控制</label> 
  </action>  
  <action name="saveResourceControlAction" procedure="bizSaveProcedure"> 
    <permission name="insertRange" type="List"/>  
    <permission name="deleteRange" type="List"/>  
    <permission name="updateRange" type="List"/>  
    <private name="concept" type="String" value="SA_ResourceControl"/>  
    <private name="dataModel" type="String" value="/system/data"/>  
    <private name="fnModel" type="String"/>  
    <protected name="readOnly" type="String"/>  
    <protected name="notNull" type="String"/>  
    <public name="table" required="true" type="Table"/>  
    <label language="zh_CN">保存资源控制</label> 
  </action>  
  <action name="createResourceControlAction" procedure="bizCreateProcedure"> 
    <private name="concept" type="String" value="SA_ResourceControl"/>  
    <private name="fnModel" type="String"/>  
    <public name="table" required="true" type="Table"/>  
    <public name="defaultValues" type="Map"/>  
    <label language="zh_CN">创建资源控制</label> 
  </action>  
  <action name="queryOrgsByResourceAction" procedure="queryOrgsByResourceProcedure"> 
    <public name="typeID" required="true" type="String"/>  
    <public name="resourceID" required="true" type="String"/>  
    <public name="process" required="false" type="String"/>  
    <public name="activity" required="false" type="String"/>  
    <public name="action" required="false" type="String"/>  
    <label language="zh_CN">根据资源查询组织</label> 
  </action>  
  <action name="saveResourceControl2Action" procedure="saveResourceControl2Procedure"> 
    <public name="resourceID" required="true" type="String"/>  
    <public name="typeID" required="true" type="String"/>  
    <public name="typeName" required="true" type="String"/>  
    <public name="newOrgs" required="true" type="Map"/>  
    <public name="process" required="false" type="String"/>  
    <public name="activity" required="false" type="String"/>  
    <public name="action" required="false" type="String"/>  
    <label language="zh_CN">保存资源控制2</label> 
  </action>  
  <action global="true" name="checkPermissionAction" procedure="checkPermissionProcedure"> 
    <label language="zh_CN">验证是否拥有权限</label>  
    <public name="permissions" type="List"/> 
  </action>  
  <action global="false" name="queryOnlineUserAction" procedure="queryOnlineUserProcedure"> 
    <label language="zh_CN">查询在线用户信息</label>  
  </action>
  <action global="false" log-enabled="false" name="queryDataTestAction" procedure="ksqlQueryProcedure"> 
      
      
     
  <label language="zh_CN">查询测试</label>
<public name="ksql" type="String"/>
<public name="variables" type="Map"/>
<public name="dataModel" type="String"/>
<public name="fnModel" type="String"/>
</action> 

  <action global="false" name="loadRegistUserAction" procedure="loadRegistUserProcedure"> 
    <label language="zh_CN">加载注册用户列表</label>  
  </action>

	
	<action global="true" name="getOrgKindsAction" procedure="getOrgKindsProcedure">
		<label language="zh_CN">获取组织类型</label>
	</action>
<action name="queryTerminalTypeAction" procedure="bizQueryProcedure"><permission name="range" type="List"/>
<private name="concept" type="String" value="SA_TerminalType"/>
<private name="select" type="String" value="SA_TerminalType.*"/>
<private name="from" type="String" value="SA_TerminalType SA_TerminalType"/>
<private name="aggregate" type="String"/>
<private name="dataModel" type="String" value="/system/data"/>
<private name="fnModel" type="String"/>
<protected name="condition" type="String"/>
<public name="distinct" type="Boolean" value="false"/>
<public name="idColumn" type="String" value="SA_TerminalType"/>
<public name="filter" type="String"/>
<public name="limit" type="Integer"/>
<public name="offset" type="Integer"/>
<public name="columns" type="String"/>
<public name="orderBy" type="String"/>
<public name="aggregateColumns" type="String"/>
<public name="variables" type="Map"/>
</action>
<action name="updateOrgVersionAction" global="true" procedure="updateOrgVersionProcedure"><label language="zh_CN">更新组织版本</label>
</action>
<action name="getDisabledActions" global="true" procedure="getDisabledActionsProcedure"><label language="zh_CN">获取没有权限的保护动作列表</label>
<public type="String" name="process"></public>
<public type="String" name="activity"></public>
</action>
</model>