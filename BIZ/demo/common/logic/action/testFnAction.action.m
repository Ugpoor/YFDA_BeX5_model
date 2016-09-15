<?xml version="1.0" encoding="UTF-8"?>
<model xmlns="http://www.justep.com/model">
<action name="testFnAction" global="false" procedure="testFnProcedure"><label language="zh_CN">testFnAction</label>
<public type="String" name="fn"></public>
<public type="String" name="fnModel" required="true"/>

</action>

<action name="testProcessFnAction" global="false" procedure="testProcessFnProcedure"><label language="zh_CN">testProcessFnAction</label>
<public type="String" name="fn"></public>
<public type="String" name="fnModel" required="true"/>

<public type="String" name="task"></public>
</action>
</model>