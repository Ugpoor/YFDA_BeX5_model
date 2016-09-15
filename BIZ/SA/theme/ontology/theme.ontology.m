<?xml version="1.0" encoding="utf-8"?>

<model xmlns="http://www.justep.com/model">  
  <concept name="SA_ThemeDefine" default-value-expr="guid()"> 
    <has-relation relation="version" default-value-expr="0"> 
      <label language="zh_CN">版本</label> 
    </has-relation>  
    <label language="zh_CN">主题定义</label>  
    <has-relation relation="sThemeName"> 
      <label language="zh_CN">主题名</label> 
    </has-relation>  
    <has-relation relation="sThemeLayoutInfo"> 
      <label language="zh_CN">主题页面布局信息</label> 
    </has-relation>  
    <has-relation relation="sThemePublishType"> 
      <label language="zh_CN">主题发布类型</label> 
    </has-relation>  
    <has-relation relation="sThemeActivity"> 
      <label language="zh_CN">是否激活主题</label> 
    </has-relation>  
    <has-relation relation="sCreatorID" default-value-expr="currentPersonID()"> 
      <label language="zh_CN">提交者ID</label> 
    </has-relation> 
  </concept>  
  <concept name="SA_ThemeManager" default-value-expr="guid()"> 
    <has-relation relation="version" default-value-expr="0"> 
      <label language="zh_CN">版本</label> 
    </has-relation>  
    <label language="zh_CN">主题管理</label>  
    <has-relation relation="sThemeID" data-type="String"> 
      <label language="zh_CN">主题</label> 
    </has-relation>  
    <has-relation relation="sOrgID" data-type="String"> 
      <label language="zh_CN">组织</label> 
    </has-relation>  
    <has-relation relation="sThemeActivity"> 
      <label language="zh_CN">是否激活主题</label> 
    </has-relation> 
  </concept>  
  <relation name="sThemeName" data-type="String"> 
    <label language="zh_CN">主题名</label> 
  </relation>  
  <relation name="sThemeLayoutInfo" data-type="String"> 
    <label language="zh_CN">主题页面布局信息</label> 
  </relation>  
  <relation name="sThemePublishType" data-type="String"> 
    <label language="zh_CN">主题发布类型</label> 
  </relation>  
  <relation name="sThemeActivity" data-type="String"> 
    <label language="zh_CN">是否激活主题</label> 
  </relation>  
  <relation name="sThemeID" data-type="String"> 
    <label language="zh_CN">主题</label> 
  </relation>  
  <concept name="SA_PortalProfiles" default-value-expr="guid()"> 
    <has-relation relation="version" default-value-expr="0"> 
      <label language="zh_CN">版本</label> 
    </has-relation>  
    <label language="zh_CN">Portal信息存储</label>  
    <has-relation relation="sName"> 
      <label language="zh_CN">名称</label> 
    </has-relation>  
    <has-relation relation="sPersonID"> 
      <label language="zh_CN">人员</label> 
    </has-relation>  
    <has-relation relation="sValue" size="4000"> 
      <label language="zh_CN">值</label> 
    </has-relation> 
  </concept> 
</model>
