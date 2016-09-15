<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window" component="$UI/system/components/justep/window/window"
  design="device:pc">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:325px;top:73px;"> 
    <div component="$UI/system/components/justep/data/data" autoLoad="true"
      xid="userData" idColumn="uName" confirmRefresh="false" onValueChange="dataValueChange"
      autoNew="false" onCustomSave="userDataCustomSave"> 
      <column label="用户名:" name="uName" type="String" xid="xid1"/>  
      <column label="姓名：" name="name" type="String" xid="xid2"/>  
      <column label="密码;" name="pass" type="String" xid="xid3"/>  
      <column label="确认密码：" name="truePwd" type="String" xid="xid4"/>  
      <column label="爱好：" name="Hobby" type="String" xid="xid5"/>  
      <column label="性别：" name="sex" type="String" xid="xid6"/>  
      <column label="年龄：" name="age" type="String" xid="xid7"/>  
      <column label="电子邮件：" name="email" type="String" xid="xid8"/>  
      <column label="手机号码：" name="tel" type="String" xid="xid9"/>  
      <column label="邮政编码:" name="postcode" type="String" xid="xid10"/>  
      <column label="QQ：" name="QQ" type="String" xid="xid11"/>  
      <column label="IP地址：" name="address" type="String" xid="xid12"/>  
      <column label="正负小数：" name="col12" type="String" xid="xid13"/>  
      <column label="正负整数与小数:" name="col13" type="String" xid="xid14"/>  
      <column label="单选下拉框：" name="radioSelect" type="String" xid="xid15"/>  
      <column label="提示下拉框：" name="hintSelect" type="String" xid="xid16"/>  
      <column label="数字进步器：" name="num" type="Integer" xid="xid19"/>  
      <column label="自动提示框：" name="col20" type="String" xid="xid27"/>  
      <column label="日期控件：" name="date" type="Date" xid="xid22"/>  
      <column label="双向选择器：" name="select" type="String" xid="xid17"/>  
      <column label="文本域：" name="desc" type="String" xid="xid26"/>  
      <rule xid="rule1"> 
        <col name="uName" xid="ruleCol1"> 
          <required xid="required1"> 
            <expr xid="default9">true</expr>  
            <message xid="default11">用户名不能为空</message>
          </required>  
          <constraint xid="constraint1"> 
            <expr xid="default10">/^\w{5,15}$/.test( $model.userData.val("uName"))</expr>  
            <message xid="default12">用户名格式不正确</message>
          </constraint> 
        </col>  
        <col name="name" xid="ruleCol2"> 
          <required xid="required2"> 
            <expr xid="default13">true</expr>  
            <message xid="default14">姓名不能为空</message>
          </required> 
        </col>  
        <col name="pass" xid="ruleCol3"> 
          <required xid="required3"> 
            <message xid="default15">密码不能为空</message>  
            <expr xid="default23">true</expr>
          </required> 
        </col>  
        <col name="truePwd" xid="ruleCol4"> 
          <required xid="required4"> 
            <message xid="default16">确认密码不能为空</message>  
            <expr xid="default24">true</expr>
          </required> 
        </col>  
        <col name="Hobby" xid="ruleCol5"> 
          <required xid="required5"> 
            <message xid="default17">爱好不能为空</message>  
            <expr xid="default25">true</expr>
          </required> 
        </col>  
        <col name="sex" xid="ruleCol6"> 
          <required xid="required6"> 
            <message xid="default18">性别不能为空</message>  
            <expr xid="default26">true</expr>
          </required> 
        </col>  
        <col name="age" xid="ruleCol7"> 
          <required xid="required7"> 
            <message xid="default19">年龄不能为空</message>  
            <expr xid="default27">true</expr>
          </required> 
        </col>  
        <col name="email" xid="ruleCol8"> 
          <required xid="required8"> 
            <message xid="default20">邮箱不能为空</message>  
            <expr xid="default28">true</expr>
          </required> 
        </col>  
        <col name="tel" xid="ruleCol9"> 
          <required xid="required9"> 
            <message xid="default21">用户名不能为空</message>
          </required> 
        </col>  
        <col name="postcode" xid="ruleCol10"> 
          <required xid="required10"> 
            <message xid="default22">用户名不能为空</message>
          </required> 
        </col> 
      </rule>  
      <data xid="default2">[{"uName":"","radioSelect":"","hintSelect":"","num":1}]</data>
    </div>
    <div component="$UI/system/components/justep/data/data" autoLoad="true"
      xid="empData" idColumn="emp" confirmDelete="false" confirmRefresh="false"> 
      <column label="员工" name="emp" type="String" xid="xid21"/>  
      <data xid="default3">[{"emp":"员工1"},{"emp":"员工2"},{"emp":"员工3"},{"emp":"员工4"}]</data> 
    </div>  
    <div component="$UI/system/components/justep/data/data" autoLoad="true"
      xid="addEmp" idColumn="emp" confirmDelete="false" confirmRefresh="false"> 
      <column label="员工" name="emp" type="String" xid="xid28"/> 
    </div>  
    <div component="$UI/system/components/justep/data/data" autoLoad="true"
      xid="hobbyData" idColumn="hobby"> 
      <column label="爱好" name="hobby" type="String" xid="xid29"/>  
      <data xid="default4">[{"hobby":"打羽毛球"},{"hobby":"打篮球"}]</data>
    </div>  
    <div component="$UI/system/components/justep/data/data" autoLoad="true"
      xid="sexData" idColumn="sex"> 
      <column label="性别" name="sex" type="String" xid="xid30"/>  
      <data xid="default5">[{"sex":"男"},{"sex":"女"}]</data> 
    </div>  
    <div component="$UI/system/components/justep/data/data" autoLoad="true"
      xid="selectData" idColumn="address"> 
      <column label="地址" name="address" type="String" xid="xid31"/>  
      <data xid="default6">[{"address":"北京"},{"address":"天津"},{"address":"上海"},{"address":"河南"},{"address":"河北"}]</data> 
    </div>
    <div component="$UI/system/components/justep/data/data" autoLoad="true"
      xid="hintData" idColumn="address"> 
      <column label="地址" name="address" type="String" xid="default8"/>  
      <data xid="default7">[{"address":"北京"},{"address":"天津"},{"address":"上海"},{"address":"河南"},{"address":"河北"}]</data> 
    </div> 
  </div>  
  <div component="$UI/system/components/justep/popMenu/popMenu" class="x-popMenu"
    xid="popMenu" opacity="0.1" direction="left-bottom" dismissible="false" anchor="hintInput"> 
    <div class="x-popMenu-overlay" xid="div5"/>  
    <ul component="$UI/system/components/justep/menu/menu" class="x-menu dropdown-menu x-popMenu-content"
      xid="menu1"> 
      <div component="$UI/system/components/justep/list/list" class="x-list"
        xid="list1" data="hintData"> 
        <ul class="x-list-template" xid="listTemplateUl1"> 
          <li xid="li1"> 
            <div style="cursor: pointer;" component="$UI/system/components/justep/output/output"
              class="x-output" xid="output" bind-ref="ref('address')" bind-click="outputClick"/> 
          </li> 
        </ul> 
      </div> 
    </ul> 
  </div>  
  <div component="$UI/system/components/justep/controlGroup/controlGroup" class="x-control-group"
    title="表单验证" xid="controlGroup"> 
    <div class="x-control-group-title" xid="controlGroupTitle1"> 
      <span xid="span3">表单验证</span>
    </div>  
    <a component="$UI/system/components/justep/button/button" class="btn btn-link"
      label="js" xid="showJs" onClick="showJsSource"> 
      <i xid="i6"/>  
      <span xid="span4">js</span>
    </a>
    <a component="$UI/system/components/justep/button/button" class="btn btn-link"
      label="源码" xid="sourceBtn" onClick="sourceBtnClick"> 
      <i xid="i5"/>  
      <span xid="span4">源码</span>
    </a>
    <div class="form-horizontal container-fluid" component="$UI/system/components/bootstrap/form/form"
      xid="form1" style="width:auto;"> 
      <div component="$UI/system/components/justep/row/row" class="x-row" xid="row1"> 
        <div class="x-col x-col-20" xid="col1"> 
          <label xid="label2" class="pull-right" bind-text="userData.label('uName')">label</label>
        </div>  
        <div class="x-col" xid="col2"> 
          <span xid="uSpan" class="spans">*</span>  
          <input component="$UI/system/components/justep/input/input" placeholder="请输入用户名"
            class="form-control" xid="uName" bind-ref="userData.ref('uName')" bind-keyup="uNameKeyup"/>
        </div>  
        <div class="x-col x-col-20" xid="col4"> 
          <label xid="label3" bind-text="userData.label('name')" class="pull-right">label</label>
        </div>  
        <div class="x-col" xid="col5"> 
          <span xid="nameSpan" class="spans">*</span>  
          <input component="$UI/system/components/justep/input/input" placeholder="请输入汉字"
            class="form-control" xid="name" bind-keyup="nameKeyup" bind-ref="userData.ref('name')"/>
        </div> 
      </div>  
      <div component="$UI/system/components/justep/row/row" class="x-row" xid="row3"> 
        <div class="x-col x-col-20" xid="col12"> 
          <label xid="label4" class="pull-right" bind-text="userData.label('pass')">label</label>
        </div>  
        <div class="x-col" xid="col13"> 
          <span xid="pspan" class="spans">*</span>  
          <input component="$UI/system/components/justep/input/input" placeholder="请输入密码"
            class="form-control" type="password" xid="pass" bind-keyup="passKeyup"
            bind-ref="userData.ref('pass')"/>
        </div>  
        <div class="x-col x-col-20" xid="col11"> 
          <label xid="label5" bind-text="userData.label('truePwd')" class="pull-right">label</label>
        </div>  
        <div class="x-col" xid="col10"> 
          <span xid="repspan" class="spans">*</span>  
          <input component="$UI/system/components/justep/input/input" placeholder="再次输入密码"
            class="form-control" type="password" xid="repass" bind-keyup="repassKeyup"
            bind-ref="userData.ref('truePwd')"/>
        </div> 
      </div>  
      <div component="$UI/system/components/justep/row/row" class="x-row" xid="row4"> 
        <div class="x-col x-col-20" xid="col16"> 
          <label xid="label6" class="pull-right" bind-text="userData.label('Hobby')">label</label>
        </div>  
        <div class="x-col" xid="col17"> 
          <span component="$UI/system/components/justep/select/checkboxGroup"
            class="x-checkbox-group" xid="checkboxGroup" bind-itemset="hobbyData"
            bind-itemsetValue="ref('hobby')" bind-itemsetLabel="ref('hobby')" bind-ref="userData.ref('Hobby')"/>  
          <span xid="hobbyspan" style="color:red;">*</span>
        </div>  
        <div class="x-col x-col-20" xid="col15"> 
          <label xid="label7" bind-text="userData.label('sex')" class="pull-right">label</label>
        </div>  
        <div class="x-col" xid="col14" bind-select="col14Select"> 
          <span component="$UI/system/components/justep/select/radioGroup" class="x-radio-group"
            xid="radioGroup" bind-itemsetValue="ref('sex')" bind-itemsetLabel="ref('sex')"
            bind-itemset="sexData" bind-ref="userData.ref('sex')" onChange="radioGroupChange"/>  
          <span xid="sexspan" style="color:red;">*</span>
        </div> 
      </div>  
      <div component="$UI/system/components/justep/row/row" class="x-row" xid="row5"> 
        <div class="x-col x-col-20" xid="col20"> 
          <label xid="label8" class="pull-right" bind-text="userData.label('age')">label</label>
        </div>  
        <div class="x-col" xid="col21"> 
          <span xid="agespan" class="spans">*</span>  
          <input component="$UI/system/components/justep/input/input" placeholder="请输入年龄0-200"
            class="form-control" xid="age" bind-keyup="ageKeyup" bind-ref="userData.ref('age')"/>
        </div>  
        <div class="x-col x-col-20" xid="col19"> 
          <label xid="label9" bind-text="userData.label('email')" class="pull-right">label</label>
        </div>  
        <div class="x-col" xid="col18"> 
          <span xid="emspan" class="spans">*</span>  
          <input component="$UI/system/components/justep/input/input" placeholder="请输入正确的邮箱"
            class="form-control" xid="email" bind-keyup="emailKeyup" bind-ref="userData.ref('email')"/>
        </div> 
      </div>  
      <div component="$UI/system/components/justep/row/row" class="x-row" xid="row6"> 
        <div class="x-col x-col-20" xid="col24"> 
          <label xid="label10" class="pull-right" bind-text="userData.label('tel')">label</label>
        </div>  
        <div class="x-col" xid="col25"> 
          <span xid="telspan" class="spans">*</span>  
          <input component="$UI/system/components/justep/input/input" placeholder="请输入正确的手机号码"
            class="form-control" xid="tel" bind-keyup="telKeyup" bind-ref="userData.ref('tel')"/>
        </div>  
        <div class="x-col x-col-20" xid="col23"> 
          <label xid="label11" bind-text="userData.label('postcode')" class="pull-right">label</label>
        </div>  
        <div class="x-col" xid="col22"> 
          <span xid="pcspan" class="spans">*</span>  
          <input component="$UI/system/components/justep/input/input" placeholder="请输入正确的邮政编码"
            class="form-control" xid="pastcode" bind-keyup="pastcodeKeyup" bind-ref="userData.ref('postcode')"/>
        </div> 
      </div>  
      <div component="$UI/system/components/justep/row/row" class="x-row" xid="row7"> 
        <div class="x-col x-col-20" xid="col28"> 
          <label xid="label12" class="pull-right" placeholder="请输入正确的邮箱" bind-text="userData.label('QQ')">label</label>
        </div>  
        <div class="x-col" xid="col29"> 
          <span xid="QQspan" class="spans">*</span>  
          <input component="$UI/system/components/justep/input/input" placeholder="请输入QQ号"
            class="form-control" xid="QQ" bind-keyup="QQKeyup" bind-ref="userData.ref('QQ')"/>
        </div>  
        <div class="x-col x-col-20" xid="col27"> 
          <label xid="label13" bind-text="userData.label('address')" class="pull-right">label</label>
        </div>  
        <div class="x-col" xid="col26"> 
          <span xid="IPspan" class="spans">*</span>  
          <input component="$UI/system/components/justep/input/input" placeholder="请输入正确的IP地址"
            class="form-control" xid="IP" bind-keyup="IPKeyup" bind-ref="userData.ref('address')"/>
        </div> 
      </div>  
      <div component="$UI/system/components/justep/row/row" class="x-row" xid="row8"> 
        <div class="x-col x-col-20" xid="col32"> 
          <label xid="label14" class="pull-right" bind-text="userData.label('col12')">label</label>
        </div>  
        <div class="x-col" xid="col33"> 
          <span xid="decispan" class="spans">*</span>  
          <input component="$UI/system/components/justep/input/input" placeholder="请输入正负小数"
            class="form-control" xid="deci" bind-ref="userData.ref('col12')" bind-keyup="deciKeyup"/>
        </div>  
        <div class="x-col x-col-20" xid="col31"> 
          <label xid="label15" bind-text="userData.label('col13')" class="pull-right">label</label>
        </div>  
        <div class="x-col" xid="col30"> 
          <span xid="integspan" class="spans">*</span>  
          <input component="$UI/system/components/justep/input/input" placeholder="请输入正负整数或小数"
            class="form-control" xid="integ" bind-ref="userData.ref('col13')" bind-keyup="integKeyup"/>
        </div> 
      </div>  
      <div component="$UI/system/components/justep/row/row" class="x-row" xid="row9"> 
        <div class="x-col x-col-20" xid="col36"> 
          <label xid="label16" class="pull-right" bind-text="userData.label('radioSelect')">label</label>
        </div>  
        <div class="x-col" xid="col37"> 
          <span xid="xiaspan" class="spans">*</span>  
          <select component="$UI/system/components/justep/select/select" class="form-control"
            xid="radioSelect" bind-ref="userData.ref('radioSelect')" bind-options="selectData"
            bind-optionsValue="address" bind-optionsLabel="address" onChange="radioSelectChange"
            style="width:50%;"/>
        </div>  
        <div class="x-col x-col-20" xid="col35"> 
          <label xid="label17" bind-text="userData.label('hintSelect')" class="pull-right">label</label>
        </div>  
        <div class="x-col" xid="col34"> 
          <span xid="hspan" class="spans">*</span>  
          <input component="$UI/system/components/justep/input/input" class="form-control"
            xid="hintInput" bind-ref="userData.ref('hintSelect')" bind-focus="hintInputFocus"/>
        </div> 
      </div>  
      <div component="$UI/system/components/justep/row/row" class="x-row" xid="row11"> 
        <div class="x-col x-col-20" xid="col44"> 
          <label xid="label20" class="pull-right" bind-text="userData.label('num')">label</label>
        </div>  
        <div class="x-col" xid="col45"> 
          <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-only-icon"
            label="button" xid="subBtn" icon="icon-ios7-minus-empty" onClick="subBtnClick"
            style="float: left;width:10%;"> 
            <i xid="i1" class="icon-ios7-minus-empty"/>  
            <span xid="span1"/>
          </a>  
          <input component="$UI/system/components/justep/input/input" class="form-control"
            xid="input15" bind-ref="userData.ref('num')" style="float: left;width:11%;"/>  
          <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-only-icon"
            label="button" xid="addNumBtN" icon="icon-android-add" onClick="addNumBtNClick"> 
            <i xid="i4" class="icon-android-add"/>  
            <span xid="span2"/>
          </a> 
        </div>  
        <div class="x-col x-col-20" xid="col47"> 
          <label xid="label23" bind-text="userData.label('date')" class="pull-right">label</label>
        </div>  
        <div class="x-col" xid="col46"> 
          <span xid="datespan" class="spans">*</span>  
          <input component="$UI/system/components/justep/input/input" class="form-control"
            xid="date" dataType="Date" format="yyyy-MM-dd" bind-ref="userData.ref('date')"
            onChange="dateChange"/>
        </div> 
      </div>  
      <div component="$UI/system/components/justep/row/row" class="x-row" xid="row14"
        style="height:300px;"> 
        <div class="x-col x-col-20" xid="col55"> 
          <label xid="label26" class="pull-right" bind-text="userData.label('select')">label</label>
        </div>  
        <div class="x-col" xid="col54" style="height:100%;"> 
          <div component="$UI/system/components/justep/row/row" class="x-row"
            xid="row18" style="height:100%;"> 
            <div class="x-col x-col-20 x-col-40" xid="col3" style="height:100%;"> 
              <div xid="div1"> 
                <div component="$UI/system/components/justep/dataTables/dataTables"
                  flexibleWidth="true" rowActiveClass="active" class="table table-hover table-striped"
                  xid="searchGrid" data="empData" onRowDblClick="searchGridRowDblClick"
                  ordering="false" multiSelect="false" style="cursor:pointer;"> 
                  <columns xid="columns2"> 
                    <column name="emp" xid="column1"/>
                  </columns> 
                </div> 
              </div> 
            </div>  
            <div class="x-col x-col-10" xid="col6"> 
              <div component="$UI/system/components/justep/button/buttonGroup"
                class="btn-group btn-group-vertical" style="margin-top:80px;" tabbed="全选"
                xid="buttonGroup1"> 
                <a component="$UI/system/components/justep/button/button"
                  class="btn btn-link" label="全选" xid="addAllBtn" onClick="addAllBtnClick"> 
                  <i xid="i8"/>  
                  <span xid="span30">全选</span>
                </a>  
                <a component="$UI/system/components/justep/button/button"
                  class="btn btn-link" label="清空" xid="removeAllBtn" onClick="removeAllBtnClick"> 
                  <i xid="i11"/>  
                  <span xid="span33">清空</span>
                </a> 
              </div> 
            </div>  
            <div class="x-col x-col-20" xid="col7"> 
              <div xid="div4"> 
                <div component="$UI/system/components/justep/dataTables/dataTables"
                  flexibleWidth="true" rowActiveClass="active" class="table table-hover table-striped"
                  xid="selectGrid" data="addEmp" multiSelect="false" onRowDblClick="selectGridRowDblClick"
                  style="cursor:pointer;"> 
                  <columns xid="columns3"> 
                    <column name="emp" xid="column2"/>
                  </columns> 
                </div> 
              </div> 
            </div> 
          </div> 
        </div> 
      </div>  
      <div component="$UI/system/components/justep/row/row" class="x-row" xid="row16"> 
        <div class="x-col x-col-20" xid="col59"> 
          <label xid="label28" class="pull-right" bind-text="userData.label('desc')">label</label>
        </div>  
        <div class="x-col" xid="col58"> 
          <textarea component="$UI/system/components/justep/textarea/textarea" class="form-control"
            xid="textarea1" style="height:100px;" bind-ref="userData.ref('desc')"/>
        </div> 
      </div>  
      <div component="$UI/system/components/justep/row/row" class="x-row" xid="row17"> 
        <div class="x-col" xid="col60"> 
          <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-only-label pull-right"
            label="提交" xid="submitBtn" onClick="{operation:'userData.save'}"> 
            <i xid="i2"/>  
            <span xid="span26">提交</span>
          </a> 
        </div>  
        <div class="x-col" xid="col61"> 
          <a component="$UI/system/components/justep/button/button" class="btn btn-link"
            label="重置" xid="regestBtn" onClick="regestBtnClick"> 
            <i xid="i3"/>  
            <span xid="span27">重置</span>
          </a> 
        </div> 
      </div>
    </div> 
  </div>
</div>
