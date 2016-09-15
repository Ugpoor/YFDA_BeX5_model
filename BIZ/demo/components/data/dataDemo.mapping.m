<?xml version="1.0" encoding="UTF-8"?><model xmlns="http://www.justep.com/model">

<store name="DEMO_TABLE3"/>
<store name="DEMO_TABLE2"/>
<store name="DEMO_TABLE1"/>
<mapping concept="DEMO_TABLE1"><table name="DEMO_TABLE1" type="owner-table"><key field="fID" type="String"></key>
<item relation="fParent" field="fParent" type="String"></item>
</table>
</mapping>
<mapping concept="DEMO_TABLE3"><table name="DEMO_TABLE3" type="owner-table"><key field="fID" type="String"></key>
<item relation="fParent" field="fParent" type="String"></item>
</table>
</mapping>
<mapping concept="DEMO_TABLE2"><table name="DEMO_TABLE2" type="owner-table"><key field="fID" type="String"></key>
<item relation="fParent" field="fParent" type="String"></item>
</table>
</mapping>
</model>