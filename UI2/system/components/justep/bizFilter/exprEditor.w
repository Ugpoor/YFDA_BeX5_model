<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xmlns:xu="http://www.xmldb.org/xupdate"
  xmlns:xui="http://www.justep.com/xui" __id="id_1" component="$UI/system/components/justep/window/window" extends="$UI/system/components/justep/bizFilter/exprEditor.m.w"
  xid="window" class="window window window window">  
  <div xid="top1" xui:update-mode="delete"/>  
  <span xid="selectValueDialog" showTitle="true" status="normal" title="选择数据"
    src="$UI/system/components/justep/bizFilter/selectValue.w" xui:update-mode="merge"/>  
  <div class="x-panel-bottom" xid="bottom1_1" xui:parent="panel1" xui:update-mode="insert"> 
    <a class="btn btn-link btn-only-label x-dialog-button" component="$UI/system/components/justep/button/button"
      label="取消" onClick="{&quot;operation&quot;:&quot;receiver.windowCancel&quot;}" xid="button11111_2"
      xui:update-mode="merge"> 
      <i xid="i13"/>  
      <span xid="span13">取消</span> 
    </a>  
    <a class="btn btn-primary btn-only-label x-dialog-button" component="$UI/system/components/justep/button/button"
      label="确定" onClick="okBtnClick" xid="okBtn" xui:update-mode="merge"> 
      <i xid="i12"/>  
      <span xid="span12">确定</span> 
    </a> 
  </div> 
</div>
