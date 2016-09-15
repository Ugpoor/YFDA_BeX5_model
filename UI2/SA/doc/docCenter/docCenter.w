<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window container-fluid x-full-screen" component="$UI/system/components/justep/window/window"
  design="device:pc">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:646px;top:373px;" onModelConstructDone="modelModelConstructDone"> 
    <div component="$UI/system/components/justep/data/bizData" autoLoad="true"
      xid="docNodeTree" concept="SA_DocNode" isTree="true" onAfterDelete="docNodeTreeAfterDelete" onIndexChanged="docNodeTreeIndexChanged" onAfterNew="docNodeTreeAfterNew" limit="-1"> 
      <reader xid="default4" action="/system/logic/action/queryDocNodeAction"/>  
      <writer xid="default5" action="/system/logic/action/saveDocNodeAction"/>  
      <creator xid="default6" action="/system/logic/action/createDocNodeAction"/>  
      <filter name="sKindFilter">SA_DocNode.sKind = 'dir'</filter>  
      <filter name="sFlagFilter">SA_DocNode.sFlag=1</filter>  
      <treeOption xid="default10" parentRelation="sParentID" rootFilter="SA_DocNode.sParentID IS NULL"
        delayLoad="false"/>  
      <master xid="default11"/> 
    <filter name="filter0" xid="filter1"></filter>
  <calculateRelation relation="relation0" xid="calculateRelation2"></calculateRelation>
  </div>  
    <div component="$UI/system/components/justep/data/data" autoLoad="true" xid="permissions" idColumn="col11">
   <column label="col11" name="col11" type="Integer" xid="xid12"></column>
  <column label="newDir" name="newDir" type="String" xid="xid1"></column>
  <column label="premType" name="premType" type="String" xid="xid1"></column>
  <column label="deleteDir" name="deleteDir" type="String" xid="xid2"></column>
  <column label="editDir" name="editDir" type="String" xid="xid3"></column>
  <column label="manageDir" name="manageDir" type="String" xid="xid4"></column>
  <column label="downloadDir" name="downloadDir" type="String" xid="xid5"></column>
  <column label="newDoc" name="newDoc" type="String" xid="xid6"></column>
  <column label="editDoc" name="editDoc" type="String" xid="xid7"></column>
  <column label="deleteDoc" name="deleteDoc" type="String" xid="xid8"></column>
  <column label="manageDoc" name="manageDoc" type="String" xid="xid9"></column>
  <column label="downloadDoc" name="downloadDoc" type="String" xid="xid10"></column>
  <column label="browseDoc" name="browseDoc" type="String" xid="xid11"></column>
  <data xid="default13">[{&quot;premType&quot;:&quot;false&quot;,&quot;newDir&quot;:&quot;false&quot;,&quot;deleteDir&quot;:&quot;false&quot;,&quot;editDir&quot;:&quot;false&quot;,&quot;manageDir&quot;:&quot;false&quot;,&quot;downloadDir&quot;:&quot;false&quot;,&quot;newDoc&quot;:&quot;false&quot;,&quot;editDoc&quot;:&quot;false&quot;,&quot;deleteDoc&quot;:&quot;false&quot;,&quot;manageDoc&quot;:&quot;false&quot;,&quot;downloadDoc&quot;:&quot;false&quot;,&quot;browseDoc&quot;:&quot;false&quot;,&quot;col11&quot;:1}]</data></div><div component="$UI/system/components/justep/data/bizData" autoLoad="true"
      xid="docNodeList" concept="SA_DocNode" onAfterDelete="docNodeListAfterDelete" onIndexChanged="docNodeListIndexChanged"> 
      <reader xid="default7" action="/system/logic/action/queryDocNodeAction"/>  
      <writer xid="default8" action="/system/logic/action/saveDocNodeAction"/>  
      <creator xid="default9" action="/system/logic/action/createDocNodeAction"/>  
      <filter name="sKindFilter">SA_DocNode.sKind&lt;&gt;'dir'</filter>  
      <filter name="sFlagFilter">SA_DocNode.sFlag=1</filter>  
      <master xid="default12" data="docNodeTree" relation="sParentID"/> 
    <calculateRelation relation="isLock" xid="calculateRelation1" label="锁定" type="Boolean"></calculateRelation></div> 
  </div>  
  <span component="$UI/system/components/justep/windowDialog/windowDialog" xid="dialog_permission" style="left:441px;top:182px;" src="$UI/SA/doc/docCenter/docCenterDialogPer.w" showTitle="true" status="normal" resizable="true" routable="true"></span><div component="$UI/system/components/bootstrap/row/row" class="row" xid="row1"
    style="height:100%;"> 
    <div class="col col-xs-3" xid="col1" style="height:100%;overflow: auto;"> 
      <div component="$UI/system/components/justep/panel/panel" class="x-panel x-full"
        xid="panel2"> 
        <div class="x-panel-top" xid="top2" height="48"> 
          <div component="$UI/system/components/justep/toolBar/toolBar" class="x-toolbar form-inline x-toolbar-spliter"
            xid="toolBar2">
            
             
          <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left" label="新建" xid="button4" onClick="{operation:'docNodeTree.newChild'}" icon="icon-android-add" bind-enable=' $model.permissions.val("newDir")'>
   <i xid="i3" class="icon-android-add"></i>
   <span xid="span8">新建</span></a><a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left" onClick="{'operation':'docNodeTree.save'}" xid="button1" bind-enable=' ' bind-visible='$model.permissions.val("editDir")'>
   <i xid="i1"></i>
   <span xid="span3"></span></a>
  <div class="dropdown btn-group" component="$UI/system/components/bootstrap/dropdown/dropdown" xid="dropdown1">
   <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left dropdown-toggle" label="更多" icon="icon-arrow-down-b" xid="button12">
    <i class="icon-arrow-down-b" xid="i18"></i>
    <span xid="span23">更多</span></a> 
   <ul component="$UI/system/components/justep/menu/menu" class="x-menu dropdown-menu" xid="menu1">
    <li class="x-menu-item" xid="item3">
     <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left" label="权限" xid="permissionBtn" icon="icon-android-settings" onClick="permissionBtnClick" bind-enable=' $model.permissions.val("manageDir")'>
      <i xid="i20" class="icon-android-settings"></i>
      <span xid="span27"></span></a> </li> </ul> </div></div>
        </div>  
        <div class="x-panel-content" xid="content2"> 
          
  <div component="$UI/system/components/justep/smartContainer/smartContainer" class="x-smartcontainer" xid="smartContainer1" style="margin-top: 4px;height:98%;"><div component="$UI/system/components/justep/grid/grid" hiddenCaptionbar="true" altRows="true" xid="grid1" data="docNodeTree" appearance="tree" height="100%" expandColumn="sDocName" class="x-grid x-grid-no-bordered" directEdit="false"> 
              <columns xid="columns1"> 
                <column name="sDocName" xid="column10" editable="true" align="center" editor="input" /> 
              </columns> 
            </div></div></div>  
        <div class="x-panel-bottom" xid="bottom2"></div> 
      </div> 
    </div>  
     
  <div class="col col-xs-9 col-spliter-left" xid="col2" style="height:100%;"> 
      <div component="$UI/system/components/justep/panel/panel" class="x-panel" xid="panel1" style="height:100%;"> 
        <div class="x-panel-top" xid="top1" height="50"> 
           
        <div component="$UI/system/components/justep/toolBar/toolBar" class="x-toolbar x-toolbar-spliter" xid="toolBar1"> 
            <div class="x-control pull-right" component="$UI/system/components/justep/smartFilter/smartFilter" xid="smartFilter1" filterData="docNodeList" filterCols="sDocName,sCreatorName"> 
              <!-- <input type="text" class="form-control" placeholder="搜索" xid="input1"/> -->
              <input type="text" class="form-control" placeholder="搜索" data-bind="valueUpdate: ['input', 'afterkeydown']" bind-value="$model.comp($element.parentElement).searchText" bind-change="$model.comp($element.parentElement).onInputChange.bind($model.comp($element.parentElement))" xid="input1" /> 
            </div>  
            <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left" label="上传文件" xid="uploadBtn" icon="icon-android-add" bind-enable=' $model.permissions.val("newDoc")'>
              <i xid="i117" class="icon-android-add" /> 
              <span xid="span5">上传文件</span> 
            </a>
            <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left" label="编辑" xid="editBtn" icon="icon-compose" onClick="editBtnClick" bind-enable=' $model.permissions.val("editDoc")'> 
              <i xid="i7" class="icon-compose" />  
              <span xid="span7">编辑</span> 
            </a>  
              
            <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left" label="刷新" xid="refreshBtn" onClick="{operation:'docNodeList.refresh'}"> 
              <i xid="i14" />  
              <span xid="span17">刷新</span> 
            </a>
            <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left" label="下载" xid="downloadBtn" onClick="downloadDoc" bind-enable='$model.permissions.val("downloadDoc")'> 
              <i xid="i115" />  
              <span>下载</span> 
            </a>  
            <div class="dropdown btn-group" component="$UI/system/components/bootstrap/dropdown/dropdown" xid="moreDropDown" autoHideMenu="true"> 
              <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left dropdown-toggle" label="更多" icon="icon-arrow-down-b" xid="button3"> 
                <i class="icon-arrow-down-b" xid="i6" />  
                <span xid="span10">更多</span> 
              </a>  
              <ul component="$UI/system/components/justep/menu/menu" class="x-menu dropdown-menu" xid="menu2"> 
                <li class="x-menu-item" xid="item1"> 
                  <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left" label="锁定" xid="lockBtn" icon="icon-unlocked" onClick="lockDoc"> 
                    <i xid="i8" class="icon-unlocked" />  
                    <span xid="span11">锁定</span> 
                  </a> 
                </li>  
                <li class="x-menu-item" xid="item4"> 
                  <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left" label="解锁" xid="unlockBtn" icon="icon-locked" onClick="unlockDoc"> 
                    <i xid="i9" class="icon-locked" />  
                    <span xid="span12">解锁</span> 
                  </a> 
                </li>  
                <li class="x-menu-divider divider" xid="divider1" />  
                <li class="x-menu-item" xid="item6"> 
                  <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left" label="查看" xid="viewBtn" icon="icon-view" onClick="browseDoc"> 
                    <i xid="i11" class="icon-view" />  
                    <span xid="span14">查看</span> 
                  </a> 
                </li>  
                <li class="x-menu-item" xid="item7"> 
                  <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left" label="历史版本" xid="historyVersionBtn" icon="icon-android-contacts" onClick="showHistoryRecordDialog"> 
                    <i xid="i12" class="icon-android-contacts" />  
                    <span xid="span15">历史版本</span> 
                  </a> 
                </li> 
              <li class="x-menu-item" xid="item5">
   <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left" label="权限" xid="button15" icon="icon-android-settings" onClick="button15Click" bind-enable=' $model.permissions.val("manageDoc")'>
    <i xid="i21" class="icon-android-settings"></i>
    <span xid="span28">权限</span></a> </li></ul> 
            </div> 
          </div></div>  
        <div class="x-panel-content" xid="content1"> 
          <div component="$UI/system/components/justep/dataTables/dataTables" flexibleWidth="true" rowActiveClass="active" class="table table-hover" xid="docListDataTables" data="docNodeList" onCellRender="docListDataTablesCellRender">
   <columns xid="columns3">
    <column name="isLock" xid="column12" orderable="false"></column>
    <column name="sDocName" xid="column1" label="名称"></column>
    <column name="sSize" xid="column2" label="大小"></column>
    <column name="sCreatorName" xid="column3" label="创建人"></column>
    <column name="sCreatorDeptName" xid="column4" label="创建部门"></column>
    <column name="sLastWriterName" xid="column7" label="修改人"></column>
    <column name="sLastWriterDeptName" xid="column8" label="修改人部门"></column>
    <column name="sLastWriteTime" xid="column9" label="修改时间"></column></columns> </div></div>  
        <div class="x-panel-bottom" xid="bottom1" height="60"> 
          <div component="$UI/system/components/justep/pagerBar/pagerBar" class="x-pagerbar container-fluid" xid="pagerBar1" data="docNodeList"> 
            <div class="row" xid="div1"> 
              <div class="col-sm-3" xid="div2"> 
                <div class="x-pagerbar-length" xid="div3" style="height:104px;width:456px;"> 
                  <label component="$UI/system/components/justep/pagerLimitSelect/pagerLimitSelect" class="x-pagerlimitselect" xid="pagerLimitSelect1"> 
                    <span xid="span1">显示</span>  
                    <select component="$UI/system/components/justep/select/select" class="form-control input-sm" xid="select1"> 
                      <option value="10" xid="default1">10</option>  
                      <option value="20" xid="default2">20</option>  
                      <option value="50" xid="default3">50</option>  
                      <option value="100" xid="default16">100</option> 
                    </select>  
                    <span xid="span2">条</span> 
                  </label> 
                </div> 
              </div>  
              <div class="col-sm-3" xid="div4"> 
                <div class="x-pagerbar-info" xid="div5">当前显示0条，共0条</div> 
              </div>  
              <div class="col-sm-6" xid="div6"> 
                <div class="x-pagerbar-pagination" xid="div7"> 
                  <ul class="pagination" component="$UI/system/components/bootstrap/pagination/pagination" xid="pagination1"> 
                    <li class="prev" xid="li1"> 
                      <a href="#" xid="a1"> 
                        <span aria-hidden="true" xid="span4">«</span>  
                        <span class="sr-only" xid="span9">Previous</span> 
                      </a> 
                    </li>  
                    <li class="next" xid="li2"> 
                      <a href="#" xid="a2"> 
                        <span aria-hidden="true" xid="span18">»</span>  
                        <span class="sr-only" xid="span19">Next</span> 
                      </a> 
                    </li> 
                  </ul> 
                </div> 
              </div> 
            </div> 
          </div> 
        </div> 
      </div> 
    </div></div> 
</div>
