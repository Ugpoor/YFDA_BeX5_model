<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window" component="$UI/system/components/justep/window/window"
  design="device:pc;">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:110px;top:23px;"> 
    <div component="$UI/system/components/justep/data/data" autoLoad="true"
      xid="name" idColumn="name" confirmRefresh="false"> 
      <column label="姓名:" name="name" type="String" xid="xid1"/>  
      <column label="密码:" name="password" type="String" xid="xid3"/>  
      <column label="示例" name="example" type="String" xid="xid4"/>  
      <column label="输出" name="output" type="String" xid="xid2"/>  
      <column label="提示" name="text" type="String" xid="xid5"/>  
      <column label="大写锁定" name="lock" type="String" xid="xid6"/>  
      <column label="强度等级" name="strength" type="String" xid="xid7"/>  
      <column label="输入密码" name="inputpassword" type="String" xid="xid8"/>  
      <column label="初始值" name="init" type="String" xid="xid9"/>  
      <column label="日期" name="date" type="String" xid="xid11"/>  
      <column label="设置日期" name="dataValue" type="Date" xid="xid12"/>  
      <column label="日期最小值" name="minDate" type="Date" xid="xid13"/>  
      <column label="判断值" name="flag" type="Boolean" xid="xid14"/>  
      <rule xid="rule1"> 
        <col name="name" xid="ruleCol1"> 
          <constraint xid="constraint1"> 
            <expr xid="default2"/> 
          </constraint> 
        </col>  
        <col name="minDate" xid="ruleCol2"> 
          <constraint xid="constraint2"> 
            <expr xid="default4"/>  
            <message xid="default5"/> 
          </constraint> 
        </col> 
      </rule>  
      <data xid="default1">[{"name":"","password":"","example":"","output":"","lock":"","strength":"","inputpassword":"","init":"123456","date":"","dataValue":"2015-02-12"},{"strength":"222222222222"}]</data> 
    </div>  
    <div component="$UI/system/components/justep/data/data" autoLoad="true"
      xid="enableData" idColumn="disabled"> 
      <column label="禁用" name="disabled" type="String" xid="xid10"/>  
      <data xid="default3">[{"disabled":""}]</data> 
    </div>  
    <div component="$UI/system/components/justep/data/data" autoLoad="true"
      xid="numData" idColumn="num"> 
      <column label="字数" name="num" type="String" xid="xid15"/>  
      <data xid="default6">[{}]</data> 
    </div>  
    <div component="$UI/system/components/justep/data/data" autoLoad="true"
      xid="data" idColumn="num"> 
      <column label="数字" name="num" type="String" xid="xid16"/>  
      <column label="Input" name="input" type="String" xid="xid17"/>  
      <data xid="default7">[{}]</data> 
    </div> 
  </div>  
  <div component="$UI/system/components/justep/contents/contents" class="x-contents x-full"
    active="0" xid="contents"> 
    <div class="x-contents-content" xid="content1" style="height:100%;width:100%;"> 
      <h4 xid="h42"><![CDATA[文本框]]><a component="$UI/system/components/justep/button/button" class="btn btn-link" label="js" xid="jsBtn" onClick="jsBtnClick"> 
        <i xid="i13" />  
        <span xid="span27">js</span> 
      </a><a component="$UI/system/components/justep/button/button" class="btn btn-link " label="源码" xid="sourceBtn" onClick="sourceClick">
   <i xid="i9"></i>
   <span xid="span23">源码</span></a></h4>  
      <div component="$UI/system/components/justep/controlGroup/controlGroup"
        class="x-control-group" title="1.基本文本框" xid="controlGroup1" collapsible="true"> 
        <div class="x-control-group-title" xid="controlGroupTitle1"> 
          <span xid="span5"><![CDATA[]]></span> 
        </div>  
        <div component="$UI/system/components/bootstrap/row/row" class="row"
          xid="row4"> 
          <div class="col col-xs-6" xid="col21"> 
            <div component="$UI/system/components/justep/labelEdit/labelEdit"
              class="x-label-edit x-label30" xid="labelInput1"> 
              <label class="x-label" xid="label1" style="width:56px;" bind-text="name.label('name')"/>  
              <input component="$UI/system/components/justep/input/input" class="form-control x-edit"
                xid="input1" style="width:419px;"/> 
            </div> 
          </div>  
          <div class="col col-xs-6" xid="col22"> 
            <div component="$UI/system/components/justep/labelEdit/labelEdit"
              class="x-label-edit x-label30" xid="labelPassword1"> 
              <label class="x-label" xid="label3" style="width:56px;" bind-text="name.label('password')"/>  
              <input component="$UI/system/components/justep/input/password"
                class="form-control x-edit" xid="password2" style="width:419px;"/> 
            </div> 
          </div> 
        </div> 
      </div>  
      <div component="$UI/system/components/justep/controlGroup/controlGroup"
        class="x-control-group" title="2.自定义宽度" xid="controlGroup3" collapsible="true"> 
        <div class="x-control-group-title" xid="controlGroupTitle3"> 
          <span xid="span2"/> 
        </div>  
        <div component="$UI/system/components/bootstrap/row/row" class="row"
          xid="row5"> 
          <div class="col col-xs-6" xid="col29"> 
            <div component="$UI/system/components/justep/labelEdit/labelEdit"
              class="x-label-edit x-label15 pull-left" xid="labelInput9"> 
              <label class="pull-left x-label" xid="label15" style="width:45px;"
                bind-text="name.label('name')"/>  
              <input component="$UI/system/components/justep/input/input" class="form-control pull-left x-edit"
                xid="input10" style="width:90px;"/> 
            </div> 
          </div> 
        </div> 
      </div>  
      <div component="$UI/system/components/justep/controlGroup/controlGroup"
        class="x-control-group" title="3.显示水印" xid="controlGroup4" collapsible="true"> 
        <div class="x-control-group-title" xid="controlGroupTitle4"> 
          <span xid="span3"/> 
        </div>  
        <div class="form-horizontal container-fluid" component="$UI/system/components/bootstrap/form/form(bootstrap)"
          xid="div5"> 
          <div component="$UI/system/components/justep/row/row" class="x-row"
            xid="row1"> 
            <div class="x-col x-col-fixed" xid="col15"/> 
          </div> 
        </div>  
        <div component="$UI/system/components/bootstrap/row/row" class="row"
          xid="row8"> 
          <div class="col col-xs-12" xid="col30"> 
            <div component="$UI/system/components/justep/labelEdit/labelEdit"
              class="x-label-edit x-label15 pull-left" xid="labelInput10"> 
              <label class="pull-left x-label" xid="label16" style="width:45px;"
                bind-text="name.label('name')"/>  
              <input component="$UI/system/components/justep/input/input" class="form-control pull-left x-edit"
                xid="input11" style="width:30%;" placeHolder="请输入姓名" bind-ref="name.ref('name')"/> 
            </div> 
          </div>  
          <div class="col col-xs-12" xid="col33"> 
            <span xid="span4"><![CDATA[注意：当文本框启用了水印并且无输入时，那么在提交表单时使用表单的onsubmit事件会导致文本框的value值不为空。 ]]></span> 
          </div> 
        </div> 
      </div>  
      <div component="$UI/system/components/justep/controlGroup/controlGroup"
        class="x-control-group" title="4.可清除内容" xid="controlGroup5" collapsible="true"> 
        <div class="x-control-group-title" xid="controlGroupTitle5"> 
          <span xid="span6"/> 
        </div>  
        <div component="$UI/system/components/bootstrap/row/row" class="row"
          xid="row9"> 
          <div class="col col-xs-6" xid="col36"> 
            <div component="$UI/system/components/justep/labelEdit/labelEdit"
              class="x-label-edit x-label10" xid="labelEditBtn2"> 
              <label class="x-label" style="width:60px;" xid="label23" bind-text="name.label('name')"/>  
              <div class="x-edit" xid="div18"> 
                <div class="input-group" xid="div19"> 
                  <input component="$UI/system/components/justep/input/input"
                    class="form-control" xid="textBox" bind-ref="name.ref('name')"/>  
                  <span class="input-group-btn" xid="span9"> 
                    <a component="$UI/system/components/justep/button/button"
                      class="btn btn-link btn-xs btn-only-icon" icon="icon-android-close"
                      xid="delBtn" bind-visible=" $model.name.val(&quot;name&quot;) != &quot;&quot;" onClick="delBtnClick"> 
                      <i class="icon-android-close" xid="i6"/> 
                    </a> 
                  </span> 
                </div> 
              </div> 
            </div> 
          </div>  
          <div class="col col-xs-6" xid="col37"> 
            <div component="$UI/system/components/justep/labelEdit/labelEdit"
              class="x-label-edit x-label10" xid="labelPassword2"> 
              <label class="x-label" xid="label2" bind-text="name.label('password')"/>  
              <input component="$UI/system/components/justep/input/password"
                class="form-control x-edit" xid="textPassword" bind-ref="name.ref('password')"
                style="width:200px;"> 
                <a component="$UI/system/components/justep/button/button"
                  class="btn btn-link btn-xs btn-only-icon" label="button" xid="delete"
                  bind-visible="$model.name.val(&quot;password&quot;) != &quot;&quot;" onClick="deleteClick"
                  icon="icon-android-close"> 
                  <i xid="i1" class="icon-android-close"/>  
                  <span xid="span1"/> 
                </a> 
              </input> 
            </div> 
          </div> 
        </div> 
      </div>  
      <div component="$UI/system/components/justep/controlGroup/controlGroup"
        class="x-control-group" title="5.限制输入字数" xid="controlGroup2" collapsible="true"> 
        <div class="x-control-group-title" xid="controlGroupTitle2"> 
          <span xid="span7"/> 
        </div>  
        <div component="$UI/system/components/bootstrap/row/row" class="row"
          xid="row10"> 
          <div class="col col-xs-12" xid="col42"> 
            <span xid="span8"><![CDATA[限制输入个数的基本做法是使用maxlength。效果如下：]]></span> 
          </div>  
          <div class="col-sm-6 pull-left" xid="col3"> 
            <div component="$UI/system/components/justep/labelEdit/labelEdit"
              class="x-label-edit x-label30" xid="labelInput2"> 
              <label class="x-label" xid="label4" style="width:56px;" bind-text="name.label('name')"/>  
              <input component="$UI/system/components/justep/input/input" class="form-control x-edit"
                xid="input" style="width:419px;" maxLength="5" bind-keyup="inputKeyup"
                bind-ref="data.ref('input')"/> 
            </div> 
          </div>  
          <div class="col-sm-6 pull-left" xid="col2"> 
            <div component="$UI/system/components/justep/labelEdit/labelEdit"
              class="x-label-edit x-label30" xid="labelPassword3"> 
              <label class="x-label" xid="label5" style="width:56px;" bind-text="name.label('password')"/>  
              <input component="$UI/system/components/justep/input/password"
                class="form-control x-edit" xid="password" style="width:419px;" maxLength="5"
                bind-keyup="passwordKeyup"/> 
            </div> 
          </div>  
          <div class="col-sm-6" xid="col9"> 
            <div component="$UI/system/components/justep/output/output" class="x-output"
              xid="showNum" bind-ref="data.ref('num')"/> 
          </div>  
          <div class="col-sm-6" xid="col10"> 
            <div component="$UI/system/components/justep/output/output" class="x-output"
              xid="showPasswordNum" bind-ref="numData.ref('num')"/> 
          </div> 
        </div> 
      </div>  
      <div component="$UI/system/components/justep/controlGroup/controlGroup"
        class="x-control-group" title="6.限制输入类型" xid="controlGroup6" collapsible="true"> 
        <div class="x-control-group-title" xid="controlGroupTitle6"> 
          <span xid="span16"/> 
        </div>  
        <div component="$UI/system/components/bootstrap/row/row" class="row"
          xid="row11"> 
          <div class="col col-xs-5" xid="col43"> 
            <div component="$UI/system/components/justep/labelEdit/labelEdit"
              class="x-label-edit x-label30" xid="labelInput5"> 
              <label class="x-label" xid="label11" style="width:56px;" bind-text="name.label('example')"/>  
              <input component="$UI/system/components/justep/input/input" class="form-control x-edit"
                xid="input5" style="width:419px;" dataType="String" placeHolder="请输入数字或字母"/> 
            </div> 
          </div>  
          <div class="col col-xs-5 pull-left" xid="col44"> 
            <div component="$UI/system/components/justep/labelEdit/labelEdit"
              class="x-label-edit x-label30" xid="labelInput6"> 
              <label class="x-label" xid="label13" style="width:56px;" bind-text="name.label('example')"/>  
              <input component="$UI/system/components/justep/input/input" class="form-control x-edit"
                xid="input6" style="width:419px;" placeHolder="请输入整数" dataType="Integer" bind-keypress="input6Keypress"/> 
            </div> 
          </div> 
        </div> 
      </div>  
      <div component="$UI/system/components/justep/controlGroup/controlGroup"
        class="x-control-group" title="7、密码框默认自动监测Caps键" xid="controlGroup7"
        collapsible="true"> 
        <div class="x-control-group-title" xid="controlGroupTitle7"> 
          <span xid="span17"/> 
        </div>  
        <div component="$UI/system/components/bootstrap/row/row" class="row"
          xid="row12"> 
          <div class="col col-xs-12" xid="col46"> 
            <div component="$UI/system/components/justep/labelEdit/labelEdit"
              class="x-label-edit x-label30" xid="labelPassword6"> 
              <label class="x-label" xid="label17" style="width:56px;" bind-text="name.label('password')"/>  
              <input component="$UI/system/components/justep/input/password"
                class="form-control x-edit" xid="lock" style="width:419px;" bind-keyup="lockKeyup"/>  
              <div component="$UI/system/components/justep/output/output" class="x-output pull-right"
                xid="output3" bind-ref="name.ref('lock')"/> 
            </div> 
          </div> 
        </div> 
      </div>  
      <div component="$UI/system/components/justep/controlGroup/controlGroup"
        class="x-control-group" title="8、显示密码强度" xid="controlGroup8" collapsible="true"> 
        <div class="x-control-group-title" xid="controlGroupTitle8"> 
          <span xid="span18"/> 
        </div>  
        <div component="$UI/system/components/bootstrap/row/row" class="row"
          xid="row13"> 
          <div class="col col-xs-12" xid="col49"> 
            <div component="$UI/system/components/justep/labelEdit/labelEdit"
              class="x-label-edit x-label30" xid="labelPassword7"> 
              <label class="x-label" xid="label18" style="width:56px;" bind-text="name.label('password')"/>  
              <input component="$UI/system/components/justep/input/password"
                class="form-control x-edit" xid="passwordStrength" style="width:419px;"
                bind-keyup="passwordStrengthKeyup"/>  
              <div component="$UI/system/components/justep/output/output" class="x-output"
                xid="strength" bind-ref="name.ref('strength')" bind-css="{'hard': name.val('strength')=='密码强','middle': name.val('strength')=='密码中','easy': name.val('strength')=='密码弱'}"/> 
            </div> 
          </div> 
        </div> 
      </div>  
      <div component="$UI/system/components/justep/controlGroup/controlGroup"
        class="x-control-group" title="9、密码框设置初始值" xid="controlGroup9" collapsible="true"> 
        <div class="x-control-group-title" xid="controlGroupTitle9"> 
          <span xid="span10"/> 
        </div>  
        <div component="$UI/system/components/bootstrap/row/row" class="row"
          xid="row14"> 
          <div class="col col-xs-12" xid="col54"> 
            <div component="$UI/system/components/justep/labelEdit/labelEdit"
              class="x-label-edit x-label30" xid="labelPassword5"> 
              <label class="x-label" xid="label6" style="width:56px;" bind-text="name.label('password')"/>  
              <input component="$UI/system/components/justep/input/password"
                class="form-control x-edit" xid="password5" style="width:419px;" bind-ref="name.ref('init')"/> 
            </div> 
          </div> 
        </div> 
      </div>  
      <div component="$UI/system/components/justep/controlGroup/controlGroup"
        class="x-control-group" title="10、禁用/启用" xid="controlGroup10" collapsible="true"> 
        <div class="x-control-group-title" xid="controlGroupTitle10"> 
          <span xid="span11"/> 
        </div>  
        <div component="$UI/system/components/bootstrap/row/row" class="row"
          xid="row15"> 
          <div class="col col-xs-12" xid="col55"> 
            <div component="$UI/system/components/justep/labelEdit/labelEdit"
              class="x-label-edit x-label30" xid="labelInput3"> 
              <label class="x-label" xid="label9" style="width:56px;" bind-text="name.label('name')"/>  
              <input component="$UI/system/components/justep/input/input" class="form-control x-edit"
                xid="nameInput" style="width:419px;" bind-disable="$model.enableData.val(&quot;disabled&quot;)==1"
                bind-enable=" $model.enableData.val(&quot;disabled&quot;)==0"/> 
            </div> 
          </div>  
          <div class="col col-xs-12" xid="col56"> 
            <div component="$UI/system/components/justep/labelEdit/labelEdit"
              class="x-label-edit x-label30" xid="labelPassword8"> 
              <label class="x-label" xid="label10" style="width:56px;" bind-text="name.label('name')"/>  
              <input component="$UI/system/components/justep/input/password"
                class="form-control x-edit" xid="passwordInput" style="width:419px;"
                bind-disable=" $model.enableData.val(&quot;disabled&quot;)==1" bind-enable=" $model.enableData.val(&quot;disabled&quot;)==0"/> 
            </div> 
          </div>  
          <div class="col col-xs-12" xid="col57"> 
            <a component="$UI/system/components/justep/button/button" class="btn btn-link"
              label="启用" xid="enableBtn" onClick="enableBtnClick"> 
              <i xid="i3"/>  
              <span xid="span13">启用</span> 
            </a>  
            <a component="$UI/system/components/justep/button/button" class="btn btn-link"
              label="禁用" xid="disableBtn" onClick="disableBtnClick"> 
              <i xid="i4"/>  
              <span xid="span14">禁用</span> 
            </a> 
          </div> 
        </div> 
      </div>  
      <div component="$UI/system/components/justep/controlGroup/controlGroup"
        class="x-control-group" title="11、动态生成" xid="controlGroup11" collapsible="true"> 
        <div class="x-control-group-title" xid="controlGroupTitle11"> 
          <span xid="span15"/> 
        </div>  
        <div component="$UI/system/components/bootstrap/row/row" class="row"
          xid="row17"> 
          <div class="col col-xs-6" xid="insertInput"> 
            <a component="$UI/system/components/justep/button/button" class="btn btn-link"
              label="点击增加输入框" xid="addInput" onClick="addInputClick"> 
              <i xid="i5"/>  
              <span xid="span19">点击增加输入框</span> 
            </a> 
          </div>  
          <div class="col col-xs-6" xid="insertPassword"> 
            <a component="$UI/system/components/justep/button/button" class="btn btn-link"
              label="点击生成密码框" xid="addPassword" onClick="addPasswordClick"> 
              <i xid="i7"/>  
              <span xid="span20">点击生成密码框</span> 
            </a> 
          </div> 
        </div> 
      </div>  
      <div component="$UI/system/components/justep/controlGroup/controlGroup"
        class="x-control-group" title="12.监听回车事件" xid="controlGroup12" collapsible="true"> 
        <div class="x-control-group-title" xid="controlGroupTitle12"> 
          <span xid="span12"/> 
        </div>  
        <div component="$UI/system/components/bootstrap/row/row" class="row"
          xid="row18"> 
          <div class="col col-xs-12" xid="col64"> 
            <div component="$UI/system/components/justep/labelEdit/labelEdit"
              class="x-label-edit x-label30" xid="labelInput11" style="width:auto;"> 
              <label class="x-label" xid="label21" style="width:56px;" bind-text="name.label('name')"/>  
              <input component="$UI/system/components/justep/input/input" class="form-control x-edit"
                xid="enter" style="width:255px;" bind-keypress="enterKeypress"/> 
            </div> 
          </div>  
          <div class="col col-xs-12" xid="col65"> 
            <div component="$UI/system/components/justep/labelEdit/labelEdit"
              class="x-label-edit x-label30" xid="labelPassword11" style="width:auto;"> 
              <label class="x-label" xid="label22" style="width:56px;" bind-text="name.label('password')"/>  
              <input component="$UI/system/components/justep/input/password"
                class="form-control x-edit" xid="enterPassword" style="width:255px;"
                bind-keypress="enterPasswordKeypress"/> 
            </div> 
          </div>  
          <div class="col col-xs-12" xid="col66"> 
            <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-sm"
              label="登录" xid="loginBtn" onClick="loginBtnClick"> 
              <i xid="i2"/>  
              <span xid="span21">登录</span> 
            </a>  
            <a component="$UI/system/components/justep/button/button" class="btn btn-link"
              label="重置" xid="resetBtn" onClick="resetBtnClick"> 
              <i xid="i8"/>  
              <span xid="span22">重置</span> 
            </a> 
          </div> 
        </div> 
      </div>  
      <div component="$UI/system/components/justep/controlGroup/controlGroup"
        class="x-control-group" title="13.选择日期" xid="controlGroup13" collapsible="true"> 
        <div class="x-control-group-title" xid="controlGroupTitle25"> 
          <span xid="span51"/> 
        </div>  
        <div component="$UI/system/components/bootstrap/row/row" class="row"
          xid="row27"> 
          <div class="col col-xs-3" xid="col50"> 
            <div component="$UI/system/components/justep/labelEdit/labelEdit"
              class="x-label-edit x-label30" xid="labelInput20" style="width:auto;"> 
              <label class="x-label" xid="label40" style="width:56px;" bind-text="name.label('date')"/>  
              <input component="$UI/system/components/justep/input/input" class="form-control x-edit"
                xid="input17" style="width:auto;" bind-keypress="enterKeypress" dataType="Date"
                format="yyyy-MM-dd"/> 
            </div> 
          </div>  
          <div class="col col-xs-3" xid="col1"> 
            <div component="$UI/system/components/justep/labelEdit/labelEdit"
              class="x-label-edit x-label30" xid="labelInput7" style="width:auto;"> 
              <label class="x-label" xid="label12" style="width:56px;" bind-text="name.label('date')"/>  
              <input component="$UI/system/components/justep/input/input" class="form-control x-edit"
                xid="input3" style="width:auto;" bind-keypress="enterKeypress" dataType="DateTime"
                format="yyyy-MM-dd hh:mm"/> 
            </div> 
          </div>  
          <div class="col col-xs-3" xid="col4"> 
            <div component="$UI/system/components/justep/labelEdit/labelEdit"
              class="x-label-edit x-label30" xid="labelInput8" style="width:auto;"> 
              <label class="x-label" xid="label14" style="width:56px;" bind-text="name.label('date')"/>  
              <input component="$UI/system/components/justep/input/input" class="form-control x-edit"
                xid="input4" style="width:auto;" bind-keypress="enterKeypress" dataType="Time"
                format=" hh:mm"/> 
            </div> 
          </div>  
          <div class="col col-xs-3" xid="col7"> 
            <div component="$UI/system/components/justep/labelEdit/labelEdit"
              class="x-label-edit x-label30" xid="labelInput12" style="width:auto;"> 
              <label class="x-label" xid="label19" style="width:56px;" bind-text="name.label('date')"/>  
              <input component="$UI/system/components/justep/input/input" class="form-control x-edit"
                xid="input7" style="width:auto;" bind-keypress="enterKeypress" dataType="Date"
                bind-ref="name.ref('dataValue')"/> 
            </div> 
          </div> 
        </div> 
      </div> 
    </div> 
  </div> 
</div>
