<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window demo-simpleData" component="$UI/system/components/justep/window/window"
  design="device:m;">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:358px;top:444px;"
    onLoad="modelLoad"> 
    <div component="$UI/system/components/justep/data/data" autoLoad="false"
      xid="testData" idColumn="fString" onCustomRefresh="testDataCustomRefresh" onCustomSave="testDataCustomSave"
      limit="5"> 
      <column label="字符型" name="fString" type="String" xid="default1"/>  
      <column label="整型" name="fInteger" type="Integer" xid="xid1"/>  
      <column label="长整形" name="fLong" type="Long" xid="xid2"/>  
      <column label="浮点数" name="fFloat" type="Float" xid="xid3"/>  
      <column label="双精度" name="fDouble" type="Double" xid="xid4"/>  
      <column label="Decimal(18,4)" name="fDecimal" type="Decimal" xid="xid5"/>  
      <column label="布尔型" name="fBoolean" type="Boolean" xid="xid6"/>  
      <column label="日期型" name="fDate" type="Date" xid="xid7"/>  
      <column label="时间型" name="fTime" type="Time" xid="xid8"/>  
      <column label="日期时间型" name="fDateTime" type="DateTime" xid="xid9"/> 
    </div> 
  </div>  
  <div component="$UI/system/components/justep/panel/panel" class="x-panel x-full"
    xid="panel1"> 
    <div class="x-panel-top" xid="top1"> 
      <div component="$UI/system/components/justep/titleBar/titleBar" class="x-titlebar"
        xid="titleBar1" title="Sqlite数据存取"> 
        <div class="x-titlebar-left" xid="div1"> 
          <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-only-icon"
            label="button" xid="button5" onClick="{operation:'window.close'}"> 
            <i xid="i9"/>  
            <span xid="span9"/> 
          </a>  
          <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-only-icon"
            xid="button4" onClick="{operation:'testData.save'}"> 
            <i xid="i4"/>  
            <span xid="span4"/> 
          </a> 
        </div>  
        <div class="x-titlebar-title" xid="div2">Sqlite数据存取</div>  
        <div class="x-titlebar-right reverse" xid="div3"> 
          <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-only-icon"
            xid="button2" onClick="{operation:'testData.delete'}"> 
            <i xid="i2"/>  
            <span xid="span2"/> 
          </a>  
          <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-only-icon"
            xid="button1" onClick="{operation:'testData.new'}" target="detailContent"> 
            <i xid="i1"/>  
            <span xid="span1"/> 
          </a> 
        </div> 
      </div> 
    </div>  
    <div class="x-panel-content" xid="content1"> 
      <div component="$UI/system/components/justep/panel/panel" class="x-panel"
        xid="panel2" style="height:100%;width:100%;"> 
        <div class="x-panel-content" xid="content2" style="top: 48px;"> 
          <div component="$UI/system/components/justep/contents/contents" class="x-contents x-full"
            active="0" xid="contents1"> 
            <div class="x-contents-content active xui-hignlight-selected x-scroll-view"
              xid="listContent">
              <div class="x-scroll" component="$UI/system/components/justep/scrollView/scrollView"
                xid="scrollView1"> 
                <div class="x-content-center x-pull-down container" xid="div5"> 
                  <i class="x-pull-down-img glyphicon x-icon-pull-down" xid="i3"/>  
                  <span class="x-pull-down-label" xid="span3">下拉刷新...</span>
                </div>  
                <div class="x-scroll-content" xid="div6"> 
                  <div component="$UI/system/components/justep/list/list" class="x-list"
                    xid="testList" data="testData" autoLoad="false" limit="5"> 
                    <ul class="x-list-template" xid="listTemplateUl1"> 
                      <li xid="li1" bind-css="{'bg-info' : $object == $model.testData.getCurrentRow()}"
                        style="padding: 5px;"> 
                        <div component="$UI/system/components/justep/labelEdit/labelEdit"
                          class="x-label-edit x-label30" xid="labelOutput1"> 
                          <label class="x-label" xid="label1" style="width:120px;">主键（字符型）</label>  
                          <div component="$UI/system/components/justep/output/output"
                            class="x-output x-edit" xid="output1" bind-ref="ref('fString')"/>
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
            <div class="x-contents-content" xid="detailContent" style="padding: 10px;">
              <div component="$UI/system/components/justep/labelEdit/labelEdit"
                class="x-label-edit x-label30" xid="labelInput1"> 
                <label class="x-label" xid="label2" style="width:100px;"><![CDATA[字符型]]></label>  
                <input component="$UI/system/components/justep/input/input" class="form-control x-edit"
                  xid="input1" bind-ref="testData.ref('fString')"/>
              </div>  
              <div component="$UI/system/components/justep/labelEdit/labelEdit"
                class="x-label-edit x-label30" xid="labelInput4"> 
                <label class="x-label" xid="label5" style="width:100px;"><![CDATA[整型]]></label>  
                <input component="$UI/system/components/justep/input/input" class="form-control x-edit"
                  xid="input4" bind-ref="testData.ref('fInteger')"/>
              </div>  
              <div component="$UI/system/components/justep/labelEdit/labelEdit"
                class="x-label-edit x-label30" xid="labelInput5"> 
                <label class="x-label" xid="label6" style="width:100px;"><![CDATA[长整型]]></label>  
                <input component="$UI/system/components/justep/input/input" class="form-control x-edit"
                  xid="input5" bind-ref="testData.ref('fLong')"/>
              </div>  
              <div component="$UI/system/components/justep/labelEdit/labelEdit"
                class="x-label-edit x-label30" xid="labelInput6"> 
                <label class="x-label" xid="label7" style="width:100px;"><![CDATA[浮点型]]></label>  
                <input component="$UI/system/components/justep/input/input" class="form-control x-edit"
                  xid="input6" bind-ref="testData.ref('fFloat')"/>
              </div>  
              <div component="$UI/system/components/justep/labelEdit/labelEdit"
                class="x-label-edit x-label30" xid="labelInput7"> 
                <label class="x-label" xid="label8" style="width:100px;"><![CDATA[双精度]]></label>  
                <input component="$UI/system/components/justep/input/input" class="form-control x-edit"
                  xid="input7" bind-ref="testData.ref('fDouble')"/>
              </div>  
              <div component="$UI/system/components/justep/labelEdit/labelEdit"
                class="x-label-edit x-label30" xid="labelInput8"> 
                <label class="x-label" xid="label9" style="width:100px;"><![CDATA[DECIMAL]]></label>  
                <input component="$UI/system/components/justep/input/input" class="form-control x-edit"
                  xid="input8" bind-ref="testData.ref('fDecimal')"/>
              </div>  
              <div component="$UI/system/components/justep/labelEdit/labelEdit"
                class="x-label-edit x-label30" xid="labelToggle1"> 
                <label class="x-label" xid="label10" style="width:100px;"><![CDATA[布尔型]]></label>  
                <span component="$UI/system/components/justep/button/toggle"
                  class="x-toggle x-edit" xid="toggle1" bind-ref="testData.ref('fBoolean')" checkedValue="1"/>
              </div>  
              <div component="$UI/system/components/justep/labelEdit/labelEdit"
                class="x-label-edit x-label30" xid="labelInput9"> 
                <label class="x-label" xid="label11" style="width:100px;"><![CDATA[日期型]]></label>  
                <input component="$UI/system/components/justep/input/input" class="form-control x-edit"
                  xid="input9" bind-ref="testData.ref('fDate')"/>
              </div>  
              <div component="$UI/system/components/justep/labelEdit/labelEdit"
                class="x-label-edit x-label30" xid="labelInput10"> 
                <label class="x-label" xid="label12" style="width:100px;"><![CDATA[时间型]]></label>  
                <input component="$UI/system/components/justep/input/input" class="form-control x-edit"
                  xid="input10" bind-ref="testData.ref('fTime')"/>
              </div>  
              <div component="$UI/system/components/justep/labelEdit/labelEdit"
                class="x-label-edit x-label30" xid="labelInput11"> 
                <label class="x-label" xid="label13" style="width:100px;"><![CDATA[日期时间型]]></label>  
                <input component="$UI/system/components/justep/input/input" class="form-control x-edit"
                  xid="input11" bind-ref="testData.ref('fDateTime')"/>
              </div>
            </div>
          </div>
        </div>  
        <div class="x-panel-bottom" xid="bottom1">
          <div component="$UI/system/components/justep/button/buttonGroup"
            class="btn-group btn-group-justified" tabbed="true" xid="buttonGroup1"
            selected="btnList" style="height:100%;">
            <a component="$UI/system/components/justep/button/button" class="btn btn-default"
              label="列表" xid="btnList" target="listContent"> 
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
  </div> 
</div>
