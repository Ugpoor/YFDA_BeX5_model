<?xml version="1.0" encoding="UTF-8"?><model xmlns="http://www.justep.com/model">
<store name="SA_ClientApp"/>
<store name="SA_AppVendor"/>

<store name="SA_App"/>
<store name="SA_Client"/><mapping concept="SA_Client"><table name="SA_Client" type="owner-table"><key field="sID" type="String"/>
</table>
</mapping>
<mapping concept="SA_AppVendor"><table name="SA_AppVendor" type="owner-table"><key field="sID" type="String"/>
</table>
</mapping>
<mapping concept="SA_App"><table name="SA_App" type="owner-table"><key field="sID" type="String"/>
</table>
</mapping>
<mapping concept="SA_ClientApp"><table name="SA_ClientApp" type="owner-table"><key field="sID" type="String"/>
</table>
</mapping>
</model>