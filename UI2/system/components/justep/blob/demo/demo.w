<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" component="$UI/system/components/justep/window/window">  
  <div component="$UI/system/components/justep/model/model" xid="model1" style="position:absolute;;left:514px;top:82px" onLoad="model1Load"> 
    <div component="$UI/system/components/justep/data/bizData" xid="orgData"
      concept="SA_OPPerson" limit="8" autoLoad="false"> 
      <reader xid="default4" action="/SA/OPM/logic/action/queryOPPersonAction"/> 
    </div> 
  </div>  
  <div component="$UI/system/components/justep/panel/panel" class="x-panel x-full"
    xid="panel1"> 
    <div class="x-panel-top" xid="top1"> 
      <div component="$UI/system/components/justep/titleBar/titleBar" class="x-titlebar"
        xid="titleBar1" title="BlobImage"> 
        <div class="x-titlebar-left" xid="div1"> 
          <a component="$UI/system/components/justep/button/button" class="btn btn-link"
            xid="button2" icon="icon-chevron-left" onClick="closeWin"> 
            <i xid="i2" class="icon-chevron-left"/>  
            <span xid="span2"/> 
          </a> 
        </div>  
        <div class="x-titlebar-title" xid="div2">BlobImage</div>  
        <div class="x-titlebar-right reverse" xid="div3"/> 
      </div> 
    </div>  
    <div class="x-panel-content x-flex x-flex-column" xid="content2" style="padding:6px 6px 6px 6px;"> 
      <h3>BlobImage
        <a component="$UI/system/components/justep/button/button" class="btn btn-link"
          label="源码" xid="button1" onClick="showBlobSource"> 
          <i xid="i1"/>  
          <span xid="span1">源码</span>
        </a>
      </h3>  
      <p>BlobImage组件可以显示编辑数据库中的Blob字段内容，点击图片出现操作按钮后可以进行图片清除或者修改</p>  
      <p>案例中limitSize=1M(限制上传文件不大于1M)，imageType=.gif,.jpg,.png,.bmp,.jpeg(控制上传文件类型)</p>  
      <div xid="list1" class="x-list x-inner-scroll x-flex1" component="$UI/system/components/justep/list/list"
        data="orgData"> 
        <div class="x-list-content"> 
          <ul class="x-list-template"> 
            <li> 
              <div align="center" style="float: left;margin: 6px;"> 
                <div class="x-blob" component="$UI/system/components/justep/blob/blobImage"
                  bind-ref="ref('sPhoto')" blobConcept="SA_OPPerson" blobRelation="sPhoto"
                  blobLastModifiedRelation="sPhotoLastModified" limitSize="1m" style="height:128px;width:128px;" xid="blobImageDemo"> 
                  <div class="x-blob-bar"> 
                    <i class="x-blob-edit icon-compose"/>  
                    <i class="x-blob-del icon-close-round"/> 
                  </div>  
                  <img class="x-blob-img x-autofill"/> 
                </div>  
                <span bind-text="ref('sName')"/> 
              </div> 
            </li> 
          </ul> 
        </div> 
      </div> 
    </div> 
  </div>  
  <span component="$UI/system/components/justep/windowDialog/windowDialog" xid="windowDialog"
    src="$UI/system/components/justep/common/demo/dialog.w" style="left:55px;top:15px;"/>
</div>
