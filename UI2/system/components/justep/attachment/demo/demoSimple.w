<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" component="$UI/system/components/justep/window/window">  
  <div component="$UI/system/components/justep/model/model" xid="model1" style="position:absolute;height:auto;left:317px;top:76px;"> 
    <div component="$UI/system/components/justep/data/data" autoLoad="true" xid="data1" idColumn="fId"><column label="主键" name="fId" type="String" xid="xid1"></column>
  <column label="附件" name="fAttachment" type="String" xid="xid2"></column>
  <data xid="default1">[{&quot;fId&quot;:&quot;0&quot;}]</data></div></div>  
  <div component="$UI/system/components/justep/panel/panel" class="x-panel x-full"
    xid="panel1"> 
    <div class="x-panel-top" xid="top1"> 
      <div component="$UI/system/components/justep/titleBar/titleBar" class="x-titlebar"
        xid="titleBar1" title="AttachmentSimple"> 
        <div class="x-titlebar-left" xid="div1"> 
          <a component="$UI/system/components/justep/button/button" class="btn btn-link"
            xid="button2" icon="icon-chevron-left" onClick="closeWin"> 
            <i xid="i2" class="icon-chevron-left"/>  
            <span xid="span2"/> 
          </a> 
        </div>  
        <div class="x-titlebar-title" xid="div2">AttachmentSimple</div>  
        <div class="x-titlebar-right reverse" xid="div3"/> 
      </div> 
    </div>  
    <div class="x-panel-content x-flex x-flex-column" xid="content2"> 
      <h3><![CDATA[AttachmentSimple       
      ]]></h3>  
      
  <p xid="p1">attachmentSimple组件，只需要绑定data的某一个字段就可以使用。</p><div component="$UI/system/components/justep/attachment/attachmentSimple" xid="attachmentSimple1" bind-ref="data1.ref('fAttachment')">
   <div class="x-attachment" xid="div4">
    <div class="x-attachment-content x-card-border" xid="div5">
     <div class="x-doc-process" xid="div6">
      <div class="progress-bar x-doc-process-bar" role="progressbar" style="width:0%;" xid="div7"></div></div> 
     <div data-bind="foreach:$attachmentItems" xid="div8">
      <div class="x-attachment-cell" xid="div9">
       <div class="x-attachment-item x-item-other" data-bind="click:$model.previewOrRemoveItem.bind($model),style:{backgroundImage:($model.previewPicture.bind($model,$object))()}" xid="div10">
        <a data-bind="visible:$model.$state.get() == 'remove'" class="x-remove-barget" xid="a1"></a></div> </div> </div> 
     <div class="x-attachment-cell" data-bind="visible:$state.get() == 'upload'" xid="div11">
      <div class="x-attachment-item x-item-upload" data-bind="visible:$state.get() == 'upload'" xid="div12"></div></div> 
     <div class="x-attachment-cell" data-bind="visible:$state.get() == 'upload' &amp;&amp; $attachmentItems.get().length &gt; 0" xid="div13">
      <div class="x-attachment-item x-item-remove" data-bind="click:changeState.bind($object,'remove')" xid="div14"></div></div> 
     <div style="clear:both;" xid="div15"></div></div> </div> </div>
  <label xid="label2">附件字段中存储的内容:</label>
  <textarea component="$UI/system/components/justep/textarea/textarea" class="form-control" xid="textarea1" style="height:259px;" bind-ref="data1.ref('fAttachment')"></textarea></div> 
  </div>  
  </div>
