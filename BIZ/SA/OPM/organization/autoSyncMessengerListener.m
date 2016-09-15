<?xml version="1.0" encoding="utf-8"?>

<model xmlns="http://www.justep.com/model">  
  <procedure name="autoSyncMessengerListenerProcedure" code-model="/SA/OPM/logic/code/orgSynchronize"
    code="MessengerOrgSynchronizeActions.autoSync"/>
  <listener action="saveOPOrgAction" event="after" handler="autoSyncMessengerListenerProcedure"></listener>
  <listener action="saveOPPersonAction" event="after" handler="autoSyncMessengerListenerProcedure"></listener>
  <listener action="disableOrgAction" event="after" handler="autoSyncMessengerListenerProcedure"></listener>
  <listener action="enableOrgAction" event="after" handler="autoSyncMessengerListenerProcedure"></listener>
  <listener action="logicDeleteOrgAction" event="after" handler="autoSyncMessengerListenerProcedure"></listener>
  <listener action="sortOrgsAction" event="after" handler="autoSyncMessengerListenerProcedure"></listener>
  <listener action="moveOrgAction" event="after" handler="autoSyncMessengerListenerProcedure"></listener>
  <listener action="assignPersonAction" event="after" handler="autoSyncMessengerListenerProcedure"></listener>
  <listener action="changePersonMainOrgAction" event="after" handler="autoSyncMessengerListenerProcedure"></listener>
  <listener action="enableSlavePsmAction" event="after" handler="autoSyncMessengerListenerProcedure"></listener>
</model>
