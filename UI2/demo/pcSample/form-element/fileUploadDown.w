<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window" component="$UI/system/components/justep/window/window"
  design="device:pc">  
  <div component="$UI/system/components/justep/model/model" xid="model" onLoad="modelLoad"
    style="height:auto;left:162px;top:239px;"> 
    <div component="$UI/system/components/justep/data/data" autoLoad="true"
      xid="fileData" idColumn="fID"> 
      <column label="ID" name="fID" type="String" xid="xid2"/>  
      <column label="上传文件" name="fAttchment" type="String" xid="xid1"/>  
      <column label="不能下载" name="funUpload" type="String" xid="xid4"/>  
      <column label="上传文件类型" name="fFileType" type="String" xid="xid5"/>  
      <column label="上传文件大小" name="fFileSize" type="String" xid="xid6"/>  
      <column label="上传文件个数" name="fFileNum" type="String" xid="xid7"/>  
      <data xid="default1">[{"fID":"0"}]</data> 
    </div> 
  </div>  
  <div component="$UI/system/components/justep/contents/contents" class="x-contents x-full"
    active="0" xid="contents"> 
    <div class="x-contents-content" xid="content1"> 
      <h4 xid="h41"><![CDATA[文件上传下载 
    ]]>
  <a component="$UI/system/components/justep/button/button" class="btn btn-link " label="js" xid="jsBtn" onClick="jsBtnClick">
   <i xid="i1"></i>
   <span xid="span6">js</span></a><a component="$UI/system/components/justep/button/button" class="btn btn-link" label="源码" xid="sourceBtn" bind-visible="isVisible" onClick="sourceClick">
   <i xid="i2"></i>
   <span xid="span7">源码</span></a>
  </h4><div component="$UI/system/components/justep/controlGroup/controlGroup"
        class="x-control-group" title="1.文件上传下载" xid="controlGroup1"> 
        <div class="x-control-group-title" xid="controlGroupTitle1"> 
          <span xid="span1">title</span> 
        </div>  
        <div component="$UI/system/components/bootstrap/row/row" class="row"
          xid="row1"> 
          <div class="col col-xs-12 col-sm-12 col-md-12 col-lg-12" xid="col1"
            style="height:auto;"> 
            <div component="$UI/system/components/justep/attachment/attachmentSimple"
              xid="attachmentSimple2" bind-ref="fileData.ref('fAttchment')"> 
              <div class="x-attachment" xid="div12"> 
                <div class="x-attachment-content x-card-border" xid="div13"> 
                  <div class="x-doc-process" xid="div14"> 
                    <div class="progress-bar x-doc-process-bar" role="progressbar"
                      style="width:0%;" xid="progressBar2"/> 
                  </div>  
                  <div data-bind="foreach:$attachmentItems" xid="div15"> 
                    <div class="x-attachment-cell" xid="div16"> 
                      <div class="x-attachment-item x-item-other" data-bind="click:$model.previewOrRemoveItem.bind($model),style:{backgroundImage:($model.previewPicture.bind($model,$object))()}"
                        xid="div17"> 
                        <a data-bind="visible:$model.$state.get() == 'remove'"
                          class="x-remove-barget" xid="a2"/> 
                      </div> 
                    </div> 
                  </div>  
                  <div class="x-attachment-cell" data-bind="visible:$state.get() == 'upload'"
                    xid="div18"> 
                    <div class="x-attachment-item x-item-upload" data-bind="visible:$state.get() == 'upload'"
                      xid="div19"/> 
                  </div>  
                  <div class="x-attachment-cell" data-bind="visible:$state.get() == 'upload' &amp;&amp; $attachmentItems.get().length &gt; 0"
                    xid="div20"> 
                    <div class="x-attachment-item x-item-remove" data-bind="click:changeState.bind($object,'remove')"
                      xid="div21"/> 
                  </div>  
                  <div style="clear:both;" xid="div22"/> 
                </div> 
              </div> 
            </div> 
          </div> 
        </div> 
      </div>  
      <div component="$UI/system/components/justep/controlGroup/controlGroup"
        class="x-control-group" title="2.控制不能下载(点击上传后不能下载)" xid="controlGroup2"> 
        <div class="x-control-group-title" xid="controlGroupTitle2"> 
          <span xid="span2">title</span> 
        </div>  
        <div component="$UI/system/components/bootstrap/row/row" class="row"
          xid="row2"> 
          <div class="col col-xs-12 col-sm-12 col-md-12 col-lg-12" xid="col4"
            style="height:auto;"> 
            <div component="$UI/system/components/justep/attachment/attachmentSimple"
              xid="attachmentSimple3" bind-ref="fileData.ref('funUpload')"> 
              <div class="x-attachment" xid="div25"> 
                <div class="x-attachment-content x-card-border" xid="div24"> 
                  <div class="x-doc-process" xid="div29"> 
                    <div class="progress-bar x-doc-process-bar" role="progressbar"
                      style="width:0%;" xid="progressBar3"/> 
                  </div>  
                  <div data-bind="foreach:$attachmentItems" xid="div28"> 
                    <div class="x-attachment-cell" xid="div27"> 
                      <div class="x-attachment-item x-item-other" xid="div26"
                        data-bind="style:{backgroundImage:($model.previewPicture.bind($model,$object))()}"> 
                        <a data-bind="visible:$model.$state.get() == 'remove'"
                          class="x-remove-barget" xid="a3"/> 
                      </div> 
                    </div> 
                  </div>  
                  <div class="x-attachment-cell" data-bind="visible:$state.get() == 'upload'"
                    xid="div31"> 
                    <div class="x-attachment-item x-item-upload" data-bind="visible:$state.get() == 'upload'"
                      xid="div30"/> 
                  </div>  
                  <div class="x-attachment-cell" data-bind="visible:$state.get() == 'upload' &amp;&amp; $attachmentItems.get().length &gt; 0"
                    xid="div23"> 
                    <div class="x-attachment-item x-item-remove" data-bind="click:changeState.bind($object,'remove')"
                      xid="div32"/> 
                  </div>  
                  <div style="clear:both;" xid="div33"/> 
                </div> 
              </div> 
            </div> 
          </div> 
        </div> 
      </div>  
      <div component="$UI/system/components/justep/controlGroup/controlGroup"
        class="x-control-group" title="3.控制上传文件类型(只允许上传.txt文件)" xid="controlGroup3"> 
        <div class="x-control-group-title" xid="controlGroupTitle3"> 
          <span xid="span3">title</span> 
        </div>  
        <div component="$UI/system/components/bootstrap/row/row" class="row"
          xid="row3"> 
          <div class="col col-xs-12 col-sm-12 col-md-12 col-lg-12" xid="col5"
            style="height:auto;"> 
            <div component="$UI/system/components/justep/attachment/attachmentSimple"
              xid="attachmentSimple" bind-ref="fileData.ref('fFileType')"> 
              <div class="x-attachment" xid="div36"> 
                <div class="x-attachment-content x-card-border" xid="div35"> 
                  <div class="x-doc-process" xid="div40"> 
                    <div class="progress-bar x-doc-process-bar" role="progressbar"
                      style="width:0%;" xid="progressBar4"/> 
                  </div>  
                  <div data-bind="foreach:$attachmentItems" xid="div39"> 
                    <div class="x-attachment-cell" xid="div38"> 
                      <div class="x-attachment-item x-item-other" data-bind="click:$model.previewOrRemoveItem.bind($model),style:{backgroundImage:($model.previewPicture.bind($model,$object))()}"
                        xid="div37"> 
                        <a data-bind="visible:$model.$state.get() == 'remove'"
                          class="x-remove-barget" xid="a4"/> 
                      </div> 
                    </div> 
                  </div>  
                  <div class="x-attachment-cell" data-bind="visible:$state.get() == 'upload'"
                    xid="div42"> 
                    <div class="x-attachment-item x-item-upload" data-bind="visible:$state.get() == 'upload'"
                      xid="div41"/> 
                  </div>  
                  <div class="x-attachment-cell" data-bind="visible:$state.get() == 'upload' &amp;&amp; $attachmentItems.get().length &gt; 0"
                    xid="div34"> 
                    <div class="x-attachment-item x-item-remove" data-bind="click:changeState.bind($object,'remove')"
                      xid="div43"/> 
                  </div>  
                  <div style="clear:both;" xid="div44"/> 
                </div> 
              </div> 
            </div> 
          </div> 
        </div> 
      </div>  
      <div component="$UI/system/components/justep/controlGroup/controlGroup"
        class="x-control-group" title="4.控制文件上传大小(上传文件不能大于1kb)" xid="controlGroup4"> 
        <div class="x-control-group-title" xid="controlGroupTitle4"> 
          <span xid="span4">title</span> 
        </div>  
        <div component="$UI/system/components/bootstrap/row/row" class="row"
          xid="row4"> 
          <div class="col col-xs-12 col-sm-12 col-md-12 col-lg-12" xid="col6"
            style="height:auto;"> 
            <div component="$UI/system/components/justep/attachment/attachmentSimple"
              xid="attachmentSimpleSize" bind-ref="fileData.ref('fFileSize')"> 
              <div class="x-attachment" xid="div47"> 
                <div class="x-attachment-content x-card-border" xid="div46"> 
                  <div class="x-doc-process" xid="div51"> 
                    <div class="progress-bar x-doc-process-bar" role="progressbar"
                      style="width:0%;" xid="progressBar5"/> 
                  </div>  
                  <div data-bind="foreach:$attachmentItems" xid="div50"> 
                    <div class="x-attachment-cell" xid="div49"> 
                      <div class="x-attachment-item x-item-other" data-bind="click:$model.previewOrRemoveItem.bind($model),style:{backgroundImage:($model.previewPicture.bind($model,$object))()}"
                        xid="div48"> 
                        <a data-bind="visible:$model.$state.get() == 'remove'"
                          class="x-remove-barget" xid="a5"/> 
                      </div> 
                    </div> 
                  </div>  
                  <div class="x-attachment-cell" data-bind="visible:$state.get() == 'upload'"
                    xid="div53"> 
                    <div class="x-attachment-item x-item-upload" data-bind="visible:$state.get() == 'upload'"
                      xid="div52"/> 
                  </div>  
                  <div class="x-attachment-cell" data-bind="visible:$state.get() == 'upload' &amp;&amp; $attachmentItems.get().length &gt; 0"
                    xid="div45"> 
                    <div class="x-attachment-item x-item-remove" data-bind="click:changeState.bind($object,'remove')"
                      xid="div54"/> 
                  </div>  
                  <div style="clear:both;" xid="div55"/> 
                </div> 
              </div> 
            </div> 
          </div> 
        </div> 
      </div>  
      <div component="$UI/system/components/justep/controlGroup/controlGroup"
        class="x-control-group" title="5.控制上传文件个数(上传文件个数不能超过2个)" xid="controlGroup5"> 
        <div class="x-control-group-title" xid="controlGroupTitle5"> 
          <span xid="span5">title</span> 
        </div>  
        <div component="$UI/system/components/bootstrap/row/row" class="row"
          xid="row5"> 
          <div class="col col-xs-12 col-sm-12 col-md-12 col-lg-12" xid="col7"
            style="height:auto;"> 
            <div component="$UI/system/components/justep/attachment/attachmentSimple"
              xid="attachmentSimpleNum" bind-ref="fileData.ref('fFileNum')"> 
              <div class="x-attachment" xid="div64"> 
                <div class="x-attachment-content x-card-border" xid="div63"> 
                  <div class="x-doc-process" xid="div58"> 
                    <div class="progress-bar x-doc-process-bar" role="progressbar"
                      style="width:0%;" xid="progressBar6"/> 
                  </div>  
                  <div data-bind="foreach:$attachmentItems" xid="div59"> 
                    <div class="x-attachment-cell" xid="div66"> 
                      <div class="x-attachment-item x-item-other" data-bind="click:$model.previewOrRemoveItem.bind($model),style:{backgroundImage:($model.previewPicture.bind($model,$object))()}"
                        xid="div65"> 
                        <a data-bind="visible:$model.$state.get() == 'remove'"
                          class="x-remove-barget" xid="a6"/> 
                      </div> 
                    </div> 
                  </div>  
                  <div class="x-attachment-cell" data-bind="visible:$state.get() == 'upload'"
                    xid="div56"> 
                    <div class="x-attachment-item x-item-upload" data-bind="visible:$state.get() == 'upload'"
                      xid="div57"/> 
                  </div>  
                  <div class="x-attachment-cell" data-bind="visible:$state.get() == 'upload' &amp;&amp; $attachmentItems.get().length &gt; 0"
                    xid="div61"> 
                    <div class="x-attachment-item x-item-remove" data-bind="click:changeState.bind($object,'remove')"
                      xid="div60"/> 
                  </div>  
                  <div style="clear:both;" xid="div62"/> 
                </div> 
              </div> 
            </div> 
          </div> 
        </div> 
      </div> 
    </div> 
  </div> 
</div>
