<div 
  xmlns:xu="http://www.xmldb.org/xupdate" 
  xmlns:xui="http://www.justep.com/xui" 
  __id="id_1" 
  component="$UI/system/components/justep/window/window" 
  extends="$UI/system/components/justep/bizFilter/filterPattern.m.w" 
  xid="window" 
  class="window window window" 
  xmlns="http://www.w3.org/1999/xhtml" >

  <div xid="titleBar" xui:update-mode="delete"/>
    <div class="x-panel-bottom" xid="bottom1_1" xui:parent="panel" xui:update-mode="insert" >
<a class="btn btn-link btn-only-label x-dialog-button" component="$UI/system/components/justep/button/button" label="取消" onClick="{&quot;operation&quot;:&quot;receiver.windowCancel&quot;}" xid="button111_3" xui:update-mode="merge" >
<i xid="i13" />
<span xid="span13" >
















取消</span>
</a>
<a class="btn btn-primary btn-only-label x-dialog-button" component="$UI/system/components/justep/button/button" label="确定" onClick="okBtnClick" xid="okBtn" xui:update-mode="merge" >
<i xid="i12" />
<span xid="span12" >
















确定</span>
</a>
</div>
    <div style="padding: 5px 0;" xid="div1_2" xui:parent="top1" xui:update-mode="insert" >
<a bind-click="newBtnClick" bind-disable=" " class="btn btn-link btn-icon-left" component="$UI/system/components/justep/button/button" icon="icon-android-add" label="新建模板" xid="button211_2" >
<i class="icon-android-add" xid="i111_2" />
<span xid="span111_2" >

























新建模板</span>
</a>
<a bind-click="btnNewPublicPatternClick" bind-disable=" " bind-visible="$model.isManager.get()" class="btn btn-link btn-icon-left" component="$UI/system/components/justep/button/button" icon="icon-android-add" label="新建公共模板" xid="btnNewPublicPattern" >
<i class="icon-android-add" xid="i11_11" />
<span xid="span11_11" >




新建公共模板</span>
</a>
</div>
   <li xid="listItem" bind-css="{'bg-info': $model.patternData.getCurrentRow() == $object}"  xui:update-mode="merge"/>
   <div xid="output1" bind-dblclick="okBtnClick"  xui:update-mode="merge"/>
   <span xid="filterDialog" showTitle="true" status="normal" title="过滤条件" src="$UI/system/components/justep/bizFilter/filterEditor.w"  xui:update-mode="merge"/>
<xu:modifications>
  <xu:remove select="//*[@xid='output1']/@bind-click"/>
</xu:modifications>

</div>