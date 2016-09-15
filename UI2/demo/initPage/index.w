<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window oa" component="$UI/system/components/justep/window/window"
  design="device:m;">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:136px;top:1px;"
    onLoad="modelLoad"> 
    <div component="$UI/system/components/justep/data/data" xid="fileData"
      idColumn="filePath" autoNew="false"> 
      <column label="col0" name="filePath" type="String" xid="default1"/>  
      <column label="col1" name="fileName" type="String" xid="default2"/>  
      <column label="col2" name="createTime" type="String" xid="default3"/> 
    </div> 
  </div>  
  <div component="$UI/system/components/justep/contents/contents" class="x-contents x-full"
    active="0" xid="contents1"> 
    <div class="x-contents-content" xid="main"> 
      <div component="$UI/system/components/justep/panel/panel" class="x-panel x-full"
        xid="panel1"> 
        <div class="x-panel-top" xid="top1"> 
          <div component="$UI/system/components/justep/titleBar/titleBar" class="x-titlebar"
            xid="titleBar1" title="设置初始页"> 
            <div class="x-titlebar-left" xid="div1"> 
              <a component="$UI/system/components/justep/button/button" class="btn btn-link"
                label="" xid="backBtn" icon="icon-chevron-left" onClick="backBtnClick"
                target="content1"> 
                <i xid="i2" class="icon-chevron-left"/>  
                <span xid="span1"/> 
              </a> 
            </div>  
            <div class="x-titlebar-title" xid="div2">设置初始页</div>  
            <div class="x-titlebar-right reverse" xid="div3"/> 
          </div> 
        </div>  
        <div class="x-panel-content" xid="content3"> 
          <div component="$UI/system/components/justep/contents/contents" class="x-contents x-full"
            active="0" xid="maincontents"> 
            <div class="x-contents-content" xid="content1"> 
              <div component="$UI/system/components/justep/controlGroup/controlGroup"
                class="x-control-group conn1" title="手动输入初始页" xid="controlGroup1" collapsible="true"
                collapsed="true" num="1"> 
                <div class="x-control-group-title  " xid="controlGroupTitle1"
                  bind-click="showTitle" style="text-align:justify;"> 
                  <span xid="span5">手动输入初始页</span> 
                </div>  
                <div component="$UI/system/components/justep/row/row" class="x-row"
                  xid="row5"> 
                  <div class="x-col" xid="col13"> 
                    <input component="$UI/system/components/justep/input/input"
                      class="form-control" xid="nameInput" style="font-size:16px;" placeHolder="请输入正确的域名"/> 
                  </div>  
                  <div class="x-col x-col-fixed" xid="col7" style="width:auto;"> 
                    <a component="$UI/system/components/justep/button/button"
                      class="btn btn-link btn-only-icon" label="button" icon="icon-checkmark-circled"
                      style="color:#808000;display:none;font-size:25px;" xid="inputBtn"> 
                      <i xid="i9" class="icon-checkmark-circled"/>  
                      <span xid="span12"/> 
                    </a> 
                  </div> 
                </div>  
                <div component="$UI/system/components/justep/row/row" class="x-row"
                  xid="row6"> 
                  <div class="x-col" xid="col17"> 
                    <a component="$UI/system/components/justep/button/button"
                      class="btn btn-default center-block" label="确认" xid="submitBtn"
                      style="border-radius:10px;width:50%;" onClick="submitBtnClick"> 
                      <i xid="i6"/>  
                      <span xid="span7">确认</span> 
                    </a> 
                  </div>  
                  <div class="x-col" xid="col16"> 
                    <a component="$UI/system/components/justep/button/button"
                      class="btn btn-default center-block" label="取消" xid="delBtn"
                      style="border-radius:10px;width:50%;" onClick="delBtnClick"> 
                      <i xid="i3"/>  
                      <span xid="span8">取消</span> 
                    </a> 
                  </div> 
                </div> 
              </div>  
              <div component="$UI/system/components/justep/controlGroup/controlGroup"
                class="x-control-group" title="二维码扫描设定" xid="controlGroup2" collapsible="true"
                collapsed="true" num="2"> 
                <div class="x-control-group-title" xid="controlGroupTitle2"
                  bind-click="showTitle"> 
                  <span xid="span2">二维码扫描设定</span> 
                </div>  
                <div xid="div5"> 
                  <a component="$UI/system/components/justep/button/button"
                    class="btn btn-default device-button-white" label="扫一扫" xid="scanBtn"
                    onClick="scanBtnClick" disabled="true" style="width:100%;"> 
                    <i xid="i1"/>  
                    <span xid="span3">扫一扫</span> 
                  </a>  
                  <div xid="div4" style="display:none;" bind-visible=" $model.fileData.val(&quot;filePath&quot;)"> 
                    <div component="$UI/system/components/justep/row/row" class="x-row"
                      xid="row1"> 
                      <div class="x-col" xid="col2"> 
                        <input component="$UI/system/components/justep/input/input"
                          class="form-control" xid="scanInput" readonly="true" style="font-size:16px;"
                          bind-ref="fileData.ref('filePath')"/> 
                      </div>  
                      <div class="x-col x-col-fixed" xid="col1" style="width:auto;"> 
                        <a component="$UI/system/components/justep/button/button"
                          class="btn btn-link btn-only-icon" label="button" icon="icon-checkmark-circled"
                          style="color:#808000;display:none;font-size:25px;" xid="scanBut"> 
                          <i xid="i4" class="icon-checkmark-circled"/>  
                          <span xid="span4"/> 
                        </a> 
                      </div> 
                    </div>  
                    <div component="$UI/system/components/justep/row/row" class="x-row"
                      xid="row2"> 
                      <div class="x-col" xid="col3"> 
                        <a component="$UI/system/components/justep/button/button"
                          class="btn btn-default center-block" label="确认" xid="subBtn"
                          style="border-radius:10px;width:50%;" onClick="subBtnClick"> 
                          <i xid="i5"/>  
                          <span xid="span9">确认</span> 
                        </a> 
                      </div>  
                      <div class="x-col" xid="col4"> 
                        <a component="$UI/system/components/justep/button/button"
                          class="btn btn-default center-block" label="取消" xid="deleteBtn"
                          style="border-radius:10px;width:50%;" onClick="deleteBtnClick"> 
                          <i xid="i7"/>  
                          <span xid="span6">取消</span> 
                        </a> 
                      </div> 
                    </div> 
                  </div> 
                </div> 
              </div>  
              <div component="$UI/system/components/justep/controlGroup/controlGroup"
                class="x-control-group" title="APP内置初始页" xid="controlGroup3" collapsible="true"
                collapsed="true" num="3"> 
                <div class="x-control-group-title" xid="controlGroupTitle3"
                  bind-click="showTitle"> 
                  <span xid="span5">APP内置初始页</span> 
                </div>  
                <div component="$UI/system/components/justep/row/row" class="x-row"
                  xid="row8"> 
                  <div class="x-col" xid="col14"> 
                    <a component="$UI/system/components/justep/button/button"
                      class="btn btn-default" label="WeX5官网" xid="webBtn" url="http://www.justep.com"
                      onClick="scanButton"> 
                      <i xid="i13"/>  
                      <span xid="span15">WeX5官网</span> 
                    </a> 
                  </div>  
                  <div class="x-col" xid="col15"> 
                    <a component="$UI/system/components/justep/button/button"
                      class="btn btn-default" label="WeX5论坛" xid="button7" url="http://sdfasdf.sdfds"
                      onClick="scanButton"> 
                      <i xid="i14"/>  
                      <span xid="span16">WeX5论坛</span> 
                    </a> 
                  </div>  
                  <div class="x-col" xid="col18"> 
                    <a component="$UI/system/components/justep/button/button"
                      class="btn btn-link btn-only-icon" label="button" icon="icon-checkmark-circled"
                      style="color:#808000;font-size:25px;display:none;" xid="pageBut"> 
                      <i xid="i16" class="icon-checkmark-circled"/>  
                      <span xid="span18"/> 
                    </a> 
                  </div> 
                </div> 
              </div> 
            </div>  
            <div class="x-contents-content" xid="tocontent"> 
              <iframe xid="iframe1" height="100%" width="100%"/> 
            </div> 
          </div> 
        </div> 
      </div> 
    </div> 
  </div> 
</div>
