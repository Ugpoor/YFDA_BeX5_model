<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" component="$UI/system/components/justep/window/window" class="x-flex x-flex-column">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="top:26px;height:auto;left:378px;"/>  
  <div component="$UI/system/components/justep/panel/panel" class="x-panel x-full"
    xid="panel1"> 
    <div class="x-panel-top" xid="top1"> 
      <div component="$UI/system/components/justep/titleBar/titleBar" class="x-titlebar"
        xid="titleBar1" title="orgTree"> 
        <div class="x-titlebar-left" xid="div5"> 
          <a component="$UI/system/components/justep/button/button" class="btn btn-link"
            xid="button1" icon="icon-chevron-left" onClick="closeWin"> 
            <i xid="i2" class="icon-chevron-left"/>  
            <span xid="span3"/> 
          </a> 
        </div>  
        <div class="x-titlebar-title" xid="div6">orgTree</div>  
        <div class="x-titlebar-right reverse" xid="div7"><a component="$UI/system/components/justep/button/button" class="btn btn-link btn-only-icon" xid="button3" icon="icon-android-note" onClick="showOrgTree">
   <i xid="i3" class="icon-android-note"></i>
   <span xid="span5"></span></a></div> 
      </div> 
    </div>  
    <div class="x-panel-content x-flex x-flex-column" xid="content1" style="padding:6px 6px 6px 6px;"> 
      <div component="$UI/system/components/justep/org/orgTree" class="x-tree x-inner-scroll x-flex1"
        limit="10" rootLabel="组织机构" xid="demoOrgTree" multiSelection="true" autoRefresh="true"> 
        <div component="$UI/system/components/justep/data/bizData" autoLoad="true"
          xid="bizData1"/>  
        <div class="x-tree-head" xid="div1"> 
          <ul component="$UI/system/components/bootstrap/breadcrumb/breadcrumb"
            class="breadcrumb" xid="breadcrumb1"/> 
        </div>  
        <div class="x-tree-content x-scroll-view" xid="div2"> 
          <div component="$UI/system/components/justep/scrollView/scrollView"
            supportPullDown="true" supportPullUp="true" hScroll="false" vScroll="true"
            hScrollbar="false" vScrollbar="true" bounce="true" class="x-scroll" xid="scrollView1"> 
            <div class="x-content-center x-pull-down container" xid="div3"> 
              <i class="x-pull-down-img glyphicon x-icon-pull-down"/>  
              <span class="x-pull-down-label" xid="span1">下拉刷新...</span> 
            </div>  
            <ul class="x-scroll-content x-tree-template" xid="treeTemplateUl1"> 
              <li xid="li1"> 
                <div component="$UI/system/components/justep/row/row" class="x-row x-row-center"
                  xid="row1"> 
                  <div class="x-col" xid="col1"> 
                    <span component="$UI/system/components/justep/button/checkbox"
                      class="x-checkbox x-tree-checkbox" value="1" label="" bind-ref="ref('selected')"
                      xid="checkbox1"/> 
                  </div>  
                  <div class="x-col" xid="col2"> 
                    <span component="$UI/system/components/justep/output/output"
                      class="x-org-icon" xid="output1"/> 
                  </div>  
                  <div class="x-col x-col-75" xid="col3"> 
                    <div component="$UI/system/components/justep/output/output"
                      class="x-output x-org-label" xid="output2"/> 
                  </div>  
                  <div class="x-tree-link x-col x-col-10" xid="col4"> 
                    <i class="icon-chevron-right" xid="i1"/> 
                  </div> 
                </div> 
              </li> 
            </ul>  
            <div class="x-content-center x-pull-up" xid="div4"> 
              <span class="x-pull-up-label" xid="span2">加载更多...</span> 
            </div> 
          </div> 
        </div> 
      </div> 
    </div>  
    </div>  
  <span component="$UI/system/components/justep/windowDialog/windowDialog" xid="windowDialog"
    src="$UI/system/components/justep/common/demo/dialog.w" style="left:62px;top:10px;"/> 
</div>
