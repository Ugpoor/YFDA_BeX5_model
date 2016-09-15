<?xml version="1.0" encoding="utf-8"?>
<model xmlns="http://www.justep.com/model">
	<process name="docPermissionProcess">
		<label language="zh_CN">附件权限配置</label>
		<has-action action="queryDocNodeAction" />
		<has-action action="createDocNodeAction" />
		<has-action action="saveDocNodeAction" />
		<has-action action="queryDocLinkDefineAction" />
		<has-action action="createDocLinkDefineAction" />
		<has-action action="saveDocLinkDefineAction" />
		<has-action action="queryActivityAuthAction" />
		<has-action action="createActivityAuthAction" />
		<has-action action="saveActivityAuthAction" />
		<has-action action="queryActivityTemplateAction" />
		<has-action action="createActivityTemplateAction" />
		<has-action action="saveActivityTemplateAction" />
		<has-action action="queryActivityTemplateFieldAction" />
		<has-action action="createActivityTemplateFieldAction" />
		<has-action action="saveActivityTemplateFieldAction" />
		<static-activity name="mainActivity"></static-activity>
	</process>
</model>
