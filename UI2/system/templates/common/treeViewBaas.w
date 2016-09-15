<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window" component="$UI/system/components/justep/window/window">  
  <div component="$UI/system/components/justep/model/model" xid="model" onLoad="modelLoad"
    style="height:auto;left:231px;top:-3px;"> 
    <div component="$UI/system/components/justep/data/data" xid="treeData"
      idColumn="id"> 
      <column label="id" name="id" type="String"/>  
      <column label="parent-relation(*)" name="parentRelation" type="String"/>  
      <column label="根节点标签" name="rootNodeLable" type="String"/>  
      <column label="树节点名称(*)" name="treeNodeName" type="String"/>  
      <column label="node-kind-relation" name="nodeKindRelation" type="String"/>  
      <column label="node-level-relation" name="nodeLevelRelation" type="String"/>  
      <column label="root-filter" name="rootFilter" type="String"/>  
      <rule xid="rule1"> 
        <col name="parentRelation" xid="ruleCol1"> 
          <required xid="required1"> 
            <expr xid="default1">js:true</expr>  
            <message xid="default2">parent-relation(*) 必填</message> 
          </required> 
        </col>  
        <col name="treeNodeName" xid="ruleCol2"> 
          <required xid="required2"> 
            <expr xid="default3">js:true</expr>  
            <message xid="default4">树节点名称必填</message> 
          </required> 
        </col> 
      </rule> 
    </div>  
    </div>  
  <div class="row" style="padding-top:50px"> 
    <div class="col-xs-9"> 
      <form class="form-horizontal data-form scroll" style="margin-right:12px"
        role="form"> 
        <div class="form-group"> 
          <label for="text1" class="control-label col-xs-3">根节点标签</label>  
          <div class="col-xs-9"> 
              <input component="$UI/system/components/justep/input/input" class="form-control"
                xid="input1" bind-ref="treeData.ref('rootNodeLable')"/> 
          </div> 
        </div>  
        <div class="form-group"> 
          <label for="text1" class="control-label col-xs-3">树节点名称(*)</label>  
          <div class="col-xs-9">
   <div class="input-group input-append" xid="div1">
    <output component="$UI/system/components/justep/output/output" class="form-control template-output-control" xid="output1" bind-value='treeData.val("treeNodeName")'></output>
    <span class="input-group-btn" xid="span1">
     <a class="btn btn-default" component="$UI/system/components/justep/button/button" bind-click="selectRootLabel" xid="button1">选择</a></span> </div> </div></div>  
        <div class="form-group"> 
          <label for="text1" class="control-label col-xs-3">parentRelation(*)</label>  
          <div class="col-xs-9">
   <div class="input-group input-append" xid="div2">
    <output component="$UI/system/components/justep/output/output" class="form-control template-output-control" xid="output2" bind-value='treeData.val("parentRelation")'></output>
    <span class="input-group-btn" xid="span2">
     <a class="btn btn-default" component="$UI/system/components/justep/button/button" bind-click="selectParentRelation" xid="button2">选择</a></span> </div> </div></div>  
        <div class="form-group"> 
          <label for="text1" class="control-label col-xs-3">nodeKindRelation</label>  
          <div class="col-xs-9">
   <div class="input-group input-append" xid="div3">
    <output component="$UI/system/components/justep/output/output" class="form-control template-output-control" xid="output3" bind-value='treeData.val("nodeKindRelation")'></output>
    <span class="input-group-btn" xid="span3">
     <a class="btn btn-default" component="$UI/system/components/justep/button/button" bind-click="selectNodeKind" xid="button3">选择</a></span> </div> </div></div>  
        <div class="form-group"> 
          <label for="text1" class="control-label col-xs-3">rootFilter</label>  
          <div class="col-xs-9"> 
              <input component="$UI/system/components/justep/input/input" class="form-control"
                xid="input2" bind-ref="treeData.ref('rootFilter')"/> 
          </div> 
        </div> 
      </form> 
    </div> 
  </div> 
  <span component="$UI/system/components/justep/windowDialog/windowDialog" xid="windowDialog" src="$UI/system/templates/common/selectColNameDialog.w" width="90%" status="normal" height="90%" title="选择字段" showTitle="true" onReceive="windowDialogReceive"></span></div>
