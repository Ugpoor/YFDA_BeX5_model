<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" component="$UI/system/components/justep/window/window">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="top:6px;height:auto;left:455px;"
    onLoad="modelLoad"> 
    <div component="$UI/system/components/justep/data/data" xid="data" idColumn="field"
      confirm-delete="false" confirm-refresh="false" onValueChanged="dataValueChanged"> 
      <column label="分组" name="isGrouping" type="Boolean" xid="xid1"/>  
      <column label="列" name="field" type="String" xid="xid2"/>  
      <column label="显示名" name="name" type="String" xid="xid3"/>  
      <column label="分组显示文字" name="text" type="String" xid="xid4"/>  
      <column label="分组排序" name="order" type="String" xid="xid5"/>  
      <column label="分组统计" name="summary" type="Boolean" xid="xid6"/>  
      <column label="统计方式" name="summaryType" type="String" xid="xid7"/>  
      <column label="统计显示模板" name="summaryTpl" type="String" xid="xid8"/>  
      <column label="分组后显示列" name="groupColumnShow" type="Boolean" xid="xid9"/>
    </div>  
    <div component="$UI/system/components/justep/data/data" autoLoad="true"
      xid="orderData" confirmRefresh="false" confirmDelete="false" idColumn="value"> 
      <column name="value" type="String" label="value"/>  
      <column name="label" type="String" label="label"/>  
      <data xid="default1">[{"value":"asc","label":"升序"},{"value":"desc","label":"降序"}]</data>
    </div>  
    <div component="$UI/system/components/justep/data/data" autoLoad="true"
      xid="summaryTypeData" confirmDelete="false" confirmRefresh="false" idColumn="value"> 
      <column name="value" type="String" label="value"/>  
      <column name="label" type="String" label="label"/>  
      <data xid="default2">[{"value":"sum","label":"sum"},{"value":"count","label":"count"},{"value":"avg","label":"avg"},{"value":"min","label":"min"},{"value":"max","label":"max"}]</data>
    </div>
  </div>  
  <div component="$UI/system/components/justep/controlGroup/controlGroup" class="x-control-group"
    title="分组属性" xid="controlGroup1"> 
    <div class="x-control-group-title" xid="controlGroupTitle1"> 
      <span xid="span1">title</span>
    </div>  
    <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label20"
      xid="labelToggle1"> 
      <label class="x-label" xid="label1"><![CDATA[启用分组]]></label>  
      <span component="$UI/system/components/justep/button/toggle" class="x-toggle x-edit"
        xid="toggle1" bind-ref="grouping"/>
    </div>  
    <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label20"
      xid="labelToggle2"> 
      <label class="x-label" xid="label2"><![CDATA[启用自定义分组栏]]></label>  
      <span component="$UI/system/components/justep/button/toggle" class="x-toggle x-edit"
        xid="toggle2" bind-ref="useGroupBar"/>
    </div>  
    <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label20"
      xid="labelToggle3"> 
      <label class="x-label" xid="label3"><![CDATA[分组折叠]]></label>  
      <span component="$UI/system/components/justep/button/toggle" class="x-toggle x-edit"
        xid="toggle3" bind-ref="groupCollapse"/>
    </div> 
  <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label20" xid="labelEdit1">
   <label class="x-label" xid="label4"><![CDATA[空值显示文本]]></label>
   <input component="$UI/system/components/justep/input/input" class="form-control x-edit" xid="input1" placeHolder="默认显示：（无）" bind-ref="nullText"></input></div></div>  
  <div component="$UI/system/components/justep/controlGroup/controlGroup" class="x-control-group"
    title="默认分组列定义" xid="controlGroup2"> 
    <div class="x-control-group-title" xid="controlGroupTitle2"> 
      <span xid="span2"/>
    </div>  
    <div component="$UI/system/components/justep/list/list" class="x-list"
      xid="listFields" data="data" style="margin: 0.3125em 0;"> 
      <div class="x-list-template" xid="fields"> 
        <span component="$UI/system/components/justep/button/checkbox" class="x-checkbox"
          xid="checkbox1" bind-label="ref('name')" bind-checked="ref('isGrouping')"
          checked="false" style="margin-right: 0.625em;"/> 
      </div> 
    </div>  
    <div xid="div1" class="x-field-group" bind-foreach="groupFields"> 
      <span class="x-field-item" bind-css="{'x-field-item-active':$object==$model.currentField.get()}"
        bind-text="ref('name')" bind-click="selectField"/> 
    </div>
    
    <!--    
    <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label20"
      xid="labelInput1"> 
      <label class="x-label" xid="label5" bind-text="data.label('text')"/>  
      <input component="$UI/system/components/justep/input/input" class="form-control x-edit"
        xid="textInput" bind-ref="ref('text')" placeHolder="如：{0} 合计:{1}"/>
    </div>  
    <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label20"
      xid="labelRadioGroup1"> 
      <label class="x-label" xid="label6" bind-text="data.label('order')"/>  
      <span component="$UI/system/components/justep/select/radioGroup" class="x-radios x-edit"
        xid="radioGroup1" bind-ref="ref('order')" bind-itemset="orderData" bind-itemsetValue="ref('value')"
        bind-itemsetLabel="ref('label')"/>
    </div>  
    <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label20"
      xid="labelToggle4"> 
      <label class="x-label" xid="label8" bind-text="data.label('summary')"/>  
      <span component="$UI/system/components/justep/button/toggle" class="x-toggle x-edit"
        xid="toggle4" bind-ref="ref('summary')"/>
    </div>  
    <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label20"
      xid="labelToggle5"> 
      <label class="x-label" xid="label8-1" bind-text="data.label('groupColumnShow')"/>  
      <span component="$UI/system/components/justep/button/toggle" class="x-toggle x-edit"
        xid="toggle4-1" bind-ref="ref('groupColumnShow')"/>
    </div>  
    <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label20"
      xid="labelSelect2"> 
      <label class="x-label" xid="label9" bind-text="data.label('summaryType')"/>  
      <select component="$UI/system/components/justep/select/select" class="form-control x-edit"
        xid="select2" bind-ref="ref('summaryType')" bind-options="summaryTypeData"
        bind-optionsValue="value" bind-optionsLabel="label" bind-optionsCaption="选择统计函数"/>
    </div>  
    <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label20"
      xid="labelInput2"> 
      <label class="x-label" xid="label10" bind-text="data.label('summaryTpl')"/>  
      <input component="$UI/system/components/justep/input/input" class="form-control x-edit"
        xid="input2" bind-ref="ref('summaryTpl')" placeHolder="如：&lt;b&gt;合计: {0}&lt;/b&gt;"/>
    </div>
    -->
  </div>
</div>
