<?xml version="1.0" encoding="UTF-8"?>
<model xmlns="http://www.justep.com/model">
  <mapping concept="DEMO_SysWindow">
    <table type="owner-table" name="DEMO_SysWindow">
      <key field="fID" type="String"/>
      <item relation="fCode" field="fCode" type="String"/>
      <item relation="fName" field="fName" type="String"/>
      <item relation="fSequence" field="fSequence" type="Integer"/>
      <item relation="fStandBy" field="fStandBy" type="String"/>
      <item relation="fUpdatePerName" field="fUpdatePerName" type="String"/>
      <item relation="fUpdateTime" field="fUpdateTime" type="DateTime"/>
      <item relation="fYYID" field="fYYID" type="String"/>
      <item relation="fExecutorPersonID" field="fExecutorPersonID" type="String"/>
      <item relation="fExecutorPersonName" field="fExecutorPersonName" type="String"/>
      <item relation="fExecutorDeptID" field="fExecutorDeptID" type="String"/>
      <item relation="fExecutorDeptName" field="fExecutorDeptName" type="String"/>
    </table>
  </mapping>
<store name="DEMO_SysWindow"/>
</model>