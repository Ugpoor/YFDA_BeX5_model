<?xml version="1.0" encoding="utf-8"?>

<model xmlns="http://www.justep.com/model" xmlns:m="http://www.justep.com/model">  
  <procedure name="initDocProcedure" code-model="/SA/doc/server/data/init"
    code="com.justep.doc.tools.DocServerTools.initDoc"> 
    <parameter name="initModelPath" type="String"/>
  </procedure> 
  
  <procedure name="exportDocProcedure" code-model="/SA/doc/server/data/init"
    code="com.justep.doc.tools.DocServerTools.exportDoc"> 
    <parameter name="initModelPath" type="String"/>
    <parameter name="table" type="Table"/>
  </procedure>
</model>
