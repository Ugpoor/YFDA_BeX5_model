<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window" component="$UI/system/components/justep/window/window"
  design="device:pc">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:101px;top:383px;"> 
    <div component="$UI/system/components/justep/data/data" autoLoad="true"
      xid="flowData" idColumn="fID"> 
      <column label="ID" name="fID" type="String" xid="xid1"/>  
      <column label="资金流向" name="flow" type="String" xid="xid2"/>  
      <data xid="default1">[{"flow":"全部"},{"flow":"收入"},{"flow":"支出"},{"flow":"转入"},{"flow":"转出"}]</data> 
    </div>  
    <div component="$UI/system/components/justep/data/data" autoLoad="true"
      xid="flowDefault" idColumn="fID" onValueChanged="flowDefaultValueChanged" confirmDelete="false"> 
      <column label="ID" name="fID" type="String" xid="xid3"/>  
      <column label="资金流向" name="flow" type="String" xid="xid4"/>  
      <data xid="default2">[{}]</data> 
    </div>  
    <div component="$UI/system/components/justep/data/data" autoLoad="true"
      xid="flowFilter" idColumn="fID" confirmDelete="false"> 
      <column label="ID" name="fID" type="String" xid="xid5"/>  
      <column label="资金流向" name="flow" type="String" xid="xid6"/> 
    </div>  
    <div component="$UI/system/components/justep/data/data" autoLoad="true"
      xid="accountData" idColumn="fID"> 
      <column label="ID" name="fID" type="String" xid="xid7"/>  
      <column label="账户类型" name="account" type="String" xid="xid8"/>  
      <data xid="default3">[{"account":"个人账户"},{"account":"公司账户"}]</data> 
    </div>  
    <div component="$UI/system/components/justep/data/data" autoLoad="true"
      xid="accountDefault" idColumn="fID" onValueChanged="accountDefaultValueChanged"
      confirmDelete="false"> 
      <column label="ID" name="fID" type="String" xid="xid9"/>  
      <column label="账户" name="account" type="String" xid="xid10"/>  
      <data xid="default4">[{}]</data> 
    </div>  
    <div component="$UI/system/components/justep/data/data" autoLoad="true"
      xid="accountFilter" idColumn="fID" confirmDelete="false"> 
      <column label="ID" name="fID" type="String" xid="xid11"/>  
      <column label="账户" name="account" type="String" xid="xid12"/> 
    </div>  
    <div component="$UI/system/components/justep/data/data" autoLoad="true"
      xid="typeData" idColumn="fID"> 
      <column label="ID" name="fID" type="String" xid="xid13"/>  
      <column label="类型" name="type" type="String" xid="xid14"/>  
      <data xid="default6">[{"type":"全部"},{"type":"衣服饰品"},{"type":"食品酒水"},{"type":"居家物业"},{"type":"行车交通"},{"type":"交流通讯"},{"type":"玩乐休闲"},{"type":"学习培训"},{"type":"礼金慈善"},{"type":"医疗保健"},{"type":"生儿育女"},{"type":"偶然支出"},{"type":"差旅公务"},{"type":"企业支出"},{"type":"杂项支出"},{"type":"网上购物"},{"type":"职业工薪"},{"type":"业余工薪"},{"type":"人情收入"},{"type":"偶然收入"},{"type":"公务收入"},{"type":"企业收入"},{"type":"杂项收入"}]</data> 
    </div>  
    <div component="$UI/system/components/justep/data/data" autoLoad="true"
      xid="typeDefault" idColumn="fID" onValueChanged="typeDefaultValueChanged"> 
      <column label="ID" name="fID" type="String" xid="xid15"/>  
      <column label="类型" name="type" type="String" xid="xid16"/>  
      <data xid="default5">[{"fID":"","type":""}]</data> 
    </div>  
    <div component="$UI/system/components/justep/data/data" autoLoad="true"
      xid="tyeFilter" idColumn="fID" confirmDelete="false"> 
      <column label="ID" name="fID" type="String" xid="xid17"/>  
      <column label="类型" name="type" type="String" xid="xid18"/> 
    </div>  
    <div component="$UI/system/components/justep/data/data" autoLoad="true"
      xid="date" idColumn="date"> 
      <column label="时间" name="date" type="String" xid="xid19"/> 
    </div>  
    <div component="$UI/system/components/justep/data/data" autoLoad="true"
      xid="keyData" idColumn="keyword"> 
      <column label="关键词" name="keyword" type="String" xid="xid21"/> 
    </div>  
    <div component="$UI/system/components/justep/data/data" autoLoad="true"
      xid="data" idColumn="tID"> 
      <column label="ID" name="tID" type="String" xid="column6"/>  
      <column label="姓名" name="tName" type="String" xid="column7"/>  
      <column label="性别" name="tSex" type="String" xid="column4"/>  
      <column label="年龄 " name="tAge" type="Integer" xid="column5"/>  
      <data xid="default7">[{"tID":"1","tName":"张小三","tSex":"男","tAge":21},{"tID":"2","tName":"张小三","tSex":"男","tAge":22},{"tID":"3","tName":"张小三","tSex":"男","tAge":23},{"tID":"4","tName":"张小三","tSex":"男","tAge":24},{"tID":"5","tName":"张小三","tSex":"男","tAge":25},{"tID":"6","tName":"张小三","tSex":"男","tAge":26},{"tID":"7","tName":"张小三","tSex":"男","tAge":27},{"tID":"8","tName":"张小三","tSex":"男","tAge":28},{"tID":"9","tName":"张小三","tSex":"男","tAge":29},{"tID":"10","tName":"张小三","tSex":"男","tAge":20}]</data>
    </div>
  </div>  
  <h4 xid="h41"><![CDATA[文件条件选择 
    ]]>
  <a component="$UI/system/components/justep/button/button" class="btn btn-link" label="js" xid="jsBtn" onClick="jsBtnClick">
   <i xid="i2"></i>
   <span xid="span2">js</span></a>
  <a component="$UI/system/components/justep/button/button" class="btn btn-link " label="源码" xid="sourceBtn" onClick="sourceClick">
   <i xid="i2"></i>
   <span xid="span1">源码</span></a></h4><div component="$UI/system/components/justep/row/row" class="x-row" xid="row1"
    bind-visible="!!flowFilter.val(&quot;flow&quot;)"> 
    <div class="x-col" xid="col1"> 
      <label xid="label4" class="pull-left top width"><![CDATA[资金流向:]]></label>  
      <div component="$UI/system/components/justep/list/list" class="x-list pull-left"
        xid="list2" data="flowFilter"> 
        <ul class="x-list-template x-min-height" xid="listTemplateUl2" componentname="$UI/system/components/justep/list/list#listTemplateUl"
          id="undefined_listTemplateUl2"> 
          <li xid="li7" class="x-min-height pull-left" componentname="li(html)"
            id="undefined_li7"> 
            <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-sm btn-icon-right pull-left button"
              label="button" xid="flowBtn" icon="icon-close-round" style="border-style:ridge ridge ridge ridge;border-width:1px 1px 1px 1px;border-color:#0080FF #0080FF #0080FF #0080FF;"
              onClick="flowBtnClick"> 
              <i xid="i3" class="icon-close-round"/>  
              <span xid="span3" bind-text="ref('flow')"/> 
            </a> 
          </li> 
        </ul> 
      </div> 
    </div> 
  </div>  
  <div component="$UI/system/components/justep/row/row" class="x-row" xid="row2"
    bind-visible="!!accountFilter.val(&quot;account&quot;)"> 
    <div class="x-col" xid="col4"> 
      <label xid="label3" class="pull-left top width"><![CDATA[账户:]]></label>  
      <div component="$UI/system/components/justep/list/list" class="x-list pull-left"
        xid="list3" data="accountFilter"> 
        <ul class="x-list-template x-min-height" xid="listTemplateUl3" componentname="$UI/system/components/justep/list/list#listTemplateUl"
          id="undefined_listTemplateUl3"> 
          <li xid="li8" class="pull-left"> 
            <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-right button btn-sm"
              label="button" xid="accountBtn" icon="icon-close-round" style="border-style:ridge ridge ridge ridge;border-width:1px 1px 1px 1px;border-color:#0080FF #0080FF #0080FF #0080FF;"
              onClick="accountBtnClick"> 
              <i xid="i4" class="icon-close-round"/>  
              <span xid="span4" bind-text="ref('account')"/> 
            </a> 
          </li> 
        </ul> 
      </div> 
    </div> 
  </div>  
  <div component="$UI/system/components/justep/row/row" class="x-row" xid="row3"
    bind-visible="!!tyeFilter.val(&quot;type&quot;)"> 
    <div class="x-col" xid="col7"> 
      <label xid="label5" class="pull-left top width"><![CDATA[类型:]]></label>  
      <div component="$UI/system/components/justep/list/list" class="x-list pull-left"
        xid="list5" data="tyeFilter"> 
        <ul class="x-list-template x-min-height" xid="listTemplateUl5" componentname="$UI/system/components/justep/list/list#listTemplateUl"
          id="undefined_listTemplateUl5"> 
          <li xid="li10" class="pull-left x-min-height" componentname="li(html)"
            id="undefined_li10"> 
            <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-right button btn-sm"
              label="button" xid="typeBtn" icon="icon-close-round" style="border-style:ridge ridge ridge ridge;border-width:1px 1px 1px 1px;border-color:#0080FF #0080FF #0080FF #0080FF;"
              onClick="typeBtnClick"> 
              <i xid="i7" class="icon-close-round"/>  
              <span xid="span7" bind-text="ref('type')"/> 
            </a> 
          </li> 
        </ul> 
      </div> 
    </div> 
  </div>  
  <div component="$UI/system/components/justep/row/row" class="x-row" xid="row4"
    bind-visible="!!date.val(&quot;date&quot;)"> 
    <div class="x-col" xid="col10"> 
      <label xid="label6" class="pull-left top"><![CDATA[起止日期:]]></label>  
      <div component="$UI/system/components/justep/list/list" class="x-list"
        xid="list6" data="date"> 
        <ul class="x-list-template" xid="listTemplateUl6"> 
          <li xid="li11"> 
            <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-right button btn-sm"
              label="button" xid="dateBtn" icon="icon-close-round" style="border-style:ridge ridge ridge ridge;border-width:1px 1px 1px 1px;border-color:#0080FF #0080FF #0080FF #0080FF;"
              onClick="dateBtnClick"> 
              <i xid="i9" class="icon-close-round"/>  
              <span xid="span9" bind-text="ref('date')"/> 
            </a> 
          </li> 
        </ul> 
      </div> 
    </div> 
  </div>  
  <div component="$UI/system/components/justep/row/row" class="x-row" xid="row5"
    bind-visible="!!keyData.val(&quot;keyword&quot;)"> 
    <div class="x-col" xid="col13"> 
      <label xid="label7" class="pull-left top width"><![CDATA[关键词:]]></label>  
      <div component="$UI/system/components/justep/list/list" class="x-list"
        xid="list7" data="keyData"> 
        <ul class="x-list-template" xid="listTemplateUl7"> 
          <li xid="li12"> 
            <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-right button btn-sm"
              label="button" xid="keyBtn" icon="icon-close-round" style="border-style:ridge ridge ridge ridge;border-width:1px 1px 1px 1px;border-color:#0080FF #0080FF #0080FF #0080FF;"
              onClick="keyBtnClick"> 
              <i xid="i11" class="icon-close-round"/>  
              <span xid="span11" bind-text="ref('keyword')"/> 
            </a> 
          </li> 
        </ul> 
      </div> 
    </div> 
  </div>  
  <div component="$UI/system/components/justep/tabs/tabs" class="x-tabs" xid="tabs1" style="height:116px;"> 
    <div component="$UI/system/components/justep/panel/panel" class="x-panel" xid="panel1"> 
      <div class="x-panel-top" xid="top1"> 
        <ul class="nav nav-tabs" xid="navs1"> 
          <li class="active" xid="li1"> 
            <a content="tabContent_1" xid="tabItem1"><![CDATA[资金流向]]></a> 
          </li>  
          <li xid="li2"> 
            <a content="tabContent1" xid="tabItem2"><![CDATA[账户]]></a> 
          </li>  
          <li xid="li3"> 
            <a content="tabContent2" xid="tabItem3"><![CDATA[类型]]></a> 
          </li>  
          <li xid="li4"> 
            <a content="tabContent3" xid="tabItem4"><![CDATA[起止日期]]></a> 
          </li>  
          <li xid="li5"> 
            <a content="tabContent4" xid="tabItem5"><![CDATA[关键词]]></a> 
          </li>  
          
        </ul> 
      </div>  
      <div class="x-panel-content" xid="content2"> 
        <div component="$UI/system/components/justep/contents/contents" class="x-contents" active="0" xid="contents1"> 
          <div class="x-contents-content active" xid="content1"> 
            <span component="$UI/system/components/justep/select/checkboxGroup" class="x-checkbox-group x-checkbox-group-xs" xid="checkboxGroup1" bind-ref="flowDefault.ref('flow')" bind-itemset="flowData" bind-itemsetValue="ref('flow')" bind-itemsetLabel="ref('flow')" /> 
          </div>  
          <div class="x-contents-content" xid="content3"> 
            <span component="$UI/system/components/justep/select/checkboxGroup" class="x-checkbox-group x-checkbox-group-xs" xid="checkboxGroup2" bind-ref="accountDefault.ref('account')" bind-itemset="accountData" bind-itemsetValue="ref('account')" bind-itemsetLabel="ref('account')" /> 
          </div>  
          <div class="x-contents-content" xid="content4"> 
            <span component="$UI/system/components/justep/select/checkboxGroup" class="x-checkbox-group x-checkbox-group-xs" xid="checkboxGroup4" bind-itemset="typeData" bind-itemsetValue="ref('type')" bind-itemsetLabel="ref('type')" bind-ref="typeDefault.ref('type')" /> 
          </div>  
          <div class="x-contents-content" xid="content5"> 
            <div component="$UI/system/components/justep/row/row" class="x-row" xid="row6"> 
              <div class="x-col x-col-90" xid="col17"> 
                <label xid="label1" class="pull-left top"><![CDATA[起止日期:]]></label>  
                <input component="$UI/system/components/justep/input/input" class="form-control pull-left left" xid="start" dataType="Date" style="width:129px;" />  
                <label xid="label2" class="pull-left top"><![CDATA[-]]></label>  
                <input component="$UI/system/components/justep/input/input" class="form-control pull-left left" xid="end" dataType="Date" style="width:129px;" />  
                <a component="$UI/system/components/justep/button/button" class="btn btn-link" label="确定" xid="button" onClick="buttonClick"> 
                  <i xid="i8" />  
                  <span xid="span8">确定</span> 
                </a> 
              </div> 
            </div> 
          </div>  
          <div class="x-contents-content" xid="content6"> 
            <div component="$UI/system/components/bootstrap/row/row" class="row" xid="row7"> 
              <div class="col col-xs-4" xid="col19"> 
                <input component="$UI/system/components/justep/input/input" class="form-control  pull-left left" xid="keyWord" style="width:114px;" />  
                <a component="$UI/system/components/justep/button/button" class="btn btn-link pull-left" label="确定" xid="sure" onClick="sureClick"> 
                  <i xid="i10" />  
                  <span xid="span10">确定</span> 
                </a> 
              </div> 
            </div> 
          </div> 
        </div> 
      </div> 
    </div> 
  </div><div component="$UI/system/components/justep/dataTables/dataTables" flexibleWidth="true" rowActiveClass="active" class="table table-hover table-striped" xid="dataTables" data="data" onRowClick="dataTablesRowClick" onRowCheckedAll="dataTablesRowCheckedAll" showRowNumber="false" multiSelect="true">
   <columns xid="columns1"><column name="tID" xid="column1"></column>
  <column name="tName" xid="column2"></column>
  <column name="tSex" xid="column3"></column>
  <column name="tAge" xid="column8"></column></columns></div>
  </div>
