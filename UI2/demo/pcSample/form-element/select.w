<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window" component="$UI/system/components/justep/window/window"
  design="device:pc">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:242px;top:96px;"> 
    <div component="$UI/system/components/justep/data/data" autoLoad="true"
      xid="selectData" idColumn="options" confirmRefresh="false"> 
      <column label="数据" name="options" type="String" xid="xid1"/>  
      <column label="选中值" name="optionsValue" type="String" xid="xid2"/>  
      <column label="启用 禁用" name="enable" type="String" xid="xid4"/>  
      <column label="改变事件" name="change" type="String" xid="xid5"/>  
      <column label="创建" name="create" type="String" xid="xid7"/>  
      <column label="动态改变" name="dynamic" type="String" xid="xid8"/>  
      <column label="下拉框1" name="selectOne" type="String" xid="xid10"/>  
      <column label="下拉框2" name="selectTwo" type="String" xid="xid11"/>  
      <column label="普通表单元素" name="normalInput" type="String" xid="xid12"/>  
      <column label="input" name="inputValue" type="String" xid="xid15"/>  
      <column label="姓名:" name="labelInput" type="String" xid="xid16"/>  
      <column label="性别:" name="sex" type="String" xid="xid17"/>  
      <data xid="default1">[{"options":"员工1","optionsValue":"员工1","enable":"员工1","change":"员工1","create":"北京","dynamic":"北京","selectOne":"员工1","selectTwo":"员工1","sex":"男"},{"options":"员工2","optionsValue":"员工2","enable":"员工2","change":"员工2","create":"上海","dynamic":"上海","selectOne":"员工2","selectTwo":"员工2","sex":"女"},{"options":"员工3","optionsValue":"员工3","enable":"员工3","change":"员工3","create":"广州","dynamic":"广州"},{"options":"员工4","optionsValue":"员工4","enable":"员工4","change":"员工4","create":"天津","dynamic":"天津"},{"options":"员工5","create":"河北","dynamic":"河北"}]</data>
    </div>  
    <div component="$UI/system/components/justep/data/data" autoLoad="true"
      xid="valueData" idColumn="optionsValue" confirmRefresh="false"> 
      <column label="值" name="optionsValue" type="String" xid="xid3"/>  
      <column label="改变值" name="changeValue" type="String" xid="xid6"/>  
      <column label="动态" name="dynamic" type="String" xid="xid9"/>  
      <column label="下拉框2" name="selectTwo" type="String" xid="xid13"/>  
      <data xid="default2">[{"changeValue":"","dynamic":"","selectTwo":"员工2"}]</data>  
      <column label="下拉框1" name="selectOne" type="String" xid="xid14"/>  
      <column label="简单" name="sample" type="String" xid="xid18"/>
    </div> 
  </div>  
  <div component="$UI/system/components/justep/contents/contents" class="x-contents x-full"
    active="0" xid="contents"> 
    <div class="x-contents-content" xid="content1"> 
      <h4 xid="h42"><![CDATA[选择下拉框   
    ]]>
  <a component="$UI/system/components/justep/button/button" class="btn btn-link" label="js" xid="jsBtn" onClick="jsBtnClick">
   <i xid="i4"></i>
   <span xid="span9">js</span></a>
  <a component="$UI/system/components/justep/button/button" class="btn btn-link" label="源码" xid="sourceBtn" onClick="sourceClick">
   <i xid="i4"></i>
   <span xid="span9">源码</span></a>
  </h4><div component="$UI/system/components/justep/controlGroup/controlGroup"
        class="x-control-group" title="1.选择下拉框" xid="controlGroup1" collapsible="true"
        style="height:auto;"> 
        <div class="x-control-group-title" xid="controlGroupTitle1"> 
          <span xid="span5">title</span> 
        </div>  
        <div component="$UI/system/components/bootstrap/row/row" class="row"
          xid="row4"> 
          <div class="col-sm-6" xid="col1" style="width:auto;height:auto;"> 
            <select component="$UI/system/components/justep/select/select" class="form-control"
              xid="select2" bind-options="selectData" bind-optionsValue="options"
              bind-optionsLabel="options" bind-optionsCaption="请选择员工" style="width:121px;"/> 
          </div>
        </div>
      </div>  
      <div component="$UI/system/components/justep/controlGroup/controlGroup"
        class="x-control-group" title="2.获取选中值" xid="controlGroup2" collapsible="true"> 
        <div class="x-control-group-title" xid="controlGroupTitle2"> 
          <span xid="span1">title</span> 
        </div>  
        <div component="$UI/system/components/bootstrap/row/row" class="row"
          xid="row5"> 
          <div class="col-sm-6" xid="col2" style="width:auto;"> 
            <select component="$UI/system/components/justep/select/select" class="form-control"
              xid="select1" bind-options="selectData" bind-optionsValue="options"
              bind-optionsLabel="options" bind-optionsCaption="请选择员工" style="width:121px;"
              bind-ref="valueData.ref('optionsValue')" bind-labelRef="valueData.ref('optionsValue')"/>  
            <a component="$UI/system/components/justep/button/button" class="btn btn-link"
              label="获取当前值" xid="valueBtn" onClick="valueBtnClick"> 
              <i xid="i1"/>  
              <span xid="span2">获取当前值</span> 
            </a> 
          </div>
        </div>
      </div>  
      <div component="$UI/system/components/justep/controlGroup/controlGroup"
        class="x-control-group" title="3.禁用 可用" xid="controlGroup3" collapsible="true"> 
        <div class="x-control-group-title" xid="controlGroupTitle3"> 
          <span xid="span3">title</span> 
        </div>  
        <div component="$UI/system/components/bootstrap/row/row" class="row"
          xid="row6"> 
          <div class="col-sm-6" xid="col3" style="width:auto;"> 
            <select component="$UI/system/components/justep/select/select" class="form-control"
              xid="select" bind-options="selectData" bind-optionsValue="enable" bind-optionsLabel="enable"
              bind-optionsCaption="请选择员工" style="width:121px;"/>  
            <a component="$UI/system/components/justep/button/button" class="btn btn-link"
              label="可用" xid="enableBtn" onClick="enableBtnClick"> 
              <i xid="i2"/>  
              <span xid="span4">可用</span> 
            </a>  
            <a component="$UI/system/components/justep/button/button" class="btn btn-link"
              label="禁用" xid="disabledBtn" onClick="disabledBtnClick"> 
              <i xid="i3"/>  
              <span xid="span6">禁用</span> 
            </a> 
          </div>
        </div>
      </div>  
      <div component="$UI/system/components/justep/controlGroup/controlGroup"
        class="x-control-group" title="4.change事件" xid="controlGroup4" collapsible="true"> 
        <div class="x-control-group-title" xid="controlGroupTitle4"> 
          <span xid="span7">title</span> 
        </div>  
        <div component="$UI/system/components/bootstrap/row/row" class="row"
          xid="row7"> 
          <div class="col-sm-6" xid="col4" style="width:auto;"> 
            <select component="$UI/system/components/justep/select/select" class="form-control"
              xid="changeSelect" bind-options="selectData" bind-optionsValue="change"
              bind-optionsLabel="change" bind-optionsCaption="请选择员工" style="width:121px;"
              onChange="changeSelectChange" bind-ref="valueData.ref('changeValue')"
              bind-labelRef="valueData.ref('changeValue')"/> 
          </div>
        </div>
      </div>  
      <div component="$UI/system/components/justep/controlGroup/controlGroup"
        class="x-control-group" title="5.设置当前显示数据    " xid="controlGroup5" collapsible="true"> 
        <div class="x-control-group-title" xid="controlGroupTitle5"> 
          <span xid="span8">title</span> 
        </div>  
        <div component="$UI/system/components/bootstrap/row/row" class="row"
          xid="row8"> 
          <div class="col-sm-6" xid="col5" style="width:auto;"> 
            <select size="2" component="$UI/system/components/justep/select/select"
              class="form-control" xid="select5" bind-options="selectData" bind-optionsValue="change"
              bind-optionsLabel="change" bind-optionsCaption="请选择员工" style="width:106px;"
              bind-ref="valueData.ref('changeValue')" bind-labelRef="valueData.ref('changeValue')"/> 
          </div>
        </div>
      </div>  
      <div component="$UI/system/components/justep/controlGroup/controlGroup"
        class="x-control-group" title="6.动态修改下拉框" xid="controlGroup7" collapsible="true"
        style="height:auto;"> 
        <div class="x-control-group-title" xid="controlGroupTitle7"> 
          <span xid="span11">title</span>
        </div>  
        <div class="form-horizontal container-fluid" component="$UI/system/components/bootstrap/form/form(bootstrap)"
          xid="div6" style="height:auto;"> 
          <div class="form-group" xid="formGroup7" style="width:auto;height:auto;"> 
            <div class="col-sm-6" xid="col7" style="width:auto;height:auto;"> 
              <select component="$UI/system/components/justep/select/select" class="form-control"
                xid="select4" style="width:164px;" bind-options="selectData" bind-optionsCaption="请选择"
                bind-optionsValue="dynamic" bind-optionsLabel="dynamic" bind-ref="valueData.ref('dynamic')"
                bind-labelRef="valueData.ref('dynamic')"/>  
              <a component="$UI/system/components/justep/button/button" class="btn btn-link"
                label="选中北京" xid="checked" onClick="checkedClick"> 
                <i xid="i6"/>  
                <span xid="span13">选中北京</span>
              </a>  
              <a component="$UI/system/components/justep/button/button" class="btn btn-link"
                label="追加一项" xid="addbtn" onClick="addbtnClick"> 
                <i xid="i7"/>  
                <span xid="span14">追加一项</span>
              </a> 
            </div> 
          </div> 
        </div> 
      </div>  
      <div component="$UI/system/components/justep/controlGroup/controlGroup"
        class="x-control-group" title="7.垂直下拉框" xid="controlGroup8" collapsible="true"
        style="height:auto;"> 
        <div class="x-control-group-title" xid="controlGroupTitle8"> 
          <span xid="span12">title</span>
        </div>  
        <div component="$UI/system/components/bootstrap/row/row" class="row"
          xid="row1"> 
          <div class="col-sm-6" xid="col8" style="width:auto;height:auto;"> 
            <div component="$UI/system/components/justep/labelEdit/labelEdit"
              class="x-label-edit x-label30" xid="labelInput1"> 
              <label class="x-label" xid="label2" bind-text="selectData.label('normalInput')"
                style="width:145px;"/>  
              <input component="$UI/system/components/justep/input/input" class="form-control x-edit"
                xid="input1" bind-ref="selectData.ref('normalInput')"/>
            </div>
            <div component="$UI/system/components/justep/labelEdit/labelEdit"
              class="x-label-edit x-label30" xid="labelSelect1"> 
              <label class="x-label" xid="label1" bind-text="selectData.label('selectOne')"/>  
              <select component="$UI/system/components/justep/select/select" class="form-control x-edit"
                xid="selectOne" bind-options="selectData" bind-optionsValue="selectOne"
                bind-optionsLabel="selectOne" bind-optionsCaption="请选择" bind-ref="valueData.ref('selectOne')"
                bind-labelRef="valueData.ref('selectOne')"/>
            </div>  
            <div component="$UI/system/components/justep/labelEdit/labelEdit"
              class="x-label-edit x-label30" xid="labelSelect2"> 
              <label class="x-label" xid="label3" bind-text="selectData.label('selectTwo')"/>  
              <select component="$UI/system/components/justep/select/select" class="form-control x-edit"
                xid="selectTwo" bind-options="selectData" bind-optionsCaption="请选择"
                bind-optionsValue="selectTwo" bind-optionsLabel="selectTwo" bind-ref="valueData.ref('selectTwo')"
                bind-labelRef="valueData.ref('selectTwo')"/>
            </div>  
            <a component="$UI/system/components/justep/button/button" class="btn btn-link"
              label="登录" xid="loginBtn" onClick="loginBtnClick"> 
              <i xid="i5"/>  
              <span xid="span16">登录</span>
            </a>  
            <a component="$UI/system/components/justep/button/button" class="btn btn-link"
              label="重置" xid="resetBtn" onClick="resetBtnClick"> 
              <i xid="i9"/>  
              <span xid="span17">重置</span>
            </a>
          </div> 
        </div> 
      </div>  
      <div component="$UI/system/components/justep/controlGroup/controlGroup"
        class="x-control-group" title="8.不同表单元素横向排列" xid="controlGroup9" collapsible="true"
        style="height:auto;"> 
        <div class="x-control-group-title" xid="controlGroupTitle9"> 
          <span xid="span18">title</span>
        </div>  
        <div component="$UI/system/components/bootstrap/row/row" class="row"
          xid="row2"> 
          <div class="col col-xs-4" xid="col9" style="width:auto;height:auto;"> 
            <div component="$UI/system/components/justep/labelEdit/labelEdit"
              class="x-label-edit x-label30" xid="labelInput2"> 
              <label class="x-label" xid="label4" bind-text="selectData.label('labelInput')"
                style="width:63px;"/>  
              <input component="$UI/system/components/justep/input/input" class="form-control x-edit"
                xid="input2" style="width:99px;"/>
            </div>
          </div>  
          <div class="col col-xs-4 " xid="col10" style="width:auto;height:auto;"> 
            <div component="$UI/system/components/justep/labelEdit/labelEdit"
              class="x-label-edit x-label30" xid="labelSelect3"> 
              <label class="x-label" xid="label6" bind-text="selectData.label('sex')"/>  
              <select component="$UI/system/components/justep/select/select" class="form-control x-edit"
                xid="select6" bind-optionsCaption="请选择" style="width:138px;" bind-ref="valueData.ref('sample')"
                bind-labelRef="valueData.ref('sample')" bind-options="selectData"
                bind-optionsValue="sex" bind-optionsLabel="sex"/>
            </div>
          </div>  
          <div class="col col-xs-4 " xid="col11" style="width:auto;height:auto;"> 
            <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-lg center-block"
              label="提交" xid="submitBtn" onClick="submitBtnClick" style="height:36px;"> 
              <i xid="i10"/>  
              <span xid="span19">提交</span>
            </a>
          </div> 
        </div> 
      </div>
    </div> 
  </div> 
</div>
