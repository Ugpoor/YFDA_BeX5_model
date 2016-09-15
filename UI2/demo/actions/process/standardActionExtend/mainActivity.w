<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window" component="$UI/system/components/justep/window/window"
  design="device:pc">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:240px;top:278px;"><div component="$UI/system/components/justep/data/bizData" autoLoad="true" xid="dProject" concept="DEMO_Project"><reader xid="default1" action="/demo/actions/logic/action/queryDEMO_ProjectAction"></reader>
  <writer xid="default2" action="/demo/actions/logic/action/saveDEMO_ProjectAction"></writer>
  <creator xid="default3" action="/demo/actions/logic/action/createDEMO_ProjectAction"></creator></div>
  <div component="$UI/system/components/justep/data/bizData" autoLoad="true" xid="dProjectPlan" concept="DEMO_ProjectPlan" onNewCreateParam="dProjectPlanNewCreateParam"><reader xid="default4" action="/demo/actions/logic/action/queryDEMO_ProjectPlanAction"></reader>
  <writer xid="default5" action="/demo/actions/logic/action/saveDEMO_ProjectPlanAction"></writer>
  <creator xid="default6" action="/demo/actions/logic/action/createDEMO_ProjectPlanAction"></creator>
  <master xid="default7" data="dProject" relation="fProjectID"></master></div>
  <div component="$UI/system/components/justep/data/bizData" autoLoad="true" xid="dBookView" concept="DEMO_BookView"><reader xid="default8" action="/demo/actions/logic/action/queryDEMO_BookViewAction"></reader>
  <writer xid="default9" action="/demo/actions/logic/action/saveDEMO_BookViewAction"></writer>
  <creator xid="default10" action="/demo/actions/logic/action/createDEMO_BookViewAction"></creator></div>
  <div component="$UI/system/components/justep/data/bizData" autoLoad="true" xid="dBookXML" concept="DEMO_BookXML"><reader xid="default11" action="/demo/actions/logic/action/queryDEMO_BookXMLAction"></reader>
  <writer xid="default12" action="/demo/actions/logic/action/saveDEMO_BookXMLAction"></writer>
  <creator xid="default13" action="/demo/actions/logic/action/createDEMO_BookXMLAction"></creator></div></div>  
  <div component="$UI/system/components/bootstrap/tabs/tabs" xid="tabs1"> 
    <ul class="nav nav-tabs" xid="ul1"> 
      <li class="active" xid="li1"> 
        <a content="tabContent1" xid="tabItem1"><![CDATA[概述]]></a>
      </li>  
      <li role="presentation" xid="li2"> 
        <a content="tabContent2" xid="tabItem2"><![CDATA[参数扩展、事件扩展]]></a>
      </li>  
      <li xid="li3"> 
        <a content="tabContent3" xid="tabItem3"><![CDATA[概念映射到视图的存取]]></a>
      </li>  
      <li xid="li4"> 
        <a content="tabContent4" xid="tabItem4"><![CDATA[概念映射到XML的存取]]></a>
      </li>
    </ul>  
    <div class="tab-content" xid="div1"> 
      <div class="tab-pane active" xid="tabContent1">
        
        <label id="label35" class="xui-label" style="float:left;width:100%;height:20px;"><![CDATA[标准动作为“映射到物理表的概念”提供了基本的数据存取能力，提供了非常灵活的参数接口，为界面的bizData组件提供了各种动态交互能力。]]></label>
   		<label id="label2" class="xui-label" style="float:left;width:100%;height:20px;"><![CDATA[但是如果“概念不映射到物理表”，例如：概念映射到一个视图、概念数据来源于第三方的WebService接口，这时开发者可以对标准动作进行扩展，手动实现概念的数据存取。]]></label>
    	<label id="label38" class="xui-label" style="float:left;width:100%;height:20px;color:#0000FF;font-weight:bold;"><![CDATA[本演示案例请结合官网培训视频《标准动作扩展》进行学习。]]></label>
      </div>  
      <div class="tab-pane" xid="tabContent2"><div component="$UI/system/components/bootstrap/row/row" class="row" xid="row1">
   <div class="col col-xs-6 col-sm-4 col-md-4 col-lg-4" xid="col1"><div component="$UI/system/components/justep/toolBar/toolBar" class="x-toolbar form-inline x-toolbar-spliter" xid="toolBar1"><a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left" label="新增" xid="button2" onClick="{operation:'dProject.new'}">
   <i xid="i1"></i>
   <span xid="span5">新增</span></a>
  <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left" label="保存" xid="button3" onClick="{operation:'dProject.save'}">
   <i xid="i2"></i>
   <span xid="span6">保存</span></a>
  <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left" label="删除" xid="button4" onClick="{operation:'dProject.delete'}">
   <i xid="i3"></i>
   <span xid="span7">删除</span></a></div>
  <div component="$UI/system/components/justep/grid/grid" hiddenCaptionbar="true" altRows="true" class="x-grid-no-bordered" xid="grid1" data="dProject">
   <columns xid="columns1"><column width="100" name="fProjectCode" xid="column1" editable="true"><editor xid="editor1">
   <input component="$UI/system/components/justep/input/input" class="form-control" xid="input3" bind-ref="ref('fProjectCode')"></input></editor></column>
  <column width="100" name="fProjectName" xid="column2" editable="true"><editor xid="editor2">
   <input component="$UI/system/components/justep/input/input" class="form-control" xid="input4" bind-ref="ref('fProjectName')"></input></editor></column></columns></div></div>
   <div class="col col-xs-8 col-sm-8 col-md-8 col-lg-8" xid="col2"><div component="$UI/system/components/justep/toolBar/toolBar" class="x-toolbar form-inline x-toolbar-spliter" xid="toolBar2"><a component="$UI/system/components/justep/button/button" class="btn btn-default" label="新增" xid="button1" onClick="{operation:'dProjectPlan.new'}">
   <i xid="i4"></i>
   <span xid="span1">新增</span></a>
  <a component="$UI/system/components/justep/button/button" class="btn btn-default" label="保存" xid="button5" onClick="{operation:'dProjectPlan.save'}">
   <i xid="i5"></i>
   <span xid="span2">保存</span></a>
  <a component="$UI/system/components/justep/button/button" class="btn btn-default" label="删除" xid="button6" onClick="{operation:'dProjectPlan.delete'}">
   <i xid="i6"></i>
   <span xid="span3">删除</span></a></div>
  <div component="$UI/system/components/justep/grid/grid" hiddenCaptionbar="true" altRows="true" class="x-grid-no-bordered" xid="grid2" data="dProjectPlan">
   <columns xid="columns2"><column width="100" name="fPlanName" xid="column3" editable="true"><editor xid="editor3">
   <input component="$UI/system/components/justep/input/input" class="form-control" xid="input5" bind-ref="ref('fPlanName')"></input></editor></column>
  <column width="100" name="fDescription" xid="column4" editable="true"><editor xid="editor4">
   <input component="$UI/system/components/justep/input/input" class="form-control" xid="input6" bind-ref="ref('fDescription')"></input></editor></column>
  <column width="100" name="fCreator" xid="column5" editable="true"><editor xid="editor5">
   <input component="$UI/system/components/justep/input/input" class="form-control" xid="input7" bind-ref="ref('fCreator')"></input></editor></column>
  <column width="100" name="fExecutor" xid="column6" editable="true"><editor xid="editor6">
   <input component="$UI/system/components/justep/input/input" class="form-control" xid="input8" bind-ref="ref('fExecutor')"></input></editor></column>
  <column width="100" name="fStartDate" xid="column7" editable="true"><editor xid="editor7">
   <input component="$UI/system/components/justep/input/input" class="form-control" xid="input9" bind-ref="ref('fStartDate')"></input></editor></column>
  <column width="100" name="fEndDate" xid="column8" editable="true"><editor xid="editor8">
   <input component="$UI/system/components/justep/input/input" class="form-control" xid="input10" bind-ref="ref('fEndDate')"></input></editor></column>
  <column width="100" name="fStatus" xid="column9" editable="true"><editor xid="editor9">
   <input component="$UI/system/components/justep/input/input" class="form-control" xid="input11" bind-ref="ref('fStatus')"></input></editor></column></columns></div></div>
   </div></div>  
      <div class="tab-pane" xid="tabContent3">  
      	<div component="$UI/system/components/justep/toolBar/toolBar" class="x-toolbar x-toolbar-spliter"> 
    <div component="$UI/system/components/justep/smartFilter/smartFilter" xid="smartFilter1"
      filterData="dataMain" filterCols="fBooksNumber,fBooksName,fBooksTypeName,fBooksNo,fBookConcern,fEditionOrder,fPageNum,fPrice"
      class="pull-right"> 
      <input type="text" class="form-control" placeholder="搜索" data-bind="valueUpdate: ['input', 'afterkeydown']"
        bind-value="$model.comp($element.parentElement).searchText" bind-change="$model.comp($element.parentElement).onInputChange.bind($model.comp($element.parentElement))"
        xid="input1"/> 
    </div>  
    <a component="$UI/system/components/justep/button/button" label=" 新建"
      class="btn btn-link btn-icon-left" icon="icon-plus" xid="newBtn" onClick="{operation:'dBookView.new'}"> 
      <i class="icon-plus"/>  
      <span>新建</span> 
    </a>  
    <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
      label="保存" xid="saveBtn" onClick="{operation:'dBookView.save'}"> 
      <i xid="i3"/>  
      <span xid="label7">保存</span> 
    </a>  
    <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
      label="删除" xid="deleteBtn" onClick="{operation:'dBookView.delete'}"> 
      <i xid="i4"/>  
      <span xid="span7">删除</span> 
    </a>  
    <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
      xid="refreshBtn" label="刷新" onClick="{operation:'dBookView.refresh'}"> 
      <i xid="i2"/>  
      <span xid="span2">刷新</span> 
    </a>  
    <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
      label="查询" xid="filterBtn" icon="icon-android-search" onClick="{operation:'dataFilter.menu'}"> 
      <i xid="i5" class="icon-android-search"/>  
      <span xid="span8">查询</span> 
    </a> 
  </div> 
  
    <span component="$UI/system/components/justep/bizFilter/bizFilter" xid="dataFilter"
    filterData="dBookView" style="left:28px;top:290px;"/>  
     <span component="$UI/system/components/justep/bizFilter/bizFilter" xid="dataFilter1"
    filterData="dBookXML" style="left:112px;top:328px;"/> 
  <div component="$UI/system/components/justep/grid/grid" hiddenCaptionbar="true" altRows="true" class="x-grid-no-bordered" xid="grid3" data="dBookView" height="300" width="100%">
   <columns xid="columns4"><column width="100" name="fBookID" xid="column10"></column>
  <column width="100" name="fBookName" xid="column11" editable="true"><editor xid="editor10">
   <input component="$UI/system/components/justep/input/input" class="form-control" xid="input12" bind-ref="ref('fBookName')"></input></editor></column>
  <column width="100" name="fPrice" xid="column12" editable="true"><editor xid="editor11">
   <input component="$UI/system/components/justep/input/input" class="form-control" xid="input13" bind-ref="ref('fPrice')"></input></editor></column>
  <column width="100" name="fISBN" xid="column13" editable="true"><editor xid="editor12">
   <input component="$UI/system/components/justep/input/input" class="form-control" xid="input14" bind-ref="ref('fISBN')"></input></editor></column>
  <column width="100" name="fAmount" xid="column14" editable="true"><editor xid="editor13">
   <input component="$UI/system/components/justep/input/input" class="form-control" xid="input15" bind-ref="ref('fAmount')"></input></editor></column></columns></div><div component="$UI/system/components/justep/pagerBar/pagerBar" class="x-pagerbar container-fluid"
    xid="pagerBar1" data="dBookView"> 
    <div class="row" xid="div1"> 
      <div class="col-sm-3" xid="div2"> 
        <div class="x-pagerbar-length" xid="div3"> 
          <label component="$UI/system/components/justep/pagerLimitSelect/pagerLimitSelect"
            class="x-pagerlimitselect" xid="pagerLimitSelect1"> 
            <span xid="span1">显示</span>  
            <select component="$UI/system/components/justep/select/select" class="form-control input-sm"
              xid="select1"> 
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
      <div class="tab-pane" xid="tabContent4"><div component="$UI/system/components/justep/toolBar/toolBar" class="x-toolbar x-toolbar-spliter" xid="toolBar3">
   <div component="$UI/system/components/justep/smartFilter/smartFilter" xid="smartFilter2" filterData="dataMain" filterCols="fBooksNumber,fBooksName,fBooksTypeName,fBooksNo,fBookConcern,fEditionOrder,fPageNum,fPrice" class="pull-right">
    <input type="text" class="form-control" placeholder="搜索" data-bind="valueUpdate: ['input', 'afterkeydown']" bind-value="$model.comp($element.parentElement).searchText" bind-change="$model.comp($element.parentElement).onInputChange.bind($model.comp($element.parentElement))" xid="input2"></input></div> 
   <a component="$UI/system/components/justep/button/button" label=" 新建" class="btn btn-link btn-icon-left" icon="icon-plus" xid="button10" onClick="{operation:'dBookXML.new'}">
    <i class="icon-plus" xid="i11"></i>
    <span xid="span14">新建</span></a> 
   <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left" label="保存" xid="button8" onClick="{operation:'dBookXML.save'}">
    <i xid="i9"></i>
    <span xid="span13">保存</span></a> 
   <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left" label="删除" xid="button11" onClick="{operation:'dBookXML.delete'}">
    <i xid="i8"></i>
    <span xid="span11">删除</span></a> 
   <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left" xid="button7" label="刷新" onClick="{operation:'dBookXML.refresh'}">
    <i xid="i10"></i>
    <span xid="span12">刷新</span></a> 
   <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left" label="查询" xid="button9" icon="icon-android-search" onClick="{operation:'dataFilter1.menu'}">
    <i xid="i7" class="icon-android-search"></i>
    <span xid="span10">查询</span></a> </div>
  <div component="$UI/system/components/justep/grid/grid" hiddenCaptionbar="true" altRows="true" class="x-grid-no-bordered" xid="grid4" data="dBookXML" height="300" width="100%">
   <columns xid="columns5"><column width="100" name="fBookID" xid="column15"></column>
  <column width="100" name="fBookName" xid="column16" editable="true"><editor xid="editor14">
   <input component="$UI/system/components/justep/input/input" class="form-control" xid="input16" bind-ref="ref('fBookName')" format="0,000.00"></input></editor></column>
  <column width="100" name="fISBN" xid="column17" editable="true"><editor xid="editor15">
   <input component="$UI/system/components/justep/input/input" class="form-control" xid="input17" bind-ref="ref('fISBN')"></input></editor></column>
  <column width="100" name="fPrice" xid="column18" editable="true"><editor xid="editor16">
   <input component="$UI/system/components/justep/input/input" class="form-control" xid="input18" bind-ref="ref('fPrice')"></input></editor></column></columns></div><div component="$UI/system/components/justep/pagerBar/pagerBar" class="x-pagerbar container-fluid" xid="pagerBar2" data="dBookXML">
   <div class="row" xid="div14">
    <div class="col-sm-3" xid="div13">
     <div class="x-pagerbar-length" xid="div12">
      <label component="$UI/system/components/justep/pagerLimitSelect/pagerLimitSelect" class="x-pagerlimitselect" xid="pagerLimitSelect2">
       <span xid="span25">显示</span>
       <select component="$UI/system/components/justep/select/select" class="form-control input-sm" xid="select2">
        <option value="10" xid="default15">10</option>
        <option value="20" xid="default16">20</option>
        <option value="50" xid="default17">50</option>
        <option value="100" xid="default14">100</option></select> 
       <span xid="span24">条</span></label> </div> </div> 
    <div class="col-sm-3" xid="div11">
     <div class="x-pagerbar-info" xid="div10">当前显示1-10条，共16条</div></div> 
    <div class="col-sm-6" xid="div9">
     <div class="x-pagerbar-pagination" xid="div8">
      <ul class="pagination" component="$UI/system/components/bootstrap/pagination/pagination" xid="pagination2">
       <li class="prev" xid="li5">
        <a href="#" xid="a3">
         <span aria-hidden="true" xid="span22">«</span>
         <span class="sr-only" xid="span23">Previous</span></a> </li> 
       <li class="next" xid="li6">
        <a href="#" xid="a4">
         <span aria-hidden="true" xid="span21">»</span>
         <span class="sr-only" xid="span20">Next</span></a> </li> </ul> </div> </div> </div> </div></div>
    </div> 
  </div>
</div>
