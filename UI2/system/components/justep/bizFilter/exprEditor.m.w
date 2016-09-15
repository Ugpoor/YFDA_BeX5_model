<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window" component="$UI/system/components/justep/window/window">  
  <span component="$UI/system/components/justep/windowDialog/windowDialog" xid="selectValueDialog"
    style="left:64px;top:229px;" src="$UI/system/components/justep/bizFilter/selectValue.m.w"
    onReceive="selectValueDialogReceive"/>  
  <span component="$UI/system/components/justep/windowReceiver/windowReceiver"
    xid="receiver" style="left:57px;top:319px;" onReceive="receiverReceive"/>  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:83px;top:103px;"> 
    <div component="$UI/system/components/justep/data/data" xid="relationData"
      idColumn="col" confirmDelete="false" confirmRefresh="false" onCustomRefresh="relationDataCustomRefresh"> 
      <data xid="default11">[]</data>  
      <column label="列别名" name="col" type="String" xid="default6"/>  
      <column label="关系名" name="relation" type="String" xid="default15"/>  
      <column label="显示名" name="label" type="String" xid="default16"/>  
      <column label="类型" name="type" type="String" xid="default17"/>  
      <column label="类型显示" name="typeLabel" type="String" xid="default18"/>  
      <column label="selected" name="selected" type="Boolean" xid="default19"/>  
      <rule xid="rule1"> 
        <col name="selected" xid="ruleCol1"> 
          <calculate xid="calculate1"> 
            <expr xid="default3">js: $data.getCurrentRow() == $row</expr> 
          </calculate> 
        </col> 
      </rule> 
    </div>  
    <div component="$UI/system/components/justep/data/data" xid="operatorData"
      idColumn="operator" onValueChange="operatorDataValueChange" autoLoad="true"
      confirmDelete="false" confirmRefresh="false"> 
      <column label="operator" name="operator" type="String" xid="default1"/>  
      <column label="label" name="label" type="String" xid="default2"/>  
      <column label="checked" name="checked" type="Boolean" xid="default3"/>  
      <data xid="default8">[{"operator":"NOT","label":"不"},{"operator":"=","label":"等于"},{"operator":"&gt;","label":"大于"},{"operator":"&lt;","label":"小于"},{"operator":"LIKE","label":"包含"},{"operator":"IS NULL","label":"为空"}]</data> 
    </div>  
    <div component="$UI/system/components/justep/data/data" xid="tempData"
      autoNew="true" idColumn="id"> 
      <column label="id" name="id" type="String" xid="default4"/>  
      <column label="比较值" name="stringValue" type="String" xid="default5"/>  
      <column label="比较值" name="integerValue" type="Integer" xid="default7"/>  
      <column label="比较值" name="floatValue" type="Float" xid="default9"/>  
      <column label="比较值" name="dateValue" type="Date" xid="default10"/>  
      <column label="比较值" name="timeValue" type="Time" xid="default12"/>  
      <column label="比较值" name="datetimeValue" type="DateTime" xid="default13"/>  
      <column label="提示信息" name="message" type="String" xid="default14"/> 
    </div> 
  </div>  
  <div component="$UI/system/components/justep/panel/panel" class="x-panel x-full"
    xid="panel1"> 
    <div class="x-panel-top" xid="top1"> 
      <div component="$UI/system/components/justep/titleBar/titleBar" class="x-titlebar"
        xid="titleBar1" title="查询条件"> 
        <div class="x-titlebar-left" xid="div1"> 
          <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-only-icon"
            label="取消" xid="cancelBtn" onClick="{&quot;operation&quot;:&quot;receiver.windowCancel&quot;}"> 
            <i xid="i2"/>  
            <span xid="span2">取消</span> 
          </a> 
        </div>  
        <div class="x-titlebar-title" xid="div4">查询条件</div>  
        <div class="x-titlebar-right reverse" xid="div5"> 
          <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-only-icon"
            label="确定" xid="okBtn" onClick="okBtnClick" icon="icon-checkmark"> 
            <i xid="i1" class="icon-checkmark"/>  
            <span xid="span1">确定</span> 
          </a> 
        </div> 
      </div> 
    </div>  
    <div class="x-panel-content" xid="content1"> 
      <div component="$UI/system/components/justep/panel/panel" class="x-panel x-full"
        xid="panel2"> 
        <div class="x-panel-content" xid="content2"> 
          <div component="$UI/system/components/justep/panel/panel" class="x-panel x-full"
            xid="panel3"> 
            <div class="x-panel-content" xid="content3"> 
              <div component="$UI/system/components/justep/list/list" class="x-list"
                xid="relationList" limit="-1" data="relationData" style="margin: 5px;"
                autoLoad="false"> 
                <ul class="x-list-template" xid="listTemplateUl1"> 
                  <li xid="li1" bind-css="{'bg-info': $object.data.getCurrentRow() == $object}"
                    style="padding: 10px;"> 
                    <div xid="divRow"> 
                      <span bind-text="ref('typeLabel')" style="float: right; margin-top: 3px;"
                        xid="typeSpan">type</span>  
                      <span component="$UI/system/components/justep/button/radio"
                        class="x-radio" xid="radio1" bind-ref="ref('selected')"/>  
                      <span xid="labelSpan" bind-text="ref('label')" style="word-break: break-all;">label</span> 
                    </div> 
                  </li> 
                </ul> 
              </div> 
            </div>  
            <div class="x-panel-bottom" xid="bottom3"> 
              <div component="$UI/system/components/justep/list/list" class="x-list"
                xid="operatorsList" data="operatorData" style="margin: 0px 5px;"> 
                <div component="$UI/system/components/justep/button/buttonGroup"
                  class="btn-group btn-group-justified x-list-template" tabbed="false"
                  xid="buttonGroup2" style="width:100%;"> 
                  <a component="$UI/system/components/justep/button/button"
                    class="btn" label="button" xid="operatorBtn" data-bind="attr: {name: val('operator')}"
                    bind-css="{'x-yellow active': val('checked') &amp;&amp; !$model.operatorBtnIsDisabled($element), 'x-green': !val('checked') &amp;&amp; !$model.operatorBtnIsDisabled($element), 'x-gray': $model.operatorBtnIsDisabled($element)}"
                    bind-mousedown="operatorBtnMousedown" bind-disable="$model.operatorBtnIsDisabled($element)"> 
                    <i xid="i5"/>  
                    <span xid="span3" bind-text="val('label')">button</span> 
                  </a> 
                </div> 
              </div> 
            </div> 
          </div> 
        </div>  
        <div class="x-panel-bottom" xid="bottom2"> 
          <table style="width: 100%; margin: 5px;"> 
            <tr> 
              <td> 
                <input component="$UI/system/components/justep/input/input" class="form-control"
                  xid="stringInput" data-bind="valueUpdate: 'input'" bind-visible="!$model.relationData.val('type') || $model.relationData.val('type') == 'String'"
                  bind-disable="$model.valueIsDisabled()" bind-ref="tempData.ref('stringValue')"/>  
                <input component="$UI/system/components/justep/input/input" class="form-control"
                  xid="integerInput" data-bind="valueUpdate: 'input'" bind-visible="$model.relationData.val('type') == 'Integer'"
                  bind-disable="$model.valueIsDisabled()" bind-ref="tempData.ref('integerValue')"
                  dataType="Integer"/>  
                <input component="$UI/system/components/justep/input/input" class="form-control"
                  xid="floatInput" data-bind="valueUpdate: 'input'" bind-visible="$model.relationData.val('type') == 'Float'"
                  bind-disable="$model.valueIsDisabled()" bind-ref="tempData.ref('floatValue')"
                  dataType="Float"/>  
                <input component="$UI/system/components/justep/input/input" class="form-control"
                  xid="dateInput" data-bind="valueUpdate: 'input'" bind-visible="$model.relationData.val('type') == 'Date'"
                  bind-disable="$model.valueIsDisabled()" bind-ref="tempData.ref('dateValue')"
                  format="yyyy年MM月dd日"/>  
                <input component="$UI/system/components/justep/input/input" class="form-control"
                  xid="timeInput" data-bind="valueUpdate: 'input'" bind-visible="$model.relationData.val('type') == 'Time'"
                  bind-disable="$model.valueIsDisabled()" bind-ref="tempData.ref('timeValue')"
                  format="hh时mm分ss秒"/>  
                <input component="$UI/system/components/justep/input/input" class="form-control"
                  xid="datetimeInput" data-bind="valueUpdate: 'input'" bind-visible="$model.relationData.val('type') == 'DateTime'"
                  bind-disable="$model.valueIsDisabled()" bind-ref="tempData.ref('datetimeValue')"
                  format="yyyy年MM月dd日 hh时mm分ss秒"/> 
              </td>  
              <td style="width: 80px"> 
                <a component="$UI/system/components/justep/button/button"
                  class="btn btn-default btn-icon-left" label="选择" xid="selectValueBtn"
                  icon="icon-ios7-more" onClick="selectValueBtnClick" bind-disable="$model.valueIsDisabled()"> 
                  <i xid="i3" class="icon-ios7-more"/>  
                  <span xid="span4">选择</span> 
                </a> 
              </td> 
            </tr> 
          </table> 
        </div> 
      </div> 
    </div>  
    </div> 
</div>
