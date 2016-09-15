<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window" component="$UI/system/components/justep/window/window"
  design="device:pc">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="width:276px;height:auto;left:481px;top:173px;"
    onLoad="modelLoad"> 
    <div component="$UI/system/components/justep/data/bizData" autoLoad="false"
      xid="dAttachment_Editor_Single" concept="DEMO_Attachment"> 
      <reader xid="default2" action="/demo/common/logic/action/queryDEMO_AttachmentAction"/>  
      <writer xid="default3" action="/demo/common/logic/action/saveDEMO_AttachmentAction"/>  
      <creator xid="default4" action="/demo/common/logic/action/createDEMO_AttachmentAction"/> 
    <filter name="filter1" xid="filter2"><![CDATA[DEMO_Attachment = 'Attachment_Editor_Single']]></filter></div>  
    <div component="$UI/system/components/justep/data/bizData" autoLoad="false"
      xid="dAttachment_Editor_Multi" concept="DEMO_Attachment"> 
      <reader xid="default5" action="/demo/common/logic/action/queryDEMO_AttachmentAction"/>  
      <writer xid="default6" action="/demo/common/logic/action/saveDEMO_AttachmentAction"/>  
      <creator xid="default7" action="/demo/common/logic/action/createDEMO_AttachmentAction"/> 
    <filter name="filter2" xid="filter3"><![CDATA[DEMO_Attachment = 'Attachment_Editor_Multi']]></filter></div>  
    <div component="$UI/system/components/justep/data/bizData" autoLoad="false"
      xid="dAttachment_Define" concept="DEMO_Attachment">
      <reader xid="default9" action="/demo/common/logic/action/queryDEMO_AttachmentAction"/>  
      <writer xid="default10" action="/demo/common/logic/action/saveDEMO_AttachmentAction"/>  
      <creator xid="default11" action="/demo/common/logic/action/createDEMO_AttachmentAction"/>
    <filter name="filter4" xid="filter5"><![CDATA[DEMO_Attachment = 'Attachment_Define']]></filter></div>  
    <div component="$UI/system/components/justep/data/bizData" autoLoad="false"
      xid="dAttachment_Template" concept="DEMO_Attachment">
      <reader xid="default13" action="/demo/common/logic/action/queryDEMO_AttachmentAction"/>  
      <writer xid="default14" action="/demo/common/logic/action/saveDEMO_AttachmentAction"/>  
      <creator xid="default15" action="/demo/common/logic/action/createDEMO_AttachmentAction"/>
    <filter name="filter5" xid="filter6"><![CDATA[DEMO_Attachment = 'Attachment_Template']]></filter></div>  
    <div component="$UI/system/components/justep/data/bizData" autoLoad="false"
      xid="dAttachment_Extend_Style" concept="DEMO_Attachment">
      <reader xid="default17" action="/demo/common/logic/action/queryDEMO_AttachmentAction"/>  
      <writer xid="default18" action="/demo/common/logic/action/saveDEMO_AttachmentAction"/>  
      <creator xid="default19" action="/demo/common/logic/action/createDEMO_AttachmentAction"/>
    <filter name="filter6" xid="filter7"><![CDATA[DEMO_Attachment = 'Attachment_Extend_Style']]></filter></div>  
    <div component="$UI/system/components/justep/data/bizData" autoLoad="false"
      xid="dAttachment_Extend_Permission" concept="DEMO_Attachment">
      <reader xid="default20" action="/demo/common/logic/action/queryDEMO_AttachmentAction"/>  
      <writer xid="default21" action="/demo/common/logic/action/saveDEMO_AttachmentAction"/>  
      <creator xid="default22" action="/demo/common/logic/action/createDEMO_AttachmentAction"/>
    </div>  
    <div component="$UI/system/components/justep/data/data" autoLoad="true"
      xid="dRadio" idColumn="value">
      <column name="value" type="String" xid="xid2"/>  
      <column name="label" type="String" xid="xid3"/>  
      <data xid="default24">[{"value":"7","label":"7:下载"},{"value":"263","label":"263:下载 上传"},{"value":"775","label":"775:下载 上传 修改"},{"value":"1799","label":"1799:下载 上传 修改 删除"}]</data>
    </div>
    <div component="$UI/system/components/justep/data/data" autoLoad="false"
      xid="dTemp" idColumn="access" autoNew="true" onValueChanged="dTempValueChanged">
      <column name="access" type="String" xid="xid1"/>
    </div>  
    <div component="$UI/system/components/justep/data/bizData" autoLoad="false"
      xid="dAttachment_Extend_LimitUpload" concept="DEMO_Attachment">
      <reader xid="default26" action="/demo/common/logic/action/queryDEMO_AttachmentAction"/>  
      <writer xid="default27" action="/demo/common/logic/action/saveDEMO_AttachmentAction"/>  
      <creator xid="default28" action="/demo/common/logic/action/createDEMO_AttachmentAction"/>
    </div>  
    <div component="$UI/system/components/justep/data/bizData" autoLoad="true" xid="dAttachment_Image" concept="DEMO_Attachment">
   <reader xid="default38" action="/demo/common/logic/action/queryDEMO_AttachmentAction"></reader>
   <writer xid="default39" action="/demo/common/logic/action/saveDEMO_AttachmentAction"></writer>
   <creator xid="default40" action="/demo/common/logic/action/createDEMO_AttachmentAction"></creator>
  <filter name="filter3" xid="filter4"><![CDATA[DEMO_Attachment = 'Attachment_Image']]></filter></div><div component="$UI/system/components/justep/data/bizData" autoLoad="false"
      xid="dAttachment_Extend_SetTemplate" concept="DEMO_Attachment">
      <reader xid="default30" action="/demo/common/logic/action/queryDEMO_AttachmentAction"/>  
      <writer xid="default31" action="/demo/common/logic/action/saveDEMO_AttachmentAction"/>  
      <creator xid="default32" action="/demo/common/logic/action/createDEMO_AttachmentAction"/>
    </div>
  <div component="$UI/system/components/justep/data/bizData" autoLoad="true" xid="dBlobImage" concept="DEMO_Attachment"><reader xid="default41" action="/demo/common/logic/action/queryDEMO_AttachmentAction"></reader>
  <writer xid="default42" action="/demo/common/logic/action/saveDEMO_AttachmentAction"></writer>
  <creator xid="default43" action="/demo/common/logic/action/createDEMO_AttachmentAction"></creator>
  <filter name="filter0" xid="filter1"><![CDATA[DEMO_Attachment = 'BlobImage']]></filter></div>
  <div component="$UI/system/components/justep/data/bizData" autoLoad="false" xid="dAttachment_Extend_SetTemplate_Temp" concept="DEMO_Attachment">
   <reader xid="default33" action="/demo/common/logic/action/queryDEMO_AttachmentAction"></reader>
   <writer xid="default34" action="/demo/common/logic/action/saveDEMO_AttachmentAction"></writer>
   <creator xid="default35" action="/demo/common/logic/action/createDEMO_AttachmentAction"></creator></div></div>  
  <div component="$UI/system/components/bootstrap/tabs/tabs" xid="tabPanelMain"> 
    <ul class="nav nav-tabs" xid="ul1"> 
      <li class="active" xid="li9"> 
        <a content="tabContent1" xid="tabInit" bind-visible="!$model.tabItemVisible()"><![CDATA[初始化]]></a> 
      </li>  
      <li role="presentation" xid="li10"> 
        <a content="tabContent2" xid="tabMain" bind-visible="$model.tabItemVisible()"><![CDATA[附件组件]]></a> 
      </li>  
      <li xid="li11" bind-click="li11Click"> 
        <a content="tabContent3" xid="tabDefine" bind-visible="$model.tabItemVisible()"><![CDATA[文档关联与模板填充]]></a> 
      </li>  
      <li xid="li12" bind-click="li12Click"> 
        <a content="tabContent4" xid="tabExtend" bind-visible="$model.tabItemVisible()"><![CDATA[编程扩展]]></a> 
      </li> 
    </ul>  
    <div class="tab-content" xid="div27"> 
      <div class="tab-pane active" xid="tabContent1"> 
        <div xid="div3" style="height:38px;"/>  
        <div xid="div1" style="height:73px;"> 
          <div component="$UI/system/components/bootstrap/row/row" class="row"
            xid="row1"> 
            <div class="col col-xs-4" xid="col1"/>  
            <div class="col col-xs-4" xid="col2">
              <a component="$UI/system/components/justep/button/button" class="btn x-blue"
                label="初始化附件演示数据" xid="btnInit" style="float:left;margin-top:15px;margin-right:20px;width:250px;"
                onClick="btnInitClick"> 
                <i xid="i3"/>  
                <span xid="span3">初始化附件演示数据</span>
              </a>
            </div>  
            <div class="col col-xs-4" xid="col3"/>
          </div>
        </div>
        <div xid="div2" style="height:50px;"> 
          <div component="$UI/system/components/bootstrap/row/row" class="row"
            xid="row2"> 
            <div class="col col-xs-4" xid="col4"/>  
            <div class="col col-xs-4" xid="col5"/>  
            <div class="col col-xs-4" xid="col6"/>
          </div>
        </div>
      </div>  
      <div class="tab-pane" xid="tabContent2"> 
        <div component="$UI/system/components/bootstrap/tabs/tabs" xid="tabs3"> 
          <ul class="nav nav-tabs" xid="ul2"> 
            <li class="active" xid="li13"> 
              <a content="tabContent5" xid="tabDescription"><![CDATA[概述]]></a> 
            </li>  
            <li role="presentation" xid="li14" bind-click="li14Click"> 
              <a content="tabContent6" xid="tabAttachmentEditor"><![CDATA[attachment（附件编辑器）]]></a> 
            </li>  
            <li xid="li1" bind-click="li1Click"> 
              <a content="tabContent7" xid="tabItem1"><![CDATA[attachmentPC（附件编辑器）]]></a>
            </li>  
            <li xid="li2" bind-click="li2Click"> 
              <a content="tabContent8" xid="attachmentImage"><![CDATA[attachmentImage(附件图片)]]></a>
            </li>
          </ul>  
          <div class="tab-content" xid="div28"> 
            <div class="tab-pane active" xid="tabContent5"> 
              <div class="x-cell-layout" component="$UI/system/components/justep/cellLayout/cellLayout"
                style="width:100%; height: 100%;" xid="cellLayout1"> 
                <layout-content xid="default1"><![CDATA[
  <table cellspacing="0" cellpadding="0" rowHeight="19" columnWidth="80" style="border-collapse:collapse;table-layout:fixed;width:1px;">
     <tr><td ></td><td  style="width: 10px;"></td><td  style="width: 150px;"></td><td  style="width: 750px;"></td><td ></td><td ></td><td ></td><td ></td></tr>
     <tr><td  style="height: 15px;"></td><td  style="height: 15px;"></td><td  style="height: 15px;"></td><td  style="height: 15px;"></td><td  style="height: 15px;"></td><td  style="height: 15px;"></td><td  style="height: 15px;"></td><td  style="height: 15px;"></td></tr>
     <tr><td ></td><td  style="height: 19px;"></td><td  style="height: 19px; font-weight: bold;">附件组件</td><td  style="height: 19px;"></td><td  style="height: 19px;"></td><td  style="height: 19px;"></td><td  style="height: 19px;"></td><td  style="height: 19px;"></td></tr>
     <tr><td  style="height: 5px;"></td><td  style="height: 5px;"></td><td  style="height: 5px;"></td><td  style="height: 5px;"></td><td  style="height: 5px;"></td><td  style="height: 5px;"></td><td  style="height: 5px;"></td><td  style="height: 5px;"></td></tr>
     <tr><td ></td><td  style="height: 19px;"></td><td  colSpan="2" style="height: 19px;">附件组件用于为业务数据增加关联非结构化文档附件的能力。</td><td  style="height: 19px;"></td><td  style="height: 19px;"></td><td  style="height: 19px;"></td><td  style="height: 19px;"></td></tr>
     <tr><td ></td><td  style="height: 19px;"></td><td  colSpan="2" style="height: 19px;">附件组件需要关联到业务数据提供的一个Text字段上，这个字段用于存储以JSON格式记录的关联文档信息。</td><td  style="height: 19px;"></td><td  style="height: 19px;"></td><td  style="height: 19px;"></td><td  style="height: 19px;"></td></tr>
     <tr><td  style="height: 19px;"></td><td  style="height: 19px;"></td><td  colSpan="2" style="height: 19px;">附件组件支持各种格式文档的上传、下载、删除，同时支持Office文档的在线编辑、留痕和版本管理。</td><td  style="height: 19px;"></td><td  style="height: 19px;"></td><td  style="height: 19px;"></td><td  style="height: 19px;"></td></tr>
     <tr><td  style="height: 5px;"></td><td  style="height: 5px;"></td><td  style="height: 5px;"></td><td  style="height: 5px;"></td><td  style="height: 5px;"></td><td  style="height: 5px;"></td><td  style="height: 5px;"></td><td  style="height: 5px;"></td></tr>
     <tr><td  style="height: 19px;"></td><td  style="height: 19px;"></td><td  colSpan="2" style="height: 19px;">附件组件按交互模式分为多个组件：attachment、attachmentPC、attachmentImage。</td><td  style="height: 19px;"></td><td  style="height: 19px;"></td><td  style="height: 19px;"></td><td  style="height: 19px;"></td></tr>
     <tr><td  style="height: 5px;"></td><td  style="height: 5px;"></td><td  style="height: 5px; border-bottom-width: 1px; border-bottom-color: rgb(128, 128, 128); border-bottom-style: solid;"></td><td  style="height: 5px; border-bottom-width: 1px; border-bottom-color: rgb(128, 128, 128); border-bottom-style: solid;"></td><td  style="height: 5px;"></td><td  style="height: 5px;"></td><td  style="height: 5px;"></td><td  style="height: 5px;"></td></tr>
     <tr><td  style="height: 19px;"></td><td  style="height: 19px; border-right-width: 1px; border-right-color: rgb(128, 128, 128); border-right-style: solid;"></td><td  style="height: 19px; text-align: center; font-weight: bold; border: 1px solid rgb(128, 128, 128);">属性</td><td  style="height: 19px; text-align: center; font-weight: bold; border: 1px solid rgb(128, 128, 128);">说明</td><td  style="height: 19px;"></td><td  style="height: 19px;"></td><td  style="height: 19px;"></td><td  style="height: 19px;"></td></tr>
     <tr><td ></td><td  style="height: 19px; border-right-width: 1px; border-right-color: rgb(128, 128, 128); border-right-style: solid;"></td><td  style="height: 19px; border: 1px solid rgb(128, 128, 128);">bind-ref</td><td  style="height: 19px; border: 1px solid rgb(128, 128, 128);">指向业务数据中用于存储关联文档JSON数据的Text字段</td><td  style="height: 19px;"></td><td  style="height: 19px;"></td><td  style="height: 19px;"></td><td  style="height: 19px;"></td></tr>
     <tr><td ></td><td  style="height: 19px; border-right-width: 1px; border-right-color: rgb(128, 128, 128); border-right-style: solid;"></td><td  style="height: 19px; border: 1px solid rgb(128, 128, 128);"></td><td  style="height: 19px; border: 1px solid rgb(128, 128, 128);"></td><td  style="height: 19px;"></td><td  style="height: 19px;"></td><td  style="height: 19px;"></td><td  style="height: 19px;"></td></tr>
     <tr><td ></td><td  style="border-right-width: 1px; border-right-color: rgb(128, 128, 128); border-right-style: solid; height: 19px;"></td><td  style="border: 1px solid rgb(128, 128, 128); height: 19px;">limit</td><td  style="border: 1px solid rgb(128, 128, 128); height: 19px;">附件个数（-1表示不限，1表示单行模式）</td><td  style="height: 19px;"></td><td  style="height: 19px;"></td><td  style="height: 19px;"></td><td  style="height: 19px;"></td></tr>
     <tr><td ></td><td  style="border-right-width: 1px; border-right-color: rgb(128, 128, 128); border-right-style: solid; height: 19px;"></td><td  style="border: 1px solid rgb(128, 128, 128); height: 19px;"></td><td  style="border: 1px solid rgb(128, 128, 128); height: 19px;"></td><td  style="height: 19px;"></td><td  style="height: 19px;"></td><td  style="height: 19px;"></td><td  style="height: 19px;"></td></tr>
     <tr><td ></td><td  style="border-right-width: 1px; border-right-color: rgb(128, 128, 128); border-right-style: solid; height: 19px;"></td><td  style="border: 1px solid rgb(128, 128, 128); height: 19px;">access</td><td  style="border: 1px solid rgb(128, 128, 128); height: 19px;">附件编辑权限（列表、读取、下载、上传、删除）</td><td  style="height: 19px;"></td><td  style="height: 19px;"></td><td  style="height: 19px;"></td><td  style="height: 19px;"></td></tr>
     <tr><td ></td><td  style="border-right-width: 1px; border-right-color: rgb(128, 128, 128); border-right-style: solid; height: 19px;"></td><td  style="border: 1px solid rgb(128, 128, 128); height: 19px;"></td><td  style="border: 1px solid rgb(128, 128, 128); height: 19px;"></td><td  style="height: 19px;"></td><td  style="height: 19px;"></td><td  style="height: 19px;"></td><td  style="height: 19px;"></td></tr>
     <tr><td ></td><td  style="height: 19px; border-right-width: 1px; border-right-color: rgb(128, 128, 128); border-right-style: solid;"></td><td  style="height: 19px; border: 1px solid rgb(128, 128, 128);">sub-path</td><td  style="height: 19px; border: 1px solid rgb(128, 128, 128);">指定附件在“文档中心”的存储目录（支持业务表达式定义，例如：concat('个人文档/',currentPersonName())）</td><td  style="height: 19px;"></td><td  style="height: 19px;"></td><td  style="height: 19px;"></td><td  style="height: 19px;"></td></tr>
     <tr><td ></td><td  style="height: 19px; border-right-width: 1px; border-right-color: rgb(128, 128, 128); border-right-style: solid;"></td><td  style="height: 19px; border: 1px solid rgb(128, 128, 128);">keyID</td><td  style="height: 19px; border: 1px solid rgb(128, 128, 128);">附件组件的文档关联标识，用于在文档关联设置中区别同一个页面中的不同附件组件</td><td  style="height: 19px;"></td><td  style="height: 19px;"></td><td  style="height: 19px;"></td><td  style="height: 19px;"></td></tr>
     <tr><td ></td><td  style="height: 19px; border-right-width: 1px; border-right-color: rgb(128, 128, 128); border-right-style: solid;"></td><td  style="height: 19px; border: 1px solid rgb(128, 128, 128);">bind</td><td  style="height: 19px; border: 1px solid rgb(128, 128, 128);">附件组件内各种操作按钮的显示控制</td><td  style="height: 19px;"></td><td  style="height: 19px;"></td><td  style="height: 19px;"></td><td  style="height: 19px;"></td></tr>
     <tr><td ></td><td  style="height: 19px; border-right-width: 1px; border-right-color: rgb(128, 128, 128); border-right-style: solid;"></td><td  style="height: 19px; border: 1px solid rgb(128, 128, 128);">　　bind-visible</td><td  style="height: 19px; border: 1px solid rgb(128, 128, 128);">绑定是否显示事件</td><td  style="height: 19px;"></td><td  style="height: 19px;"></td><td  style="height: 19px;"></td><td  style="height: 19px;"></td></tr>
     <tr><td ></td><td  style="height: 19px; border-right-width: 1px; border-right-color: rgb(128, 128, 128); border-right-style: solid;"></td><td  style="height: 19px; border: 1px solid rgb(128, 128, 128);">　　bind-text</td><td  style="height: 19px; border: 1px solid rgb(128, 128, 128);"></td><td  style="height: 19px;"></td><td  style="height: 19px;"></td><td  style="height: 19px;"></td><td  style="height: 19px;"></td></tr>
     <tr><td ></td><td  style="height: 19px; border-right-width: 1px; border-right-color: rgb(128, 128, 128); border-right-style: solid;"></td><td  style="height: 19px; border: 1px solid rgb(128, 128, 128);">　　bind-enable</td><td  style="height: 19px; border: 1px solid rgb(128, 128, 128);"></td><td  style="height: 19px;"></td><td  style="height: 19px;"></td><td  style="height: 19px;"></td><td  style="height: 19px;"></td></tr>
     <tr><td ></td><td  style="height: 19px; border-right-width: 1px; border-right-color: rgb(128, 128, 128); border-right-style: solid;"></td><td  style="height: 19px; border: 1px solid rgb(128, 128, 128);">　　bind-disable</td><td  style="height: 19px; border: 1px solid rgb(128, 128, 128);"></td><td  style="height: 19px;"></td><td  style="height: 19px;"></td><td  style="height: 19px;"></td><td  style="height: 19px;"></td></tr>
     <tr><td ></td><td  style="height: 19px; border-right-width: 1px; border-right-color: rgb(128, 128, 128); border-right-style: solid;"></td><td  style="height: 19px; border: 1px solid rgb(128, 128, 128);"></td><td  style="height: 19px; border: 1px solid rgb(128, 128, 128);"></td><td  style="height: 19px;"></td><td  style="height: 19px;"></td><td  style="height: 19px;"></td><td  style="height: 19px;"></td></tr>
     <tr><td ></td><td  style="height: 19px; border-right-width: 1px; border-right-color: rgb(128, 128, 128); border-right-style: solid;"></td><td  style="height: 19px; border: 1px solid rgb(128, 128, 128);"></td><td  style="height: 19px; border: 1px solid rgb(128, 128, 128);"></td><td  style="height: 19px;"></td><td  style="height: 19px;"></td><td  style="height: 19px;"></td><td  style="height: 19px;"></td></tr>
     <tr><td  style="height: 10px;"></td><td  style="height: 10px;"></td><td  style="height: 10px;"></td><td  style="height: 10px;"></td><td  style="height: 10px;"></td><td  style="height: 10px;"></td><td  style="height: 10px;"></td><td  style="height: 10px;"></td></tr>
     <tr><td ></td><td  style="height: 19px;"></td><td  style="height: 19px; font-weight: bold;">文档存储</td><td  style="height: 19px;"></td><td  style="height: 19px;"></td><td  style="height: 19px;"></td><td  style="height: 19px;"></td><td  style="height: 19px;"></td></tr>
     <tr><td  style="height: 5px;"></td><td  style="height: 5px;"></td><td  style="height: 5px;"></td><td  style="height: 5px;"></td><td  style="height: 5px;"></td><td  style="height: 5px;"></td><td  style="height: 5px;"></td><td  style="height: 5px;"></td></tr>
     <tr><td ></td><td  style="height: 19px;"></td><td  colSpan="3" style="height: 19px;">所有的附件文档统一存储在文档服务器（runtime/DocServer）中，文档服务器除了提供基于文件的文档存取能力，还提供office、pdf、text等文档的全文检索能力。</td><td  style="height: 19px;"></td><td  style="height: 19px;"></td><td  style="height: 19px;"></td></tr>
     <tr><td  style="height: 10px;"></td><td  style="height: 10px;"></td><td  colSpan="2" style="height: 10px;"></td><td  style="height: 10px;"></td><td  style="height: 10px;"></td><td  style="height: 10px;"></td><td  style="height: 10px;"></td></tr>
     <tr><td ></td><td  style="height: 19px;"></td><td  style="height: 19px; font-weight: bold;">文档管理</td><td  style="height: 19px;"></td><td  style="height: 19px;"></td><td  style="height: 19px;"></td><td  style="height: 19px;"></td><td  style="height: 19px;"></td></tr>
     <tr><td  style="height: 5px;"></td><td  style="height: 5px;"></td><td  style="height: 5px;"></td><td  style="height: 5px;"></td><td  style="height: 5px;"></td><td  style="height: 5px;"></td><td  style="height: 5px;"></td><td  style="height: 5px;"></td></tr>
     <tr><td ></td><td  style="height: 19px;"></td><td  colSpan="2" style="height: 19px;">X5为所有的附件文档提供统一的文档管理功能——文档中心，在文档中心里可以对归档后的文件进行分类授权、查询、编辑等全方位管理。</td><td  style="height: 19px;"></td><td  style="height: 19px;"></td><td  style="height: 19px;"></td><td  style="height: 19px;"></td></tr>
  </table>
]]></layout-content> 
              </div> 
            </div>  
            <div class="tab-pane" xid="tabContent6"> 
              <h3 xid="h32" style="font-size:12px;font-style:normal;"><![CDATA[attachment（附件编辑器）组件，用于手机端列表形式的附件关联和编辑。]]></h3>  
              <div xid="div44" style="background-color:#8080FF;padding-top:10px;padding-left:10px;width:auto;height:auto;padding-bottom:10px;margin-right:5px;margin-left:5px;"> 
                <label xid="label6" style="color:#FFFFFF;font-weight:bold;">单行模式（limit=1）</label>  
                <a component="$UI/system/components/justep/button/button"
                  class="btn x-yellow" label="保存" xid="button3" style="float:right;margin-top:-5px;margin-right:10px;"
                  onClick="{operation:'dAttachment_Editor_Single.save'}"> 
                  <i xid="i5"/>  
                  <span xid="span5">保存</span> 
                </a> 
              </div>  
              <div component="$UI/system/components/justep/attachment/attachment"
                access="duud" xid="attachment1" limit="1" bind-ref="dAttachment_Editor_Single.ref('fAttachment')"> 
                <div class="x-attachment" xid="div42"> 
                  <div class="x-attachment-content x-card-border" xid="div40"> 
                    <div class="x-doc-process" xid="div38"> 
                      <div class="progress-bar x-doc-process-bar" role="progressbar"
                        style="width:0%;" xid="progressBar3"/> 
                    </div>  
                    <div data-bind="foreach:$attachmentItems" xid="div36"> 
                      <div class="x-attachment-cell" xid="div35"> 
                        <div class="x-attachment-item x-item-other" data-bind="click:$model.previewOrRemoveItem.bind($model),style:{opacity: $model.$access.get() % 4 &gt;= 2 || $model.$state.get() == 'remove' ? '1.0' : '0.5',backgroundImage:($model.previewPicture.bind($model,$object))()}"
                          xid="div34"> 
                          <a data-bind="visible:$model.$state.get() == 'remove'"
                            class="x-remove-barget" xid="a3"/> 
                        </div> 
                      </div> 
                    </div>  
                    <div class="x-attachment-cell" data-bind="visible:$state.get() == 'upload' &amp;&amp; ($limit.get() == '-1' || $limit.get() &gt; $attachmentItems.get().length)"
                      xid="div32"> 
                      <div class="x-attachment-item x-item-upload" data-bind="visible:$state.get() == 'upload' &amp;&amp; $access.get() % 512 &gt;= 256"
                        xid="div30"/> 
                    </div>  
                    <div class="x-attachment-cell" data-bind="visible:$state.get() == 'upload' &amp;&amp; $attachmentItems.get().length &gt; 0"
                      xid="div48"> 
                      <div class="x-attachment-item x-item-remove" data-bind="click:changeState.bind($object,'remove'),visible:$access.get() % 2048 &gt;= 1024"
                        xid="div47"/> 
                    </div>  
                    <div style="clear:both;" xid="div46"/> 
                  </div> 
                </div> 
              </div>  
              <div xid="div45" style="background-color:#8080FF;padding-top:10px;padding-left:10px;width:auto;height:auto;padding-bottom:10px;margin-right:5px;margin-left:5px;"> 
                <label xid="label7" style="color:#FFFFFF;font-weight:bold;">多行模式（limit=-1 或 limit&gt;1）</label>  
                <a component="$UI/system/components/justep/button/button"
                  class="btn x-yellow" label="保存" xid="button4" style="float:right;margin-top:-5px;margin-right:10px;"
                  onClick="{operation:'dAttachment_Editor_Multi.save'}"> 
                  <i xid="i4"/>  
                  <span xid="span4">保存</span> 
                </a> 
              </div>  
              <div component="$UI/system/components/justep/attachment/attachment"
                access="duud" xid="attachment3" bind-ref="dAttachment_Editor_Multi.ref('fAttachment')"> 
                <div class="x-attachment" xid="div52"> 
                  <div class="x-attachment-content x-card-border" xid="div51"> 
                    <div class="x-doc-process" xid="div50"> 
                      <div class="progress-bar x-doc-process-bar" role="progressbar"
                        style="width:0%;" xid="progressBar4"/> 
                    </div>  
                    <div data-bind="foreach:$attachmentItems" xid="div49"> 
                      <div class="x-attachment-cell" xid="div54"> 
                        <div class="x-attachment-item x-item-other" data-bind="click:$model.previewOrRemoveItem.bind($model),style:{opacity: $model.$access.get() % 4 &gt;= 2 || $model.$state.get() == 'remove' ? '1.0' : '0.5',backgroundImage:($model.previewPicture.bind($model,$object))()}"
                          xid="div53"> 
                          <a data-bind="visible:$model.$state.get() == 'remove'"
                            class="x-remove-barget" xid="a4"/> 
                        </div> 
                      </div> 
                    </div>  
                    <div class="x-attachment-cell" data-bind="visible:$state.get() == 'upload' &amp;&amp; ($limit.get() == '-1' || $limit.get() &gt; $attachmentItems.get().length)"
                      xid="div29"> 
                      <div class="x-attachment-item x-item-upload" data-bind="visible:$state.get() == 'upload' &amp;&amp; $access.get() % 512 &gt;= 256"
                        xid="div37"/> 
                    </div>  
                    <div class="x-attachment-cell" data-bind="visible:$state.get() == 'upload' &amp;&amp; $attachmentItems.get().length &gt; 0"
                      xid="div39"> 
                      <div class="x-attachment-item x-item-remove" data-bind="click:changeState.bind($object,'remove'),visible:$access.get() % 2048 &gt;= 1024"
                        xid="div41"/> 
                    </div>  
                    <div style="clear:both;" xid="div43"/> 
                  </div> 
                </div> 
              </div>  
              <div xid="div31" style="height:20px;"> 
                <label xid="label5" style="font-weight:bold;">JSON数据</label> 
              </div>  
              <div xid="div33" style="height:200px;"> 
                <textarea component="$UI/system/components/justep/textarea/textarea"
                  class="form-control" xid="textarea2" style="height:100%;width:100%;"
                  bind-ref="dAttachment_Editor_Multi.ref('fAttachment')" bind-disable="true"/> 
              </div> 
            </div>  
            <div class="tab-pane" xid="tabContent7">
              <h3 xid="h31" style="font-size:12px;font-style:normal;"><![CDATA[attachmentPC（附件编辑器）组件，用于PC端列表形式的附件关联和编辑。可以上传模板]]></h3>  
              <div xid="div23" style="background-color:#8080FF;padding-top:10px;padding-left:10px;width:auto;height:auto;padding-bottom:10px;margin-right:5px;margin-left:5px;"> 
                <label xid="label1" style="color:#FFFFFF;font-weight:bold;">单行模式（limit=1）</label>  
                <a component="$UI/system/components/justep/button/button"
                  class="btn x-yellow" label="保存" xid="button1" style="float:right;margin-top:-5px;margin-right:10px;"
                  onClick="{operation:'dAttachment_Editor_Single.save'}"> 
                  <i xid="i1"/>  
                  <span xid="span6">保存</span>
                </a> 
              </div>
              <div component="$UI/system/components/justep/attachment/attachmentPC"
                access="duud" xid="attachmentPC1" bind-ref="dAttachment_Editor_Single.ref('fAttachment')"
                limit="1"> 
                <div class="x-attachment-pc" xid="div4"> 
                  <div class="x-attachment-content x-card-border" xid="div5"> 
                    <div class="x-doc-process" xid="div6"> 
                      <div class="progress-bar x-doc-process-bar" role="progressbar"
                        style="width:0%;" xid="progressBar2"/>
                    </div>  
                    <div class="x-attachment-cell-tpl" data-bind="foreach:$attachmentItems"
                      xid="div7"> 
                      <div class="x-attachment-cell x-attachment-item" xid="div8"> 
                        <div class="x-item-other x-item-icon" data-bind="event:{mouseover:function(){if($model.$state.get()!='upload'){return;} $model.$activeDoc.set($object)}},click:$model.previewOrRemoveItem.bind($model),style:{opacity: $model.$access.get() % 4 &gt;= 2 || $model.$state.get() == 'remove' ? '1.0' : '0.5',backgroundImage:($model.previewPicture.bind($model,$object))()},css:{'x-doc-item-active':$model.$activeDoc.get() == $object}"
                          xid="div9"> 
                          <a data-bind="visible:$model.$state.get() == 'remove'"
                            class="x-remove-barget" xid="a1"/>
                        </div> 
                      </div> 
                    </div>  
                    <div class="x-attachment-cell x-attachment-item" data-bind="visible:$state.get() == 'upload' &amp;&amp; ($limit.get() == '-1' || $limit.get() &gt; $attachmentItems.get().length)"
                      xid="div10"> 
                      <div class="x-item-icon x-item-upload" data-bind="visible:$state.get() == 'upload' &amp;&amp; $access.get() % 512 &gt;= 256"
                        xid="div11"/>
                    </div>  
                    <div class="x-attachment-cell x-attachment-item" data-bind="visible:$state.get() == 'upload' &amp;&amp; ($limit.get() == '-1' || $limit.get() &gt; $attachmentItems.get().length)"
                      xid="div12"> 
                      <div class="x-item-icon x-item-new-tpl" data-bind="visible:$state.get() == 'upload' &amp;&amp; $access.get() % 512 &gt;= 256,click:$model.newFormTemplate.bind($model)"
                        xid="div13"/>
                    </div>  
                    <div class="x-attachment-cell x-attachment-item" data-bind="visible:$state.get() == 'upload' &amp;&amp; $attachmentItems.get().length &gt; 0"
                      xid="div14"> 
                      <div class="x-item-icon x-item-remove" data-bind="click:changeState.bind($object,'remove'),visible:$access.get() % 2048 &gt;= 1024"
                        xid="div15"/>
                    </div>  
                    <div class="x-attachment-toolbar" data-bind="if:$model.$activeDoc.get(),style:{display:$model.$activeDoc.get()?($('html').hasClass('flexboxlegacy')?'flex':'inline-block'):'none'}"
                      xid="div16"> 
                      <div class="x-item-name" xid="div17"> 
                        <a class="btn btn-link" data-bind="enable:($model.$activeDoc.get().fileID.get() &amp;&amp; $model.$access.get() % 4 &gt;= 2),click:$model.previewOrRemoveItem.bind($model,$model.$activeDoc.get()),text:$model.$activeDoc.get().docName.get()"
                          xid="a2"/>  
                        <span class="btn btn-link" data-bind="enable:false,text:$model.getFormatSize($model.$activeDoc.get())"
                          xid="span2"/>
                      </div>  
                      <div class="x-item-edit" xid="div18"> 
                        <a class="btn btn-link" data-bind="enable:$model.$access.get() % 1024 &gt;= 512,click:$model.editDoc.bind($model,$model.$activeDoc.get())"
                          xid="a5">编辑</a>
                      </div>  
                      <div class="x-item-download" xid="div19"> 
                        <a class="btn btn-link" data-bind="enable:$model.$access.get() % 1024 &gt;= 512,click:$model.showHistory.bind($model,$model.$activeDoc.get())"
                          xid="a6">历史</a>
                      </div>  
                      <div class="x-item-download" xid="div20"> 
                        <a class="btn btn-link" data-bind="enable:($model.$activeDoc.get().fileID.get() &amp;&amp; $model.$access.get() % 8 &gt;= 4),click:$model.downloadDoc.bind($model,$model.$activeDoc.get())"
                          xid="a7">下载</a>
                      </div>  
                      <div class="x-item-delete" xid="div21"> 
                        <a class="btn btn-link" data-bind="enable:$model.$access.get() % 2048 &gt;= 1024,click:$model.deleteDoc.bind($model,$model.$activeDoc.get())"
                          xid="a8">删除</a>
                      </div> 
                    </div>  
                    <div style="clear:both;" xid="div22"/>
                  </div> 
                </div> 
              </div>
              <div xid="div24" style="background-color:#8080FF;padding-top:10px;padding-left:10px;width:auto;height:auto;padding-bottom:10px;margin-right:5px;margin-left:5px;"> 
                <label xid="label2" style="color:#FFFFFF;font-weight:bold;">多行模式（limit=-1 或 limit&gt;1）</label>  
                <a component="$UI/system/components/justep/button/button"
                  class="btn x-yellow" label="保存" xid="button2" style="float:right;margin-top:-5px;margin-right:10px;"
                  onClick="{operation:'dAttachment_Editor_Multi.save'}"> 
                  <i xid="i2"/>  
                  <span xid="span7">保存</span>
                </a> 
              </div>
              <div component="$UI/system/components/justep/attachment/attachmentPC"
                access="duud" xid="attachmentPC2" bind-ref="dAttachment_Editor_Multi.ref('fAttachment')"> 
                <div class="x-attachment-pc" xid="div25"> 
                  <div class="x-attachment-content x-card-border" xid="div26"> 
                    <div class="x-doc-process" xid="div55"> 
                      <div class="progress-bar x-doc-process-bar" role="progressbar"
                        style="width:0%;" xid="progressBar5"/>
                    </div>  
                    <div class="x-attachment-cell-tpl" data-bind="foreach:$attachmentItems"
                      xid="div56"> 
                      <div class="x-attachment-cell x-attachment-item" xid="div57"> 
                        <div class="x-item-other x-item-icon" data-bind="event:{mouseover:function(){if($model.$state.get()!='upload'){return;} $model.$activeDoc.set($object)}},click:$model.previewOrRemoveItem.bind($model),style:{opacity: $model.$access.get() % 4 &gt;= 2 || $model.$state.get() == 'remove' ? '1.0' : '0.5',backgroundImage:($model.previewPicture.bind($model,$object))()},css:{'x-doc-item-active':$model.$activeDoc.get() == $object}"
                          xid="div58"> 
                          <a data-bind="visible:$model.$state.get() == 'remove'"
                            class="x-remove-barget" xid="a9"/>
                        </div> 
                      </div> 
                    </div>  
                    <div class="x-attachment-cell x-attachment-item" data-bind="visible:$state.get() == 'upload' &amp;&amp; ($limit.get() == '-1' || $limit.get() &gt; $attachmentItems.get().length)"
                      xid="div59"> 
                      <div class="x-item-icon x-item-upload" data-bind="visible:$state.get() == 'upload' &amp;&amp; $access.get() % 512 &gt;= 256"
                        xid="div60"/>
                    </div>  
                    <div class="x-attachment-cell x-attachment-item" data-bind="visible:$state.get() == 'upload' &amp;&amp; ($limit.get() == '-1' || $limit.get() &gt; $attachmentItems.get().length)"
                      xid="div61"> 
                      <div class="x-item-icon x-item-new-tpl" data-bind="visible:$state.get() == 'upload' &amp;&amp; $access.get() % 512 &gt;= 256,click:$model.newFormTemplate.bind($model)"
                        xid="div62"/>
                    </div>  
                    <div class="x-attachment-cell x-attachment-item" data-bind="visible:$state.get() == 'upload' &amp;&amp; $attachmentItems.get().length &gt; 0"
                      xid="div63"> 
                      <div class="x-item-icon x-item-remove" data-bind="click:changeState.bind($object,'remove'),visible:$access.get() % 2048 &gt;= 1024"
                        xid="div64"/>
                    </div>  
                    <div class="x-attachment-toolbar" data-bind="if:$model.$activeDoc.get(),style:{display:$model.$activeDoc.get()?($('html').hasClass('flexboxlegacy')?'flex':'inline-block'):'none'}"
                      xid="div65"> 
                      <div class="x-item-name" xid="div66"> 
                        <a class="btn btn-link" data-bind="enable:($model.$activeDoc.get().fileID.get() &amp;&amp; $model.$access.get() % 4 &gt;= 2),click:$model.previewOrRemoveItem.bind($model,$model.$activeDoc.get()),text:$model.$activeDoc.get().docName.get()"
                          xid="a10"/>  
                        <span class="btn btn-link" data-bind="enable:false,text:$model.getFormatSize($model.$activeDoc.get())"
                          xid="span8"/>
                      </div>  
                      <div class="x-item-edit" xid="div67"> 
                        <a class="btn btn-link" data-bind="enable:$model.$access.get() % 1024 &gt;= 512,click:$model.editDoc.bind($model,$model.$activeDoc.get())"
                          xid="a11">编辑</a>
                      </div>  
                      <div class="x-item-download" xid="div68"> 
                        <a class="btn btn-link" data-bind="enable:$model.$access.get() % 1024 &gt;= 512,click:$model.showHistory.bind($model,$model.$activeDoc.get())"
                          xid="a12">历史</a>
                      </div>  
                      <div class="x-item-download" xid="div69"> 
                        <a class="btn btn-link" data-bind="enable:($model.$activeDoc.get().fileID.get() &amp;&amp; $model.$access.get() % 8 &gt;= 4),click:$model.downloadDoc.bind($model,$model.$activeDoc.get())"
                          xid="a13">下载</a>
                      </div>  
                      <div class="x-item-delete" xid="div70"> 
                        <a class="btn btn-link" data-bind="enable:$model.$access.get() % 2048 &gt;= 1024,click:$model.deleteDoc.bind($model,$model.$activeDoc.get())"
                          xid="a14">删除</a>
                      </div> 
                    </div>  
                    <div style="clear:both;" xid="div71"/>
                  </div> 
                </div> 
              </div>
            </div>  
            <div class="tab-pane" xid="tabContent8">
              <div class="x-cell-layout" component="$UI/system/components/justep/cellLayout/cellLayout"
                style="width:100%; height: 100%;" xid="cellLayout9">
                <layout-content xid="default37"><![CDATA[
  <table cellspacing="0" cellpadding="0" rowHeight="19" columnWidth="80" style="border-collapse:collapse;table-layout:fixed;width:1px;">
     <tr><td ></td><td  style="width: 15px;"></td><td  style="width: 100px;"></td><td  style="width: 300px;"></td><td  style="width: 300px;"></td><td ></td><td ></td><td ></td></tr>
     <tr><td ></td><td  style="height: 19px;"></td><td  style="height: 19px;"></td><td  style="height: 19px;"></td><td  style="height: 19px;"></td><td  style="height: 19px;"></td><td  style="height: 19px;"></td><td  style="height: 19px;"></td></tr>
     <tr><td ></td><td  style="height: 19px;"></td><td  colSpan="3" style="height: 19px;">attachmentImage2（附件图片）组件和blobImage（二进制图片）组件都是用于图片存取和显示的组件。</td><td  style="height: 19px;"></td><td  style="height: 19px;"></td><td  style="height: 19px;"></td></tr>
     <tr><td ></td><td  style="height: 19px;"></td><td  colSpan="3" style="height: 19px;">这两个组件在展现形式和操作方式上是一致的，但是在物理存储方式和字段数据类型上其实是不同的。</td><td  style="height: 19px;"></td><td  style="height: 19px;"></td><td  style="height: 19px;"></td></tr>
     <tr><td  style="height: 5px;"></td><td  style="height: 5px;"></td><td  style="height: 5px; border-bottom-width: 1px; border-bottom-color: rgb(128, 128, 128); border-bottom-style: solid;"></td><td  style="height: 5px; border-bottom-width: 1px; border-bottom-color: rgb(128, 128, 128); border-bottom-style: solid;"></td><td  style="height: 5px; border-bottom-width: 1px; border-bottom-color: rgb(128, 128, 128); border-bottom-style: solid;"></td><td  style="height: 5px;"></td><td  style="height: 5px;"></td><td  style="height: 5px;"></td></tr>
     <tr><td  style="height: 19px;"></td><td  style="height: 19px; border-right-width: 1px; border-right-color: rgb(128, 128, 128); border-right-style: solid;"></td><td  style="height: 19px; border: 1px solid rgb(128, 128, 128);"></td><td  style="height: 19px; text-align: center; border: 1px solid rgb(128, 128, 128); font-weight: bold;">attachmentImage2（附件图片）</td><td  style="height: 19px; text-align: center; border: 1px solid rgb(128, 128, 128); font-weight: bold;">blobImage（二进制图片）</td><td  style="height: 19px;"></td><td  style="height: 19px;"></td><td  style="height: 19px;"></td></tr>
     <tr><td ></td><td  style="height: 19px; border-right-width: 1px; border-right-color: rgb(128, 128, 128); border-right-style: solid;"></td><td  style="height: 19px; border: 1px solid rgb(128, 128, 128); font-weight: bold;">物理存储方式</td><td  style="height: 19px; border: 1px solid rgb(128, 128, 128);">以文件形式存储在文档服务器中</td><td  style="height: 19px; border: 1px solid rgb(128, 128, 128);">以二进制数据存储在数据库字段中</td><td  style="height: 19px;"></td><td  style="height: 19px;"></td><td  style="height: 19px;"></td></tr>
     <tr><td ></td><td  style="height: 19px; border-right-width: 1px; border-right-color: rgb(128, 128, 128); border-right-style: solid;"></td><td  style="height: 19px; border: 1px solid rgb(128, 128, 128); font-weight: bold;">字段数据类型</td><td  style="height: 19px; border: 1px solid rgb(128, 128, 128);">Text</td><td  style="height: 19px; border: 1px solid rgb(128, 128, 128);">Blob</td><td  style="height: 19px;"></td><td  style="height: 19px;"></td><td  style="height: 19px;"></td></tr>
     <tr><td  style="height: 300px;"></td><td  style="height: 300px; border-right-width: 1px; border-right-color: rgb(128, 128, 128); border-right-style: solid;"></td><td  style="height: 300px; font-weight: bold; border: 1px solid rgb(128, 128, 128);">展现形式</td><td  style="height: 300px; border: 1px solid rgb(128, 128, 128);" componentId="attachmentImage2"></td><td  style="height: 300px; border: 1px solid rgb(128, 128, 128);" componentId="blobImage3"></td><td  style="height: 300px;"></td><td  style="height: 300px;"></td><td  style="height: 300px;"></td></tr>
     <tr><td ></td><td  style="height: 19px;"></td><td  style="height: 19px;"></td><td  style="height: 19px;"></td><td  style="height: 19px;"></td><td  style="height: 19px;"></td><td  style="height: 19px;"></td><td  style="height: 19px;"></td></tr>
  </table>
]]></layout-content>
              <div component="$UI/system/components/justep/attachment/attachmentImage" access="duud" xid="attachmentImage2" class=" x-cell-control" bind-ref="dAttachment_Image.ref('fAttachment')">
   <div class="x-attachment x-attachment-image" xid="div137">
    <div data-bind="foreach:$attachmentItems,event:{mouseover:function(){$model.$state.set('remove')},mouseout:function(){$model.$state.set('browse')}}" xid="div138">
     <img class="x-item-attachment-img" data-bind="attr:{src:$model.getPictureUrl($object)},click:$model.showInfullScreen.bind($model,$object)" xid="image3"></img>
     <a data-bind="visible:$model.$state.get() == 'remove',click:$model.previewOrRemoveItem.bind($model),enable:$model.$access.get() % 4 &gt;= 2" class="x-remove-barget" xid="a34"></a></div> 
    <div class="x-doc-process" xid="div139">
     <div class="progress-bar x-doc-process-bar" role="progressbar" style="width:0%;" xid="progressBar9"></div></div> 
    <div class="x-attachment-cell x-attachment-item" data-bind="visible:$state.get() == 'upload' &amp;&amp; (1 &gt; $attachmentItems.get().length)" xid="div140">
     <div class="x-item-icon x-item-upload" data-bind="visible:$state.get() == 'upload' &amp;&amp; $access.get() % 512 &gt;= 256" xid="div141"></div></div> </div> </div>
  <div class="x-blob x-cell-control" component="$UI/system/components/justep/blob/blobImage" style="height:80px;" xid="blobImage3" bind-ref="dBlobImage.ref('fBlobImage')" blobDataModel="dBlobImage.ref('DEMO_Attachment')" blobConcept="DEMO_Attachment" blobRelation="fBlobImage">
   <div class="x-blob-bar" xid="div143">
    <i class="x-blob-edit icon-compose" xid="i10"></i>
    <i class="x-blob-del icon-close-round" xid="i11"></i></div> 
   <img class="x-blob-img x-autofill" xid="image5"></img></div></div>
            </div>
          </div> 
        </div> 
      </div>  
      <div class="tab-pane" xid="tabContent3">
        <div component="$UI/system/components/bootstrap/tabs/tabs" xid="tabs1"> 
          <ul class="nav nav-tabs" xid="ul3"> 
            <li class="active" xid="li3"> 
              <a content="tabContent9" xid="tabItem2"><![CDATA[文档关联]]></a>
            </li>  
            <li role="presentation" xid="li4" bind-click="li4Click"> 
              <a content="tabContent10" xid="tabItem3"><![CDATA[模板填充]]></a>
            </li> 
          </ul>  
          <div class="tab-content" xid="div72"> 
            <div class="tab-pane active" xid="tabContent9">
              <div class="x-cell-layout" component="$UI/system/components/justep/cellLayout/cellLayout"
                style="width:100%; height: 100%;" xid="cellLayout2">
                <layout-content xid="default8"><![CDATA[
  <table cellspacing="0" cellpadding="0" rowHeight="19" columnWidth="80" style="border-collapse:collapse;table-layout:fixed;width:1px;">
     <tr><td ></td><td  style="width: 15px;"></td><td  style="width: 800px;"></td></tr>
     <tr><td ></td><td  style="height: 19px;"></td><td  style="height: 19px;"></td></tr>
     <tr><td  style="height: 19px;"></td><td  style="height: 19px;"></td><td  style="height: 19px;">“文档关联定义”是运行时对表单中关联附件组件设置的一组属性配置，主要包含：存储目录（根文件夹、子文件夹）、访问权限、文件大小和创建模板等。</td></tr>
     <tr><td ></td><td  style="height: 19px;"></td><td  style="height: 19px;">“文档关联定义”在系统提供的“文档管理/文档关联”功能中进行设置，“文档关联定义”的优先级高于设计时组件上的对应属性值。</td></tr>
     <tr><td  style="height: 10px;"></td><td  style="height: 10px;"></td><td  style="height: 10px;"></td></tr>
     <tr><td ></td><td  style="height: 19px;"></td><td  style="height: 19px; font-weight: bold;">“文档关联定义”一般用于以下场景：</td></tr>
     <tr><td ></td><td  style="height: 19px;"></td><td  style="height: 19px;">　　A、对附件文档的归档目录进行设置</td></tr>
     <tr><td ></td><td  style="height: 19px;"></td><td  style="height: 19px;">　　B、限制附件的上传文件大小</td></tr>
     <tr><td ></td><td  style="height: 19px;"></td><td  style="height: 19px;">　　C、为附件设置“模板”</td></tr>
     <tr><td ></td><td  style="height: 19px;"></td><td  style="height: 19px;">　　D、设置流程中不同环节的附件操作权限</td></tr>
     <tr><td  style="height: 10px;"></td><td  style="height: 10px;"></td><td  style="height: 10px;"></td></tr>
     <tr><td ></td><td  style="height: 19px;"></td><td  style="height: 19px; font-weight: bold;">“文档关联定义”的三级作用域：</td></tr>
     <tr><td ></td><td  style="height: 19px;"></td><td  style="height: 19px;">　　A、作用于某个功能Process（的所有活动Activity）</td></tr>
     <tr><td ></td><td  style="height: 19px;"></td><td  style="height: 19px;">　　B、作用于某个活动Activity</td></tr>
     <tr><td ></td><td  style="height: 19px;"></td><td  style="height: 19px;">　　C、作用于某个活动的某个附件组件，当一个活动中包含多个附件组件时，用key来识别</td></tr>
     <tr><td ></td><td  style="height: 19px;"></td><td  style="height: 19px;"></td></tr>
     <tr><td ></td><td  style="height: 19px;"></td><td  style="height: 19px; font-weight: bold;">“文档关联”测试：</td></tr>
     <tr><td ></td><td  style="height: 19px;"></td><td  style="height: 19px;">　　1、打开“文档管理/文档关联”功能</td></tr>
     <tr><td ></td><td  style="height: 19px;"></td><td  style="height: 19px;">　　2、点击“新增”，选择“演示案例/组件案例/附件组件”，点击“确定”</td></tr>
     <tr><td ></td><td  style="height: 19px;"></td><td  style="height: 19px;">　　3、选中“/demo/components/process/attachment/attachmentProcess”，点击上方的“key设置”</td></tr>
     <tr><td ></td><td  style="height: 19px;"></td><td  style="height: 19px;">　　4、点击“新建key”，设置“key”为“docDefineDemo”，“根文件夹”为“文档中心”，“权限”为“读取”</td></tr>
     <tr><td ></td><td  style="height: 19px;"></td><td  style="height: 19px;">　　5、重新打开当前功能，会看到下面附件组件的全部操作按钮都已被禁用</td></tr>
     <tr><td  style="height: 5px;"></td><td  style="height: 5px;"></td><td  style="height: 5px;"></td></tr>
     <tr><td ></td><td  style="height: 19px;"></td><td  style="height: 19px; border-bottom-width: 1px; border-bottom-color: rgb(128, 128, 128); border-bottom-style: solid; color: rgb(255, 102, 0);">（下面这个附件组件的key=docDefineDemo）   测试未实现</td></tr>
     <tr><td ></td><td  style="height: 19px; border-right-width: 1px; border-right-color: rgb(128, 128, 128); border-right-style: solid;"></td><td  style="height: 19px; border: 1px solid rgb(128, 128, 128);" componentId="attachmentPC3"></td></tr>
  </table>
]]></layout-content>  
                <div component="$UI/system/components/justep/attachment/attachmentPC"
                  access="duud" xid="attachmentPC3" class=" x-cell-control" bind-ref="dAttachment_Define.ref('fAttachment')"
                  subPath="'演示案例/附件组件/文档关联'" keyID="docDefineDemo" limit="-1"> 
                  <div class="x-attachment-pc" xid="div73"> 
                    <div class="x-attachment-content x-card-border" xid="div74"> 
                      <div class="x-doc-process" xid="div75"> 
                        <div class="progress-bar x-doc-process-bar" role="progressbar"
                          style="width:0%;" xid="progressBar6"/>
                      </div>  
                      <div class="x-attachment-cell-tpl" data-bind="foreach:$attachmentItems"
                        xid="div76"> 
                        <div class="x-attachment-cell x-attachment-item" xid="div77"> 
                          <div class="x-item-other x-item-icon" data-bind="event:{mouseover:function(){if($model.$state.get()!='upload'){return;} $model.$activeDoc.set($object)}},click:$model.previewOrRemoveItem.bind($model),style:{opacity: $model.$access.get() % 4 &gt;= 2 || $model.$state.get() == 'remove' ? '1.0' : '0.5',backgroundImage:($model.previewPicture.bind($model,$object))()},css:{'x-doc-item-active':$model.$activeDoc.get() == $object}"
                            xid="div78"> 
                            <a data-bind="visible:$model.$state.get() == 'remove'"
                              class="x-remove-barget" xid="a15"/>
                          </div> 
                        </div> 
                      </div>  
                      <div class="x-attachment-cell x-attachment-item" data-bind="visible:$state.get() == 'upload' &amp;&amp; ($limit.get() == '-1' || $limit.get() &gt; $attachmentItems.get().length)"
                        xid="div79"> 
                        <div class="x-item-icon x-item-upload" data-bind="visible:$state.get() == 'upload' &amp;&amp; $access.get() % 512 &gt;= 256"
                          xid="div80"/>
                      </div>  
                      <div class="x-attachment-cell x-attachment-item" data-bind="visible:$state.get() == 'upload' &amp;&amp; ($limit.get() == '-1' || $limit.get() &gt; $attachmentItems.get().length)"
                        xid="div81"> 
                        <div class="x-item-icon x-item-new-tpl" data-bind="visible:$state.get() == 'upload' &amp;&amp; $access.get() % 512 &gt;= 256,click:$model.newFormTemplate.bind($model)"
                          xid="div82"/>
                      </div>  
                      <div class="x-attachment-cell x-attachment-item" data-bind="visible:$state.get() == 'upload' &amp;&amp; $attachmentItems.get().length &gt; 0"
                        xid="div83"> 
                        <div class="x-item-icon x-item-remove" data-bind="click:changeState.bind($object,'remove'),visible:$access.get() % 2048 &gt;= 1024"
                          xid="div84"/>
                      </div>  
                      <div class="x-attachment-toolbar" data-bind="if:$model.$activeDoc.get(),style:{display:$model.$activeDoc.get()?($('html').hasClass('flexboxlegacy')?'flex':'inline-block'):'none'}"
                        xid="div85"> 
                        <div class="x-item-name" xid="div86"> 
                          <a class="btn btn-link" data-bind="enable:($model.$activeDoc.get().fileID.get() &amp;&amp; $model.$access.get() % 4 &gt;= 2),click:$model.previewOrRemoveItem.bind($model,$model.$activeDoc.get()),text:$model.$activeDoc.get().docName.get()"
                            xid="a16"/>  
                          <span class="btn btn-link" data-bind="enable:false,text:$model.getFormatSize($model.$activeDoc.get())"
                            xid="span9"/>
                        </div>  
                        <div class="x-item-edit" xid="div87"> 
                          <a class="btn btn-link" data-bind="enable:$model.$access.get() % 1024 &gt;= 512,click:$model.editDoc.bind($model,$model.$activeDoc.get())"
                            xid="a17">编辑</a>
                        </div>  
                        <div class="x-item-download" xid="div88"> 
                          <a class="btn btn-link" data-bind="enable:$model.$access.get() % 1024 &gt;= 512,click:$model.showHistory.bind($model,$model.$activeDoc.get())"
                            xid="a18">历史</a>
                        </div>  
                        <div class="x-item-download" xid="div89"> 
                          <a class="btn btn-link" data-bind="enable:($model.$activeDoc.get().fileID.get() &amp;&amp; $model.$access.get() % 8 &gt;= 4),click:$model.downloadDoc.bind($model,$model.$activeDoc.get())"
                            xid="a19">下载</a>
                        </div>  
                        <div class="x-item-delete" xid="div90"> 
                          <a class="btn btn-link" data-bind="enable:$model.$access.get() % 2048 &gt;= 1024,click:$model.deleteDoc.bind($model,$model.$activeDoc.get())"
                            xid="a20">删除</a>
                        </div> 
                      </div>  
                      <div style="clear:both;" xid="div91"/>
                    </div> 
                  </div> 
                </div>
              </div>
            </div>  
            <div class="tab-pane" xid="tabContent10">
              <div class="x-cell-layout" component="$UI/system/components/justep/cellLayout/cellLayout"
                style="width:100%; height: 100%;" xid="cellLayout3">
                <layout-content xid="default12"><![CDATA[
  <table cellspacing="0" cellpadding="0" rowHeight="19" columnWidth="80" style="border-collapse:collapse;table-layout:fixed;width:1px;">
     <tr><td ></td><td  style="width: 15px;"></td><td  style="width: 100px;"></td><td  style="width: 300px;"></td><td  style="width: 100px;"></td><td  style="width: 300px;"></td><td ></td><td ></td></tr>
     <tr><td ></td><td  style="height: 19px;"></td><td  style="height: 19px;"></td><td  style="height: 19px;"></td><td  style="height: 19px;"></td><td  style="height: 19px;"></td><td  style="height: 19px;"></td><td  style="height: 19px;"></td></tr>
     <tr><td  style="height: 19px;"></td><td  style="height: 19px;"></td><td  colSpan="4" style="height: 19px;">附件组件支持从模板创建新文档，和基于Word书签的文档填充能力。</td><td  style="height: 19px;"></td><td  style="height: 19px;"></td></tr>
     <tr><td  style="height: 5px;"></td><td  style="height: 5px;"></td><td  style="height: 5px;"></td><td  style="height: 5px;"></td><td  style="height: 5px;"></td><td  style="height: 5px;"></td><td  style="height: 5px;"></td><td  style="height: 5px;"></td></tr>
     <tr><td ></td><td  style="height: 19px;"></td><td  style="height: 19px; font-weight: bold;">设置模板：</td><td  style="height: 19px;"></td><td  style="height: 19px;"></td><td  style="height: 19px;"></td><td  style="height: 19px;"></td><td  style="height: 19px;"></td></tr>
     <tr><td ></td><td  style="height: 19px;"></td><td  colSpan="4" style="height: 19px;">　　文档模板在“文档关联”中进行配置，可以对同一个界面上不同的附件组件配置不同的模板（key设置）。</td><td  style="height: 19px;"></td><td  style="height: 19px;"></td></tr>
     <tr><td ></td><td  style="height: 19px;"></td><td  colSpan="4" style="height: 19px;">　　如果为一个附件组件配置了多个模板，在选择“从模板新建”时，会自动弹出“选择模板”对话框。</td><td  style="height: 19px;"></td><td  style="height: 19px;"></td></tr>
     <tr><td  style="height: 5px;"></td><td  style="height: 5px;"></td><td  colSpan="4" style="height: 5px;"></td><td  style="height: 5px;"></td><td  style="height: 5px;"></td></tr>
     <tr><td ></td><td  style="height: 19px;"></td><td  style="height: 19px; font-weight: bold;">模板填充：</td><td  style="height: 19px;"></td><td  style="height: 19px;"></td><td  style="height: 19px;"></td><td  style="height: 19px;"></td><td  style="height: 19px;"></td></tr>
     <tr><td ></td><td  style="height: 19px;"></td><td  colSpan="4" style="height: 19px;">　　在Word文档中，用Word自身的书签来定义填充域，每个填充域由开始和结束两个书签来标识。</td><td  style="height: 19px;"></td><td  style="height: 19px;"></td></tr>
     <tr><td ></td><td  style="height: 19px;"></td><td  colSpan="4" style="height: 19px;">　　开始位置的书签名称就是填充域的名称，而结束位置的书签名称是在域名城的后面多加一个单词“End”。</td><td  style="height: 19px;"></td><td  style="height: 19px;"></td></tr>
     <tr><td ></td><td  style="height: 19px;"></td><td  colSpan="4" style="height: 19px;">　　例如：填充域是title，开始位置的书签名称就是title，结束位置的书签名称是titleEnd。</td><td  style="height: 19px;"></td><td  style="height: 19px;"></td></tr>
     <tr><td ></td><td  style="height: 19px;"></td><td  colSpan="4" style="height: 19px;">　　代码中一般在onOfficeLoaded事件中进行数据填充，参照下面组件的示例代码。</td><td  style="height: 19px;"></td><td  style="height: 19px;"></td></tr>
     <tr><td  style="height: 5px;"></td><td  style="height: 5px;"></td><td  style="height: 5px;"></td><td  style="height: 5px;"></td><td  style="height: 5px;"></td><td  style="height: 5px;"></td><td  style="height: 5px;"></td><td  style="height: 5px;"></td></tr>
     <tr><td ></td><td  style="height: 19px;"></td><td  colSpan="4" style="height: 19px; font-weight: bold;">模板测试：</td><td  style="height: 19px;"></td><td  style="height: 19px;"></td></tr>
     <tr><td ></td><td  style="height: 19px;"></td><td  colSpan="4" style="height: 19px;">　　1、打开“文档管理/文档关联”功能</td><td  style="height: 19px;"></td><td  style="height: 19px;"></td></tr>
     <tr><td ></td><td  style="height: 19px;"></td><td  colSpan="4" style="height: 19px;">　　2、点击“新增”，选择“演示案例/组件案例/附件组件”，点击“确定”</td><td  style="height: 19px;"></td><td  style="height: 19px;"></td></tr>
     <tr><td ></td><td  style="height: 19px;"></td><td  colSpan="4" style="height: 19px;">　　3、选中“/demo/components/process/attachment/attachmentProcess”，点击上方的“key设置”</td><td  style="height: 19px;"></td><td  style="height: 19px;"></td></tr>
     <tr><td ></td><td  style="height: 19px;"></td><td  colSpan="4" style="height: 19px;">　　4、点击“新建key”，设置“key”为“docTemplateDemo”，“根文件夹”为“文档中心”</td><td  style="height: 19px;"></td><td  style="height: 19px;"></td></tr>
     <tr><td ></td><td  style="height: 19px;"></td><td  colSpan="4" style="height: 19px;">　　5、点击“新增”模板，点击“选择模板”，依次增加“演示案例/组件案例/附件组件/附件模板”下的三个示例模板</td><td  style="height: 19px;"></td><td  style="height: 19px;"></td></tr>
     <tr><td ></td><td  style="height: 19px;"></td><td  colSpan="4" style="height: 19px;">　　5、重新打开当前功能，点击下面附件组件的“从模板新建”</td><td  style="height: 19px;"></td><td  style="height: 19px;"></td></tr>
     <tr><td  style="height: 5px;"></td><td  style="height: 5px;"></td><td  style="height: 5px;"></td><td  style="height: 5px;"></td><td  style="height: 5px;"></td><td  style="height: 5px;"></td><td  style="height: 5px;"></td><td  style="height: 5px;"></td></tr>
     <tr><td ></td><td  style="height: 19px;"></td><td  colSpan="4" style="height: 19px; border-bottom-width: 1px; border-bottom-color: rgb(128, 128, 128); border-bottom-style: solid;">（下面这个附件组件的key=docTemplateDemo）</td><td  style="height: 19px;"></td><td  style="height: 19px;"></td></tr>
     <tr><td ></td><td  style="height: 19px; border-right-width: 1px; border-right-color: rgb(128, 128, 128); border-right-style: solid;"></td><td  colSpan="4" style="height: 19px; border: 1px solid rgb(128, 128, 128);" componentId="attachmentEditor_Template"></td><td  style="height: 19px;"></td><td  style="height: 19px;"></td></tr>
     <tr><td  style="height: 10px;"></td><td  style="height: 10px;"></td><td  style="height: 10px;"></td><td  style="height: 10px;"></td><td  style="height: 10px;"></td><td  style="height: 10px;"></td><td  style="height: 10px;"></td><td  style="height: 10px;"></td></tr>
     <tr><td ></td><td  style="height: 19px;"></td><td  colSpan="4" style="height: 19px; border-bottom-width: 1px; border-bottom-color: rgb(128, 128, 128); border-bottom-style: solid;">文档填充示例数据</td><td  style="height: 19px;"></td><td  style="height: 19px;"></td></tr>
     <tr><td  style="height: 25px;"></td><td  style="height: 25px; border-right-width: 1px; border-right-color: rgb(128, 128, 128); border-right-style: solid;"></td><td  style="height: 25px; text-align: center; border: 1px solid rgb(128, 128, 128);">title</td><td  style="height: 25px; border: 1px solid rgb(128, 128, 128);" componentId="input1"></td><td  style="height: 25px; text-align: center; border: 1px solid rgb(128, 128, 128);">number</td><td  style="height: 25px; border: 1px solid rgb(128, 128, 128);" componentId="input2"></td><td  style="height: 25px;"></td><td  style="height: 25px;"></td></tr>
     <tr><td  style="height: 25px;"></td><td  style="height: 25px; border-right-width: 1px; border-right-color: rgb(128, 128, 128); border-right-style: solid;"></td><td  style="height: 25px; text-align: center; border: 1px solid rgb(128, 128, 128);">author</td><td  style="height: 25px; border: 1px solid rgb(128, 128, 128);" componentId="input3"></td><td  style="height: 25px; text-align: center; border: 1px solid rgb(128, 128, 128);">createDate</td><td  style="height: 25px; border: 1px solid rgb(128, 128, 128);" componentId="input4"></td><td  style="height: 25px;"></td><td  style="height: 25px;"></td></tr>
     <tr><td  style="height: 10px;"></td><td  style="height: 10px;"></td><td  style="height: 10px;"></td><td  style="height: 10px;"></td><td  style="height: 10px;"></td><td  style="height: 10px;"></td><td  style="height: 10px;"></td><td  style="height: 10px;"></td></tr>
     <tr><td ></td><td  style="height: 19px;"></td><td  colSpan="4" style="height: 19px; color: rgb(0, 0, 255); border-bottom-width: 1px; border-bottom-color: rgb(128, 128, 128); border-bottom-style: solid;">示例代码（onOfficeLoaded事件）</td><td  style="height: 19px;"></td><td  style="height: 19px;"></td></tr>
     <tr><td  style="height: 350px;"></td><td  style="height: 350px; border-right-width: 1px; border-right-color: rgb(128, 128, 128); border-right-style: solid;"></td><td  colSpan="4" style="height: 350px; border: 1px solid rgb(128, 128, 128);" componentId="divCode_FillTemplate"></td><td  style="height: 350px;"></td><td  style="height: 350px;"></td></tr>
  </table>
]]></layout-content>  
                <div component="$UI/system/components/justep/attachment/attachmentPC"
                  access="duud" xid="attachmentEditor_Template" class=" x-cell-control"
                  bind-ref="dAttachment_Template.ref('fAttachment')" keyID="docTemplateDemo"
                  limit="-1" onOfficeLoaded="attachmentEditor_TemplateOfficeLoaded"> 
                  <div class="x-attachment-pc" xid="div92"> 
                    <div class="x-attachment-content x-card-border" xid="div93"> 
                      <div class="x-doc-process" xid="div94"> 
                        <div class="progress-bar x-doc-process-bar" role="progressbar"
                          style="width:0%;" xid="progressBar7"/>
                      </div>  
                      <div class="x-attachment-cell-tpl" data-bind="foreach:$attachmentItems"
                        xid="div95"> 
                        <div class="x-attachment-cell x-attachment-item" xid="div96"> 
                          <div class="x-item-other x-item-icon" data-bind="event:{mouseover:function(){if($model.$state.get()!='upload'){return;} $model.$activeDoc.set($object)}},click:$model.previewOrRemoveItem.bind($model),style:{opacity: $model.$access.get() % 4 &gt;= 2 || $model.$state.get() == 'remove' ? '1.0' : '0.5',backgroundImage:($model.previewPicture.bind($model,$object))()},css:{'x-doc-item-active':$model.$activeDoc.get() == $object}"
                            xid="div97"> 
                            <a data-bind="visible:$model.$state.get() == 'remove'"
                              class="x-remove-barget" xid="a21"/>
                          </div> 
                        </div> 
                      </div>  
                      <div class="x-attachment-cell x-attachment-item" data-bind="visible:$state.get() == 'upload' &amp;&amp; ($limit.get() == '-1' || $limit.get() &gt; $attachmentItems.get().length)"
                        xid="div98"> 
                        <div class="x-item-icon x-item-upload" data-bind="visible:$state.get() == 'upload' &amp;&amp; $access.get() % 512 &gt;= 256"
                          xid="div99"/>
                      </div>  
                      <div class="x-attachment-cell x-attachment-item" data-bind="visible:$state.get() == 'upload' &amp;&amp; ($limit.get() == '-1' || $limit.get() &gt; $attachmentItems.get().length)"
                        xid="div100"> 
                        <div class="x-item-icon x-item-new-tpl" data-bind="visible:$state.get() == 'upload' &amp;&amp; $access.get() % 512 &gt;= 256,click:$model.newFormTemplate.bind($model)"
                          xid="div101"/>
                      </div>  
                      <div class="x-attachment-cell x-attachment-item" data-bind="visible:$state.get() == 'upload' &amp;&amp; $attachmentItems.get().length &gt; 0"
                        xid="div102"> 
                        <div class="x-item-icon x-item-remove" data-bind="click:changeState.bind($object,'remove'),visible:$access.get() % 2048 &gt;= 1024"
                          xid="div103"/>
                      </div>  
                      <div class="x-attachment-toolbar" data-bind="if:$model.$activeDoc.get(),style:{display:$model.$activeDoc.get()?($('html').hasClass('flexboxlegacy')?'flex':'inline-block'):'none'}"
                        xid="div104"> 
                        <div class="x-item-name" xid="div105"> 
                          <a class="btn btn-link" data-bind="enable:($model.$activeDoc.get().fileID.get() &amp;&amp; $model.$access.get() % 4 &gt;= 2),click:$model.previewOrRemoveItem.bind($model,$model.$activeDoc.get()),text:$model.$activeDoc.get().docName.get()"
                            xid="a22"/>  
                          <span class="btn btn-link" data-bind="enable:false,text:$model.getFormatSize($model.$activeDoc.get())"
                            xid="span10"/>
                        </div>  
                        <div class="x-item-edit" xid="div106"> 
                          <a class="btn btn-link" data-bind="enable:$model.$access.get() % 1024 &gt;= 512,click:$model.editDoc.bind($model,$model.$activeDoc.get())"
                            xid="a23">编辑</a>
                        </div>  
                        <div class="x-item-download" xid="div107"> 
                          <a class="btn btn-link" data-bind="enable:$model.$access.get() % 1024 &gt;= 512,click:$model.showHistory.bind($model,$model.$activeDoc.get())"
                            xid="a24">历史</a>
                        </div>  
                        <div class="x-item-download" xid="div108"> 
                          <a class="btn btn-link" data-bind="enable:($model.$activeDoc.get().fileID.get() &amp;&amp; $model.$access.get() % 8 &gt;= 4),click:$model.downloadDoc.bind($model,$model.$activeDoc.get())"
                            xid="a25">下载</a>
                        </div>  
                        <div class="x-item-delete" xid="div109"> 
                          <a class="btn btn-link" data-bind="enable:$model.$access.get() % 2048 &gt;= 1024,click:$model.deleteDoc.bind($model,$model.$activeDoc.get())"
                            xid="a26">删除</a>
                        </div> 
                      </div>  
                      <div style="clear:both;" xid="div110"/>
                    </div> 
                  </div> 
                </div>  
                <input component="$UI/system/components/justep/input/input" class="form-control x-cell-control"
                  xid="input1" bind-ref="dAttachment_Template.ref('fTitle')"/>  
                <input component="$UI/system/components/justep/input/input" class="form-control x-cell-control"
                  xid="input2" bind-ref="dAttachment_Template.ref('fNumber')"/>  
                <input component="$UI/system/components/justep/input/input" class="form-control x-cell-control"
                  xid="input3" bind-ref="dAttachment_Template.ref('fAuthor')"/>  
                <input component="$UI/system/components/justep/input/input" class="form-control x-cell-control"
                  xid="input4" bind-ref="dAttachment_Template.ref('fCreateDate')"/>  
                <div xid="divCode_FillTemplate" class=" x-cell-control"/>
              </div>
            </div>
          </div> 
        </div>
      </div>  
      <div class="tab-pane" xid="tabContent4">
        <div component="$UI/system/components/bootstrap/tabs/tabs" xid="tabs2"> 
          <ul class="nav nav-tabs" xid="ul4"> 
            <li class="active" xid="li5"> 
              <a content="tabContent11" xid="tabItem4"><![CDATA[扩展样式]]></a>
            </li>  
            <li role="presentation" xid="li6" bind-click="li6Click"> 
              <a content="tabContent12" xid="tabItem5"><![CDATA[设置权限]]></a>
            </li>  
            <li xid="li7" bind-click="li7Click"> 
              <a content="tabContent13" xid="tabItem6"><![CDATA[限制上传]]></a>
            </li>  
            <li xid="li8" bind-click="li8Click"> 
              <a content="tabContent14" xid="tabItem7"><![CDATA[设定模板]]></a>
            </li>  
            <li xid="li15"> 
              <a content="tabContent15" xid="tabItem8"><![CDATA[Java扩展]]></a>
            </li>
          </ul>  
          <div class="tab-content" xid="div112"> 
            <div class="tab-pane active" xid="tabContent11">
              <div class="x-cell-layout" component="$UI/system/components/justep/cellLayout/cellLayout"
                style="width:100%; height: 100%;" xid="cellLayout4"> 
                <layout-content xid="default16"><![CDATA[
  <table cellspacing="0" cellpadding="0" rowHeight="19" columnWidth="80" style="border-collapse:collapse;table-layout:fixed;width:1px;">
     <tr><td ></td><td  style="width: 15px;"></td><td  style="width: 800px;"></td></tr>
     <tr><td ></td><td  style="height: 19px;"></td><td  style="height: 19px;"></td></tr>
     <tr><td  style="height: 19px;"></td><td  style="height: 19px;"></td><td  style="height: 19px; font-weight: bold;">用CSS扩展组件样式：</td></tr>
     <tr><td ></td><td  style="height: 19px;"></td><td  style="height: 19px;">　　附件编辑器的样式全部定义在“/UI/system/components/attachmentEditor2/attachmentEditor2.css”文件中。</td></tr>
     <tr><td ></td><td  style="height: 19px;"></td><td  style="height: 19px;">　　在开发过程中，可以参照原始的CSS定义，对组件的颜色、边框、字体等样式进行定制。（推荐利用浏览器的开发者工具进行CSS调试）</td></tr>
     <tr><td ></td><td  style="height: 19px;"></td><td  style="height: 19px;">　　如果需要统一定制所有附件组件的样式，可以将新的样式定义在“/UI/system/config/user.css”中。</td></tr>
     <tr><td  style="height: 5px;"></td><td  style="height: 5px;"></td><td  style="height: 5px;"></td></tr>
     <tr><td ></td><td  style="height: 19px;"></td><td  style="height: 19px;">　　下面的示例展示了如何局部定制某些附件组件的样式：</td></tr>
     <tr><td  style="height: 19px;"></td><td  style="height: 19px;"></td><td  style="height: 19px;">　　　　1、在原CSS的基础上，用CSS类选择器 .attr-extend 定义扩展样式（参看：/UI/demo/components/process/attachment/mainActivity.css）；</td></tr>
     <tr><td ></td><td  style="height: 19px;"></td><td  style="height: 19px;">　　　　2、修改需要新样式的附件组件的class属性，增加 attr-extend。</td></tr>
     <tr><td  style="height: 5px;"></td><td  style="height: 5px;"></td><td  style="height: 5px; border-bottom-width: 1px; border-bottom-color: rgb(128, 128, 128); border-bottom-style: solid;"></td></tr>
     <tr><td ></td><td  style="height: 19px; border-right-width: 1px; border-right-color: rgb(128, 128, 128); border-right-style: solid;"></td><td  style="height: 19px; border: 1px solid rgb(128, 128, 128);" componentId="attachmentEditor_Extent_Style"></td></tr>
     <tr><td ></td><td  style="height: 19px;"></td><td  style="height: 19px;"></td></tr>
  </table>
]]></layout-content>  
                <div component="$UI/system/components/justep/attachment/attachmentPC"
                  access="duud" xid="attachmentEditor_Extent_Style" class=" x-cell-control"
                  bind-ref="dAttachment_Extend_Style.ref('fAttachment')"> 
                  <div class="x-attachment-pc" xid="div113"> 
                    <div class="x-attachment-content x-card-border" xid="div114"> 
                      <div class="x-doc-process" xid="div115"> 
                        <div class="progress-bar x-doc-process-bar" role="progressbar"
                          style="width:0%;" xid="progressBar8"/>
                      </div>  
                      <div class="x-attachment-cell-tpl" data-bind="foreach:$attachmentItems"
                        xid="div116"> 
                        <div class="x-attachment-cell x-attachment-item" xid="div117"> 
                          <div class="x-item-other x-item-icon" data-bind="event:{mouseover:function(){if($model.$state.get()!='upload'){return;} $model.$activeDoc.set($object)}},click:$model.previewOrRemoveItem.bind($model),style:{opacity: $model.$access.get() % 4 &gt;= 2 || $model.$state.get() == 'remove' ? '1.0' : '0.5',backgroundImage:($model.previewPicture.bind($model,$object))()},css:{'x-doc-item-active':$model.$activeDoc.get() == $object}"
                            xid="div118"> 
                            <a data-bind="visible:$model.$state.get() == 'remove'"
                              class="x-remove-barget" xid="a27"/>
                          </div> 
                        </div> 
                      </div>  
                      <div class="x-attachment-cell x-attachment-item" data-bind="visible:$state.get() == 'upload' &amp;&amp; ($limit.get() == '-1' || $limit.get() &gt; $attachmentItems.get().length)"
                        xid="div119"> 
                        <div class="x-item-icon x-item-upload" data-bind="visible:$state.get() == 'upload' &amp;&amp; $access.get() % 512 &gt;= 256"
                          xid="div120"/>
                      </div>  
                      <div class="x-attachment-cell x-attachment-item" data-bind="visible:$state.get() == 'upload' &amp;&amp; ($limit.get() == '-1' || $limit.get() &gt; $attachmentItems.get().length)"
                        xid="div121"> 
                        <div class="x-item-icon x-item-new-tpl" data-bind="visible:$state.get() == 'upload' &amp;&amp; $access.get() % 512 &gt;= 256,click:$model.newFormTemplate.bind($model)"
                          xid="div122"/>
                      </div>  
                      <div class="x-attachment-cell x-attachment-item" data-bind="visible:$state.get() == 'upload' &amp;&amp; $attachmentItems.get().length &gt; 0"
                        xid="div123"> 
                        <div class="x-item-icon x-item-remove" data-bind="click:changeState.bind($object,'remove'),visible:$access.get() % 2048 &gt;= 1024"
                          xid="div124"/>
                      </div>  
                      <div class="x-attachment-toolbar" data-bind="if:$model.$activeDoc.get(),style:{display:$model.$activeDoc.get()?($('html').hasClass('flexboxlegacy')?'flex':'inline-block'):'none'}"
                        xid="div125"> 
                        <div class="x-item-name" xid="div126"> 
                          <a class="btn btn-link" data-bind="enable:($model.$activeDoc.get().fileID.get() &amp;&amp; $model.$access.get() % 4 &gt;= 2),click:$model.previewOrRemoveItem.bind($model,$model.$activeDoc.get()),text:$model.$activeDoc.get().docName.get()"
                            xid="a28"/>  
                          <span class="btn btn-link" data-bind="enable:false,text:$model.getFormatSize($model.$activeDoc.get())"
                            xid="span11"/>
                        </div>  
                        <div class="x-item-edit" xid="div127"> 
                          <a class="btn btn-link" data-bind="enable:$model.$access.get() % 1024 &gt;= 512,click:$model.editDoc.bind($model,$model.$activeDoc.get())"
                            xid="a29">编辑</a>
                        </div>  
                        <div class="x-item-download" xid="div128"> 
                          <a class="btn btn-link" data-bind="enable:$model.$access.get() % 1024 &gt;= 512,click:$model.showHistory.bind($model,$model.$activeDoc.get())"
                            xid="a30">历史</a>
                        </div>  
                        <div class="x-item-download" xid="div129"> 
                          <a class="btn btn-link" data-bind="enable:($model.$activeDoc.get().fileID.get() &amp;&amp; $model.$access.get() % 8 &gt;= 4),click:$model.downloadDoc.bind($model,$model.$activeDoc.get())"
                            xid="a31">下载</a>
                        </div>  
                        <div class="x-item-delete" xid="div130"> 
                          <a class="btn btn-link" data-bind="enable:$model.$access.get() % 2048 &gt;= 1024,click:$model.deleteDoc.bind($model,$model.$activeDoc.get())"
                            xid="a32">删除</a>
                        </div> 
                      </div>  
                      <div style="clear:both;" xid="div131"/>
                    </div> 
                  </div> 
                </div> 
              </div>
            </div>  
            <div class="tab-pane" xid="tabContent12">
              <div class="x-cell-layout" component="$UI/system/components/justep/cellLayout/cellLayout"
                style="width:100%; height: 100%;" xid="cellLayout5">
                <layout-content xid="default23"><![CDATA[
  <table cellspacing="0" cellpadding="0" rowHeight="19" columnWidth="80" style="border-collapse:collapse;table-layout:fixed;width:1px;">
     <tr><td ></td><td ></td><td  style="width: 800px;"></td></tr>
     <tr><td ></td><td  style="height: 19px;"></td><td  style="height: 19px;"></td></tr>
     <tr><td  style="height: 19px;"></td><td  style="height: 19px;"></td><td  style="height: 19px;">附件组件提供setPermission(access)方法用于运行时设置附件权限，参数access的取值范围如下：</td></tr>
     <tr><td  style="height: 5px;"></td><td  style="height: 5px;"></td><td  style="height: 5px;"></td></tr>
     <tr><td ></td><td  style="height: 19px;"></td><td  style="height: 19px;" componentId="radioGroup1"></td></tr>
     <tr><td  style="height: 5px;"></td><td  style="height: 5px;"></td><td  style="height: 5px; border-bottom-width: 1px; border-bottom-color: rgb(128, 128, 128); border-bottom-style: solid;"></td></tr>
     <tr><td ></td><td  style="height: 19px; border-right-width: 1px; border-right-color: rgb(128, 128, 128); border-right-style: solid;"></td><td  style="height: 19px; border: 1px solid rgb(128, 128, 128);" componentId="attachmentEditor_Extend_Permission"></td></tr>
     <tr><td  style="height: 5px;"></td><td  style="height: 5px;"></td><td  style="height: 5px;"></td></tr>
     <tr><td ></td><td  style="height: 19px;"></td><td  style="height: 19px; color: rgb(0, 0, 255); border-bottom-width: 1px; border-bottom-color: rgb(128, 128, 128); border-bottom-style: solid;">示例代码</td></tr>
     <tr><td  style="height: 150px;"></td><td  style="height: 150px; border-right-width: 1px; border-right-color: rgb(128, 128, 128); border-right-style: solid;"></td><td  style="height: 150px; border: 1px solid rgb(128, 128, 128);" componentId="divCode_Permission"></td></tr>
  </table>
]]></layout-content>  
                <div xid="divCode_Permission" class=" x-cell-control"/>  
                <span component="$UI/system/components/justep/select/radioGroup"
                  class="x-radio-group x-cell-control" xid="radioGroup1" bind-ref="dTemp.ref('access')"
                  bind-itemset="dRadio" bind-itemsetValue="ref('value')" bind-itemsetLabel="ref('label')"/>  
                <div component="$UI/system/components/justep/attachment/attachmentPC"
                  access="duud" xid="attachmentEditor_Extend_Permission" class=" x-cell-control"
                  bind-ref="dAttachment_Extend_Permission.ref('fAttachment')"> 
                  <div class="x-attachment-pc" xid="div153"> 
                    <div class="x-attachment-content x-card-border" xid="div154"> 
                      <div class="x-doc-process" xid="div155"> 
                        <div class="progress-bar x-doc-process-bar" role="progressbar"
                          style="width:0%;" xid="progressBar10"/>
                      </div>  
                      <div class="x-attachment-cell-tpl" data-bind="foreach:$attachmentItems"
                        xid="div156"> 
                        <div class="x-attachment-cell x-attachment-item" xid="div157"> 
                          <div class="x-item-other x-item-icon" data-bind="event:{mouseover:function(){if($model.$state.get()!='upload'){return;} $model.$activeDoc.set($object)}},click:$model.previewOrRemoveItem.bind($model),style:{opacity: $model.$access.get() % 4 &gt;= 2 || $model.$state.get() == 'remove' ? '1.0' : '0.5',backgroundImage:($model.previewPicture.bind($model,$object))()},css:{'x-doc-item-active':$model.$activeDoc.get() == $object}"
                            xid="div158"> 
                            <a data-bind="visible:$model.$state.get() == 'remove'"
                              class="x-remove-barget" xid="a39"/>
                          </div> 
                        </div> 
                      </div>  
                      <div class="x-attachment-cell x-attachment-item" data-bind="visible:$state.get() == 'upload' &amp;&amp; ($limit.get() == '-1' || $limit.get() &gt; $attachmentItems.get().length)"
                        xid="div159"> 
                        <div class="x-item-icon x-item-upload" data-bind="visible:$state.get() == 'upload' &amp;&amp; $access.get() % 512 &gt;= 256"
                          xid="div160"/>
                      </div>  
                      <div class="x-attachment-cell x-attachment-item" data-bind="visible:$state.get() == 'upload' &amp;&amp; ($limit.get() == '-1' || $limit.get() &gt; $attachmentItems.get().length)"
                        xid="div161"> 
                        <div class="x-item-icon x-item-new-tpl" data-bind="visible:$state.get() == 'upload' &amp;&amp; $access.get() % 512 &gt;= 256,click:$model.newFormTemplate.bind($model)"
                          xid="div162"/>
                      </div>  
                      <div class="x-attachment-cell x-attachment-item" data-bind="visible:$state.get() == 'upload' &amp;&amp; $attachmentItems.get().length &gt; 0"
                        xid="div163"> 
                        <div class="x-item-icon x-item-remove" data-bind="click:changeState.bind($object,'remove'),visible:$access.get() % 2048 &gt;= 1024"
                          xid="div164"/>
                      </div>  
                      <div class="x-attachment-toolbar" data-bind="if:$model.$activeDoc.get(),style:{display:$model.$activeDoc.get()?($('html').hasClass('flexboxlegacy')?'flex':'inline-block'):'none'}"
                        xid="div165"> 
                        <div class="x-item-name" xid="div166"> 
                          <a class="btn btn-link" data-bind="enable:($model.$activeDoc.get().fileID.get() &amp;&amp; $model.$access.get() % 4 &gt;= 2),click:$model.previewOrRemoveItem.bind($model,$model.$activeDoc.get()),text:$model.$activeDoc.get().docName.get()"
                            xid="a40"/>  
                          <span class="btn btn-link" data-bind="enable:false,text:$model.getFormatSize($model.$activeDoc.get())"
                            xid="span13"/>
                        </div>  
                        <div class="x-item-edit" xid="div167"> 
                          <a class="btn btn-link" data-bind="enable:$model.$access.get() % 1024 &gt;= 512,click:$model.editDoc.bind($model,$model.$activeDoc.get())"
                            xid="a41">编辑</a>
                        </div>  
                        <div class="x-item-download" xid="div168"> 
                          <a class="btn btn-link" data-bind="enable:$model.$access.get() % 1024 &gt;= 512,click:$model.showHistory.bind($model,$model.$activeDoc.get())"
                            xid="a42">历史</a>
                        </div>  
                        <div class="x-item-download" xid="div169"> 
                          <a class="btn btn-link" data-bind="enable:($model.$activeDoc.get().fileID.get() &amp;&amp; $model.$access.get() % 8 &gt;= 4),click:$model.downloadDoc.bind($model,$model.$activeDoc.get())"
                            xid="a43">下载</a>
                        </div>  
                        <div class="x-item-delete" xid="div170"> 
                          <a class="btn btn-link" data-bind="enable:$model.$access.get() % 2048 &gt;= 1024,click:$model.deleteDoc.bind($model,$model.$activeDoc.get())"
                            xid="a44">删除</a>
                        </div> 
                      </div>  
                      <div style="clear:both;" xid="div171"/>
                    </div> 
                  </div> 
                </div>
              </div>
            </div>  
            <div class="tab-pane" xid="tabContent13">
              <div class="x-cell-layout" component="$UI/system/components/justep/cellLayout/cellLayout"
                style="width:100%; height: 100%;" xid="cellLayout6">
                <layout-content xid="default25"><![CDATA[
  <table cellspacing="0" cellpadding="0" rowHeight="19" columnWidth="80" style="border-collapse:collapse;table-layout:fixed;width:1px;">
     <tr><td ></td><td  style="width: 15px;"></td><td  style="width: 800px;"></td></tr>
     <tr><td ></td><td  style="height: 19px;"></td><td  style="height: 19px;"></td></tr>
     <tr><td ></td><td  style="height: 19px;"></td><td  style="height: 19px;">本示例展示在附件组件的onStart事件中阻止上传重复文件。</td></tr>
     <tr><td  style="height: 5px;"></td><td  style="height: 5px;"></td><td  style="height: 5px; border-bottom-width: 1px; border-bottom-color: rgb(128, 128, 128); border-bottom-style: solid;"></td></tr>
     <tr><td ></td><td  style="height: 19px; border-right-width: 1px; border-right-color: rgb(128, 128, 128); border-right-style: solid;"></td><td  style="height: 19px; border: 1px solid rgb(128, 128, 128);" componentId="attachmentEditor_Extend_LimitUpload"></td></tr>
     <tr><td  style="height: 5px;"></td><td  style="height: 5px;"></td><td  style="height: 5px;"></td></tr>
     <tr><td ></td><td  style="height: 19px;"></td><td  style="height: 19px; color: rgb(0, 0, 255); border-bottom-width: 1px; border-bottom-color: rgb(128, 128, 128); border-bottom-style: solid;">示例代码（onStart事件）</td></tr>
     <tr><td  style="height: 250px;"></td><td  style="height: 250px; border-right-width: 1px; border-right-color: rgb(128, 128, 128); border-right-style: solid;"></td><td  style="height: 250px; border: 1px solid rgb(128, 128, 128);" componentId="divCode_LimitUpload"></td></tr>
  </table>
]]></layout-content>  
                <div component="$UI/system/components/justep/attachment/attachmentPC"
                  access="duud" xid="attachmentEditor_Extend_LimitUpload" class=" x-cell-control"
                  bind-ref="dAttachment_Extend_LimitUpload.ref('fAttachment')" onStart="attachmentEditor_Extend_LimitUploadStart"> 
                  <div class="x-attachment-pc" xid="div172"> 
                    <div class="x-attachment-content x-card-border" xid="div173"> 
                      <div class="x-doc-process" xid="div174"> 
                        <div class="progress-bar x-doc-process-bar" role="progressbar"
                          style="width:0%;" xid="progressBar11"/>
                      </div>  
                      <div class="x-attachment-cell-tpl" data-bind="foreach:$attachmentItems"
                        xid="div175"> 
                        <div class="x-attachment-cell x-attachment-item" xid="div176"> 
                          <div class="x-item-other x-item-icon" data-bind="event:{mouseover:function(){if($model.$state.get()!='upload'){return;} $model.$activeDoc.set($object)}},click:$model.previewOrRemoveItem.bind($model),style:{opacity: $model.$access.get() % 4 &gt;= 2 || $model.$state.get() == 'remove' ? '1.0' : '0.5',backgroundImage:($model.previewPicture.bind($model,$object))()},css:{'x-doc-item-active':$model.$activeDoc.get() == $object}"
                            xid="div177"> 
                            <a data-bind="visible:$model.$state.get() == 'remove'"
                              class="x-remove-barget" xid="a45"/>
                          </div> 
                        </div> 
                      </div>  
                      <div class="x-attachment-cell x-attachment-item" data-bind="visible:$state.get() == 'upload' &amp;&amp; ($limit.get() == '-1' || $limit.get() &gt; $attachmentItems.get().length)"
                        xid="div178"> 
                        <div class="x-item-icon x-item-upload" data-bind="visible:$state.get() == 'upload' &amp;&amp; $access.get() % 512 &gt;= 256"
                          xid="div179"/>
                      </div>  
                      <div class="x-attachment-cell x-attachment-item" data-bind="visible:$state.get() == 'upload' &amp;&amp; ($limit.get() == '-1' || $limit.get() &gt; $attachmentItems.get().length)"
                        xid="div180"> 
                        <div class="x-item-icon x-item-new-tpl" data-bind="visible:$state.get() == 'upload' &amp;&amp; $access.get() % 512 &gt;= 256,click:$model.newFormTemplate.bind($model)"
                          xid="div181"/>
                      </div>  
                      <div class="x-attachment-cell x-attachment-item" data-bind="visible:$state.get() == 'upload' &amp;&amp; $attachmentItems.get().length &gt; 0"
                        xid="div182"> 
                        <div class="x-item-icon x-item-remove" data-bind="click:changeState.bind($object,'remove'),visible:$access.get() % 2048 &gt;= 1024"
                          xid="div183"/>
                      </div>  
                      <div class="x-attachment-toolbar" data-bind="if:$model.$activeDoc.get(),style:{display:$model.$activeDoc.get()?($('html').hasClass('flexboxlegacy')?'flex':'inline-block'):'none'}"
                        xid="div184"> 
                        <div class="x-item-name" xid="div185"> 
                          <a class="btn btn-link" data-bind="enable:($model.$activeDoc.get().fileID.get() &amp;&amp; $model.$access.get() % 4 &gt;= 2),click:$model.previewOrRemoveItem.bind($model,$model.$activeDoc.get()),text:$model.$activeDoc.get().docName.get()"
                            xid="a46"/>  
                          <span class="btn btn-link" data-bind="enable:false,text:$model.getFormatSize($model.$activeDoc.get())"
                            xid="span14"/>
                        </div>  
                        <div class="x-item-edit" xid="div186"> 
                          <a class="btn btn-link" data-bind="enable:$model.$access.get() % 1024 &gt;= 512,click:$model.editDoc.bind($model,$model.$activeDoc.get())"
                            xid="a47">编辑</a>
                        </div>  
                        <div class="x-item-download" xid="div187"> 
                          <a class="btn btn-link" data-bind="enable:$model.$access.get() % 1024 &gt;= 512,click:$model.showHistory.bind($model,$model.$activeDoc.get())"
                            xid="a48">历史</a>
                        </div>  
                        <div class="x-item-download" xid="div188"> 
                          <a class="btn btn-link" data-bind="enable:($model.$activeDoc.get().fileID.get() &amp;&amp; $model.$access.get() % 8 &gt;= 4),click:$model.downloadDoc.bind($model,$model.$activeDoc.get())"
                            xid="a49">下载</a>
                        </div>  
                        <div class="x-item-delete" xid="div189"> 
                          <a class="btn btn-link" data-bind="enable:$model.$access.get() % 2048 &gt;= 1024,click:$model.deleteDoc.bind($model,$model.$activeDoc.get())"
                            xid="a50">删除</a>
                        </div> 
                      </div>  
                      <div style="clear:both;" xid="div190"/>
                    </div> 
                  </div> 
                </div>  
                <div xid="divCode_LimitUpload" class=" x-cell-control"/>
              </div>
            </div>  
            <div class="tab-pane" xid="tabContent14">
              <div class="x-cell-layout" component="$UI/system/components/justep/cellLayout/cellLayout"
                style="width:100%; height: 100%;" xid="cellLayout7">
                <layout-content xid="default29"><![CDATA[
  <table cellspacing="0" cellpadding="0" rowHeight="19" columnWidth="80" style="border-collapse:collapse;table-layout:fixed;width:1px;">
     <tr><td ></td><td  style="width: 15px;"></td><td  style="width: 800px;"></td></tr>
     <tr><td ></td><td  style="height: 19px;"></td><td  style="height: 19px;"></td></tr>
     <tr><td  style="height: 19px;"></td><td  style="height: 19px;"></td><td  style="height: 19px;">本示例展示运行时通过“onNewFromTemplate”事件，指定文档的新建模板。</td></tr>
     <tr><td  style="height: 5px;"></td><td  style="height: 5px;"></td><td  style="height: 5px;"></td></tr>
     <tr><td ></td><td  style="height: 19px;"></td><td  style="height: 19px; border-bottom-width: 1px; border-bottom-color: rgb(128, 128, 128); border-bottom-style: solid;">选择新建模板：</td></tr>
     <tr><td  style="height: 150px;"></td><td  style="height: 150px; border-right-width: 1px; border-right-color: rgb(128, 128, 128); border-right-style: solid;"></td><td  style="height: 150px; border: 1px solid rgb(128, 128, 128);" componentId="grid1"></td></tr>
     <tr><td  style="height: 5px;"></td><td  style="height: 5px;"></td><td  style="height: 5px;"></td></tr>
     <tr><td ></td><td  style="height: 19px;"></td><td  style="height: 19px; border-bottom-width: 1px; border-bottom-color: rgb(128, 128, 128); border-bottom-style: solid;">用上面选择的模板创建文档：</td></tr>
     <tr><td ></td><td  style="height: 19px; border-right-width: 1px; border-right-color: rgb(128, 128, 128); border-right-style: solid;"></td><td  style="height: 19px; border: 1px solid rgb(128, 128, 128);" componentId="attachmentEditor_Extend_SetTemplate_Temp"></td></tr>
     <tr><td  style="height: 5px;"></td><td  style="height: 5px;"></td><td  style="height: 5px;"></td></tr>
     <tr><td ></td><td  style="height: 19px;"></td><td  style="height: 19px; border-bottom-width: 1px; border-bottom-color: rgb(128, 128, 128); border-bottom-style: solid; color: rgb(0, 0, 255);">示例代码（onNewFromTemplate事件）</td></tr>
     <tr><td  style="height: 300px;"></td><td  style="height: 300px; border-right-width: 1px; border-right-color: rgb(128, 128, 128); border-right-style: solid;"></td><td  style="height: 300px; border: 1px solid rgb(128, 128, 128);" componentId="divCode_SetTemplate"></td></tr>
  </table>
]]></layout-content>  
                <div component="$UI/system/components/justep/grid/grid" hiddenCaptionbar="true"
                  altRows="true" class="x-grid-no-bordered x-cell-control" xid="grid1"
                  data="dAttachment_Extend_SetTemplate" height="150" width="100%"> 
                  <columns xid="columns1">
                    <column width="300" name="fAttachment" xid="column1" label="&lt;div style='width:100%;text-align:center;'&gt;模板&lt;/div&gt;">
                      <editor xid="editor1"> 
                        <div component="$UI/system/components/justep/attachment/attachmentPC"
                          access="duud" xid="attachmentPC10" bind-ref="$model.dAttachment_Extend_SetTemplate_Temp.ref('fAttachment')"> 
                          <div class="x-attachment-pc" xid="div223"> 
                            <div class="x-attachment-content x-card-border"
                              xid="div224"> 
                              <div class="x-doc-process" xid="div225"> 
                                <div class="progress-bar x-doc-process-bar"
                                  role="progressbar" style="width:0%;" xid="progressBar14"/>
                              </div>  
                              <div class="x-attachment-cell-tpl" data-bind="foreach:$attachmentItems"
                                xid="div226"> 
                                <div class="x-attachment-cell x-attachment-item"
                                  xid="div227"> 
                                  <div class="x-item-other x-item-icon" data-bind="event:{mouseover:function(){if($model.$state.get()!='upload'){return;} $model.$activeDoc.set($object)}},click:$model.previewOrRemoveItem.bind($model),style:{opacity: $model.$access.get() % 4 &gt;= 2 || $model.$state.get() == 'remove' ? '1.0' : '0.5',backgroundImage:($model.previewPicture.bind($model,$object))()},css:{'x-doc-item-active':$model.$activeDoc.get() == $object}"
                                    xid="div228"> 
                                    <a data-bind="visible:$model.$state.get() == 'remove'"
                                      class="x-remove-barget" xid="a58"/>
                                  </div> 
                                </div> 
                              </div>  
                              <div class="x-attachment-cell x-attachment-item"
                                data-bind="visible:$state.get() == 'upload' &amp;&amp; ($limit.get() == '-1' || $limit.get() &gt; $attachmentItems.get().length)"
                                xid="div229"> 
                                <div class="x-item-icon x-item-upload" data-bind="visible:$state.get() == 'upload' &amp;&amp; $access.get() % 512 &gt;= 256"
                                  xid="div230"/>
                              </div>  
                              <div class="x-attachment-cell x-attachment-item"
                                data-bind="visible:$state.get() == 'upload' &amp;&amp; ($limit.get() == '-1' || $limit.get() &gt; $attachmentItems.get().length)"
                                xid="div231"> 
                                <div class="x-item-icon x-item-new-tpl" data-bind="visible:$state.get() == 'upload' &amp;&amp; $access.get() % 512 &gt;= 256,click:$model.newFormTemplate.bind($model)"
                                  xid="div232"/>
                              </div>  
                              <div class="x-attachment-cell x-attachment-item"
                                data-bind="visible:$state.get() == 'upload' &amp;&amp; $attachmentItems.get().length &gt; 0"
                                xid="div233"> 
                                <div class="x-item-icon x-item-remove" data-bind="click:changeState.bind($object,'remove'),visible:$access.get() % 2048 &gt;= 1024"
                                  xid="div234"/>
                              </div>  
                              <div class="x-attachment-toolbar" data-bind="if:$model.$activeDoc.get(),style:{display:$model.$activeDoc.get()?($('html').hasClass('flexboxlegacy')?'flex':'inline-block'):'none'}"
                                xid="div235"> 
                                <div class="x-item-name" xid="div236"> 
                                  <a class="btn btn-link" data-bind="enable:($model.$activeDoc.get().fileID.get() &amp;&amp; $model.$access.get() % 4 &gt;= 2),click:$model.previewOrRemoveItem.bind($model,$model.$activeDoc.get()),text:$model.$activeDoc.get().docName.get()"
                                    xid="a59"/>  
                                  <span class="btn btn-link" data-bind="enable:false,text:$model.getFormatSize($model.$activeDoc.get())"
                                    xid="span16"/>
                                </div>  
                                <div class="x-item-edit" xid="div237"> 
                                  <a class="btn btn-link" data-bind="enable:$model.$access.get() % 1024 &gt;= 512,click:$model.editDoc.bind($model,$model.$activeDoc.get())"
                                    xid="a60">编辑</a>
                                </div>  
                                <div class="x-item-download" xid="div238"> 
                                  <a class="btn btn-link" data-bind="enable:$model.$access.get() % 1024 &gt;= 512,click:$model.showHistory.bind($model,$model.$activeDoc.get())"
                                    xid="a61">历史</a>
                                </div>  
                                <div class="x-item-download" xid="div239"> 
                                  <a class="btn btn-link" data-bind="enable:($model.$activeDoc.get().fileID.get() &amp;&amp; $model.$access.get() % 8 &gt;= 4),click:$model.downloadDoc.bind($model,$model.$activeDoc.get())"
                                    xid="a62">下载</a>
                                </div>  
                                <div class="x-item-delete" xid="div240"> 
                                  <a class="btn btn-link" data-bind="enable:$model.$access.get() % 2048 &gt;= 1024,click:$model.deleteDoc.bind($model,$model.$activeDoc.get())"
                                    xid="a63">删除</a>
                                </div> 
                              </div>  
                              <div style="clear:both;" xid="div241"/>
                            </div> 
                          </div> 
                        </div>
                      </editor>
                    </column>
                  </columns>
                </div>  
                <div component="$UI/system/components/justep/attachment/attachmentPC"
                  access="duud" xid="attachmentEditor_Extend_SetTemplate_Temp" class=" x-cell-control"
                  bind-ref="dAttachment_Extend_SetTemplate_Temp.ref('fAttachment')"
                  onNewFromTemplate="attachmentEditor_Extend_SetTemplate_TempNewFromTemplate"> 
                  <div class="x-attachment-pc" xid="div192"> 
                    <div class="x-attachment-content x-card-border" xid="div193"> 
                      <div class="x-doc-process" xid="div194"> 
                        <div class="progress-bar x-doc-process-bar" role="progressbar"
                          style="width:0%;" xid="progressBar12"/>
                      </div>  
                      <div class="x-attachment-cell-tpl" data-bind="foreach:$attachmentItems"
                        xid="div195"> 
                        <div class="x-attachment-cell x-attachment-item" xid="div196"> 
                          <div class="x-item-other x-item-icon" data-bind="event:{mouseover:function(){if($model.$state.get()!='upload'){return;} $model.$activeDoc.set($object)}},click:$model.previewOrRemoveItem.bind($model),style:{opacity: $model.$access.get() % 4 &gt;= 2 || $model.$state.get() == 'remove' ? '1.0' : '0.5',backgroundImage:($model.previewPicture.bind($model,$object))()},css:{'x-doc-item-active':$model.$activeDoc.get() == $object}"
                            xid="div197"> 
                            <a data-bind="visible:$model.$state.get() == 'remove'"
                              class="x-remove-barget" xid="a51"/>
                          </div> 
                        </div> 
                      </div>  
                      <div class="x-attachment-cell x-attachment-item" data-bind="visible:$state.get() == 'upload' &amp;&amp; ($limit.get() == '-1' || $limit.get() &gt; $attachmentItems.get().length)"
                        xid="div198"> 
                        <div class="x-item-icon x-item-upload" data-bind="visible:$state.get() == 'upload' &amp;&amp; $access.get() % 512 &gt;= 256"
                          xid="div199"/>
                      </div>  
                      <div class="x-attachment-cell x-attachment-item" data-bind="visible:$state.get() == 'upload' &amp;&amp; ($limit.get() == '-1' || $limit.get() &gt; $attachmentItems.get().length)"
                        xid="div200"> 
                        <div class="x-item-icon x-item-new-tpl" data-bind="visible:$state.get() == 'upload' &amp;&amp; $access.get() % 512 &gt;= 256,click:$model.newFormTemplate.bind($model)"
                          xid="div201"/>
                      </div>  
                      <div class="x-attachment-cell x-attachment-item" data-bind="visible:$state.get() == 'upload' &amp;&amp; $attachmentItems.get().length &gt; 0"
                        xid="div202"> 
                        <div class="x-item-icon x-item-remove" data-bind="click:changeState.bind($object,'remove'),visible:$access.get() % 2048 &gt;= 1024"
                          xid="div203"/>
                      </div>  
                      <div class="x-attachment-toolbar" data-bind="if:$model.$activeDoc.get(),style:{display:$model.$activeDoc.get()?($('html').hasClass('flexboxlegacy')?'flex':'inline-block'):'none'}"
                        xid="div204"> 
                        <div class="x-item-name" xid="div205"> 
                          <a class="btn btn-link" data-bind="enable:($model.$activeDoc.get().fileID.get() &amp;&amp; $model.$access.get() % 4 &gt;= 2),click:$model.previewOrRemoveItem.bind($model,$model.$activeDoc.get()),text:$model.$activeDoc.get().docName.get()"
                            xid="a52"/>  
                          <span class="btn btn-link" data-bind="enable:false,text:$model.getFormatSize($model.$activeDoc.get())"
                            xid="span15"/>
                        </div>  
                        <div class="x-item-edit" xid="div206"> 
                          <a class="btn btn-link" data-bind="enable:$model.$access.get() % 1024 &gt;= 512,click:$model.editDoc.bind($model,$model.$activeDoc.get())"
                            xid="a53">编辑</a>
                        </div>  
                        <div class="x-item-download" xid="div207"> 
                          <a class="btn btn-link" data-bind="enable:$model.$access.get() % 1024 &gt;= 512,click:$model.showHistory.bind($model,$model.$activeDoc.get())"
                            xid="a54">历史</a>
                        </div>  
                        <div class="x-item-download" xid="div208"> 
                          <a class="btn btn-link" data-bind="enable:($model.$activeDoc.get().fileID.get() &amp;&amp; $model.$access.get() % 8 &gt;= 4),click:$model.downloadDoc.bind($model,$model.$activeDoc.get())"
                            xid="a55">下载</a>
                        </div>  
                        <div class="x-item-delete" xid="div209"> 
                          <a class="btn btn-link" data-bind="enable:$model.$access.get() % 2048 &gt;= 1024,click:$model.deleteDoc.bind($model,$model.$activeDoc.get())"
                            xid="a56">删除</a>
                        </div> 
                      </div>  
                      <div style="clear:both;" xid="div210"/>
                    </div> 
                  </div> 
                </div>  
                <div xid="divCode_SetTemplate" class=" x-cell-control"/>
              </div>
            </div>  
            <div class="tab-pane" xid="tabContent15">
              <div class="x-cell-layout" component="$UI/system/components/justep/cellLayout/cellLayout"
                style="width:100%; height: 100%;" xid="cellLayout8">
                <layout-content xid="default36"><![CDATA[
  <table cellspacing="0" cellpadding="0" rowHeight="19" columnWidth="80" style="border-collapse:collapse;table-layout:fixed;width:1px;">
     <tr><td ></td><td  style="width: 15px;"></td><td  style="width: 800px;"></td></tr>
     <tr><td ></td><td  style="height: 19px;"></td><td  style="height: 19px;"></td></tr>
     <tr><td  style="height: 19px;"></td><td  style="height: 19px;"></td><td  style="height: 19px;">X5的文档和附件除了提供展现层的组件支持，同时了提供基于Java的文档系列API，用于开发者在代码中控制文档的上传、下载、删除等操作。</td></tr>
     <tr><td ></td><td  style="height: 19px;"></td><td  style="height: 19px;">本案例的初始化脚本中提供了相应的代码，可供参考：</td></tr>
     <tr><td ></td><td  style="height: 19px;"></td><td  style="height: 19px;">　　/BIZ/demo/common/logic/code/dsrc/InitAttachments.java</td></tr>
     <tr><td ></td><td  style="height: 19px;"></td><td  style="height: 19px;">　　/BIZ/demo/common/logic/code/dsrc/DocTools.java</td></tr>
  </table>
]]></layout-content>
              </div>
            </div>
          </div> 
        </div>
      </div> 
    </div> 
  </div>  
  </div>
