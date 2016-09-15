<?xml version="1.0" encoding="utf-8"?>

<model xmlns="http://www.justep.com/model">
  <process name="paiProcess"> 
    <label language="zh_CN">资产</label>
    <has-action action="queryAssetClassAction"/>
    <has-action action="queryAssetAction"/>
    <has-action action="createAssetAction"/>
    <has-action action="saveAssetAction"/>
    <has-action action="queryUnitAction"/>
    <static-activity name="mainActivity">
      <label language="zh_CN">mainActivity</label>
    </static-activity>
  </process>
</model>
