<?xml version="1.0" encoding="utf-8"?>

<model xmlns="http://www.justep.com/model">  
  <concept name="SA_Log" default-value-expr="guid()"> 
    <has-relation relation="version" default-value-expr="0"> 
      <label language="zh_CN">版本</label> 
    </has-relation><has-relation relation="sTypeName">
      <label language="zh_CN">类别</label> 
    </has-relation>  
    <label language="zh_CN">日志</label>  
    <has-relation relation="sDescription"> 
      <label language="zh_CN">描述</label> 
    </has-relation>  
    <has-relation relation="sCreatorFID"> 
      <label language="zh_CN">操作者FID</label> 
    </has-relation>  
      
    <has-relation relation="sCreatorFName" default-value-expr="currentPersonMemberFNameWithAgent()"> 
      <label language="zh_CN">操作者</label> 
    </has-relation>  
      
    <has-relation relation="sCreateTime" default-value-expr="currentDateTime()"> 
      <label language="zh_CN">操作时间</label> 
    </has-relation>  
    <has-relation relation="sCreatorPersonID" default-value-expr="currentPersonID()"> 
      <label language="zh_CN">操作者ID</label> 
    </has-relation>  
    <has-relation relation="sCreatorPersonName" default-value-expr="currentPersonMemberNameWithAgent()"> 
      <label language="zh_CN">操作者</label> 
    </has-relation>  
    <has-relation relation="sCreatorPosID" default-value-expr="currentPosID()"> 
      <label language="zh_CN">操作者岗位ID</label> 
    </has-relation>  
    <has-relation relation="sCreatorPosName" default-value-expr="currentPosName()"> 
      <label language="zh_CN">操作者岗位</label> 
    </has-relation>  
    <has-relation relation="sCreatorDeptID" default-value-expr="currentDeptID()"> 
      <label language="zh_CN">操作者部门ID</label> 
    </has-relation>  
    <has-relation relation="sCreatorDeptName" default-value-expr="currentDeptName()"> 
      <label language="zh_CN">操作者部门</label> 
    </has-relation>  
    <has-relation relation="sCreatorOgnID" default-value-expr="currentOgnID()"> 
      <label language="zh_CN">操作者机构ID</label> 
    </has-relation>  
    <has-relation relation="sCreatorOgnName" default-value-expr="currentOgnName()"> 
      <label language="zh_CN">操作者机构</label> 
    </has-relation>  
    <has-relation relation="sProcess">
      <label language="zh_CN">过程</label> 
    </has-relation>  
    <has-relation relation="sProcessName">
      <label language="zh_CN">过程</label> 
    </has-relation>  
    <has-relation relation="sActivity">
      <label language="zh_CN">环节</label> 
    </has-relation>  
    <has-relation relation="sActivityName">
      <label language="zh_CN">环节</label> 
    </has-relation>  
    <has-relation relation="sActionName">
      <label language="zh_CN">动作名称</label> 
    </has-relation>  
    <has-relation relation="sAction">
      <label language="zh_CN">动作</label> 
    </has-relation><has-relation relation="sStatusName"><label language="zh_CN">操作状态</label>
</has-relation><has-relation relation="sParameters" data-type="String"><label language="zh_CN">参数</label>
</has-relation><has-relation relation="sResult" data-type="String"><label language="zh_CN">结果</label>
</has-relation>  
    <has-relation relation="sESField01">
      <label language="zh_CN">扩展01</label> 
    </has-relation>  
    <has-relation relation="sESField02">
      <label language="zh_CN">扩展02</label> 
    </has-relation>  
    <has-relation relation="sESField03">
      <label language="zh_CN">扩展03</label> 
    </has-relation>  
    <has-relation relation="sESField04">
      <label language="zh_CN">扩展04</label> 
    </has-relation>  
    <has-relation relation="sEDField21">
      <label language="zh_CN">扩展21</label> 
    </has-relation>  
    <has-relation relation="sEDField22">
      <label language="zh_CN">扩展22</label> 
    </has-relation>  
    <has-relation relation="sETField31">
      <label language="zh_CN">扩展31</label> 
    </has-relation>  
    <has-relation relation="sETField32">
      <label language="zh_CN">扩展32</label> 
    </has-relation>  
    <has-relation relation="sEIField41">
      <label language="zh_CN">扩展41</label> 
    </has-relation>  
    <has-relation relation="sEIField42">
      <label language="zh_CN">扩展42</label> 
    </has-relation>  
    <has-relation relation="sEBField51">
      <label language="zh_CN">扩展51</label> 
    </has-relation>  
    <has-relation relation="sEBField52">
      <label language="zh_CN">扩展52</label> 
    </has-relation>  
    <has-relation relation="sENField11">
      <label language="zh_CN">扩展11</label> 
    </has-relation>  
    <has-relation relation="sENField12">
      <label language="zh_CN">扩展12</label> 
    </has-relation>  
     
  


<has-relation relation="sIP" data-type="String"><label language="zh_CN">IP地址</label>
</has-relation>

<has-relation relation="sDeviceType"></has-relation>
<has-relation relation="sOperatingSystem"></has-relation>
</concept> 
<relation name="sParameters" data-type="String"><label language="zh_CN">参数</label>
</relation>
<relation name="sResult" data-type="String"><label language="zh_CN">结果</label>
</relation>
<concept name="SA_LogSetting" default-value-expr="guid()"><has-relation relation="version" default-value-expr="0"><label language="zh_CN">版本</label>
</has-relation>
<label language="zh_CN">日志配置</label>
<has-relation relation="sModel" data-type="String" default-value-expr="'*'"><label language="zh_CN">模块</label>
</has-relation><has-relation relation="sModelName" data-type="String" default-value-expr="'所有'"><label language="zh_CN">模块</label>
</has-relation><has-relation relation="sProcess" default-value-expr="'*'"><label language="zh_CN">过程</label>
</has-relation>
<has-relation relation="sProcessName" default-value-expr="'所有'"><label language="zh_CN">过程</label>
</has-relation>
<has-relation relation="sActivity" default-value-expr="'*'"><label language="zh_CN">环节</label>
</has-relation>
<has-relation relation="sActivityName" default-value-expr="'所有'"><label language="zh_CN">环节</label>
</has-relation>
<has-relation relation="sActionName" default-value-expr="'所有'"><label language="zh_CN">动作名称</label>
</has-relation>
<has-relation relation="sAction" default-value-expr="'*'"><label language="zh_CN">动作</label>
</has-relation>


<has-relation relation="sCreateTime" default-value-expr="currentDateTime()"><label language="zh_CN">创建时间</label>
</has-relation>
<has-relation relation="sCreatorFID"><label language="zh_CN">提交者FID</label>
</has-relation>
<has-relation relation="sCreatorID" default-value-expr="currentPersonID()"><label language="zh_CN">提交者ID</label>
</has-relation>
<has-relation relation="sCreatorFName"><label language="zh_CN">提交者</label>
</has-relation>
<has-relation relation="sCreatorName" default-value-expr="currentPersonMemberNameWithAgent()"><label language="zh_CN">提交者</label>
</has-relation>






</concept>




<relation name="sModel" data-type="String"><label language="zh_CN">模块</label>
</relation>
<relation name="sModelName" data-type="String"><label language="zh_CN">模块</label>
</relation>
<relation name="sIP" data-type="String"><label language="zh_CN">ip地址</label>
</relation>
<relation name="sDeviceType" data-type="String"><label language="zh_CN">终端类型</label>
</relation>
<relation name="sOperatingSystem" data-type="String"><label language="zh_CN">操作系统</label>
</relation>
</model>
