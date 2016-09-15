<?xml version="1.0" encoding="UTF-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window" component="$UI/system/components/justep/window/window" design="device:pc">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:470px;top:8px;" onLoad="modelLoad"><div component="$UI/system/components/justep/data/data" autoLoad="false" xid="dTemp" idColumn="year" autoNew="true" onValueChanged="dTempValueChanged"><column label="年" name="year" type="String" xid="xid1"></column>
  <column label="月" name="month" type="String" xid="xid2"></column>
  <column label="添加列" name="addColumn" type="String" xid="xid3"></column>
  <column label="删除列" name="delColumn" type="String" xid="xid4"></column>
  <column label="遍历" name="listColumn" type="String" xid="xid5"></column></div>
  <div component="$UI/system/components/justep/data/data" autoLoad="true" xid="dCalendar" idColumn="sun" confirmRefresh="false"><column name="sun" type="String" xid="xid6"></column>
  <column name="mon" type="String" xid="xid7"></column>
  <column name="tues" type="String" xid="xid8"></column>
  <column name="wed" type="String" xid="xid9"></column>
  <column name="thur" type="String" xid="xid10"></column>
  <column name="fri" type="String" xid="xid11"></column>
  <column name="sat" type="String" xid="xid12"></column></div>
  <div component="$UI/system/components/justep/data/data" autoLoad="false" xid="dExample" idColumn="DEMO_Customers" confirmRefresh="false"><column name="DEMO_Customers" type="String" xid="xid20"></column>
  <column label="" name="fCompanyName" type="String" xid="xid13"></column>
  <column name="fContactName" type="String" xid="xid14"></column>
  <column name="fContactTitle" type="String" xid="xid15"></column>
  <column name="fAddress" type="String" xid="xid16"></column>
  <column name="fCity" type="String" xid="xid17"></column>
  <column name="fRegion" type="String" xid="xid18"></column>
  <column name="fPhone" type="String" xid="xid19"></column></div>
  <div component="$UI/system/components/justep/data/data" autoLoad="true" xid="dMonth" idColumn="month"><column name="month" type="String" xid="xid21"></column>
  <data xid="default5">[{&quot;month&quot;:&quot;1&quot;},{&quot;month&quot;:&quot;2&quot;},{&quot;month&quot;:&quot;3&quot;},{&quot;month&quot;:&quot;4&quot;},{&quot;month&quot;:&quot;5&quot;},{&quot;month&quot;:&quot;6&quot;},{&quot;month&quot;:&quot;7&quot;},{&quot;month&quot;:&quot;8&quot;},{&quot;month&quot;:&quot;9&quot;},{&quot;month&quot;:&quot;10&quot;},{&quot;month&quot;:&quot;11&quot;},{&quot;month&quot;:&quot;12&quot;}]</data></div></div> 
