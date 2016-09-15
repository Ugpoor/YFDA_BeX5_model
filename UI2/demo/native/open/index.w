<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" component="$UI/system/components/justep/window/window" design="device:m;"
  xid="window" class="window">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:239px;top:49px;"> 
    <div component="$UI/system/components/justep/data/data" autoLoad="true"
      xid="data" idColumn="id"> 
      <column label="id" name="id" type="String" xid="xid1"/>  
      <column label="imageURI" name="imageURI" type="String" xid="xid2"/> 
    <data xid="default1">[{&quot;id&quot;:&quot;1&quot;}]</data></div> 
  </div>  
  <div component="$UI/system/components/justep/panel/panel" class="x-panel x-full"
    xid="panel1"> 
    <div class="x-panel-top" xid="top1"> 
      <div component="$UI/system/components/justep/titleBar/titleBar" title="文件打开插件实例"
        class="x-titlebar"> 
        <div class="x-titlebar-left"> 
          <a component="$UI/system/components/justep/button/button" label=""
            class="btn btn-link btn-only-icon" icon="icon-chevron-left" onClick="{operation:'window.close'}"
            xid="backBtn"> 
            <i class="icon-chevron-left"/>  
            <span/> 
          </a> 
        </div>  
        <div class="x-titlebar-title">文件打开插件实例</div>  
        <div class="x-titlebar-right reverse"/> 
      </div> 
    </div>  
    <div class="x-panel-content container-fluid" xid="content1"> 
      <p>拍照，用于下面操作</p>  
      <a component="$UI/system/components/justep/button/button" class="btn btn-default"
        label="拍照" xid="takePhone" onClick="takePhoneClick"> 
        <i xid="i4"/>  
        <span xid="span4">拍照</span> 
      </a>  
      <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label30" xid="labelInput1">
   <label class="x-label" xid="label1"><![CDATA[文件路径]]></label>
   <input component="$UI/system/components/justep/input/input" class="form-control x-edit" xid="input1" bind-ref="data.ref('imageURI')"></input></div><p><![CDATA[打开一个文件]]></p>  
      <a component="$UI/system/components/justep/button/button" class="btn btn-default"
        label="打开文件" xid="openFile" onClick="openFileClick"> 
        <i xid="i1"/>  
        <span xid="span1">打开文件</span> 
      </a> 
    </div> 
  </div> 
</div>
