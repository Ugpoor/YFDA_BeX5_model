<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window" component="$UI/system/components/justep/window/window"
  design="device:pc">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:153px;top:47px;"
    onLoad="modelLoad"> 
    <div component="$UI/system/components/justep/data/data" autoLoad="true"
      xid="data" idColumn="fID"> 
      <column label="ID" name="fID" type="String" xid="xid1"/>  
      <column label="起止日期" name="date" type="String" xid="xid2"/>  
      <column label="关键词" name="keyword" type="String" xid="xid12"/>  
      <column label="选中项" name="curSel" type="String" xid="xid13"/>  
      <data xid="default1">[{"fID":"1"},{"fID":"2"},{"fID":"3"},{"fID":"4"},{"fID":"5"},{"fID":"6"},{"fID":"7"},{"fID":"8"}]</data>  
      <rule xid="rule1"> 
        <col name="curSel" xid="ruleCol1"> 
          <calculate xid="calculate1"> 
            <expr xid="default6">"起止时间："+ $model.dateData.val("startDate")+"--"+ $model.dateData.val("endDate")+" 交易类型： "+ $model.tradeTypeData.val("tradeType")+" 交易状态：" + $model.datas.val("tradeState")+" 时间类型：" + $model.datetypeData.val("dateType")+" 资金流向："+ $model.fundFlowData.val("fundFlow")+" 金额范围：" + $model.moneyRangeData.val("minMoney")+"--"+ $model.moneyRangeData.val("maxMoney")+" 关键词： "+ $model.keywordData.val("keyword")</expr>
          </calculate> 
        </col>  
        <col name="startDate" xid="ruleCol2"> 
          <constraint xid="constraint1"> 
            <expr xid="default7">true</expr>  
            <message xid="default8">必填</message>
          </constraint> 
        </col>  
        <col name="endDate" xid="ruleCol3"> 
          <constraint xid="constraint2"> 
            <expr xid="default9">true</expr>  
            <message xid="default10">必填</message>
          </constraint> 
        </col> 
      </rule>  
      <column label="金额范围" name="moneyRange" type="String" xid="xid23"/>
    </div>  
    <div component="$UI/system/components/justep/data/data" autoLoad="true"
      xid="datas" idColumn="fID">
      <column label="ID" name="fID" type="String" xid="xid5"/>  
      <column label="交易状态" name="tradeState" type="String" xid="xid4"/>  
      <data xid="default1">[{"fID":"1","tradeState":"全部"},{"fID":"2","tradeState":"进行中"},{"fID":"3","tradeState":"未付款"},{"fID":"4","tradeState":"等待发货"},{"fID":"5","tradeState":"未确认收货"},{"fID":"6","tradeState":"成功"},{"fID":"7","tradeState":"失败"},{"fID":"8","tradeState":"退款"}]</data>
    </div>  
    <div component="$UI/system/components/justep/data/data" autoLoad="true"
      xid="datetypeData" idColumn="fID">
      <column label="ID" name="fID" type="String" xid="xid6"/>  
      <column label="时间类型" name="dateType" type="String" xid="xid7"/>  
      <data xid="default2">[{"dateType":"创建时间"},{"dateType":"付款时间"},{"dateType":"收款时间"}]</data>
    </div>  
    <div component="$UI/system/components/justep/data/data" autoLoad="true"
      xid="fundFlowData" idColumn="fID">
      <column label="ID" name="fID" type="String" xid="xid8"/>  
      <column label="资金流向" name="fundFlow" type="String" xid="xid9"/>  
      <data xid="default3">[{"fundFlow":"全部"},{"fundFlow":"收入"},{"fundFlow":"支出"}]</data>
    </div>  
    <div component="$UI/system/components/justep/data/data" autoLoad="true"
      xid="displayData" idColumn="display">
      <column label="显示隐藏" name="display" type="String" xid="xid14"/>  
      <data xid="default4">[{"display":"1"}]</data>
    </div>  
    <div component="$UI/system/components/justep/data/data" autoLoad="true"
      xid="tradeTypeData" idColumn="tradeType">
      <column label="交易类型" name="tradeType" type="String" xid="xid15"/>  
      <data xid="default5">[{"tradeType":"全部"},{"tradeType":"淘宝购物"},{"tradeType":"收款"},{"tradeType":"付款"},{"tradeType":"缴水电煤"},{"tradeType":"信用卡还款"},{"tradeType":"转账到银行卡"},{"tradeType":"理财"}]</data>
    </div>  
    <div component="$UI/system/components/justep/data/data" autoLoad="true"
      xid="dateData" idColumn="startDate">
      <column label="开始时间" name="startDate" type="Date" xid="xid18"/>  
      <column label="结束时间" name="endDate" type="Date" xid="xid19"/>  
      <data xid="default13">[{}]</data>  
      <rule xid="rule2"> 
        <col name="startDate" xid="ruleCol4"> 
          <calculate xid="calculate2"> 
            <expr xid="default14"/>
          </calculate> 
        </col> 
      </rule>
    </div>  
    <div component="$UI/system/components/justep/data/data" autoLoad="true"
      xid="moneyRangeData" idColumn="minMoney">
      <column label="最小金额" name="minMoney" type="Float" xid="xid20"/>  
      <column label="最大金额" name="maxMoney" type="Float" xid="xid21"/>  
      <data xid="default11">[{"minMoney":0,"maxMoney":0}]</data>
    </div>  
    <div component="$UI/system/components/justep/data/data" autoLoad="true"
      xid="keywordData" idColumn="keyword">
      <column label="关键词" name="keyword" type="String" xid="xid22"/>  
      <data xid="default12">[{"keyword":""}]</data>
    </div>
  </div>  
  <div component="$UI/system/components/justep/contents/contents" class="x-contents x-full"
    active="0" xid="contents"> 
    <div class="x-contents-content pull-right" xid="content1"> 
      <h4 xid="h41"><![CDATA[文件条件选择
  
    ]]>
  <a component="$UI/system/components/justep/button/button" class="btn btn-link" label="js" xid="jsBtn" onClick="jsBtnClick">
   <i xid="i1"></i>
   <span xid="span4">js</span></a>
  <a component="$UI/system/components/justep/button/button" class="btn btn-link " label="源码" xid="sourceBtn" onClick="sourceClick">
   <i xid="i1"></i>
   <span xid="span3">源码</span></a></h4><div component="$UI/system/components/justep/controlGroup/controlGroup"
        class="x-control-group" title="1.这是仿支付宝用户中心的条件筛选示例" xid="controlGroup2"> 
        <div class="x-control-group-title" xid="controlGroupTitle2"> 
          <span xid="span2">title</span> 
        </div>  
        <div component="$UI/system/components/bootstrap/row/row" class="row"
          xid="row2" style="height:57px;"> 
          <div class="col col-xs-2 " xid="col7"> 
            <label xid="label" class="css" style="font-size:large;"><![CDATA[交易记录]]></label> 
          </div> 
        </div>  
        <div component="$UI/system/components/bootstrap/row/row" class="row"
          xid="row3"> 
          <div class="col col-xs-6 col-sm-6 col-md-6 col-lg-6" xid="col8"> 
            <div component="$UI/system/components/justep/labelEdit/labelEdit"
              class="x-label-edit x-label30 pull-left" xid="labelInput1"> 
              <label class="x-label" xid="label2" bind-text="data.label('date')"
                style="width:68px;"/>  
              <input component="$UI/system/components/justep/input/input" class="form-control x-edit"
                xid="input" dataType="Date" style="width:122px;" bind-ref="dateData.ref('startDate')"/> 
            </div>  
            <label xid="label6" style="height:auto;width:auto;" class="pull-left labe"><![CDATA[—]]></label>  
            <div component="$UI/system/components/justep/labelEdit/labelEdit"
              class="x-label-edit x-label30 pull-left" xid="labelInput3"> 
              <input component="$UI/system/components/justep/input/input" class="form-control x-edit"
                xid="dateInput" dataType="Date" style="width:130px;" bind-ref="dateData.ref('endDate')"
                format="yyyy-MM-dd"/> 
            </div> 
          </div> 
        </div>  
        <div component="$UI/system/components/bootstrap/row/row" class="row"
          xid="row4"> 
          <div class="col col-xs-12" xid="col12"> 
            <label xid="label8" class="pull-left css"><![CDATA[交易类型]]></label>  
            <div component="$UI/system/components/justep/list/list" class="x-list"
              xid="list1" data="tradeTypeData"> 
              <ul class="x-list-template" xid="listTemplateUl1"> 
                <li xid="li1" class="pull-left"> 
                  <div component="$UI/system/components/justep/labelEdit/labelEdit"
                    class="x-label-edit x-label30" xid="labelOutput1"> 
                    <label class="x-label" xid="label7" style="width:13.75px;"/>  
                    <div component="$UI/system/components/justep/output/output"
                      class="x-output x-edit " xid="output" style="border-radius:4px;"
                      bind-ref="ref('tradeType')" bind-css="{'bg-success':val('tradeType')==data.val('tradeType')}"/> 
                  </div> 
                </li> 
              </ul> 
            </div> 
          </div> 
        </div>  
        <div component="$UI/system/components/bootstrap/row/row" class="row"
          xid="row5"> 
          <div class="col col-xs-12" xid="col14"> 
            <label xid="label10" class="pull-left css"><![CDATA[交易状态]]></label>  
            <div component="$UI/system/components/justep/list/list" class="x-list"
              xid="list2" data="datas"> 
              <ul class="x-list-template" xid="listTemplateUl2"> 
                <li xid="li2" class="pull-left"> 
                  <div component="$UI/system/components/justep/labelEdit/labelEdit"
                    class="x-label-edit x-label30" xid="labelOutput2"> 
                    <label class="x-label" xid="label9" style="width:13.75px;"/>  
                    <div component="$UI/system/components/justep/output/output"
                      class="x-output x-edit tradestate" xid="tradeStateOutput" style="border-radius:4px;"
                      bind-ref="ref('tradeState')" bind-css="{'bg-success':val('tradeState') == data.val(&quot;tradeState&quot;)}"/> 
                  </div> 
                </li> 
              </ul> 
            </div>  
            <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-right pull-right"
              label="高级筛选" xid="highGradeBtn" icon="icon-arrow-down-b" onClick="highGradeBtnClick"
              bind-visible=" $model.displayData.val(&quot;display&quot;)==1"> 
              <i xid="i2" class="icon-arrow-down-b"/>  
              <span xid="span1">高级筛选</span>
            </a>
          </div> 
        </div>  
        <div xid="div1" bind-visible=" $model.displayData.val(&quot;display&quot;)==0">
          <div component="$UI/system/components/bootstrap/row/row" class="row"
            xid="row1"> 
            <div class="col col-xs-12" xid="col1"> 
              <label xid="label1" class="pull-left css"><![CDATA[时间类型]]></label>  
              <div component="$UI/system/components/justep/list/list" class="x-list"
                xid="list3" data="datetypeData"> 
                <ul class="x-list-template" xid="listTemplateUl3"> 
                  <li xid="li3" class="pull-left"> 
                    <div component="$UI/system/components/justep/labelEdit/labelEdit"
                      class="x-label-edit x-label30" xid="labelOutput3"> 
                      <label class="x-label" xid="label3" style="width:13.75px;"/>  
                      <div component="$UI/system/components/justep/output/output"
                        class="x-output x-edit" xid="dateTypeOutput" style="border-radius:4px;"
                        bind-ref="ref('dateType')" bind-css="{'bg-success':val('dateType') == data.val(&quot;dateType&quot;)}"/>
                    </div> 
                  </li> 
                </ul> 
              </div> 
            </div> 
          </div>  
          <div component="$UI/system/components/bootstrap/row/row" class="row"
            xid="row6"> 
            <div class="col col-xs-12" xid="col2"> 
              <label xid="label4" class="pull-left css"><![CDATA[资金流向]]></label>  
              <div component="$UI/system/components/justep/list/list" class="x-list"
                xid="list4" data="fundFlowData"> 
                <ul class="x-list-template" xid="listTemplateUl4"> 
                  <li xid="li4" class="pull-left"> 
                    <div component="$UI/system/components/justep/labelEdit/labelEdit"
                      class="x-label-edit x-label30" xid="labelOutput4"> 
                      <label class="x-label" xid="label11" style="width:13.75px;"/>  
                      <div component="$UI/system/components/justep/output/output"
                        class="x-output x-edit" xid="fundflowOutput" style="border-radius:4px;"
                        bind-ref="ref('fundFlow')" bind-css="{'bg-success':val('fundFlow') == data.val(&quot;fundFlow&quot;)}"/>
                    </div>
                  </li> 
                </ul> 
              </div> 
            </div> 
          </div>  
          <div component="$UI/system/components/bootstrap/row/row" class="row"
            xid="row7"> 
            <div class="col col-xs-6 col-sm-6 col-md-6 col-lg-6" xid="col3"> 
              <div component="$UI/system/components/justep/labelEdit/labelEdit"
                class="x-label-edit x-label30 pull-left" xid="labelInput4"> 
                <label class="x-label" xid="label12" bind-text="data.label('moneyRange')"
                  style="width:68px;"/>  
                <input component="$UI/system/components/justep/input/input" class="form-control x-edit"
                  xid="minInput" dataType="Float" style="width:122px;" bind-ref="moneyRangeData.ref('minMoney')"/>
              </div>  
              <label xid="label13" style="height:auto;width:auto;" class="pull-left labe">—</label>  
              <div component="$UI/system/components/justep/labelEdit/labelEdit"
                class="x-label-edit x-label30 pull-left" xid="labelInput2"> 
                <input component="$UI/system/components/justep/input/input" class="form-control x-edit"
                  xid="maxInput" dataType="Float" style="width:130px;" bind-ref="moneyRangeData.ref('maxMoney')"/>
              </div> 
            </div> 
          </div>  
          <div component="$UI/system/components/bootstrap/row/row" class="row"
            xid="row8"> 
            <div class="col col-xs-12 col-sm-12 col-md-12 col-lg-12" xid="col5"> 
              <div component="$UI/system/components/justep/labelEdit/labelEdit"
                class="x-label-edit x-label30 pull-left" xid="labelInput7"> 
                <label class="x-label" xid="label16" bind-text="data.label('keyword')"
                  style="width:68px;"/>  
                <input component="$UI/system/components/justep/input/input" class="form-control x-edit"
                  xid="keywordInput" style="width:122px;" bind-ref="keywordData.ref('keyword')"/>
              </div>  
              <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-right pull-right"
                label="返回基本筛选" xid="backBtn" icon="icon-arrow-up-b" onClick="backBtnClick"> 
                <i xid="i8" class="icon-arrow-up-b"/>  
                <span xid="span9">返回基本筛选</span>
              </a>
            </div> 
          </div>
        </div>
        <div xid="div2">
          <div component="$UI/system/components/justep/labelEdit/labelEdit"
            class="x-label-edit x-label30" xid="labelTextarea1" style="width:auto;"> 
            <label class="x-label" xid="label18" bind-text="data.label('curSel')"
              style="width:68px;"/>  
            <textarea component="$UI/system/components/justep/textarea/textarea"
              class="form-control x-edit" xid="textarea1" bind-ref="data.ref('curSel')"
              style="width:236px;color:#FF0000;"/>
          </div>
        </div> 
      </div> 
    </div> 
  </div> 
</div>
