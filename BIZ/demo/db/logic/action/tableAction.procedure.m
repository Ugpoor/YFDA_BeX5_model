<?xml version="1.0" encoding="utf-8"?>

<model xmlns="http://www.justep.com/model" xmlns:m="http://www.justep.com/model">  
  <procedure name="createCalendarProcedure" code-model="/demo/db/logic/code" code="Db.createCalendar"> 
    <parameter name="year" type="Integer"/>
    <parameter name="month" type="Integer"/>
  </procedure>  
  <procedure name="returnTableProcedure" code-model="/demo/db/logic/code" code="Db.returnTable"/>  
  <procedure name="addTableRowProcedure" code-model="/demo/db/logic/code" code="Db.addTableRow"> 
    <parameter name="table" type="Table"/> 
  </procedure>  
  <procedure name="delTableRowProcedure" code-model="/demo/db/logic/code" code="Db.delTableRow"> 
    <parameter name="table" type="Table"/>  
    <parameter name="id" type="String"/> 
  </procedure>  
  <procedure name="addColumnProcedure" code-model="/demo/db/logic/code" code="Db.addColumn"> 
    <parameter name="table" type="Table"/>  
    <parameter name="columnName" type="String"/> 
  </procedure>  
  <procedure name="delColumnProcedure" code-model="/demo/db/logic/code" code="Db.delColumn"> 
    <parameter name="table" type="Table"/>  
    <parameter name="columnName" type="String"/> 
  </procedure>  
  <procedure name="listTableProcedure" code-model="/demo/db/logic/code" code="Db.listTable"> 
    <parameter name="table" type="Table"/>  
    <parameter name="columnName" type="String"/> 
  </procedure> 
</model>
