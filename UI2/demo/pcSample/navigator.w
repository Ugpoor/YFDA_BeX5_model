<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window" component="$UI/system/components/justep/window/window"
  design="device:pc">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="top:631px;left:723px;height:auto;">
    <div component="$UI/system/components/justep/data/data" autoLoad="true"
      xid="gridData" onCustomRefresh="gridDataCustomRefresh" idColumn="name">
      <column label="名称" name="name" type="String" xid="xid1"/>  
      <column label="地址" name="src" type="String" xid="xid2"/>
    </div>  
    <div component="$UI/system/components/justep/data/data" autoLoad="true"
      xid="formsData" idColumn="name" onCustomRefresh="formsDataCustomRefresh"> 
      <column label="名称" name="name" type="String" xid="column1"/>  
      <column label="地址" name="src" type="String" xid="column2"/>
    </div>  
    <div component="$UI/system/components/justep/data/data" autoLoad="true"
      xid="navigatorData" onCustomRefresh="navigatorDataCustomRefresh" idColumn="name">
      <column label="Name" name="name" type="String" xid="xid5"/>  
      <column label="Src" name="src" type="String" xid="xid6"/>
    </div>
    <div component="$UI/system/components/justep/data/data" autoLoad="true"
      xid="textData" idColumn="name" onCustomRefresh="formsDataCustomRefresh"> 
      <column label="名称" name="name" type="String" xid="column3"/>  
      <column label="地址" name="src" type="String" xid="column4"/>
    </div>  
    <div component="$UI/system/components/justep/data/data" autoLoad="true"
      xid="tableData" onCustomRefresh="tableDataCustomRefresh" idColumn="name">
      <column label="Name" name="name" type="String" xid="xid3"/>  
      <column label="Src" name="src" type="String" xid="xid4"/>
    </div>  
    <div component="$UI/system/components/justep/data/data" autoLoad="true"
      xid="formElementData" onCustomRefresh="formElementDataCustomRefresh" idColumn="name">
      <column label="Name" name="name" type="String" xid="xid7"/>  
      <column label="Src" name="src" type="String" xid="xid8"/>
    </div>  
    <div component="$UI/system/components/justep/data/data" autoLoad="true"
      xid="layoutData" onCustomRefresh="layoutDataCustomRefresh" idColumn="name">
      <column label="Name" name="name" type="String" xid="xid9"/>  
      <column label="Src" name="src" type="String" xid="xid10"/>
    </div>
  </div>  
  <div component="$UI/system/components/justep/controlGroup/controlGroup" class="x-control-group"
    title="forms" xid="controlGroup2" collapsible="true"> 
    <div class="x-control-group-title" xid="controlGroupTitle2"> 
      <span xid="span2">title</span>
    </div>  
    <div component="$UI/system/components/justep/list/list" class="x-list clearfix"
      xid="list2" data="formsData"> 
      <ul class="x-list-template" xid="listTemplateUl2"> 
        <li xid="li2" class="col-xs-3" style="padding:10px;"> 
          <span xid="span4" bind-text="ref(&quot;name&quot;)" bind-click="openPageClick"/>
        </li> 
      </ul> 
    </div>
  </div>
  <div component="$UI/system/components/justep/controlGroup/controlGroup" class="x-control-group"
    title="grid" xid="controlGroup1" collapsible="true"> 
    <div class="x-control-group-title" xid="controlGroupTitle1"> 
      <span xid="span1"><![CDATA[grid]]></span>
    </div>  
    <div component="$UI/system/components/justep/list/list" class="x-list clearfix"
      xid="list1" data="gridData"> 
      <ul class="x-list-template" xid="listTemplateUl1"> 
        <li xid="li1" class="col-xs-3">
          <span xid="span3" bind-text="ref(&quot;name&quot;)" bind-click="openPageClick"/> 
        </li>
      </ul> 
    </div>
  </div>  
  <div component="$UI/system/components/justep/controlGroup/controlGroup" class="x-control-group"
    title="text" xid="controlGroup3" collapsible="true"> 
    <div class="x-control-group-title" xid="controlGroupTitle3"> 
      <span xid="span5">title</span>
    </div>  
    <div component="$UI/system/components/justep/list/list" class="x-list clearfix"
      xid="list3" data="textData"> 
      <ul class="x-list-template" xid="listTemplateUl3"> 
        <li xid="li3" class="col-xs-3" style="padding:10px;"> 
          <span xid="span6" bind-text="ref(&quot;name&quot;)" bind-click="openPageClick"/>
        </li> 
      </ul> 
    </div>
  </div>  
  <div component="$UI/system/components/justep/controlGroup/controlGroup" class="x-control-group"
    title="table" xid="controlGroup4" collapsible="true"> 
    <div class="x-control-group-title" xid="controlGroupTitle4"> 
      <span xid="span7"><![CDATA[table]]></span>
    </div>  
    <div component="$UI/system/components/justep/list/list" class="x-list clearfix"
      xid="list4" data="tableData"> 
      <ul class="x-list-template" xid="listTemplateUl4"> 
        <li xid="li4" class="col-xs-3">
          <span xid="span8" bind-text="ref(&quot;name&quot;)" bind-click="openPageClick"/>
        </li>
      </ul> 
    </div>
  </div>  
  <div component="$UI/system/components/justep/controlGroup/controlGroup" class="x-control-group"
    title="navigator" xid="controlGroup5" collapsible="true"> 
    <div class="x-control-group-title" xid="controlGroupTitle5"> 
      <span xid="span9" class="clearfix">title</span>
    </div>  
    <div component="$UI/system/components/justep/list/list" class="x-list clearfix"
      xid="list5" data="navigatorData"> 
      <ul class="x-list-template" xid="listTemplateUl5"> 
        <li xid="li5" class="col-xs-3">
          <span xid="span11" bind-text="ref(&quot;name&quot;)" bind-click="openPageClick"/>
        </li>
      </ul> 
    </div>
  </div>  
  <div component="$UI/system/components/justep/controlGroup/controlGroup" class="x-control-group"
    title="form-element" xid="controlGroup6" collapsible="true"> 
    <div class="x-control-group-title" xid="controlGroupTitle6"> 
      <span xid="span10"><![CDATA[form-element]]></span>
    </div>  
    <div component="$UI/system/components/justep/list/list" class="x-list clearfix"
      xid="list6" data="formElementData"> 
      <ul class="x-list-template" xid="listTemplateUl6"> 
        <li xid="li6" class="col-xs-3">
          <span xid="span12" bind-text="ref(&quot;name&quot;)" bind-click="openPageClick"/>
        </li>
      </ul> 
    </div>
  </div>  
  <div component="$UI/system/components/justep/controlGroup/controlGroup" class="x-control-group"
    title="layout" xid="controlGroup7" collapsible="true"> 
    <div class="x-control-group-title" xid="controlGroupTitle7"> 
      <span xid="span13">title</span>
    </div>  
    <div component="$UI/system/components/justep/list/list" class="x-list clearfix"
      xid="list7" data="layoutData"> 
      <ul class="x-list-template" xid="listTemplateUl7"> 
        <li xid="li7" class="col-xs-3">
          <span xid="span14" bind-text="ref(&quot;name&quot;)" bind-click="openPageClick"/>
        </li>
      </ul> 
    </div>
  </div>
</div>
