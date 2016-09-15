<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" component="$UI/system/components/justep/window/window" xid="window">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="top:26px;height:auto;left:378px;">
  </div>  
  <div component="$UI/system/components/justep/panel/panel" class="x-panel x-full"
    xid="panel1"> 
    <div class="x-panel-content" style="padding:8px;" xid="content1"> 
      <div component="$UI/system/components/justep/org/orgTreePC" style="width:100%;height:100%;">
	    <div component="$UI/system/components/justep/data/bizData" autoLoad="true">
	    </div>
	      <div component="$UI/system/components/justep/grid/grid" expandColumn="sName" useVirtualRoot="true"
	        virtualRootLabel="组织机构" width="500" > 
	        <columns xid="columns1">
	          <column name="sName" xid="column1"/>
	        </columns>
	      </div>
      </div>  
    </div> 
  </div> 
</div>
