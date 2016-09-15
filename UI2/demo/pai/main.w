<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" component="$UI/system/components/justep/window/window" design="device:m;"
  xid="window" class="window">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="left:18px;top:83px;height:244px;" onActive="modelActive" onLoad="modelLoad"> 
    <div component="$UI/system/components/justep/data/baasData" autoLoad="true"
      xid="paiData" saveAction="savePai_pictures" queryAction="queryPai_pictures"
      tableName="pai_pictures" url="/justep/pai" idColumn="fID"> 
      <column label="fID" name="fID" type="Integer" xid="default1"/>  
      <column label="文件名" name="fFileName" type="String" xid="default6"/>  
      <column label="预览地址" name="fPreviewPath" type="String" xid="default2"/>  
      <column label="下载地址" name="fDownloadPath" type="String" xid="default3"/>  
      <column label="建立时间" name="fCreateTime" type="String" xid="default4"/>  
      <column label="描述" name="fDescription" type="String" xid="default5"/>  
      <column label="地理位置" name="fAddress" type="String" xid="default7"/>  
      <column label="定位" name="fPositioning" type="String" xid="default8"/> 
    </div>  
    <div component="$UI/system/components/justep/data/data" autoLoad="true"
      xid="data" idColumn="id" autoNew="false" limit="-1" onValueChanged="dataValueChanged"
      confirmRefresh="false" confirmDelete="false"> 
      <column name="id" type="String" xid="xid3"/>  
      <column name="fileName" type="String" xid="xid2"/>  
      <data xid="default6">[{"id":"1","fileName":""}]</data> 
    </div> 
  </div>  
  <div component="$UI/system/components/justep/panel/panel" class="x-panel x-full"
    xid="panel1"> 
    <div class="x-panel-top" xid="top1"> 
      <div component="$UI/system/components/justep/titleBar/titleBar" title="随手拍"
        class="x-titlebar"> 
        <div class="x-titlebar-left"> 
          <a component="$UI/system/components/justep/button/button" label=""
            class="btn btn-link btn-only-icon" icon="icon-android-location" onClick="mapBtnClick"
            xid="mapBtn"> 
            <i class="icon-android-location"/>  
            <span/> 
          </a> 
        </div>  
        <div class="x-titlebar-title">随手拍</div>  
        <div class="x-titlebar-right reverse"> 
          
          <div component="$UI/system/components/justep/attachment/attachmentSimple"
            actionUrl="/baas/justep/attachment/simpleFileStore" xid="attachmentSimple"
            bind-ref="data.ref(&quot;fileName&quot;)" class="o-uploadFile"> 
            <div class="x-attachment" xid="div6"> 
              <div class="x-attachment-content" xid="div9"> 
                <div class="x-attachment-cell" data-bind="visible:$state.get() == 'upload'"
                  xid="div15"> 
                  <div class="x-attachment-item x-item-upload" data-bind="visible:$state.get() == 'upload'"
                    xid="div16"/> 
                </div>  
                <div style="clear:both;" xid="div19"/> 
              </div> 
            </div> 
          </div> 
          
        </div> 
      </div> 
    </div>  
    <div class="x-panel-content  x-scroll-view" xid="content1"> 
      <div class="text-center panel-body" bind-visible="$model.paiData.count()==0"> 
        <h5 class="text-muted"><![CDATA[还没有图片，快来上传吧！]]></h5> 
      </div>
      <div bind-visible="$model.paiData.count()&gt;0">
        <div class="x-scroll" component="$UI/system/components/justep/scrollView/scrollView"
          xid="scrollView1" noMoreLoadLabel=" "> 
          <div class="x-content-center x-pull-down container" xid="div3"> 
            <i class="x-pull-down-img glyphicon x-icon-pull-down" xid="i1"/>  
            <span class="x-pull-down-label" xid="span1">下拉刷新...</span> 
          </div>  
          <div class="x-scroll-content" xid="div4"> 
            <div component="$UI/system/components/justep/list/list" class="x-list o-imgList"
              xid="list1" data="paiData" bind-visible="$model.paiData.count()&gt;0" bind-click="imageClick"> 
              <ul class="x-list-template" xid="listTemplateUl1"> 
                <li xid="li1" class="col-xs-4 text-center"> 
                  <img src="" alt="" xid="image" class="o-img" bind-attr-src="val(&quot;fPreviewPath&quot;)"/> 
                </li> 
              </ul> 
            </div>  
            <div class="clearfix"/>
          </div>  
          <div class="x-content-center x-pull-up" xid="div5"> 
            <span class="x-pull-up-label" xid="span2">加载更多...</span> 
          </div> 
        </div>
      </div>
    </div> 
  </div> 
</div>
