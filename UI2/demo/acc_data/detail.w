<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window" component="$UI/system/components/justep/window/window"
  design="device:m;">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:233px;top:180px;"
    onLoad="modelLoad" onParamsReceive="modelParamsReceive"> 
    <div component="$UI/system/components/justep/data/data" autoLoad="false"
      xid="accountData" idColumn="fID" autoNew="false" onValueChanged="accountDataValueChanged"> 
      <column label="主键" name="fID" type="String" xid="xid3"/>  
      <column label="创建时间" name="fCreateTime" type="DateTime" xid="xid4"/>  
      <column label="日期" name="fDate" type="Date" xid="xid5"/>  
      <column label="金额" name="fMoney" type="Decimal" xid="xid6"/>  
      <column label="备注" name="fDescription" type="String" xid="xid7"/>  
      <column label="收入\支出" name="fType" type="String" xid="xid8"/>  
      <column label="分类" name="fClass" type="String" xid="xid9"/>  
      <rule xid="rule1"> 
        <col name="fMoney" xid="ruleCol1"> 
          <required xid="required1"> 
            <expr xid="default4">true</expr>  
            <message xid="default5">请填写金额</message> 
          </required> 
        </col> 
      </rule>  
      <data xid="default2">[]</data>
    </div>  
    <div component="$UI/system/components/justep/data/data" autoLoad="true"
      xid="typeData" idColumn="fType" limit="20"> 
      <column label="fType" name="fType" type="String" xid="xid11"/>  
      <data xid="default3">[{"fType":"收入"},{"fType":"支出"}]</data> 
    </div> 
  <div component="$UI/system/components/justep/data/data" autoLoad="true" xid="classData" idColumn="fID" limit="20" onCustomRefresh="classDataCustomRefresh">
   <column label="主键" name="fID" type="String" xid="column2"></column>
   <column label="支出\收入" name="fType" type="String" xid="column3"></column>
   <column label="分类" name="fClass" type="String" xid="column1"></column>
   <data xid="default6">[]</data></div></div>  
  <div component="$UI/system/components/justep/panel/panel" class="x-panel x-full"
    xid="panel1"> 
    <div class="x-panel-top" xid="top1"> 
      <div component="$UI/system/components/justep/titleBar/titleBar" class="x-titlebar"
        xid="titleBar1" title="记一笔"> 
        <div class="x-titlebar-left" xid="div1"> 
          <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-only-icon"
            label="button" xid="button3" onClick="{operation:'window.close'}"> 
            <i xid="i3"/>  
            <span xid="span3"/> 
          </a> 
        </div>  
        <div class="x-titlebar-title" xid="div2">记一笔</div>  
        <div class="x-titlebar-right reverse" xid="div3"> 
          <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-only-icon"
            label="确定" xid="okBtn" icon="icon-android-checkmark" onClick="okBtnClick"> 
            <i xid="i1" class="icon-android-checkmark"/>  
            <span xid="span1">确定</span> 
          </a> 
        </div> 
      </div> 
    </div>  
    <div class="x-panel-content" xid="content1"> 
      <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label30"
        xid="labelSelect1"> 
        <label class="x-label" xid="label5"><![CDATA[类型]]></label>  
        <select component="$UI/system/components/justep/select/select" class="form-control x-edit"
          xid="select4" bind-ref="accountData.ref('fType')" bind-options="typeData"
          bind-optionsValue="fType"/> 
      </div>  
      <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label30"
        xid="labelSelect2"> 
        <label class="x-label" xid="label2"><![CDATA[分类]]></label>  
        <select component="$UI/system/components/justep/select/select" class="form-control x-edit"
          xid="select2" bind-ref="accountData.ref('fClass')" bind-options="$model.classData.find(['fType'], [$model.accountData.getValue('fType')])"
          bind-optionsValue="fClass"/> 
      </div>  
      <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label30"
        xid="labelInput1"> 
        <label class="x-label" xid="label1"><![CDATA[日期]]></label>  
        <input component="$UI/system/components/justep/input/input" class="form-control x-edit"
          xid="input1" bind-ref="accountData.ref('fDate')"/> 
      </div>  
      <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label30"
        xid="labelInput2"> 
        <label class="x-label" xid="label3"><![CDATA[金额]]></label>  
        <input component="$UI/system/components/justep/input/input" class="form-control x-edit"
          xid="input2" bind-ref="accountData.ref('fMoney')" format="0,000.00" placeHolder="0.00"/> 
      </div>  
      <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label30"
        xid="labelInput3"> 
        <label class="x-label" xid="label6"><![CDATA[备注]]></label>  
        <input component="$UI/system/components/justep/input/input" class="form-control x-edit"
          xid="input3" bind-ref="accountData.ref('fDescription')" placeHolder="请输入备注"/> 
      </div> 
    </div> 
  </div> 
</div>
