<?xml version="1.0" encoding="utf-8"?>
<model xmlns="http://www.justep.com/model"
	xmlns:m="http://www.justep.com/model">

	
	
	<fn name="nextSeq" category="数据函数" code-model="/system/logic/code" code="DataFn.nextSeq" type="Integer">
		<label language="zh_CN">流水号</label>
		<parameter name="key" type="String"/>
	</fn>
	<fn name="nextSeqString" category="数据函数" code-model="/system/logic/code" code="DataFn.nextSeqString" type="String">
		<label language="zh_CN">流水号字符串</label>
		<parameter name="key" type="String"/>
		<parameter name="format" type="String"/>
	</fn>

	<fn name="tempNextSeq" category="数据函数" code-model="/system/logic/code" code="DataFn.tempNextSeq" type="Integer">
		<label language="zh_CN">不占位流水号</label>
		<parameter name="key" type="String"/>
	</fn>	
	<fn name="tempNextSeqString" category="数据函数" code-model="/system/logic/code" code="DataFn.tempNextSeqString" type="String">
		<label language="zh_CN">不占位流水号字符串</label>
		<parameter name="key" type="String"/>
		<parameter name="format" type="String"/>
	</fn>

	<fn name="normalizeKey" category="数据函数" code-model="/system/logic/code" code="DataFn.normalizeKey" type="String">
		<label language="zh_CN">联合主键</label>
		<parameter name="value" type="Object..."/>
	</fn>	
	
	<fn name="relationValue" category="数据函数" code-model="/system/logic/code" code="DataFn.relationValue" type="Object">
		<label language="zh_CN">取关系的第一个值</label>
		<parameter name="concept" type="String"/>
		<parameter name="id" type="String"/>
		<parameter name="condition" type="String"/>
		<parameter name="orderRelation" type="String"/>
		<parameter name="returnRelation" type="String"/>
		<parameter name="dataModel" type="String"/>
		
	</fn>
	
	<fn name="relationValues" category="数据函数" code-model="/system/logic/code" code="DataFn.relationValues" type="Object">
		<label language="zh_CN">取关系的所有值</label>
		<parameter name="concept" type="String"/>
		<parameter name="id" type="String"/>
		<parameter name="condition" type="String"/>
		<parameter name="orderRelation" type="String"/>
		<parameter name="returnRelation" type="String"/>
		<parameter name="dataModel" type="String"/>
		
	</fn>
	
	<fn name="createSerialNumberByCurrentDate" category="数据函数" code-model="/system/logic/code" code="DataFn.createSerialNumberByCurrentDate" type="String">
		<label language="zh_CN">根据当前日期获取格式化字符串</label>
	</fn>
	
</model>