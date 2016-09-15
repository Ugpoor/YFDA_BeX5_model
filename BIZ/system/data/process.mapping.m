<?xml version="1.0" encoding="UTF-8"?>
<model xmlns="http://www.justep.com/model">
  <mapping concept="SA_TokenInstance">
    <table name="SA_TokenInstance" type="owner-table" shard-strategy="shardInContext()" shards="histroy">
      <key field="sID" type="String"/> 
    </table> 
  </mapping>  
  <mapping concept="SA_ProcessControl">
    <table name="SA_ProcessControl" type="owner-table">
      <key field="sID" type="String"/> 
    </table> 
  </mapping>
  
  <store name="SA_ProcessTemplate"/>
  <mapping concept="SA_ProcessTemplate">
    <table name="SA_ProcessTemplate" type="owner-table">
      <key field="sID" type="String"/> 
    </table> 
  </mapping> 
   
</model>