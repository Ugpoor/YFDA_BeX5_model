<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window" component="$UI/system/components/justep/window/window"
  design="device:pc">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:182px;top:3px;"> 
    <div component="$UI/system/components/justep/data/data" autoLoad="true"
      xid="userData" idColumn="uName"> 
      <column label="用户名:" name="uName" type="String" xid="xid1"/>  
      <column label="姓名：" name="name" type="String" xid="xid2"/>  
      <column label="密码：" name="pass" type="String" xid="xid3"/>  
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
      <column label="文本域：" name="desc" type="String" xid="xid15"/>  
      <data xid="default2">[{"uName":"","name":"","desc":""}]</data> 
    </div>  
    <div component="$UI/system/components/justep/data/data" autoLoad="true"
      xid="hobbyData" idColumn="hobby"> 
      <column label="爱好" name="hobby" type="String" xid="xid29"/>  
      <data xid="default4">[{"hobby":"打羽毛球"},{"hobby":"打篮球"},{"hobby":"游泳"},{"hobby":"轮滑"}]</data> 
    </div>  
    <div component="$UI/system/components/justep/data/data" autoLoad="true"
      xid="sexData" idColumn="sex"> 
      <column label="性别" name="sex" type="String" xid="xid30"/>  
      <data xid="default5">[{"sex":"男"},{"sex":"女"}]</data> 
    </div> 
  </div>  
  <div component="$UI/system/components/justep/popOver/popOver" class="x-popOver"
    xid="popOver" dismissible="false"> 
    <div class="x-popOver-overlay" xid="div2"/>  
    <div class="x-popOver-content" xid="div3"> 
      <a component="$UI/system/components/justep/button/button" class="btn btn-link"
        label="提交成功" xid="button2" style="background-color:white;"> 
        <i xid="i1"/>  
        <span xid="span2">提交成功</span> 
      </a> 
    </div> 
  </div>  
  <div component="$UI/system/components/justep/controlGroup/controlGroup" class="x-control-group"
    title="异步提交" xid="controlGroup"> 
    <div class="x-control-group-title" xid="controlGroupTitle1"> 
      <span xid="span1"><![CDATA[异步提交]]></span> 
    </div>  
    <a component="$UI/system/components/justep/button/button" class="btn btn-link"
      label="js" xid="showJs" onClick="showJsSource"> 
      <i xid="i5"/>  
      <span xid="span5">js</span>
    </a>
    <a component="$UI/system/components/justep/button/button" class="btn btn-link"
      label="源码" xid="sourceBtn" onClick="sourceBtnClick"> 
      <i xid="i4"/>  
      <span xid="span4">源码</span>
    </a>
    <div class="form-horizontal container-fluid" component="$UI/system/components/bootstrap/form/form"
      xid="form2" style="width:auto;"> 
      <fieldset xid="fieldset1" class="css1"> 
        <legend xid="default11">基本使用</legend>  
        <div component="$UI/system/components/justep/row/row" class="x-row x-row-center"
          xid="row9"/>  
        <div component="$UI/system/components/justep/row/row" class="x-row"
          xid="row6"> 
          <div class="x-col x-col-20" xid="col32"> 
            <label xid="label15" class="pull-right" bind-text="userData.label('uName')">label</label> 
          </div>  
          <div class="x-col" xid="col34"> 
            <input component="$UI/system/components/justep/input/input" class="form-control"
              xid="input1" bind-ref="userData.ref('uName')"/> 
          </div>  
          <div class="x-col x-col-20" xid="col29"> 
            <label xid="label3" bind-text="userData.label('name')" class="pull-right">label</label> 
          </div>  
          <div class="x-col" xid="col28"> 
            <input component="$UI/system/components/justep/input/input" class="form-control"
              xid="input2" bind-ref="userData.ref('name')"/> 
          </div> 
        </div>  
        <div component="$UI/system/components/justep/row/row" class="x-row"
          xid="row10"> 
          <div class="x-col x-col-20" xid="col22"> 
            <label xid="label12" class="pull-right" bind-text="userData.label('pass')">label</label> 
          </div>  
          <div class="x-col" xid="col21"> 
            <input component="$UI/system/components/justep/input/input" class="form-control"
              xid="input3" bind-ref="userData.ref('pass')"/> 
          </div>  
          <div class="x-col x-col-20" xid="col23"> 
            <label xid="label11" bind-text="userData.label('truePwd')" class="pull-right">label</label> 
          </div>  
          <div class="x-col" xid="col19"> 
            <input component="$UI/system/components/justep/input/input" class="form-control"
              xid="input4" bind-ref="userData.ref('truePwd')"/> 
          </div> 
        </div>  
        <div component="$UI/system/components/justep/row/row" class="x-row"
          xid="row7"> 
          <div class="x-col x-col-20" xid="col26"> 
            <label xid="label10" class="pull-right" bind-text="userData.label('Hobby')">label</label> 
          </div>  
          <div class="x-col" xid="col25"> 
            <span component="$UI/system/components/justep/select/checkboxGroup"
              class="x-checkbox-group" xid="checkboxGroup1" bind-itemset="hobbyData"
              bind-itemsetValue="ref('hobby')" bind-itemsetLabel="ref('hobby')" bind-ref="userData.ref('Hobby')"/> 
          </div>  
          <div class="x-col x-col-20" xid="col27"> 
            <label xid="label3" bind-text="userData.label('sex')" class="pull-right">label</label> 
          </div>  
          <div class="x-col" xid="col20"> 
            <span component="$UI/system/components/justep/select/radioGroup"
              class="x-radio-group" xid="radioGroup1" bind-itemsetValue="ref('sex')"
              bind-itemsetLabel="ref('sex')" bind-itemset="sexData" bind-ref="userData.ref('sex')"/> 
          </div> 
        </div>  
        <div component="$UI/system/components/justep/row/row" class="x-row"
          xid="row8"> 
          <div class="x-col x-col-20" xid="col20"> 
            <label xid="label14" class="pull-right" bind-text="userData.label('age')">label</label> 
          </div>  
          <div class="x-col" xid="col21"> 
            <input component="$UI/system/components/justep/input/input" class="form-control"
              xid="input5" bind-ref="userData.ref('age')"/> 
          </div>  
          <div class="x-col x-col-20" xid="col19"> 
            <label xid="label13" bind-text="userData.label('email')" class="pull-right">label</label> 
          </div>  
          <div class="x-col" xid="col24"> 
            <input component="$UI/system/components/justep/input/input" class="form-control"
              xid="input6" bind-ref="userData.ref('email')"/> 
          </div> 
        </div>  
        <div component="$UI/system/components/justep/row/row" class="x-row"
          xid="row6"> 
          <div class="x-col x-col-20" xid="col24"> 
            <label xid="label10" class="pull-right" bind-text="userData.label('tel')">label</label> 
          </div>  
          <div class="x-col" xid="col25"> 
            <input component="$UI/system/components/justep/input/input" class="form-control"
              xid="input7" bind-ref="userData.ref('tel')"/> 
          </div>  
          <div class="x-col x-col-20" xid="col23"> 
            <label xid="label11" bind-text="userData.label('postcode')" class="pull-right">label</label> 
          </div>  
          <div class="x-col" xid="col22"> 
            <input component="$UI/system/components/justep/input/input" class="form-control"
              xid="input8" bind-ref="userData.ref('postcode')"/> 
          </div> 
        </div>  
        <div component="$UI/system/components/justep/row/row" class="x-row"
          xid="row7"> 
          <div class="x-col x-col-20" xid="col28"> 
            <label xid="label12" class="pull-right" bind-text="userData.label('QQ')">label</label> 
          </div>  
          <div class="x-col" xid="col29"> 
            <input component="$UI/system/components/justep/input/input" class="form-control"
              xid="input9" bind-ref="userData.ref('QQ')"/> 
          </div>  
          <div class="x-col x-col-20" xid="col27"> 
            <label xid="label13" bind-text="userData.label('address')" class="pull-right">label</label> 
          </div>  
          <div class="x-col" xid="col26"> 
            <input component="$UI/system/components/justep/input/input" class="form-control"
              xid="input10" bind-ref="userData.ref('address')"/> 
          </div> 
        </div>  
        <div component="$UI/system/components/justep/row/row" class="x-row"
          xid="row8"> 
          <div class="x-col x-col-20" xid="col32"> 
            <label xid="label14" class="pull-right" bind-text="userData.label('col12')">label</label> 
          </div>  
          <div class="x-col" xid="col33"> 
            <input component="$UI/system/components/justep/input/input" class="form-control"
              xid="input11" bind-ref="userData.ref('col12')"/> 
          </div>  
          <div class="x-col x-col-20" xid="col31"> 
            <label xid="label15" bind-text="userData.label('col13')" class="pull-right">label</label> 
          </div>  
          <div class="x-col" xid="col30"> 
            <input component="$UI/system/components/justep/input/input" class="form-control"
              xid="input12" bind-ref="userData.ref('col13')"/> 
          </div> 
        </div>  
        <div component="$UI/system/components/justep/row/row" class="x-row"
          xid="row16"> 
          <div class="x-col x-col-20" xid="col59"> 
            <label xid="label28" class="pull-right" bind-text="userData.label('desc')">label</label> 
          </div>  
          <div class="x-col" xid="col58"> 
            <textarea component="$UI/system/components/justep/textarea/textarea"
              class="form-control" xid="textarea2" bind-ref="userData.ref('desc')"/> 
          </div> 
        </div>  
        <div component="$UI/system/components/justep/row/row" class="x-row"
          xid="row17"> 
          <div class="x-col" xid="col60"> 
            <a component="$UI/system/components/justep/button/button" class="btn btn-link pull-right"
              label="提交" xid="submitBtn" onClick="submitBtnClick"> 
              <i xid="i3"/>  
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
      </fieldset> 
    </div> 
  </div> 
</div>
