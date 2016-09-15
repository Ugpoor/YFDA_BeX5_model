<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window" component="$UI/system/components/justep/window/window"
  design="device:pc">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:277px;top:566px;"
    onLoad="modelLoad">
    <div component="$UI/system/components/justep/data/baasData" autoLoad="true"
      xid="cuisineOrderData" saveAction="saveTakeout_order" queryAction="queryTakeout_order"
      tableName="takeout_order" url="/takeoutAdmin/order" idColumn="fID" limit="10"> 
      <column label="订单ID" name="fID" type="String" xid="default15"/>  
      <column label="下单时间" name="fCreateTime" type="DateTime" xid="default16"/>  
      <column label="订单内容" name="fContent" type="String" xid="default17"/>  
      <column label="合计金额" name="fSum" type="Decimal" xid="default18"/>  
      <column label="下单人ID" name="fUserID" type="String" xid="default19"/>  
      <column label="用户名" name="fUserName" type="String" xid="default20"/>  
      <column label="电话号码" name="fPhoneNumber" type="String" xid="default21"/>  
      <column label="订单地址" name="fAddress" type="String" xid="default22"/>  
      <column label="付款状态" name="fPayState" type="Integer" xid="default23"/>  
      <column label="配送状态" name="fDispatchingState" type="Integer" xid="default24"/>  
      <column isCalculate="true" label="日合计金额" name="fDaySum" type="String" xid="xid3"/>  
      <filter name="filter0" xid="filter1"/>
    </div>  
    <div component="$UI/system/components/justep/data/data" autoLoad="true"
      xid="DispatchingStateData" idColumn="value"> 
      <column label="值" name="value" type="String" xid="xid1"/>  
      <column label="显示值" name="oValue" type="String" xid="xid2"/>  
      <data xid="default25">[{"value":"0","oValue":"已取消"},{"value":"1","oValue":"未配送"},{"value":"2","oValue":"已配送"}]</data>
    </div>
  </div>  
  <div component="$UI/system/components/justep/toolBar/toolBar" class="x-toolbar x-toolbar-spliter form-inline"
    xid="toolBar2"> 
    <a component="$UI/system/components/justep/button/button" class="btn btn-link"
      label="查看详情" xid="showOrderDetail" icon="icon-android-book" onClick="showOrderDetailClick"> 
      <i xid="i1" class="icon-android-book"/>  
      <span xid="span20">查看详情</span>
    </a>  
    <a component="$UI/system/components/justep/button/button" class="btn btn-link"
      label="保存修改" xid="save" icon="icon-edit" onClick="saveClick"> 
      <i xid="i4" class="icon-edit"/>  
      <span xid="span23">保存修改</span>
    </a>  
    <a component="$UI/system/components/justep/button/button" class="btn btn-link"
      label="展开过滤" xid="spread" icon="icon-android-add" onClick="spreadClick"> 
      <i xid="i3" class="icon-android-add"/>  
      <span xid="span22">展开过滤</span>
    </a>  
    <div xid="filterDetail"> 
      <span xid="span24">下单时间：</span>  
      <input component="$UI/system/components/justep/input/input" class="form-control"
        xid="startDate" format="yyyy-MM-dd hh:mm" dataType="DateTime"/>  
      <span xid="span26">~</span>  
      <input component="$UI/system/components/justep/input/input" class="form-control"
        xid="endDate" format="yyyy-MM-dd" dataType="Date"/>  
      <input component="$UI/system/components/justep/input/input" class="form-control"
        xid="userName" placeHolder="输入下单人姓名"/>  
      <select component="$UI/system/components/justep/select/select" class="form-control"
        xid="dispatchingState" bind-options="DispatchingStateData" bind-optionsValue="value"
        bind-optionsLabel="oValue"/>  
      <a component="$UI/system/components/justep/button/button" class="btn btn-link"
        label="查询" xid="filterBtn" icon="icon-android-search" onClick="filterBtnClick"> 
        <i xid="i5" class="icon-android-search"/>  
        <span xid="span29">查询</span>
      </a>  
      <a component="$UI/system/components/justep/button/button" class="btn btn-link"
        label="清空" xid="empty" icon="icon-android-close" onClick="emptyClick"> 
        <i xid="i7" class="icon-android-close"/>  
        <span xid="span30">清空</span>
      </a> 
    </div> 
  
  
  
  
  </div>  
  <table component="$UI/system/components/justep/list/list" class="x-list table" xid="orderList" data="cuisineOrderData" bind-dblclick="orderListDblclick"> 
    <thead xid="thead1"> 
      <tr xid="tr1"> 
        <th xid="default1">用户名</th>
        <th xid="default1">订单内容</th>
        <th xid="default1">合计金额（元）</th>
        <th xid="default1">下单时间</th>
        <th xid="default1">配送状态</th>
      </tr> 
    </thead>  
    <tbody class="x-list-template x-min-height" xid="listTemplate1" componentname="$UI/system/components/justep/list/list#listTemplate" id="undefined_listTemplate1"> 
      <tr xid="tr2" class="x-min-height" componentname="tr" id="undefined_tr2"> 
        <td xid="td1"><div component="$UI/system/components/justep/output/output" class="x-output" xid="output1" bind-ref="ref('fUserName')"></div></td>
        <td xid="td1"><div component="$UI/system/components/justep/output/output" class="x-output" xid="output2" bind-ref="ref('fContent')"></div></td>
        <td xid="td1"><div component="$UI/system/components/justep/output/output" class="x-output" xid="output3" bind-ref="ref('fSum')"></div></td>
        <td xid="td1"><div component="$UI/system/components/justep/output/output" class="x-output" xid="output4" bind-ref="ref('fCreateTime')"></div></td>
        <td xid="td1"><select component="$UI/system/components/justep/select/select" class="form-control" xid="select1" bind-ref="ref('fDispatchingState')" bind-options="$model.DispatchingStateData" bind-optionsValue="value" bind-optionsLabel="oValue"></select></td>
      </tr> 
    </tbody> 
  </table>
  <div component="$UI/system/components/justep/pagerBar/pagerBar" class="x-pagerbar container-fluid"
    xid="pagerBar2" data="cuisineOrderData"> 
    <div class="row" xid="div11"> 
      <div class="col-sm-3" xid="div12"> 
        <div class="x-pagerbar-length" xid="div13"> 
          <label component="$UI/system/components/justep/pagerLimitSelect/pagerLimitSelect"
            class="x-pagerlimitselect" xid="pagerLimitSelect2" defaultValue="10"> 
            <span xid="span8">显示</span>  
            <select component="$UI/system/components/justep/select/select" class="form-control input-sm"
              xid="select2"> 
              <option value="10" xid="default11">10</option>  
              <option value="20" xid="default12">20</option>  
              <option value="50" xid="default13">50</option>  
              <option value="100" xid="default14">100</option>
            </select>  
            <span xid="span9">条</span>
          </label> 
        </div> 
      </div>  
      <div class="col-sm-3" xid="div14"> 
        <div class="x-pagerbar-info" xid="div15">当前显示0条，共0条</div>
      </div>  
      <div class="col-sm-6" xid="div16"> 
        <div class="x-pagerbar-pagination" xid="div17"> 
          <ul class="pagination" component="$UI/system/components/bootstrap/pagination/pagination"
            xid="pagination2"> 
            <li class="prev" xid="li1"> 
              <a href="#" xid="a1"> 
                <span aria-hidden="true" xid="span10">«</span>  
                <span class="sr-only" xid="span11">Previous</span>
              </a> 
            </li>  
            <li class="next" xid="li7"> 
              <a href="#" xid="a2"> 
                <span aria-hidden="true" xid="span18">»</span>  
                <span class="sr-only" xid="span19">Next</span>
              </a> 
            </li> 
          </ul> 
        </div> 
      </div> 
    </div> 
  </div>  
  <span component="$UI/system/components/justep/windowDialog/windowDialog" xid="orderWindowDialog"
    status="normal" src="orderDetail.w" title="订单详情" showTitle="true" width="45%"
    height="65%"/>
</div>
