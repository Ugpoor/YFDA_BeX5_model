<?xml version="1.0" encoding="utf-8"?>

<model xmlns="http://www.justep.com/model" xmlns:m="http://www.justep.com/model">  
  <procedure name="chartReportProcedure1" code-model="/demo/report/logic/code" code="PropertyReportProcedure.chartQuery1"/>  
  <procedure name="chartReportProcedure2" code-model="/demo/report/logic/code" code="PropertyReportProcedure.chartQuery2"/>  
  <procedure name="parameterFilterReportProcedure" code-model="/demo/report/logic/code"
    code="PropertyReportProcedure.parameterFilterQuery"> 
    <parameter name="name" type="String"/>  
    <parameter name="id" type="String"/> 
  </procedure> 
</model>
