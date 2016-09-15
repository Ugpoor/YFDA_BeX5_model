<?xml version="1.0" encoding="UTF-8"?>
<model xmlns="http://www.justep.com/model">
	<process name="customerProcess">
		<label language="zh_CN">客户信息</label>
		<static-activity name="mainActivity">
			<label language="zh_CN">客户信息</label>
		</static-activity>
	


















































<has-action action="queryOA_CustomerAction" access-permission="public"></has-action>
<has-action log-enabled="true" action="saveOA_CustomerAction" access-permission="public"></has-action>
<listener action="saveOA_CustomerAction" event="before" handler="customerProcessBeforeSaveOA_CustomerActionProcedure"></listener>
<listener action="saveOA_CustomerAction" event="after" handler="customerProcessAfterSaveOA_CustomerActionProcedure"></listener>
<has-action action="createOA_CustomerAction" access-permission="public"></has-action>
<has-action action="queryOA_CustomrMoreAction" access-permission="public"></has-action>
<has-action action="saveOA_CustomrMoreAction" access-permission="public"></has-action>
<has-action action="createOA_CustomrMoreAction" access-permission="public"></has-action>
<has-action action="queryOA_CustomerLetterAction" access-permission="public"></has-action>
<has-action action="queryDEMO_ProvinceAction" access-permission="public"></has-action>
<has-action action="queryDEMO_CityAction" access-permission="public"></has-action>
<has-action action="queryDEMO_ZoneAction" access-permission="public"></has-action>
<has-action action="queryOA_CustomerVisitAction" access-permission="public"></has-action>
</process>
</model>
