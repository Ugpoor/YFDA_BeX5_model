<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" component="$UI/system/components/justep/window/window" class="x-flex x-flex-column"
  design="device:mobile" xid="window">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="top:26px;height:auto;left:378px;">
	<div component="$UI/system/components/justep/data/data" xid="treeData"
      directDelete="true" autoLoad="true" idColumn="sID"  isTree="true"
     onCustomRefresh="treeDataCustomRefresh"  confirmRefresh="false">{{#each tree}}
      <treeOption parentRelation="{{parent_relation}}" nodeKindRelation="{{node_kindRelation}}"
        rootFilter="{{root_filter}}"/>{{/each}}
      <column label="sID" name="sID" type="String"
        xid="sID"/>{{#each columns}}
      <column label="{{column_label}}" name="{{column_name}}" type="{{column_type}}"
        xid="{{column_xid}}"/>{{/each}}
    	<rule xid="rule1">
	   <col name="sID" xid="ruleCol1">
	    <calculate xid="calculate1">
	     <expr xid="default2">justep.UUID.createUUID()</expr></calculate> </col> </rule>
	   </div>
  </div> 
  <div component="$UI/system/components/justep/panel/panel" class="x-panel x-full"
    xid="panel1"> 
    <div class="x-panel-top" xid="top1"> 
      <div component="$UI/system/components/justep/titleBar/titleBar" class="x-titlebar"
        xid="titleBar1" title="标题"> 
        <div class="x-titlebar-left" xid="div2">
          <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-only-icon"
            xid="button1" onClick="{operation:'window.close'}"> 
            <i xid="i1"/>  
            <span xid="span3"/>
          </a>
        </div>  
        <div class="x-titlebar-title" xid="div3">标题</div>  
        <div class="x-titlebar-right reverse" xid="div8"/>
      </div>
    </div>  
    <div class="x-panel-content x-flex x-flex-column" xid="content1">{{#each tree}}
      <div component="$UI/system/components/justep/tree/tree" class="x-tree x-inner-scroll x-flex1"
        xid="tree1" rootLabel="{{root_nodeLable}}" limit="8" data="treeData" labelRelation="{{tree_nodeName}}"> 
        <div class="x-tree-head" xid="div4"> 
          <ul component="$UI/system/components/bootstrap/breadcrumb/breadcrumb"
            class="breadcrumb" xid="breadcrumb1"/> 
        </div>  
        <div class="x-tree-content x-scroll-view" xid="div5"> 
          <div component="$UI/system/components/justep/scrollView/scrollView"
            supportPullToRefresh="true" supportInfiniteLoad="true" hScroll="false"
            vScroll="true" hScrollbar="false" vScrollbar="true" bounce="true" class="x-scroll"
            xid="scrollView1"> 
            <div class="x-pull-to-refresh" xid="div6"> 
              <span class="x-pull-down-label" xid="span1">下拉刷新...</span> 
            </div>  
            <ul class="x-tree-template x-scroll-content" xid="treeTemplateUl1"> 
              <li bind-css="{ currentRow: $model.treeData.currentRow.get() == $object }"> 
                <div component="$UI/system/components/justep/labelEdit/labelEdit"
                  class="x-label-edit" xid="labelOutput1"> 
                  <label class="x-label" xid="label1" bind-text="ref('{{tree_nodeName}}')"
                    data="treeData"/>  
                  <div class="x-edit x-tree-link" xid="div1"> 
                    <div component="$UI/system/components/justep/output/output"
                      class="x-output" xid="output1" data="treeData" bind-ref="ref('{{tree_nodeName}}')"/> 
                  </div> 
                </div> 
              </li> 
            </ul>  
            <div class="x-infinite-load" xid="div7"> 
              <span class="x-pull-up-label" xid="span2">加载更多...</span> 
            </div> 
          </div> 
        </div> 
      </div>{{/each}}
    </div> 
  </div> 
</div>
