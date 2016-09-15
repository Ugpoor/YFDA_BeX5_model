<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" component="$UI/system/components/justep/window/window" design="device:m;"
  xid="window" class="window">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:100px;top:109px;"
    onParamsReceive="modelParamsReceive" onInactive="modelInactive"> 
    <div component="$UI/system/components/justep/data/baasData" autoLoad="true"
      xid="paiData" saveAction="savePai_pictures" queryAction="queryPai_pictures"
      tableName="pai_pictures" url="/justep/pai" idColumn="fID" confirmRefresh="false" confirmDelete="false" directDelete="true"> 
      <column label="fID" name="fID" type="Integer" xid="default1"/>  
      <column label="文件名" name="fFileName" type="String" xid="default6"/>  
      <column label="预览地址" name="fPreviewPath" type="String" xid="default2"/>  
      <column label="下载地址" name="fDownloadPath" type="String" xid="default3"/>  
      <column label="建立时间" name="fCreateTime" type="String" xid="default4"/>  
      <column label="描述" name="fDescription" type="String" xid="default5"/>  
      <column label="地理位置" name="fAddress" type="String" xid="default7"/>  
      <column label="定位" name="fPositioning" type="String" xid="default8"/> 
    </div> 
  </div>  
  <div component="$UI/system/components/justep/panel/panel" class="x-panel x-full"
    xid="panel1"> 
    <div class="x-panel-top" xid="top1"> 
      <div component="$UI/system/components/justep/titleBar/titleBar" class="x-titlebar"> 
        <div class="x-titlebar-left flex5"> 
          <span xid="span4" bind-text='$model.paiData.ref("fFileName")'/> 
        </div>  
        <div class="x-titlebar-title"/>  
        <div class="x-titlebar-right reverse"><a component="$UI/system/components/justep/button/button" class="btn btn-link btn-only-icon" label="button" xid="rightBtn" icon="icon-chevron-right" onClick="rightBtnClick"> 
          <i xid="i7" class="icon-chevron-right" />  
          <span xid="span2" />
        </a><a component="$UI/system/components/justep/button/button" class="btn btn-link btn-only-icon" label="button" xid="leftBtn" icon="icon-chevron-left" onClick="leftBtnClick"> 
          <i xid="i1" class="icon-chevron-left" />  
          <span xid="span1" />
        </a></div> 
      </div> 
    </div>  
    <div class="x-panel-content" xid="content1"> 
      
  <div component="$UI/system/components/bootstrap/carousel/carousel" class="x-carousel" xid="carousel1" supportImagePinch="true" style="height:100%;">
   <div class="x-contents carousel-inner" role="listbox" component="$UI/system/components/justep/contents/contents" active="0" slidable="true" wrap="true" swipe="true" routable="false" xid="contents1" style="height:100%;">
    <div class="x-contents-content" xid="content2" style="height:100%;">
     <img src="" alt="" xid="pinch" id="pinch" class="o-img"></img></div> </div> 
   
   </div>
  </div>  
    <div class="x-panel-bottom" xid="bottom1" height="48"> 
      <div class="panel-body o-information" xid="div6"> 
        <div xid="div7"> 
          <span xid="span16">文件：</span>  
          <span bind-text="paiData.ref('fFileName')" xid="span17"/> 
        </div>  
        <div xid="div9"> 
          <span xid="span20">描述：</span>  
          <span bind-text="paiData.ref('fDescription')" class="o-description"
            xid="span21"/>  
          <!-- 
          <div component="$UI/system/components/justep/row/row" class="x-row o-editDescription o-nopadding"> 
            <div class="x-col x-col-10 o-nopadding" xid="col1"> 
              <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-only-icon"
                label="button" xid="button2" icon="icon-edit"> 
                <i xid="i2" class="icon-edit"/>  
                <span xid="span3"/> 
              </a> 
            </div>  
            <div class="x-col x-col-fixed" xid="col2"> 
              <input component="$UI/system/components/justep/input/input" class="form-control o-input"
                xid="input" bind-ref="paiData.ref('fDescription')"/> 
            </div>  
            <div class="x-col x-col-10 o-rightBtn text-center o-nopadding"
              xid="col3"> 
              <a component="$UI/system/components/justep/button/button" class="btn btn-only-label o-saveBtn"
                label="保存" xid="okBtn" onClick="okBtnClick"> 
                <i xid="i8"/>  
                <span xid="span5">保存</span> 
              </a> 
            </div> 
          </div>
           -->  
          <span xid="edit" class="o-edit" bind-click="editClick"><![CDATA[编辑]]></span>
          <div component="$UI/system/components/bootstrap/row/row" class="row o-nopadding o-editDescription"> 
            <div class="col col-xs-2 o-nopadding text-center" xid="col1"> 
              <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-only-icon"
                label="button" xid="button2" icon="icon-edit"> 
                <i xid="i2" class="icon-edit text-muted"/>  
                <span xid="span3"/> 
              </a> 
            </div>  
            <div class="col col-xs-8 o-nopadding" xid="col2"> 
              <input component="$UI/system/components/justep/input/input" class="form-control o-input"
                xid="input" bind-ref="paiData.ref('fDescription')"/> 
            </div>  
            <div class="col col-xs-2 o-nopadding text-center" xid="col3"> 
              <a component="$UI/system/components/justep/button/button" class="btn btn-only-label o-saveBtn"
                label="保存" xid="okBtn" onClick="okBtnClick"> 
                <i xid="i8"/>  
                <span xid="span5">保存</span> 
              </a> 
            </div> 
          </div>  
          <div class="clearfix"/> 
        </div>  
        <div xid="div5" bind-click="mapBtnClick"> 
          <span xid="span9">位置：</span>  
          <span bind-text="paiData.ref('fAddress')" xid="span10"/>  
          <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-only-icon"
            label="button" xid="mapBtn" icon="icon-android-location"> 
            <i xid="i3" class="icon-android-location"/>  
            <span xid="span11"/> 
          </a> 
        </div>  
        <div xid="div8"> 
          <span xid="span18">上传时间：</span>  
          <span bind-text="paiData.ref('fCreateTime')" xid="span19"/> 
        </div> 
      </div>  
      <div component="$UI/system/components/justep/button/buttonGroup" class="btn-group btn-group-justified o-tools"
        tabbed="true" xid="buttonGroup1"> 
        <a component="$UI/system/components/justep/button/button" label=""
          class="btn btn-link btn-only-icon" icon="icon-chevron-left" onClick="{operation:'window.close'}"
          xid="backBtn"> 
          <i class="icon-chevron-left"/>  
          <span/> 
        </a>  
        <a component="$UI/system/components/justep/button/button" label=""
          class="btn btn-link btn-only-icon" icon="icon-ios7-information-outline"
          onClick="informationBtnClick" xid="informationBtn"> 
          <i class="icon-ios7-information-outline" xid="i4"/>  
          <span xid="span13"/> 
        </a>  
        <a component="$UI/system/components/justep/button/button" label=""
          class="btn btn-link btn-only-icon" icon="icon-ios7-trash-outline" onClick="delOpenClick"
          xid="delOpen"> 
          <i class="icon-ios7-trash-outline" xid="i5"/>  
          <span xid="span14"/> 
        </a>  
        <a component="$UI/system/components/justep/button/button" label=""
          class="btn btn-link btn-only-icon" icon="icon-android-download" onClick="downloadBtnClick"
          xid="downloadBtn"> 
          <i class="icon-android-download" xid="i6"/>  
          <span xid="span15"/> 
        </a> 
      </div> 
    </div> 
  </div> 
<div component="$UI/system/components/justep/popOver/popOver" class="x-popOver" xid="delPopOver" opacity="0.7">
   <div class="x-popOver-overlay" xid="div1"></div>
   <div class="x-popOver-content" xid="div2"><div component="$UI/system/components/justep/bar/bar" class="x-titlebar x-bar" xid="bar1" bind-html="'提示信息'"></div>
  <div xid="div3" class="panel-body o-delContent"><span xid="span8"><![CDATA[确定删除？]]></span><a component="$UI/system/components/justep/button/button" class="btn x-green" label="确定" xid="delBtn" onClick="delBtnClick">
   <i xid="i9"></i>
   <span xid="span6">确定</span></a><a component="$UI/system/components/justep/button/button" class="btn x-gray" label="取消" xid="cancelBtn" onClick="cancelBtnClick">
   <i xid="i10"></i>
   <span xid="span7" class="text-muted">取消</span></a></div>
  
  
  </div></div></div>
