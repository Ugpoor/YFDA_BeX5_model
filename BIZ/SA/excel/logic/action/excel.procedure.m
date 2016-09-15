<?xml version="1.0" encoding="utf-8"?>

<model xmlns="http://www.justep.com/model" xmlns:m="http://www.justep.com/model">  
  <procedure name="exportExcelProcedure" code-model="/SA/excel/logic/code" code="Excel.exportExcel">
    <parameter name="from" type="String"/>
    <parameter name="config" type="Xml"/>
    <parameter name="data" type="Table"/>
    <parameter name="queryActionParam" type="Map"/>
  </procedure>
  <procedure name="importExcelProcedure" code-model="/SA/excel/logic/code" code="Excel.importExcel">
    <parameter name="config" type="Xml"/>
    <parameter name="createActionParam" type="Map"/>
    <parameter name="saveActionParam" type="Map"/>
  </procedure>
  <procedure name="downloadExportExcelProcedure" code-model="/SA/excel/logic/code" code="Excel.downloadExportExcel">
    <parameter name="fileName" type="String"/>
  </procedure>
  <procedure name="uploadImportExcelProcedure" code-model="/SA/excel/logic/code" code="Excel.uploadImportExcel">
    <parameter name="excel" type="Object"/>
    <parameter name="mapping" type="Object"/>
  </procedure>
  <procedure name="exportExcelBeforeProcedure" code-model="/SA/excel/logic/code" code="com.justep.excel.ExportGenerator.generateBefore">
    <parameter name="data" type="Table"/>
    <parameter name="excel" type="Object"/>
  </procedure>
  <procedure name="exportExcelAfterProcedure" code-model="/SA/excel/logic/code" code="com.justep.excel.ExportGenerator.generateAfter">
    <parameter name="data" type="Table"/>
    <parameter name="excel" type="Object"/>
  </procedure>
  <procedure name="importExcelBeforeProcedure" code-model="/SA/excel/logic/code" code="com.justep.excel.ImportGenerator.generateBefore">
    <parameter name="excel" type="Object"/>
    <parameter name="config" type="Object"/>
  </procedure>
  <procedure name="importExcelAfterProcedure" code-model="/SA/excel/logic/code" code="com.justep.excel.ImportGenerator.generateAfter">
    <parameter name="data" type="Table"/>
    <parameter name="excel" type="Object"/>
    <parameter name="config" type="Object"/>
  </procedure>
</model>
