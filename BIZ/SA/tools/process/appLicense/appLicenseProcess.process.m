<?xml version="1.0" encoding="UTF-8"?>
<model xmlns="http://www.justep.com/model">
<process name="appLicenseProcess">
<static-activity name="encryptModelActivity"><label language="zh_CN">加密模型</label>

<has-action action="encryptAppAction" access-permission="public"></has-action>
</static-activity>
<static-activity name="makeAppLicenseActivity"><label language="zh_CN">生成应用License</label>
</static-activity>
<label language="zh_CN">应用License</label>
<static-activity name="regAppLicenseActivity"><label language="zh_CN">注册应用License</label>

<has-action action="regAppLicenseAction" access-permission="public"></has-action>
</static-activity>
<static-activity name="createCertActivity"><label language="zh_CN">创建应用开发商数字证书</label>
</static-activity>
</process>
</model>