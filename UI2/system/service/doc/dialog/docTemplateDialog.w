<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window" component="$UI/system/components/justep/window/window">  
  <div component="$UI/system/components/justep/model/model" xid="model"> 
    <div component="$UI/system/components/justep/data/data" autoLoad="true"
      xid="attachmentTemplate" idColumn="sDocId" confirmDelete="false" confirmRefresh="false"> 
      <column label="sDocName" name="sDocName" type="String" xid="default1"/>  
      <column label="sFileId" name="sFileId" type="String" xid="default2"/>  
      <column label="sDocPath" name="sDocPath" type="String" xid="default3"/>  
      <column label="sDocId" name="sDocId" type="String" xid="default4"/>
    </div> 
  </div>  
  <div component="$UI/system/components/justep/grid/grid" class="x-grid-no-bordered" hiddenCaptionbar="true"
    xid="grid1" data="attachmentTemplate" width="100%" height="auto"> 
    <columns xid="columns1"> 
      <column width="100" name="sDocName" xid="column1"/>  
      <column width="100" name="sDocPath" xid="column3"/>  
      <column width="100" name="sFileId" xid="column5"/>  
      <column width="100" name="sDocId" xid="column6"/>
    </columns> 
  </div>  
    <div component="$UI/system/components/bootstrap/row/row" class="row" style="padding-top:5px;"> 
      <div class="col col-xs-8" xid="col7"/>  
      <div class="col col-xs-4" xid="col9"> 
        <a component="$UI/system/components/justep/button/button" class="btn btn-default"
          label="确定" xid="windowEnsure" style="float:right;margin-right:15px;" onClick="windowEnsureClick"> 
          <i xid="i7"/>  
          <span xid="label7">确定</span> 
        </a>  
        <a component="$UI/system/components/justep/button/button" class="btn btn-default"
          label="取消" xid="windowCancel" style="float:right;margin-right:15px;" onClick="{&quot;operation&quot;:&quot;windowReceiver1.windowCancel&quot;}"> 
          <i xid="i6"/>  
          <span xid="label6">取消</span> 
        </a> 
      </div> 
    </div> 
  <span component="$UI/system/components/justep/windowReceiver/windowReceiver"
    xid="windowReceiver1" style="left:29px;top:138px;" onReceive="windowReceiver1Receive"/> 
</div>
