<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window" component="$UI/system/components/justep/window/window"
  design="device:mobile">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:151px;top:133px;"
    onModelConstructDone="modelModelConstructDone"/>  
  <div component="$UI/system/components/justep/panel/panel" class="x-panel x-full x-cards"
    xid="panel1"> 
    <div class="x-panel-top" xid="top1"> 
      <div component="$UI/system/components/justep/titleBar/titleBar" class="x-titlebar"
        xid="titleBar2"> 
        <div class="x-titlebar-left" xid="left1">
        	<!-- text:$model.getParentName($model.fileSystemModel), --> 
          <a component="$UI/system/components/justep/button/button" class="btn btn-link"
            label="" xid="backBtn" icon="icon-chevron-left" data-bind="click:$model.goBackDir.bind($model,$model.fileSystemModel)"> 
            <i xid="i11" class="icon-chevron-left"/>  
            <span data-bind="text:$model.getParentName($model.fileSystemModel)"
              xid="span2"/> 
          </a> 
        </div>  
        <div class="x-titlebar-title" xid="title1"> 
          <span data-bind="text:$model.fileSystemModel.name" xid="span3"/> 
        </div>  
        <div class="x-titlebar-right reverse" xid="right1"/> 
      </div> 
    </div>  
    <div class="x-panel-content" xid="div1"> 
      <ul class="x-scroll-content media-list" data-bind="foreach:$model.fileSystemModel.child"
          xid="div6" style="padding-top: 15px;"> 
          <li class="media" data-bind="click:$model.openEntry.bind($model,$object.name.get(),$object.fullPath.get(),$object.type.get())"
            xid="div7"> 
            <div class="x-blob x-blob-radius pull-left media-object x-org-image"
              xid="div8"> 
              <img class="x-blob-img x-autofill" xid="image1" data-bind="attr:{src:$model.getFileImage($object)}"/> 
            </div>  
            <div class="x-tree-link media-body" style="text-align:left;" xid="div9"> 
              <i class="pull-right icon-chevron-right" xid="i1" style="float:right;font-size:20px;padding-right:6px;padding-top:6px;"
                data-bind="visible:$object.type.get() == 'dir'"/>  
              <div class="media-body" xid="div10"> 
                <h4 class="media-heading" data-bind="text:$object.name" xid="h41"/>  
                <div data-bind="text:$object.fullPath" xid="div11"/>
              </div> 
            </div> 
          </li> 
        </ul> 
    </div> 
  </div> 
</div>
