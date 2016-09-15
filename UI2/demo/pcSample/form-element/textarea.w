<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window" component="$UI/system/components/justep/window/window"
  design="device:pc">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="top:271px;left:255px;height:auto;"> 
    <div component="$UI/system/components/justep/data/data" autoLoad="true"
      xid="textareaData" idColumn="name"> 
      <column label="备注" name="name" type="String" xid="xid1"/>  
      <data xid="default1">[{"name":"这是初始值"}]</data>  
      <column label="字数" name="num" type="String" xid="xid2"/> 
    </div> 
  </div>  
  <div component="$UI/system/components/justep/contents/contents" class="x-contents x-full"
    active="0" xid="contents"> 
    <div class="x-contents-content" xid="content1"> 
      <h4 xid="h42"><![CDATA[文本域  
    ]]>
  <a component="$UI/system/components/justep/button/button" class="btn btn-link" label="js" xid="jsBtn" onClick="jsBtnClick">
   <i xid="i4"></i>
   <span xid="span13">js</span></a><a component="$UI/system/components/justep/button/button" class="btn btn-link" label="源码" xid="sourceBtn" onClick="sourceClick">
   <i xid="i5"></i>
   <span xid="span14">源码</span></a>
  </h4><div component="$UI/system/components/justep/controlGroup/controlGroup"
        class="x-control-group" title="1.基本文本域" xid="controlGroup1" collapsible="true"> 
        <div class="x-control-group-title" xid="controlGroupTitle1"> 
          <span xid="span5"/> 
        </div>  
        <div class="form-horizontal container-fluid" component="$UI/system/components/bootstrap/form/form(bootstrap)"
          xid="form1"> 
          <div class="form-group" xid="formGroup1" style="width:auto;"> 
            <div class="col-sm-1" xid="col1" style="width:auto;"> 
              <div component="$UI/system/components/justep/labelEdit/labelEdit"
                class="x-label-edit x-label5" xid="labelTextarea1" style="width:222px;"> 
                <label class="x-label" xid="label1" bind-text="textareaData.label('name')"
                  style="height:32px;width:79px;"/>  
                <textarea component="$UI/system/components/justep/textarea/textarea"
                  class="form-control x-edit" xid="textarea1" style="height:65px;width:77px;"/> 
              </div> 
            </div> 
          </div> 
        </div> 
      </div>  
      <div component="$UI/system/components/justep/controlGroup/controlGroup"
        class="x-control-group" title="2.设置初始值" xid="controlGroup2" collapsible="true"> 
        <div class="x-control-group-title" xid="controlGroupTitle2"> 
          <span xid="span1"/> 
        </div>  
        <div class="form-horizontal container-fluid" component="$UI/system/components/bootstrap/form/form(bootstrap)"
          xid="div1"> 
          <div class="form-group" xid="formGroup2" style="width:auto;"> 
            <div class="col-sm-1" xid="col2" style="width:auto;"> 
              <div component="$UI/system/components/justep/labelEdit/labelEdit"
                class="x-label-edit x-label5" xid="labelTextarea2" style="width:222px;"> 
                <label class="x-label" xid="label2" bind-text="textareaData.label('name')"
                  style="height:32px;width:79px;"/>  
                <textarea component="$UI/system/components/justep/textarea/textarea"
                  class="form-control x-edit" xid="textarea2" style="height:65px;width:77px;"
                  bind-ref="textareaData.ref('name')"/> 
              </div> 
            </div> 
          </div> 
        </div> 
      </div>  
      <div component="$UI/system/components/justep/controlGroup/controlGroup"
        class="x-control-group" title="3.自定义尺寸" xid="controlGroup3" collapsible="true"> 
        <div class="x-control-group-title" xid="controlGroupTitle3"> 
          <span xid="span2"/> 
        </div>  
        <div class="form-horizontal container-fluid" component="$UI/system/components/bootstrap/form/form(bootstrap)"
          xid="div2"> 
          <div class="form-group" xid="formGroup3" style="width:auto;"> 
            <div class="col-sm-1" xid="col3" style="width:auto;"> 
              <div component="$UI/system/components/justep/labelEdit/labelEdit"
                class="x-label-edit x-label5" xid="labelTextarea3" style="width:222px;"> 
                <label class="x-label" xid="label3" bind-text="textareaData.label('name')"
                  style="height:32px;width:79px;"/>  
                <textarea component="$UI/system/components/justep/textarea/textarea"
                  class="form-control x-edit" xid="textarea3" style="height:100px;width:150px;"/> 
              </div> 
            </div> 
          </div> 
        </div> 
      </div>  
      <div component="$UI/system/components/justep/controlGroup/controlGroup"
        class="x-control-group" title="4.显示水印" xid="controlGroup4" collapsible="true"> 
        <div class="x-control-group-title" xid="controlGroupTitle4"> 
          <span xid="span3"/> 
        </div>  
        <div class="form-horizontal container-fluid" component="$UI/system/components/bootstrap/form/form(bootstrap)"
          xid="div3"> 
          <div class="form-group" xid="formGroup4" style="width:auto;"> 
            <div class="col-sm-1" xid="col4" style="width:auto;"> 
              <div component="$UI/system/components/justep/labelEdit/labelEdit"
                class="x-label-edit x-label5" xid="labelTextarea4" style="width:222px;"> 
                <label class="x-label" xid="label4" bind-text="textareaData.label('name')"
                  style="height:32px;width:79px;"/>  
                <textarea component="$UI/system/components/justep/textarea/textarea"
                  class="form-control x-edit" xid="textarea4" style="height:65px;width:77px;"
                  placeHolder="请填写备注信息"/> 
              </div> 
            </div> 
          </div> 
        </div> 
      </div>  
      <div component="$UI/system/components/justep/controlGroup/controlGroup"
        class="x-control-group" title="5.限制输入字数" xid="controlGroup5" collapsible="true"> 
        <div class="x-control-group-title" xid="controlGroupTitle5"> 
          <span xid="span4"/> 
        </div>  
        <div class="form-horizontal container-fluid" component="$UI/system/components/bootstrap/form/form(bootstrap)"
          xid="div4"> 
          <div class="form-group" xid="formGroup5" style="width:auto;"> 
            <div class="col-sm-1" xid="col5" style="width:auto;"> 
              <div component="$UI/system/components/justep/labelEdit/labelEdit"
                class="x-label-edit x-label5" xid="labelTextareaNum" style="width:222px;"> 
                <label class="x-label" xid="label5" bind-text="textareaData.label('name')"
                  style="height:32px;width:79px;"/>  
                <textarea component="$UI/system/components/justep/textarea/textarea"
                  class="form-control x-edit" xid="textareaNUm" style="height:65px;width:77px;"
                  maxLength="150" bind-keydown="textareaNUmKeydown"/> 
              </div>  
              <div component="$UI/system/components/justep/output/output" class="x-output"
                xid="output1" bind-ref="textareaData.ref('num')"/> 
            </div> 
          </div> 
        </div> 
      </div>  
      <div component="$UI/system/components/justep/controlGroup/controlGroup"
        class="x-control-group" title="6.高度可变" xid="controlGroup6" collapsible="true"> 
        <div class="x-control-group-title" xid="controlGroupTitle6"> 
          <span xid="span6"/> 
        </div>  
        <div class="form-horizontal container-fluid" component="$UI/system/components/bootstrap/form/form(bootstrap)"
          xid="div5"> 
          <div class="form-group" xid="formGroup6" style="width:auto;"> 
            <div class="col-sm-1" xid="col6" style="width:auto;"> 
              <div component="$UI/system/components/justep/labelEdit/labelEdit"
                class="x-label-edit x-label5" xid="labelTextarea6" style="width:222px;"> 
                <label class="x-label" xid="label6" bind-text="textareaData.label('name')"
                  style="height:32px;width:79px;"/>  
                <textarea component="$UI/system/components/justep/textarea/textarea"
                  class="form-control x-edit" xid="textarea6" style="width:77px;resize:both;"/> 
              </div> 
            </div> 
          </div> 
        </div> 
      </div>  
      <div component="$UI/system/components/justep/controlGroup/controlGroup"
        class="x-control-group" title="7.自适应高度" xid="controlGroup7" collapsible="true"
        style="height:auto;"> 
        <div class="x-control-group-title" xid="controlGroupTitle7"> 
          <span xid="span7"/> 
        </div>  
        <div class="form-horizontal container-fluid" component="$UI/system/components/bootstrap/form/form(bootstrap)"
          xid="div6" style="height:auto;"> 
          <div class="form-group" xid="formGroup7" style="width:auto;"> 
            <div class="col-sm-1" xid="col7" style="width:auto;"> 
              <div component="$UI/system/components/justep/labelEdit/labelEdit"
                class="x-label-edit x-label5" xid="labelTextareaHeight" style="width:222px;"
                bind-keypress="labelTextareaHeightKeypress"> 
                <label class="x-label" xid="label7" bind-text="textareaData.label('name')"
                  style="height:32px;width:79px;"/>  
                <textarea component="$UI/system/components/justep/textarea/textarea"
                  class="form-control x-edit" xid="textareaHeight" style="width:77px;"/> 
              </div> 
            </div> 
          </div> 
        </div> 
      </div>  
      <div component="$UI/system/components/justep/controlGroup/controlGroup"
        class="x-control-group" title="8.点击生成文本框" xid="controlGroup8" collapsible="true"> 
        <div class="x-control-group-title" xid="controlGroupTitle8"> 
          <span xid="span8"/> 
        </div>  
        <div class="form-horizontal container-fluid" component="$UI/system/components/bootstrap/form/form(bootstrap)"
          xid="div7"> 
          <div class="form-group" xid="formGroup8" style="width:auto;"> 
            <div class="col-sm-1" xid="col8" style="width:auto;"> 
              <a component="$UI/system/components/justep/button/button" class="btn btn-link"
                label="点击生成文本框" xid="addBtn" onClick="addBtnClick"> 
                <i xid="i1"/>  
                <span xid="span9">点击生成文本框</span> 
              </a> 
            </div> 
          </div> 
        </div> 
      </div>  
      <div component="$UI/system/components/justep/controlGroup/controlGroup"
        class="x-control-group" title="9.启用 禁用" xid="controlGroup9" collapsible="true"> 
        <div class="x-control-group-title" xid="controlGroupTitle9"> 
          <span xid="span10"/> 
        </div>  
        <div class="form-horizontal container-fluid" component="$UI/system/components/bootstrap/form/form(bootstrap)"
          xid="div8"> 
          <div class="form-group" xid="formGroup9" style="width:auto;"> 
            <div class="col-sm-1" xid="col9" style="width:auto;"> 
              <div component="$UI/system/components/justep/labelEdit/labelEdit"
                class="x-label-edit x-label5" xid="labelTextarea9" style="width:222px;"> 
                <label class="x-label" xid="label9" bind-text="textareaData.label('name')"
                  style="height:32px;width:79px;"/>  
                <textarea component="$UI/system/components/justep/textarea/textarea"
                  class="form-control x-edit" xid="textareaEnable" style="width:77px;height:auto;"/> 
              </div>  
              <a component="$UI/system/components/justep/button/button" class="btn btn-default"
                label="启用" xid="enable" onClick="enableClick"> 
                <i xid="i2"/>  
                <span xid="span11">启用</span> 
              </a>  
              <a component="$UI/system/components/justep/button/button" class="btn btn-default"
                label="禁用" xid="disabled" onClick="disabledClick"> 
                <i xid="i3"/>  
                <span xid="span12">禁用</span> 
              </a> 
            </div> 
          </div> 
        </div> 
      </div>  
      <div component="$UI/system/components/justep/controlGroup/controlGroup"
        class="x-control-group" title="10.原始文本框" xid="controlGroup10" collapsible="true"> 
        <div class="x-control-group-title" xid="controlGroupTitle10"> 
          <span xid="span15"/> 
        </div>  
        <div class="form-horizontal container-fluid" component="$UI/system/components/bootstrap/form/form(bootstrap)"
          xid="div9"> 
          <div class="form-group" xid="formGroup10" style="width:auto;"> 
            <div class="col-sm-1" xid="col10" style="width:auto;"> 
              <div component="$UI/system/components/justep/labelEdit/labelEdit"
                class="x-label-edit x-label5" xid="labelTextarea10" style="width:222px;"> 
                <label class="x-label" xid="label10" bind-text="textareaData.label('name')"
                  style="height:32px;width:79px;"/>  
                <textarea component="$UI/system/components/justep/textarea/textarea"
                  class="form-control x-edit" xid="textarea10" style="width:77px;height:auto;"/> 
              </div> 
            </div> 
          </div> 
        </div> 
      </div> 
    </div> 
  </div> 
</div>
