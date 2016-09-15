<?xml version="1.0" encoding="UTF-8"?>
<model xmlns="http://www.justep.com/model">
	<process name="ksqlProcess">
		<label language="zh_CN">ksql</label>
		<static-activity name="ksqlReportActivity"/>
		<static-activity name="ksqlChartActivity"/>
		<has-action action="ksqlReportAction"/>
		<has-action action="ksqlChartAction"/>
	</process>
</model>
