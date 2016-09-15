<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window" component="$UI/system/components/justep/window/window"
  design="device:pc">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:118px;top:302px;"> 
    <div component="$UI/system/components/justep/data/data" autoLoad="true"
      xid="sexData" idColumn="sex"> 
      <column label="性别:" name="sex" type="String" xid="xid1"/>  
      <column label="性别:" name="example" type="String" xid="xid7"/>  
      <column label="性别:" name="ebable" type="String" xid="xid10"/>  
      <data xid="default1">[{"sex":"男","example":"男","ebable":"男"},{"sex":"女","example":"女","ebable":"女"}]</data>  
      <rule xid="rule1"> 
        <col name="sex" xid="ruleCol1"> 
          <readonly xid="readonly1"> 
            <expr xid="default3"/>
          </readonly> 
        </col>  
        <col name="ebable" xid="ruleCol2"> 
          <readonly xid="readonly2"> 
            <expr xid="default4">$model.defaultData.val("num")</expr>
          </readonly> 
        </col> 
      </rule>
    </div>  
    <div component="$UI/system/components/justep/data/data" autoLoad="true"
      xid="defaultData" idColumn="sex"> 
      <column label="性别:" name="sex" type="String" xid="xid2"/>  
      <column label="值" name="value" type="String" xid="xid6"/>  
      <column label="选中" name="checked" type="String" xid="xid8"/>  
      <column label="返回" name="num" type="Boolean" xid="xid9"/>  
      <data xid="default2">[{"sex":"男","value":""}]</data>
    </div>  
    <div component="$UI/system/components/justep/data/data" autoLoad="true"
      xid="dynamicData" idColumn="sex"> 
      <column label="性别:" name="sex" type="String" xid="xid5"/>  
      <data xid="default5">[{"sex":""}]</data> 
    </div> 
  </div>  
  <div component="$UI/system/components/justep/contents/contents" class="x-contents x-full"
    active="0" xid="contents"> 
    <div class="x-contents-content" xid="content1"> 
      <h4 xid="h42"><![CDATA[单选]]>
  <a component="$UI/system/components/justep/button/button" class="btn btn-link" label="js" xid="jsBtn" onClick="jsBtnClick">
   <i xid="i4"></i>
   <span xid="span8">js</span></a>
  <a component="$UI/system/components/justep/button/button" class="btn btn-link" label="源码" xid="sourceBtn" onClick="sourceClick">
   <i xid="i5"></i>
   <span xid="span9">源码</span></a></h4><div component="$UI/system/components/justep/controlGroup/controlGroup"
        class="x-control-group" title="1.点击选中" xid="controlGroup1" collapsible="true"> 
        <div class="x-control-group-title" xid="controlGroupTitle1"> 
          <span xid="span5"/> 
        </div>  
        <div component="$UI/system/components/bootstrap/row/row" class="row"
          xid="row2"> 
          <div class="col col-xs-4" xid="col11"> 
            <div component="$UI/system/components/justep/labelEdit/labelEdit"
              class="x-label-edit x-label10 pull-left" xid="labelRadioGroup1"> 
              <label class="x-label" xid="label2" style="width:54px;" bind-text="sexData.label('sex')"/>  
              <span component="$UI/system/components/justep/select/radioGroup"
                class="x-radio-group x-radios x-edit" xid="radioGroup1" bind-itemset="sexData"
                bind-itemsetValue="ref('sex')" bind-itemsetLabel="ref('sex')" style="width:215px;"/> 
            </div> 
          </div> 
        </div> 
      </div>  
      <div component="$UI/system/components/justep/controlGroup/controlGroup"
        class="x-control-group" title="2.默认选中" xid="controlGroup2" collapsible="true"> 
        <div class="x-control-group-title" xid="controlGroupTitle2"> 
          <span xid="span1"/> 
        </div>  
        <div component="$UI/system/components/bootstrap/row/row" class="row"
          xid="row3"> 
          <div class="col-sm-1" xid="col2"> 
            <div component="$UI/system/components/justep/labelEdit/labelEdit"
              class="x-label-edit x-label10 pull-left" xid="labelRadioGroup4" bind-checked=" $model.sexData.val(&quot;sex&quot;)=='男'"> 
              <label class="x-label" xid="label5" style="width:54px;" bind-text="sexData.label('sex')"/>  
              <span component="$UI/system/components/justep/select/radioGroup"
                class="x-radio-group x-radios x-edit" xid="radioGroup4" bind-itemset="sexData"
                bind-itemsetValue="ref('sex')" bind-itemsetLabel="ref('sex')" style="width:215px;"
                bind-ref="defaultData.ref('sex')"/> 
            </div> 
          </div> 
        </div> 
      </div>  
      <div component="$UI/system/components/justep/controlGroup/controlGroup"
        class="x-control-group" title="3.动态选中" xid="controlGroup3" collapsible="true"> 
        <div class="x-control-group-title" xid="controlGroupTitle3"> 
          <span xid="span2"/> 
        </div>  
        <div component="$UI/system/components/bootstrap/row/row" class="row"
          xid="row4"> 
          <div class="col-sm-1" xid="col3"> 
            <div component="$UI/system/components/justep/labelEdit/labelEdit"
              class="x-label-edit x-label10 pull-left" xid="labelRadioGroup5" bind-checked=" $model.sexData.val(&quot;sex&quot;)=='男'"> 
              <label class="x-label" xid="label6" style="width:54px;" bind-text="sexData.label('sex')"/>  
              <span component="$UI/system/components/justep/select/radioGroup"
                class="x-radio-group x-radios x-edit" xid="radio" bind-itemset="sexData"
                bind-itemsetValue="ref('sex')" bind-itemsetLabel="ref('sex')" style="width:215px;"
                bind-ref="defaultData.ref('checked')"/> 
            </div>  
            <a component="$UI/system/components/justep/button/button" class="btn btn-link"
              label="选中女" xid="radioBtn" onClick="radioBtnClick"> 
              <i xid="i1"/>  
              <span xid="span3">选中女</span> 
            </a> 
          </div> 
        </div> 
      </div>  
      <div component="$UI/system/components/justep/controlGroup/controlGroup"
        class="x-control-group" title="4.启用 禁用" xid="controlGroup4" collapsible="true"> 
        <div class="x-control-group-title" xid="controlGroupTitle4"> 
          <span xid="span4"/> 
        </div>  
        <div component="$UI/system/components/bootstrap/row/row" class="row"
          xid="row5"> 
          <div class="col-sm-3" xid="col4"> 
            <div component="$UI/system/components/justep/labelEdit/labelEdit"
              class="x-label-edit x-label10 pull-left" xid="labelRadioGroup6" bind-checked=" $model.sexData.val(&quot;sex&quot;)=='男'"> 
              <label class="x-label" xid="label7" style="width:54px;" bind-text="sexData.label('ebable')"/>  
              <span component="$UI/system/components/justep/select/radioGroup"
                class="x-radio-group x-radios x-edit" xid="radioEnable" bind-itemset="sexData"
                bind-itemsetValue="ref('ebable')" bind-itemsetLabel="ref('ebable')"
                style="width:149px;" bind-disable="true"/> 
            </div>  
            <a component="$UI/system/components/justep/button/button" class="btn btn-link pull-left"
              label="启用" xid="enableBtn" onClick="enableBtnClick"> 
              <i xid="i2"/>  
              <span xid="span6">启用</span> 
            </a>  
            <a component="$UI/system/components/justep/button/button" class="btn btn-link pull-left"
              label="禁用" xid="disabledBtn" onClick="disabledBtnClick"> 
              <i xid="i3"/>  
              <span xid="span7">禁用</span> 
            </a> 
          </div> 
        </div> 
      </div>  
      <div component="$UI/system/components/justep/controlGroup/controlGroup"
        class="x-control-group" title="5.获取选中项的值" xid="controlGroup5" collapsible="true"> 
        <div class="x-control-group-title" xid="controlGroupTitle6"> 
          <span xid="span11"/> 
        </div>  
        <div component="$UI/system/components/bootstrap/row/row" class="row"
          xid="row7"> 
          <div class="col-sm-1" xid="col6"> 
            <div component="$UI/system/components/justep/labelEdit/labelEdit"
              class="x-label-edit x-label10 pull-left" xid="labelRadioGroup8" bind-checked=" $model.sexData.val(&quot;sex&quot;)=='男'"> 
              <label class="x-label" xid="label9" style="width:54px;" bind-text="sexData.label('sex')"/>  
              <span component="$UI/system/components/justep/select/radioGroup"
                class="x-radio-group x-radios x-edit" xid="radioGroup8" bind-itemset="sexData"
                bind-itemsetValue="ref('sex')" bind-itemsetLabel="ref('sex')" style="width:215px;"
                bind-ref="defaultData.ref('value')"/> 
            </div>  
            <a component="$UI/system/components/justep/button/button" class="btn btn-link"
              label="获取值" xid="valueBtn" onClick="valueBtnClick"> 
              <i xid="i6"/>  
              <span xid="span12">获取值</span> 
            </a> 
          </div> 
        </div> 
      </div>  
      <div component="$UI/system/components/justep/controlGroup/controlGroup"
        class="x-control-group" title="6.自定义样式" xid="controlGroup6" collapsible="true"> 
        <div class="x-control-group-title" xid="controlGroupTitle7"> 
          <span xid="span13"/> 
        </div>  
        <div component="$UI/system/components/bootstrap/row/row" class="row"
          xid="row8"> 
          <div class="col-sm-1" xid="col7"> 
            <div component="$UI/system/components/justep/labelEdit/labelEdit"
              class="x-label-edit x-label10 pull-left" xid="labelRadioGroup9" bind-checked=" $model.sexData.val(&quot;sex&quot;)=='男'"> 
              <label class="x-label" xid="label10" style="width:54px;" bind-text="sexData.ref('example')"/>  
              <span component="$UI/system/components/justep/select/radioGroup"
                class="x-radio-group x-radio-group-lg bg-success x-radios x-edit"
                xid="radioGroup9" bind-itemset="sexData" bind-itemsetValue="ref('example')"
                bind-itemsetLabel="ref('example')" style="height:34px;width:228px;"/> 
            </div> 
          </div> 
        </div> 
      </div> 
    </div> 
  </div> 
</div>
