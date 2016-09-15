<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" component="$UI/system/components/justep/window/window" design="device:m;"
  xid="window" class="window">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:239px;top:49px;"> 
    <div component="$UI/system/components/justep/data/data" autoLoad="true"
      xid="data" idColumn="id"> 
      <column label="id" name="id" type="String" xid="xid1"/>  
      <column label="imageURI" name="imageURI" type="String" xid="xid2"/>  
      <column label="unpackageId" name="unpackageId" type="String" xid="xid3"/>  
      <column label="ispackageid" name="ispackageid" type="String" xid="xid4"/>  
      <data xid="default1">[{"id":"1","unpackageId":"com.justep.x5","ispackageid":"com.justep.x5"}]</data> 
    </div> 
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
      <p>打开上面拍照保存的图片</p>  
      <a component="$UI/system/components/justep/button/button" class="btn btn-default"
        label="打开文件" xid="openFile" onClick="openFileClick"> 
        <i xid="i1"/>  
        <span xid="span1">打开文件</span> 
      </a>  
      <p>以下适用于android</p>
      <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label30"
        xid="labelInput2"> 
        <label class="x-label" xid="label2"><![CDATA[应用包名]]></label>  
        <input component="$UI/system/components/justep/input/input" class="form-control x-edit"
          xid="input2" bind-ref="data.ref('unpackageId')"/>
      </div>
      <p>卸载应用</p>  
      <a component="$UI/system/components/justep/button/button" class="btn btn-default"
        label="卸载" xid="uninstall" onClick="uninstallClick"> 
        <i xid="i2"/>  
        <span xid="span2">卸载</span> 
      </a>  
      <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label30" xid="labelInput3">
   <label class="x-label" xid="label3"><![CDATA[应用包名]]></label>
   <input component="$UI/system/components/justep/input/input" class="form-control x-edit" xid="input3" bind-ref="data.ref('ispackageid')"></input></div>
      <p>判断app是否存在</p>  
      <a component="$UI/system/components/justep/button/button" class="btn btn-default"
        label="判断app是否存在" xid="checkappinstall" onClick="checkappinstallClick"> 
        <i xid="i3"/>  
        <span xid="span3">判断app是否存在</span> 
      </a>  
      
    </div> 
  </div> 
</div>
