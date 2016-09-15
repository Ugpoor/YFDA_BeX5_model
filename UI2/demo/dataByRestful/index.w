<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window demo-simpleData" component="$UI/system/components/justep/window/window"
  design="device:m;">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:305px;top:331px;"> 
    <div component="$UI/system/components/justep/data/data" autoLoad="true"
      xid="contactData" idColumn="id" limit="20" onCustomRefresh="contactDataCustomRefresh" onCustomDelete="contactDataCustomDelete" onCustomSave="contactDataCustomSave" onCustomNew="contactDataCustomNew"> 
      <column label="编号" name="id" type="String" xid="default1"/>  
      <column label="名称" name="name" type="String" xid="default2"/>  
    </div> 
  </div>  
  <div component="$UI/system/components/justep/panel/panel" class="x-panel x-full"
    xid="panel1"> 
    <div class="x-panel-top" xid="top1"> 
      <div component="$UI/system/components/justep/titleBar/titleBar" class="x-titlebar"
        xid="titleBar1" title="contacts"> 
        <div class="x-titlebar-left" xid="div1"> 
          <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-only-icon"
            label="button" xid="button5" onClick="{operation:'window.close'}"> 
            <i xid="i9"/>  
            <span xid="span9"/> 
          </a>  
          <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-only-icon"
            xid="button4" onClick="{operation:'contactData.save'}"> 
            <i xid="i4"/>  
            <span xid="span4"/> 
          </a> 
        </div>  
        <div class="x-titlebar-title" xid="div2">contacts</div>  
        <div class="x-titlebar-right reverse" xid="div3"> 
          <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-only-icon"
            xid="button2" onClick="{operation:'contactData.delete'}"> 
            <i xid="i2"/>  
            <span xid="span2"/> 
          </a>  
          <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-only-icon"
            xid="button1" onClick="{operation:'contactData.new'}" target="detailContent"> 
            <i xid="i1"/>  
            <span xid="span1"/> 
          </a> 
        </div> 
      </div> 
    </div>  
    <div class="x-panel-content" xid="content1"> 
      <div component="$UI/system/components/justep/contents/contents" class="x-contents x-full"
        active="0" xid="contents1"> 
        <div class="x-contents-content" xid="listContent"> 
          <div component="$UI/system/components/justep/panel/panel" class="x-panel"
            xid="panel2" style="height:100%;width:100%;"> 
            <div class="x-panel-content" xid="content2"> 
              <div class="x-scroll" component="$UI/system/components/justep/scrollView/scrollView"
                xid="scrollView1"> 
                <div class="x-content-center x-pull-down container" xid="div5"> 
                  <i class="x-pull-down-img glyphicon x-icon-pull-down" xid="i3"/>  
                  <span class="x-pull-down-label" xid="span3">下拉刷新...</span> 
                </div>  
                <div class="x-scroll-content" xid="div6"> 
                  <div component="$UI/system/components/justep/list/list" class="x-list"
                    xid="list1" data="contactData" autoLoad="true"> 
                    <ul class="x-list-template" xid="listTemplateUl1"> 
                      <li xid="li1" bind-css="{'bg-info' : $object == $model.contactData.getCurrentRow()}"> 
                        <div component="$UI/system/components/justep/row/row"
                          class="x-row" xid="row2"> 
                          <div class="x-col x-col-33" xid="col1"> 
                            <div component="$UI/system/components/justep/output/output" class="x-output text-info" xid="output2" bind-ref="ref('id')"></div></div>  
                          <div class="x-col" xid="col2"> 
                            <div component="$UI/system/components/justep/output/output"
                              class="x-output" xid="output1" bind-ref="ref('name')"/> 
                          </div> 
                        </div>  
                      </li> 
                    </ul> 
                  </div> 
                </div>  
                <div class="x-content-center x-pull-up" xid="div7"> 
                  <span class="x-pull-up-label" xid="span5">加载更多...</span> 
                </div> 
              </div> 
            </div> 
          </div> 
        </div>  
        <div class="x-contents-content" xid="detailContent"> 
          <div component="$UI/system/components/justep/row/row" class="x-row"
            xid="row8"> 
            <div class="x-col" xid="col26"> 
              <div component="$UI/system/components/justep/row/row" class="x-row"
                xid="row9"> 
                <div class="x-col" xid="col29"> 
                  <div component="$UI/system/components/justep/labelEdit/labelEdit"
                    class="x-label-edit x-label20" xid="labelInput1"> 
                    <label class="x-label" xid="label6"><![CDATA[id]]></label>  
                    <input component="$UI/system/components/justep/input/input"
                      class="form-control x-edit" xid="input1" readonly="true" bind-ref="contactData.ref('id')"/> 
                  </div> 
                </div> 
              </div>  
              <div component="$UI/system/components/justep/row/row" class="x-row"
                xid="row14"> 
                <div class="x-col" xid="col38"> 
                  <div component="$UI/system/components/justep/labelEdit/labelEdit"
                    class="x-label-edit x-label20" xid="labelInput3"> 
                    <label class="x-label" xid="label8"><![CDATA[name]]></label>  
                    <input component="$UI/system/components/justep/input/input"
                      class="form-control x-edit" xid="input4" bind-ref="contactData.ref('name')"/> 
                  </div> 
                </div> 
              </div>  
            </div> 
          </div> 
        </div> 
      </div> 
    </div>  
    <div class="x-panel-bottom" xid="bottom1"> 
      <div component="$UI/system/components/justep/button/buttonGroup" class="btn-group btn-group-justified"
        tabbed="true" xid="buttonGroup1" style="height:48px;" selected="listButton"> 
        <a component="$UI/system/components/justep/button/button" class="btn btn-default"
          label="列表" xid="listButton" target="listContent"> 
          <i xid="i5"/>  
          <span xid="span6">列表</span> 
        </a>  
        <a component="$UI/system/components/justep/button/button" class="btn btn-default"
          label="详细" xid="button7" target="detailContent"> 
          <i xid="i7"/>  
          <span xid="span7">详细</span> 
        </a> 
      </div> 
    </div> 
  </div> 
</div>
