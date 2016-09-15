<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window docSetting" component="$UI/system/components/justep/window/window">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:177px;top:209px;" onModelConstructDone="modelModelConstructDone"> 
    <div component="$UI/system/components/justep/data/data" autoLoad="true"
      xid="docLinkDefine" idColumn="sRootPath" confirmRefresh="false"> 
      <column label="sRootName" name="sRootName" type="String" xid="default14"/>  
      <column label="sRootPath" name="sRootPath" type="String" xid="default15"/>  
      <column label="sSubPath" name="sSubPath" type="String" xid="default16"/>  
      <column label="sAccess" name="sAccess" type="String" xid="default17"/>  
      <column label="sLimitSize" name="sLimitSize" type="String" xid="default18"/> 
    </div>  
    <div component="$UI/system/components/justep/data/data" autoLoad="true"
      xid="docTemplate" idColumn="sDocId" confirmRefresh="false"> 
      <column label="sDocId" name="sDocId" type="String" xid="default8"/>  
      <column label="sDocName" name="sDocName" type="String" xid="default9"/>  
      <column label="sFileID" name="sFileID" type="String" xid="default11"/>  
      <column label="sDocPath" name="sDocPath" type="String" xid="default12"/> 
    </div>  
    <div component="$UI/system/components/justep/data/data" autoLoad="true"
      xid="accessData" idColumn="sAccess" confirmRefresh="false"> 
      <column label="sName" name="sName" type="String" xid="default6"/>  
      <column label="sAccess" name="sAccess" type="String" xid="default7"/>  
      <data xid="default10">[{"sName":"列表","sAccess":"1"},{"sName":"读取","sAccess":"3"},{"sName":"下载","sAccess":"7"},{"sName":"下载 上传","sAccess":"263"},{"sName":"下载 修改","sAccess":"519"},{"sName":"下载 上传 修改","sAccess":"775"},{"sName":"下载 修改 删除","sAccess":"1543"},{"sName":"下载 上传 修改 删除","sAccess":"1799"}]</data> 
    </div> 
  </div>  
  <span component="$UI/system/components/justep/windowDialog/windowDialog" xid="selectRootDialog"
    style="left:42px;top:128px;" src="$UI/SA/doc/docPermission/docNodeSelect.w" title="选择目录"
    showTitle="true" process="/SA/doc/docPermission/docPermissionProcess" activity="mainActivity"
    onReceive="selectRootDialogReceive" forceRefreshOnOpen="true" status="normal"/>  
  <span component="$UI/system/components/justep/windowReceiver/windowReceiver"
    xid="docSettingDialogReceiver" style="left:43px;top:91px;" onReceive="windowDialogReceive"/>  
  <span component="$UI/system/components/justep/windowDialog/windowDialog" xid="selectTmpDialog"
    style="left:40px;top:176px;" src="$UI/SA/doc/docPermission/selectTmpDialog.w"
    title="选择模版" showTitle="true" onReceive="selectTmpDialogReceive" forceRefreshOnOpen="true"
    status="normal" height="80%"/>  
  <div class="x-panel x-full" component="$UI/system/components/justep/panel/panel"
    xid="panel2"> 
    <div class="x-panel-content" xid="body2"> 
      <div class="form-horizontal container-fluid" component="$UI/system/components/bootstrap/form/form">
        <div class="form-group" xid="keyRow" style="display:none;"> 
          <div class="col-sm-2"> 
            <label class="control-label">keyId名称:</label> 
          </div>  
          <div class="col-sm-4"> 
            <input type="text" disable="true" class="form-control" xid="keyIdInput"/>
          </div>  
           
        </div>  
        <div class="form-group"> 
          <div class="col-sm-2"> 
            <label class="control-label">根文件夹名称:</label> 
          </div>  
          <div class="col-sm-4"> 
            <div class="input-group" xid="div12"> 
              <input type="text" disable="true" class="form-control" bind-value="docLinkDefine.ref('sRootName')"/>  
              <div class="input-group-btn"> 
                <button type="button" class="btn btn-link" data-toggle="dropdown"
                  xid="selectRootPath" bind-click="selectRootPathClick">选择</button> 
              </div> 
            </div> 
          </div>  
          <div class="col-sm-2"> 
            <label class="control-label">子文件夹名称(表达式):</label> 
          </div>  
          <div class="col-sm-4"> 
            <input type="text" class="form-control" xid="input6" bind-value="docLinkDefine.ref('sSubPath')"/> 
          </div> 
        </div>  
        <div class="form-group"> 
          <div class="col-sm-2"> 
            <label class="control-label">权限 :</label> 
          </div>  
          <div class="col-sm-4"> 
            <div class="x-gridSelect" component="$UI/system/components/justep/gridSelect/gridSelect"
              xid="gridSelect1" bind-ref="docLinkDefine.ref('sAccess')" multiselect="false"> 
              <option xid="option1" data="accessData" value="sAccess" label="sName"> 
                <columns xid="columns2"> 
                  <column name="sName" label="权限" xid="column5"/> 
                </columns> 
              </option> 
            </div> 
          </div>  
          <div class="col-sm-2"> 
            <label class="control-label">限制大小(Byte):</label> 
          </div>  
          <div class="col-sm-4"> 
            <input type="text" class="form-control" xid="input9" bind-value="docLinkDefine.ref('sLimitSize')"/> 
          </div> 
        </div>  
        <div class="form-group"> 
          <div class="col col-xs-2" xid="col1"> 
            <a component="$UI/system/components/justep/button/button" class="btn btn-link"
              label="新增模版" xid="button1" icon="icon-android-add" onClick="button1Click"> 
              <i xid="i1" class="icon-android-add"/>  
              <span xid="span1">新增模版</span> 
            </a> 
          </div>  
          <div class="col col-xs-2" xid="col2"> 
            <a component="$UI/system/components/justep/button/button" class="btn btn-link"
              label="删除模版" xid="button2" icon="icon-android-trash" onClick="{&quot;operation&quot;:&quot;docTemplate.delete&quot;}"> 
              <i xid="i2" class="icon-android-trash"/>  
              <span xid="span2">删除模版</span> 
            </a> 
          </div> 
        </div>  
        <div class="form-group"> 
          <div component="$UI/system/components/justep/grid/grid" class="x-grid-no-bordered" xid="grid1"
            data="docTemplate" width="100%" hiddenCaptionbar="true" height="auto"> 
            <columns xid="columns"> 
              <column name="sDocName" xid="column2" label="文档名称"/>  
              <column width="100" name="sFileID" xid="column3" label="文档ID"/>  
              <column width="300" name="sDocPath" xid="column4" label="文档路径"/> 
            </columns> 
          </div> 
        </div> 
      </div>  
      <div class="x-panel-bottom" xid="footer2"> 
        <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-only-label x-dialog-button"
          label="取消" onClick="{operation:'docSettingDialogReceiver.windowCancel'}"> 
          <i/>  
          <span>取消</span> 
        </a>  
        <a component="$UI/system/components/justep/button/button" class="btn btn-primary x-dialog-button"
          label="确定" onClick="windowEnsureClick"> 
          <i/>  
          <span>确定</span> 
        </a> 
      </div> 
    </div> 
  </div> 
</div>
