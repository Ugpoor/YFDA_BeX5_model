<?xml version="1.0" encoding="utf-8"?>

<model xmlns="http://www.justep.com/model">
  <process name="assetProcess"> 
    <label language="zh_CN">资产</label>
    <has-action action="queryAssetClassAction"/>
    <has-action action="queryAssetAction"/>
    <has-action action="createAssetAction"/>
    <has-action action="saveAssetAction"/>
    <has-action action="queryUnitAction"/>
    <static-activity name="AssetActivity">
      <label language="zh_CN">AssetActivity</label>
    </static-activity>
  </process>
</model>
