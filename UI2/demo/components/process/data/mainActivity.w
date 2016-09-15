<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window" component="$UI/system/components/justep/window/window"
  design="device:pc">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="width:188px;height:auto;left:746px;top:379px;">
    <div component="$UI/system/components/justep/data/bizData" autoLoad="true"
      xid="dReference_Orders" concept="DEMO_Orders">
      <reader xid="default6" action="/demo/common/logic/action/queryDEMO_OrdersAction"/>  
      <writer xid="default7" action="/demo/common/logic/action/saveDEMO_OrdersAction"/>  
      <creator xid="default8" action="/demo/common/logic/action/createDEMO_OrdersAction"/>
    </div>  
    <div component="$UI/system/components/justep/data/bizData" autoLoad="true"
      xid="dCalculate_OrderDetails" concept="DEMO_OrderDetails">
      <reader xid="default10" action="/demo/common/logic/action/queryDEMO_OrderDetailsAction"/>  
      <calculateRelation relation="fMoney" xid="calculateRelation1" type="String" label="金额"/>  
      <rule xid="rule1"> 
        <col name="fMoney" xid="ruleCol1"> 
          <calculate xid="calculate1"> 
            <expr xid="default36">js:val('fUnitPrice') * val('fQuantity')</expr>
          </calculate> 
        </col>  
        <col name="fQuantity" xid="ruleCol2"> 
          <required xid="required1"> 
            <expr xid="default37"/>
          </required> 
        </col> 
      </rule>
    </div>  
    <div component="$UI/system/components/justep/data/bizData" autoLoad="true"
      xid="dRule_Orders" concept="DEMO_Orders" confirmRefresh="false">
      <reader xid="default13" action="/demo/common/logic/action/queryDEMO_OrdersAction"/>  
      <writer xid="default14" action="/demo/common/logic/action/saveDEMO_OrdersAction"/>  
      <creator xid="default15" action="/demo/common/logic/action/createDEMO_OrdersAction"/>  
      <rule xid="rule2"> 
        <readonly xid="readonly1"> 
          <expr xid="default38">js:val("fStatus")== 'shipped'</expr>
        </readonly>  
        <col name="fTotalMoney" xid="ruleCol3"> 
          <calculate xid="calculate2"> 
            <expr xid="default39">$model.comp('dRule_OrderDetails').sum('fMoney')</expr>
          </calculate> 
        </col> 
      </rule>
    </div>  
    <div component="$UI/system/components/justep/data/bizData" autoLoad="true"
      xid="dRule_OrderDetails" concept="DEMO_OrderDetails">
      <reader xid="default16" action="/demo/common/logic/action/queryDEMO_OrderDetailsAction"/>  
      <writer xid="default17" action="/demo/common/logic/action/saveDEMO_OrderDetailsAction"/>  
      <creator xid="default18" action="/demo/common/logic/action/createDEMO_OrderDetailsAction"/>  
      <master xid="default19" data="dRule_Orders" relation="fOrderID"/>  
      <rule xid="rule3"> 
        <readonly xid="readonly2"> 
          <expr xid="default40">$model.dRule_Orders.val("fStatus")== 'shipped'</expr>
        </readonly>  
        <col name="fMoney" xid="ruleCol4"> 
          <calculate xid="calculate3"> 
            <expr xid="default41">$row.val("fQuantity") * $row.val("fUnitPrice") *(1- $row.val("fDiscount"))</expr>
          </calculate> 
        </col>  
        <col name="fQuantity" xid="ruleCol5"> 
          <calculate xid="calculate4"> 
            <expr xid="default42"/>
          </calculate>  
          <constraint xid="constraint1"> 
            <expr xid="default44">$row.val("fQuantity")&gt;=0</expr>  
            <message xid="default47">数量必须大于等于0</message>
          </constraint> 
        </col>  
        <col name="fDiscount" xid="ruleCol6"> 
          <constraint xid="constraint2"> 
            <expr xid="default45">$row.val("fDiscount")&gt;=0</expr>  
            <message xid="default48">折扣必须大于等于0</message>
          </constraint> 
        </col>  
        <col name="fUnitPrice" xid="ruleCol7"> 
          <constraint xid="constraint3"> 
            <expr xid="default46">$row.val("fUnitPrice")&gt;=0</expr>  
            <message xid="default49">单价必须大于等于0</message>
          </constraint> 
        </col> 
      </rule>
    </div>  
    <div component="$UI/system/components/justep/data/bizData" autoLoad="true"
      xid="dOrderBy_Orders" concept="DEMO_Orders" orderBy="fOrderNumber asc">
      <reader xid="default21" action="/demo/common/logic/action/queryDEMO_OrdersAction"/>  
      <writer xid="default22" action="/demo/common/logic/action/saveDEMO_OrdersAction"/>  
      <creator xid="default23" action="/demo/common/logic/action/createDEMO_OrdersAction"/>
    </div>  
    <div component="$UI/system/components/justep/data/data" autoLoad="true"
      xid="dOrderBy_Fields" idColumn="key">
      <column isCalculate="false" name="key" type="String" xid="xid1"/>  
      <column name="value" type="String" xid="xid2"/>  
      <data xid="default51">[{"key":"fOrderNumber","value":"订单号"},{"key":"fFreght","value":"运费"},{"key":"fOrderDate","value":"订单日期"},{"key":"fRequiredDate","value":"需求日期"},{"key":"fShippedDate","value":"发货日期"}]</data>
    </div>  
    <div component="$UI/system/components/justep/data/data" autoLoad="true"
      xid="dOrderBy_Type" idColumn="key">
      <column name="key" type="String" xid="xid3"/>  
      <column name="value" type="String" xid="xid4"/>  
      <data xid="default50">[{"key":"0","value":"降序"},{"key":"1","value":"升序"}]</data>
    </div>  
    <div component="$UI/system/components/justep/data/bizData" autoLoad="true"
      xid="dFilter_Orders" concept="DEMO_Orders">
      <reader xid="default25" action="/demo/common/logic/action/queryDEMO_OrdersAction"/>  
      <writer xid="default26" action="/demo/common/logic/action/saveDEMO_OrdersAction"/>  
      <creator xid="default27" action="/demo/common/logic/action/createDEMO_OrdersAction"/>
    </div>  
    <div component="$UI/system/components/justep/data/bizData" autoLoad="true"
      xid="dMasterDetail_Orders" concept="DEMO_Orders">
      <reader xid="default29" action="/demo/common/logic/action/queryDEMO_OrdersAction"/>  
      <writer xid="default30" action="/demo/common/logic/action/saveDEMO_OrdersAction"/>  
      <creator xid="default31" action="/demo/common/logic/action/createDEMO_OrdersAction"/>
    </div>  
    <div component="$UI/system/components/justep/data/bizData" autoLoad="true"
      xid="dMasterDetail_OrderDetails" concept="DEMO_OrderDetails">
      <reader xid="default32" action="/demo/common/logic/action/queryDEMO_OrderDetailsAction"/>  
      <writer xid="default33" action="/demo/common/logic/action/saveDEMO_OrderDetailsAction"/>  
      <creator xid="default34" action="/demo/common/logic/action/createDEMO_OrderDetailsAction"/>  
      <master xid="default35" data="dMasterDetail_Orders" relation="fOrderID"/>
    </div>  
    <div component="$UI/system/components/justep/data/data" autoLoad="true"
      xid="dRule_Status" idColumn="key">
      <column name="key" type="String" xid="xid5"/>  
      <column name="value" type="String" xid="xid6"/>  
      <data xid="default43">[{"key":"checking","value":"审批中"},{"key":"checked","value":"已审批"},{"key":"shipped","value":"已发货"}]</data>
    </div>  
    <div component="$UI/system/components/justep/data/data" autoLoad="false"
      xid="dTemp" idColumn="field" autoNew="true">
      <column name="field" type="String" xid="xid7"/>  
      <column name="fieldLabel" type="String" xid="xid8"/>  
      <column name="type" type="String" xid="xid9"/>  
      <column name="typeLabel" type="String" xid="xid10"/>  
      <column name="isValid" type="String" xid="xid11"/>  
      <column name="treeSelectKey" type="String" xid="xid12"/>  
      <column name="treeSelectValue" type="String" xid="xid13"/>
    </div>  
    <div component="$UI/system/components/justep/data/bizData" autoLoad="true"
      xid="dTreeGrid_Org" concept="SA_OPOrg" isTree="true">
      <reader xid="default53" action="/system/logic/action/queryOrgAction"/>  
      <treeOption xid="default55" parentRelation="sParent" delayLoad="true" rootFilter="SA_OPOrg.sParent is null"/>
    </div>  
    <div component="$UI/system/components/justep/data/bizData" autoLoad="true"
      xid="dTree_Org" concept="SA_OPOrg" isTree="false">
      <reader xid="default54" action="/system/logic/action/queryOrgAction"/>  
      <treeOption xid="default56" parentRelation="sParent" delayLoad="true" rootFilter="SA_OPOrg.sParent is null"/>
    </div>  
    <div component="$UI/system/components/justep/data/bizData" autoLoad="true"
      xid="dTreeSelect_Org" concept="SA_OPOrg" isTree="true">
      <reader xid="default57" action="/system/logic/action/queryOrgAction"/>  
      <treeOption xid="default58" parentRelation="sParent" delayLoad="true" rootFilter="SA_OPOrg.sParent is null"/>
    </div>  
    <div component="$UI/system/components/justep/data/data" autoLoad="true"
      xid="orgData" idColumn="sFID"> 
      <column label="sFID" name="sFID" type="String" xid="column55"/>  
      <column label="sName" name="sName" type="String" xid="column56"/>  
      <column label="sFName" name="sFName" type="String" xid="column57"/>  
      <column label="sOrgKindID" name="sOrgKindID" type="String" xid="column58"/>  
      <column label="sSequence" name="sSequence" type="String" xid="column51"/>  
      <column label="sParent" name="sParent" type="String" xid="column52"/>  
      <column label="sPersonID" name="sPersonID" type="String" xid="column53"/>  
      <column label="sNodeKind" name="sNodeKind" type="String" xid="column54"/>  
      <data xid="default59">[{"sFID":"/F92C257AEA094865A96DCB617482B37C.ogn","sName":"阳光集团（演示数据）","sFName":"/阳光集团（演示数据）","sOrgKindID":"ogn","sSequence":"/003"},{"sFID":"/F92C257AEA094865A96DCB617482B37C.ogn/4830B1B9A8204D23A7D5D5F3338605DC.ogn","sName":"广东分公司","sFName":"/阳光集团（演示数据）/广东分公司","sOrgKindID":"ogn","sSequence":"/003/014","sParent":"F92C257AEA094865A96DCB617482B37C"},{"sFID":"/F92C257AEA094865A96DCB617482B37C.ogn/4830B1B9A8204D23A7D5D5F3338605DC.ogn/C5974B908942488C991D425143DDCA00.dpt","sName":"销售部","sFName":"/阳光集团（演示数据）/广东分公司/销售部","sOrgKindID":"dpt","sSequence":"/003/014/004","sParent":"4830B1B9A8204D23A7D5D5F3338605DC"}]</data>
    </div>
  </div>  
  <div component="$UI/system/components/bootstrap/tabs/tabs" xid="tabs1"> 
    <ul class="nav nav-tabs" xid="ul1"> 
      <li class="active" xid="li1_1"> 
        <a content="tabContent1" xid="tabFirst"><![CDATA[概述]]></a> 
      </li>  
      <li role="presentation" xid="li2_2"> 
        <a content="tabContent2" xid="tabEvents"><![CDATA[事件]]></a> 
      </li>  
      <li xid="li3"> 
        <a content="tabContent3" xid="tabLoadData"><![CDATA[加载数据]]></a> 
      </li>  
      <li xid="li4" bind-click="li4Click"> 
        <a content="tabContent4" xid="tabReference"><![CDATA[数据组件与数据感知组件]]></a> 
      </li>  
      <li xid="li5" bind-click="li5Click"> 
        <a content="tabContent5" xid="tabCalculate"><![CDATA[计算关系]]></a> 
      </li>  
      <li xid="li6" bind-click="li6Click"> 
        <a content="tabContent6" xid="tabRule"><![CDATA[数据规则]]></a> 
      </li>  
      <li xid="li7" bind-click="li7Click"> 
        <a content="tabContent7" xid="tabOrderBy"><![CDATA[分页与排序]]></a> 
      </li>  
      <li xid="li8" bind-click="li8Click"> 
        <a content="tabContent8" xid="tabFilter"><![CDATA[查找与过滤]]></a> 
      </li>  
      <li xid="li9" bind-click="li9Click"> 
        <a content="tabContent9" xid="tabMasterDetail"><![CDATA[主从关联]]></a> 
      </li>  
      <li xid="li12" bind-click="li12Click"> 
        <a content="tabContent12" xid="tabTree"><![CDATA[树形数据]]></a>
      </li>
    </ul>  
    <div class="tab-content" xid="div1_1"> 
      <div class="tab-pane active" xid="tabContent1"> 
        <div class="x-cell-layout" component="$UI/system/components/justep/cellLayout/cellLayout"
          style="width:100%;height:185px;" xid="cellLayout1"> 
          <layout-content xid="default1"><![CDATA[
  <table cellspacing="0" cellpadding="0" rowHeight="19" columnWidth="80" style="border-collapse:collapse;table-layout:fixed;width:1px;">
     <tr><td ></td><td  style="width: 15px;"></td><td  style="width: 150px;"></td><td  style="width: 880px;"></td><td ></td><td ></td><td ></td><td ></td></tr>
     <tr><td ></td><td  style="height: 19px;"></td><td  style="height: 19px;"></td><td  style="height: 19px;"></td><td  style="height: 19px;"></td><td  style="height: 19px;"></td><td  style="height: 19px;"></td><td  style="height: 19px;"></td></tr>
     <tr><td ></td><td  style="height: 19px;"></td><td  colSpan="2" style="height: 19px;">数据组件是X5数据感知组件体系的核心组件，它主要有以下能力：</td><td  style="height: 19px;"></td><td  style="height: 19px;"></td><td  style="height: 19px;"></td><td  style="height: 19px;"></td></tr>
     <tr><td ></td><td  style="height: 19px;"></td><td  colSpan="2" style="height: 19px;">　　1、为其他数据感知组件提供数据源和数据感知机制。</td><td  style="height: 19px;"></td><td  style="height: 19px;"></td><td  style="height: 19px;"></td><td  style="height: 19px;"></td></tr>
     <tr><td ></td><td  style="height: 19px;"></td><td  colSpan="2" style="height: 19px;">　　2、支持数据规则的设置和解析，数据规则包含：必须、只读、可见、计算、约束、默认。</td><td  style="height: 19px;"></td><td  style="height: 19px;"></td><td  style="height: 19px;"></td><td  style="height: 19px;"></td></tr>
     <tr><td ></td><td  style="height: 19px;"></td><td  colSpan="3" style="height: 19px;">　　3、管理数据缓存和状态，数据状态包含：Data.STATE.NEW、Data.STATE.DELETE、Data.STATE.EDIT、Data.STATE.NONE。</td><td  style="height: 19px;"></td><td  style="height: 19px;"></td><td  style="height: 19px;"></td></tr>
     <tr><td ></td><td  style="height: 19px;"></td><td  colSpan="2" style="height: 19px;">             其中Data定义为：var Data = require("$UI/system/components/justep/data/data")</td><td  style="height: 19px;"></td><td  style="height: 19px;"></td><td  style="height: 19px;"></td><td  style="height: 19px;"></td></tr>
     <tr><td ></td><td  style="height: 19px;"></td><td  colSpan="2" style="height: 19px;">　　4、提供数据的操作方法和事件，例如：加载数据、修改数据、删除数据等。</td><td  style="height: 19px;"></td><td  style="height: 19px;"></td><td  style="height: 19px;"></td><td  style="height: 19px;"></td></tr>
     <tr><td  style="height: 19px;"></td><td  style="height: 19px;"></td><td  style="height: 19px;"></td><td  style="height: 19px;"></td><td  style="height: 19px;"></td><td  style="height: 19px;"></td><td  style="height: 19px;"></td><td  style="height: 19px;"></td></tr>
     <tr><td ></td><td  style="height: 19px;"></td><td  colSpan="2" style="height: 19px;">X5的数据组件共有两个，分别是data和bizData：</td><td  style="height: 19px;"></td><td  style="height: 19px;"></td><td  style="height: 19px;"></td><td  style="height: 19px;"></td></tr>
  </table>
]]></layout-content> 
        </div>  
        <div component="$UI/system/components/bootstrap/tabs/tabs" xid="tabs2"
          style="height:350px;"> 
          <ul class="nav nav-tabs" xid="ul2"> 
            <li class="active" xid="li10"> 
              <a content="tabContent10" xid="tabItem10"><![CDATA[data组件]]></a>
            </li>  
            <li role="presentation" xid="li11"> 
              <a content="tabContent11" xid="tabItem11"><![CDATA[bizData组件]]></a>
            </li> 
          </ul>  
          <div class="tab-content" xid="div2_1"> 
            <div class="tab-pane active" xid="tabContent10">
              <div class="x-cell-layout" component="$UI/system/components/justep/cellLayout/cellLayout"
                style="width:100%;height:400px;" xid="cellLayout2">
                <layout-content xid="default2"><![CDATA[
  <table cellspacing="0" cellpadding="0" rowHeight="19" columnWidth="80" style="border-collapse:collapse;table-layout:fixed;width:1px;">
     <tr><td ></td><td  style="width: 15px;"></td><td  style="width: 200px;"></td><td  style="width: 800px;"></td><td ></td><td ></td><td ></td><td ></td></tr>
     <tr><td ></td><td  style="height: 19px;"></td><td  style="height: 19px;"></td><td  style="height: 19px;"></td><td  style="height: 19px;"></td><td  style="height: 19px;"></td><td  style="height: 19px;"></td><td  style="height: 19px;"></td></tr>
     <tr><td ></td><td  style="height: 19px;"></td><td  colSpan="2" style="height: 19px;">data组件是一个简单数据组件，一般用于定义和存储页面上的静态数据或临时数据。</td><td  style="height: 19px;"></td><td  style="height: 19px;"></td><td  style="height: 19px;"></td><td  style="height: 19px;"></td></tr>
     <tr><td  style="height: 2px;"></td><td  style="height: 2px;"></td><td  style="height: 2px; border-bottom-width: 1px; border-bottom-color: rgb(150, 150, 150); border-bottom-style: solid;"></td><td  style="height: 2px; border-bottom-width: 1px; border-bottom-color: rgb(150, 150, 150); border-bottom-style: solid;"></td><td  style="height: 2px;"></td><td  style="height: 2px;"></td><td  style="height: 2px;"></td><td  style="height: 2px;"></td></tr>
     <tr><td ></td><td  style="height: 19px;"></td><td  colSpan="2" style="height: 19px;">data支持主从数据的关联，支持树形数据的定义和逐级延迟加载。</td><td  style="height: 19px;"></td><td  style="height: 19px;"></td><td  style="height: 19px;"></td><td  style="height: 19px;"></td></tr>
     <tr><td ></td><td  style="border-right-width: 1px; border-right-color: rgb(150, 150, 150); border-right-style: solid; height: 19px;"></td><td  style="height: 19px; border: 1px solid rgb(150, 150, 150); text-align: center; font-weight: bold;">属性</td><td  style="height: 19px; border: 1px solid rgb(150, 150, 150); text-align: center; font-weight: bold;">说明</td><td  style="height: 19px;"></td><td  style="height: 19px;"></td><td  style="height: 19px;"></td><td  style="height: 19px;"></td></tr>
     <tr><td ></td><td  style="border-right-width: 1px; border-right-color: rgb(150, 150, 150); border-right-style: solid; height: 19px;"></td><td  style="height: 19px; border: 1px solid rgb(150, 150, 150);">idColumn</td><td  style="height: 19px; border: 1px solid rgb(150, 150, 150);">标识ID的列</td><td  style="height: 19px;"></td><td  style="height: 19px;"></td><td  style="height: 19px;"></td><td  style="height: 19px;"></td></tr>
     <tr><td ></td><td  style="border-right-width: 1px; border-right-color: rgb(150, 150, 150); border-right-style: solid; height: 19px;"></td><td  style="height: 19px; border: 1px solid rgb(150, 150, 150);">limit</td><td  style="height: 19px; border: 1px solid rgb(150, 150, 150);">数据分页的每页记录数，-1表示不分页</td><td  style="height: 19px;"></td><td  style="height: 19px;"></td><td  style="height: 19px;"></td><td  style="height: 19px;"></td></tr>
     <tr><td ></td><td  style="border-right-width: 1px; border-right-color: rgb(150, 150, 150); border-right-style: solid; height: 19px;"></td><td  style="height: 19px; border: 1px solid rgb(150, 150, 150);">confirm-delete</td><td  style="height: 19px; border: 1px solid rgb(150, 150, 150);">是否删除提示</td><td  style="height: 19px;"></td><td  style="height: 19px;"></td><td  style="height: 19px;"></td><td  style="height: 19px;"></td></tr>
     <tr><td ></td><td  style="border-right-width: 1px; border-right-color: rgb(150, 150, 150); border-right-style: solid; height: 19px;"></td><td  style="height: 19px; border: 1px solid rgb(150, 150, 150);">confirm-delete-text</td><td  style="height: 19px; border: 1px solid rgb(150, 150, 150);">删除提示文本</td><td  style="height: 19px;"></td><td  style="height: 19px;"></td><td  style="height: 19px;"></td><td  style="height: 19px;"></td></tr>
     <tr><td ></td><td  style="border-right-width: 1px; border-right-color: rgb(150, 150, 150); border-right-style: solid; height: 19px;"></td><td  style="height: 19px; border: 1px solid rgb(150, 150, 150);">confirm-refresh</td><td  style="height: 19px; border: 1px solid rgb(150, 150, 150);">是否刷新提示</td><td  style="height: 19px;"></td><td  style="height: 19px;"></td><td  style="height: 19px;"></td><td  style="height: 19px;"></td></tr>
     <tr><td ></td><td  style="border-right-width: 1px; border-right-color: rgb(150, 150, 150); border-right-style: solid; height: 19px;"></td><td  style="height: 19px; border: 1px solid rgb(150, 150, 150);">confirm-refresh-text</td><td  style="height: 19px; border: 1px solid rgb(150, 150, 150);">刷新提示文本</td><td  style="height: 19px;"></td><td  style="height: 19px;"></td><td  style="height: 19px;"></td><td  style="height: 19px;"></td></tr>
     <tr><td ></td><td  style="border-right-width: 1px; border-right-color: rgb(150, 150, 150); border-right-style: solid; height: 19px;"></td><td  style="height: 19px; border: 1px solid rgb(150, 150, 150);">auto-load</td><td  style="height: 19px; border: 1px solid rgb(150, 150, 150);">自动加载数据，和auto-new属性互斥</td><td  style="height: 19px;"></td><td  style="height: 19px;"></td><td  style="height: 19px;"></td><td  style="height: 19px;"></td></tr>
     <tr><td ></td><td  style="border-right-width: 1px; border-right-color: rgb(150, 150, 150); border-right-style: solid; height: 19px;"></td><td  style="height: 19px; border: 1px solid rgb(150, 150, 150);">auto-new</td><td  style="height: 19px; border: 1px solid rgb(150, 150, 150);">自动新增数据，和auto-load属性互斥</td><td  style="height: 19px;"></td><td  style="height: 19px;"></td><td  style="height: 19px;"></td><td  style="height: 19px;"></td></tr>
  </table>
]]></layout-content>
              </div>
            </div>  
            <div class="tab-pane" xid="tabContent11">
              <div class="x-cell-layout" component="$UI/system/components/justep/cellLayout/cellLayout"
                style="width:100%; height: 100%;" xid="cellLayout3">
                <layout-content xid="default3"><![CDATA[
  <table cellspacing="0" cellpadding="0" rowHeight="19" columnWidth="80" style="border-collapse:collapse;table-layout:fixed;width:1px;">
     <tr><td ></td><td  style="width: 15px;"></td><td  style="width: 200px;"></td><td  style="width: 800px;"></td><td ></td><td ></td><td ></td><td ></td></tr>
     <tr><td ></td><td  style="height: 19px;"></td><td  style="height: 19px;"></td><td  style="height: 19px;"></td><td  style="height: 19px;"></td><td  style="height: 19px;"></td><td  style="height: 19px;"></td><td  style="height: 19px;"></td></tr>
     <tr><td ></td><td  style="height: 19px;"></td><td  colSpan="2" style="height: 19px;">bizData组件是与业务层绑定的数据组件，通过指定的concept、reader、writer、creator自动处理数据的加载、保存、创建等逻辑。</td><td  style="height: 19px;"></td><td  style="height: 19px;"></td><td  style="height: 19px;"></td><td  style="height: 19px;"></td></tr>
     <tr><td ></td><td  style="height: 19px;"></td><td  colSpan="2" style="height: 19px;">bizData支持主从数据的关联、缓存和批请求，支持树形数据的定义和逐级延迟加载。</td><td  style="height: 19px;"></td><td  style="height: 19px;"></td><td  style="height: 19px;"></td><td  style="height: 19px;"></td></tr>
     <tr><td  style="height: 2px;"></td><td  style="height: 2px;"></td><td  style="height: 2px; border-bottom-width: 1px; border-bottom-color: rgb(150, 150, 150); border-bottom-style: solid;"></td><td  style="height: 2px; border-bottom-width: 1px; border-bottom-color: rgb(150, 150, 150); border-bottom-style: solid;"></td><td  style="height: 2px;"></td><td  style="height: 2px;"></td><td  style="height: 2px;"></td><td  style="height: 2px;"></td></tr>
     <tr><td  style="height: 18px;"></td><td  style="height: 18px; border-right-width: 1px; border-right-color: rgb(150, 150, 150); border-right-style: solid;"></td><td  style="height: 18px; border: 1px solid rgb(150, 150, 150); text-align: center; font-weight: bold;">属性</td><td  style="height: 18px; border: 1px solid rgb(150, 150, 150); text-align: center; font-weight: bold;">说明</td><td  style="height: 18px;"></td><td  style="height: 18px;"></td><td  style="height: 18px;"></td><td  style="height: 18px;"></td></tr>
     <tr><td ></td><td  style="height: 19px; border-right-width: 1px; border-right-color: rgb(150, 150, 150); border-right-style: solid;"></td><td  style="height: 19px; border: 1px solid rgb(150, 150, 150);">concept</td><td  style="height: 19px; border: 1px solid rgb(150, 150, 150);">指定数据对应的概念</td><td  style="height: 19px;"></td><td  style="height: 19px;"></td><td  style="height: 19px;"></td><td  style="height: 19px;"></td></tr>
     <tr><td ></td><td  style="height: 19px; border-right-width: 1px; border-right-color: rgb(150, 150, 150); border-right-style: solid;"></td><td  style="height: 19px; border: 1px solid rgb(150, 150, 150);">reader</td><td  style="height: 19px; border: 1px solid rgb(150, 150, 150);">指定加载数据使用的queryAction</td><td  style="height: 19px;"></td><td  style="height: 19px;"></td><td  style="height: 19px;"></td><td  style="height: 19px;"></td></tr>
     <tr><td ></td><td  style="height: 19px; border-right-width: 1px; border-right-color: rgb(150, 150, 150); border-right-style: solid;"></td><td  style="height: 19px; border: 1px solid rgb(150, 150, 150);">writer</td><td  style="height: 19px; border: 1px solid rgb(150, 150, 150);">指定保存数据使用的saveAction</td><td  style="height: 19px;"></td><td  style="height: 19px;"></td><td  style="height: 19px;"></td><td  style="height: 19px;"></td></tr>
     <tr><td ></td><td  style="height: 19px; border-right-width: 1px; border-right-color: rgb(150, 150, 150); border-right-style: solid;"></td><td  style="height: 19px; border: 1px solid rgb(150, 150, 150);">creator</td><td  style="height: 19px; border: 1px solid rgb(150, 150, 150);">指定创建数据使用的createAction</td><td  style="height: 19px;"></td><td  style="height: 19px;"></td><td  style="height: 19px;"></td><td  style="height: 19px;"></td></tr>
     <tr><td ></td><td  style="height: 19px; border-right-width: 1px; border-right-color: rgb(150, 150, 150); border-right-style: solid;"></td><td  style="height: 19px; border: 1px solid rgb(150, 150, 150);">columns</td><td  style="height: 19px; border: 1px solid rgb(150, 150, 150);">指定页面返回的关系，为空时表示全部关系</td><td  style="height: 19px;"></td><td  style="height: 19px;"></td><td  style="height: 19px;"></td><td  style="height: 19px;"></td></tr>
     <tr><td ></td><td  style="height: 19px; border-right-width: 1px; border-right-color: rgb(150, 150, 150); border-right-style: solid;"></td><td  style="height: 19px; border: 1px solid rgb(150, 150, 150);">offset</td><td  style="height: 19px; border: 1px solid rgb(150, 150, 150);">初始偏移，指定数据集打开后定位到第几条数据</td><td  style="height: 19px;"></td><td  style="height: 19px;"></td><td  style="height: 19px;"></td><td  style="height: 19px;"></td></tr>
     <tr><td ></td><td  style="height: 19px; border-right-width: 1px; border-right-color: rgb(150, 150, 150); border-right-style: solid;"></td><td  style="height: 19px; border: 1px solid rgb(150, 150, 150);">limit</td><td  style="height: 19px; border: 1px solid rgb(150, 150, 150);">数据分页的每页记录数，-1表示不分页</td><td  style="height: 19px;"></td><td  style="height: 19px;"></td><td  style="height: 19px;"></td><td  style="height: 19px;"></td></tr>
     <tr><td ></td><td  style="height: 19px; border-right-width: 1px; border-right-color: rgb(150, 150, 150); border-right-style: solid;"></td><td  style="height: 19px; border: 1px solid rgb(150, 150, 150);">orderBy</td><td  style="height: 19px; border: 1px solid rgb(150, 150, 150);">数据的排序方式</td><td  style="height: 19px;"></td><td  style="height: 19px;"></td><td  style="height: 19px;"></td><td  style="height: 19px;"></td></tr>
     <tr><td ></td><td  style="height: 19px; border-right-width: 1px; border-right-color: rgb(150, 150, 150); border-right-style: solid;"></td><td  style="height: 19px; border: 1px solid rgb(150, 150, 150);">updateMode</td><td  style="height: 19px; border: 1px solid rgb(150, 150, 150);">数据更新模式：whereVersion（基于version判断数据并发冲突），whereAll（基于数据的原始值判断数据并发冲突）。</td><td  style="height: 19px;"></td><td  style="height: 19px;"></td><td  style="height: 19px;"></td><td  style="height: 19px;"></td></tr>
  </table>
]]></layout-content>
              </div>
            </div>
          </div> 
        </div>
      </div>  
      <div class="tab-pane" xid="tabContent2">
        <div component="$UI/system/components/justep/excelLayout/excelLayout"
          class="x-excel-layout" style="width:100%; height: 100%;" xid="excelLayout1"
          src="events.xml"/>
      </div>  
      <div class="tab-pane" xid="tabContent3" style="height:496px;">
        <div class="x-cell-layout" component="$UI/system/components/justep/cellLayout/cellLayout"
          style="width:100%; height: 100%;" xid="cellLayout4">
          <layout-content xid="default4"><![CDATA[
  <table cellspacing="0" cellpadding="0" rowHeight="19" columnWidth="80" style="border-collapse:collapse;table-layout:fixed;width:1px;">
     <tr><td ></td><td  style="width: 15px;"></td><td  style="width: 800px;"></td></tr>
     <tr><td ></td><td  style="height: 19px;"></td><td  style="height: 19px;"></td></tr>
     <tr><td ></td><td  style="height: 19px;"></td><td  style="height: 19px; font-weight: bold;">data组件的数据定义：</td></tr>
     <tr><td ></td><td  style="height: 19px;"></td><td  style="height: 19px;">　　数据结构：选中data组件，右键菜单中点击编辑列，在列编辑窗口中定义列名、数据类型、显示名称。</td></tr>
     <tr><td ></td><td  style="height: 19px;"></td><td  style="height: 19px;">　　初始数据：</td></tr>
     <tr><td ></td><td  style="height: 19px;"></td><td  style="height: 19px;">　　　　1、通过右键菜单“编辑数据”，在组件中内置初始数据。</td></tr>
     <tr><td ></td><td  style="height: 19px;"></td><td  style="height: 19px;">　　　　2、通过loadData函数加载json数据</td></tr>
     <tr><td ></td><td  style="height: 19px;"></td><td  style="height: 19px;">　　　</td></tr>
     <tr><td  style="height: 10px;"></td><td  style="height: 10px;"></td><td  style="height: 10px;"></td></tr>
     <tr><td ></td><td  style="height: 19px;"></td><td  style="height: 19px; font-weight: bold;">bizData组件的数据定义：</td></tr>
     <tr><td ></td><td  style="height: 19px;"></td><td  style="height: 19px;">　　概念：通过concept属性指定概念。</td></tr>
     <tr><td ></td><td  style="height: 19px;"></td><td  style="height: 19px;">　　动作：通过reader、writer和creator三个属性指定queryAction、saveAction和createAction。</td></tr>
     <tr><td ></td><td  style="height: 19px;"></td><td  style="height: 19px;">　　关系：通过colunms属性指定返回的数据列。</td></tr>
     <tr><td  style="height: 10px;"></td><td  style="height: 10px;"></td><td  style="height: 10px;"></td></tr>
     <tr><td ></td><td  style="height: 19px;"></td><td  style="height: 19px; font-weight: bold;">标准数据加载模式（通过上面的数据源定义加载数据）：</td></tr>
     <tr><td ></td><td  style="height: 19px;"></td><td  style="height: 19px;">　　1、自动加载模式：设置auto-load=true，数据模型初始化时（onModelConstructDone）数据组件会自动加载数据。</td></tr>
     <tr><td ></td><td  style="height: 19px;"></td><td  style="height: 19px; color: rgb(0, 0, 255);">　　2、组件延迟加载模式：gridSelect下拉选择组件中，为下拉数据源（option）提供了autoLoad属性，设置为true则在第一次下拉列表展开时自动加载数据。</td></tr>
     <tr><td ></td><td  style="height: 19px;"></td><td  style="height: 19px; color: rgb(0, 0, 255);">　　3、代码延迟加载模式：在代码中通过数据组件的loadData方法加载数据。本案例中每页数据都是延迟加载的，参见：tab页签的onSelect事件代码。</td></tr>
     <tr><td ></td><td  style="height: 19px;"></td><td  style="height: 19px;">　　注意：loadData和refreshData不同，loadData()只执行一次，内部判断数据加载后就不再执行；而refreshData()则每次强制重新加载。</td></tr>
     <tr><td  style="height: 10px;"></td><td  style="height: 10px;"></td><td  style="height: 10px;"></td></tr>
     <tr><td ></td><td  style="height: 19px;"></td><td  style="height: 19px; font-weight: bold;">动态数据加载模式：</td></tr>
     <tr><td ></td><td  style="height: 19px;"></td><td  style="height: 19px;">　　在代码中，通过数据组件的loadData方法动态加载。参见：“动作案例/调用动作”中的“返回Table”。</td></tr>
  </table>
]]></layout-content>
        </div>
      </div>  
      <div class="tab-pane" xid="tabContent4">
        <div class="x-cell-layout" component="$UI/system/components/justep/cellLayout/cellLayout"
          style="height:87px;width:100%;" xid="cellLayout5">
          <layout-content xid="default5"><![CDATA[
  <table cellspacing="0" cellpadding="0" rowHeight="19" columnWidth="80" style="border-collapse:collapse;table-layout:fixed;width:1px;">
     <tr><td ></td><td  style="width: 15px;"></td><td  style="width: 800px;"></td></tr>
     <tr><td ></td><td  style="height: 19px;"></td><td  style="height: 19px;"></td></tr>
     <tr><td ></td><td  style="height: 19px;"></td><td  style="height: 19px;">数据组件为其他数据感知组件提供数据源，数据感知组件一般通过bind-ref属性指定关联的数据。</td></tr>
  </table>
]]></layout-content>
        </div>  
        <div component="$UI/system/components/justep/grid/grid" hiddenCaptionbar="true"
          altRows="true" class="x-grid-no-bordered" xid="gridReference_Orders" data="dReference_Orders"
          height="200" width="100%"> 
          <columns xid="columns1">
            <column width="100" name="fOrderNumber" xid="column1"/>  
            <column width="100" name="fOrderDate" xid="column2"/>  
            <column width="100" name="fShipName" xid="column3"/>  
            <column width="100" name="fShipAddress" xid="column4"/>  
            <column width="100" name="fCompanyName" xid="column5"/>  
            <column width="100" name="fContactName" xid="column6"/>  
            <column width="100" name="fPhone" xid="column7"/>
          </columns>
        </div>  
        <div component="$UI/system/components/justep/controlGroup/controlGroup"
          class="x-control-group" xid="controlGroup1" collapsible="true"> 
          <div class="x-control-group-title" xid="controlGroupTitle1"> 
            <span xid="span5_1"><![CDATA[]]></span>
          </div>  
          <div class="form-horizontal container-fluid" component="$UI/system/components/bootstrap/form/form(bootstrap)"
            xid="form1"> 
            <div class="form-group" xid="formGroup1"> 
              <div class="col-sm-2" xid="col13"> 
                <label class="control-label" xid="controlLabel1"><![CDATA[订单编号:]]></label>
              </div>  
              <div class="col-sm-4" xid="col14"> 
                <input component="$UI/system/components/justep/input/input" class="form-control"
                  xid="input6" bind-ref="dReference_Orders.ref('fOrderNumber')"/>
              </div>  
              <div class="col-sm-2" xid="col15"> 
                <label class="control-label" xid="controlLabel2"><![CDATA[订单日期:]]></label>
              </div>  
              <div class="col-sm-4" xid="col16"> 
                <input component="$UI/system/components/justep/input/input" class="form-control"
                  xid="input7" bind-ref="dReference_Orders.ref('fOrderDate')"/>
              </div> 
            </div>  
            <div class="form-group" xid="formGroup2"> 
              <div class="col-sm-2" xid="col17"> 
                <label class="control-label" xid="controlLabel3"><![CDATA[收货人:]]></label>
              </div>  
              <div class="col-sm-4" xid="col18"> 
                <input component="$UI/system/components/justep/input/input" class="form-control"
                  xid="input8" bind-ref="dReference_Orders.ref('fShipName')"/>
              </div>  
              <div class="col-sm-2" xid="col19"> 
                <label class="control-label" xid="controlLabel4"><![CDATA[收货地址:]]></label>
              </div>  
              <div class="col-sm-4" xid="col20"> 
                <input component="$UI/system/components/justep/input/input" class="form-control"
                  xid="input9" bind-ref="dReference_Orders.ref('fShipAddress')"/>
              </div> 
            </div>  
            <div class="form-group" xid="formGroup3"> 
              <div class="col-sm-2" xid="col7"> 
                <label class="control-label" xid="controlLabel5"><![CDATA[公司名称:]]></label>
              </div>  
              <div class="col-sm-4" xid="col6"> 
                <input component="$UI/system/components/justep/input/input" class="form-control"
                  xid="input3" bind-ref="dReference_Orders.ref('fCompanyName')"/>
              </div>  
              <div class="col-sm-2" xid="col4"> 
                <label class="control-label" xid="controlLabel6"><![CDATA[联系人名称:]]></label>
              </div>  
              <div class="col-sm-4" xid="col5"> 
                <input component="$UI/system/components/justep/input/input" class="form-control"
                  xid="input2" bind-ref="dReference_Orders.ref('fContactName')"/>
              </div> 
            </div>  
            <div class="form-group" xid="formGroup4"> 
              <div class="col-sm-2" xid="col10"> 
                <label class="control-label" xid="controlLabel7"><![CDATA[电话:]]></label>
              </div>  
              <div class="col-sm-4" xid="col11"> 
                <input component="$UI/system/components/justep/input/input" class="form-control"
                  xid="input4" bind-ref="dReference_Orders.ref('fPhone')"/>
              </div> 
            </div>
          </div> 
        </div>
      </div>  
      <div class="tab-pane" xid="tabContent5">
        <div class="x-cell-layout" component="$UI/system/components/justep/cellLayout/cellLayout"
          style="width:100%;height:300px;" xid="cellLayout6">
          <layout-content xid="default9"><![CDATA[
  <table cellspacing="0" cellpadding="0" rowHeight="19" columnWidth="80" style="border-collapse:collapse;table-layout:fixed;width:1px;">
     <tr><td ></td><td  style="width: 15px;"></td><td  style="width: 800px;"></td><td ></td><td ></td><td ></td><td ></td><td ></td></tr>
     <tr><td ></td><td  style="height: 19px;"></td><td  style="height: 19px;"></td><td  style="height: 19px;"></td><td  style="height: 19px;"></td><td  style="height: 19px;"></td><td  style="height: 19px;"></td><td  style="height: 19px;"></td></tr>
     <tr><td ></td><td  style="height: 19px;"></td><td  style="height: 19px;">在bizData组件中除了QueryAction返回的数据关系，还可以定义临时的计算关系，用于界面上的计算和显示。</td><td  style="height: 19px;"></td><td  style="height: 19px;"></td><td  style="height: 19px;"></td><td  style="height: 19px;"></td><td  style="height: 19px;"></td></tr>
     <tr><td  style="height: 10px;"></td><td  style="height: 10px;"></td><td  style="height: 10px;"></td><td  style="height: 10px;"></td><td  style="height: 10px;"></td><td  style="height: 10px;"></td><td  style="height: 10px;"></td><td  style="height: 10px;"></td></tr>
     <tr><td ></td><td  style="height: 19px;"></td><td  style="height: 19px;">下面的案例展示计算关系常见的几种使用场景：</td><td  style="height: 19px;"></td><td  style="height: 19px;"></td><td  style="height: 19px;"></td><td  style="height: 19px;"></td><td  style="height: 19px;"></td></tr>
     <tr><td ></td><td  style="height: 19px;"></td><td  style="height: 19px; font-weight: bold;">　　1、用于bizData中的临时计算列</td><td  style="height: 19px;"></td><td  style="height: 19px;"></td><td  style="height: 19px;"></td><td  style="height: 19px;"></td><td  style="height: 19px;"></td></tr>
     <tr><td ></td><td  style="height: 19px;"></td><td  style="height: 19px;">　　　　1）从bizData的右键菜单中选择“增加计算关系”，设置name、label和type</td><td  style="height: 19px;"></td><td  style="height: 19px;"></td><td  style="height: 19px;"></td><td  style="height: 19px;"></td><td  style="height: 19px;"></td></tr>
     <tr><td ></td><td  style="height: 19px;"></td><td  style="height: 19px;">　　　　2）从bizData的右键菜单中选择“编辑规则”，选择对应列</td><td  style="height: 19px;"></td><td  style="height: 19px;"></td><td  style="height: 19px;"></td><td  style="height: 19px;"></td><td  style="height: 19px;"></td></tr>
     <tr><td ></td><td  style="height: 19px;"></td><td  style="height: 19px;">　　　　3）在数据规则的calculate中设置计算表达式（参见“数据规则”）</td><td  style="height: 19px;"></td><td  style="height: 19px;"></td><td  style="height: 19px;"></td><td  style="height: 19px;"></td><td  style="height: 19px;"></td></tr>
     <tr><td ></td><td  style="height: 19px;"></td><td  style="height: 19px; font-weight: bold;">　    2、用于指定来源于QueryAction中自定义字段的数据类型：</td><td  style="height: 19px;"></td><td  style="height: 19px;"></td><td  style="height: 19px;"></td><td  style="height: 19px;"></td><td  style="height: 19px;"></td></tr>
     <tr><td ></td><td  style="height: 19px;"></td><td  style="height: 19px;">　　　　由于自定义字段没有模型定义，所以需要在bizData组件中通过计算关系来指定数据类型。</td><td  style="height: 19px;"></td><td  style="height: 19px;"></td><td  style="height: 19px;"></td><td  style="height: 19px;"></td><td  style="height: 19px;"></td></tr>
     <tr><td ></td><td  style="height: 19px;"></td><td  style="height: 19px; padding-left: 24px;">　</td><td  style="height: 19px;"></td><td  style="height: 19px;"></td><td  style="height: 19px;"></td><td  style="height: 19px;"></td><td  style="height: 19px;"></td></tr>
  </table>
]]></layout-content>
        </div>  
        <div component="$UI/system/components/justep/grid/grid" hiddenCaptionbar="true"
          altRows="true" class="x-grid-no-bordered" xid="grid2" data="dCalculate_OrderDetails"
          height="200" showRowNumber="true" multiselect="false" width="100%"> 
          <columns xid="columns2">
            <column width="100" name="fProductName" xid="column12"/>
            <column width="100" name="fQuantityPerUnit" xid="column13"/>
            <column width="100" name="fUnitPrice" xid="column8" editable="true">
              <editor xid="editor1"> 
                <input component="$UI/system/components/justep/input/input" class="form-control"
                  xid="input10" bind-ref="ref('fUnitPrice')"/>
              </editor>
            </column>  
            <column width="100" name="fQuantity" xid="column9" editable="true">
              <editor xid="editor2"> 
                <input component="$UI/system/components/justep/input/input" class="form-control"
                  xid="input11" bind-ref="ref('fQuantity')"/>
              </editor>
            </column>  
            <column width="100" name="fDiscount" xid="column10"/>  
            <column width="100" name="fMoney" xid="column11" label="金额" formatter="number"/> 
          </columns>
        </div>
      </div>  
      <div class="tab-pane" xid="tabContent6">
        <div component="$UI/system/components/bootstrap/tabs/tabs" xid="tabs4"> 
          <ul class="nav nav-tabs" xid="ul4"> 
            <li class="active" xid="li14"> 
              <a content="tabContent14" xid="tabItem3"><![CDATA[概述]]></a>
            </li>  
            <li role="presentation" xid="li15"> 
              <a content="tabContent15" xid="tabItem4"><![CDATA[案例]]></a>
            </li> 
          </ul>  
          <div class="tab-content" xid="div4_1"> 
            <div class="tab-pane active" xid="tabContent14">
              <div class="x-cell-layout" component="$UI/system/components/justep/cellLayout/cellLayout"
                style="width:100%; height: 100%;" xid="cellLayout7">
                <layout-content xid="default11"><![CDATA[
  <table cellspacing="0" cellpadding="0" rowHeight="19" columnWidth="80" style="border-collapse:collapse;table-layout:fixed;width:1px;">
     <tr><td ></td><td  style="width: 15px;"></td><td  style="width: 800px;"></td></tr>
     <tr><td ></td><td  style="height: 19px;"></td><td  style="height: 19px;"></td></tr>
     <tr><td ></td><td  style="height: 19px;"></td><td  style="height: 19px;">数据组件支持数据规则的设置和解析，数据规则包含：必须、只读、计算、约束。</td></tr>
     <tr><td  style="height: 19px;"></td><td  style="height: 19px;"></td><td  style="height: 19px; font-weight: bold;">开发者通过数据组件右键菜单中的“编辑规则”，定义概念规则或关系规则。</td></tr>
     <tr><td ></td><td  style="height: 19px;"></td><td  style="height: 19px;">　　概念规则是行规则，作用于整行数据，可以定义的规则只有“只读”规则。</td></tr>
     <tr><td ></td><td  style="height: 19px;"></td><td  style="height: 19px;">　　关系规则是列规则，作用于指定列数据，可以定义全部规则类型：必须、只读、计算、约束。</td></tr>
     <tr><td  style="height: 10px;"></td><td  style="height: 10px;"></td><td  style="height: 10px;"></td></tr>
     <tr><td  style="height: 19px;"></td><td  style="height: 19px;"></td><td  style="height: 19px; font-weight: bold;">数据规则采用表达式定义，其中：</td></tr>
     <tr><td ></td><td  style="height: 19px;"></td><td  style="height: 19px;">　　必须、只读、计算、约束规则采用表达式，除了可以使用基本函数外，还支持Javascript函数扩展。</td></tr>
     <tr><td ></td><td  style="height: 19px;"></td><td  style="height: 19px;"></td></tr>
     <tr><td  style="height: 10px;"></td><td  style="height: 10px;"></td><td  style="height: 10px;"></td></tr>
     <tr><td ></td><td  style="height: 19px;"></td><td  style="height: 19px; font-weight: bold;">规则属性说明：</td></tr>
     <tr><td ></td><td  style="height: 19px;"></td><td  style="height: 19px;"></td></tr>
     <tr><td ></td><td  style="height: 19px;"></td><td  style="height: 19px;">　　required - 必须：当表达式计算结果为真，且数据为空时，关联的感知组件中会显示红色波浪线，并且数据不能保存显示提示alert。</td></tr>
     <tr><td ></td><td  style="height: 19px;"></td><td  style="height: 19px;">　　readonly - 只读：当表达式计算结果为真时，关联的感知组件不能编辑。</td></tr>
     <tr><td ></td><td  style="height: 19px;"></td><td  style="height: 19px;">　</td></tr>
     <tr><td ></td><td  style="height: 19px;"></td><td  style="height: 19px;">　　calculate - 计算：表达式会自动计算把结果写入当前列数据，关联的感知组件会自动显示计算后的结果。</td></tr>
     <tr><td ></td><td  style="height: 19px;"></td><td  style="height: 19px;">　　constraint - 约束：当表达式计算结果为假时，关联的感知组件中会显示红色波浪线，并且数据不能保存显示提示alert。</td></tr>
     <tr><td ></td><td  style="height: 19px;"></td><td  style="height: 19px;"></td></tr>
     <tr><td  style="height: 10px;"></td><td  style="height: 10px;"></td><td  style="height: 10px;"></td></tr>
     <tr><td ></td><td  style="height: 19px;"></td><td  style="height: 19px; font-weight: bold;">规则中调用js函数写法</td></tr>
     <tr><td ></td><td  style="height: 19px;"></td><td  style="height: 19px;">　　$model.函数名()</td></tr>
     <tr><td  style="height: 10px;"></td><td  style="height: 10px;"></td><td  style="height: 10px;"></td></tr>
     <tr><td ></td><td  style="height: 19px;"></td><td  style="height: 19px; color: rgb(255, 0, 0);">注意：</td></tr>
     <tr><td ></td><td  style="height: 19px;"></td><td  style="height: 19px; color: rgb(255, 0, 0);">　　1、由于没有修改的数据行不需要保存，所以保存时默认不验证未修改的数据行的规则。</td></tr>
     <tr><td ></td><td  style="height: 19px;"></td><td  style="height: 19px; color: rgb(255, 0, 0);">　　　开发者可以通过数据对象的validOnlyChangeData属性值控制是否验证所有数据（false表示验证所有数据）。</td></tr>
     <tr><td ></td><td  style="height: 19px;"></td><td  style="height: 19px; color: rgb(255, 0, 0);">　　2、数据规则的运算默认是被优化的，数据加载时只计算当前行的数据规则。</td></tr>
     <tr><td ></td><td  style="height: 19px;"></td><td  style="height: 19px; color: rgb(255, 0, 0);">　　　</td></tr>
  </table>
]]></layout-content>
              </div>
            </div>  
            <div class="tab-pane" xid="tabContent15">
              <div class="x-cell-layout" component="$UI/system/components/justep/cellLayout/cellLayout"
                style="width:100%;height:360px;" xid="cellLayout8"> 
                <layout-content xid="default12"><![CDATA[
  <table cellspacing="0" cellpadding="0" rowHeight="19" columnWidth="80" style="border-collapse:collapse;table-layout:fixed;width:1px;">
     <tr><td ></td><td  style="width: 15px;"></td><td  style="width: 160px;"></td><td  style="width: 150px;"></td><td  style="width: 160px;"></td><td  style="width: 800px;"></td><td ></td><td ></td></tr>
     <tr><td ></td><td  style="height: 19px;"></td><td  style="height: 19px;"></td><td  style="height: 19px;"></td><td  style="height: 19px;"></td><td  style="height: 19px;"></td><td  style="height: 19px;"></td><td  style="height: 19px;"></td></tr>
     <tr><td ></td><td  style="height: 19px; border-right-width: 1px; border-right-color: rgb(150, 150, 150); border-right-style: solid;"></td><td  style="height: 19px; text-align: center; border: 1px solid rgb(150, 150, 150); font-weight: bold;">数据组件</td><td  style="height: 19px; text-align: center; border: 1px solid rgb(150, 150, 150); font-weight: bold;">规则项</td><td  style="height: 19px; text-align: center; border: 1px solid rgb(150, 150, 150); font-weight: bold;">规则属性</td><td  style="height: 19px; text-align: center; border: 1px solid rgb(150, 150, 150); font-weight: bold;">表达式</td><td  style="height: 19px;"></td><td  style="height: 19px;"></td></tr>
     <tr><td ></td><td  style="height: 19px;"></td><td  rowSpan="4" style="height: 76px; border: 1px solid rgb(150, 150, 150);">dRule_Orders</td><td  rowSpan="2" style="height: 38px; border: 1px solid rgb(150, 150, 150);">DEMO_Orders</td><td  style="height: 19px; border: 1px solid rgb(150, 150, 150);">readonly</td><td  style="height: 19px; border: 1px solid rgb(150, 150, 150);">js:val("fStatus")== 'shipped'</td><td  style="height: 19px;"></td><td  style="height: 19px;"></td></tr>
     <tr><td ></td><td  style="height: 19px;"></td><td  style="height: 19px; border: 1px solid rgb(150, 150, 150);">行只读规则</td><td  style="height: 19px; border: 1px solid rgb(150, 150, 150);">已发货的数据只读，不能修改</td><td  style="height: 19px;"></td><td  style="height: 19px;"></td></tr>
     <tr><td ></td><td  style="height: 19px;"></td><td  rowSpan="2" style="height: 38px; border: 1px solid rgb(150, 150, 150);">fTotalMoney</td><td  style="height: 19px; border: 1px solid rgb(150, 150, 150);">calculate</td><td  style="height: 19px; border: 1px solid rgb(150, 150, 150); color: rgb(0, 0, 255);">$model.comp('dRule_OrderDetails').sum('fMoney')</td><td  style="height: 19px;"></td><td  style="height: 19px;"></td></tr>
     <tr><td ></td><td  style="height: 19px;"></td><td  style="height: 19px; border: 1px solid rgb(150, 150, 150);">列计算规则</td><td  style="height: 19px; border: 1px solid rgb(150, 150, 150); color: rgb(0, 0, 255);">计算合计金额</td><td  style="height: 19px;"></td><td  style="height: 19px;"></td></tr>
     <tr><td ></td><td  style="height: 19px;"></td><td  rowSpan="10" style="height: 190px; border: 1px solid rgb(150, 150, 150);">dRule_OrderDetails</td><td  rowSpan="2" style="height: 38px; border: 1px solid rgb(150, 150, 150);">DEMO_OrderDetails</td><td  style="height: 19px; border: 1px solid rgb(150, 150, 150);">readonly</td><td  style="height: 19px; border: 1px solid rgb(150, 150, 150);">$model.dRule_Orders.val("fStatus")== 'shipped'</td><td  style="height: 19px;"></td><td  style="height: 19px;"></td></tr>
     <tr><td ></td><td  style="height: 19px;"></td><td  style="height: 19px; border: 1px solid rgb(150, 150, 150);">行只读规则</td><td  style="height: 19px; border: 1px solid rgb(150, 150, 150);">已发货的数据只读，不能修改</td><td  style="height: 19px;"></td><td  style="height: 19px;"></td></tr>
     <tr><td ></td><td  style="height: 19px;"></td><td  rowSpan="2" style="height: 38px; border: 1px solid rgb(150, 150, 150);">fMoney</td><td  style="height: 19px; border: 1px solid rgb(150, 150, 150);">calculate</td><td  style="height: 19px; border: 1px solid rgb(150, 150, 150);">$row.val("fQuantity") * $row.val("fUnitPrice") *(1-   $row.val("fDiscount"))</td><td  style="height: 19px;"></td><td  style="height: 19px;"></td></tr>
     <tr><td ></td><td  style="height: 19px;"></td><td  style="height: 19px; border: 1px solid rgb(150, 150, 150);">列计算规则</td><td  style="height: 19px; border: 1px solid rgb(150, 150, 150);">计算明细金额</td><td  style="height: 19px;"></td><td  style="height: 19px;"></td></tr>
     <tr><td ></td><td  style="height: 19px; border-right-width: 1px; border-right-color: rgb(150, 150, 150); border-right-style: solid;"></td><td  rowSpan="2" style="height: 38px; border: 1px solid rgb(150, 150, 150);">fQuantity</td><td  style="height: 19px; border: 1px solid rgb(150, 150, 150);">constraint</td><td  style="height: 19px; border: 1px solid rgb(150, 150, 150);">val("fQuantity") &gt;= 0</td><td  style="height: 19px;"></td><td  style="height: 19px;"></td></tr>
     <tr><td ></td><td  style="height: 19px; border-right-width: 1px; border-right-color: rgb(150, 150, 150); border-right-style: solid;"></td><td  style="height: 19px; border: 1px solid rgb(150, 150, 150);">列约束规则</td><td  style="height: 19px; border: 1px solid rgb(150, 150, 150);">数量不能小于零（保存数据时生效）</td><td  style="height: 19px;"></td><td  style="height: 19px;"></td></tr>
     <tr><td ></td><td  style="height: 19px; border-right-width: 1px; border-right-color: rgb(150, 150, 150); border-right-style: solid;"></td><td  rowSpan="2" style="height: 38px; border: 1px solid rgb(150, 150, 150);">fUnitPrice</td><td  style="height: 19px; border: 1px solid rgb(150, 150, 150);">constraint</td><td  style="height: 19px; border: 1px solid rgb(150, 150, 150);">val("fUnitPrice") &gt;= 0</td><td  style="height: 19px;"></td><td  style="height: 19px;"></td></tr>
     <tr><td ></td><td  style="height: 19px; border-right-width: 1px; border-right-color: rgb(150, 150, 150); border-right-style: solid;"></td><td  style="height: 19px; border: 1px solid rgb(150, 150, 150);">列约束规则</td><td  style="height: 19px; border: 1px solid rgb(150, 150, 150);">单价不能小于零（保存数据时生效）</td><td  style="height: 19px;"></td><td  style="height: 19px;"></td></tr>
     <tr><td ></td><td  style="height: 19px; border-right-width: 1px; border-right-color: rgb(150, 150, 150); border-right-style: solid;"></td><td  rowSpan="2" style="height: 38px; border: 1px solid rgb(150, 150, 150);">fDiscount</td><td  style="height: 19px; border: 1px solid rgb(150, 150, 150);">constraint</td><td  style="height: 19px; border: 1px solid rgb(150, 150, 150);">val("fDiscount") &gt;= 0</td><td  style="height: 19px;"></td><td  style="height: 19px;"></td></tr>
     <tr><td ></td><td  style="height: 19px; border-right-width: 1px; border-right-color: rgb(150, 150, 150); border-right-style: solid;"></td><td  style="height: 19px; border: 1px solid rgb(150, 150, 150);">列约束规则</td><td  style="height: 19px; border: 1px solid rgb(150, 150, 150);">折扣不能小于零（保存数据时生效）</td><td  style="height: 19px;"></td><td  style="height: 19px;"></td></tr>
     <tr><td ></td><td  style="height: 19px;"></td><td  style="height: 19px;"></td><td  style="height: 19px;"></td><td  style="height: 19px;"></td><td  style="height: 19px;"></td><td  style="height: 19px;"></td><td  style="height: 19px;"></td></tr>
     <tr><td ></td><td  style="height: 19px;"></td><td  style="height: 19px;"></td><td  style="height: 19px;"></td><td  style="height: 19px;"></td><td  style="height: 19px;"></td><td  style="height: 19px;"></td><td  style="height: 19px;"></td></tr>
     <tr><td ></td><td  style="height: 19px;"></td><td  style="height: 19px;"></td><td  style="height: 19px;"></td><td  style="height: 19px;"></td><td  style="height: 19px;"></td><td  style="height: 19px;"></td><td  style="height: 19px;"></td></tr>
  </table>
]]></layout-content> 
              </div>  
              <div component="$UI/system/components/bootstrap/row/row" class="row"
                xid="row1"> 
                <div class="col col-xs-1 col-sm-12 col-md-12 col-lg-12" xid="col9">
                  <div component="$UI/system/components/justep/toolBar/toolBar"
                    class="x-toolbar form-inline x-toolbar-spliter x-cell-control"
                    xid="toolBar1"> 
                    <label xid="label1">状态</label>  
                    <div class="x-control" component="$UI/system/components/justep/gridFilter/gridFilter"
                      xid="gridFilter1" filterData="dRule_Orders" filterCol="fStatus"> 
                      <div class="x-gridSelect" component="$UI/system/components/justep/gridSelect/gridSelect"
                        xid="gridSelect1"> 
                        <option xid="option1" data="dRule_Status" value="key"
                          label="value"/>
                      </div> 
                    </div>  
                    <a component="$UI/system/components/justep/button/button"
                      class="btn btn-default" label="查询" xid="button1" icon="icon-android-search"
                      onClick="{operation:'dRule_Orders.refresh'}"> 
                      <i xid="i1" class="icon-android-search"/>  
                      <span xid="span8">查询</span>
                    </a>  
                    <label xid="label2" style="color:#FF0000;">注意：状态是“已发货”的数据按规则是只读的</label> 
                  </div>
                </div>
                <div class="col col-xs-6 col-sm-6 col-md-6 col-lg-6" xid="col1">
                  <div component="$UI/system/components/justep/grid/grid" hiddenCaptionbar="true"
                    altRows="true" class="x-grid-no-bordered" xid="grid1" data="dRule_Orders"
                    height="200"> 
                    <columns xid="columns3">
                      <column width="100" name="fOrderNumber" xid="column14" editable="true">
                        <editor xid="editor3"> 
                          <input component="$UI/system/components/justep/input/input"
                            class="form-control" xid="input12" bind-ref="ref('fOrderNumber')"/>
                        </editor>
                      </column>  
                      <column width="60" name="fStatusName" xid="column18" label="状态"
                        editable="true">
                        <editor xid="editor4"> 
                          <input component="$UI/system/components/justep/input/input"
                            class="form-control" xid="input13" bind-ref="ref('fStatusName')"/>
                        </editor>
                      </column>
                      <column width="60" name="fShipName" xid="column15" editable="true">
                        <editor xid="editor5"> 
                          <input component="$UI/system/components/justep/input/input"
                            class="form-control" xid="input14" bind-ref="ref('fShipName')"/>
                        </editor>
                      </column>  
                      <column width="100" name="fShipAddress" xid="column16" editable="true">
                        <editor xid="editor6"> 
                          <input component="$UI/system/components/justep/input/input"
                            class="form-control" xid="input15" bind-ref="ref('fShipAddress')"/>
                        </editor>
                      </column>  
                      <column width="100" name="fTotalMoney" xid="column17" label="金额"
                        editable="true">
                        <editor xid="editor7"> 
                          <input component="$UI/system/components/justep/input/input"
                            class="form-control" xid="input16" bind-ref="ref('fTotalMoney')"/>
                        </editor>
                      </column> 
                    </columns>
                  </div>
                </div>  
                <div class="col col-xs-6 col-sm-6 col-md-6 col-lg-6" xid="col2">
                  <div component="$UI/system/components/justep/grid/grid" hiddenCaptionbar="true"
                    altRows="true" class="x-grid-no-bordered" xid="grid3" data="dRule_OrderDetails"
                    height="200"> 
                    <columns xid="columns4">
                      <column width="100" name="fProductName" xid="column23" editable="true">
                        <editor xid="editor8"> 
                          <input component="$UI/system/components/justep/input/input"
                            class="form-control" xid="input17" bind-ref="ref('fProductName')"/>
                        </editor>
                      </column>
                      <column width="100" name="fUnitPrice" xid="column19" editable="true">
                        <editor xid="editor9"> 
                          <input component="$UI/system/components/justep/input/input"
                            class="form-control" xid="input18" bind-ref="ref('fUnitPrice')"/>
                        </editor>
                      </column>  
                      <column width="100" name="fQuantity" xid="column20" editable="true">
                        <editor xid="editor13"> 
                          <input component="$UI/system/components/justep/input/input"
                            class="form-control" xid="input22" bind-ref="ref('fQuantity')"/>
                        </editor>
                      </column>
                      <column width="100" name="fDiscount" xid="column21" editable="true">
                        <editor xid="editor11"> 
                          <input component="$UI/system/components/justep/input/input"
                            class="form-control" xid="input20" bind-ref="ref('fDiscount')"/>
                        </editor>
                      </column>  
                      <column width="100" name="fMoney" xid="column22" editable="true">
                        <editor xid="editor12"> 
                          <input component="$UI/system/components/justep/input/input"
                            class="form-control" xid="input21" bind-ref="ref('fMoney')"/>
                        </editor>
                      </column> 
                    </columns>
                  </div>
                </div> 
              </div>
            </div>
          </div> 
        </div>
      </div>  
      <div class="tab-pane" xid="tabContent7">
        <div class="x-cell-layout" component="$UI/system/components/justep/cellLayout/cellLayout"
          style="width:100%;height:270px;" xid="cellLayout9">
          <layout-content xid="default20"><![CDATA[
  <table cellspacing="0" cellpadding="0" rowHeight="19" columnWidth="80" style="border-collapse:collapse;table-layout:fixed;width:1px;">
     <tr><td ></td><td  style="width: 15px;"></td><td  style="width: 1000px;"></td></tr>
     <tr><td ></td><td  style="height: 19px;"></td><td  style="height: 19px;"></td></tr>
     <tr><td  style="height: 19px;"></td><td  style="height: 19px;"></td><td  style="height: 19px; font-weight: bold;">bizData组件支持数据分页加载：</td></tr>
     <tr><td  style="height: 19px;"></td><td  style="height: 19px;"></td><td  style="height: 19px;">　　1、在设计时通过bizData的limit属性指定每页的数据行数；</td></tr>
     <tr><td ></td><td  style="height: 19px;"></td><td  style="height: 19px;">　　2、配合分页导航组件实现数据分页加载模式。</td></tr>
     <tr><td ></td><td  style="height: 19px;"></td><td  style="height: 19px;"></td></tr>
     <tr><td ></td><td  style="height: 19px;"></td><td  style="height: 19px; font-weight: bold;">bizData组件支持数据排序，有以下三种使用方式：</td></tr>
     <tr><td ></td><td  style="height: 19px;"></td><td  style="height: 19px;">　　A、在设计时，通过order-by属性指定排序方式，参见：dOrderBy_Orders的order-by属性；</td></tr>
     <tr><td ></td><td  style="height: 19px;"></td><td  style="height: 19px;">　　B、在运行时，用代码通过setOrderBy(field,type)动态指定排序方式（type：0-desc；1-asc），参见：排序按钮的onClick事件；</td></tr>
     <tr><td ></td><td  style="height: 19px;"></td><td  style="height: 19px;">　　C、用户可以通过点击grid列头实现动态过滤，参见：下面grid中订单号、</td></tr>
     <tr><td ></td><td  style="height: 19px;"></td><td  style="height: 19px;">             运费、订单日期、需求日期、发货日期的列属性。</td></tr>
     <tr><td ></td><td  style="height: 19px;"></td><td  style="height: 19px;"></td></tr>
     <tr><td ></td><td  style="height: 19px;"></td><td  style="height: 19px; color: rgb(0, 0, 255);">“分页”和“排序”本质上是在刷新数据时利用QueryAction的limit、offset参数和orderBy参数，构造动态KSQL语句实现的。</td></tr>
  </table>
]]></layout-content>
        </div>  
        <div component="$UI/system/components/bootstrap/row/row" class="row"
          xid="row3"> 
          <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col21">
            <div component="$UI/system/components/justep/labelEdit/labelEdit"
              class="x-label-edit" xid="labelEdit1"> 
              <label class="x-label" xid="label7" style="width:100px;"><![CDATA[排序字段]]></label>  
              <div class="x-edit" xid="div8">
                <div class="x-gridSelect" component="$UI/system/components/justep/gridSelect/gridSelect"
                  xid="gridSelect2" bind-ref="dTemp.ref('field')" bind-labelRef="dTemp.ref('fieldLabel')"> 
                  <option xid="option2" data="dOrderBy_Fields" value="key" label="value"/>
                </div>
              </div>
            </div>
          </div>  
          <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col23">
            <div component="$UI/system/components/justep/labelEdit/labelEdit"
              class="x-label-edit" xid="labelEdit2"> 
              <label class="x-label" xid="label8" style="width:100px;"><![CDATA[排序方式]]></label>  
              <div class="x-edit" xid="div9">
                <div class="x-gridSelect" component="$UI/system/components/justep/gridSelect/gridSelect"
                  xid="gridSelect3" bind-ref="dTemp.ref('type')" bind-labelRef="dTemp.ref('typeLabel')"> 
                  <option xid="option3" data="dOrderBy_Type" label="value" value="key"/>
                </div>
              </div>
            </div>
          </div>  
          <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col24">
            <a component="$UI/system/components/justep/button/button" class="btn btn-default"
              label="排序" xid="button5" onClick="button5Click"> 
              <i xid="i5"/>  
              <span xid="span11">排序</span>
            </a>
          </div>
          <div class="col col-xs-12 col-sm-12 col-md-12 col-lg-12" xid="col12">
            <div component="$UI/system/components/justep/pagerBar/pagerBar"
              class="x-pagerbar container-fluid" xid="pagerBar1" data="dOrderBy_Orders"> 
              <div class="row" xid="div1"> 
                <div class="col-sm-3" xid="div2"> 
                  <div class="x-pagerbar-length" xid="div3"> 
                    <label component="$UI/system/components/justep/pagerLimitSelect/pagerLimitSelect"
                      class="x-pagerlimitselect" xid="pagerLimitSelect1"> 
                      <span xid="span1">显示</span>  
                      <select component="$UI/system/components/justep/select/select"
                        class="form-control input-sm" xid="select1"> 
                        <option value="10" xid="default2">10</option>  
                        <option value="20" xid="default3">20</option>  
                        <option value="50" xid="default4">50</option>  
                        <option value="100" xid="default5">100</option> 
                      </select>  
                      <span xid="span3">条</span> 
                    </label> 
                  </div> 
                </div>  
                <div class="col-sm-3" xid="div4"> 
                  <div class="x-pagerbar-info" xid="div5">当前显示1-10条，共16条</div> 
                </div>  
                <div class="col-sm-6" xid="div6"> 
                  <div class="x-pagerbar-pagination" xid="div7"> 
                    <ul class="pagination" component="$UI/system/components/bootstrap/pagination/pagination"
                      xid="pagination1"> 
                      <li class="prev" xid="li1"> 
                        <a href="#" xid="a1"> 
                          <span aria-hidden="true" xid="span4">«</span>  
                          <span class="sr-only" xid="span5">Previous</span> 
                        </a> 
                      </li>  
                      <li class="next" xid="li2"> 
                        <a href="#" xid="a2"> 
                          <span aria-hidden="true" xid="span6">»</span>  
                          <span class="sr-only" xid="span9">Next</span> 
                        </a> 
                      </li> 
                    </ul> 
                  </div> 
                </div> 
              </div> 
            </div>
          </div>
        </div>
        <div component="$UI/system/components/justep/grid/grid" hiddenCaptionbar="true"
          altRows="true" class="x-grid-no-bordered" xid="grid4" data="dOrderBy_Orders"
          width="100%" serverSort="true"> 
          <columns xid="columns5">
            <column width="100" name="fOrderNumber" xid="column24" sorttype="text"/>  
            <column width="100" name="fOrderDate" xid="column25" sorttype="date"/>  
            <column width="100" name="fFreght" xid="column28" sorttype="float"/>
            <column width="100" name="fRequiredDate" xid="column26" sorttype="date"/>  
            <column width="100" name="fShippedDate" xid="column27" sorttype="date"/>  
            <column width="100" name="fShipName" xid="column29"/>  
            <column width="100" name="fShipAddress" xid="column30"/>
          </columns>
        </div> 
      </div>  
      <div class="tab-pane" xid="tabContent8">
        <div class="x-cell-layout" component="$UI/system/components/justep/cellLayout/cellLayout"
          style="width:100%;height:250px;" xid="cellLayout10">
          <layout-content xid="default24"><![CDATA[
  <table cellspacing="0" cellpadding="0" rowHeight="19" columnWidth="80" style="border-collapse:collapse;table-layout:fixed;width:1px;">
     <tr><td ></td><td  style="width: 15px;"></td><td  style="width: 800px;"></td></tr>
     <tr><td ></td><td  style="height: 19px;"></td><td  style="height: 19px;"></td></tr>
     <tr><td  style="height: 19px;"></td><td  style="height: 19px;"></td><td  style="height: 19px; font-weight: bold;">数据查找：</td></tr>
     <tr><td ></td><td  style="height: 19px;"></td><td  style="height: 19px;">　　数据查找是通过数据组件的find方法，在“已加载的数据”中进行数据查找。</td></tr>
     <tr><td ></td><td  style="height: 19px;"></td><td  style="height: 19px;">　　参见：下面案例中“查找”按钮的onClick事件。</td></tr>
     <tr><td  style="height: 10px;"></td><td  style="height: 10px;"></td><td  style="height: 10px;"></td></tr>
     <tr><td ></td><td  style="height: 19px;"></td><td  style="height: 19px; font-weight: bold;">数据过滤（bizData）：</td></tr>
     <tr><td ></td><td  style="height: 19px;"></td><td  style="height: 19px;">　　数据过滤是按照设置的过滤条件加载数据，从服务端只加载符合条件的数据到页面。</td></tr>
     <tr><td ></td><td  style="height: 19px;"></td><td  style="height: 19px;">　　过滤条件的设置有两种模式：</td></tr>
     <tr><td ></td><td  style="height: 19px;"></td><td  style="height: 19px;">　　　　设计时 - 通过数据组件右键菜单的“增加过滤条件”；</td></tr>
     <tr><td ></td><td  style="height: 19px;"></td><td  style="height: 19px;">　　　　运行时 - 通过数据组件的setFilter(name, filter)方法。</td></tr>
     <tr><td ></td><td  style="height: 19px;"></td><td  style="height: 19px;">　　bizData组件可以设置多个过滤条件，同名的过滤条件会覆盖，不同名的过滤条件会以AND方式合并。</td></tr>
     <tr><td ></td><td  style="height: 19px;"></td><td  style="height: 19px;">　　参见：下面案例中“过滤”按钮的onClick事件。</td></tr>
     <tr><td ></td><td  style="height: 19px;"></td><td  style="height: 19px; color: rgb(0, 0, 255);">　　数据过滤本质上是在刷新数据时通过QueryAction的filter参数，动态构造KSQL语句实现的。</td></tr>
  </table>
]]></layout-content>
        </div>  
        <div component="$UI/system/components/justep/toolBar/toolBar" class="x-toolbar form-inline x-toolbar-spliter"
          xid="toolBar2">
          <label xid="label3"><![CDATA[在当前数据中查找： 收货人]]></label>  
          <input component="$UI/system/components/justep/input/input" class="form-control"
            xid="inputFind"/>  
          <a component="$UI/system/components/justep/button/button" class="btn btn-default"
            label="查找" xid="btnFind" onClick="btnFindClick"> 
            <i xid="i2"/>  
            <span xid="span2">查找</span>
          </a>
          <label xid="label4"><![CDATA[从服务端过滤数据： 收货人]]></label>  
          <input component="$UI/system/components/justep/input/input" class="form-control"
            xid="inputFilter"/>  
          <a component="$UI/system/components/justep/button/button" class="btn btn-default"
            label="过滤" xid="btnFilter" onClick="btnFilterClick"> 
            <i xid="i3"/>  
            <span xid="span7">过滤</span>
          </a>
        </div>  
        <div component="$UI/system/components/justep/grid/grid" hiddenCaptionbar="true"
          altRows="true" class="x-grid-no-bordered" xid="grid5" data="dFilter_Orders"
          height="200"> 
          <columns xid="columns6">
            <column width="100" name="fStatus" xid="column36"/>
            <column width="100" name="fOrderNumber" xid="column31"/>  
            <column width="100" name="fOrderDate" xid="column32"/>  
            <column width="100" name="fShipName" xid="column33"/>  
            <column width="100" name="fShipCity" xid="column35"/>
            <column width="100" name="fShipAddress" xid="column34"/> 
          </columns>
        </div>
      </div>  
      <div class="tab-pane" xid="tabContent9">
        <div class="x-cell-layout" component="$UI/system/components/justep/cellLayout/cellLayout"
          style="width:100%;height:150px;" xid="cellLayout11">
          <layout-content xid="default28"><![CDATA[
  <table cellspacing="0" cellpadding="0" rowHeight="19" columnWidth="80" style="border-collapse:collapse;table-layout:fixed;width:1px;">
     <tr><td ></td><td  style="width: 15px;"></td><td  style="width: 1000px;"></td><td ></td><td ></td><td ></td><td ></td></tr>
     <tr><td ></td><td  style="height: 19px;"></td><td  style="height: 19px;"></td><td  style="height: 19px;"></td><td  style="height: 19px;"></td><td  style="height: 19px;"></td><td  style="height: 19px;"></td></tr>
     <tr><td  style="height: 19px;"></td><td  style="height: 19px;"></td><td  style="height: 19px; font-weight: bold;">bizData组件支持多级主从关联：</td><td  style="height: 19px;"></td><td  style="height: 19px;"></td><td  style="height: 19px;"></td><td  style="height: 19px;"></td></tr>
     <tr><td ></td><td  style="height: 19px;"></td><td  style="height: 19px;">　　1、“从数据”的bizData组件通过master/data和master/relation两个属性，分别指定“主数据”组件的ID和用于主从过滤的“外键关系”。</td><td  style="height: 19px;"></td><td  style="height: 19px;"></td><td  style="height: 19px;"></td><td  style="height: 19px;"></td></tr>
     <tr><td ></td><td  style="height: 19px;"></td><td  style="height: 19px;">　　2、“从数据”设置为数据自动加载模式（auto-load=true），当“主数据”加载或记录改变时，“从数据”会自动过滤加载。</td><td  style="height: 19px;"></td><td  style="height: 19px;"></td><td  style="height: 19px;"></td><td  style="height: 19px;"></td></tr>
     <tr><td  style="height: 19px;"></td><td  style="height: 19px;"></td><td  style="height: 19px;">　　3、bizData会为加载过的“从数据”形成缓存，既优化性能，也保证修改过的“从数据”不会因为“主数据”变化而丢失。</td><td  style="height: 19px;"></td><td  style="height: 19px;"></td><td  style="height: 19px;"></td><td  style="height: 19px;"></td></tr>
     <tr><td ></td><td  style="height: 19px;"></td><td  style="height: 19px;">　　4、“主数据”的isChanged方法可以感知所有级联的“从数据”是否改变，同时“主数据”的saveData方法会自动级联保存所有的“从数据”。主从级联数据的保存会作为一个批请求，保证在同一个数据库事务中。</td><td  style="height: 19px;"></td><td  style="height: 19px;"></td><td  style="height: 19px;"></td><td  style="height: 19px;"></td></tr>
  </table>
]]></layout-content>
        </div>  
        <div component="$UI/system/components/bootstrap/row/row" class="row"
          xid="row2"> 
          <div class="col col-xs-6 col-sm-6 col-md-6 col-lg-6" xid="col3">
            <label xid="label5"><![CDATA[主数据：dMasterDetail_Orders]]></label>  
            <div component="$UI/system/components/justep/grid/grid" hiddenCaptionbar="true"
              altRows="true" class="x-grid-no-bordered" xid="grid6" data="dMasterDetail_Orders"
              height="200"> 
              <columns xid="columns7">
                <column width="100" name="fOrderNumber" xid="column37"/>  
                <column width="100" name="fOrderDate" xid="column38"/>  
                <column width="100" name="fFreght" xid="column39"/>  
                <column width="100" name="fShipName" xid="column40"/>  
                <column width="100" name="fShipAddress" xid="column41"/>
              </columns>
            </div>
          </div>  
          <div class="col col-xs-6 col-sm-6 col-md-6 col-lg-6" xid="col8">
            <label xid="label6"><![CDATA[从数据：dMasterDetail_OrderDetails]]></label>  
            <div component="$UI/system/components/justep/grid/grid" hiddenCaptionbar="true"
              altRows="true" class="x-grid-no-bordered" xid="grid7" data="dMasterDetail_OrderDetails"
              height="200"> 
              <columns xid="columns8">
                <column width="100" name="fProductName" xid="column45"/>
                <column width="100" name="fQuantityPerUnit" xid="column46"/>
                <column width="100" name="fUnitPrice" xid="column42"/>  
                <column width="100" name="fQuantity" xid="column43"/>  
                <column width="100" name="fDiscount" xid="column44"/> 
              </columns>
            </div>
          </div> 
        </div>
      </div>  
      <div class="tab-pane" xid="tabContent12">
        <div class="x-cell-layout" component="$UI/system/components/justep/cellLayout/cellLayout"
          style="width:100%;height:500px;" xid="cellLayout12">
          <layout-content xid="default52"><![CDATA[
  <table cellspacing="0" cellpadding="0" rowHeight="19" columnWidth="80" style="border-collapse:collapse;table-layout:fixed;width:1px;">
     <tr><td ></td><td  style="width: 15px;"></td><td  style="width: 800px;"></td></tr>
     <tr><td ></td><td  style="height: 19px;"></td><td  style="height: 19px;"></td></tr>
     <tr><td  style="height: 19px;"></td><td  style="height: 19px;"></td><td  style="height: 19px; font-weight: bold;">bizData组件支持树形数据的定义和加载，与树形数据相关的属性包括：</td></tr>
     <tr><td ></td><td  style="height: 19px;"></td><td  style="height: 19px; color: rgb(0, 0, 255);">　　is-tree：true，指定数据是否以树形模式加载。</td></tr>
     <tr><td ></td><td  style="height: 19px;"></td><td  style="height: 19px; color: rgb(0, 0, 255);">　　limit：-1，树形数据不能以分页模式加载，limit必须设置为-1。</td></tr>
     <tr><td ></td><td  style="height: 19px;"></td><td  style="height: 19px; color: rgb(0, 0, 255);">　　treeOption/parentRelation：指定父关系（即存储父ID的字段），这个属性是数据构造成树形的关键属性，数据组件依赖父关系的值建立数据之间的上下级关系。</td></tr>
     <tr><td ></td><td  style="height: 19px;"></td><td  style="height: 19px; color: rgb(0, 0, 255);">　　treeOption/rootFilter：指定树的根节点的过滤条件。</td></tr>
     <tr><td ></td><td  style="height: 19px;"></td><td  style="height: 19px;">　　　　（例如：“SA_OPOrg.sParent is null”表示以所有父字段为空的数据作为树的根节点；“SA_OPOrg='ORG01'”表示只以“起步软件”作为树的根节点）</td></tr>
     <tr><td ></td><td  style="height: 19px;"></td><td  style="height: 19px; color: rgb(255, 0, 0);">　　　　注意：</td></tr>
     <tr><td ></td><td  style="height: 19px;"></td><td  style="height: 19px; color: rgb(255, 0, 0);">　　　　　　如果指定了根节点的过滤条件，数据为逐级加载模式，用户点击树形加号时每次只按需加载当前节点的下级数据，适用于大数据量的树形数据显示和操作；</td></tr>
     <tr><td ></td><td  style="height: 19px;"></td><td  style="height: 19px; color: rgb(255, 0, 0);">　　　　　　如果未指定根节点的过滤条件，数据为一次加载模式，全部数据会一次性全部加载到页面，在内存中动态构造成树形，当大数据量时有明显的性能瓶颈。</td></tr>
     <tr><td ></td><td  style="height: 19px;"></td><td  style="height: 19px;">　　tree-option/virtual-root：指定虚根的显示标签，如果为空则不显示虚根。</td></tr>
     <tr><td ></td><td  style="height: 19px;"></td><td  style="height: 19px;">　　treeOption/nodeKindRelation：指定一个字段用于存储节点类型（叶子节点 - nkLeaf），当新增和删除树形数据时数据组件会自动维护这个字段的值。</td></tr>
     <tr><td ></td><td  style="height: 19px;"></td><td  style="height: 19px;">　   treeOption/delayLoad：是否逐级加载数据，为true的时候可以设置rootFilter属性</td></tr>
     <tr><td  style="height: 10px;"></td><td  style="height: 10px;"></td><td  style="height: 10px;"></td></tr>
     <tr><td ></td><td  style="height: 19px;"></td><td  style="height: 19px; font-weight: bold;">支持树形显示的组件包括：grid、treeSelect，与树形显示相关的属性包括：</td></tr>
     <tr><td ></td><td  style="height: 19px;"></td><td  style="height: 19px;">　　expandColumn：在grid和gridSelect组件中，通过设置expandColumn指定树形展开列。</td></tr>
     <tr><td ></td><td  style="height: 19px;"></td><td  style="height: 19px;">　　appearance：在grid和gridSelect组件中，通过appearance的值（tree、treeGrid或grid）指定树形的显示模式（“树”或“树列表”）。</td></tr>
     <tr><td ></td><td  style="height: 19px;"></td><td  style="height: 19px;">       useVirtualRoot：设置是否显示虚根  </td></tr>
     <tr><td ></td><td  style="height: 19px;"></td><td  style="height: 19px;">       virtualRootLable：虚根名称</td></tr>
  </table>
]]></layout-content>
        </div>
        <div component="$UI/system/components/bootstrap/row/row" class="row"
          xid="row4"> 
          <div class="col col-xs-12 col-sm-12 col-md-12 col-lg-12" xid="col26">
            </div>
          <div class="col col-xs-6 col-sm-6 col-md-6 col-lg-6" xid="col22">
            <div component="$UI/system/components/justep/grid/grid" hiddenCaptionbar="true"
              altRows="true" class="x-grid-no-bordered" xid="grid8" data="dTreeGrid_Org"
              height="240" appearance="treeGrid" expandColumn="sName" useVirtualRoot="true"
              virtualRootLabel="组织机构"> 
              <columns xid="columns9">
                <column width="150" name="sName" xid="column47"/>  
                <column width="100" name="sCode" xid="column48"/>  
                <column width="100" name="sOrgKindID" xid="column49"/>  
                <column width="100" name="sAddress" xid="column50"/>
              </columns>
            </div>
          </div>  
          <div class="col col-xs-6 col-sm-6 col-md-6 col-lg-6" xid="col25">
            <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit" xid="labelEdit3">
   <label class="x-label" xid="label9" style="width:200px;">gridSelect组件的“树”模式</label>
   <div class="x-edit" xid="div14">
    <div class="x-gridSelect" component="$UI/system/components/justep/gridSelect/gridSelect" xid="gridSelect5" bind-ref="dTemp.ref('treeSelectKey')" bind-labelRef="dTemp.ref('treeSelectValue')">
     <option xid="option5" data="dTreeSelect_Org" value="SA_OPOrg" label="sName" appearance="tree" expandColumn="sName" useVirtualRoot="true" virtualRootLabel="组织机构"></option></div> </div> </div></div> 
        </div>
      </div>
    </div> 
  </div> 
</div>
