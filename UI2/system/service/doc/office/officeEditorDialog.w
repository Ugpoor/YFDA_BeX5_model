<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" class="window" component="$UI/system/components/justep/window/window">  
  <div component="$UI/system/components/justep/model/model" xid="model1" style="position:absolute;;left:85px;top:124px"
    onLoad="model1Load"/>  
  <span component="$UI/system/components/justep/windowReceiver/windowReceiver"
    xid="attachmentEditorReceiver" onReceive="attachmentEditorReceiverReceive"/>
  <div component="$UI/system/components/justep/panel/panel" class="x-panel x-full"
    xid="panel2"> 
    <div class="x-panel-content" xid="content1"> 
      <div id="ovParent" style="width:100%;height:100%;"> 
        <div id="ov"/> 
      </div> 
    </div>  
    <div class="x-panel-bottom" xid="bottom1">
      <div component="$UI/system/components/bootstrap/row/row" class="row"
        xid="row3" style="padding-top:5px;"> 
        <div class="col col-xs-8" xid="col7"> 
          <div class="input-group" style="margin-left:15px;"> 
            <span class="input-group-btn"> 
              <button class="btn btn-default" type="button">文件名:</button> 
            </span>  
            <input id="fileName" type="text" class="form-control"/> 
          </div> 
        </div>  
        <div class="col col-xs-4" xid="col9"> 
          <a component="$UI/system/components/justep/button/button" class="btn btn-primary"
            label="成文" id="createVersionBtn" style="float:right;margin-right:15px;"
            onClick="docCreateVersionClick"> 
            <i xid="i7"/>  
            <span xid="label7">成文</span> 
          </a>  
          <a component="$UI/system/components/justep/button/button" class="btn btn-link"
            label="保存" id="saveBtn" style="float:right;margin-right:15px;" onClick="docSaveClick"> 
            <i xid="i6"/>  
            <span xid="label6">保存</span> 
          </a> 
        </div> 
      </div> 
    </div> 
  </div>  
  <div class="saveTip" id="saveTip"> 
    <span>保存成功!</span> 
  </div> 
</div>
