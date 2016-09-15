<?xml version="1.0" encoding="utf-8"?>

<model xmlns="http://www.justep.com/model" xmlns:m="http://www.justep.com/model">  
  <procedure name="startBorrowBookProcedure" code-model="/demo/actions/logic/code" code="Actions.startBorrowBook"> 
    <parameter name="bookName" type="String"/>  
    <parameter name="startDate" type="Date"/>  
    <parameter name="endDate" type="Date"/>  
    <parameter name="borrower" type="String"/> 
  </procedure>  
  <procedure name="invokeTestWebServiceProcedure" code-model="/demo/actions/logic/code" code="Actions.invokeTestWebService"> 
    <parameter name="a" type="Integer"/>  
    <parameter name="b" type="Integer"/> 
  </procedure>  
  <procedure name="getUserNameAndPasswordProcedure" code-model="/demo/actions/logic/code" code="Actions.getUserNameAndPassword"/>
</model>
