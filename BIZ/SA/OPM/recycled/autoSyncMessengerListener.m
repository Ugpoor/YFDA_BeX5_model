<?xml version="1.0" encoding="utf-8"?>

<model xmlns="http://www.justep.com/model">  
  <procedure name="autoSyncMessengerListenerProcedure" code-model="/SA/OPM/logic/code/orgSynchronize"
    code="MessengerOrgSynchronizeActions.autoSync"/>
  <listener action="restorePersonAction" event="after" handler="autoSyncMessengerListenerProcedure"></listener>
  <listener action="restoreOrgAction" event="after" handler="autoSyncMessengerListenerProcedure"></listener>
</model>
