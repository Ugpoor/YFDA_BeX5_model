<?xml version="1.0" encoding="UTF-8"?>

<model xmlns="http://www.justep.com/model" xmlns:m="http://www.justep.com/model">  
  <fn name="defaultEncryptPassword" category="组织函数" code-model="/system/logic/code" code="OrgFn.defaultEncryptPassword" type="String"> 
    <label language="zh_CN">获取加密后的默认密码</label> 
  </fn>  
  <fn name="loginDate" category="组织函数" code-model="/system/logic/code" code="OrgFn.loginDate" type="Date"> 
    <label language="zh_CN">获取登录日期</label> 
  </fn>  
  <fn name="currentLanguage" category="组织函数" code-model="/system/logic/code" code="OrgFn.currentLanguage" type="String"> 
    <label language="zh_CN">获取当前语言</label> 
  </fn>  
  <fn name="firstOrgUnitFID" category="组织函数" code-model="/system/logic/code" code="OrgFn.firstOrgUnitFID" type="String"> 
    <label language="zh_CN">获取组织单元列表中第一个组织单元的FID</label>  
    <parameter name="items" type="List"/> 
  </fn>  
  <fn name="firstOrgUnitFName" category="组织函数" code-model="/system/logic/code" code="OrgFn.firstOrgUnitFName" type="String"> 
    <label language="zh_CN">获取组织单元列表中第一个组织单元的FName</label>  
    <parameter name="items" type="List"/> 
  </fn>  
  <fn name="operatorID" category="组织函数" code-model="/system/logic/code" code="OrgFn.operatorID" type="String"> 
    <label language="zh_CN">操作者ID</label> 
  </fn>  
  <fn name="operatorCode" category="组织函数" code-model="/system/logic/code" code="OrgFn.operatorCode" type="String"> 
    <label language="zh_CN">操作者Code</label> 
  </fn>  
  <fn name="operatorName" category="组织函数" code-model="/system/logic/code" code="OrgFn.operatorName" type="String"> 
    <label language="zh_CN">操作者Name</label> 
  </fn>  
  <fn name="currentPersonID" category="组织函数" code-model="/system/logic/code" code="OrgFn.currentPersonID" type="String"> 
    <label language="zh_CN">当前人的ID</label> 
  </fn>  
  <fn name="currentPersonName" category="组织函数" code-model="/system/logic/code" code="OrgFn.currentPersonName" type="String"> 
    <label language="zh_CN">当前人的Name</label> 
  </fn>  
  <fn name="currentPersonCode" category="组织函数" code-model="/system/logic/code" code="OrgFn.currentPersonCode" type="String"> 
    <label language="zh_CN">当前人的Code</label> 
  </fn>  
  <fn name="currentPersonMemberNameWithAgent" category="组织函数" code-model="/system/logic/code" code="OrgFn.currentPersonMemberNameWithAgent" type="String"> 
    <label language="zh_CN">当前人的名称，带上代理者</label> 
  </fn>  
  <fn name="currentPersonMemberFNameWithAgent" category="组织函数" code-model="/system/logic/code" code="OrgFn.currentPersonMemberFNameWithAgent" type="String"> 
    <label language="zh_CN">当前人的FName，带上代理者</label> 
  </fn>  
  <fn name="currentPersonMember" category="组织函数" code-model="/system/logic/code" code="OrgFn.currentPersonMember" type="List&lt;OrgUnit&gt;"> 
    <label language="zh_CN">当前人员成员</label> 
  </fn>  
  <fn name="currentPersonMember2" category="组织函数" code-model="/system/logic/code" code="OrgFn.currentPersonMember2" type="List&lt;OrgUnit&gt;"> 
    <label language="zh_CN">当前函数只用在流程的首环节的执行规则里，如果启动流程时给定了执行者，返回那个执行者，否则返回当前人员成员</label> 
  </fn>  
  <fn name="currentPersonMemberID" category="组织函数" code-model="/system/logic/code" code="OrgFn.currentPersonMemberID" type="String"> 
    <label language="zh_CN">当前人员成员ID</label> 
  </fn>  
  <fn name="currentPersonMemberName" category="组织函数" code-model="/system/logic/code" code="OrgFn.currentPersonMemberName" type="String"> 
    <label language="zh_CN">当前人员成员Name</label> 
  </fn>  
  <fn name="currentPersonMemberCode" category="组织函数" code-model="/system/logic/code" code="OrgFn.currentPersonMemberCode" type="String"> 
    <label language="zh_CN">当前人员成员Code</label> 
  </fn>  
  <fn name="currentPersonMemberFID" category="组织函数" code-model="/system/logic/code" code="OrgFn.currentPersonMemberFID" type="String"> 
    <label language="zh_CN">当前人员成员FID</label> 
  </fn>  
  <fn name="currentPersonMemberFName" category="组织函数" code-model="/system/logic/code" code="OrgFn.currentPersonMemberFName" type="String"> 
    <label language="zh_CN">当前人员成员FName</label> 
  </fn>  
  <fn name="currentOrgID" category="组织函数" code-model="/system/logic/code" code="OrgFn.currentOrgID" type="String"> 
    <label language="zh_CN">当前组织ID</label> 
  </fn>  
  <fn name="currentOrgName" category="组织函数" code-model="/system/logic/code" code="OrgFn.currentOrgName" type="String"> 
    <label language="zh_CN">当前组织Name</label> 
  </fn>  
  <fn name="currentOrgCode" category="组织函数" code-model="/system/logic/code" code="OrgFn.currentOrgCode" type="String"> 
    <label language="zh_CN">当前组织Code</label> 
  </fn>  
  <fn name="currentOrgFID" category="组织函数" code-model="/system/logic/code" code="OrgFn.currentOrgFID" type="String"> 
    <label language="zh_CN">当前组织FID</label> 
  </fn>  
  <fn name="currentOrgFName" category="组织函数" code-model="/system/logic/code" code="OrgFn.currentOrgFName" type="String"> 
    <label language="zh_CN">当前组织FName</label> 
  </fn>  
  <fn name="currentPosID" category="组织函数" code-model="/system/logic/code" code="OrgFn.currentPosID" type="String"> 
    <label language="zh_CN">当前岗位ID</label> 
  </fn>  
  <fn name="currentPosName" category="组织函数" code-model="/system/logic/code" code="OrgFn.currentPosName" type="String"> 
    <label language="zh_CN">当前岗位Name</label> 
  </fn>  
  <fn name="currentPosCode" category="组织函数" code-model="/system/logic/code" code="OrgFn.currentPosCode" type="String"> 
    <label language="zh_CN">当前岗位Code</label> 
  </fn>  
  <fn name="currentPosFID" category="组织函数" code-model="/system/logic/code" code="OrgFn.currentPosFID" type="String"> 
    <label language="zh_CN">当前岗位FID</label> 
  </fn>  
  <fn name="currentPosFName" category="组织函数" code-model="/system/logic/code" code="OrgFn.currentPosFName" type="String"> 
    <label language="zh_CN">当前岗位FName</label> 
  </fn>  
  <fn name="currentDeptID" category="组织函数" code-model="/system/logic/code" code="OrgFn.currentDeptID" type="String"> 
    <label language="zh_CN">当前部门ID</label> 
  </fn>  
  <fn name="currentDeptName" category="组织函数" code-model="/system/logic/code" code="OrgFn.currentDeptName" type="String"> 
    <label language="zh_CN">当前部门Name</label> 
  </fn>  
  <fn name="currentDeptCode" category="组织函数" code-model="/system/logic/code" code="OrgFn.currentDeptCode" type="String"> 
    <label language="zh_CN">当前部门Code</label> 
  </fn>  
  <fn name="currentDeptFID" category="组织函数" code-model="/system/logic/code" code="OrgFn.currentDeptFID" type="String"> 
    <label language="zh_CN">当前部门FID</label> 
  </fn>  
  <fn name="currentDeptFName" category="组织函数" code-model="/system/logic/code" code="OrgFn.currentDeptFName" type="String"> 
    <label language="zh_CN">当前部门FName</label> 
  </fn>  
  <fn name="currentOgnID" category="组织函数" code-model="/system/logic/code" code="OrgFn.currentOgnID" type="String"> 
    <label language="zh_CN">当前机构ID</label> 
  </fn>  
  <fn name="currentOgnName" category="组织函数" code-model="/system/logic/code" code="OrgFn.currentOgnName" type="String"> 
    <label language="zh_CN">当前机构Name</label> 
  </fn>  
  <fn name="currentOgnCode" category="组织函数" code-model="/system/logic/code" code="OrgFn.currentOgnCode" type="String"> 
    <label language="zh_CN">当前机构Code</label> 
  </fn>  
  <fn name="currentOgnFID" category="组织函数" code-model="/system/logic/code" code="OrgFn.currentOgnFID" type="String"> 
    <label language="zh_CN">当前机构FID</label> 
  </fn>  
  <fn name="currentOgnFName" category="组织函数" code-model="/system/logic/code" code="OrgFn.currentOgnFName" type="String"> 
    <label language="zh_CN">当前机构FName</label> 
  </fn>  
  <fn name="findManagers" category="组织函数" code-model="/system/logic/code" code="OrgFn.findManagers" type="List&lt;OrgUnit&gt;"> 
    <label language="zh_CN">获取指定组织单元的管理者</label>  
    <parameter name="org" type="Object"/>  
    <parameter name="managerType" type="String"/>  
    <parameter name="includeAllParent" type="boolean"/>  
    <parameter name="inOrg" type="Object"/> 
  </fn>  
  <fn name="findManagersOfCurrentDept" category="组织函数" code-model="/system/logic/code" code="OrgFn.findManagersOfCurrentDept" type="List&lt;OrgUnit&gt;"> 
    <label language="zh_CN">获取当前部门的管理者</label>  
    <parameter name="includeAllParent" type="boolean"/> 
  </fn>  
  <fn name="findSubordinations" category="组织函数" code-model="/system/logic/code" code="OrgFn.findSubordinations" type="List&lt;OrgUnit&gt;"> 
    <label language="zh_CN">获取指定组织单元的下属</label>  
    <parameter name="org" type="Object"/>  
    <parameter name="managerType" type="String"/>  
    <parameter name="inOrg" type="Object"/>  
    <parameter name="isPersonMember" type="boolean"/> 
  </fn>  
  <fn name="findOrgChildren" category="组织函数" code-model="/system/logic/code" code="OrgFn.findOrgChildren" type="List&lt;OrgUnit&gt;"> 
    <label language="zh_CN">获取指定组织的子(不包括人员成员)</label>  
    <parameter name="org" type="Object"/>  
    <parameter name="childCondition" type="String"/>  
    <parameter name="params" type="Map&lt;String, Object&gt;"/>  
    <parameter name="includeSelf" type="boolean"/>  
    <parameter name="includeAllChildren" type="boolean"/> 
  </fn>  
  <fn name="findOrgChildrenByCode" category="组织函数" code-model="/system/logic/code" code="OrgFn.findOrgChildrenByCode" type="List&lt;OrgUnit&gt;"> 
    <label language="zh_CN">获取属于指定组织单元的指定编码的子(不包括人员成员)</label>  
    <parameter name="org" type="Object"/>  
    <parameter name="code" type="String"/>  
    <parameter name="includeSelf" type="boolean"/>  
    <parameter name="includeAllChildren" type="boolean"/> 
  </fn>  
  <fn name="findOrgChildrenByLevel" category="组织函数" code-model="/system/logic/code" code="OrgFn.findOrgChildrenByLevel" type="List&lt;OrgUnit&gt;"> 
    <label language="zh_CN">获取属于指定组织单元的指定级别的子(不包括人员成员)</label>  
    <parameter name="org" type="Object"/>  
    <parameter name="index" type="Integer"/>  
    <parameter name="operation" type="String"/>  
    <parameter name="includeSelf" type="boolean"/>  
    <parameter name="includeAllChildren" type="boolean"/> 
  </fn>  
  <fn name="findOrgChildren2" category="组织函数" code-model="/system/logic/code" code="OrgFn.findOrgChildren2" type="List&lt;OrgUnit&gt;"> 
    <label language="zh_CN">获取指定组织的子</label>  
    <parameter name="org" type="Object"/>  
    <parameter name="childCondition" type="String"/>  
    <parameter name="params" type="Map&lt;String, Object&gt;"/>  
    <parameter name="includeSelf" type="boolean"/>  
    <parameter name="includeAllChildren" type="boolean"/>  
    <parameter name="includePersonMember" type="boolean"/> 
  </fn>  
  <fn name="findOrgParents" category="组织函数" code-model="/system/logic/code" code="OrgFn.findOrgParents" type="List&lt;OrgUnit&gt;"> 
    <label language="zh_CN">获取属于指定组织单元的父</label>  
    <parameter name="org" type="Object"/>  
    <parameter name="parentCondition" type="String"/>  
    <parameter name="params" type="Map&lt;String, Object&gt;"/>  
    <parameter name="includeSelf" type="boolean"/>  
    <parameter name="includeAllParent" type="boolean"/> 
  </fn>  
  <fn name="findOrgParentsByCode" category="组织函数" code-model="/system/logic/code" code="OrgFn.findOrgParentsByCode" type="List&lt;OrgUnit&gt;"> 
    <label language="zh_CN">获取属于指定组织单元的指定编码的父</label>  
    <parameter name="org" type="Object"/>  
    <parameter name="code" type="String"/>  
    <parameter name="includeSelf" type="boolean"/>  
    <parameter name="includeAllChildren" type="boolean"/> 
  </fn>  
  <fn name="findOrgParentsByLevel" category="组织函数" code-model="/system/logic/code" code="OrgFn.findOrgParentsByLevel" type="List&lt;OrgUnit&gt;"> 
    <label language="zh_CN">获取属于指定组织单元的指定级别的父</label>  
    <parameter name="org" type="Object"/>  
    <parameter name="index" type="Integer"/>  
    <parameter name="operation" type="String"/>  
    <parameter name="includeSelf" type="boolean"/>  
    <parameter name="includeAllChildren" type="boolean"/> 
  </fn>  
  <fn name="findOnePersonMemberByID" category="组织函数" code-model="/system/logic/code" code="OrgFn.findOnePersonMemberByID" type="List&lt;OrgUnit&gt;"> 
    <label language="zh_CN">根据人的ID获取人员成员</label>  
    <parameter name="orgIDorFID" type="String"/>  
    <parameter name="personID" type="String"/> 
  </fn>  
  <fn name="findPersonMembersByID" category="组织函数" code-model="/system/logic/code" code="OrgFn.findPersonMembersByID" type="List&lt;OrgUnit&gt;"> 
    <label language="zh_CN">根据人的ID获取人员成员</label>  
    <parameter name="orgIDorFID" type="String"/>  
    <parameter name="personID" type="String"/> 
  </fn>  
  <fn name="findPersonMembersByIDList" category="组织函数" code-model="/system/logic/code" code="OrgFn.findPersonMembersByIDList" type="List&lt;OrgUnit&gt;"> 
    <label language="zh_CN">根据人的ID获取人员成员</label>  
    <parameter name="orgIDandPersonID" type="List&lt;List&lt;String&gt;&gt;"/> 
  </fn>  
  <fn name="findPersonMembersByCode" category="组织函数" code-model="/system/logic/code" code="OrgFn.findPersonMembersByCode" type="List&lt;OrgUnit&gt;"> 
    <label language="zh_CN">根据人的编码获取人员成员</label>  
    <parameter name="orgIDorFID" type="String"/>  
    <parameter name="personCode" type="String"/> 
  </fn>  
  <fn name="findPersonMembersByCodeList" category="组织函数" code-model="/system/logic/code" code="OrgFn.findPersonMembersByCodeList" type="List&lt;OrgUnit&gt;"> 
    <label language="zh_CN">根据人的编码获取人员成员</label>  
    <parameter name="orgIDOrPersonCode" type="List&lt;List&lt;String&gt;&gt;"/> 
  </fn>  
  <fn name="findPersonMembersInOrg" category="组织函数" code-model="/system/logic/code" code="OrgFn.findPersonMembersInOrg" type="List&lt;OrgUnit&gt;"> 
    <label language="zh_CN">获取指定部门下的人员成员</label>  
    <parameter name="org" type="Object"/>  
    <parameter name="includeAllChildren" type="boolean"/> 
  </fn>  
  <fn name="findOrgUnitsHasRole" category="组织函数" code-model="/system/logic/code" code="OrgFn.findOrgUnitsHasRole" type="List&lt;OrgUnit&gt;"> 
    <label language="zh_CN">获取属于指定角色ID的组织单元</label>  
    <parameter name="roleCode" type="String"/>  
    <parameter name="inOrg" type="Object"/>  
    <parameter name="isPersonMember" type="boolean"/> 
  </fn>  
  <fn name="findOrgUnitsHasRoleByCode" category="组织函数" code-model="/system/logic/code" code="OrgFn.findOrgUnitsHasRoleByCode" type="List&lt;OrgUnit&gt;"> 
    <label language="zh_CN">获取属于指定角色Code的组织单元</label>  
    <parameter name="roleCode" type="String"/>  
    <parameter name="inOrg" type="Object"/>  
    <parameter name="isPersonMember" type="boolean"/> 
  </fn>  
  <fn name="findOrgUnitsByID" category="组织函数" code-model="/system/logic/code" code="OrgFn.findOrgUnitsByID" type="List&lt;OrgUnit&gt;"> 
    <label language="zh_CN">根据ID获取指定的组织单元</label>  
    <parameter name="ids" type="Object"/> 
  </fn>  
  <fn name="findOrgUnitsByCode" category="组织函数" code-model="/system/logic/code" code="OrgFn.findOrgUnitsByCode" type="List&lt;OrgUnit&gt;"> 
    <label language="zh_CN">根据Code获取指定的组织单元</label>  
    <parameter name="codes" type="Object"/> 
  </fn>  
  <fn name="findOrgUnitsByFID" category="组织函数" code-model="/system/logic/code" code="OrgFn.findOrgUnitsByFID" type="List&lt;OrgUnit&gt;"> 
    <label language="zh_CN">根据FID获取指定的组织单元</label>  
    <parameter name="fids" type="Object"/> 
  </fn>  
  <fn name="distinctOrgUnitsByFID" category="组织函数" code-model="/system/logic/code" code="OrgFn.distinctOrgUnitsByFID" type="List&lt;OrgUnit&gt;"> 
    <label language="zh_CN">根据FID对组织单元列表执行distinct操作</label>  
    <parameter name="items" type="List&lt;OrgUnit&gt;"/> 
  </fn>  
  <fn name="distinctOrgUnitsByID" category="组织函数" code-model="/system/logic/code" code="OrgFn.distinctOrgUnitsByID" type="List&lt;OrgUnit&gt;"> 
    <label language="zh_CN">根据ID对组织单元列表执行distinct操作</label>  
    <parameter name="items" type="List&lt;OrgUnit&gt;"/> 
  </fn>  
  <fn name="orgUnitsEq" category="组织函数" code-model="/system/logic/code" code="OrgFn.orgUnitsEq" type="boolean"> 
    <label language="zh_CN">判断两个组织单元列表是否相等</label>  
    <parameter name="items1" type="List&lt;OrgUnit&gt;"/>  
    <parameter name="items2" type="List&lt;OrgUnit&gt;"/> 
  </fn>  
  <fn name="orgUnitsAnd" category="组织函数" code-model="/system/logic/code" code="OrgFn.orgUnitsAnd" type="List&lt;OrgUnit&gt;"> 
    <label language="zh_CN">两个OrgUnit列表做交集操作</label>  
    <parameter name="items1" type="List&lt;OrgUnit&gt;"/>  
    <parameter name="items2" type="List&lt;OrgUnit&gt;"/> 
  </fn>  
  <fn name="orgUnitsOr" category="组织函数" code-model="/system/logic/code" code="OrgFn.orgUnitsOr" type="List&lt;OrgUnit&gt;"> 
    <label language="zh_CN">两个OrgUnit列表做并集操作</label>  
    <parameter name="items1" type="List&lt;OrgUnit&gt;"/>  
    <parameter name="items2" type="List&lt;OrgUnit&gt;"/> 
  </fn>  
  <fn name="orgUnitsSub" category="组织函数" code-model="/system/logic/code" code="OrgFn.orgUnitsSub" type="List&lt;OrgUnit&gt;"> 
    <label language="zh_CN">两个OrgUnit列表做差集操作</label>  
    <parameter name="items1" type="List&lt;OrgUnit&gt;"/>  
    <parameter name="items2" type="List&lt;OrgUnit&gt;"/> 
  </fn>  
  
  <fn name="inOrgUnits" category="组织函数" code-model="/system/logic/code" code="OrgFn.inOrgUnits" type="boolean"> 
    <label language="zh_CN">判断指定的组织单元是否在某个范围内</label>  
    <parameter name="fid" type="String"/>  
    <parameter name="items" type="List&lt;OrgUnit&gt;"/> 
  </fn>  
  <fn name="orgUnitsByIndex" category="组织函数" code-model="/system/logic/code" code="OrgFn.orgUnitsByIndex" type="List&lt;OrgUnit&gt;"> 
    <label language="zh_CN">从组织单元列表中获取指定序号的组织单元</label>  
    <parameter name="items" type="List&lt;OrgUnit&gt;"/>  
    <parameter name="index" type="Integer"/> 
  </fn>  
  <fn name="orgUnitsByKind" category="组织函数" code-model="/system/logic/code" code="OrgFn.orgUnitsByKind" type="List&lt;OrgUnit&gt;"> 
    <label language="zh_CN">组织单元转换成指定类型的组织单元</label>  
    <parameter name="items" type="List&lt;OrgUnit&gt;"/> 
    <parameter name="kind" type="String"/>
  </fn>  
  <fn name="orgUnitsToPoss" category="组织函数" code-model="/system/logic/code" code="OrgFn.orgUnitsToPoss" type="List&lt;OrgUnit&gt;"> 
    <label language="zh_CN">组织单元转换成相应的岗位</label>  
    <parameter name="items" type="List&lt;OrgUnit&gt;"/> 
  </fn>  
  <fn name="orgUnitsToDepts" category="组织函数" code-model="/system/logic/code" code="OrgFn.orgUnitsToDepts" type="List&lt;OrgUnit&gt;"> 
    <label language="zh_CN">组织单元转换成相应的部门</label>  
    <parameter name="items" type="List&lt;OrgUnit&gt;"/> 
  </fn>  
  <fn name="orgUnitsToOgns" category="组织函数" code-model="/system/logic/code" code="OrgFn.orgUnitsToOgns" type="List&lt;OrgUnit&gt;"> 
    <label language="zh_CN">组织单元转换成相应的机构</label>  
    <parameter name="items" type="List&lt;OrgUnit&gt;"/> 
  </fn>  
  <fn name="orgUnitsToOrgs" category="组织函数" code-model="/system/logic/code" code="OrgFn.orgUnitsToOrgs" type="List&lt;OrgUnit&gt;"> 
    <label language="zh_CN">组织单元转换成相应的组织</label>  
    <parameter name="items" type="List&lt;OrgUnit&gt;"/> 
  </fn>  
  <fn name="orgUnitsToOrgFIDs" category="组织函数" code-model="/system/logic/code" code="OrgFn.orgUnitsToOrgFIDs" type="List&lt;String&gt;"> 
    <label language="zh_CN">获取组织单元列表中的FID</label>  
    <parameter name="items" type="List&lt;OrgUnit&gt;"/> 
  </fn> 
  
  <fn name="removeOrgUnitByFID" category="组织函数" code-model="/system/logic/code" code="OrgFn.removeOrgUnitByFID" type="List&lt;String&gt;"> 
    <label language="zh_CN">从组织单元列表中删除指定的组织单元</label>  
    <parameter name="container" type="List&lt;OrgUnit&gt;"/>
    <parameter name="orgFID" type="String"/> 
  </fn> 
  <fn name="getOrgRealFName" category="组织函数" type="String" code-model="/system/logic/code" code="OrgFn.getOrgRealFName">
  	<label language="zh_CN">获取组织真实路径Name（从组织路径中排除虚拟组织节点）</label>
	<parameter type="String" name="orgFID"></parameter>
	<parameter type="String" name="orgFName"></parameter>
  </fn>
</model>
