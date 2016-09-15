<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" component="$UI/system/components/justep/window/window">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="left:18px;top:83px;height:244px;" onModelConstruct="modelModelConstruct"> 
    <div component="$UI/system/components/justep/data/bizData" xid="paiData"
      concept="DEMO_Asset" columns="DEMO_Asset,version,fCode,fScode,fDescription,fSName" limit="-1"
      autoLoad="true" autoNew="false" isTree="true"> 
      <reader xid="default1" action="/demo/misc/logic/action/queryAssetAction"/>  
      <writer xid="default2" action="/demo/misc/logic/action/saveAssetAction"/>  
      <creator xid="default3" action="/demo/misc/logic/action/createAssetAction"/> 
    </div> 
  </div>  
  <span component="$UI/system/components/justep/windowDialog/windowDialog" xid="baiduMapDialog"
    style="left:15px;top:143px;" src="$UI/demo/misc/process/pai/map.w"/>  
  <div component="$UI/system/components/justep/panel/panel" class="x-panel x-full"
    top="true" bottom="true" xid="panel1"> 
    <div class="x-panel-top" xid="top1"> 
      <div component="$UI/system/components/justep/titleBar/titleBar" title="随手拍"
        class="x-titlebar" xid="titleBar2"> 
        <div class="x-titlebar-left" xid="div5"> 
          <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-only-icon"
            icon="icon-chevron-left" onClick="backBtn1Click" xid="backBtn1"> 
            <i class="icon-chevron-left" xid="i8"/>  
            <span xid="span8"/> 
          </a> 
        </div>  
        <div class="x-titlebar-title" xid="div6">随手拍</div>  
        <div class="x-titlebar-right reverse" xid="div7"> 
          <a component="$UI/system/components/justep/button/button" class="btn btn-link"
            xid="mapBtn" icon="icon-android-location" onClick="mapBtnClick"> 
            <i xid="i1" class="icon-android-location"/>  
            <span xid="span1"/> 
          </a> 
        </div> 
      </div> 
    </div>  
    <div class="x-panel-content" xid="content1"> 
      <div component="$UI/system/components/justep/list/list" class="x-list"
            xid="list1" data="paiData">
          <div component="$UI/system/components/justep/contents/contents"
            class="x-contents x-full x-list-template" active="0" xid="contents1" onActiveChange="contents1ActiveChange" wrap="false">
            <div class="x-contents-content" data-bind="css:{'x-content-on-left':$model.isOnLeft.bind($model,$object)(),'active':$model.isOnCenter.bind($model,$object)(),'x-content-on-right':$model.isOnRight.bind($model,$object)()}">
            	<img style="min-height:200px;min-width:100%;" data-bind="attr:{src:$model.getSrc.bind($model,$object)()}" class="img-responsive"></img>
            </div>
          </div>
        </div> 
    </div>  
    <div class="x-panel-bottom" xid="bottom1"> 
      <div component="$UI/system/components/justep/titleBar/titleBar" class="x-titlebar"
        xid="titleBar1"> 
        <div class="x-titlebar-left" xid="div2"> 
          <a component="$UI/system/components/justep/button/button" class="btn btn-link"
            xid="cameraBtn" icon="icon-camera" onClick="cameraBtnClick"> 
            <i xid="i6" class="icon-camera"/>  
            <span xid="span6"/> 
          </a> 
        </div>  
        <div class="x-titlebar-title" xid="div3"/>  
        <div class="x-titlebar-right reverse" xid="div4">
        </div> 
      </div> 
    </div> 
  </div> 
</div>
