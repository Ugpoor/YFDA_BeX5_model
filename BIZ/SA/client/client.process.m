<?xml version="1.0" encoding="UTF-8"?>
<model xmlns="http://www.justep.com/model">
<process name="clientProcess">
<static-activity name="mainActivity"><label language="zh_CN">租户管理</label>
</static-activity>
<label language="zh_CN">租户管理</label>

<static-activity name="appActivity"><label language="zh_CN">应用管理</label>
</static-activity>
<static-activity name="vendorActivity"><label language="zh_CN">供应商管理</label>
</static-activity>
<static-activity name="clientAppActivity"><label language="zh_CN">应用租用管理</label>
</static-activity>





























































<has-action action="querySA_ClientAction" access-permission="public"></has-action>
<has-action action="saveSA_ClientAction" access-permission="public"></has-action>
<has-action action="createSA_ClientAction" access-permission="public"></has-action>
<has-action action="querySA_ClientAppAction" access-permission="public"></has-action>
<has-action action="saveSA_ClientAppAction" access-permission="public"></has-action>
<has-action action="createSA_ClientAppAction" access-permission="public"></has-action>
<has-action action="querySA_AppAction" access-permission="public"></has-action>
<has-action action="saveSA_AppAction" access-permission="public"></has-action>
<has-action action="querySA_AppVendorAction" access-permission="public"></has-action>
<has-action action="saveSA_AppVendorAction" access-permission="public"></has-action>
<has-action action="createSA_AppVendorAction" access-permission="public"></has-action>
<has-action action="createSA_AppAction" access-permission="public"></has-action>
<has-action action="addClientAction" access-permission="public"></has-action>
<has-action action="addClientAppAction" access-permission="public"></has-action>
<has-action action="addAppAction" access-permission="public"></has-action>
</process>
</model>