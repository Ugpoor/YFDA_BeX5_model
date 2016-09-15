<?xml version="1.0" encoding="UTF-8"?>
<model xmlns="http://www.justep.com/model">
  <mapping concept="DEMO_DocKind">
    <table type="owner-table" name="DEMO_PubBase">
      <key field="fID" type="String"/>
      <discriminator field="fScode" value="DEMO_DocKind"/>
    </table>
  </mapping>
<store name="DEMO_DocKind"/>
</model>