<?xml version="1.0" encoding="UTF-8"?>
<model>
	<action name="service" impl="Service::PayNotifyCallBack">
	</action>
	<action name="jsapi" impl="WxMpJsApi::service">
	</action>
	<action name="notify" impl="WxPayNotify::service">
	</action>
	<action name="userinfo" impl="UserInfo::service">
		<public name="code" type="String" />
	</action>
</model>