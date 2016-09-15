<?xml version="1.0" encoding="utf-8"?>

<model xmlns="http://www.justep.com/model">  
  <action name="chartReportAction1" global="false" procedure="chartReportProcedure1"/>  
  <action name="chartReportAction2" global="false" procedure="chartReportProcedure2"/>  
  <action name="parameterFilterReportAction" global="false" procedure="parameterFilterReportProcedure">
    <public type="String" required="false" name="name"/>  
    <public type="String" required="false" name="id"/> 
  </action> 
</model>
