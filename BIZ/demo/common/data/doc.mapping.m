<?xml version="1.0" encoding="UTF-8"?><model xmlns="http://www.justep.com/model">
<store name="DEMO_SendDirect"/>
<store name="DEMO_SecretLevel"/>
<store name="DEMO_ExigenceLevel"/>
<store name="DEMO_DocKind"/>
<store name="DEMO_Doc"/><mapping concept="DEMO_DocKind"><table name="DEMO_Code" type="owner-table"><key field="fID" type="String"/>
<discriminator field="fScope" value="DEMO_DocKind"/>
</table>
</mapping>
<mapping concept="DEMO_ExigenceLevel"><table name="DEMO_Code" type="owner-table"><key field="fID" type="String"/>
<discriminator field="fScope" value="DEMO_ExigenceLevel"/>
</table>
</mapping>
<mapping concept="DEMO_SecretLevel"><table name="DEMO_Code" type="owner-table"><key field="fID" type="String"/>
<discriminator field="fScope" value="DEMO_SecretLevel"/>
</table>
</mapping>
<mapping concept="DEMO_SendDirect"><table name="DEMO_Code" type="owner-table"><key field="fID" type="String"/>
<discriminator field="fScope" value="DEMO_SendDirect"/>
</table>
</mapping>
</model>