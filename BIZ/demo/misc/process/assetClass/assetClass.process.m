<?xml version="1.0" encoding="utf-8"?>

<model xmlns="http://www.justep.com/model">
  <process name="assetClassProcess">
    <label language="zh_CN">资产类别</label>
    <has-action action="queryAssetClassAction"/>
    <has-action action="createAssetClassAction"/>
    <has-action action="saveAssetClassAction"/>
    <static-activity name="AssetClassActivity">
      <label language="zh_CN">AssetClassActivity</label>
    </static-activity>
  </process>
</model>
