<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" class="window" component="$UI/system/components/justep/window/window" design="device:m;">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="top:74px;height:auto;left:387px;"> 
    <div component="$UI/system/components/justep/data/bizData" xid="mainData"
      concept="SA_DocNode" limit="8" autoLoad="true"> 
      <reader xid="default4" action="/system/logic/action/queryDocNodeAction"/>  
      <writer action="/system/logic/action/saveDocNodeAction"/>  
      <creator action="/system/logic/action/createDocNodeAction"/> 
    </div> 
  </div>  
  <span component="$UI/system/components/justep/windowDialog/windowDialog" xid="windowDialog"
    src="$UI/system/components/justep/common/demo/dialog.w"/>  
  <div component="$UI/system/components/justep/panel/panel" class="x-panel x-full"
    xid="panel1"> 
    <div class="x-panel-top" xid="top1"> 
      <div component="$UI/system/components/justep/titleBar/titleBar" class="x-titlebar"
        xid="titleBar1" title="attachment"> 
        <div class="x-titlebar-left" xid="div1"> 
          <a component="$UI/system/components/justep/button/button" class="btn btn-link"
            xid="button1" icon="icon-chevron-left" onClick="backMain"> 
            <i xid="i1" class="icon-chevron-left"/>  
            <span xid="span1"/> 
          </a> 
        </div>  
        <div class="x-titlebar-title" xid="div2">attachment</div>  
        <div class="x-titlebar-right reverse" xid="div3"/> 
      </div> 
    </div>  
    <div class="x-panel-content" xid="content1" style="padding:8.75px"> 
      <h3>attachment
        <a component="$UI/system/components/justep/button/button" class="btn btn-link"
          label="源码" xid="button2" onClick="showAttachSource" bind-visible="isVisible"> 
          <i xid="i2"/>  
          <span xid="span2">源码</span> 
        </a> 
      </h3>  
      <p>附件上传组件</p>  
      <div component="$UI/system/components/justep/attachment/attachment" access="1799"
        xid="demoAttachment" bind-ref="mainData.ref('sDescription')"> 
        <div class="x-attachment" xid="div24"> 
          <div class="x-attachment-content x-card-border" xid="div25"> 
            <div class="x-doc-process"> 
              <div class="progress-bar x-doc-process-bar" role="progressbar"
                style="width:0%;"/> 
            </div>  
            <div data-bind="foreach:$attachmentItems" xid="div26"> 
              <div class="x-attachment-cell" xid="div27"> 
                <div class="x-attachment-item x-item-other" data-bind="click:$model.previewOrRemoveItem.bind($model),style:{opacity: $model.$access.get() % 4 &gt;= 2 || $model.$state.get() == 'remove' ? '1.0' : '0.5',backgroundImage:($model.previewPicture.bind($model,$object))()}"
                  xid="div28"> 
                  <a data-bind="visible:$model.$state.get() == 'remove'"
                    class="x-remove-barget" xid="a3"/> 
                </div> 
              </div> 
            </div>  
            <div class="x-attachment-cell" data-bind="visible:$state.get() == 'upload' &amp;&amp; ($limit.get() == '-1' || $limit.get() &gt; $attachmentItems.get().length)"
              xid="div29"> 
              <div class="x-attachment-item x-item-upload" data-bind="visible:$state.get() == 'upload' &amp;&amp; $access.get() % 512 &gt;= 256"
                xid="div30"/> 
            </div>  
            <div class="x-attachment-cell" data-bind="visible:$state.get() == 'upload' &amp;&amp; $attachmentItems.get().length &gt; 0"
              xid="div31"> 
              <div class="x-attachment-item x-item-remove" data-bind="click:changeState.bind($object,'remove'),visible:$access.get() % 2048 &gt;= 1024"
                xid="div32"/> 
            </div>  
            <div style="clear:both;" xid="div33"/> 
          </div> 
        </div> 
      </div>  
      <a component="$UI/system/components/justep/button/button" class="btn btn-default"
        label="保存" xid="button3" onClick="save"> 
        <i xid="i3"/>  
        <span xid="span3">保存</span> 
      </a>  
      <div component="$UI/system/components/justep/attachment/attachmentPC"
        access="duud" xid="attachmentPC1" bind-ref="mainData.ref('sDescription')"
        onBrowse="attachmentPC1Browse" onFileSelect="attachmentPC1FileSelect" onStart="attachmentPC1Start"
        onProgress="attachmentPC1Progress" onSuccess="attachmentPC1Success" onError="attachmentPC1Error"
        onNewFromTemplate="attachmentPC1NewFromTemplate" onOfficeLoaded="attachmentPC1OfficeLoaded"
        onDownload="attachmentPC1Download" onOpenOfficeEditor="attachmentPC1OpenOfficeEditor"
        onCreateVersion="attachmentPC1CreateVersion" onShowHistory="attachmentPC1ShowHistory"
        onDelete="attachmentPC1Delete" onEdit="attachmentPC1Edit"> 
        <div class="x-attachment-pc" xid="div4"> 
          <div class="x-attachment-content x-card-border" xid="div5"> 
            <div class="x-doc-process" xid="div6"> 
              <div class="progress-bar x-doc-process-bar" role="progressbar"
                style="width:0%;" xid="div7"/>
            </div>  
            <div class="x-attachment-cell-tpl" data-bind="foreach:$attachmentItems"
              xid="div8"> 
              <div class="x-attachment-cell x-attachment-item" xid="div9"> 
                <div class="x-item-other x-item-icon" data-bind="event:{mouseover:function(){if($model.$state.get()!='upload'){return;} $model.$activeDoc.set($object)}},click:$model.previewOrRemoveItem.bind($model),style:{opacity: $model.$access.get() % 4 &gt;= 2 || $model.$state.get() == 'remove' ? '1.0' : '0.5',backgroundImage:($model.previewPicture.bind($model,$object))()},css:{'x-doc-item-active':$model.$activeDoc.get() == $object}"
                  xid="div10"> 
                  <a data-bind="visible:$model.$state.get() == 'remove'"
                    class="x-remove-barget" xid="a1"/>
                </div> 
              </div> 
            </div>  
            <div class="x-attachment-cell x-attachment-item" data-bind="visible:$state.get() == 'upload' &amp;&amp; ($limit.get() == '-1' || $limit.get() &gt; $attachmentItems.get().length)"
              xid="div11"> 
              <div class="x-item-icon x-item-upload" data-bind="visible:$state.get() == 'upload' &amp;&amp; $access.get() % 512 &gt;= 256"
                xid="div12"/>
            </div>  
            <div class="x-attachment-cell x-attachment-item" data-bind="visible:$state.get() == 'upload' &amp;&amp; ($limit.get() == '-1' || $limit.get() &gt; $attachmentItems.get().length)"
              xid="div13"> 
              <div class="x-item-icon x-item-new-tpl" data-bind="visible:$state.get() == 'upload' &amp;&amp; $access.get() % 512 &gt;= 256,click:$model.newFormTemplate.bind($model)"
                xid="div14"/>
            </div>  
            <div class="x-attachment-cell x-attachment-item" data-bind="visible:$state.get() == 'upload' &amp;&amp; $attachmentItems.get().length &gt; 0"
              xid="div15"> 
              <div class="x-item-icon x-item-remove" data-bind="click:changeState.bind($object,'remove'),visible:$access.get() % 2048 &gt;= 1024"
                xid="div16"/>
            </div>  
            <div class="x-attachment-toolbar" data-bind="if:$model.$activeDoc.get(),style:{display:$model.$activeDoc.get()?($('html').hasClass('flexboxlegacy')?'flex':'inline-block'):'none'}"
              xid="div17"> 
              <div class="x-item-name" xid="div18"> 
                <a class="btn btn-link" data-bind="click:$model.previewOrRemoveItem.bind($model,$model.$activeDoc.get()),text:$model.$activeDoc.get().docName.get()"
                  xid="a2"/>  
                <span class="btn btn-link" data-bind="text:$model.getFormatSize($model.$activeDoc.get())"
                  xid="span4"/>
              </div>  
              <div class="x-item-edit" xid="div19"> 
                <a class="btn btn-link" data-bind="click:$model.editDoc.bind($model,$model.$activeDoc.get())"
                  xid="a4">编辑</a>
              </div>  
              <div class="x-item-download" xid="div20"> 
                <a class="btn btn-link" data-bind="click:$model.showHistory.bind($model,$model.$activeDoc.get())"
                  xid="a5">历史</a>
              </div>  
              <div class="x-item-download" xid="div21"> 
                <a class="btn btn-link" data-bind="enable:$model.$activeDoc.get().fileID.get(),click:$model.downloadDoc.bind($model,$model.$activeDoc.get())"
                  xid="a6">下载</a>
              </div>  
              <div class="x-item-delete" xid="div22"> 
                <a class="btn btn-link" data-bind="click:$model.deleteDoc.bind($model,$model.$activeDoc.get())"
                  xid="a7">删除</a>
              </div> 
            </div>  
            <div style="clear:both;" xid="div23"/>
          </div> 
        </div> 
      </div>
    <div component="$UI/system/components/justep/attachment/attachmentPC" access="duud" xid="attachmentPC2" bind-ref="mainData.ref('sDescription')">
   <div class="x-attachment-pc" xid="div34">
    <div class="x-attachment-content x-card-border" xid="div35">
     <div class="x-doc-process" xid="div36">
      <div class="progress-bar x-doc-process-bar" role="progressbar" style="width:0%;" xid="div37"></div></div> 
     <div class="x-attachment-cell-tpl" data-bind="foreach:$attachmentItems" xid="div38">
      <div class="x-attachment-cell x-attachment-item" xid="div39">
       <div class="x-item-other x-item-icon" data-bind="event:{mouseover:function(){if($model.$state.get()!='upload'){return;} $model.$activeDoc.set($object)}},click:$model.previewOrRemoveItem.bind($model),style:{opacity: $model.$access.get() % 4 &gt;= 2 || $model.$state.get() == 'remove' ? '1.0' : '0.5',backgroundImage:($model.previewPicture.bind($model,$object))()},css:{'x-doc-item-active':$model.$activeDoc.get() == $object}" xid="div40">
        <a data-bind="visible:$model.$state.get() == 'remove'" class="x-remove-barget" xid="a8"></a></div> </div> </div> 
     <div class="x-attachment-cell x-attachment-item" data-bind="visible:$state.get() == 'upload' &amp;&amp; ($limit.get() == '-1' || $limit.get() &gt; $attachmentItems.get().length)" xid="div41">
      <div class="x-item-icon x-item-upload" data-bind="visible:$state.get() == 'upload' &amp;&amp; $access.get() % 512 &gt;= 256" xid="div42"></div></div> 
     <div class="x-attachment-cell x-attachment-item" data-bind="visible:$state.get() == 'upload' &amp;&amp; ($limit.get() == '-1' || $limit.get() &gt; $attachmentItems.get().length)" xid="div43">
      <div class="x-item-icon x-item-new-tpl" data-bind="visible:$state.get() == 'upload' &amp;&amp; $access.get() % 512 &gt;= 256,click:$model.newFormTemplate.bind($model)" xid="div44"></div></div> 
     <div class="x-attachment-cell x-attachment-item" data-bind="visible:$state.get() == 'upload' &amp;&amp; $attachmentItems.get().length &gt; 0" xid="div45">
      <div class="x-item-icon x-item-remove" data-bind="click:changeState.bind($object,'remove'),visible:$access.get() % 2048 &gt;= 1024" xid="div46"></div></div> 
     <div class="x-attachment-toolbar" data-bind="if:$model.$activeDoc.get(),style:{display:$model.$activeDoc.get()?($('html').hasClass('flexboxlegacy')?'flex':'inline-block'):'none'}" xid="div47">
      <div class="x-item-name" xid="div48">
       <a class="btn btn-link" data-bind="enable:($model.$activeDoc.get().fileID.get() &amp;&amp; $model.$access.get() % 4 &gt;= 2),click:$model.previewOrRemoveItem.bind($model,$model.$activeDoc.get()),text:$model.$activeDoc.get().docName.get()" xid="a9"></a>
       <span class="btn btn-link" data-bind="enable:false,text:$model.getFormatSize($model.$activeDoc.get())" xid="span5"></span></div> 
      <div class="x-item-edit" xid="div49">
       <a class="btn btn-link" data-bind="enable:$model.$access.get() % 1024 &gt;= 512,click:$model.editDoc.bind($model,$model.$activeDoc.get())" xid="a10">编辑</a></div> 
      <div class="x-item-download" xid="div50">
       <a class="btn btn-link" data-bind="enable:$model.$access.get() % 1024 &gt;= 512,click:$model.showHistory.bind($model,$model.$activeDoc.get())" xid="a11">历史</a></div> 
      <div class="x-item-download" xid="div51">
       <a class="btn btn-link" data-bind="enable:($model.$activeDoc.get().fileID.get() &amp;&amp; $model.$access.get() % 8 &gt;= 4),click:$model.downloadDoc.bind($model,$model.$activeDoc.get())" xid="a12">下载</a></div> 
      <div class="x-item-delete" xid="div52">
       <a class="btn btn-link" data-bind="enable:$model.$access.get() % 2048 &gt;= 1024,click:$model.deleteDoc.bind($model,$model.$activeDoc.get())" xid="a13">删除</a></div> </div> 
     <div style="clear:both;" xid="div53"></div></div> </div> </div></div> 
  </div> 
</div>
