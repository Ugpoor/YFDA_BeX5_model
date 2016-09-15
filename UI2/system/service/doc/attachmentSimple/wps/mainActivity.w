<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window" component="$UI/system/components/justep/window/window"
  design="device:pc">  
  <div component="$UI/system/components/justep/model/model" xid="model" onLoad="modelLoad"> 
    <div component="$UI/system/components/justep/data/bizData" autoLoad="true"
      xid="bizData1" concept="SA_DocNode" columns="SA_DocNode,sDocName,sDescription,version"> 
      <reader xid="default1" action="/system/logic/action/queryDocNodeAction"/>  
      <writer xid="default2" action="/system/logic/action/saveDocNodeAction"/>  
      <creator xid="default3" action="/system/logic/action/createDocNodeAction"/> 
    </div> 
  </div>  
  <div component="$UI/system/components/justep/toolBar/toolBar" class="x-toolbar form-inline x-toolbar-spliter"
    xid="toolBar1"> 
    <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
      onClick="{'operation':'bizData1.save'}" xid="button1"> 
      <i xid="i1"/>  
      <span xid="span1"/> 
    </a> 
  </div>  
  <input component="$UI/system/components/justep/input/input" class="form-control"
    xid="input1" bind-ref="bizData1.ref('sDescription')"/>  
  <div component="$UI/system/components/justep/attachment/attachmentSimple"
    access="duud" xid="attachmentSimple2" bind-ref="bizData1.ref('sDescription')"> 
    <div class="x-attachment" xid="div13"> 
      <div class="x-attachment-content x-card-border" xid="div14"> 
        <div class="x-doc-process" xid="div15"> 
          <div class="progress-bar x-doc-process-bar" role="progressbar" style="width:0%;"
            xid="div16"/> 
        </div>  
        <div data-bind="foreach:$attachmentItems" xid="div17"> 
          <div class="x-attachment-cell" xid="div18"> 
            <div class="x-attachment-item x-item-other" data-bind="click:$model.edit.bind($model),style:{backgroundImage:($model.previewPicture.bind($model,$object))()}"
              xid="div19"> 
              <a data-bind="visible:$model.$state.get() == 'remove'" class="x-remove-barget"
                xid="a2"/> 
            </div> 
          </div> 
        </div>  
        <div class="x-attachment-cell" data-bind="visible:$state.get() == 'upload'"
          xid="div20"> 
          <div class="x-attachment-item x-item-upload" data-bind="visible:$state.get() == 'upload'"
            xid="div21"/> 
        </div>  
        <div class="x-attachment-cell" data-bind="visible:$state.get() == 'upload' &amp;&amp; $attachmentItems.get().length &gt; 0"
          xid="div22"> 
          <div class="x-attachment-item x-item-remove" data-bind="click:changeState.bind($object,'remove')"
            xid="div23"/> 
        </div>  
        <div style="clear:both;" xid="div24"/> 
      </div> 
    </div> 
  </div>  
  
  
  
  <div component="$UI/system/components/justep/attachment/attachmentSimple"
    access="duud" xid="attachmentSimple2" bind-ref="bizData1.ref('sDescription')"> 
    	<div class="x-attachment x-attachment-list">
		    <div class="x-attachment-toolbar">
		        <div class="x-attachment-title">选择文件上传</div>
		        <div class="x-attachment-upload">
		            <div class="x-attachment-upload-btn x-item-upload">上传</div>
		        </div>
		    </div>
		    <table class="x-attachment-list table table-hover">
		        <tbody data-bind="foreach:$attachmentItems">
		        <tr>
		            <td>
			            <div style="width:40px;height:40px;background-size:42px;" data-bind="style:{backgroundImage:($model.previewPicture.bind($model,$object))()}">
			            </div>
		            </td>
		            <td>
		            	<span data-bind="text:$object.realFileName.get()">
		            	</span>
		            </td>
		            <td>
		                <span class="glyphicon glyphicon-pencil" data-bind="click:$model.edit.bind($model)"></span>
		            </td>
		            <td>
		                <span class="glyphicon glyphicon-remove" data-bind="click:$model.deleteFile.bind($model)"></span>
		            </td>
		        </tr>
		        </tbody>
		    </table>
		
		    <div class="x-attachment-processbar">
		        <div class="progress-bar x-doc-process-bar" role="progressbar"/>
		    </div>
		</div> 
  </div> 
</div>
