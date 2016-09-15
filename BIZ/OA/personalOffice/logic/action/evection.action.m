<?xml version="1.0" encoding="UTF-8" standalone="no"?><model xmlns="http://www.justep.com/model"><action name="queryOA_EvectionAction" procedure="bizQueryProcedure"><permission name="range" type="List"/>
<private name="concept" type="String" value="OA_Evection"/>
<private name="select" type="String" value="OA_Evection.*"/>
<private name="from" type="String" value="OA_Evection OA_Evection"/>
<private name="aggregate" type="String"/>
<private name="dataModel" type="String" value="/OA/personalOffice/data"/>
<private name="fnModel" type="String"/>
<protected name="condition" type="String"/>
<public name="distinct" type="Boolean" value="false"/>
<public name="idColumn" type="String" value="OA_Evection"/>
<public name="filter" type="String"/>
<public name="limit" type="Integer"/>
<public name="offset" type="Integer"/>
<public name="columns" type="String"/>
<public name="orderBy" type="String"/>
<public name="aggregateColumns" type="String"/>
<public name="variables" type="Map"/>
</action>
<action name="saveOA_EvectionAction" procedure="bizSaveProcedure"><permission name="insertRange" type="List"/>
<permission name="deleteRange" type="List"/>
<permission name="updateRange" type="List"/>
<private name="concept" type="String" value="OA_Evection"/>
<private name="dataModel" type="String" value="/OA/personalOffice/data"/>
<private name="fnModel" type="String"/>
<protected name="readOnly" type="String"/>
<protected name="notNull" type="String"/>
<public name="table" required="true" type="Table"/>
</action>
<action name="createOA_EvectionAction" procedure="bizCreateProcedure"><private name="concept" type="String" value="OA_Evection"/>
<private name="fnModel" type="String"/>
<public name="table" required="true" type="Table"/>
<public name="defaultValues" type="Map"/>
</action>
<action name="queryOA_EvectionPlaceAction" procedure="bizQueryProcedure"><permission name="range" type="List"/>
<private name="concept" type="String" value="OA_EvectionPlace"/>
<private name="select" type="String" value="OA_EvectionPlace.*"/>
<private name="from" type="String" value="OA_EvectionPlace OA_EvectionPlace"/>
<private name="aggregate" type="String"/>
<private name="dataModel" type="String" value="/OA/personalOffice/data"/>
<private name="fnModel" type="String"/>
<protected name="condition" type="String"/>
<public name="distinct" type="Boolean" value="false"/>
<public name="idColumn" type="String" value="OA_EvectionPlace"/>
<public name="filter" type="String"/>
<public name="limit" type="Integer"/>
<public name="offset" type="Integer"/>
<public name="columns" type="String"/>
<public name="orderBy" type="String"/>
<public name="aggregateColumns" type="String"/>
<public name="variables" type="Map"/>
</action>
<action name="saveOA_EvectionPlaceAction" procedure="bizSaveProcedure"><permission name="insertRange" type="List"/>
<permission name="deleteRange" type="List"/>
<permission name="updateRange" type="List"/>
<private name="concept" type="String" value="OA_EvectionPlace"/>
<private name="dataModel" type="String" value="/OA/personalOffice/data"/>
<private name="fnModel" type="String"/>
<protected name="readOnly" type="String"/>
<protected name="notNull" type="String"/>
<public name="table" required="true" type="Table"/>
</action>
<action name="createOA_EvectionPlaceAction" procedure="bizCreateProcedure"><private name="concept" type="String" value="OA_EvectionPlace"/>
<private name="fnModel" type="String"/>
<public name="table" required="true" type="Table"/>
<public name="defaultValues" type="Map"/>
</action>

