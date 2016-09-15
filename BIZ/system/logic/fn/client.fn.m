<?xml version="1.0" encoding="utf-8"?>

<model xmlns="http://www.justep.com/model" xmlns:m="http://www.justep.com/model">  
  <fn name="enabledClient" category="多租户函数" code-model="/system/logic/code" code="ClientFn.enabledClient"
    type="Boolean"> 
    <label language="zh_CN">是否开启了多租户模式</label>  
  </fn>  
  <fn name="clientName" category="多租户函数" code-model="/system/logic/code" code="ClientFn.clientName"
    type="String"> 
    <label language="zh_CN">租户字段名</label>  
  </fn>  
  <fn name="clientValue" category="多租户函数" code-model="/system/logic/code" code="ClientFn.clientValue"
    type="String"> 
    <label language="zh_CN">租户标识</label>  
  </fn>  
  <fn name="clientCode" category="多租户函数" code-model="/system/logic/code" code="ClientFn.clientCode"
    type="String"> 
    <label language="zh_CN">租户编码</label>  
  </fn>  
</model>
