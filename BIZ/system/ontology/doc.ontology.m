<?xml version="1.0" encoding="utf-8"?>

<model xmlns="http://www.justep.com/model">  
  <relation name="sDocName" data-type="String" single-valued="true"> 
    <label language="zh_CN">文件名称</label> 
  </relation>  
  <relation name="sDocPath" data-type="String" single-valued="true"> 
    <label language="zh_CN">文件id路径</label> 
  </relation>  
  <relation name="sFileID" data-type="String" single-valued="true"> 
    <label language="zh_CN">文档服务器的文件引用标识</label> 
  </relation>  
  <relation name="sParentID" data-type="SA_DocNode" single-valued="true" inverse-of="sChildrenID"> 
    <label language="zh_CN">节点父标识</label> 
  </relation>  
  <relation name="sChildrenID" data-type="SA_DocNode" single-valued="false" inverse-of="sParentID"> 
    <label language="zh_CN">子节点</label> 
  </relation>  
  <relation name="sSize" data-type="Decimal" single-valued="true"> 
    <label language="zh_CN">文件大小</label> 
  </relation>  
  <relation name="sDocDisplayPath" data-type="String" single-valued="true"> 
    <label language="zh_CN">文件路径</label> 
  </relation>  
  <!-- <relation name="sCreatorFID" data-type="String" single-valued="true">
    <label language="zh_CN">创建人标志</label>
  </relation> -->  
  <!--  
  <relation name="sCreatorDeptName" data-type="String" single-valued="true">
    <label language="zh_CN">创建人部门</label>
  </relation>
  -->  
  <relation name="sEditorFID" data-type="String" single-valued="true"> 
    <label language="zh_CN">编辑人标识</label> 
  </relation>  
  <relation name="sEditorName" data-type="String" single-valued="true"> 
    <label language="zh_CN">编辑人姓名</label> 
  </relation>  
  <relation name="sEditorDeptName" data-type="String" single-valued="true"> 
    <label language="zh_CN">编辑人部门</label> 
  </relation>  
  <relation name="sLastWriterFID" data-type="String" single-valued="true"> 
    <label language="zh_CN">最后修改人标识</label> 
  </relation>  
  <relation name="sLastWriterName" data-type="String" single-valued="true"> 
    <label language="zh_CN">最后修改人</label> 
  </relation>  
  <relation name="sLastWriterDeptName" data-type="String" single-valued="true"> 
    <label language="zh_CN">最后修改人部门</label> 
  </relation>  
  <relation name="sLastWriteTime" data-type="DateTime" single-valued="true"> 
    <label language="zh_CN">最后修改时间</label> 
  </relation>  
  <relation name="sDocLiveVersionID" data-type="Integer" single-valued="true"> 
    <label language="zh_CN">文档当前版本标志</label> 
  </relation>  
  <relation name="sDocSerialNumber" data-type="String" single-valued="true"> 
    <label language="zh_CN">文件编号</label> 
  </relation>  
  <relation name="sKeywords" data-type="String" single-valued="true"> 
    <label language="zh_CN">关键字</label> 
  </relation>  
  <relation name="sClassification" data-type="String" single-valued="true"> 
    <label language="zh_CN">文件类别</label> 
  </relation>  
  <relation name="sNameSpace" data-type="String" single-valued="true"> 
    <label language="zh_CN">名空间</label> 
  </relation>  
  <relation name="sFlag" data-type="String" single-valued="true"> 
    <label language="zh_CN">删除标示</label> 
  </relation>  
  <!-- <relation name="sProcess" data-type="String" single-valued="true">
    <label language="zh_CN">process名称</label>
  </relation> -->  
  <!-- <relation name="sActivity" data-type="String" single-valued="true">
    <label language="zh_CN">activity名称</label>
  </relation> -->  
  <relation name="sPersonFID" data-type="String" single-valued="true"> 
    <label language="zh_CN">组织机构</label> 
  </relation>  
  <relation name="sDeptName" data-type="String" single-valued="true"> 
    <label language="zh_CN">部门名称</label> 
  </relation>  
  <relation name="sPersonName" data-type="String" single-valued="true"> 
    <label language="zh_CN">人员名称</label> 
  </relation>  
  <relation name="sSubPath" data-type="String" single-valued="true"> 
    <label language="zh_CN">子文件夹</label> 
  </relation>  
  <relation name="sRootPath" data-type="String" single-valued="true"> 
    <label language="zh_CN">根文件夹路径</label> 
  </relation>  
  <relation name="sRootName" data-type="String" single-valued="true"> 
    <label language="zh_CN">根文件夹名称</label> 
  </relation>  
  <relation name="sDocLinkDefineID" data-type="String" single-valued="true"> 
    <label language="zh_CN">文档关联定义标识</label> 
  </relation>  
  <relation name="sShowChildren" data-type="String" single-valued="true"> 
    <label language="zh_CN">是否关联子目录</label> 
  </relation>  
  <!-- <relation name="sAccess" data-type="Integer" single-valued="true">
    <label language="zh_CN">附件访问权限</label>
  </relation> -->  
  <relation name="sDisplayName" data-type="String" single-valued="true"> 
    <label language="zh_CN">编码显示名</label> 
  </relation>  
  <!-- <relation name="sKind" data-type="String" single-valued="true">
    <label language="zh_CN">任务类型种类</label>
  </relation> -->  
  <!--  
  <relation name="sCreatorName" data-type="String" single-valued="true">
    <label language="zh_CN">创建人姓名</label>
  </relation>
  -->  
  <concept name="SA_DocNode" default-value-expr="guid()"> 
    <has-relation relation="sParentID" data-type="SA_DocNode"/>  
    <has-relation relation="sChildrenID" data-type="SA_DocNode" part="true"/>  
    <has-relation relation="sDocName"/>  
    <has-relation relation="sSequence" data-type="String">
      <label language="zh_CN">序号</label>
    </has-relation>  
    <has-relation relation="sSize" data-type="Float"/>  
    <has-relation relation="sKind"/>  
    <has-relation relation="sDocPath"/>  
    <has-relation relation="sDocDisplayPath"/>  
    <has-relation relation="sCreatorFID"/>  
    <has-relation relation="sCreatorName"/>  
    <has-relation relation="sCreatorDeptName"/>  
    <has-relation relation="sCreateTime" default-value-expr="currentDateTime()" data-type="DateTime"/>  
    <has-relation relation="sEditorFID"/>  
    <has-relation relation="sEditorName"/>  
    <has-relation relation="sEditorDeptName"/>  
    <has-relation relation="sLastWriterFID"/>  
    <has-relation relation="sLastWriterName"/>  
    <has-relation relation="sLastWriterDeptName"/>  
    <has-relation relation="sLastWriteTime" default-value-expr="currentDateTime()"/>  
    <has-relation relation="sFileID"/>  
    <has-relation relation="sDescription"/>  
    <has-relation relation="sDocLiveVersionID"/>  
    <has-relation relation="sDocSerialNumber"/>  
    <has-relation relation="sKeywords"/>  
    <has-relation relation="sClassification"/>  
    <has-relation relation="sFinishTime"/>  
    <has-relation relation="sNameSpace"/>  
    <has-relation relation="sFlag" data-type="Integer"/>  
    <has-relation relation="version" default-value-expr="0"/>  
    <label language="zh_CN">文档</label>  
    <has-relation relation="sCacheName" data-type="String"/>  
    <has-relation relation="sRevisionCacheName" data-type="String"/> 
  </concept>  
  <!--<concept name="SA_DOCCODE">
    <has-relation relation="sParentID" data-type="SA_DOCCODE"/>
    <has-relation relation="sChildrenID" data-type="SA_DOCCODE"/>
    <has-relation relation="version" default-value-expr="0"/>
    <has-relation relation="sDisplayName"/>
    <has-relation relation="sScope"/>
  </concept>-->  
  <relation name="sAuthorizerFID" data-type="String" single-valued="true"> 
    <label language="zh_CN">授权人标识</label> 
  </relation>  
  <relation name="sAuthorizerName" data-type="String" single-valued="true"> 
    <label language="zh_CN">授权人姓名</label> 
  </relation>  
  <relation name="sAuthorizerDeptName" data-type="String" single-valued="true"> 
    <label language="zh_CN">授权人部门名称</label> 
  </relation>  
  <relation name="sAuthorizeeFID" data-type="String" single-valued="true"> 
    <label language="zh_CN">被授权人标识</label> 
  </relation>  
  <relation name="sAuthorizeeName" data-type="String" single-valued="true"> 
    <label language="zh_CN">被授权人姓名</label> 
  </relation>  
  <relation name="sAuthorizeeDeptName" data-type="String" single-valued="true"> 
    <label language="zh_CN">被授权人部门名称</label> 
  </relation>  
  <relation name="sGrantTime" data-type="DateTime" single-valued="true"> 
    <label language="zh_CN">授权时间</label> 
  </relation>  
  <relation name="sAccess" data-type="Integer" single-valued="true"> 
    <label language="zh_CN">权限类型，读， 打印， 写，删除</label> 
  </relation>  
  <relation name="sLimitSize" data-type="Decimal" single-valued="true"> 
    <label language="zh_CN">限定大小</label> 
  </relation>  
  <relation name="sScope" data-type="String" single-valued="true"> 
    <label language="zh_CN">范围：私有 共享</label> 
  </relation>  
  <concept name="SA_DocAuth" default-value-expr="guid()"> 
    <has-relation relation="sDocPath"/>  
    <has-relation relation="sAuthorizerFID" default-value-expr="currentPersonMemberFID()"/>  
    <has-relation relation="sAuthorizerName"/>  
    <has-relation relation="sAuthorizerDeptName"/>  
    <has-relation relation="sAuthorizeeFID"/>  
    <has-relation relation="sAuthorizeeName"/>  
    <has-relation relation="sAuthorizeeDeptName"/>  
    <has-relation relation="sGrantTime" default-value-expr="currentDateTime()"/>  
    <has-relation relation="sAccess" default-value-expr="1"/>  
    <has-relation relation="sScope"/>  
    <has-relation relation="version" default-value-expr="0"/>  
    <label language="zh_CN">文档权限</label> 
  </concept>  
  <relation name="sOwnerID" data-type="String" single-valued="true"> 
    <label language="zh_CN">业务单据编码</label> 
  </relation>  
  <relation name="sDocID" data-type="String" single-valued="true"> 
    <label language="zh_CN">文档节点引用标识</label> 
  </relation>  
  <concept name="SA_DocLink"> 
    <has-relation relation="sOwnerID"/>  
    <has-relation relation="sDocID" data-type="SA_DocNode"/>  
    <has-relation relation="version" default-value-expr="0"/>  
    <has-relation relation="sActivity"/>  
    <has-relation relation="sProcess"/>  
    <label language="zh_CN">文档关联</label> 
  </concept>  
  <concept name="SA_DocLinkDefine" default-value-expr="guid()"> 
    <has-relation relation="sRootPath"/>  
    <has-relation relation="sRootName"/>  
    <has-relation relation="sProcess"/>  
    <has-relation relation="sActivity"/>  
    <has-relation relation="sPersonFID"/>  
    <has-relation relation="sDeptName"/>  
    <has-relation relation="sPersonName"/>  
    <has-relation relation="sSubPath"/>  
    <has-relation relation="sAccess" default-value-expr="1"/>  
    <has-relation relation="sLimitSize" default-value-expr="0.0"/>  
    <has-relation relation="sShowChildren"/>  
    <has-relation relation="version" default-value-expr="0"/>  
    <label language="zh_CN">文档关联定义</label>  
    <has-relation relation="sDefineItems" data-type="Text">
      <label language="zh_CN">文档关联定义</label> 
    </has-relation>  
    <has-relation relation="sDisplayName">
      <label language="zh_CN">关联名</label> 
    </has-relation> 
  </concept>  
    
    
  <relation name="sFieldID" data-type="String" single-valued="true"> 
    <label language="zh_CN">域标识</label> 
  </relation>  
  <relation name="sFieldName" data-type="String" single-valued="true"> 
    <label language="zh_CN">域名称</label> 
  </relation>  
    
  <relation name="sTime" data-type="DateTime" single-valued="true"> 
    <label language="zh_CN">访问时间</label> 
  </relation>  
  <relation name="sAccessType" data-type="String" single-valued="true"> 
    <label language="zh_CN">访问类型：下载，修改</label> 
  </relation>  
  <relation name="sDocVersionID" data-type="Integer" single-valued="true"> 
    <label language="zh_CN">文档版本号</label> 
  </relation>  
  <!-- <relation name="sPerson" data-type="String" single-valued="true">
    <label language="zh_CN">操作员</label>
  </relation> -->  
  <concept name="SA_DocLog"> 
    <has-relation relation="sDocID"/>  
    <has-relation relation="sPersonFID" default-value-expr="currentPersonMemberFID()"/>  
    <has-relation relation="sPersonName" default-value-expr="currentPersonMemberName()"/>  
    <has-relation relation="sDeptName"/>  
    <has-relation relation="sTime" default-value-expr="currentDateTime()"/>  
    <has-relation relation="sAccessType"/>  
    <has-relation relation="sDocName"/>  
    <has-relation relation="sDocVersionID" default-value-expr="1"/>  
    <has-relation relation="sSize" data-type="Float"/>  
    <has-relation relation="version" default-value-expr="0"/>  
    <label language="zh_CN">文档日志</label> 
  </concept>  
  <relation name="sHost" data-type="String" single-valued="true"> 
    <label language="zh_CN">主机地址</label> 
  </relation>  
  <relation name="sPort" data-type="Integer" single-valued="true"> 
    <label language="zh_CN">端口号</label> 
  </relation>  
  <concept name="SA_DocNameSpace" default-value-expr="guid()"> 
    <has-relation relation="sDisplayName"/>  
    <has-relation relation="sHost"/>  
    <has-relation relation="sPort"/>  
    <has-relation relation="sFlag" data-type="Integer"/>  
    <has-relation relation="version" default-value-expr="0"/>  
    <label language="zh_CN">文档名空间</label>  
    <has-relation relation="sAccessMode" data-type="String">
      <label language="zh_CN">访问模式</label> 
    </has-relation>  
    <has-relation relation="sUrl" data-type="String" required="false"/> 
  </concept>  
  <relation name="sDefineItems" data-type="Text">
    <label language="zh_CN">文档关联定义</label> 
  </relation>  
  <relation name="sAccessMode" data-type="String">
    <label language="zh_CN">访问模式</label> 
  </relation>  
  <relation name="sCacheName" data-type="String">
    <label language="zh_CN">文档缓存文件名</label> 
  </relation>  
  <relation name="sRevisionCacheName" data-type="String">
    <label language="zh_CN">文档修订版缓存文件名</label> 
  </relation>  
  <relation name="sUrl" data-type="String">
    <label language="zh_CN">文档服务器地址</label> 
  </relation> 
</model>