<action name="queryOA_EvectionOpAction" procedure="bizQueryProcedure"><permission name="range" type="List"/>
<private name="concept" type="String" value="OA_Evection"/>
<private name="select" type="String" value="OA_Evection.*,case when ( SA_Social.sGroupID = 'A' AND SA_Social.sCreateTime &lt;&gt; SA_Social_exe.sCreateTime ) then 'P' else SA_Social.sGroupID end  as sGroupID,SA_Social.sMessageNumber as sMessageNumber"/>
<private name="from" type="String" value="OA_Evection OA_Evection  join (select  SA_Social.sData1, MIN(SA_Social.sGroupID) as sGroupID from SA_Social SA_Social  where  SA_Social.sPersonID = :currentPersonID() AND SA_Social.sTypeID = 'RelativeOrg' AND SA_Social.sValidState = 1   group by SA_Social.sData1) SA_SocialOne on OA_Evection = SA_SocialOne.sData1 join (select  SA_Social.sData1 as sData1, SA_Social.sGroupID as sGroupID, max(SA_Social.sCreateTime) as sCreateTime from SA_Social SA_Social  where  SA_Social.sPersonID = :currentPersonID() AND SA_Social.sTypeID = 'RelativeOrg' AND SA_Social.sValidState = 1   group by SA_Social.sData1, SA_Social.sGroupID) SA_Social_time on OA_Evection = SA_Social_time.sData1 join SA_Social SA_Social on  OA_Evection = SA_Social.sData1 AND SA_Social.sPersonID = :currentPersonID() AND SA_Social.sTypeID = 'RelativeOrg' AND SA_Social.sValidState = 1 AND SA_Social.sGroupID = SA_SocialOne.sGroupID AND SA_Social.sGroupID = SA_Social_time.sGroupID AND SA_Social.sCreateTime = SA_Social_time.sCreateTime  join (select  SA_Social.sData1 as sData1, max(SA_Social.sCreateTime) as sCreateTime from SA_Social SA_Social  where  SA_Social.sTypeID = 'RelativeOrg' AND SA_Social.sValidState = 1 AND SA_Social.sGroupID = 'A'   group by SA_Social.sData1) SA_Social_exe on OA_Evection = SA_Social_exe.sData1"/>
<private name="aggregate" type="String"/>
<private name="dataModel" type="String" value="/OA/personalOffice/data"/>
<private name="fnModel" type="String"/>
<protected name="condition" type="String" value="OA_Evection.fStatus = '未关闭'"/>
<public name="distinct" type="Boolean" value="false"/>
<public name="idColumn" type="String" value="OA_Evection"/>
<public name="filter" type="String"/>
<public name="limit" type="Integer"/>
<public name="offset" type="Integer"/>
<public name="columns" type="String"/>
<public name="orderBy" type="String" value="OA_Evection.fLastModifyTime desc"/>
<public name="aggregateColumns" type="String"/>
<public name="variables" type="Map"/>
<label language="zh_CN">未关闭出差记录</label>
</action>
<action name="queryOA_EvectionClAction" procedure="bizQueryProcedure"><permission name="range" type="List"/>
<private name="concept" type="String" value="OA_Evection"/>
<private name="select" type="String" value="OA_Evection.*,SA_Social.sGroupID as sGroupID,SA_Social.sMessageNumber as sMessageNumber,SA_Social_att.sActive as sActive"/>
<private name="from" type="String" value="OA_Evection OA_Evection  join (select  SA_Social.sData1, MIN(SA_Social.sGroupID) as sGroupID from SA_Social SA_Social  where  SA_Social.sPersonID = :currentPersonID() AND SA_Social.sTypeID = 'RelativeOrg' AND SA_Social.sValidState = 1   group by SA_Social.sData1) SA_SocialOne on OA_Evection = SA_SocialOne.sData1 join (select  SA_Social.sData1 as sData1, SA_Social.sGroupID as sGroupID, max(SA_Social.sCreateTime) as sCreateTime from SA_Social SA_Social  where  SA_Social.sPersonID = :currentPersonID() AND SA_Social.sTypeID = 'RelativeOrg' AND SA_Social.sValidState = 1   group by SA_Social.sData1, SA_Social.sGroupID) SA_Social_time on OA_Evection = SA_Social_time.sData1 join SA_Social SA_Social on  OA_Evection = SA_Social.sData1 AND SA_Social.sPersonID = :currentPersonID() AND SA_Social.sTypeID = 'RelativeOrg' AND SA_Social.sValidState = 1 AND SA_Social.sGroupID = SA_SocialOne.sGroupID AND SA_Social.sGroupID = SA_Social_time.sGroupID AND SA_Social.sCreateTime = SA_Social_time.sCreateTime  optional  join SA_Social SA_Social_att on  OA_Evection = SA_Social_att.sData1 AND SA_Social_att.sPersonID = :currentPersonID() AND SA_Social_att.sTypeID = 'Focus' AND SA_Social_att.sValidState = 1"/>
<private name="aggregate" type="String"/>
<private name="dataModel" type="String" value="/OA/personalOffice/data"/>
<private name="fnModel" type="String"/>
<protected name="condition" type="String" value="OA_Evection.fStatus = '已关闭'"/>
<public name="distinct" type="Boolean" value="false"/>
<public name="idColumn" type="String" value="OA_Evection"/>
<public name="filter" type="String"/>
<public name="limit" type="Integer"/>
<public name="offset" type="Integer"/>
<public name="columns" type="String"/>
<public name="orderBy" type="String" value="OA_Evection.fLastModifyTime desc"/>
<public name="aggregateColumns" type="String"/>
<public name="variables" type="Map"/>
<label language="zh_CN">已关闭出差记录</label>
</action>
<action name="queryOA_Evection1AllAction" procedure="bizQueryProcedure"><permission name="range" type="List"/>
<private name="concept" type="String" value="OA_Evection"/>
<private name="select" type="String" value="OA_Evection.*,case when ( SA_Social.sGroupID = 'A' AND SA_Social.sCreateTime &lt;&gt; SA_Social_exe.sCreateTime ) then 'P' else SA_Social.sGroupID end  as sGroupID,SA_Social.sMessageNumber as sMessageNumber"/>
<private name="from" type="String" value="OA_Evection OA_Evection  join (select  SA_Social.sData1, MIN(SA_Social.sGroupID) as sGroupID from SA_Social SA_Social  where  SA_Social.sPersonID = :currentPersonID() AND SA_Social.sTypeID = 'RelativeOrg' AND SA_Social.sValidState = 1   group by SA_Social.sData1) SA_SocialOne on OA_Evection = SA_SocialOne.sData1 join (select  SA_Social.sData1 as sData1, SA_Social.sGroupID as sGroupID, max(SA_Social.sCreateTime) as sCreateTime from SA_Social SA_Social  where  SA_Social.sPersonID = :currentPersonID() AND SA_Social.sTypeID = 'RelativeOrg' AND SA_Social.sValidState = 1   group by SA_Social.sData1, SA_Social.sGroupID) SA_Social_time on OA_Evection = SA_Social_time.sData1 join SA_Social SA_Social on  OA_Evection = SA_Social.sData1 AND SA_Social.sPersonID = :currentPersonID() AND SA_Social.sTypeID = 'RelativeOrg' AND SA_Social.sValidState = 1 AND SA_Social.sGroupID = SA_SocialOne.sGroupID AND SA_Social.sGroupID = SA_Social_time.sGroupID AND SA_Social.sCreateTime = SA_Social_time.sCreateTime  join (select  SA_Social.sData1 as sData1, max(SA_Social.sCreateTime) as sCreateTime from SA_Social SA_Social  where  SA_Social.sTypeID = 'RelativeOrg' AND SA_Social.sValidState = 1 AND SA_Social.sGroupID = 'A'   group by SA_Social.sData1) SA_Social_exe on OA_Evection = SA_Social_exe.sData1"/>
<private name="aggregate" type="String" value="sum(SA_Social.sMessageNumber) as MsgNum"/>
<private name="dataModel" type="String" value="/OA/personalOffice/data"/>
<private name="fnModel" type="String"/>
<protected name="condition" type="String"/>
<public name="distinct" type="Boolean" value="false"/>
<public name="idColumn" type="String" value="OA_Evection"/>
<public name="filter" type="String"/>
<public name="limit" type="Integer"/>
<public name="offset" type="Integer"/>
<public name="columns" type="String"/>
<public name="orderBy" type="String" value="OA_Evection.fLastModifyTime desc"/>
<public name="aggregateColumns" type="String" value="MsgNum"/>
<public name="variables" type="Map"/>
<label language="zh_CN">全部出差记录</label>
</action>
</model>