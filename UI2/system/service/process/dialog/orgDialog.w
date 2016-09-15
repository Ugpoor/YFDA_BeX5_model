<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window" component="$UI/system/components/justep/window/window">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:193px;top:274px;"> 
    <div component="$UI/system/components/justep/data/data" xid="preemptModeData"  autoLoad="true"
      idColumn="rowid"> 
      <column name="rowid" type="String"/>  
      <column name="label" type="String"/>  
      <column name="value" type="String"/>  
      <data><![CDATA[
      [{rowid: '0', label: '打开时抢占', value: 'tpmOpen'}, 
      {rowid: '1', label: '执行时抢占', value: 'tpmExecute'}]
      ]]></data> 
    </div>  
    <div component="$UI/system/components/justep/data/data" xid="searchData"  autoLoad="true"
      idColumn="rowid"> 
      <column name="rowid" type="String"/>  
      <column name="text" type="String"/>  
      <data><![CDATA[
      [{rowid: '0', text: ''}]
      ]]></data> 
    </div>  
    <div component="$UI/system/components/justep/data/bizData" xid="orgListData"
      concept="SA_OPOrg"> 
      <reader xid="default1" action="/system/logic/action/queryOrgAction"/>  
      <calculateRelation relation="selected" type="Integer"/> 
    </div> 
  </div>  
  <span xid="windowReceive" component="$UI/system/components/justep/windowReceiver/windowReceiver"
    onReceive="windowReceiveReceive" style="left:332px;top:107px;"/>  
  <div component="$UI/system/components/justep/panel/panel" class="x-panel x-full"> 
    <div class="x-panel-top"> 
      <div xid="bar" component="$UI/system/components/justep/titleBar/titleBar"
        title="选择办理人" class="x-titlebar"> 
        <div class="x-titlebar-left"> 
			<a component="$UI/system/components/justep/button/button" label=""
				class="btn btn-link btn-only-icon " icon="icon-chevron-left"
				onClick="cancelBtnClick" xid="cancelBtn">
				<i class="icon-chevron-left" />
				<span></span>
			</a>
        </div>  
        <div class="x-titlebar-title">选择办理人</div>  
        <div class="x-titlebar-right reverse"> 
          <a component="$UI/system/components/justep/button/button" label=""
            class="btn btn-link btn-only-icon " icon="icon-checkmark-round" xid="okBtn"
            onClick="okBtnClick"> 
            <i class="icon-checkmark-round"/>  
            <span></span> 
          </a> 
        </div> 
      </div> 
    </div>  
    <div class="x-panel-content" load="false" refresh="false"> 
      <div component="$UI/system/components/justep/panel/panel" class="x-panel x-full"> 
        <div class="x-panel-top"> 
          <div component="$UI/system/components/justep/labelEdit/labelEdit"
            class="x-label-edit"> 
            <div class="x-edit"> 
              <input class="form-control" component="$UI/system/components/justep/input/input"
                data="searchData" bind-ref="searchData.ref('text')"/> 
            </div>  
            <a component="$UI/system/components/justep/button/button" label="搜索"
              class="btn btn-default x-label right" icon="glyphicon glyphicon-search"
              xid="searchBtn" onClick="searchBtnClick"> 
              <i class="glyphicon glyphicon-search"/>  
              <span>搜索</span> 
            </a>  
          </div> 
        </div>  
        <div class="x-panel-content" load="false" refresh="false">
        
          <div component="$UI/system/components/justep/contents/contents" xid="contents"
            class="x-contents x-full" active="0" slidable="false" swipe="true" wrap="true"> 
            <div class="x-contents-content active" xid="treeContent"> 
              <div component="$UI/system/components/justep/org/orgTree" class="x-tree x-inner-scroll x-flex1"
                limit="10" rootLabel="组织机构" xid="orgTree" multiSelection="true" autoRefresh="false"> 
                <div component="$UI/system/components/justep/data/bizData"
                  xid="orgTreeData" onRefreshCreateParam="orgTreeDataRefreshCreateParam"> 
                  <filter name="filter0" xid="filter1"/>  
                  <calculateRelation relation="virtual" type="Integer"/>  
                  <rule> 
                    <col name="selected"> 
                      <readonly> 
                        <expr>js: val('virtual')</expr> 
                      </readonly> 
                    </col> 
                  </rule> 
                </div>  
                <div class="x-tree-head" xid="div1"> 
                  <ul component="$UI/system/components/bootstrap/breadcrumb/breadcrumb"
                    class="breadcrumb" xid="breadcrumb1"/> 
                </div>  
                <div class="x-tree-content x-scroll-view" xid="div2"> 
                  <div component="$UI/system/components/justep/scrollView/scrollView"
                    supportPullToRefresh="true" supportInfiniteLoad="true" hScroll="false"
                    vScroll="true" hScrollbar="false" vScrollbar="true" bounce="true"
                    class="x-scroll" xid="scrollView1"> 
                    <ul class="x-scroll-content x-tree-template" xid="treeTemplateUl1"> 
                      <li xid="li1" > 
                        <div component="$UI/system/components/justep/row/row"
                          class="x-row x-row-center" xid="row1"> 
                          <div class="x-col" xid="col1"> 
                            <span component="$UI/system/components/justep/button/checkbox"
                              class="x-checkbox x-tree-checkbox" value="1" label=""
                              bind-ref="ref('selected')" xid="checkbox1"/> 
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
                    <div class="x-infinite-load" xid="div4"> 
                      <span class="x-pull-up-label" xid="span2">加载更多...</span> 
                    </div> 
                  </div> 
                </div> 
              </div> 
            </div>  
            <div class="x-contents-content" xid="listContent"> 
              <div class="x-list x-inner-scroll" component="$UI/system/components/justep/list/list"
                data="orgListData" limit="20" autoLoad="false" xid="orgList"> 
                <div class="x-list-head"/>  
                <div class="x-list-content x-scroll-view"> 
                  <div component="$UI/system/components/justep/scrollView/scrollView"
                    supportPullToRefresh="true" supportInfiniteLoad="true" hScroll="false"
                    vScroll="true" hScrollbar="false" vScrollbar="true" bounce="true"
                    class="x-scroll"> 
                    <div class="x-pull-to-refresh"> 
                      <span class="x-pull-down-label">下拉刷新...</span> 
                    </div>  
                    <div class="x-scroll-content"> 
                      <ul class="x-list-template"> 
                        <li bind-css="{ 'x-currentRow': $model.orgListData.currentRow.get() == $object }" class="list-group-item"> 
                          <div class="x-row x-row-center" component="$UI/system/components/justep/row/row"> 
                            <div class="x-col x-col-10" style="text-align: left;" bind-visible="$model.isMultiSelection()"> 
                              <span component="$UI/system/components/justep/button/checkbox"
                                data="orgListData" bind-ref="ref('selected')" class="x-checkbox"/> 
                            </div>  
                            <div class="x-col"> 
                              <span component="$UI/system/components/justep/output/output"
                                data="orgListData" bind-ref="ref('sFName')"/> 
                            </div> 
                          </div> 
                        </li> 
                      </ul> 
                    </div>
                    <div class="x-content-center x-pull-up">
				        <span class="x-pull-up-label">加载更多...</span>
				    </div>
                  </div> 
                </div> 
              </div> 
            </div> 
          </div> 
        
        
        </div> 
      </div> 
    </div> 
  </div> 
</div>
