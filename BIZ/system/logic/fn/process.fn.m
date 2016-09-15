<?xml version="1.0" encoding="UTF-8"?>

<model xmlns="http://www.justep.com/model" xmlns:m="http://www.justep.com/model">  
  <fn name="findActivityCreator" category="流程函数" code-model="/system/logic/code" code="ProcessFn.findActivityCreator" type="List&lt;OrgUnit&gt;"> 
    <label language="zh_CN">获取指定环节的创建者</label>  
    <parameter name="activity" type="String"/> 
  </fn>  
  <fn name="findActivityFirstCreatorFID" category="流程函数" code-model="/system/logic/code" code="ProcessFn.findActivityFirstCreatorFID" type="String"> 
    <label language="zh_CN">获取指定环节的第一个创建者的FID</label>  
    <parameter name="activity" type="String"/> 
  </fn>  
  <fn name="findActivityFirstCreatorFName" category="流程函数" code-model="/system/logic/code" code="ProcessFn.findActivityFirstCreatorFName" type="String"> 
    <label language="zh_CN">获取指定环节的第一个创建者的FName</label>  
    <parameter name="activity" type="String"/> 
  </fn>  
  <fn name="findActivityCreatorOrg" category="流程函数" code-model="/system/logic/code" code="ProcessFn.findActivityCreatorOrg" type="List&lt;OrgUnit&gt;"> 
    <label language="zh_CN">获取指定环节的创建者所在的组织</label>  
    <parameter name="activity" type="String"/> 
  </fn>  
  <fn name="findActivityFirstCreatorOrgFID" category="流程函数" code-model="/system/logic/code" code="ProcessFn.findActivityFirstCreatorOrgFID" type="String"> 
    <label language="zh_CN">获取指定环节的第一个创建者所在的组织的FID</label>  
    <parameter name="activity" type="String"/> 
  </fn>  
  <fn name="findActivityFirstCreatorOrgFName" category="流程函数" code-model="/system/logic/code" code="ProcessFn.findActivityFirstCreatorOrgFName" type="String"> 
    <label language="zh_CN">获取指定环节的第一个创建者所在的组织的FName</label>  
    <parameter name="activity" type="String"/> 
  </fn>  
  <fn name="findActivityCreatorDept" category="流程函数" code-model="/system/logic/code" code="ProcessFn.findActivityCreatorDept" type="List&lt;OrgUnit&gt;"> 
    <label language="zh_CN">获取指定环节的创建者所在的部门</label>  
    <parameter name="activity" type="String"/> 
  </fn>  
  <fn name="findActivityFirstCreatorDeptFID" category="流程函数" code-model="/system/logic/code" code="ProcessFn.findActivityFirstCreatorDeptFID" type="String"> 
    <label language="zh_CN">获取指定环节的第一个创建者所在的部门的FID</label>  
    <parameter name="activity" type="String"/> 
  </fn>  
  <fn name="findActivityFirstCreatorDeptFName" category="流程函数" code-model="/system/logic/code" code="ProcessFn.findActivityFirstCreatorDeptFName" type="String"> 
    <label language="zh_CN">获取指定环节的第一个创建者所在的部门的FName</label>  
    <parameter name="activity" type="String"/> 
  </fn>  
  <fn name="findActivityCreatorOgn" category="流程函数" code-model="/system/logic/code" code="ProcessFn.findActivityCreatorOgn" type="List&lt;OrgUnit&gt;"> 
    <label language="zh_CN">获取指定环节的创建者所在的机构</label>  
    <parameter name="activity" type="String"/> 
  </fn>  
  <fn name="findActivityFirstCreatorOgnFID" category="流程函数" code-model="/system/logic/code" code="ProcessFn.findActivityFirstCreatorOgnFID" type="String"> 
    <label language="zh_CN">获取指定环节的第一个创建者所在的机构的FID</label>  
    <parameter name="activity" type="String"/> 
  </fn>  
  <fn name="findActivityFirstCreatorOgnFName" category="流程函数" code-model="/system/logic/code" code="ProcessFn.findActivityFirstCreatorOgnFName" type="String"> 
    <label language="zh_CN">获取指定环节的第一个创建者所在的机构的FName</label>  
    <parameter name="activity" type="String"/> 
  </fn>  
  <fn name="findActivityExecutor" category="流程函数" code-model="/system/logic/code" code="ProcessFn.findActivityExecutor" type="List&lt;OrgUnit&gt;"> 
    <label language="zh_CN">获取指定环节的执行者</label>  
    <parameter name="activity" type="String"/> 
  </fn>  
  <fn name="findActivityFirstExecutorFID" category="流程函数" code-model="/system/logic/code" code="ProcessFn.findActivityFirstExecutorFID" type="String"> 
    <label language="zh_CN">获取指定环节的第一个执行者的FID</label>  
    <parameter name="activity" type="String"/> 
  </fn>  
  <fn name="findActivityFirstExecutorFName" category="流程函数" code-model="/system/logic/code" code="ProcessFn.findActivityFirstExecutorFName" type="String"> 
    <label language="zh_CN">获取指定环节的第一个执行者的FName</label> 
  </fn>  
  <fn name="findActivityExecutorOrg" category="流程函数" code-model="/system/logic/code" code="ProcessFn.findActivityExecutorOrg" type="List&lt;OrgUnit&gt;"> 
    <label language="zh_CN">获取指定环节的执行者所在的组织</label>  
    <parameter name="activity" type="String"/> 
  </fn>  
  <fn name="findActivityFirstExecutorOrgFID" category="流程函数" code-model="/system/logic/code" code="ProcessFn.findActivityFirstExecutorOrgFID" type="String"> 
    <label language="zh_CN">获取指定环节的第一个执行者所在的组织的FID</label>  
    <parameter name="activity" type="String"/> 
  </fn>  
  <fn name="findActivityFirstExecutorOrgFName" category="流程函数" code-model="/system/logic/code" code="ProcessFn.findActivityFirstExecutorOrgFName" type="String"> 
    <label language="zh_CN">获取指定环节的第一个执行者所在的组织的FName</label>  
    <parameter name="activity" type="String"/> 
  </fn>  
  <fn name="findActivityExecutorDept" category="流程函数" code-model="/system/logic/code" code="ProcessFn.findActivityExecutorDept" type="List&lt;OrgUnit&gt;"> 
    <label language="zh_CN">获取指定环节的执行者所在的部门</label>  
    <parameter name="activity" type="String"/> 
  </fn>  
  <fn name="findActivityFirstExecutorDeptFID" category="流程函数" code-model="/system/logic/code" code="ProcessFn.findActivityFirstExecutorDeptFID" type="String"> 
    <label language="zh_CN">获取指定环节的第一个执行者所在的部门的FID</label>  
    <parameter name="activity" type="String"/> 
  </fn>  
  <fn name="findActivityFirstExecutorDeptFName" category="流程函数" code-model="/system/logic/code" code="ProcessFn.findActivityFirstExecutorDeptFName" type="String"> 
    <label language="zh_CN">获取指定环节的第一个执行者所在的部门的FName</label>  
    <parameter name="activity" type="String"/> 
  </fn>  
  <fn name="findActivityExecutorOgn" category="流程函数" code-model="/system/logic/code" code="ProcessFn.findActivityExecutorOgn" type="List&lt;OrgUnit&gt;"> 
    <label language="zh_CN">获取指定环节的执行者所在的机构</label>  
    <parameter name="activity" type="String"/> 
  </fn>  
  <fn name="findActivityFirstExecutorOgnFID" category="流程函数" code-model="/system/logic/code" code="ProcessFn.findActivityFirstExecutorOgnFID" type="String"> 
    <label language="zh_CN">获取指定环节的第一个执行者所在的机构的FID</label>  
    <parameter name="activity" type="String"/> 
  </fn>  
  <fn name="findActivityFirstExecutorOgnFName" category="流程函数" code-model="/system/logic/code" code="ProcessFn.findActivityFirstExecutorOgnFName" type="String"> 
    <label language="zh_CN">获取指定环节的第一个执行者所在的机构的FName</label>  
    <parameter name="activity" type="String"/> 
  </fn>  
  <fn name="findOrgUnitsHasActivity" category="流程函数" code-model="/system/logic/code" code="ProcessFn.findOrgUnitsHasActivity" type="List&lt;OrgUnit&gt;"> 
    <label language="zh_CN">获取拥有指定环节权限的组织单元</label>  
    <parameter name="activity" type="String"/>  
    <parameter name="inOrg" type="Object"/>  
    <parameter name="isPersonMember" type="Boolean"/> 
  </fn>  
  <fn name="findOrgUnitsHasCActivity" category="流程函数" code-model="/system/logic/code" code="ProcessFn.findOrgUnitsHasCActivity" type="List&lt;OrgUnit&gt;"> 
    <label language="zh_CN">获取拥有当前环节权限的组织单元</label>  
    <parameter name="inOrg" type="Object"/>  
    <parameter name="isPersonMember" type="Boolean"/> 
  </fn>  
  <fn name="findOrgUnitsHasCActivityInACDept" category="流程函数" code-model="/system/logic/code" code="ProcessFn.findOrgUnitsHasCActivityInACDept" type="List&lt;OrgUnit&gt;"> 
    <label language="zh_CN">获取和指定环节创建者在同一部门下, 拥有当前activity权限的组织单元</label>  
    <parameter name="activity" type="String"/>  
    <parameter name="isPersonMember" type="Boolean"/> 
  </fn>  
  <fn name="findOrgUnitsHasCActivityInACOgn" category="流程函数" code-model="/system/logic/code" code="ProcessFn.findOrgUnitsHasCActivityInACOgn" type="List&lt;OrgUnit&gt;"> 
    <label language="zh_CN">获取和指定环节创建者在同一机构下, 拥有当前activity权限的组织单元</label>  
    <parameter name="activity" type="String"/>  
    <parameter name="isPersonMember" type="Boolean"/> 
  </fn>  
  <fn name="findOrgUnitsHasCActivityInAEDept" category="流程函数" code-model="/system/logic/code" code="ProcessFn.findOrgUnitsHasCActivityInAEDept" type="List&lt;OrgUnit&gt;"> 
    <label language="zh_CN">获取和指定环节处理者在同一部门下, 拥有当前activity权限的组织单元</label>  
    <parameter name="activity" type="String"/>  
    <parameter name="isPersonMember" type="Boolean"/> 
  </fn>  
  <fn name="findOrgUnitsHasCActivityInAEOgn" category="流程函数" code-model="/system/logic/code" code="ProcessFn.findOrgUnitsHasCActivityInAEOgn" type="List&lt;OrgUnit&gt;"> 
    <label language="zh_CN">获取和指定环节处理者在同一机构下, 拥有当前activity权限的组织单元</label>  
    <parameter name="activity" type="String"/>  
    <parameter name="isPersonMember" type="Boolean"/> 
  </fn>  
  <fn name="getProcessData1" category="流程函数" code-model="/system/logic/code" code="ProcessFn.getProcessData1" type="String"> 
    <label language="zh_CN">获取流程关联的业务数据1</label> 
  </fn>  
  <fn name="getProcessData2" category="流程函数" code-model="/system/logic/code" code="ProcessFn.getProcessData2" type="String"> 
    <label language="zh_CN">获取流程关联的业务数据2</label> 
  </fn>  
  <fn name="getProcessData3" category="流程函数" code-model="/system/logic/code" code="ProcessFn.getProcessData3" type="String"> 
    <label language="zh_CN">获取流程关联的业务数据3</label> 
  </fn>  
  <fn name="getProcessData4" category="流程函数" code-model="/system/logic/code" code="ProcessFn.getProcessData4" type="String"> 
    <label language="zh_CN">获取流程关联的业务数据4</label> 
  </fn>  
  <fn name="isExecutingAction" category="流程函数" code-model="/system/logic/code" code="ProcessFn.isExecutingAction" type="Boolean"> 
    <label language="zh_CN">判断是否正在执行者定的Action</label>  
    <parameter name="name" type="String"/> 
  </fn>  
  <fn name="isProcessFinished" category="流程函数" code-model="/system/logic/code" code="ProcessFn.isProcessFinished" type="Boolean"> 
    <label language="zh_CN">判断流程是否已经结束</label> 
  </fn>  
  <fn name="isStartingProcess" category="流程函数" code-model="/system/logic/code" code="ProcessFn.isStartingProcess" type="Boolean"> 
    <label language="zh_CN">判断是否正在启动流程</label> 
  </fn>  
  <fn name="processFinishable" category="流程函数" code-model="/system/logic/code" code="ProcessFn.processFinishable" type="Boolean"> 
    <label language="zh_CN">判断流程是否可以结束</label> 
  </fn>  
  <fn name="isFlowTo" category="流程函数" code-model="/system/logic/code" code="ProcessFn.isFlowTo" type="Boolean"> 
    <label language="zh_CN">判断是否流转到指定的环节</label>  
    <parameter name="name" type="String"/> 
  </fn>  
  <fn name="isFlowToEnd" category="流程函数" code-model="/system/logic/code" code="ProcessFn.isFlowToEnd" type="Boolean"> 
    <label language="zh_CN">判断是否流转到结束</label> 
  </fn>  
  <fn name="currentPIName" category="流程函数" code-model="/system/logic/code" code="ProcessFn.currentPIName" type="String"> 
    <label language="zh_CN">获取当前流程实例的标题</label> 
  </fn>  
  <fn name="currentProcess" category="流程函数" code-model="/system/logic/code" code="ProcessFn.currentProcess" type="String"> 
    <label language="zh_CN">获取当前Process的全路径</label> 
  </fn>  
  <fn name="currentActivity" category="流程函数" code-model="/system/logic/code" code="ProcessFn.currentActivity" type="String"> 
    <label language="zh_CN">获取当前Activity的全路径</label> 
  </fn>  
  
  <fn name="currentProcessLabel" category="流程函数" code-model="/system/logic/code" code="ProcessFn.currentProcessLabel" type="String"> 
    <label language="zh_CN">获取当前Process的label</label> 
  </fn>  
  <fn name="currentActivityLabel" category="流程函数" code-model="/system/logic/code" code="ProcessFn.currentActivityLabel" type="String"> 
    <label language="zh_CN">获取当前Activity的label</label> 
  </fn>
  
 
  <fn name="currentProcessLabelOfProcessContext" category="流程函数" code-model="/system/logic/code" code="ProcessFn.currentProcessLabelOfProcessContext" type="String"> 
    <label language="zh_CN">获取流程上下文中的当前Process的label</label> 
  </fn>  
  <fn name="currentActivityLabelOfProcessContext" category="流程函数" code-model="/system/logic/code" code="ProcessFn.currentActivityLabelOfProcessContext" type="String"> 
    <label language="zh_CN">获取流程上下文中的当前Activity的label</label> 
  </fn>
  
  <fn name="currentProcessOfProcessContext" category="流程函数" code-model="/system/logic/code" code="ProcessFn.currentProcessOfProcessContext" type="String"> 
    <label language="zh_CN">获取流程上下文中的当前Process的全路径</label> 
  </fn>  
  <fn name="currentActivityOfProcessContext" category="流程函数" code-model="/system/logic/code" code="ProcessFn.currentActivityOfProcessContext" type="String"> 
    <label language="zh_CN">获取流程上下文中的当前Activity的全路径</label> 
  </fn>  
  
  <fn name="inputFromActivity" category="流程函数" code-model="/system/logic/code" code="ProcessFn.inputFromActivity" type="Boolean"> 
    <label language="zh_CN">判断当前环节的入口是否包括指定的环节</label>  
    <parameter name="activity" type="String"/>  
  </fn>  
  
  <fn name="currentTaskExecutorNumber" category="流程函数" code-model="/system/logic/code" code="ProcessFn.currentTaskExecutorNumber" type="Integer"> 
    <label language="zh_CN">当前任务执行者个数</label>  
  </fn>  
  <fn name="currentTaskExecutorFinishedNumber" category="流程函数" code-model="/system/logic/code" code="ProcessFn.currentTaskExecutorFinishedNumber" type="Integer"> 
    <label language="zh_CN">当前任务有多少个执行者已经处理完成</label>  
  </fn>  
</model>
