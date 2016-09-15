<?xml version="1.0" encoding="utf-8"?>

<model xmlns="http://www.justep.com/model">  
    <listener action="startProcessAction" event="after" handler="dynamicFlowListenerProcedure"/>  
    <listener action="advanceProcessAction" event="after" handler="dynamicFlowListenerProcedure"/>  
    <listener action="abortProcessAction" event="after" handler="dynamicFlowListenerProcedure"/>  
    <listener action="resumeProcessAction" event="after" handler="dynamicFlowListenerProcedure"/>  
    <listener action="backProcessAction" event="after" handler="dynamicFlowListenerProcedure"/>  
    <listener action="finishProcessAction" event="after" handler="dynamicFlowListenerProcedure"/>  
    <listener action="transferTaskAction" event="after" handler="dynamicFlowListenerProcedure"/>  
    <listener action="suspendProcessAction" event="after" handler="dynamicFlowListenerProcedure"/>  
    <listener action="withdrawTaskAction" event="after" handler="dynamicFlowListenerProcedure"/> 
</model>