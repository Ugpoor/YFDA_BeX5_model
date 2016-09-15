<model xmlns="http://www.justep.com/model"
	xmlns:m="http://www.justep.com/model">
	<action name="ksqlReportAction"
		procedure="ksqlDemoQueryProcedure">
		<private name="ksql" type="String" value="select SA_WorkRecord.sLock as sLock,SA_WorkRecord.sProjectID as sProjectID,SA_WorkRecord.sCreatorFName as sCreatorFName,SA_WorkRecord.sExecutorFID as sExecutorFID,SA_WorkRecord.sExecutorFName as sExecutorFName,SA_WorkRecord.sCreatorPersonID as sCreatorPersonID,SA_WorkRecord.sCreatorPersonName as sCreatorPersonName,SA_WorkRecord.sCreatorPosID as sCreatorPosID,SA_WorkRecord.sCreatorPosName as sCreatorPosName,SA_WorkRecord.sCreatorDeptID as sCreatorDeptID,SA_WorkRecord.sCreatorDeptName as sCreatorDeptName,SA_WorkRecord.sCreatorOgnID as sCreatorOgnID,SA_WorkRecord.sCreatorOgnName as sCreatorOgnName,SA_WorkRecord.sExecutorPersonID as sExecutorPersonID,SA_WorkRecord.sExecutorPersonName as sExecutorPersonName,SA_WorkRecord.sExecutorPosID as sExecutorPosID,SA_WorkRecord.sExecutorPosName as sExecutorPosName,SA_WorkRecord.sExecutorDeptID as sExecutorDeptID,SA_WorkRecord.sExecutorDeptName as sExecutorDeptName,SA_WorkRecord.sExecutorOgnID as sExecutorOgnID,SA_WorkRecord.sExecutorOgnName as sExecutorOgnName from SA_WorkRecord SA_WorkRecord where SA_WorkRecord.sExecutorPersonName = :p"/>
		<public name="variables" type="Map"/>
		<private name="dataModel" type="String" value="/SA/task/data"/>
		<public name="fnModel" type="String"/>
	</action>
	
	<action name="ksqlChartAction"
		procedure="ksqlDemoQueryProcedure">
		<private name="ksql" type="String" value="select R_BB.fX as fX,R_BB.f1 as f1 from R_BB R_BB"/>
		<public name="variables" type="Map"/>
		<private name="dataModel" type="String" value="/demo/report/data"/>
		<public name="fnModel" type="String"/>
	</action>
	
</model>