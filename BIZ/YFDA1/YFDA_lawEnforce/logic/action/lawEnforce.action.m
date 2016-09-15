<?xml version="1.0" encoding="UTF-8" standalone="no"?><model xmlns="http://www.justep.com/model"><action name="queryYF_ApplicationAction" procedure="bizQueryProcedure"><permission name="range" type="List"/>
<private name="concept" type="String" value="YF_Application"/>
<private name="select" type="String" value="YF_Application.*"/>
<private name="from" type="String" value="YF_Application YF_Application"/>
<private name="aggregate" type="String"/>
<private name="dataModel" type="String" value="/YFDA1/YFDA_lawEnforce/data"/>
<private name="fnModel" type="String"/>
<protected name="condition" type="String"/>
<public name="distinct" type="Boolean" value="false"/>
<public name="idColumn" type="String" value="YF_Application"/>
<public name="filter" type="String"/>
<public name="limit" type="Integer"/>
<public name="offset" type="Integer"/>
<public name="columns" type="String"/>
<public name="orderBy" type="String"/>
<public name="aggregateColumns" type="String"/>
<public name="variables" type="Map"/>
<label language="zh_CN">查询申请表</label>
</action>
<action name="saveYF_ApplicationAction" procedure="bizSaveProcedure"><permission name="insertRange" type="List"/>
<permission name="deleteRange" type="List"/>
<permission name="updateRange" type="List"/>
<private name="concept" type="String" value="YF_Application"/>
<private name="dataModel" type="String" value="/YFDA1/YFDA_lawEnforce/data"/>
<private name="fnModel" type="String"/>
<protected name="readOnly" type="String"/>
<protected name="notNull" type="String"/>
<public name="table" required="true" type="Table"/>
<label language="zh_CN">保存申请表</label>
</action>
<action name="createYF_ApplicationAction" procedure="bizCreateProcedure"><private name="concept" type="String" value="YF_Application"/>
<private name="fnModel" type="String"/>
<public name="table" required="true" type="Table"/>
<public name="defaultValues" type="Map"/>
<label language="zh_CN">创建申请表</label>
</action>
<action name="queryYF_ApplierAction" procedure="bizQueryProcedure"><permission name="range" type="List"/>
<private name="concept" type="String" value="YF_Applier"/>
<private name="select" type="String" value="YF_Applier.*"/>
<private name="from" type="String" value="YF_Applier YF_Applier"/>
<private name="aggregate" type="String"/>
<private name="dataModel" type="String" value="/YFDA1/YFDA_lawEnforce/data"/>
<private name="fnModel" type="String"/>
<protected name="condition" type="String"/>
<public name="distinct" type="Boolean" value="false"/>
<public name="idColumn" type="String" value="YF_Applier"/>
<public name="filter" type="String"/>
<public name="limit" type="Integer"/>
<public name="offset" type="Integer"/>
<public name="columns" type="String"/>
<public name="orderBy" type="String"/>
<public name="aggregateColumns" type="String"/>
<public name="variables" type="Map"/>
<label language="zh_CN">创建申请人</label>
</action>
<action name="saveYF_ApplierAction" procedure="bizSaveProcedure"><permission name="insertRange" type="List"/>
<permission name="deleteRange" type="List"/>
<permission name="updateRange" type="List"/>
<private name="concept" type="String" value="YF_Applier"/>
<private name="dataModel" type="String" value="/YFDA1/YFDA_lawEnforce/data"/>
<private name="fnModel" type="String"/>
<protected name="readOnly" type="String"/>
<protected name="notNull" type="String"/>
<public name="table" required="true" type="Table"/>
<label language="zh_CN">保存申请人</label>
</action>
<action name="createYF_ApplierAction" procedure="bizCreateProcedure"><private name="concept" type="String" value="YF_Applier"/>
<private name="fnModel" type="String"/>
<public name="table" required="true" type="Table"/>
<public name="defaultValues" type="Map"/>
<label language="zh_CN">新建申请人</label>
</action>
<action name="queryYF_AcceAction" procedure="bizQueryProcedure"><permission name="range" type="List"/>
<private name="concept" type="String" value="YF_Acce"/>
<private name="select" type="String" value="YF_Acce.*"/>
<private name="from" type="String" value="YF_Acce YF_Acce"/>
<private name="aggregate" type="String"/>
<private name="dataModel" type="String" value="/YFDA1/YFDA_lawEnforce/data"/>
<private name="fnModel" type="String"/>
<protected name="condition" type="String"/>
<public name="distinct" type="Boolean" value="false"/>
<public name="idColumn" type="String" value="YF_Acce"/>
<public name="filter" type="String"/>
<public name="limit" type="Integer"/>
<public name="offset" type="Integer"/>
<public name="columns" type="String"/>
<public name="orderBy" type="String"/>
<public name="aggregateColumns" type="String"/>
<public name="variables" type="Map"/>
<label language="zh_CN">查询附件</label>
</action>
<action name="saveYF_AcceAction" procedure="bizSaveProcedure"><permission name="insertRange" type="List"/>
<permission name="deleteRange" type="List"/>
<permission name="updateRange" type="List"/>
<private name="concept" type="String" value="YF_Acce"/>
<private name="dataModel" type="String" value="/YFDA1/YFDA_lawEnforce/data"/>
<private name="fnModel" type="String"/>
<protected name="readOnly" type="String"/>
<protected name="notNull" type="String"/>
<public name="table" required="true" type="Table"/>
<label language="zh_CN">保存附件</label>
</action>
<action name="createYF_AcceAction" procedure="bizCreateProcedure"><private name="concept" type="String" value="YF_Acce"/>
<private name="fnModel" type="String"/>
<public name="table" required="true" type="Table"/>
<public name="defaultValues" type="Map"/>
<label language="zh_CN">创建附件</label>
</action>
<action name="queryYF_SQLCAction" procedure="bizQueryProcedure"><permission name="range" type="List"/>
<private name="concept" type="String" value="YF_SQLC"/>
<private name="select" type="String" value="YF_SQLC.*"/>
<private name="from" type="String" value="YF_SQLC YF_SQLC"/>
<private name="aggregate" type="String"/>
<private name="dataModel" type="String" value="/YFDA1/YFDA_lawEnforce/data"/>
<private name="fnModel" type="String"/>
<protected name="condition" type="String"/>
<public name="distinct" type="Boolean" value="false"/>
<public name="idColumn" type="String" value="YF_SQLC"/>
<public name="filter" type="String"/>
<public name="limit" type="Integer"/>
<public name="offset" type="Integer"/>
<public name="columns" type="String"/>
<public name="orderBy" type="String"/>
<public name="aggregateColumns" type="String"/>
<public name="variables" type="Map"/>
<label language="zh_CN">查询流程</label>
</action>
<action name="saveYF_SQLCAction" procedure="bizSaveProcedure"><permission name="insertRange" type="List"/>
<permission name="deleteRange" type="List"/>
<permission name="updateRange" type="List"/>
<private name="concept" type="String" value="YF_SQLC"/>
<private name="dataModel" type="String" value="/YFDA1/YFDA_lawEnforce/data"/>
<private name="fnModel" type="String"/>
<protected name="readOnly" type="String"/>
<protected name="notNull" type="String"/>
<public name="table" required="true" type="Table"/>
<label language="zh_CN">保存流程</label>
</action>
<action name="createYF_SQLCAction" procedure="bizCreateProcedure"><private name="concept" type="String" value="YF_SQLC"/>
<private name="fnModel" type="String"/>
<public name="table" required="true" type="Table"/>
<public name="defaultValues" type="Map"/>
<label language="zh_CN">新建流程</label>
</action>
<action name="queryYF_mainApplicationAction" procedure="bizQueryProcedure"><permission name="range" type="List"/>
<private name="concept" type="String" value="YF_mainApplication"/>
<private name="select" type="String" value="YF_mainApplication.*"/>
<private name="from" type="String" value="YF_mainApplication YF_mainApplication"/>
<private name="aggregate" type="String"/>
<private name="dataModel" type="String" value="/YFDA1/YFDA_lawEnforce/data"/>
<private name="fnModel" type="String"/>
<protected name="condition" type="String"/>
<public name="distinct" type="Boolean" value="false"/>
<public name="idColumn" type="String" value="YF_mainApplication"/>
<public name="filter" type="String"/>
<public name="limit" type="Integer"/>
<public name="offset" type="Integer"/>
<public name="columns" type="String"/>
<public name="orderBy" type="String"/>
<public name="aggregateColumns" type="String"/>
<public name="variables" type="Map"/>
</action>
<action name="saveYF_mainApplicationAction" procedure="bizSaveProcedure"><permission name="insertRange" type="List"/>
<permission name="deleteRange" type="List"/>
<permission name="updateRange" type="List"/>
<private name="concept" type="String" value="YF_mainApplication"/>
<private name="dataModel" type="String" value="/YFDA1/YFDA_lawEnforce/data"/>
<private name="fnModel" type="String"/>
<protected name="readOnly" type="String"/>
<protected name="notNull" type="String"/>
<public name="table" required="true" type="Table"/>
</action>
<action name="createYF_mainApplicationAction" procedure="bizCreateProcedure"><private name="concept" type="String" value="YF_mainApplication"/>
<private name="fnModel" type="String"/>
<public name="table" required="true" type="Table"/>
<public name="defaultValues" type="Map"/>
</action>
<action name="queryYF_ProcessAction" procedure="bizQueryProcedure"><permission name="range" type="List"/>
<private name="concept" type="String" value="YF_Process"/>
<private name="select" type="String" value="YF_Process.*"/>
<private name="from" type="String" value="YF_Process YF_Process"/>
<private name="aggregate" type="String"/>
<private name="dataModel" type="String" value="/YFDA1/YFDA_lawEnforce/data"/>
<private name="fnModel" type="String"/>
<protected name="condition" type="String"/>
<public name="distinct" type="Boolean" value="false"/>
<public name="idColumn" type="String" value="YF_Process"/>
<public name="filter" type="String"/>
<public name="limit" type="Integer"/>
<public name="offset" type="Integer"/>
<public name="columns" type="String"/>
<public name="orderBy" type="String"/>
<public name="aggregateColumns" type="String"/>
<public name="variables" type="Map"/>
</action>
<action name="saveYF_ProcessAction" procedure="bizSaveProcedure"><permission name="insertRange" type="List"/>
<permission name="deleteRange" type="List"/>
<permission name="updateRange" type="List"/>
<private name="concept" type="String" value="YF_Process"/>
<private name="dataModel" type="String" value="/YFDA1/YFDA_lawEnforce/data"/>
<private name="fnModel" type="String"/>
<protected name="readOnly" type="String"/>
<protected name="notNull" type="String"/>
<public name="table" required="true" type="Table"/>
</action>
<action name="createYF_ProcessAction" procedure="bizCreateProcedure"><private name="concept" type="String" value="YF_Process"/>
<private name="fnModel" type="String"/>
<public name="table" required="true" type="Table"/>
<public name="defaultValues" type="Map"/>
</action>

</model>