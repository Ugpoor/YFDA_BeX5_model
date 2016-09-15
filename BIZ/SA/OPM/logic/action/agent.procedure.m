<?xml version="1.0" encoding="utf-8"?>

<model xmlns="http://www.justep.com/model" xmlns:m="http://www.justep.com/model">  
  <procedure name="queryOPAgentProcedure" code-model="/SA/OPM/logic/code" code="AgentProcedure.queryOPAgent"> 
    <parameter name="range" type="List"/>  
    <parameter name="concept" type="String"/>  
    <parameter name="select" type="String"/>  
    <parameter name="from" type="String"/>  
    <parameter name="aggregate" type="String"/>  
    <parameter name="dataModel" type="String"/>  
    <parameter name="fnModel" type="String"/>  
    <parameter name="condition" type="String"/>  
    <parameter name="distinct" type="Boolean"/>  
    <parameter name="idColumn" type="String"/>  
    <parameter name="filter" type="String"/>  
    <parameter name="limit" type="Integer"/>  
    <parameter name="offset" type="Integer"/>  
    <parameter name="columns" type="String"/>  
    <parameter name="orderBy" type="String"/>  
    <parameter name="aggregateColumns" type="String"/>  
    <parameter name="variables" type="Map"/> 
  </procedure>  
  <procedure name="saveOPAgentProcedure" code-model="/SA/OPM/logic/code" code="AgentProcedure.saveOPAgent"> 
    <parameter name="insertRange" type="List"/>  
    <parameter name="deleteRange" type="List"/>  
    <parameter name="updateRange" type="List"/>  
    <parameter name="concept" type="String"/>  
    <parameter name="dataModel" type="String"/>  
    <parameter name="fnModel" type="String"/>  
    <parameter name="readOnly" type="String"/>  
    <parameter name="notNull" type="String"/>  
    <parameter name="table" type="Table"/> 
  </procedure>  
  <procedure name="appendAgentsProcedure" code-model="/SA/OPM/logic/code" code="AgentProcedure.appendAgents"> 
    <parameter name="orgFIDList" type="List"/>  
    <parameter name="processList" type="List"/>  
    <parameter name="agentPersonID" type="String"/>  
    <parameter name="startTime" type="DateTime"/>  
    <parameter name="finishTime" type="DateTime"/>  
    <parameter name="canTranAgent" type="Boolean"/> 
  </procedure>  
  <procedure name="cancelAgentsProcedure" code-model="/SA/OPM/logic/code" code="AgentProcedure.cancelAgents"> 
    <parameter name="agents" type="Map"/> 
  </procedure>  
  <procedure name="deleteAgentsProcedure" code-model="/SA/OPM/logic/code" code="AgentProcedure.deleteAgents"> 
    <parameter name="agents" type="Map"/> 
  </procedure>  
  <procedure name="agentProcessStringToTableProcedure" code-model="/SA/OPM/logic/code" code="AgentProcedure.agentProcessStringToTable"> 
    <parameter name="process" type="String"/> 
  </procedure>  
  <procedure name="agentProcessTableToStringProcedure" code-model="/SA/OPM/logic/code" code="AgentProcedure.agentProcessTableToString"> 
    <parameter name="table" type="Table"/> 
  </procedure>  
  <procedure name="getModelTreeProcedure" code-model="/SA/OPM/logic/code" code="AgentProcedure.getModelTree"/>
</model>
