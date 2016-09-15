<?xml version="1.0" encoding="utf-8"?>

<model xmlns="http://www.justep.com/model">
  <relation name="fOrderCode" data-type="String" single-valued="true">
    <label language="zh_CN">订单编号</label>
  </relation>
  
  <relation name="fCustomerID" data-type="DEMO_Custemor" single-valued="true">
    <label language="zh_CN">客户ID</label>
  </relation>
  
  <relation name="fEmploueeID" data-type="SA_OPPerson" single-valued="true">
    <label language="zh_CN">雇员ID</label>
  </relation>
  
  <relation name="fRequiredDate" data-type="Date" single-valued="true">
    <label language="zh_CN">到货日期</label>
  </relation>
 
  <relation name="fShippedDate" data-type="Date" single-valued="true">
    <label language="zh_CN">发货日期</label>
  </relation>
   
  <relation name="fOrderDate" data-type="Date" single-valued="true">
    <label language="zh_CN">订购日期</label>
  </relation>
  
  <relation name="fReportID" data-type="String" single-valued="true">
    <label language="zh_CN">申请人</label>
  </relation>
  
  <relation name="fReporedDate" data-type="Date" single-valued="true">
    <label language="zh_CN">申请日期</label>
  </relation>
 
  <relation name="fAuditorID" data-type="SA_OPPerson" single-valued="true">
    <label language="zh_CN">主管审核</label>
  </relation>
  
  <relation name="fAuditorIsArgee" data-type="String" single-valued="true">
    <label language="zh_CN">是否同意</label>
  </relation>
 
  <relation name="fAuditor" data-type="String" single-valued="true">
    <label language="zh_CN">审核意见</label>
  </relation>
 
  <relation name="fAuditorDate" data-type="Date" single-valued="true">
    <label language="zh_CN">审核日期</label>
  </relation>
 
  <relation name="fExamineID" data-type="SA_OPPerson" single-valued="true">
    <label language="zh_CN">领导审批</label>
  </relation>
 
  <relation name="fExamine" data-type="String" single-valued="true">
    <label language="zh_CN">审批意见</label>
  </relation>
 
  <relation name="fExamineDate" data-type="Date" single-valued="true">
    <label language="zh_CN">审批日期</label>
  </relation>
 
  <concept name="DEMO_Order" default-value-expr="guid()">
    <has-relation relation="version" default-value-expr="0"/>
    <label language="zh_CN">订单主表</label>    
    <has-relation relation="fOrderCode" default-value-expr="createSerialNumberByCurrentDate()">
      <label language="zh_CN">订单编号</label>
    </has-relation>
    <has-relation relation="fCustomerID">
      <label language="zh_CN">客户ID</label>
    </has-relation>
    <has-relation relation="fRequiredDate"/>
    <has-relation relation="fShippedDate"/>
    <has-relation relation="fOrderDate"/>
    <has-relation relation="fReportID" default-value-expr="currentPersonMemberName()"/>
    <has-relation relation="fReporedDate"/>
    <has-relation relation="fAuditorID"/>
    <has-relation relation="fAuditorIsArgee"/>
    <has-relation relation="fAuditor"/>
    <has-relation relation="fAuditorDate"/>
    <has-relation relation="fExamineID"/>
    <has-relation relation="fExamine"/>
    <has-relation relation="fExamineDate"/>
    <has-relation relation="fExamineIsArgee"/>
    <has-relation relation="fEmploueeName"/>
    <has-relation relation="fCustomerName"/>
    <has-relation relation="fTolotalAmt" data-type="Decimal"/>
    <has-relation relation="fEmploueeID"/>
    <has-relation relation="fAuditorName"/>
    <has-relation relation="fExamineName"/>
    <has-relation relation="fPicture"/>
  </concept>
  
  <relation name="fExamineIsArgee" data-type="String" single-valued="true">
    <label language="zh_CN">是否同意</label>
  </relation>
  
  <relation name="fProductCode" data-type="String" single-valued="true">
    <label language="zh_CN">产品编码</label>
  </relation>
 
  <relation name="fUnitprice" data-type="Decimal" single-valued="true">
    <label language="zh_CN">单价</label>
  </relation>
 
  <relation name="fQuantity" data-type="Integer" single-valued="true">
    <label language="zh_CN">数量</label>
  </relation>
  
  <relation name="fDisCount" data-type="Decimal" single-valued="true">
    <label language="zh_CN">折扣</label>
  </relation>

  <concept name="DEMO_OrderDetail" default-value-expr="guid()">
    <has-relation relation="version" default-value-expr="0"/>
    <label language="zh_CN">订单明细表</label>
    <has-relation relation="fProductCode" data-type="DEMO_Product"/>
    <has-relation relation="fUnitprice"/>
    <has-relation relation="fQuantity"/>
    <has-relation relation="fDisCount"/>
    <has-relation relation="fFactAmt"/>
    <has-relation relation="fProductName"/>
    <has-relation relation="fOrderID"/>
  </concept>
 
  <relation name="fCustomerName" data-type="String" single-valued="true">
    <label language="zh_CN">客户名称</label>
  </relation>

  <relation name="fCustomerLevel" data-type="String" single-valued="true">
    <label language="zh_CN">客户级别</label>
  </relation>
 
  <concept name="DEMO_Custemor" default-value-expr="guid()">
    <has-relation relation="version" default-value-expr="0"/>
    <label language="zh_CN">客户基本信息</label>
    <has-relation relation="fCustomerName"/>
    <has-relation relation="fCustomerLevel"/>
    <has-relation relation="fCustomerCode"/>
    <has-relation relation="fID"/>
  </concept>
 
  <relation name="fProductName" data-type="String" single-valued="true">
    <label language="zh_CN">产品名称</label>
  </relation>
 
  <relation name="fPpercModel" data-type="String" single-valued="true">
    <label language="zh_CN">规格型号</label>
  </relation>
 
  <concept name="DEMO_Product" default-value-expr="guid()">
    <has-relation relation="version" default-value-expr="0"/>
    <label language="zh_CN">产品表</label>
    <has-relation relation="fProductName"/>
    <has-relation relation="fPpercModel"/>
    <has-relation relation="fProductCode"/>
    <has-relation relation="fUnitName">
      <label language="zh_CN">计量单位</label>
    </has-relation>
    <has-relation relation="fUnitprice"/>
    <has-relation relation="fDisCount">
      <label language="zh_CN">折扣率</label>
    </has-relation>
    <has-relation relation="fID"/>
  </concept>
  
  <relation name="fFactAmt" data-type="Decimal" single-valued="true">
    <label language="zh_CN">实际金额</label>
  </relation>
  
  <relation name="fOrderID" data-type="DEMO_Order" single-valued="true">
    <label language="zh_CN">订单ID</label>
  </relation>
  
  <relation name="fEmploueeName" data-type="String" single-valued="true">
    <label language="zh_CN">雇员名称</label>
  </relation>
  
  <relation name="fCustomerCode" data-type="String" single-valued="true">
    <label language="zh_CN">客户编码</label>
  </relation>
  
  <relation name="fTolotalAmt" data-type="Decimal" single-valued="true">
    <label language="zh_CN">总金额</label>
  </relation>
  
  <relation name="fAuditorName" data-type="String" single-valued="true">
    <label language="zh_CN">主管审核</label>
  </relation>
 
  <relation name="fExamineName" data-type="String" single-valued="true">
    <label language="zh_CN">领导审批</label>
  </relation>
 
  <relation name="fPicture" data-type="String" single-valued="true">
    <label language="zh_CN">图片</label>
  </relation>
</model>
