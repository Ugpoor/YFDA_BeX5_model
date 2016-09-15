<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window" component="$UI/system/components/justep/window/window"
  design="device:pc">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:189px;top:22px;">
    <div component="$UI/system/components/justep/data/data" autoLoad="true"
      xid="dResult" idColumn="fID">
      <column name="fID" type="String" xid="xid1"></column>
  <column name="fCompanyName" type="String" xid="xid2"></column>
  <column name="fRegion" type="String" xid="xid3"></column>
  <column name="fCity" type="String" xid="xid4"></column>
  <column name="fPhone" type="String" xid="xid5"></column>
  <column name="fOrderNumber" type="String" xid="xid6"></column>
  <column name="DEMO_Customers" type="String" xid="xid7"></column>
  <column name="regionCount" type="String" xid="xid8"></column>
  <column name="fOrderCount" type="String" xid="xid9"></column>
  <column name="fCustomerID" type="String" xid="xid10"></column>
  <column name="fOrderID" type="String" xid="xid11"></column>
  <column name="version" type="String" xid="xid12"></column>
  <column name="fType" type="String" xid="xid13"></column>
  <column name="fStatus" type="String" xid="xid14"></column>
  <column name="fStatusText" type="String" xid="xid15"></column>
  <column name="fContact" type="String" xid="xid16"></column>
  <column name="fContactName" type="String" xid="xid17"></column>
  <column name="fAreaCode" type="String" xid="xid18"></column>
  <column name="fPhoneNumber" type="String" xid="xid19"></column>
  <column name="fFax" type="String" xid="xid20"></column>
  <column name="fFaxNumber" type="String" xid="xid21"></column>
  <column name="fOrderDate" type="String" xid="xid22"></column>
  <column name="fYear" type="String" xid="xid23"></column>
  <column name="fMonth" type="String" xid="xid24"></column>
  <column name="fDay" type="String" xid="xid25"></column>
  <column name="fDate" type="String" xid="xid26"></column>
  <column name="fGuid" type="String" xid="xid127"></column>
  <column name="fContactTitle" type="String" xid="xid28"></column>
  <column name="fAddress" type="String" xid="xid29"></column>
  <column name="fPostalCode" type="String" xid="xid30"></column>
  <column name="fCountry" type="String" xid="xid31"></column>
  <column name="c" type="String" xid="xid27"></column>
  <column name="o" type="String" xid="xid32"></column></div>
  <div component="$UI/system/components/justep/data/data" autoLoad="true" xid="data1" idColumn="fName"><column name="fName" type="String" xid="xid33"></column>
  <data xid="default1">[{&quot;fName&quot;:&quot;KSQL&quot;},{&quot;fName&quot;:&quot;SQL&quot;}]</data></div>
  <div component="$UI/system/components/justep/data/data" autoLoad="true" xid="data2" idColumn="fValue"><column name="fValue" type="String" xid="xid34"></column>
  <data xid="default2">[{&quot;fValue&quot;:&quot;KSQL&quot;}]</data></div></div>  
  <div component="$UI/system/components/justep/panel/panel" class="x-panel x-full"
    xid="panel1"> 
    <div class="x-panel-top" xid="top1" height="200">
      <div component="$UI/system/components/justep/panel/panel" class="x-panel x-full"
        xid="panel2"> 
        <div class="x-panel-top" xid="top2">
          <label xid="label1" style="color:red;"><![CDATA[测试执行是在一个不提交的事务中模拟KSQL（或SQL）执行，不会真实改变数据库中数据。]]></label>
        </div>  
        <div class="x-panel-content" xid="content2">
          <textarea cols="5" rows="5" xid="textSQL" style="height:100%;width:100%;"/>
        </div>  
        <div class="x-panel-bottom" xid="bottom2" height="30">
          <div class="form-horizontal container-fluid" component="$UI/system/components/bootstrap/form/form"
            xid="form1">
            <div class="form-group" xid="formGroup1"> 
              <div class="col-sm-4" xid="col1">
                <label xid="lbResult"><![CDATA[本次执行结果影响记录数：]]></label>
              </div>  
              <div class="col-sm-4" xid="col2">
                <a component="$UI/system/components/justep/button/button"
                  class="btn btn-default" label="测试执行" xid="btnExecute" style="height:100%;width:100%;"
                  onClick="btnExecuteClick"> 
                  <i xid="i2"/>  
                  <span xid="span2">测试执行</span>
                </a>
              </div>  
              <div class="col-sm-4" xid="col4">
                <span component="$UI/system/components/justep/select/radioGroup" class="x-radio-group" xid="radioGroup1" bind-itemset="data1" bind-itemsetValue="ref('fName')" bind-itemsetLabel="ref('fName')" bind-ref="data2.ref('fValue')"></span></div>
            </div>
          </div>
        </div>
      </div>
    </div>  
    <div class="x-panel-content" xid="content1">
      <div component="$UI/system/components/justep/grid/grid" hiddenCaptionbar="true"
        altRows="true" class="x-grid-no-bordered" xid="gridresult" data="dResult"> 
        <columns xid="columns1"><column width="100" name="fCompanyName" xid="column1"></column>
  <column width="100" name="fRegion" xid="column2"></column>
  <column width="100" name="fCity" xid="column3"></column>
  <column width="100" name="fPhone" xid="column4"></column>
  <column width="100" name="fOrderNumber" xid="column5"></column>
  <column width="100" name="DEMO_Customers" xid="column6"></column>
  <column width="100" name="regionCount" xid="column7"></column>
  <column width="100" name="fOrderCount" xid="column8"></column>
  <column width="100" name="fCustomerID" xid="column9"></column>
  <column width="100" name="fOrderID" xid="column10"></column>
  <column width="100" name="version" xid="column11"></column>
  <column width="100" name="fType" xid="column12"></column>
  <column width="100" name="fStatus" xid="column13"></column>
  <column width="100" name="fStatusText" xid="column14"></column>
  <column width="100" name="fContact" xid="column15"></column>
  <column width="100" name="fContactName" xid="column16"></column>
  <column width="100" name="fAreaCode" xid="column17"></column>
  <column width="100" name="fPhoneNumber" xid="column18"></column>
  <column width="100" name="fFax" xid="column19"></column>
  <column width="100" name="fFaxNumber" xid="column20"></column>
  <column width="100" name="fOrderDate" xid="column21"></column>
  <column width="100" name="fYear" xid="column22"></column>
  <column width="100" name="fMonth" xid="column23"></column>
  <column width="100" name="fDay" xid="column24"></column>
  <column width="100" name="fDate" xid="column25"></column>
  <column width="100" name="fGuid" xid="column26"></column>
  <column width="100" name="fContactTitle" xid="column27"></column>
  <column width="100" name="fAddress" xid="column28"></column>
  <column width="100" name="fPostalCode" xid="column29"></column>
  <column width="100" name="fCountry" xid="column30"></column>
  <column width="100" name="fID" xid="column31"></column>
  <column width="100" name="c" xid="column32"></column>
  <column width="100" name="o" xid="column33"></column></columns>
      </div>
    </div>  
    <div class="x-panel-bottom" xid="bottom1" height="30">
      <a component="$UI/system/components/justep/button/button" class="btn btn-default"
        label="关闭" xid="btnClose" onClick="btnCloseClick" style="height:100%;width:100%;"> 
        <i xid="i1"/>  
        <span xid="span1">关闭</span>
      </a>
    </div>
  </div>  
  <span component="$UI/system/components/justep/windowReceiver/windowReceiver"
    xid="windowReceiver1" onReceive="windowReceiver1Receive" style="left:165px;top:11px;"/>
</div>
