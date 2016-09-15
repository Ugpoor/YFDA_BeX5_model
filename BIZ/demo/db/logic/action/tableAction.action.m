<?xml version="1.0" encoding="utf-8"?>

<model xmlns="http://www.justep.com/model">  
  <action name="createCalendarAction" global="false" procedure="createCalendarProcedure"> 
    <label language="zh_CN">日历</label>  
    <public type="Integer" name="year"/>
    <public type="Integer" name="month"/> 
  </action>  
  <action name="returnTableAction" global="false" procedure="returnTableProcedure"> 
    <label language="zh_CN">返回Table</label> 
  </action>  
  <action name="addTableRowAction" global="false" procedure="addTableRowProcedure"> 
    <label language="zh_CN">增加行</label>  
    <public type="Table" name="table"/> 
  </action>  
  <action name="delTableRowAction" global="false" procedure="delTableRowProcedure"> 
    <label language="zh_CN">删除行</label>  
    <public type="Table" name="table"/>
    <public type="String" name="id"/> 
  </action>  
  <action name="addColumnAction" global="false" procedure="addColumnProcedure"> 
    <label language="zh_CN">增加列</label>  
    <public type="Table" name="table"/>
    <public type="String" name="columnName"/> 
  </action>  
  <action name="delColumnAction" global="false" procedure="delColumnProcedure"> 
    <label language="zh_CN">删除列</label>  
    <public type="Table" name="table"/>
    <public type="String" name="columnName"/> 
  </action>  
  <action name="listTableAction" global="false" procedure="listTableProcedure">
    <label language="zh_CN">遍历Table</label> 
    <public type="Table" name="table"/>
    <public type="String" name="columnName"/> 
  </action> 
</model>
