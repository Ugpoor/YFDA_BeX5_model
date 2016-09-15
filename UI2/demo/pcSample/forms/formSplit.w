<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window" component="$UI/system/components/justep/window/window"
  design="device:pc">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:458px;top:19px;"> 
    <div component="$UI/system/components/justep/data/data" autoLoad="true"
      xid="userData" idColumn="name"> 
      <column label="用户姓名：" name="name" type="String" xid="xid1"/>  
      <column label="用户密码：" name="pwd" type="String" xid="xid2"/>  
      <column label="用户邮箱：" name="email" type="String" xid="xid3"/>  
      <column label="用户地址：" name="address" type="String" xid="xid4"/>  
      <data xid="default2">[{"name":"张三","pwd":"111","email":"123@ee.com","address":" 北京"}]</data> 
    </div>  
    <div component="$UI/system/components/justep/data/data" autoLoad="true"
      xid="uData" idColumn="name"> 
      <column label="用户名：" name="name" type="String" xid="xid5"/>  
      <column label="是否愿意留下邮箱：" name="check" type="String" xid="xid7"/>  
      <column label="邮箱：" name="email" type="String" xid="xid6"/>  
      <data xid="default6">[{}]</data>  
      <rule xid="rule1"> 
        <col name="name" xid="ruleCol1"> 
          <required xid="required1"> 
            <expr xid="default4"/>  
            <message xid="default5"/> 
          </required> 
        </col> 
      </rule> 
    </div>  
    <div component="$UI/system/components/justep/data/data" autoLoad="true"
      xid="numData" idColumn="num"> 
      <column label="数字" name="num" type="String" xid="column1"/>  
      <data xid="default10">[{}]</data> 
    </div>  
    <div component="$UI/system/components/justep/data/data" autoLoad="true"
      xid="empData" idColumn="emp"> 
      <column label="员工：" name="emp" type="String" xid="xid8"/>  
      <data xid="default12">[{"emp":"员工1"},{"emp":"员工2"},{"emp":"员工3"},{"emp":"员工4"}]</data> 
    </div>  
    <div component="$UI/system/components/justep/data/data" autoLoad="true"
      xid="addData" idColumn="emp"> 
      <column label="你选择的员工是：" name="emp" type="String" xid="xid9"/> 
    </div> 
  </div>  
  <span component="$UI/system/components/justep/messageDialog/messageDialog"
    xid="messageDialog" style="left:128px;top:32px;"/>  
  <span component="$UI/system/components/justep/windowDialog/windowDialog" xid="eiectDialog"
    src="$UI/demo/sample/forms/ejectForm.w" status="normal" style="left:244px;top:31px;"
    width="30%" height="45%"/>
  <div component="$UI/system/components/justep/controlGroup/controlGroup" class="x-control-group"
    title="表单拆分" xid="controlGroup" style="width:99%;"> 
    <div class="x-control-group-title" xid="controlGroupTitle2"> 
      <span xid="span6"><![CDATA[表单拆分]]></span> 
    </div>  
    <a component="$UI/system/components/justep/button/button" class="btn btn-link"
      label="js" xid="showJs" onClick="showJsSource"> 
      <i xid="i29"/>  
      <span xid="span31">js</span>
    </a>
    <a component="$UI/system/components/justep/button/button" class="btn btn-link"
      label="源码" xid="sourceBtn" onClick="sourceBtnClick"> 
      <i xid="i16"/>  
      <span xid="span19">源码</span>
    </a>
    <div class="form-horizontal container-fluid" component="$UI/system/components/bootstrap/form/form"
      xid="form2"> 
      <fieldset xid="fieldset6" class="fieldset6"> 
        <legend xid="default11">导航模式</legend>  
        <div component="$UI/system/components/justep/tabs/tabs" class="x-tabs"
          xid="tabs1" style="height:150px;margin-left:20px;"> 
          <div component="$UI/system/components/justep/panel/panel" class="x-panel"
            xid="panel1"> 
            <div class="x-panel-top" xid="top1"> 
              <ul class="nav nav-tabs" xid="navs1"> 
                <li class="active" xid="li2"> 
                  <a content="tabContent_1" xid="tabItem1" bind-disable="true">步骤一</a> 
                </li>  
                <li xid="li3"> 
                  <a content="tabContent1" xid="tabItem2">步骤二</a> 
                </li>  
                <li xid="li4"> 
                  <a content="tabContent2" xid="tabItem3">步骤三</a> 
                </li>  
                <li xid="li5"> 
                  <a content="tabContent3" xid="tabItem4">步骤四</a> 
                </li> 
              </ul> 
            </div>  
            <div class="x-panel-content" xid="content2"> 
              <div component="$UI/system/components/justep/contents/contents"
                class="x-contents" active="0" xid="contents1" style="height:auto;"> 
                <div class="x-contents-content active" xid="content1"> 
                  <h4 xid="h42"><![CDATA[步骤一的内容]]></h4>  
                  <a component="$UI/system/components/justep/button/button"
                    class="btn btn-link" label="下一步" xid="nextBut" onClick="{operation:'tabs1.setActiveTab', args: {xid: 'li3'}}"> 
                    <i xid="i5"/>  
                    <span xid="span7">下一步</span> 
                  </a> 
                </div>  
                <div class="x-contents-content" xid="content3"> 
                  <h4 xid="h41"><![CDATA[步骤二的内容]]></h4>  
                  <a component="$UI/system/components/justep/button/button"
                    class="btn btn-link" label="上一步" xid="button1" onClick="{operation:'tabs1.setActiveTab', args: {xid: 'li2'}}"> 
                    <i xid="i2"/>  
                    <span xid="span2">上一步</span> 
                  </a>  
                  <a component="$UI/system/components/justep/button/button"
                    class="btn btn-link" label="下一步" xid="button2" onClick="{operation:'tabs1.setActiveTab', args: {xid: 'li4'}}"> 
                    <i xid="i6"/>  
                    <span xid="span8">下一步</span> 
                  </a> 
                </div>  
                <div class="x-contents-content" xid="content4"> 
                  <h4 xid="h43"><![CDATA[步骤三的内容]]></h4>  
                  <a component="$UI/system/components/justep/button/button"
                    class="btn btn-link" label="上一步" xid="button4" onClick="{operation:'tabs1.setActiveTab', args: {xid: 'li3'}}"> 
                    <i xid="i8"/>  
                    <span xid="span10">上一步</span> 
                  </a>  
                  <a component="$UI/system/components/justep/button/button"
                    class="btn btn-link" label="下一步" xid="button3" onClick="{operation:'tabs1.setActiveTab', args: {xid: 'li5'}}"> 
                    <i xid="i7"/>  
                    <span xid="span9">下一步</span> 
                  </a> 
                </div>  
                <div class="x-contents-content" xid="content5"> 
                  <h4 xid="h44"><![CDATA[步骤四的内容]]></h4>  
                  <a component="$UI/system/components/justep/button/button"
                    class="btn btn-link" label="上一步" xid="button6" onClick="{operation:'tabs1.setActiveTab', args: {xid: 'li4'}}"> 
                    <i xid="i10"/>  
                    <span xid="span12">上一步</span> 
                  </a> 
                </div> 
              </div> 
            </div> 
          </div> 
        </div> 
      </fieldset> 
    </div>  
    <div class="form-horizontal container-fluid" component="$UI/system/components/bootstrap/form/form"
      xid="form5"> 
      <fieldset xid="fieldset1" class="fieldset1"> 
        <legend xid="default1">无导航模式</legend>  
        <a component="$UI/system/components/justep/button/button" class="btn btn-link"
          label="点击查看表单" xid="findBtn" onClick="findBtnClick"> 
          <i xid="i1"/>  
          <span xid="span1">点击查看表单</span> 
        </a> 
      </fieldset> 
    </div>  
    <div class="form-horizontal container-fluid" component="$UI/system/components/bootstrap/form/form"
      xid="form4"> 
      <fieldset xid="fieldset5"> 
        <legend xid="default9">软键盘控件</legend>  
        <div component="$UI/system/components/justep/row/row" class="x-row"
          xid="row4"> 
          <div class="x-col" xid="col9"> 
            <label xid="label3" class="pull-right"><![CDATA[数量：]]></label> 
          </div>  
          <div class="x-col" xid="col10"> 
            <input component="$UI/system/components/justep/input/input" class="form-control pull-left"
              xid="num" style="width:200px;" bind-ref="numData.ref('num')" bind-focus="numFocus"/>  
            <div xid="showdiv" class="div" style="display:none;"> 
              <div component="$UI/system/components/justep/button/buttonGroup"
                class="btn-group" tabbed="true" xid="buttonGroup1" style="width:100%;"> 
                <a component="$UI/system/components/justep/button/button"
                  class="btn btn-default" label="1" xid="button9" onClick="showNum"> 
                  <i xid="i28"/>  
                  <span xid="span29">1</span> 
                </a>  
                <a component="$UI/system/components/justep/button/button"
                  class="btn btn-default" label="2" xid="button11" onClick="showNum"> 
                  <i xid="i27"/>  
                  <span xid="span30">2</span> 
                </a>  
                <a component="$UI/system/components/justep/button/button"
                  class="btn btn-default" label="3" xid="button12" onClick="showNum"> 
                  <i xid="i4"/>  
                  <span xid="span4">3</span> 
                </a>  
                <a component="$UI/system/components/justep/button/button"
                  class="btn btn-default" label="关闭" xid="closeBtn" onClick="closeBtnClick"> 
                  <i xid="i26"/>  
                  <span xid="span5">关闭</span> 
                </a> 
              </div>  
              <div component="$UI/system/components/justep/button/buttonGroup"
                class="btn-group" tabbed="true" xid="buttonGroup2" style="width:100%;"> 
                <a component="$UI/system/components/justep/button/button"
                  class="btn btn-default" label="4" xid="button10" onClick="showNum"> 
                  <i xid="i17"/>  
                  <span xid="span25">4</span> 
                </a>  
                <a component="$UI/system/components/justep/button/button"
                  class="btn btn-default" label="5" xid="button7" onClick="showNum"> 
                  <i xid="i23"/>  
                  <span xid="span26">5</span> 
                </a>  
                <a component="$UI/system/components/justep/button/button"
                  class="btn btn-default" label="6" xid="button8" onClick="showNum"> 
                  <i xid="i24"/>  
                  <span xid="span27">6</span> 
                </a>  
                <a component="$UI/system/components/justep/button/button"
                  class="btn btn-default" label="清空" xid="clearBtn" onClick="clearBtnClick"> 
                  <i xid="i25"/>  
                  <span xid="span28">清空</span> 
                </a> 
              </div>  
              <div component="$UI/system/components/justep/button/buttonGroup"
                class="btn-group" tabbed="true" xid="buttonGroup3" style="width:100%;"> 
                <a component="$UI/system/components/justep/button/button"
                  class="btn btn-default" label="7" xid="button9" onClick="showNum"> 
                  <i xid="i22"/>  
                  <span xid="span20">7</span> 
                </a>  
                <a component="$UI/system/components/justep/button/button"
                  class="btn btn-default" label="8" xid="button11" onClick="showNum"> 
                  <i xid="i21"/>  
                  <span xid="span24">8</span> 
                </a>  
                <a component="$UI/system/components/justep/button/button"
                  class="btn btn-default" label="9" xid="button12" onClick="showNum"> 
                  <i xid="i20"/>  
                  <span xid="span22">9</span> 
                </a>  
                <a component="$UI/system/components/justep/button/button"
                  class="btn btn-default" label="回删" xid="deleBtn" onClick="deleBtnClick"> 
                  <i xid="i19"/>  
                  <span xid="span21">回删</span> 
                </a> 
              </div>  
              <a component="$UI/system/components/justep/button/button" class="btn btn-default btns"
                label="0" xid="button14" onClick="showNum"> 
                <i xid="i18"/>  
                <span xid="span23">0</span> 
              </a> 
            </div> 
          </div> 
        </div> 
      </fieldset> 
    </div>  
    <div class="form-horizontal container-fluid" component="$UI/system/components/bootstrap/form/form"
      xid="form1"> 
      <fieldset xid="fieldset2"> 
        <legend xid="default3">为元素动态添加并触发验证</legend>  
        <div component="$UI/system/components/justep/row/row" class="x-row"
          xid="row1"> 
          <div class="x-col" xid="col1"> 
            <label xid="label1" class="pull-right" bind-text="uData.label('name')">label</label> 
          </div>  
          <div class="x-col" xid="col2"> 
            <input component="$UI/system/components/justep/input/input" class="form-control"
              xid="nameInput" bind-ref="uData.ref('name')"/> 
          </div> 
        </div>  
        <div component="$UI/system/components/justep/row/row" class="x-row"
          xid="row6"> 
          <div class="x-col" xid="col6"> 
            <label xid="label6" class="pull-right" bind-text="uData.label('check')">label</label> 
          </div>  
          <div class="x-col" xid="col13"> 
            <span component="$UI/system/components/justep/button/checkbox" class="x-checkbox"
              xid="checkbox" onChange="checkboxChange"/> 
          </div> 
        </div>  
        <div component="$UI/system/components/justep/row/row" class="x-row"
          xid="row7"> 
          <div class="x-col" xid="col15"> 
            <label xid="label7" class="pull-right" bind-text="uData.label('email')">label</label> 
          </div>  
          <div class="x-col" xid="col16"> 
            <span xid="email" class="pull-right" style="width:38%;"/>  
            <input component="$UI/system/components/justep/input/input" class="form-control"
              xid="input2" bind-ref="uData.ref('email')"/> 
          </div> 
        </div>  
        <div component="$UI/system/components/justep/row/row" class="x-row"
          xid="row8"> 
          <div class="x-col" xid="col18"> 
            <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-only-label pull-right"
              label="提交" xid="subBtn" onClick="subBtnClick"> 
              <i xid="i9"/>  
              <span xid="span11">提交</span> 
            </a> 
          </div>  
          <div class="x-col" xid="col19"> 
            <a component="$UI/system/components/justep/button/button" class="btn btn-link"
              label="重置" xid="regBtn" onClick="regBtnClick"> 
              <i xid="i11"/>  
              <span xid="span13">重置</span> 
            </a> 
          </div> 
        </div> 
      </fieldset> 
    </div>  
    <div class="form-horizontal container-fluid" component="$UI/system/components/bootstrap/form/form"
      xid="form3"> 
      <fieldset xid="fieldset4"> 
        <legend xid="default8">不允许输入admin,不允许为空</legend>  
        <div component="$UI/system/components/justep/row/row" class="x-row"
          xid="row9"> 
          <div class="x-col" xid="col17"> 
            <label xid="label8" class="pull-right"><![CDATA[用户名：]]></label> 
          </div>  
          <div class="x-col" xid="col3"> 
            <span xid="span14" class="pull-right" style="width:38%;"/>  
            <input component="$UI/system/components/justep/input/input" class="form-control"
              xid="username"/> 
          </div> 
        </div>  
        <div component="$UI/system/components/justep/row/row" class="x-row"
          xid="row11"> 
          <div class="x-col" xid="col14"> 
            <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-only-label pull-right"
              label="提交" onClick="submClick" xid="subm"> 
              <i xid="i14"/>  
              <span xid="span18">提交</span> 
            </a> 
          </div>  
          <div class="x-col" xid="col20"> 
            <a component="$UI/system/components/justep/button/button" class="btn btn-link"
              label="重置" xid="regest" onClick="regestClick"> 
              <i xid="i15"/>  
              <span xid="span17">重置</span> 
            </a> 
          </div> 
        </div> 
      </fieldset> 
    </div>  
    <div class="form-horizontal container-fluid" component="$UI/system/components/bootstrap/form/form"
      xid="form6"> 
      <fieldset xid="fieldset3"> 
        <legend xid="default7">不允许输入小于50的数</legend>  
        <div component="$UI/system/components/justep/row/row" class="x-row"
          xid="row12"> 
          <div class="x-col" xid="col28"> 
            <label xid="label9" class="pull-right"><![CDATA[金额：]]></label> 
          </div>  
          <div class="x-col" xid="col27"> 
            <span xid="monspan" class="pull-right" style="width:38%;"/>  
            <input component="$UI/system/components/justep/input/input" class="form-control"
              xid="money"/> 
          </div> 
        </div>  
        <div component="$UI/system/components/justep/row/row" class="x-row"
          xid="row10"> 
          <div class="x-col" xid="col26"> 
            <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-only-label pull-right"
              label="提交" onClick="subButtClick" xid="subButt"> 
              <i xid="i12"/>  
              <span xid="span15">提交</span> 
            </a> 
          </div>  
          <div class="x-col" xid="col24"> 
            <a component="$UI/system/components/justep/button/button" class="btn btn-link"
              label="重置" xid="reg" onClick="regClick"> 
              <i xid="i13"/>  
              <span xid="span16">重置</span> 
            </a> 
          </div> 
        </div> 
      </fieldset> 
    </div> 
  </div> 
</div>
