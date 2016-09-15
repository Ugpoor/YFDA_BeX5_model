<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window" component="$UI/system/components/justep/window/window"
  design="device:pc">  
  <div component="$UI/system/components/justep/model/model" xid="model2" style="position:absolute;height:auto;left:357px;top:59px;"> 
    <div component="$UI/system/components/justep/data/bizData" autoLoad="false"
      xid="dOrders_Source" concept="DEMO_Orders"> 
      <reader xid="default11" action="/demo/common/logic/action/queryDEMO_OrdersAction"/> 
    </div>  
    <div component="$UI/system/components/justep/data/bizData" autoLoad="true"
      xid="dDetails_Source" concept="DEMO_OrderDetails"> 
      <reader xid="default12" action="/demo/common/logic/action/queryDEMO_OrderDetailsAction"/>  
      <master xid="default13" data="dOrders_Source" relation="fOrderID"/> 
    </div>  
    <div component="$UI/system/components/justep/data/bizData" autoLoad="true"
      xid="dOrders_Dest" concept="DEMO_Orders"> 
      <reader xid="default14" action="/demo/common/logic/action/queryDEMO_OrdersAction"/> 
    <creator xid="default24" action="/demo/common/logic/action/createDEMO_OrdersAction"></creator></div>  
    <div component="$UI/system/components/justep/data/bizData" autoLoad="true"
      xid="dDetails_Dest" concept="DEMO_OrderDetails"> 
      <reader xid="default15" action="/demo/common/logic/action/queryDEMO_OrderDetailsAction"/>  
      <master xid="default16" data="dOrders_Dest" relation="fOrderID"/> 
    <creator xid="default25" action="/demo/common/logic/action/createDEMO_OrderDetailsAction"></creator></div> 
  </div>  
  <div component="$UI/system/components/justep/model/model" xid="model3" style="position:absolute;height:auto;left:104px;top:69px;"> 
  <div component="$UI/system/components/justep/data/bizData" autoLoad="true" xid="dOrders_Save" concept="DEMO_Orders"><reader xid="default17" action="/demo/common/logic/action/queryDEMO_OrdersAction"></reader>
  <writer xid="default18" action="/demo/common/logic/action/saveDEMO_OrdersAction"></writer>
  <creator xid="default19" action="/demo/common/logic/action/createDEMO_OrdersAction"></creator></div>
  <div component="$UI/system/components/justep/data/bizData" autoLoad="true" xid="dDetails_Save" concept="DEMO_OrderDetails"><reader xid="default20" action="/demo/common/logic/action/queryDEMO_OrderDetailsAction"></reader>
  <writer xid="default21" action="/demo/common/logic/action/saveDEMO_OrderDetailsAction"></writer>
  <creator xid="default22" action="/demo/common/logic/action/createDEMO_OrderDetailsAction"></creator>
  <master xid="default23" data="dOrders_Save" relation="fOrderID"></master></div></div>
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:608px;top:39px;"> 
    <div component="$UI/system/components/justep/data/bizData" autoLoad="false"
      xid="dOrders" concept="DEMO_Orders"> 
      <reader xid="default2" action="/demo/common/logic/action/queryDEMO_OrdersAction"/> 
    </div>  
    <div component="$UI/system/components/justep/data/bizData" autoLoad="true"
      xid="dOrderDetails" concept="DEMO_OrderDetails"> 
      <reader xid="default3" action="/demo/common/logic/action/queryDEMO_OrderDetailsAction"/>  
      <master xid="default4" data="dOrders" relation="fOrderID"/> 
    </div>  
    <div component="$UI/system/components/justep/data/data" autoLoad="false"
      xid="dTemp" idColumn="productID" autoNew="true"> 
      <column name="productID" type="String" xid="xid1"/>  
      <column name="productName" type="String" xid="xid2"/> 
    </div>  
    <div component="$UI/system/components/justep/data/bizData" autoLoad="true"
      xid="dWhereProducts" concept="DEMO_Products" onAfterRefresh="dWhereProductsAfterRefresh"> 
      <reader xid="default5" action="/demo/common/logic/action/queryDEMO_ProductsAction"/> 
    </div>  
    <div component="$UI/system/components/justep/data/bizData" autoLoad="false"
      xid="dWhere" concept="DEMO_Orders"> 
      <reader xid="default6" action="/demo/common/logic/action/queryDEMO_OrdersAction"/> 
    </div>  
    <div component="$UI/system/components/justep/data/bizData" autoLoad="true"
      xid="dWhereDetails" concept="DEMO_OrderDetails"> 
      <reader xid="default7" action="/demo/common/logic/action/queryDEMO_OrderDetailsAction"/>  
      <master xid="default8" data="dWhere" relation="fOrderID"/> 
    </div>  
    <div component="$UI/system/components/justep/data/bizData" autoLoad="false"
      xid="dDistinctFalse" concept="DEMO_Orders"> 
      <reader xid="default9" action="/demo/common/logic/action/queryDEMO_OrdersAction"/> 
    </div>  
    <div component="$UI/system/components/justep/data/bizData" autoLoad="true"
      xid="dDistinctTrue" concept="DEMO_Orders"> 
      <reader xid="default10" action="/demo/common/logic/action/queryDistinctShipCityAction"/> 
    </div> 
  </div>  
  <div class="x-cell-layout" component="$UI/system/components/justep/cellLayout/cellLayout"
    style="width:100%;height:180px;" xid="cellLayout1"> 
    <layout-content xid="default1"><![CDATA[
  <table cellspacing="0" cellpadding="0" rowHeight="19" columnWidth="80" style="border-collapse:collapse;table-layout:fixed;width:1px;">
     <tr><td ></td><td  style="width: 15px;"></td><td  style="width: 800px;"></td></tr>
     <tr><td ></td><td  style="height: 19px;"></td><td  style="height: 19px;"></td></tr>
     <tr><td ></td><td  style="height: 19px;"></td><td  style="height: 19px;">标准动作是指概念的三个基础动作：queryAction-查询动作、saveAction-保存动作和createAction-新增动作，标准动作的主要作用是为界面组件bizData提供数据的基本操作服务。</td></tr>
     <tr><td ></td><td  style="height: 19px;"></td><td  style="height: 19px;">标准动作一般由设计器向导自动生成，自动生成的标准动作默认实现了按照概念的数据模型和映射定义，执行数据的查询、保存和创建操作。</td></tr>
     <tr><td ></td><td  style="height: 19px;"></td><td  style="height: 19px;">标准动作具有固定的接口参数格式，这些参数为数据存取规则提供了灵活的扩展能力，并且为bizData组件提供了过滤、排序、分页等各种动态操作能力。</td></tr>
     <tr><td ></td><td  style="height: 19px;"></td><td  style="height: 19px;">每个概念的标准动作都可以有多个，用于满足不同的存取需求，在bizData的属性中可以选择使用不同的动作。</td></tr>
     <tr><td ></td><td  style="height: 19px;"></td><td  style="height: 19px;" componentId="model2"></td></tr>
  </table>
]]></layout-content> 
  </div>  
  <div component="$UI/system/components/bootstrap/tabs/tabs" xid="tabs1"> 
    <ul class="nav nav-tabs" xid="ul1"> 
      <li class="active" xid="li1"> 
        <a content="tabContent1" xid="tabItem1"><![CDATA[查询动作 QueryAction]]></a> 
      </li>  
      <li role="presentation" xid="li2"> 
        <a content="tabContent2" xid="tabItem2"><![CDATA[新增动作 CreateAction]]></a> 
      </li>  
      <li xid="li3"> 
        <a content="tabContent3" xid="tabItem3"><![CDATA[保存动作 SaveAction]]></a> 
      </li> 
    </ul>  
    <div class="tab-content" xid="div1"> 
      <div class="tab-pane active" xid="tabContent1"> 
        <div component="$UI/system/components/bootstrap/tabs/tabs" xid="tabs2"> 
          <ul class="nav nav-tabs" xid="ul2"> 
            <li class="active" xid="li4"> 
              <a content="tabContent4" xid="tabItem4"><![CDATA[概述]]></a> 
            </li>  
            <li role="presentation" xid="li5" bind-click="li5Click"> 
              <a content="tabContent5" xid="tabPageQueryExtend"><![CDATA[扩展查询字段]]></a> 
            </li>  
            <li xid="li9" bind-click="li9Click"> 
              <a content="tabContent9" xid="tabItem9"><![CDATA[查询条件中使用子查询]]></a> 
            </li>  
            <li xid="li12" bind-click="li12Click"> 
              <a content="tabContent12" xid="tabItem12"><![CDATA[distinct的使用]]></a> 
            </li> 
          </ul>  
          <div class="tab-content" xid="div2"> 
            <div class="tab-pane active" xid="tabContent4"> 
              <label id="label35" class="xui-label" style="float:left;width:100%;height:20px;"><![CDATA[queryAction是标准查询动作，它通过一组参数的值组合成KSQL的select语句，执行后以Table对象返回查询结果。]]></label>  
              <label id="label1" class="xui-label" style="float:left;width:100%;height:20px;"><![CDATA[queryAction对应bizData的reader属性，bizData的refreshData方法通过调用reader属性对应的queryAction实现数据集的数据刷新操作。]]></label>  
              <label id="label38" class="xui-label" style="float:left;width:100%;height:20px;;">queryAction参数说明：</label>  
              <label id="label39" class="xui-label" style="float:left;width:100%;height:20px;;;"><![CDATA[　　concept - 私有参数，当前查询动作对应的主概念]]></label>  
              <label id="label51" class="xui-label" style="float:left;width:100%;height:20px;"><![CDATA[　　distinct - 公共参数，KSQL的distinct，用于去除重复数据]]></label>  
              <label id="label40" class="xui-label" style="float:left;width:100%;height:20px;;;;">　　select - 私有参数，KSQL的select部分</label>  
              <label id="label42" class="xui-label" style="float:left;width:100%;height:20px;;;;;">　　from - 私有参数，KSQL的from部分</label>  
              <label id="label50" class="xui-label" style="float:left;width:100%;height:20px;"><![CDATA[　　condition - 保护参数，KSQL的where部分，用于服务端过滤]]></label>  
              <label id="label41" class="xui-label" style="float:left;width:100%;height:20px;"><![CDATA[　　range - 权限参数，KSQL的where部分，用于数据权限过滤]]></label>  
              <label id="label52" class="xui-label" style="float:left;width:100%;height:20px;"><![CDATA[　　filter - 公共参数，KSQL的where部分，用于客户端过滤，filter与condition和range是AND关系；为bizData组件提供动态过滤能力]]></label>  
              <label id="label56" class="xui-label" style="float:left;width:100%;height:20px;"><![CDATA[　　orderBy - 公共参数，KSQL的orderBy部分；对应bizData的orderBy属性，为bizData提供动态排序能力]]></label>  
              <label id="label54" class="xui-label" style="float:left;width:100%;height:20px;"><![CDATA[　　offset - 公共参数，KSQL的limit部分，分页的起始行数；为bizData提供动态分页能力]]></label>  
              <label id="label53" class="xui-label" style="float:left;width:100%;height:20px;"><![CDATA[　　limit - 公共参数，KSQL的limit部分，分页的每页行数；对应bizData的limit属性]]></label>  
              <label id="label58" class="xui-label" style="float:left;width:100%;height:20px;"><![CDATA[　　idColumn - 公共参数，定义返回数据集的ID列；对应bizData的行ID，这一列的必须是唯一的，一般使用概念的主键作为ID列]]></label>  
              <label id="label55" class="xui-label" style="float:left;width:100%;height:20px;"><![CDATA[　　columns - 公共参数，定义返回结果集的列，返回的列是select全部列的子集，为空则返回全部列；对应bizData的relations属性]]></label>  
              <label id="label47" class="xui-label" style="float:left;width:100%;height:20px;;;;;;"><![CDATA[　　aggregate - 私有参数，定义聚合统计数据]]></label>  
              <label id="label57" class="xui-label" style="float:left;width:100%;height:20px;"><![CDATA[　　aggregateColumns - 公共参数，定义返回的聚合统计数据列]]></label>  
              <label id="label48" class="xui-label" style="float:left;width:100%;height:20px;;;;;;"><![CDATA[　　dataModel - 私有参数，概念数据映射所对应的data模块]]></label>  
              <label id="label49" class="xui-label" style="float:left;width:100%;height:20px;;;;;;"><![CDATA[　　fnModel - 私有参数，函数模块，用于支持KSQL中用到的表达式函数，为空时默认是"/system/logic/fn"]]></label>  
              <label id="label59" class="xui-label" style="float:left;width:100%;height:20px;"><![CDATA[　　variables - 公共参数，参数值映射，用于支持KSQL中用到的命名参数]]></label> 
            </div>  
            <div class="tab-pane" xid="tabContent5"> 
              <label id="label2" class="xui-label" style="float:left;width:100%;height:20px;"><![CDATA[在queryAction中除了可以查询概念自身的字段，还可以扩展添加"自定义字段"，本案例中展示几种常见的字段扩展方式：]]></label>  
              <label id="label32" class="xui-label" style="float:left;width:100%;height:20px;"><![CDATA[　　1、关联扩展字段：订单概念中只有客户ID，客户名称、联系人、客户电话等三个字段来自于关联概念DEMO_Customers；]]></label>  
              <label id="label32_1" class="xui-label" style="float:left;width:100%;height:20px;"><![CDATA[　　     订单明细中的产品名称和规格也是来自于关联概念DEMO_Products]]></label>  
              <label id="label60" class="xui-label" style="float:left;width:100%;height:20px;;"><![CDATA[　　2、子查询扩展字段：订单概念中没有合计金额，示例中的合计金额来自于子查询合计]]></label>  
              <label id="label61" class="xui-label" style="float:left;width:100%;height:20px;;;"><![CDATA[　　3、CASE扩展字段：订单概念中的状态保存的是状态编码，示例中的状态名称来自于CASE运算]]></label>  
              <label id="label62" class="xui-label" style="float:left;width:100%;height:20px;;;;"><![CDATA[　　4、计算扩展字段：订单明细概念中没有金额，示例中的订单明细金额来自于计算字段]]></label>  
              <label id="label63" class="xui-label" style="float:left;width:100%;height:20px;;;;;"><![CDATA[　　5、Java代码扩展字段：示例中的合计金额大写和运费大写，两个字段的值是在queryDEMO_OrdersAction的自定义代码中，用Java代码动态计算出来的]]></label>  
              <label id="label36" class="xui-label" style="float:left;width:100%;height:20px;margin-top:5px;"><![CDATA[本案例的概念和动作参见：/BIZ/demo/common/ontology/order.ontology.m]]></label>  
              <div component="$UI/system/components/bootstrap/tabs/tabs" xid="tabs3"> 
                <ul class="nav nav-tabs" xid="ul3"> 
                  <li class="active" xid="li6"> 
                    <a content="tabContent6" xid="tabItem6"><![CDATA[示例数据（订单+订单明细）]]></a> 
                  </li>  
                  <li role="presentation" xid="li7"> 
                    <a content="tabContent7" xid="tabItem7"><![CDATA[queryDEMO_OrdersAction（查询订单动作）的KSQL]]></a> 
                  </li>  
                  <li xid="li8"> 
                    <a content="tabContent8" xid="tabItem8"><![CDATA[queryDEMO_OrderDetailsAction（查询订单明细动作）的KSQL]]></a> 
                  </li> 
                </ul>  
                <div class="tab-content" xid="div3"> 
                  <div class="tab-pane active" xid="tabContent6"> 
                    <div component="$UI/system/components/bootstrap/row/row"
                      class="row" xid="row1"> 
                      <div class="col col-xs-12 col-sm-12 col-md-12 col-lg-12"
                        xid="col1"> 
                        <div component="$UI/system/components/justep/grid/grid"
                          hiddenCaptionbar="true" altRows="true" class="x-grid-no-bordered"
                          xid="grid2" data="dOrders" height="200" width="100%"> 
                          <columns xid="columns2"> 
                            <column width="100" name="fOrderNumber" xid="column1"/>  
                            <column width="100" name="fCompanyName" xid="column2"/>  
                            <column width="100" name="fContactName" xid="column3"/>  
                            <column width="100" name="fPhone" xid="column4"/>  
                            <column width="100" name="fTotalMoney" xid="column5"/>  
                            <column width="100" name="fChineseTotalMoney" xid="column6"/>  
                            <column width="100" name="fFreght" xid="column7"/>  
                            <column width="100" name="fChineseFreght" xid="column8"/>  
                            <column width="100" name="fStatus" xid="column9"/>  
                            <column width="100" name="fStatusName" xid="column10"/> 
                          </columns> 
                        </div> 
                      </div>  
                      <div class="col col-xs-12 col-sm-12 col-md-12 col-lg-12"
                        xid="col2"> 
                        <div component="$UI/system/components/justep/grid/grid"
                          hiddenCaptionbar="true" altRows="true" class="x-grid-no-bordered"
                          xid="grid3" data="dOrderDetails" height="200"> 
                          <columns xid="columns3"> 
                            <column width="100" name="fProductName" xid="column11"/>  
                            <column width="100" name="fQuantityPerUnit" xid="column12"/>  
                            <column width="100" name="fUnitPrice" xid="column13"/>  
                            <column width="100" name="fQuantity" xid="column14"/>  
                            <column width="100" name="fDiscount" xid="column15"/>  
                            <column width="100" name="fMoney" xid="column16"/> 
                          </columns> 
                        </div> 
                      </div> 
                    </div> 
                  </div>  
                  <div class="tab-pane" xid="tabContent7"> 
                    <div xid="divQueryDEMO_OrdersAction" style="width:100%;height:200px;"/> 
                  </div>  
                  <div class="tab-pane" xid="tabContent8"> 
                    <div xid="divQueryDEMO_OrderDetailsAction" style="width:100%;height:200px;"/> 
                  </div> 
                </div> 
              </div> 
            </div>  
            <div class="tab-pane" xid="tabContent9"> 
              <label id="label43" class="xui-label" style="float:left;width:100%;height:20px;"><![CDATA[queryAction本质上就是KSQL的select查询，因此只要是KSQL支持的绝大多数语法，在queryAction中都可以使用。]]></label>  
              <label id="label43_1" class="xui-label" style="float:left;width:100%;height:20px;"><![CDATA[（group by和union不能用在queryAction中）]]></label>  
              <label id="label45" class="xui-label" style="float:left;width:100%;height:20px;"><![CDATA[本案例展示在查询条件中使用子查询过滤包含某一个产品的订单。]]></label>  
              <label id="label69" class="xui-label" style="float:left;width:100%;height:20px;"><![CDATA[本案例同时展示了在下拉选择数据集中动态增加一行"全部"的用法。]]></label>  
              <label id="label68" class="xui-label" style="float:left;width:100%;height:20px;margin-top:5px;"><![CDATA[本案例的概念和动作参见：/BIZ/demo/common/ontology/order.ontology.m；页面参见：/UI/demo/actions/process/standardAction/mainActivity.w。]]></label>  
              <div component="$UI/system/components/bootstrap/row/row" class="row"
                xid="row2"> 
                <div class="col col-xs-6 col-sm-6 col-lg-6" xid="col3"> 
                  <div component="$UI/system/components/justep/labelEdit/labelEdit"
                    class="x-label-edit" xid="labelEdit2"> 
                    <label class="x-label" xid="label3" style="width:100px;"><![CDATA[选择产品]]></label>  
                    <div class="x-edit" xid="div5"> 
                      <div class="x-gridSelect" component="$UI/system/components/justep/gridSelect/gridSelect"
                        xid="gridSelect2" bind-ref="dTemp.ref('productID')" bind-labelRef="dTemp.ref('productName')"> 
                        <option xid="option2" data="dWhereProducts" value="DEMO_Products"
                          label="fProductName"/> 
                      </div> 
                    </div> 
                  </div> 
                </div>  
                <div class="col col-xs-2 col-sm-2 col-md-2 col-lg-2" xid="col4"> 
                  <a component="$UI/system/components/justep/button/button"
                    class="btn btn-default" label="查询" xid="btnWhereQuery" onClick="btnWhereQueryClick"> 
                    <i xid="i2"/>  
                    <span xid="span2">查询</span> 
                  </a> 
                </div> 
              </div>  
              <div component="$UI/system/components/bootstrap/tabs/tabs" xid="tabs4"> 
                <ul class="nav nav-tabs" xid="ul4"> 
                  <li class="active" xid="li10"> 
                    <a content="tabContent10" xid="tabItem10"><![CDATA[示例数据（订单+订单明细）]]></a> 
                  </li>  
                  <li role="presentation" xid="li11"> 
                    <a content="tabContent11" xid="tabItem11"><![CDATA[示例代码]]></a> 
                  </li> 
                </ul>  
                <div class="tab-content" xid="div6"> 
                  <div class="tab-pane active" xid="tabContent10"> 
                    <div component="$UI/system/components/bootstrap/row/row"
                      class="row" xid="row3"> 
                      <div class="col col-xs-12 col-sm-12 col-md-12 col-lg-12"
                        xid="col6"> 
                        <div component="$UI/system/components/justep/grid/grid"
                          hiddenCaptionbar="true" altRows="true" class="x-grid-no-bordered"
                          xid="grid1" data="dWhere" height="200" width="100%"> 
                          <columns xid="columns1"> 
                            <column width="100" name="fOrderNumber" xid="column17"/>  
                            <column width="100" name="fCompanyName" xid="column18"/>  
                            <column width="100" name="fContactName" xid="column19"/>  
                            <column width="100" name="fPhone" xid="column20"/>  
                            <column width="100" name="fTotalMoney" xid="column21"/>  
                            <column width="100" name="fChineseTotalMoney" xid="column22"/>  
                            <column width="100" name="fFreght" xid="column23"/>  
                            <column width="100" name="fChineseFreght" xid="column24"/>  
                            <column width="100" name="fStatus" xid="column25"/>  
                            <column width="100" name="fStatusName" xid="column26"/> 
                          </columns> 
                        </div> 
                      </div>  
                      <div class="col col-xs-12 col-sm-12 col-md-12 col-lg-12"
                        xid="col7"> 
                        <div component="$UI/system/components/justep/grid/grid"
                          hiddenCaptionbar="true" altRows="true" class="x-grid-no-bordered"
                          xid="grid4" data="dWhereDetails" height="200" width="100%"> 
                          <columns xid="columns4"> 
                            <column width="100" name="fProductName" xid="column27"/>  
                            <column width="100" name="fQuantityPerUnit" xid="column28"/>  
                            <column width="100" name="fUnitPrice" xid="column29"/>  
                            <column width="100" name="fQuantity" xid="column30"/>  
                            <column width="100" name="fDiscount" xid="column31"/>  
                            <column width="100" name="fMoney" xid="column32"/> 
                          </columns> 
                        </div> 
                      </div> 
                    </div> 
                  </div>  
                  <div class="tab-pane" xid="tabContent11"> 
                    <div xid="divWhereCode" style="height:200px;width:100%;"/> 
                  </div> 
                </div> 
              </div> 
            </div>  
            <div class="tab-pane" xid="tabContent12"> 
              <label id="label77" class="xui-label" style="float:left;width:100%;height:20px;"><![CDATA[queryAction除了前面示例展示的常规用法，还可以通过灵活的参数组合，实现其他很多特殊的查询。]]></label>  
              <label id="label78" class="xui-label" style="float:left;width:100%;height:20px;"><![CDATA[本案例展示用dictinct参数实现去除重复的数据查询，下面显示的数据是订单中的"收货城市"：]]></label>  
              <label id="label70" class="xui-label" style="float:left;width:100%;height:20px;;"><![CDATA[　　1、左面是直接用queryDEMO_OrdersAction返回的结果，里面有很多"收货城市"是重复的]]></label>  
              <label id="label72" class="xui-label" style="float:left;width:100%;height:20px;;;"><![CDATA[　　2、右面是用扩展动作queryDistinctShipCityAction返回的结果，这个动作的select参数中只有fShipCity这一列，并设置参数distinct为true，]]></label>  
              <label id="label72_1" class="xui-label" style="float:left;width:100%;height:20px;;;"><![CDATA[　　***特别注意idColumn参数必须是返回数据中的唯一列]]></label>  
              <label id="label71" class="xui-label" style="float:left;width:100%;height:20px;margin-top:5px;">本案例的概念和动作参见：/BIZ/demo/common/ontology/order.ontology.m</label>  
              <div component="$UI/system/components/bootstrap/tabs/tabs" xid="tabs5"> 
                <ul class="nav nav-tabs" xid="ul5"> 
                  <li class="active" xid="li13"> 
                    <a content="tabContent13" xid="tabItem13"><![CDATA[示例数据]]></a> 
                  </li>  
                  <li role="presentation" xid="li14"> 
                    <a content="tabContent14" xid="tabItem14"><![CDATA[queryDistinctShipCityAction（查询发货城市）的KSQL]]></a> 
                  </li> 
                </ul>  
                <div class="tab-content" xid="div8"> 
                  <div class="tab-pane active" xid="tabContent13"> 
                    <div component="$UI/system/components/bootstrap/row/row"
                      class="row" xid="row4"> 
                      <div class="col col-xs-6 col-sm-6 col-md-6 col-lg-6"
                        xid="col9"> 
                        <div component="$UI/system/components/justep/grid/grid"
                          hiddenCaptionbar="true" altRows="true" class="x-grid-no-bordered"
                          xid="grid5" data="dDistinctFalse" height="200" showRowNumber="true"
                          width="100%"> 
                          <columns xid="columns5"> 
                            <column name="fShipCity" xid="column34" label="收货城市（原始数据）"
                              width="200"/> 
                          </columns> 
                        </div> 
                      </div>  
                      <div class="col col-xs-1 col-sm-1 col-md-1 col-lg-1"
                        xid="col10"/>  
                      <div class="col col-xs-5 col-sm-5 col-lg-5" xid="col12"> 
                        <div component="$UI/system/components/justep/grid/grid"
                          hiddenCaptionbar="true" altRows="true" class="x-grid-no-bordered"
                          xid="grid6" data="dDistinctTrue" height="200" showRowNumber="true"
                          width="100%"> 
                          <columns xid="columns6"> 
                            <column name="fShipCity" xid="column35" label="收货城市（去除重复数据）"
                              width="200"/> 
                          </columns> 
                        </div> 
                      </div> 
                    </div> 
                  </div>  
                  <div class="tab-pane" xid="tabContent14"> 
                    <div xid="divQueryDistinctShipCityAction" style="width:100%;height:200px;"/> 
                  </div> 
                </div> 
              </div> 
            </div> 
          </div> 
        </div> 
      </div>  
      <div class="tab-pane" xid="tabContent2"> 
        <div component="$UI/system/components/bootstrap/tabs/tabs" xid="tabs6"> 
          <ul class="nav nav-tabs" xid="ul6"> 
            <li class="active" xid="li15"> 
              <a content="tabContent15" xid="tabItem15"><![CDATA[概述]]></a> 
            </li>  
            <li role="presentation" xid="li16" bind-click="li16Click"> 
              <a content="tabContent16" xid="tabItem16"><![CDATA[批量新增多行]]></a> 
            </li> 
          </ul>  
          <div class="tab-content" xid="div10"> 
            <div class="tab-pane active" xid="tabContent15"> 
              <label id="label29" class="xui-label" style="float:left;width:100%;height:20px;"><![CDATA[createAction是标准新增动作，它按照概念的关系默认值定义构造新增数据，以Table对象返回新增数据。]]></label>  
              <label id="label85" class="xui-label" style="float:left;width:100%;height:20px;"><![CDATA[createAction只是按照数据模型在内存中构造新增数据，并不涉及物理数据库操作。]]></label>  
              <label id="label28" class="xui-label" style="float:left;width:100%;height:20px;"><![CDATA[createAction对应bizData的creator属性，bizData的newData方法通过调用creator属性对应的createAction实现数据集的新增操作。]]></label>  
              <label id="label19" class="xui-label" style="float:left;width:100%;height:20px;;"><![CDATA[createAction参数说明：]]></label>  
              <label id="label44" class="xui-label" style="float:left;width:100%;height:20px;;;">　　concept - 私有参数，当前查询动作对应的主概念</label>  
              <label id="label26" class="xui-label" style="float:left;width:100%;height:20px;"><![CDATA[　　fnModel - 私有参数，函数模块，用于支持默认值表达式中用到的表达式函数，为空时默认是"/system/logic/fn"]]></label>  
              <label id="label12" class="xui-label" style="float:left;width:100%;height:20px;"><![CDATA[　　table - 公共参数，新增数据的模板，由调用方决定新增数据的行数和数据默认值，如果table数据为空则默认新增一行]]></label>  
              <label id="label73" class="xui-label" style="float:left;width:100%;height:20px;"><![CDATA[　　defaultValues - 公共参数，字段默认值，可以使用业务表达式，描述方式与概念的关系默认值相同；对应bizData数据规则的default-value属性]]></label>  
              <label id="label4" class="xui-label" style="float:left;width:100%;height:20px;;"><![CDATA[调用createAction时默认值的优先级：table > defaultValues > 数据模型中的关系默认值]]></label> 
            </div>  
            <div class="tab-pane" xid="tabContent16"> 
              <label id="label90" class="xui-label" style="float:left;width:100%;height:20px;"><![CDATA[批量新增多行是常见需求，按照一个数据模板或者多选结果一次创建多行数据。这时如果每行数据执行一次createAction会感觉明显的慢，]]></label>  
              <label id="label90_1" class="xui-label" style="float:left;width:100%;height:20px;"><![CDATA[甚至当数据行数很大时，操作耗时是用户无法接受的。]]></label>  
              <label id="label89" class="xui-label" style="float:left;width:100%;height:20px;"><![CDATA[这里我们结合bizData展示createAction批量新增多行数据的使用方法。]]></label>  
              <label id="label3" class="xui-label" style="float:left;width:100%;height:20px;"><![CDATA[本案例展示复制订单明细的实现，用户选择左边的订单，点复制，用bizData的newData方法把选中订单的多行明细一次性添加到右边的新建订单中。]]></label>  
              <label id="label87" class="xui-label" style="float:left;width:100%;height:20px;margin-top:5px;">本案例的概念和动作参见：/BIZ/demo/common/ontology/order.ontology.m；页面参见：/UI/demo/actions/process/standardAction/mainActivity.w。</label>  
              <div component="$UI/system/components/bootstrap/tabs/tabs" xid="tabs7"> 
                <ul class="nav nav-tabs" xid="ul7"> 
                  <li class="active" xid="li17"> 
                    <a content="tabContent17" xid="tabItem17"><![CDATA[复制订单明细示例]]></a> 
                  </li>  
                  <li role="presentation" xid="li18"> 
                    <a content="tabContent18" xid="tabItem18"><![CDATA[复制订单明细示例的javascript代码]]></a> 
                  </li> 
                </ul>  
                <div class="tab-content" xid="div11"> 
                  <div class="tab-pane active" xid="tabContent17"> 
                    <div component="$UI/system/components/bootstrap/row/row"
                      class="row" xid="row6"> 
                      <div class="col col-xs-4" xid="col16"/>  
                      <div class="col col-xs-3" xid="col17"> 
                        <a component="$UI/system/components/justep/button/button"
                          class="btn x-green" label="======&gt;&gt;复制订单明细" xid="btnCopyOrderDetail"
                          style="width:175px;" onClick="btnCopyOrderDetailClick"> 
                          <i xid="i5"/>  
                          <span xid="span5">======&amp;gt;&amp;gt;复制订单明细</span> 
                        </a> 
                      </div>  
                      <div class="col col-xs-4" xid="col18"/> 
                    </div>  
                    <div component="$UI/system/components/bootstrap/row/row"
                      class="row" xid="row7"> 
                      <div class="col col-xs-5 col-sm-5 col-md-5 col-lg-5"
                        xid="col19"> 
                        <div component="$UI/system/components/bootstrap/row/row"
                          class="row" xid="row8"> 
                          <div class="col col-xs-12 col-sm-12 col-md-12 col-lg-12"
                            xid="col22"> 
                            <div component="$UI/system/components/justep/grid/grid"
                              hiddenCaptionbar="true" altRows="true" class="x-grid-no-bordered"
                              xid="grid7" data="dOrders_Source" height="200" width="100%"> 
                              <columns xid="columns7"> 
                                <column width="100" name="fOrderNumber" xid="column33"/>  
                                <column width="100" name="fOrderDate" xid="column36"/>  
                                <column width="100" name="fShipName" xid="column37"/>  
                                <column width="100" name="fCompanyName" xid="column38"/> 
                              </columns> 
                            </div> 
                          </div>  
                          <div class="col col-xs-12 col-sm-12 col-md-12 col-lg-12"
                            xid="col24"> 
                            <div component="$UI/system/components/justep/grid/grid"
                              hiddenCaptionbar="true" altRows="true" class="x-grid-no-bordered"
                              xid="grid9" data="dDetails_Source" height="200" width="100%"> 
                              <columns xid="columns9"> 
                                <column width="100" name="fProductName" xid="column43"/>  
                                <column width="100" name="fQuantityPerUnit" xid="column44"/>  
                                <column width="100" name="fUnitPrice" xid="column45"/>  
                                <column width="100" name="fQuantity" xid="column46"/>  
                                <column width="100" name="fDiscount" xid="column47"/>  
                                <column width="100" name="fMoney" xid="column48"/> 
                              </columns> 
                            </div> 
                          </div> 
                        </div> 
                      </div>  
                      <div class="col col-xs-1 col-sm-1 col-md-1 col-lg-1"
                        xid="col20"/>  
                      <div class="col col-xs-5 col-sm-5 col-md-5 col-lg-5"
                        xid="col21"> 
                        <div component="$UI/system/components/bootstrap/row/row"
                          class="row" xid="row9"> 
                          <div class="col col-xs-12 col-sm-12 col-md-12 col-lg-12"
                            xid="col25"> 
                            <div component="$UI/system/components/justep/grid/grid"
                              hiddenCaptionbar="true" altRows="true" class="x-grid-no-bordered"
                              xid="grid8" data="dOrders_Dest" height="200" width="100%"> 
                              <columns xid="columns8"> 
                                <column width="100" name="fOrderNumber" xid="column39"/>  
                                <column width="100" name="fOrderDate" xid="column40"/>  
                                <column width="100" name="fShipName" xid="column41"/>  
                                <column width="100" name="fCompanyName" xid="column42"/> 
                              </columns> 
                            </div> 
                          </div>  
                          <div class="col col-xs-12 col-sm-12 col-md-12 col-lg-12"
                            xid="col26"> 
                            <div component="$UI/system/components/justep/grid/grid"
                              hiddenCaptionbar="true" altRows="true" class="x-grid-no-bordered"
                              xid="grid10" data="dDetails_Dest" height="200" width="100%"> 
                              <columns xid="columns10"> 
                                <column width="100" name="fProductName" xid="column49"/>  
                                <column width="100" name="fQuantityPerUnit" xid="column50"/>  
                                <column width="100" name="fUnitPrice" xid="column51"/>  
                                <column width="100" name="fQuantity" xid="column52"/>  
                                <column width="100" name="fDiscount" xid="column53"/>  
                                <column width="100" name="fMoney" xid="column54"/> 
                              </columns> 
                            </div> 
                          </div> 
                        </div> 
                      </div> 
                    </div> 
                  </div>  
                  <div class="tab-pane" xid="tabContent18"> 
                    <div xid="divCopyOrderDetail" style="height:200px;"/> 
                  </div> 
                </div> 
              </div> 
            </div> 
          </div> 
        </div> 
      </div>  
      <div class="tab-pane" xid="tabContent3"> 
        <div component="$UI/system/components/bootstrap/tabs/tabs" xid="tabs8"> 
          <ul class="nav nav-tabs" xid="ul8"> 
            <li class="active" xid="li19"> 
              <a content="tabContent19" xid="tabItem19"><![CDATA[概述]]></a> 
            </li>  
            <li role="presentation" xid="li20" bind-click="li20Click"> 
              <a content="tabContent20" xid="tabItem20"><![CDATA[保存时验证数据]]></a> 
            </li> 
          </ul>  
          <div class="tab-content" xid="div4"> 
            <div class="tab-pane active" xid="tabContent19"> 
              <label id="label15" class="xui-label" style="float:left;width:100%;height:20px;"><![CDATA[saveAction是标准保存动作，它实现将Table数据按照数据模型的映射定义，存储到物理数据库中。]]></label>  
              <label id="label11" class="xui-label" style="float:left;width:100%;height:20px;"><![CDATA[createAction对应bizData的writer属性，bizData的saveData方法通过调用writer属性对应的saveAction实现数据集的保存操作。]]></label>  
              <label id="label5" class="xui-label" style="float:left;width:100%;height:20px;;"><![CDATA[saveAction参数说明：]]></label>  
              <label id="label14" class="xui-label" style="float:left;width:100%;height:20px;"><![CDATA[　　concept - 私有参数，当前保存动作对应的主概念，saveAction只保存table中主概念的关系数据，对于关联关系、计算关系等不做处理]]></label>  
              <label id="label23" class="xui-label" style="float:left;width:100%;height:20px;">　　dataModel - 私有参数，概念数据映射所对应的data模块</label>  
              <label id="label21" class="xui-label" style="float:left;width:100%;height:20px;"><![CDATA[　　fnModel - 私有参数，函数模块，用于支持权限表达式中用到的表达式函数，为空时默认是"/system/logic/fn"]]></label>  
              <label id="label6" class="xui-label" style="float:left;width:100%;height:20px;"><![CDATA[　　insertRange - 权限参数，新增数据权限，如果通过数据权限为insertRange参数设置了KSQL条件表达式，保存时会判断"新增数据"是否满足条件，]]></label>  
              <label id="label6_1" class="xui-label" style="float:left;width:100%;height:20px;"><![CDATA[　　如果不满足条件则抛出异常阻止保存]]></label>  
              <label id="label24" class="xui-label" style="float:left;width:100%;height:20px;"><![CDATA[　　deleteRange - 权限参数，删除数据权限，如果通过数据权限为deleteRange参数设置了KSQL条件表达式，保存时会判断"删除数据"是否满足条件，]]></label>  
              <label id="label24_1" class="xui-label" style="float:left;width:100%;height:20px;"><![CDATA[　　如果不满足条件则抛出异常阻止保存]]></label>  
              <label id="label25" class="xui-label" style="float:left;width:100%;height:20px;"><![CDATA[　　updateRange - 权限参数，修改数据权限，如果通过数据权限为updateRange参数设置了KSQL条件表达式，保存时会判断"修改数据"是否满足条件，]]></label>  
              <label id="label25_1" class="xui-label" style="float:left;width:100%;height:20px;"><![CDATA[　　如果不满足条件则抛出异常阻止保存]]></label>  
              <label id="label16" class="xui-label" style="float:left;width:100%;height:20px;"><![CDATA[　　table - 公共参数，要保存的数据，bizData组件的saveData方法只将当前数据集中已变更（增删改）的数据传到saveAction]]></label>  
              <label id="label18" class="xui-label" style="float:left;width:100%;height:20px;"><![CDATA[　　readonly - 保护参数，只读的数据列（多个列以逗号分隔），saveAction在保存时会忽略readonly参数中给出的列，也就是说不保存只读的数据列]]></label>  
              <label id="label27" class="xui-label" style="float:left;width:100%;height:20px;;"><![CDATA[　　notNull - 保护参数，必填的数据列（多个列以逗号分隔），saveAction在保存时会验证notNull参数中给出的列，判断数据不能为空，如果数据为空则抛出异常阻止保存]]></label> 
            </div>  
            <div class="tab-pane" xid="tabContent20"> 
              <label id="label20" class="xui-label" style="float:left;width:100%;height:20px;"><![CDATA[标准保存动作只实现了基本的保存能力，而在实际业务开发过程中，在保存前后往往有更多的业务逻辑。]]></label>  
              <label id="label8" class="xui-label" style="float:left;width:100%;height:20px;"><![CDATA[本案例展示在订单明细保存动作的前事件中，检查订单明细中的产品数量是否大于库存数量，如果大于则抛出异常阻止保存。]]></label>  
              <label id="label7" class="xui-label" style="float:left;width:100%;height:20px;margin-top:5px;">本案例的功能模型参见：/BIZ/demo/actions/process/standardAction/standardActionProcess.process.m。</label>  
              <label id="label13" class="xui-label" style="float:left;width:100%;height:20px;"><![CDATA[本案例的事件代码参见：/BIZ/demo/actions/process/standardAction/dsrc/StandardActionProcess.java。]]></label> 
            <div component="$UI/system/components/bootstrap/row/row" class="row" xid="row5">
   <div class="col col-xs-12 col-sm-12 col-md-12 col-lg-12" xid="col5"><div component="$UI/system/components/bootstrap/row/row" class="row" xid="row10">
   <div class="col col-xs-1 col-sm-1 col-md-1 col-lg-1" xid="col13"><a component="$UI/system/components/justep/button/button" class="btn btn-default" label="保存" xid="button1" onClick="{operation:'dDetails_Save.save'}">
   <i xid="i1"></i>
   <span xid="span1">保存</span></a></div>
   <div class="col col-xs-6 col-sm-6 col-md-6 col-lg-6" xid="col14"><label xid="label4" style="color:#0000FF;"><![CDATA[在下面的订单明细中修改产品数量，改成一个很大(>1000)的数量后点击保存。]]></label></div>
   <div class="col col-xs-4" xid="col15"></div></div></div>
   <div class="col col-xs-12 col-sm-12 col-md-12 col-lg-12" xid="col8"><div component="$UI/system/components/bootstrap/tabs/tabs" xid="tabs9">
   <ul class="nav nav-tabs" xid="ul9">
    <li class="active" xid="li21">
     <a content="tabContent21" xid="tabItem21"><![CDATA[示例数据（订单+订单明细）]]></a></li> 
    </ul> 
   <div class="tab-content" xid="div7">
    <div class="tab-pane active" xid="tabContent21"><div component="$UI/system/components/bootstrap/row/row" class="row" xid="row11">
   <div class="col col-xs-12 col-sm-12 col-md-12 col-lg-12" xid="col11"><div component="$UI/system/components/justep/grid/grid" hiddenCaptionbar="true" altRows="true" class="x-grid-no-bordered" xid="grid11" data="dOrders_Save" height="200" width="100%">
   <columns xid="columns11"><column width="100" name="fOrderNumber" xid="column55"></column>
  <column width="150" name="fCompanyName" xid="column56"></column>
  <column width="100" name="fContactName" xid="column57"></column>
  <column width="100" name="fPhone" xid="column58"></column>
  <column width="100" name="fFreght" xid="column59"></column>
  <column width="100" name="fChineseFreght" xid="column60"></column>
  <column width="100" name="fStatus" xid="column61"></column>
  <column width="100" name="fStatusName" xid="column62"></column></columns></div></div>
   <div class="col col-xs-12 col-sm-12 col-md-12 col-lg-12" xid="col23"><div component="$UI/system/components/justep/grid/grid" hiddenCaptionbar="true" altRows="true" class="x-grid-no-bordered" xid="grid12" data="dDetails_Save" height="200" width="100%">
   <columns xid="columns12"><column width="150" name="fProductName" xid="column63"></column>
  <column width="100" name="fQuantityPerUnit" xid="column64"></column>
  <column width="100" name="fUnitPrice" xid="column65"></column>
  <column width="100" name="fQuantity" xid="column66" editable="true"><editor xid="editor1">
   <input component="$UI/system/components/justep/input/input" class="form-control" xid="input1" bind-ref="ref('fQuantity')"></input></editor></column></columns></div></div>
   </div></div>
    </div> </div></div>
   </div></div> 
          </div> 
        </div> 
      </div> 
    </div> 
  </div> 
</div>
