<?xml version="1.0" encoding="UTF-8"?><model xmlns="http://www.justep.com/model">
<!-- 
<store name="SA_ReminderDetail"/>
<store name="SA_RemindTask"/>
  <store name="SA_Reminder"/>  
  <store name="SA_RemindActionParameter"/>  
  <mapping concept="SA_Reminder">
    <table name="SA_Reminder" type="owner-table">
      <key field="sID" type="String"/>  
    </table> 
  </mapping>  
  -->
  <mapping concept="SA_Remind">
    <table name="SA_Remind" type="owner-table">
      <key field="sID" type="String"/>  
    </table>  
  </mapping>
  
  <store name="SA_Remind"/>
  <!--   
  <mapping concept="SA_RemindActionParameter">
    <table name="SA_RemindActionParameter" type="owner-table">
      <key field="sID" type="String"/> 
    </table> 
  </mapping>
   --> 
</model>