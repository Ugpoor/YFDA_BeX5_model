<?xml version="1.0" encoding="utf-8"?>

<model xmlns="http://www.justep.com/model">
	<process name="orderProcess" end="end1" start="start1">
		<label language="zh_CN">订单系统</label>
		<has-action action="queryOrderAction" />
		<has-action action="createOrderAction" />
		<has-action action="saveOrderAction" />
		<has-action action="queryOrder_DAction" />
		<has-action action="createOrder_DAction" />
		<has-action action="saveOrder_DAction" />
		<has-action action="queryCustemorAction" />
		<has-action action="queryProductAction" />
		<has-action action="queryOPPersonAction" />
		<static-activity name="mainActivity">
			<label language="zh_CN">mainActivity</label>
		</static-activity>
		<place name="xor2">
			<label language="zh_CN">XOR</label>
		</place>
		<place name="end1">
			<label language="zh_CN">结束</label>
		</place>
		<token name="t1269245188187" />
		<place name="xor3">
			<label language="zh_CN">XOR</label>
		</place>
		<place name="start1">
			<label language="zh_CN">开始</label>
			<has-token token="t1269245188187" />
		</place>
		<business-activity name="orderReportActivity"
			condition="true">
			<label language="zh_CN">订单申请</label>
			<input name="x" unit="start1" />
			<output name="x" unit="deptActivity" />
			<input name="x" unit="xor3"></input>

			<advance-rule condition="true" dialog-enabled="true"
				save-enabled="false" jump-enabled="false" customized-enabled="true"
				ignore-execute-mode="false" task-wait="false" task-join="false"></advance-rule>
		</business-activity>
		<if-else-activity name="factAmtcondition"
			condition="relationValue('DEMO_Order', :sData1, '', '', 'fTolotalAmt', '/demo/misc/data') &lt; 100000">
			<label language="zh_CN">总金额小于10万？</label>
			<true-output name="x" unit="xor2" />
			<input name="x" unit="deptCondition" />
			<false-output name="x" unit="managerActivity"></false-output>
		</if-else-activity>
		<business-activity name="deptActivity" condition="true">
			<label language="zh_CN">部门经理审核</label>
			<output name="x" unit="deptCondition" />
			<input name="x" unit="orderReportActivity" />
		</business-activity>
		<business-activity name="managerActivity" condition="true">
			<label language="zh_CN">公司总经理审批</label>
			<output name="x" unit="managerCondition" />
			<input name="x" unit="factAmtcondition"></input>
		</business-activity>
		<if-else-activity name="deptCondition"
			condition="relationValue('DEMO_Order',:sData1,'','','fAuditorIsArgee','/demo/misc/data')='1'">
			<label language="zh_CN">审核是否同意？</label>
			<true-output name="x" unit="factAmtcondition" />
			<input name="x" unit="deptActivity" />
			<false-output name="x" unit="xor3"></false-output>
		</if-else-activity>
		<if-else-activity name="managerCondition"
			condition="relationValue('DEMO_Order',:sData1,'','','fExamineIsArgee','/demo/misc/data')='1'">
			<label language="zh_CN">审批是否同意？</label>
			<true-output name="x" unit="totalAmtCondition" />
			<input name="x" unit="managerActivity" />
			<false-output name="x" unit="xor3"></false-output>
		</if-else-activity>
		<if-else-activity name="totalAmtCondition"
			condition="relationValue('DEMO_Order', :sData1, '', '', 'fTolotalAmt', '/demo/misc/data')&gt;1000000">
			<label language="zh_CN">总金额大于100万？</label>
			<true-output name="x" unit="leadActivity" />
			<input name="x" unit="managerCondition" />
			<false-output name="x" unit="xor2"></false-output>
		</if-else-activity>
		<business-activity name="leadActivity" condition="true">
			<label language="zh_CN">通报总公司领导</label>
			<input name="x" unit="totalAmtCondition" />
			<output name="x" unit="xor2"></output>
		</business-activity>
		<business-activity name="salesPersonActivity"
			condition="true">
			<label language="zh_CN">通知销售员</label>
			<output name="x" unit="end1" />
			<input name="x" unit="xor2" />
		</business-activity>

		<static-activity name="queryActivity">
			<label language="zh_CN">查询订单</label>
		</static-activity>
	</process>
</model>
