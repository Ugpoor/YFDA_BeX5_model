<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window container-fluid" component="$UI/system/components/justep/window/window"
  design="device:pc">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:293px;top:273px;"> 
    <div component="$UI/system/components/justep/data/data" autoLoad="true"
      xid="tempData" idColumn="id"> 
      <column name="id" type="String" xid="default8"/>  
      <column name="bookName" type="String" xid="default1"/>  
      <column name="borrower" type="String" xid="default4"/>  
      <column name="startDate" type="Date" xid="default2"/>  
      <column name="endDate" type="Date" xid="default3"/>  
      <column name="a" type="Integer" xid="default5"/>  
      <column name="b" type="Integer" xid="default6"/>  
      <column name="c" type="Integer" xid="default7"/>  
      <data xid="default9">[{"id":"","bookName":"X5快速开发指南","borrower":"张三","startDate":"2012-10-01","endDate":"2012-12-31","a":120,"b":240}]</data> 
    </div> 
  </div>  
  <div class="panel panel-default" component="$UI/system/components/bootstrap/panel/panel"
    xid="panel3"> 
    <div class="panel-body" xid="body2"> 
      <h5 xid="h51">本案例用于配合《系统集成》培训视频，演示X5与第三方系统之间的各种集成方案，包括：</h5>  
      <ol xid="ol1" style="list-style:decimal;padding-left:40px;"> 
        <li xid="li2">从第三方应用通过API Jar包调用X5的动作、将X5的动作封装成WebService、第三方应用打开X5的页面；</li>  
        <li xid="li3">在X5中调用第三方的WebService、X5门户中嵌入打开第三方功能页面。</li> 
      </ol>  
      <h5 xid="h53" class="text-primary">请结合官网培训视频《系统集成》进行学习。</h5> 
    </div> 
  </div>  
  <div class="form-horizontal container-fluid" component="$UI/system/components/bootstrap/form/form" xid="form4">
   <div class="form-group" xid="formGroup8">
   <div class="col-sm-3" xid="col17">
    <a component="$UI/system/components/justep/button/button" class="form-control btn btn-success" label="打开其他系统的页面" xid="openOtherBtn" onClick="openOtherBtnClick">
     <i xid="i2"></i>
     <span xid="span2">打开其他系统的页面</span></a> </div> 
   <div class="col-sm-3" xid="col18">
    <a component="$UI/system/components/justep/button/button" class="form-control btn btn-danger" label="关闭当前页面" xid="closeSelfBtn" onClick="closeSelfBtnClick">
     <i xid="i4"></i>
     <span xid="span4">关闭当前页面</span></a> </div> 
   <div class="col-sm-4" xid="col21"></div></div></div><div class="panel panel-default" component="$UI/system/components/bootstrap/panel/panel"
    xid="panel1"> 
    <div class="panel-heading" xid="heading1">
   <h4 class="panel-title" xid="h41">
    </h4> 
  <a component="$UI/system/components/justep/button/button" class="btn btn-primary" label="调用动作发起借书申请" xid="doActionBtn" onClick="doActionBtnClick">
   <i xid="i1"></i>
   <span xid="span1">调用动作发起借书申请</span></a></div><div class="panel-body" xid="body1">
      <div class="form-horizontal container-fluid" component="$UI/system/components/bootstrap/form/form"
        xid="form1"> 
        <div class="form-group" xid="formGroup1"> 
          <div class="col-sm-2" xid="col1"> 
            <label class="control-label" xid="controlLabel1">图书</label>
          </div>  
          <div class="col-sm-4" xid="col2"> 
            <input component="$UI/system/components/justep/input/input" class="form-control"
              xid="input1" bind-ref="tempData.ref('bookName')"/>
          </div>  
          <div class="col-sm-2" xid="col3"> 
            <label class="control-label" xid="controlLabel3">借书人</label>
          </div>  
          <div class="col-sm-4" xid="col4"> 
            <input component="$UI/system/components/justep/input/input" class="form-control"
              xid="input2" bind-ref="tempData.ref('borrower')"/>
          </div> 
        </div>  
        <div class="form-group" xid="formGroup2"> 
          <div class="col-sm-2" xid="col5"> 
            <label class="control-label" xid="controlLabel2">开始</label>
          </div>  
          <div class="col-sm-4" xid="col6"> 
            <input component="$UI/system/components/justep/input/input" class="form-control"
              xid="input3" bind-ref="tempData.ref('startDate')"/>
          </div>  
          <div class="col-sm-2" xid="col7"> 
            <label class="control-label" xid="controlLabel4">结束</label>
          </div>  
          <div class="col-sm-4" xid="col8"> 
            <input component="$UI/system/components/justep/input/input" class="form-control"
              xid="input4" bind-ref="tempData.ref('endDate')"/>
          </div> 
        </div> 
      </div>
    </div>  
    </div>  
  <div class="panel panel-default" component="$UI/system/components/bootstrap/panel/panel"
    xid="panel2"> 
    <div class="panel-heading" xid="heading2"> 
      <a component="$UI/system/components/justep/button/button" class="btn btn-primary" label="调用测试WebService" xid="doTestWebServiceBtn" onClick="doTestWebServiceBtnClick">
   <i xid="i3"></i>
   <span xid="span3">调用测试WebService</span></a></div>  
    <div class="panel-body" xid="body3">
      <div class="form-inline container-fluid" component="$UI/system/components/bootstrap/form/form"
        xid="form2"> 
        <div class="form-group" xid="formGroup4"> 
          <input component="$UI/system/components/justep/input/input" class="form-control"
            xid="input5" bind-ref="tempData.ref('a')"/>  
          <label class="control-label" xid="controlLabel5">+</label>  
          <input component="$UI/system/components/justep/input/input" class="form-control"
            xid="input6" bind-ref="tempData.ref('b')"/>  
          <label class="control-label" xid="controlLabel6">=</label>  
          <input component="$UI/system/components/justep/input/input" class="form-control"
            xid="input7" bind-ref="tempData.ref('c')"/>
        </div> 
      </div>
    </div>  
    <div class="panel-footer" xid="footer3">
      <label class="control-label" xid="controlLabel7">在执行调用测试WebService前，请先参照/BIZ/demo/actions/process/integration/系统集成案例部署说明.txt，部署axis服务。</label></div>
  </div>
</div>
