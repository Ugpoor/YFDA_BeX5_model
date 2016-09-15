<?xml version="1.0" encoding="UTF-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window" component="$UI/system/components/justep/window/window" design="device:m;">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:433px;top:627px;"><div component="$UI/system/components/justep/data/data" autoLoad="true" xid="cuisineDetailData" idColumn="fID"><column isCalculate="false" label="ID" name="fID" type="String" xid="xid1"></column>
  <column label="名称" name="fName" type="String" xid="xid2"></column>
  <column label="价格" name="fPrice" type="String" xid="xid3"></column>
  <column label="描述" name="fDescription" type="String" xid="xid4"></column>
  <column label="图片" name="fImage" type="String" xid="xid5"></column>
  <data xid="default1">[{&quot;id&quot;:&quot;&quot;}]</data>
  <column label="状态" name="fStatus" type="String" xid="xid6"></column></div>
  <div component="$UI/system/components/justep/data/data" autoLoad="true" xid="statusData" idColumn="value"><column label="值" name="value" type="String" xid="xid7"></column>
  <column label="显示值" name="oValue" type="String" xid="xid8"></column>
  <data xid="default2">[{&quot;value&quot;:&quot;0&quot;,&quot;oValue&quot;:&quot;正在热销&quot;},{&quot;value&quot;:&quot;1&quot;,&quot;oValue&quot;:&quot;已下架&quot;}]</data></div></div> 
<span component="$UI/system/components/justep/windowReceiver/windowReceiver" xid="windowReceiver" onReceive="windowReceiverReceive"></span><div component="$UI/system/components/justep/panel/panel" class="x-panel x-full" xid="panel2">
   <div class="x-panel-content" xid="content1">
  
  
  <div class="panel panel-default" component="$UI/system/components/bootstrap/panel/panel" xid="panel1">
   
   <div class="panel-body" xid="body1"><div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label30" xid="labelEdit1">
   <label class="x-label" xid="label1"><![CDATA[菜品名称]]></label>
   <input component="$UI/system/components/justep/input/input" class="form-control x-edit" xid="input1" bind-ref="cuisineDetailData.ref('fName')"></input></div><div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label30" xid="labelEdit2">
   <label class="x-label" xid="label2"><![CDATA[菜品价格]]></label>
   <input component="$UI/system/components/justep/input/input" class="form-control x-edit" xid="input2" bind-ref="cuisineDetailData.ref('fPrice')"></input></div><div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label30" xid="labelEdit3">
   <label class="x-label" xid="label3"><![CDATA[菜品描述]]></label>
   <textarea component="$UI/system/components/justep/textarea/textarea" class="form-control x-edit" xid="textarea1" bind-ref="cuisineDetailData.ref('fDescription')"></textarea></div><div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label30" xid="labelEdit4">
   <label class="x-label" xid="label4"><![CDATA[状态]]></label>
   <select component="$UI/system/components/justep/select/select" class="form-control x-edit" xid="select1" bind-ref="cuisineDetailData.ref('fStatus')" bind-options="statusData" bind-optionsValue="value" bind-optionsLabel="oValue"></select></div><div xid="div12" align="center"><span xid="span3"><![CDATA[菜品图片]]></span>
  </div>
  <div component="$UI/system/components/justep/attachment/attachmentSimple" actionUrl="/baas/takeoutAdmin/attachment/SimpleFileStore" xid="attachmentSimple1" bind-ref="cuisineDetailData.ref('fImage')">
   <div class="x-attachment" xid="div1">
    <div class="x-attachment-content x-card-border" xid="div2">
     <div class="x-doc-process" xid="div3">
      <div class="progress-bar x-doc-process-bar" role="progressbar" style="width:0%;" xid="progressBar1"></div></div> 
     <div data-bind="foreach:$attachmentItems" xid="div4">
      <div class="x-attachment-cell" xid="div5">
       <div class="x-attachment-item x-item-other" data-bind="click:$model.previewOrRemoveItem.bind($model),style:{backgroundImage:($model.previewPicture.bind($model,$object))()}" xid="div6">
        <a data-bind="visible:$model.$state.get() == 'remove'" class="x-remove-barget" xid="a1"></a></div> </div> </div> 
     <div class="x-attachment-cell" data-bind="visible:$state.get() == 'upload'" xid="div7">
      <div class="x-attachment-item x-item-upload" data-bind="visible:$state.get() == 'upload'" xid="div8"></div></div> 
     <div class="x-attachment-cell" data-bind="visible:$state.get() == 'upload' &amp;&amp; $attachmentItems.get().length &gt; 0" xid="div9">
      <div class="x-attachment-item x-item-remove" data-bind="click:changeState.bind($object,'remove')" xid="div10"></div></div> 
     <div style="clear:both;" xid="div11"></div></div> </div> </div>
  </div>
   </div></div>
   <div class="x-panel-bottom" xid="bottom1"><a component="$UI/system/components/justep/button/button" class="btn btn-link x-dialog-button" label="取消" xid="cancel" onClick="cancelClick">
   <i xid="i1"></i>
   <span xid="span1">取消</span></a><a component="$UI/system/components/justep/button/button" class="btn btn-primary x-dialog-button" label="确定" xid="okbtn" onClick="okbtnClick">
   <i xid="i2"></i>
   <span xid="span2">确定</span></a></div></div></div>