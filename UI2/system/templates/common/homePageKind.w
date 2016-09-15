<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window" component="$UI/system/components/justep/window/window"
  design="device:m;">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:692px;top:514px;"
    onLoad="modelLoad"> 
    <div component="$UI/system/components/justep/data/data" autoLoad="true"
      xid="data1" idColumn="value"> 
      <column label="值" name="value" type="String" xid="xid1"/>  
      <column label="显示值" name="label" type="String" xid="xid2"/>  
      <data xid="default1">[{"value":"1","label":"是"},{"value":"2","label":"否"}]</data> 
    </div>  
    <div component="$UI/system/components/justep/data/data" autoLoad="true"
      xid="data4" idColumn="value"> 
      <column label="值" name="value" type="String" xid="default3"/>  
      <column label="显示值" name="label" type="String" xid="default4"/>  
      <data xid="default2">[{"value":"1","label":"是"},{"value":"2","label":"否"}]</data> 
    </div>  
    <div component="$UI/system/components/justep/data/data" autoLoad="true"
      xid="data5" idColumn="value"> 
      <column label="值" name="value" type="String" xid="default6"/>  
      <column label="显示值" name="label" type="String" xid="default7"/>  
      <data xid="default5">[{"value":"1","label":"是"},{"value":"2","label":"否"}]</data> 
    </div>  
    <div component="$UI/system/components/justep/data/data" autoLoad="false"
      xid="data6" idColumn="wing" autoNew="true" onCustomNew="data6CustomNew"> 
      <column label="wing" name="wing" type="String" xid="xid3"/>  
      <column label="leftMenu" name="leftMenu" type="String" xid="xid4"/>  
      <column label="main" name="main" type="String" xid="xid5"/>  
      <rule xid="rule1"> 
        <col name="leftMenu" xid="ruleCol1"> 
          <readonly xid="readonly1"> 
            <expr xid="default9">$model.data6.val("wing") == 2</expr>
          </readonly> 
        </col> 
      </rule>
    </div> 
  </div>  
  <div xid="div4" class="content"> 
    <div xid="div1"> 
      <p xid="p6" style="font-size:18px;" fid="phone"><![CDATA[是否生成左侧边栏？]]></p>  
      <span component="$UI/system/components/justep/select/radioGroup" class="x-radio-group"
        xid="wing" bind-itemset="data1" bind-itemsetValue="ref('value')" bind-itemsetLabel="ref('label')"
        bind-ref="data6.ref('wing')"/> 
    </div>  
    <div xid="div2"> 
      <p xid="p1" style="font-size:18px;" fid="phone"><![CDATA[左侧边栏是否为独立页（leftMenu.w）?]]></p>  
      <span component="$UI/system/components/justep/select/radioGroup" class="x-radio-group"
        xid="leftMenu" bind-itemset="data4" bind-itemsetValue="ref('value')" bind-itemsetLabel="ref('label')"
        bind-ref="data6.ref('leftMenu')"/> 
    </div>  
    <div xid="div3"> 
      <p xid="p2" style="font-size:18px;" fid="phone">是否同时生成主页（main.w）?</p>  
      <span component="$UI/system/components/justep/select/radioGroup" class="x-radio-group"
        xid="main" bind-itemset="data5" bind-ref="data6.ref('main')" bind-itemsetValue="ref('value')"
        bind-itemsetLabel="ref('label')"/> 
    </div> 
  <div xid="div5" bind-visible=' $model.data6.val("main") ==2'><h4 xid="h41" class="text-center"><![CDATA[请输入主页地址：（例：$UI/system/templates/normal/homePage1/template/main.w）]]></h4><input component="$UI/system/components/justep/input/input" class="form-control" xid="mainInput"></input></div></div> 

  
  </div>
