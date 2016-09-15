<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" component="$UI/system/components/justep/window/window" 
xid="window">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="top:26px;height:auto;left:378px;"> 
    <div component="$UI/system/components/justep/data/data" xid="data" idColumn="id" autoLoad="true"> 
      <column label="ID" name="id" type="String" xid="default1"/>  
      <column label="值" name="value" type="String" xid="default2"/>  
      <column label="名称" name="name" type="String" xid="default3"/>  
      <column label="组织全ID" name="fValue" type="String" xid="default5"/>  
      <data xid="default6">[{id:1}]</data> 
    </div>
    <!-- 
    <div component="$UI/system/components/justep/data/bizData" xid="orgData" concept="SA_OPOrg"
      relations="sName,sFName,sOrgKindID,sSequence,sParent,sPersonID,sNodeKind" offset="0"
      limit="20" autoLoad="true" isTree="true"> 
      <reader action="/system/logic/action/queryOrgAction"/>  
      <treeOption parentRelation="sParent" nodeKindRelation="sNodeKind"/> 
    </div>
     --> 
      
  </div>  
  <div component="$UI/system/components/justep/panel/panel" class="x-panel x-full"
    xid="panel1"> 
    <div class="x-panel-content" xid="content1"> 
      <div component="$UI/system/components/justep/controlGroup/controlGroup"
        class="x-control-group x-flex x-flex-column x-flex1" xid="controlGroup1" title="OrgSelect Component Demo"> 
        <h3>OrgSelect 
        </h3>  
        <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label25"
          xid="labelInput1"> 
          <label class="x-label" xid="label1">组织机构：</label>  
          <div xid="demoOrgSelect" class="x-edit"> 
	        <div component="$UI/system/components/justep/org/orgSelectPC"
	          bind-labelRef="data.ref('name')" bind-ref="data.ref('value')" _onTreeIconRender="orgTreeTreeIconRender"
	          class="x-gridSelect" selectFilter="$row.val('sOrgKindID')=='psm'"> 
			    <div component="$UI/system/components/justep/data/bizData" xid="orgData"
			      concept="SA_OPOrg" relations="sName,sFName,sOrgKindID,sSequence,sParent,sPersonID,sNodeKind" offset="0"
			      limit="20" autoLoad="true" isTree="true"> 
			      <reader xid="default4" action="/system/logic/action/queryOrgAction"/>  
			      <treeOption parentRelation="sParent" nodeKindRelation="sNodeKind"/> 
			    </div> 
	          <option data="orgData" appearance="tree" expandColumn="sName" value="SA_OPOrg" label="sName"> 
	            <columns> 
	              <column name="sName"/>  
	            </columns> 
	          </option> 
	        </div> 
          </div> 
        </div>  
        <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit"
          xid="labelOutput1"> 
          <label class="x-label" xid="label2" bind-text="data.label('name')"/>  
          <div component="$UI/system/components/justep/output/output" class="x-output x-edit"
            xid="output1" bind-ref="data.ref('name')"/> 
        </div>  
        <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit"
          xid="labelOutput2"> 
          <label class="x-label" xid="label3" bind-text="data.label('value')"/>  
          <div component="$UI/system/components/justep/output/output" class="x-output x-edit"
            xid="output2" bind-ref="data.ref('value')"/> 
        </div> 
      </div>  
      <div component="$UI/system/components/justep/controlGroup/controlGroup"
        class="x-control-group" title="title" xid="controlGroup2"> 
        <h3>orgImage
        </h3>  
        <div> 
          <div align="center" style="float: left;"> 
            <div class="x-blob x-blob-radius" component="$UI/system/components/justep/org/orgImage"
              style="height:64px;width:64px;" xid="demoOrgImage" bind-ref="data.ref('value')"> 
              <div class="x-blob-bar" xid="div1"> 
                <i class="x-blob-edit icon-compose" xid="i1"/>  
                <i class="x-blob-del icon-close-round" xid="i2"/> 
              </div>  
              <img class="x-blob-img x-autofill" xid="image1"/> 
            </div>  
            <span bind-text="data.ref('name')"/> 
          </div> 
        </div>  
        <div class="x-list" component="$UI/system/components/justep/list/list"
          data="orgData" limit="8" disablePullToRefresh="true" disableInfiniteLoad="true"> 
          <div class="x-list-template"> 
            <div align="center" style="float: left;margin-right: 6px;"> 
              <div class="x-blob x-blob-radius" component="$UI/system/components/justep/org/orgImage"
                style="height:64px;width:64px;" xid="orgImage1" bind-ref="ref('sFID')"> 
                <div class="x-blob-bar" xid="div1"> 
                  <i class="x-blob-edit icon-compose" xid="i1"/>  
                  <i class="x-blob-del icon-close-round" xid="i2"/> 
                </div>  
                <img class="x-blob-img x-autofill" xid="image1"/> 
              </div>  
              <span bind-text="ref('sName')"/> 
            </div> 
          </div> 
        </div> 
      </div> 
    </div> 
  </div>  
  <span component="$UI/system/components/justep/windowDialog/windowDialog" xid="windowDialog"
    src="$UI/system/components/justep/common/demo/dialog.w" style="left:316px;top:256px;"/> 
</div>