<div component="$UI/system/components/bootstrap/tabs/tabs" xid="tabs1">
   <ul class="nav nav-tabs" xid="ul1">
    <li class="active" xid="li1">
     <a content="tabContent1" xid="tabItem1"><![CDATA[概述]]></a></li> 
    <li role="presentation" xid="li2" bind-click="li2Click">
     <a content="tabContent2" xid="tabItem2"><![CDATA[构造Table]]></a></li> 
  <li xid="li3" bind-click="li3Click">
   <a content="tabContent3" xid="tabItem3"><![CDATA[常用方法]]></a></li>
  <li xid="li4">
   <a content="tabContent4" xid="tabDiff"><![CDATA[前后台数据操作对比]]></a></li></ul> 
   <div class="tab-content" xid="div1">
    <div class="tab-pane active" xid="tabContent1"><div class="x-cell-layout" component="$UI/system/components/justep/cellLayout/cellLayout" style="width:100%; height: 100%;" xid="cellLayout1"><layout-content xid="default1"><![CDATA[
  <table cellspacing="0" cellpadding="0" rowHeight="19" columnWidth="80" style="border-collapse:collapse;table-layout:fixed;width:1px;">
     <tr><td ></td><td  style="width: 50px;"></td><td  style="width: 800px;"></td></tr>
     <tr><td ></td><td  style="height: 19px;"></td><td  style="height: 19px;"></td></tr>
     <tr><td ></td><td  style="height: 19px;"></td><td  style="height: 19px;">Table是以行(row)、列(column)描述的二维结构的数据集，通常通过执行KSQL或SQL的查询语句生成。</td></tr>
     <tr><td ></td><td  style="height: 19px;"></td><td  style="height: 19px;">Table是X5服务端接口（Action-业务动作）接收和返回二维数据集的数据结构，也是X5页面中Data组件、BizData组件和ReportData组件的数据来源。</td></tr>
     <tr><td ></td><td  style="height: 19px;"></td><td  style="height: 19px;"></td></tr>
     <tr><td ></td><td  style="height: 19px;"></td><td  style="height: 19px;">◆ Data组件获得数据：服务端动作将数据封装成Table对象返回，系统自动将Table对象转换成xml或json返回给客户端页面，最后加载到Data组件中</td></tr>
     <tr><td ></td><td  style="height: 19px;"></td><td  style="height: 19px;">例如：标准动作queryAction返回的就是Table对象，如果需要自定义Action获取数据，那么自定义action也必须返回Table类型的数据</td></tr>
     <tr><td ></td><td  style="height: 19px;"></td><td  style="height: 19px;"></td></tr>
     <tr><td  style="height: 19px;"></td><td  style="height: 19px;"></td><td  style="height: 19px;">◆ Data组件保存数据：Data组件中的数据以xml或json格式作为参数调用保存动作，系统会将数据自动转换成Table对象传入动作映射的Java函数中，执行保存</td></tr>
     <tr><td ></td><td  style="height: 19px;"></td><td  style="height: 19px;">例如：标准动作saveAction中的table参数中就是Data组件中修改的数据，在保存之前或之后的事件中获取这个table，可以进行数据有效性验证等其它的处理（请参考标准动作案例）</td></tr>
     <tr><td ></td><td  style="height: 19px;"></td><td  style="height: 19px;"></td></tr>
     <tr><td ></td><td  style="height: 19px;"></td><td  style="height: 19px;">◆ ReportData使用的ksqlAction和action也必须返回Table对象</td></tr>
     <tr><td ></td><td  style="height: 19px;"></td><td  style="height: 19px;"></td></tr>
     <tr><td ></td><td  style="height: 19px;"></td><td  style="height: 19px; font-weight: bold;">常用类</td></tr>
     <tr><td  style="height: 19px;"></td><td  style="height: 19px;"></td><td  style="height: 19px;">  com.justep.system.data.Table</td></tr>
     <tr><td ></td><td  style="height: 19px;"></td><td  style="height: 19px;">  com.justep.system.data.Row</td></tr>
     <tr><td ></td><td  style="height: 19px;"></td><td  style="height: 19px;">  com.justep.system.data.TableUtils</td></tr>
     <tr><td ></td><td  style="height: 19px;"></td><td  style="height: 19px;">  com.justep.system.data.KSQL</td></tr>
     <tr><td ></td><td  style="height: 19px;"></td><td  style="height: 19px;"></td></tr>
     <tr><td ></td><td  style="height: 19px;"></td><td  style="height: 19px; font-weight: bold;">示例代码</td></tr>
     <tr><td ></td><td  style="height: 19px;"></td><td  style="height: 19px;">  Action：/BIZ/demo/db/logic/action/TableAction.action.m</td></tr>
     <tr><td ></td><td  style="height: 19px;"></td><td  style="height: 19px;">  Java：/BIZ/demo/db/logic/code/dsrc/TableIntroduce.java</td></tr>
  </table>
]]></layout-content></div></div>
    <div class="tab-pane" xid="tabContent2"><div class="x-cell-layout" component="$UI/system/components/justep/cellLayout/cellLayout" style="width:100%; height: 100%;" xid="cellLayout2"><layout-content xid="default2"><![CDATA[
  <table cellspacing="0" cellpadding="0" rowHeight="19" columnWidth="80" style="border-collapse:collapse;table-layout:fixed;width:1px;">
     <tr><td ></td><td  style="width: 20px;"></td><td  style="width: 50px;"></td><td  style="width: 87px;"></td><td  style="width: 40px;"></td><td ></td><td ></td><td  style="width: 500px;"></td></tr>
     <tr><td ></td><td  style="height: 19px;"></td><td  style="height: 19px;"></td><td  style="height: 19px;"></td><td  style="height: 19px;"></td><td  style="height: 19px;"></td><td  style="height: 19px;"></td><td  style="height: 19px;"></td></tr>
     <tr><td ></td><td  style="height: 19px;"></td><td  style="height: 19px; border-bottom-width: 1px; border-bottom-color: rgb(192, 192, 192); border-bottom-style: solid; text-align: center; font-weight: bold;"></td><td  colSpan="5" style="height: 19px; border-bottom-width: 1px; border-bottom-color: rgb(192, 192, 192); border-bottom-style: solid; font-weight: bold;">从数据模型查询返回数据集（Table）</td></tr>
     <tr><td  style="height: 5px;"></td><td  style="height: 5px;"></td><td  style="height: 5px;"></td><td  style="height: 5px;"></td><td  style="height: 5px;"></td><td  style="height: 5px;"></td><td  style="height: 5px;"></td><td  style="height: 5px;"></td></tr>
     <tr><td ></td><td  style="height: 19px;"></td><td  style="height: 19px; text-align: center; font-weight: bold;">语法</td><td  colSpan="5" style="height: 19px;">KSQL.select(String ksql, Map params, String dataModel, String fnModel)</td></tr>
     <tr><td  style="height: 5px;"></td><td  style="height: 5px;"></td><td  style="height: 5px;"></td><td  style="height: 5px;"></td><td  style="height: 5px;"></td><td  style="height: 5px;"></td><td  style="height: 5px;"></td><td  style="height: 5px;"></td></tr>
     <tr><td ></td><td  style="height: 19px;"></td><td  style="height: 19px; text-align: center; font-weight: bold;">示例</td><td  colSpan="5" style="height: 19px;">Table table = KSQL.select("select DEMO_OrderDetail.* from DEMO_OrderDetail DEMO_OrderDetail", null, "/demo/misc/data", null);</td></tr>
     <tr><td  style="height: 5px;"></td><td  style="height: 5px;"></td><td  style="height: 5px;"></td><td  style="height: 5px;"></td><td  style="height: 5px;"></td><td  style="height: 5px;"></td><td  style="height: 5px;"></td><td  style="height: 5px;"></td></tr>
     <tr><td  style="height: 19px;"></td><td  style="height: 19px;"></td><td  style="height: 19px; text-align: center; font-weight: bold;">案例</td><td  colSpan="5" style="height: 19px;">参见 /BIZ/demo/db/logic/action/tableAction.action.m 动作 returnTableAction</td></tr>
     <tr><td ></td><td  style="height: 19px;"></td><td  style="height: 19px; text-align: center;"></td><td  style="height: 19px;"></td><td  style="height: 19px;"></td><td  style="height: 19px;"></td><td  style="height: 19px;"></td><td  style="height: 19px;"></td></tr>
     <tr><td ></td><td  style="height: 19px;"></td><td  style="height: 19px; border-bottom-width: 1px; border-bottom-color: rgb(192, 192, 192); border-bottom-style: solid; text-align: center; font-weight: bold;"></td><td  style="height: 19px; border-bottom-width: 1px; border-bottom-color: rgb(192, 192, 192); border-bottom-style: solid; font-weight: bold;">在内存中动态构造数据集（Table）</td><td  style="height: 19px;"></td><td  style="height: 19px;"></td><td  style="height: 19px;"></td><td  style="height: 19px;"></td></tr>
     <tr><td  style="height: 5px;"></td><td  style="height: 5px;"></td><td  style="height: 5px;"></td><td  style="height: 5px;"></td><td  style="height: 5px;"></td><td  style="height: 5px;"></td><td  style="height: 5px;"></td><td  style="height: 5px;"></td></tr>
     <tr><td ></td><td  style="height: 19px;"></td><td  style="height: 19px; text-align: center; font-weight: bold;">语法</td><td  colSpan="5" style="height: 19px;">TableUtils.createTable(com.justep.model.Model model, List names, List types); // names是列的名称，types是列的类型</td></tr>
     <tr><td  style="height: 5px;"></td><td  style="height: 5px;"></td><td  style="height: 5px;"></td><td  style="height: 5px;"></td><td  style="height: 5px;"></td><td  style="height: 5px;"></td><td  style="height: 5px;"></td><td  style="height: 5px;"></td></tr>
     <tr><td  style="height: 19px;"></td><td  style="height: 19px;"></td><td  style="height: 19px; text-align: center; font-weight: bold;">示例</td><td  colSpan="5" style="height: 19px;">List names = new ArrayList();</td></tr>
     <tr><td ></td><td  style="height: 19px;"></td><td  style="height: 19px; text-align: center; font-weight: bold;"></td><td  colSpan="5" style="height: 19px;">names.add("sun"); names.add("mon"); names.add("tues"); names.add("wed"); names.add("thur"); names.add("fri"); names.add("sat");</td></tr>
     <tr><td  style="height: 19px;"></td><td  style="height: 19px;"></td><td  style="height: 19px; text-align: center; font-weight: bold;"></td><td  colSpan="5" style="height: 19px;">List types = new ArrayList();</td></tr>
     <tr><td ></td><td  style="height: 19px;"></td><td  style="height: 19px; text-align: center; font-weight: bold;"></td><td  colSpan="5" style="height: 19px;">types.add("Integer"); types.add("Integer"); types.add("Integer"); types.add("Integer"); types.add("Integer"); types.add("Integer");	types.add("Integer");</td></tr>
     <tr><td ></td><td  style="height: 19px;"></td><td  style="height: 19px; text-align: center; font-weight: bold;"></td><td  colSpan="5" style="height: 19px;">Table table = TableUtils.createTable(null, names, types); //创建Table</td></tr>
     <tr><td  style="height: 5px;"></td><td  style="height: 5px;"></td><td  style="height: 5px;"></td><td  style="height: 5px;"></td><td  style="height: 5px;"></td><td  style="height: 5px;"></td><td  style="height: 5px;"></td><td  style="height: 5px;"></td></tr>
     <tr><td ></td><td  style="height: 19px;"></td><td  style="height: 19px; text-align: center; font-weight: bold;">案例</td><td  colSpan="5" style="height: 19px;">下面的日历就是在内存中动态创建的数据集，参见 /BIZ/demo/db/logic/action/tableAction.action.m 动作 createCalendarAction</td></tr>
     <tr><td  style="height: 15px;"></td><td  style="height: 15px;"></td><td  style="height: 15px;"></td><td  style="height: 15px; border-bottom-width: 1px; border-bottom-color: rgb(192, 192, 192); border-bottom-style: solid;"></td><td  style="height: 15px;"></td><td  style="border-bottom-width: 1px; border-bottom-color: rgb(192, 192, 192); border-bottom-style: solid; height: 15px;"></td><td  style="height: 15px;"></td><td  style="height: 15px;"></td></tr>
     <tr><td ></td><td  style="height: 19px;"></td><td  style="height: 19px; border-right-width: 1px; border-right-color: rgb(192, 192, 192); border-right-style: solid;"></td><td  style="height: 19px; border: 1px solid rgb(192, 192, 192);" componentId="input2"></td><td  style="height: 19px; border-right-width: 1px; border-right-color: rgb(192, 192, 192); border-right-style: solid;">年</td><td  style="border: 1px solid rgb(192, 192, 192); height: 19px;" componentId="gridSelect1"></td><td  style="height: 19px;">月</td><td  style="height: 19px;"></td></tr>
     <tr><td ></td><td  style="height: 19px;"></td><td  style="height: 19px;"></td><td  style="height: 19px;"></td><td  style="height: 19px;"></td><td  style="height: 19px;"></td><td  style="height: 19px;"></td><td  style="height: 19px;"></td></tr>
     <tr><td  style="height: 150px;"></td><td  style="height: 150px;"></td><td  style="height: 150px;"></td><td  colSpan="4" style="height: 150px;" componentId="grid1"></td><td  style="height: 150px;"></td></tr>
  </table>
]]></layout-content>
  <input component="$UI/system/components/justep/input/input" class="form-control x-cell-control" xid="input2" bind-ref="dTemp.ref('year')"></input>
  <div class="x-gridSelect x-cell-control" component="$UI/system/components/justep/gridSelect/gridSelect" xid="gridSelect1" bind-ref="dTemp.ref('month')" bind-labelRef="dTemp.ref('month')">
   <option xid="option1" data="dMonth" value="month" label="month"></option></div>
  <div component="$UI/system/components/justep/grid/grid" hiddenCaptionbar="true" altRows="true" class="x-grid-no-bordered x-grid-title-center" xid="grid1" data="dCalendar" height="200" width="100%">
   <columns xid="columns2"><column width="30" name="sun" xid="column8" label="日" align="center"></column>
  <column width="30" name="mon" xid="column9" label="一" align="center"></column>
  <column width="30" name="tues" xid="column10" label="二" align="center"></column>
  <column width="30" name="wed" xid="column11" label="三" align="center"></column>
  <column width="30" name="thur" xid="column12" label="四" align="center"></column>
  <column width="30" name="fri" xid="column13" label="五" align="center"></column>
  <column width="30" name="sat" xid="column14" label="六" align="center"></column></columns></div></div></div>
  <div class="tab-pane" xid="tabContent3"><div component="$UI/system/components/justep/grid/grid" hiddenCaptionbar="true" altRows="true" class="x-grid-no-bordered" xid="gridExample" data="dExample" height="200" width="100%">
   <columns xid="columns1"><column name="fCompanyName" xid="column1" width="150"></column>
  <column name="fContactName" xid="column2" width="120"></column>
  <column width="100" name="fContactTitle" xid="column3"></column>
  <column width="200" name="fAddress" xid="column4"></column>
  <column width="100" name="fCity" xid="column5"></column>
  <column width="100" name="fRegion" xid="column6"></column>
  <column width="100" name="fPhone" xid="column7"></column></columns></div>
  <div class="x-cell-layout" component="$UI/system/components/justep/cellLayout/cellLayout" style="width:100%;height:300px;" xid="cellLayout3"><layout-content xid="default3"><![CDATA[
  <table cellspacing="0" cellpadding="0" rowHeight="19" columnWidth="80" style="border-collapse:collapse;table-layout:fixed;width:1px;">
     <tr><td ></td><td  style="width: 20px;"></td><td  style="width: 60px;"></td><td  style="width: 160px;"></td><td  style="width: 20px;"></td><td  style="width: 100px;"></td><td  style="width: 400px;"></td><td ></td></tr>
     <tr><td ></td><td  style="height: 19px;"></td><td  style="height: 19px;"></td><td  style="height: 19px;"></td><td  style="height: 19px;"></td><td  style="height: 19px;"></td><td  style="height: 19px;"></td><td  style="height: 19px;"></td></tr>
     <tr><td ></td><td  style="height: 19px;"></td><td  style="height: 19px;"></td><td  style="height: 19px;"></td><td  style="height: 19px;"></td><td  style="height: 19px;" componentId="btnAddRow"></td><td  style="height: 19px;">table.appendRow</td><td  style="height: 19px;"></td></tr>
     <tr><td ></td><td  style="height: 19px;"></td><td  style="height: 19px;"></td><td  style="height: 19px;"></td><td  style="height: 19px;"></td><td  style="height: 19px;"></td><td  style="height: 19px;"></td><td  style="height: 19px;"></td></tr>
     <tr><td ></td><td  style="height: 19px;"></td><td  style="height: 19px;"></td><td  style="height: 19px;"></td><td  style="height: 19px;"></td><td  style="height: 19px;" componentId="btnDelRow"></td><td  style="height: 19px;">table.deleteRows</td><td  style="height: 19px;"></td></tr>
     <tr><td ></td><td  style="height: 19px;"></td><td  style="height: 19px;"></td><td  style="height: 19px; border-bottom-width: 1px; border-bottom-color: rgb(1, 1, 1); border-bottom-style: solid;"></td><td  style="height: 19px;"></td><td  style="height: 19px;"></td><td  style="height: 19px;"></td><td  style="height: 19px;"></td></tr>
     <tr><td ></td><td  style="height: 19px;"></td><td  style="height: 19px; text-align: center; border-right-width: 1px; border-right-color: rgb(1, 1, 1); border-right-style: solid;">列名</td><td  style="height: 19px; border: 1px solid rgb(1, 1, 1);" componentId="input3"></td><td  style="height: 19px;"></td><td  style="height: 19px;" componentId="btnListTable"></td><td  style="height: 19px;">table.iterator</td><td  style="height: 19px;"></td></tr>
     <tr><td ></td><td  style="height: 19px;"></td><td  style="height: 19px;"></td><td  style="height: 19px;"></td><td  style="height: 19px;"></td><td  style="height: 19px;"></td><td  style="height: 19px;"></td><td  style="height: 19px;"></td></tr>
     <tr><td ></td><td  style="height: 19px;"></td><td  colSpan="5" style="height: 19px;">示例动作参见：/BIZ/demo/db/logic/action/tableAction.action.m</td><td  style="height: 19px;"></td></tr>
  </table>
]]></layout-content>
  <a component="$UI/system/components/justep/button/button" class="btn x-blue" label="新增行" xid="btnAddRow" onClick="btnAddRowClick">
   <i xid="i1"></i>
   <span xid="span1">新增行</span></a>
  <a component="$UI/system/components/justep/button/button" class="btn x-blue" label="删除行" xid="btnDelRow" onClick="btnDelRowClick">
   <i xid="i2"></i>
   <span xid="span2">删除行</span></a>
  <a component="$UI/system/components/justep/button/button" class="btn x-yellow" label="遍历Table" xid="btnListTable" onClick="btnListTableClick">
   <i xid="i5"></i>
   <span xid="span5">遍历Table</span></a>
  <input component="$UI/system/components/justep/input/input" class="form-control x-cell-control" xid="input3" bind-ref="dTemp.ref('listColumn')"></input></div></div>
  <div class="tab-pane" xid="tabContent4"><div class="x-cell-layout" component="$UI/system/components/justep/cellLayout/cellLayout" style="width:100%; height: 100%;" xid="cellLayout4"><layout-content xid="default4"><![CDATA[
  <table cellspacing="0" cellpadding="0" rowHeight="19" columnWidth="80" style="border-collapse:collapse;table-layout:fixed;width:1px;">
     <tr><td ></td><td ></td><td ></td><td  style="width: 500px;"></td><td  style="width: 20px;"></td><td  style="width: 500px;"></td></tr>
     <tr><td ></td><td  style="height: 19px;"></td><td  style="height: 19px;"></td><td  style="height: 19px;"></td><td  style="height: 19px;"></td><td  style="height: 19px;"></td></tr>
     <tr><td ></td><td  style="height: 19px;"></td><td  style="height: 19px; text-align: center; font-weight: bold; border-bottom-width: 1px; border-bottom-color: rgb(192, 192, 192); border-bottom-style: solid;"></td><td  style="height: 19px; text-align: center; font-weight: bold; border-bottom-width: 1px; border-bottom-color: rgb(192, 192, 192); border-bottom-style: solid;">服务端</td><td  style="height: 19px; font-weight: bold; border-bottom-width: 1px; border-bottom-color: rgb(192, 192, 192); border-bottom-style: solid;"></td><td  style="height: 19px; text-align: center; font-weight: bold; border-bottom-width: 1px; border-bottom-color: rgb(192, 192, 192); border-bottom-style: solid;">客户端</td></tr>
     <tr><td  style="height: 8px;"></td><td  style="height: 8px;"></td><td  style="height: 8px;"></td><td  style="height: 8px;"></td><td  style="height: 8px;"></td><td  style="height: 8px;"></td></tr>
     <tr><td  style="height: 21px;"></td><td  style="height: 21px;"></td><td  style="height: 21px; text-align: center; font-weight: bold;">新增行</td><td  style="height: 21px;">Row row = table.appendRow();</td><td  style="height: 21px;"></td><td  style="height: 21px;">data.newData()</td></tr>
     <tr><td ></td><td  style="height: 19px;"></td><td  style="height: 19px; text-align: center; border-bottom-width: 1px; border-bottom-color: rgb(192, 192, 192); border-bottom-style: solid; font-weight: bold;">新增列</td><td  style="height: 19px; border-bottom-width: 1px; border-bottom-color: rgb(192, 192, 192); border-bottom-style: solid;">table.addColumn(columnName, "String");</td><td  style="height: 19px; border-bottom-width: 1px; border-bottom-color: rgb(192, 192, 192); border-bottom-style: solid;"></td><td  style="height: 19px; border-bottom-width: 1px; border-bottom-color: rgb(192, 192, 192); border-bottom-style: solid;"></td></tr>
     <tr><td  style="height: 8px;"></td><td  style="height: 8px;"></td><td  style="height: 8px; font-weight: bold;"></td><td  style="height: 8px;"></td><td  style="height: 8px;"></td><td  style="height: 8px;"></td></tr>
     <tr><td  style="height: 20px;"></td><td  style="height: 20px;"></td><td  style="height: 20px; text-align: center; font-weight: bold;">赋值</td><td  style="height: 20px;">不指定数据类型 row.setValue(列名, 值)</td><td  style="height: 20px;"></td><td  style="height: 20px;">data.setValue(列名, 值, 行ID) ; row.val(列名,值)</td></tr>
     <tr><td ></td><td  style="height: 19px;"></td><td  style="height: 19px; font-weight: bold;"></td><td  style="height: 19px;">指定数据类型 row.setString(列名, 值)、row.setInteger(列名, 值)......</td><td  style="height: 19px;"></td><td  style="height: 19px;"></td></tr>
     <tr><td ></td><td  style="height: 19px;"></td><td  style="height: 19px; text-align: center; font-weight: bold;">取值</td><td  style="height: 19px;">不指定数据类型 Object o = row.getValue(列名)</td><td  style="height: 19px;"></td><td  style="height: 19px;">var value = data.getValue(列名, 行ID) ; row.val(列名)</td></tr>
     <tr><td ></td><td  style="height: 19px;"></td><td  style="height: 19px; border-bottom-width: 1px; border-bottom-color: rgb(192, 192, 192); border-bottom-style: solid; font-weight: bold;"></td><td  style="height: 19px; border-bottom-width: 1px; border-bottom-color: rgb(192, 192, 192); border-bottom-style: solid;">指定数据类型 row.getString(列名)、row.getInteger(列名)......</td><td  style="height: 19px; border-bottom-width: 1px; border-bottom-color: rgb(192, 192, 192); border-bottom-style: solid;"></td><td  style="height: 19px; border-bottom-width: 1px; border-bottom-color: rgb(192, 192, 192); border-bottom-style: solid;"></td></tr>
     <tr><td  style="height: 8px;"></td><td  style="height: 8px;"></td><td  style="height: 8px; font-weight: bold;"></td><td  style="height: 8px;"></td><td  style="height: 8px;"></td><td  style="height: 8px;"></td></tr>
     <tr><td ></td><td  style="height: 19px;"></td><td  style="height: 19px; text-align: center; font-weight: bold;">删除行</td><td  style="height: 19px;">先设置主键列setKeyColumn，再调用table.deleteRows(id)</td><td  style="height: 19px;"></td><td  style="height: 19px;">data.deleteData(ID或ID数组)</td></tr>
     <tr><td ></td><td  style="height: 19px;"></td><td  style="height: 19px; font-weight: bold;"></td><td  style="height: 19px;">table.getMetaData().setKeyColumn(key列的别名)</td><td  style="height: 19px;"></td><td  style="height: 19px;"></td></tr>
     <tr><td ></td><td  style="height: 19px;"></td><td  style="height: 19px; font-weight: bold;"></td><td  style="height: 19px;">table.deleteRows(id)</td><td  style="height: 19px;"></td><td  style="height: 19px;"></td></tr>
     <tr><td ></td><td  style="height: 19px;"></td><td  style="height: 19px; text-align: center; font-weight: bold; border-bottom-width: 1px; border-bottom-color: rgb(192, 192, 192); border-bottom-style: solid;">删除列</td><td  style="height: 19px; border-bottom-width: 1px; border-bottom-color: rgb(192, 192, 192); border-bottom-style: solid;">table.deleteColumn(columnName);</td><td  style="height: 19px; border-bottom-width: 1px; border-bottom-color: rgb(192, 192, 192); border-bottom-style: solid;"></td><td  style="height: 19px; border-bottom-width: 1px; border-bottom-color: rgb(192, 192, 192); border-bottom-style: solid;"></td></tr>
     <tr><td  style="height: 8px;"></td><td  style="height: 8px;"></td><td  style="height: 8px; font-weight: bold;"></td><td  style="height: 8px;"></td><td  style="height: 8px;"></td><td  style="height: 8px;"></td></tr>
     <tr><td ></td><td  style="height: 19px;"></td><td  style="height: 19px; text-align: center; font-weight: bold;">查找</td><td  style="height: 19px;">可以设置某一列为key列，通过key值查找，加快查找速度:</td><td  style="height: 19px;"></td><td  style="height: 19px;">array find(列名数组, 列值数组, 是否只返回第一个, 是否大小写敏感, 是否模糊查找) </td></tr>
     <tr><td ></td><td  style="height: 19px;"></td><td  style="height: 19px; font-weight: bold;"></td><td  style="height: 19px;">table.getMetaData().setKeyColumn(key列的别名)</td><td  style="height: 19px;"></td><td  style="height: 19px;">var rowIDs = data.find(["fRegion"],["华东"]);
</td></tr>
     <tr><td ></td><td  style="height: 19px;"></td><td  style="height: 19px; font-weight: bold;"></td><td  style="height: 19px;">Row row = table.getRow(key值)</td><td  style="height: 19px;"></td><td  style="height: 19px;">var rowIDs = data.find(["fRegion","fCity"],["华东","南京"], true);</td></tr>
     <tr><td ></td><td  style="height: 19px;"></td><td  style="height: 19px; font-weight: bold;"></td><td  style="height: 19px;">也可以简单通过指定列及列值来返回指定行：</td><td  style="height: 19px;"></td><td  style="height: 19px;"></td></tr>
     <tr><td ></td><td  style="height: 19px;"></td><td  style="height: 19px; border-bottom-width: 1px; border-bottom-color: rgb(192, 192, 192); border-bottom-style: solid; font-weight: bold;"></td><td  style="height: 19px; border-bottom-width: 1px; border-bottom-color: rgb(192, 192, 192); border-bottom-style: solid;">Row row = table.getRow(列的别名, 列值)</td><td  style="height: 19px; border-bottom-width: 1px; border-bottom-color: rgb(192, 192, 192); border-bottom-style: solid;"></td><td  style="height: 19px; border-bottom-width: 1px; border-bottom-color: rgb(192, 192, 192); border-bottom-style: solid;"></td></tr>
     <tr><td  style="height: 8px;"></td><td  style="height: 8px;"></td><td  style="height: 8px; font-weight: bold;"></td><td  style="height: 8px;"></td><td  style="height: 8px;"></td><td  style="height: 8px;"></td></tr>
     <tr><td  style="height: 75px;"></td><td  style="height: 75px;"></td><td  style="height: 75px; text-align: center; font-weight: bold;">遍历</td><td  style="height: 75px;"></td><td  style="height: 75px;"></td><td  style="height: 75px;"></td></tr>
  </table>
]]></layout-content></div></div></div> </div>
  </div>