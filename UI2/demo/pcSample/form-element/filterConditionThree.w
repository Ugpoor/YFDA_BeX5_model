<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window" component="$UI/system/components/justep/window/window"
  design="device:pc">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:126px;top:217px;">
    <div component="$UI/system/components/justep/data/data" autoLoad="true"
      xid="deadlineData" idColumn="fID"> 
      <column label="ID" name="fID" type="String" xid="xid1"/>  
      <column label="认购期限" name="deadline" type="String" xid="xid2"/>  
      <column label="产品类型" name="productType" type="String" xid="xid7"/>  
      <column label="起购金额" name="amount" type="String" xid="xid11"/>  
      <column label="理财期限" name="financialperiod" type="String" xid="xid16"/>  
      <column label="年收益" name="earnings" type="String" xid="xid17"/>  
      <data xid="default1">[{"fID":"true","deadline":"全部","productType":"全部","amount":"全部","financialperiod":"全部","earnings":"全部 "},{"fID":"true","deadline":"在售","productType":"定期","amount":"5千以下(不含)","financialperiod":"1个月以下(不含)","earnings":"3%以下(不含)"},{"fID":"true","deadline":"预售","productType":"活期","amount":"5千到5万(不含)","financialperiod":"1-6个月(不含)","earnings":" 3%-5%(不含)"},{"fID":"true","deadline":"已停售","productType":"通知存款","amount":"5万以上","financialperiod":"6个月-1年(不含)","earnings":" 5%及以上"},{"fID":"true","productType":"理财产品","financialperiod":"1-5年"},{"fID":"true","productType":"无抵押贷款","financialperiod":"不定期"}]</data>
    </div>  
    <div component="$UI/system/components/justep/data/data" autoLoad="true"
      xid="checkData" idColumn="fID" confirmDelete="false"> 
      <column label="ID" name="fID" type="String" xid="xid5"/>  
      <column label="选中" name="checked" type="String" xid="xid6"/>
    </div>
  </div>  
  <div component="$UI/system/components/justep/contents/contents" class="x-contents x-full"
    active="0" xid="contents"> 
    <div class="x-contents-content" xid="content1">
      <h4 xid="h42"><![CDATA[基本使用
（多选）  ]]>
  <a component="$UI/system/components/justep/button/button" class="btn btn-link" label="js" xid="jsBtn" onClick="jsBtnClick">
   <i xid="i2"></i>
   <span xid="span3">js</span></a>
  <a component="$UI/system/components/justep/button/button" class="btn btn-link" label="源码" xid="sourceBtn" onClick="sourceClick">
   <i xid="i3"></i>
   <span xid="span4">源码</span></a></h4><div component="$UI/system/components/justep/controlGroup/controlGroup"
        class="x-control-group" xid="controlGroup1"> 
        <div class="x-control-group-title" xid="controlGroupTitle1"> 
          <span xid="span1">title</span>
        </div>  
        <div component="$UI/system/components/justep/row/row" class="x-row"
          xid="row1"> 
          <div class="x-col x-col-10 x-col-center" xid="col10"> 
            <label xid="label5" class="labe">您已选择</label>
          </div>  
          <div class="x-col x-col-fixed x-col-center" xid="col9"> 
            <div component="$UI/system/components/justep/list/list" class="x-list"
              xid="list6" data="checkData"> 
              <ul class="x-list-template" xid="listTemplateUl6"> 
                <li xid="li6" class="pull-left"> 
                  <a component="$UI/system/components/justep/button/button"
                    class="btn btn-link btn-sm btn-icon-right pull-left text-primary css"
                    label="button" xid="btn" icon="icon-ios7-close-empty" onClick="btnClick"
                    style="border-style:ridge ridge ridge ridge;border-width:1px 1px 1px 1px;border-color:#FF0000 #FF0000 #FF0000 #FF0000;color:#000040;"> 
                    <i xid="i1" class="icon-ios7-close-empty"/>  
                    <span xid="span2" bind-text="ref('checked')" class="li"/>
                  </a> 
                </li> 
              </ul> 
            </div> 
          </div> 
        </div>  
        <div component="$UI/system/components/justep/row/row" class="x-row"
          xid="row2"> 
          <div class="x-col x-col-10 x-col-center" xid="col28"> 
            <label xid="label11">认购期限</label>
          </div>  
          <div class="x-col x-col-fixed x-col-center" xid="col29"> 
            <div component="$UI/system/components/justep/list/list" class="x-list"
              xid="list3" data="deadlineData"> 
              <ul class="x-list-template" xid="listTemplateUl3" style="height:31px;"> 
                <li xid="li3" class="pull-left"> 
                  <div component="$UI/system/components/justep/output/output"
                    class="x-output pass deadline" xid="deadlineOutput" bind-ref="ref('deadline')"
                    style="width:70px;" bind-click="deadlineOutputClick"/>
                </li> 
              </ul> 
            </div> 
          </div> 
        </div>  
        <div component="$UI/system/components/justep/row/row" class="x-row"
          xid="row3"> 
          <div class="x-col x-col-10 x-col-center" xid="col2"> 
            <label xid="label1">产品类型</label>
          </div>  
          <div class="x-col x-col-fixed x-col-center" xid="col1"> 
            <div component="$UI/system/components/justep/list/list" class="x-list"
              xid="list1" data="deadlineData"> 
              <ul class="x-list-template" xid="listTemplateUl1" style="height:31px;"> 
                <li xid="li1" class="pull-left"> 
                  <div component="$UI/system/components/justep/output/output"
                    class="x-output pass type" xid="typeOutput" bind-ref="ref('productType')"
                    style="width:70px;" bind-click="typeOutputClick"/>
                </li> 
              </ul> 
            </div> 
          </div> 
        </div>  
        <div component="$UI/system/components/justep/row/row" class="x-row"
          xid="row4"> 
          <div class="x-col x-col-10 x-col-center" xid="col4"> 
            <label xid="label2">起购金额</label>
          </div>  
          <div class="x-col x-col-fixed x-col-center" xid="col3"> 
            <div component="$UI/system/components/justep/list/list" class="x-list"
              xid="list2" data="deadlineData"> 
              <ul class="x-list-template" xid="listTemplateUl2" style="height:31px;"> 
                <li xid="li2" class="pull-left"> 
                  <div component="$UI/system/components/justep/output/output"
                    class="x-output pass amount padd" xid="amountOutput" bind-ref="ref('amount')"
                    style="width:auto;" bind-click="amountOutputClick"/>
                </li> 
              </ul> 
            </div> 
          </div> 
        </div>  
        <div component="$UI/system/components/justep/row/row" class="x-row"
          xid="row5"> 
          <div class="x-col x-col-10 x-col-center" xid="col6"> 
            <label xid="label3">理财期限</label>
          </div>  
          <div class="x-col x-col-fixed x-col-center" xid="col5"> 
            <div component="$UI/system/components/justep/list/list" class="x-list"
              xid="list4" data="deadlineData"> 
              <ul class="x-list-template" xid="listTemplateUl4" style="height:31px;"> 
                <li xid="li4" class="pull-left"> 
                  <div component="$UI/system/components/justep/output/output"
                    class="x-output pass financialperiod padd" xid="financialperiodOutput"
                    bind-ref="ref('financialperiod')" style="width:auto;" bind-click="financialperiodOutputClick"/>
                </li> 
              </ul> 
            </div> 
          </div> 
        </div>  
        <div component="$UI/system/components/justep/row/row" class="x-row"
          xid="row6"> 
          <div class="x-col x-col-10 x-col-center" xid="col8"> 
            <label xid="label4" style="width:auto;">内测年收益</label>
          </div>  
          <div class="x-col x-col-fixed x-col-center" xid="col7"> 
            <div component="$UI/system/components/justep/list/list" class="x-list"
              xid="list5" data="deadlineData"> 
              <ul class="x-list-template" xid="listTemplateUl5" style="height:31px;"> 
                <li xid="li5" class="pull-left"> 
                  <div component="$UI/system/components/justep/output/output"
                    class="x-output pass earnings padd" xid="earningsOutput" bind-ref="ref('earnings')"
                    style="width:auto;" bind-click="earningsOutputClick"/>
                </li> 
              </ul> 
            </div> 
          </div> 
        </div>  
        <div component="$UI/system/components/justep/row/row" class="x-row"
          xid="row7"> 
          <div class="x-col x-col-fixed x-col-center" xid="col11"> 
            <div component="$UI/system/components/justep/labelEdit/labelEdit"
              class="x-label-edit x-label30" xid="labelTextarea1"> 
              <label class="x-label" xid="label7" style="width:56px;" bind-text="checkData.label('checked')"/>  
              <textarea component="$UI/system/components/justep/textarea/textarea"
                class="form-control x-edit" xid="textarea1" bind-text=" $model.dataEach(event)"/>
            </div> 
          </div> 
        </div> 
      </div>
    </div>
  </div>
</div>
