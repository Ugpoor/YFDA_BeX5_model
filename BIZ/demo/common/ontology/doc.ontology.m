<?xml version="1.0" encoding="utf-8"?>

<model xmlns="http://www.justep.com/model">  
  <relation name="fDocType" data-type="String" single-valued="true" size="32"> 
    <label language="zh_CN">类型</label> 
  </relation>  
  <relation name="fDocTypeName" data-type="String" single-valued="true" size="64"> 
    <label language="zh_CN">类型</label> 
  </relation>  
  <relation name="fDocNumber" data-type="String" single-valued="true" size="32"> 
    <label language="zh_CN">文号</label> 
  </relation>  
  <relation name="fSourceDept" data-type="String" single-valued="true" size="64"> 
    <label language="zh_CN">来文单位</label> 
  </relation>  
  <relation name="fSourceNumber" data-type="String" single-valued="true" size="32"> 
    <label language="zh_CN">来文字号</label> 
  </relation>  
  <relation name="fDocExigenceLevel" data-type="String" single-valued="true" size="32"> 
    <label language="zh_CN">紧急程度</label> 
  </relation>  
  <relation name="fDocExigenceLevelName" data-type="String" single-valued="true"
    size="64"> 
    <label language="zh_CN">紧急程度</label> 
  </relation>  
  <relation name="fDocKind" data-type="String" single-valued="true" size="32"> 
    <label language="zh_CN">文种</label> 
  </relation>  
  <relation name="fDocKindName" data-type="String" single-valued="true" size="64"> 
    <label language="zh_CN">文种</label> 
  </relation>  
  <relation name="fSendDirect" data-type="String" single-valued="true" size="32"> 
    <label language="zh_CN">行文方向</label> 
  </relation>  
  <relation name="fSendDirectName" data-type="String" single-valued="true" size="64"> 
    <label language="zh_CN">行文方向</label> 
  </relation>  
  <relation name="fDocSecretLevel" data-type="String" single-valued="true" size="32"> 
    <label language="zh_CN">公文密级</label> 
  </relation>  
  <relation name="fDocSecretLevelName" data-type="String" single-valued="true" size="64"> 
    <label language="zh_CN">公文密级</label> 
  </relation>  
  <relation name="fSecretYear" data-type="Integer" single-valued="true"> 
    <label language="zh_CN">保密年</label> 
  </relation>  
  <relation name="fSecretMonth" data-type="Integer" single-valued="true"> 
    <label language="zh_CN">保密月</label> 
  </relation>  
  <relation name="fIssueDate" data-type="Date" single-valued="true"> 
    <label language="zh_CN">发文日期</label> 
  </relation>  
  <relation name="fReceiveDate" data-type="Date" single-valued="true"> 
    <label language="zh_CN">收文日期</label> 
  </relation>  
  <relation name="fCopies" data-type="Integer" single-valued="true"> 
    <label language="zh_CN">份数</label> 
  </relation>  
  <relation name="fPages" data-type="Integer" single-valued="true"> 
    <label language="zh_CN">页数</label> 
  </relation>  
  <relation name="fMainDestDept" data-type="String" single-valued="true" size="64"> 
    <label language="zh_CN">主送单位</label> 
  </relation>  
  <relation name="fCopyDestDept" data-type="String" single-valued="true" size="64"> 
    <label language="zh_CN">抄送单位</label> 
  </relation>  
  <relation name="fContent" data-type="Text" single-valued="true"> 
    <label language="zh_CN">内容</label> 
  </relation>  
  <relation name="fSignOpinion" data-type="Text" single-valued="true"> 
    <label language="zh_CN">签发意见</label> 
  </relation>  
  <relation name="fPlanOpinion" data-type="Text" single-valued="true"> 
    <label language="zh_CN">拟办意见</label> 
  </relation>  
  <relation name="fUndertakeResult" data-type="Text" single-valued="true"> 
    <label language="zh_CN">承办结果</label> 
  </relation>  
  <relation name="fDraftPerName" data-type="String" single-valued="true" size="64"> 
    <label language="zh_CN">拟稿人</label> 
  </relation>  
  <relation name="fDraftTime" data-type="DateTime" single-valued="true"> 
    <label language="zh_CN">拟稿时间</label> 
  </relation>  
  <relation name="fCheckPerName" data-type="String" single-valued="true" size="64"> 
    <label language="zh_CN">核稿人</label> 
  </relation>  
  <relation name="fCheckTime" data-type="DateTime" single-valued="true"> 
    <label language="zh_CN">核稿时间</label> 
  </relation>  
  <relation name="fSignPerName" data-type="String" single-valued="true" size="64"> 
    <label language="zh_CN">签发人</label> 
  </relation>  
  <relation name="fSignTime" data-type="DateTime" single-valued="true"> 
    <label language="zh_CN">签发时间</label> 
  </relation>  
  <relation name="fRegPerName" data-type="String" single-valued="true" size="64"> 
    <label language="zh_CN">登记人</label> 
  </relation>  
  <relation name="fRegTime" data-type="DateTime" single-valued="true"> 
    <label language="zh_CN">登记时间</label> 
  </relation>  
  <relation name="fPlanPerName" data-type="String" single-valued="true" size="64"> 
    <label language="zh_CN">拟办人</label> 
  </relation>  
  <relation name="fPlanTime" data-type="DateTime" single-valued="true"> 
    <label language="zh_CN">拟办时间</label> 
  </relation>  
  <relation name="fUndertakePerName" data-type="String" single-valued="true" size="64"> 
    <label language="zh_CN">承办人</label> 
  </relation>  
  <relation name="fUndertakeTime" data-type="DateTime" single-valued="true"> 
    <label language="zh_CN">承办时间</label> 
  </relation>  
  <relation name="fAssistant" data-type="Text" single-valued="true"> 
    <label language="zh_CN">协办</label> 
  </relation>  
  <concept name="DEMO_DocKind" default-value-expr="guid()"> 
    <has-relation relation="version" default-value-expr="0"/>  
    <label language="zh_CN">公文文种</label>  
    <has-relation relation="fCode"/>  
    <has-relation relation="fName"/>  
    <has-relation relation="fSequence"/> 
  </concept>  
  <concept name="DEMO_ExigenceLevel" default-value-expr="guid()"> 
    <has-relation relation="version" default-value-expr="0"/>  
    <label language="zh_CN">紧急程度</label>  
    <has-relation relation="fCode"/>  
    <has-relation relation="fName"/>  
    <has-relation relation="fSequence"/> 
  </concept>  
  <concept name="DEMO_SecretLevel" default-value-expr="guid()"> 
    <has-relation relation="version" default-value-expr="0"/>  
    <label language="zh_CN">密级</label>  
    <has-relation relation="fCode"/>  
    <has-relation relation="fName"/>  
    <has-relation relation="fSequence"/> 
  </concept>  
  <concept name="DEMO_SendDirect" default-value-expr="guid()"> 
    <has-relation relation="version" default-value-expr="0"/>  
    <label language="zh_CN">行文方向</label>  
    <has-relation relation="fCode"/>  
    <has-relation relation="fName"/>  
    <has-relation relation="fSequence"/> 
  </concept>  
  <concept name="DEMO_Doc" default-value-expr="guid()"> 
    <has-relation relation="version" default-value-expr="0"/>  
    <label language="zh_CN">公文</label>  
    <has-relation relation="fDocType"/>  
    <has-relation relation="fDocTypeName"/>  
    <has-relation relation="fTitle"/>  
    <has-relation relation="fKeyword"/>  
    <has-relation relation="fDocNumber"/>  
    <has-relation relation="fSourceDept"/>  
    <has-relation relation="fSourceNumber"/>  
    <has-relation relation="fDocExigenceLevel"/>  
    <has-relation relation="fDocExigenceLevelName"/>  
    <has-relation relation="fDocKind"/>  
    <has-relation relation="fDocKindName"/>  
    <has-relation relation="fSendDirect"/>  
    <has-relation relation="fSendDirectName"/>  
    <has-relation relation="fDocSecretLevel"/>  
    <has-relation relation="fDocSecretLevelName"/>  
    <has-relation relation="fSecretYear"/>  
    <has-relation relation="fSecretMonth"/>  
    <has-relation relation="fIssueDate"/>  
    <has-relation relation="fReceiveDate"/>  
    <has-relation relation="fCopies"/>  
    <has-relation relation="fPages"/>  
    <has-relation relation="fMainDestDept"/>  
    <has-relation relation="fCopyDestDept"/>  
    <has-relation relation="fContent"/>  
    <has-relation relation="fSignOpinion"/>  
    <has-relation relation="fPlanOpinion"/>  
    <has-relation relation="fUndertakeResult"/>  
    <has-relation relation="fDraftPerName"/>  
    <has-relation relation="fDraftTime"/>  
    <has-relation relation="fCheckPerName"/>  
    <has-relation relation="fCheckTime"/>  
    <has-relation relation="fSignPerName"/>  
    <has-relation relation="fSignTime"/>  
    <has-relation relation="fRegPerName"/>  
    <has-relation relation="fRegTime"/>  
    <has-relation relation="fPlanPerName"/>  
    <has-relation relation="fPlanTime"/>  
    <has-relation relation="fUndertakePerName"/>  
    <has-relation relation="fUndertakeTime"/>  
    <has-relation relation="fAssistant"/>  
    <has-relation relation="fCreateTime"/>  
    <has-relation relation="fCreatorPsnID"/>  
    <has-relation relation="fCreatorPsnName"/>  
    <has-relation relation="fCreatorFullID"/>  
    <has-relation relation="fCreatorFullName"/>  
    <has-relation relation="fUpdateTime"/>  
    <has-relation relation="fUpdatorPsnID"/>  
    <has-relation relation="fUpdatorPsnName"/>  
    <has-relation relation="fBizState" default-value-expr="'bsEditing'"/>  
    <has-relation relation="fBizStateName" default-value-expr="'编辑中'"/>  
    <has-relation relation="fAttachment"/> 
  </concept> 
</model>
