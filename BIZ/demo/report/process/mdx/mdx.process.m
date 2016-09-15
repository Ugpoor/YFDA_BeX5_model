<?xml version="1.0" encoding="utf-8"?>

<model xmlns="http://www.justep.com/model">
  <process name="mdxProcess" >
    <has-action action="sqlQueryAction">
    	<public name="dataModel" type="String" value="/demo/report/data"/> 
    </has-action>
    <static-activity name="mdxActivity"/>
    <static-activity name="mdxChartActivity"/>    
  </process>
</model>
