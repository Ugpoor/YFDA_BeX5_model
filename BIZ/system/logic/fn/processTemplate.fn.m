<?xml version="1.0" encoding="UTF-8"?>

<model xmlns="http://www.justep.com/model" xmlns:m="http://www.justep.com/model">  
  <fn name="findTemplateByPerson" category="流程模板函数" code-model="/system/logic/code" code="ProcessTemplateFn.findTemplateByPerson" type="String"> 
    <label language="zh_CN">获取指定人的流程模板</label>  
    <parameter name="personID" type="String"/> 
  </fn>  
  <fn name="findTemplateByPersonMember" category="流程模板函数" code-model="/system/logic/code" code="ProcessTemplateFn.findTemplateByPersonMember" type="String"> 
    <label language="zh_CN">获取指定人员成员拥有的流程模板</label>  
    <parameter name="fid" type="String"/> 
  </fn>  
  <fn name="findTemplateByCurrentPerson" category="流程模板函数" code-model="/system/logic/code" code="ProcessTemplateFn.findTemplateByCurrentPerson" type="String"> 
    <label language="zh_CN">获取当前人的流程模板</label>  
  </fn>  
  <fn name="findTemplateByCurrentPersonMember" category="流程模板函数" code-model="/system/logic/code" code="ProcessTemplateFn.findTemplateByCurrentPersonMember" type="String"> 
    <label language="zh_CN">获取当前人员成员的流程模板</label>  
  </fn>  
</model>
