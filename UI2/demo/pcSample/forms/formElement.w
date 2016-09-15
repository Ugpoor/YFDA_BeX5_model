<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window" component="$UI/system/components/justep/window/window"
  design="device:pc">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:344px;top:13px;"> 
    <div component="$UI/system/components/justep/data/data" autoLoad="true"
      xid="userData" idColumn="name"> 
      <column label="用户名：" name="name" type="String" xid="xid1"/>  
      <column label="密码：" name="pass" type="String" xid="xid2"/>  
      <column label="用户名：" name="col3" type="String" xid="xid3"/>  
      <data xid="default1">[{}]</data>  
      <column label="密码：" name="col4" type="String" xid="xid4"/>  
      <column label="用户名：" name="col5" type="String" xid="xid5"/>  
      <column label="密码：" name="col6" type="String" xid="xid6"/>  
      <column label="用户名：" name="col7" type="String" xid="xid7"/>  
      <column label="密码：" name="col8" type="String" xid="xid8"/>  
      <column label="用户名：" name="col9" type="String" xid="xid9"/>  
      <column label="密码：" name="col10" type="String" xid="xid10"/>  
      <column label="用户名：" name="col11" type="String" xid="xid11"/>  
      <column label="密码：" name="col12" type="String" xid="xid12"/>  
      <column label="用户名：" name="col13" type="String" xid="xid13"/>  
      <column label="密码：" name="col14" type="String" xid="xid14"/>  
      <column label="用户名：" name="col15" type="String" xid="xid15"/>  
      <column label="密码：" name="col16" type="String" xid="xid16"/>  
      <column label="用户名：" name="col17" type="String" xid="xid17"/>  
      <column label="密码：" name="col18" type="String" xid="xid18"/>  
      <column label="用户名：" name="col19" type="String" xid="xid19"/>  
      <column label="密码：" name="col20" type="String" xid="xid20"/>  
      <column label="用户名：" name="col21" type="String" xid="xid21"/>  
      <column label="密码：" name="col22" type="String" xid="xid22"/>  
      <column label="常住地址：" name="address" type="String" xid="xid4"/> 
    </div> 
  </div>  
  <div component="$UI/system/components/justep/controlGroup/controlGroup" class="x-control-group"
    title="大量的表单元素" xid="controlGroup"> 
    <div class="x-control-group-title" xid="controlGroupTitle1"> 
      <span xid="span1">大量的表单元素</span> 
    </div>  
    <a component="$UI/system/components/justep/button/button" class="btn btn-link"
      label="js" xid="showJs" onClick="showJsSource"> 
      <i xid="i4"/>  
      <span xid="span6">js</span>
    </a>
    <a component="$UI/system/components/justep/button/button" class="btn btn-link"
      label="源码" xid="sourceBtn" onClick="sourceBtnClick"> 
      <i xid="i4"/>  
      <span xid="span5">源码</span>
    </a>
    <div component="$UI/system/components/justep/row/row" class="x-row" xid="row1"> 
      <div class="x-col x-col-10" xid="col1"> 
        <label xid="label1" bind-text="userData.label('name')" class="pull-right">label</label> 
      </div>  
      <div class="x-col" xid="col2"> 
        <input component="$UI/system/components/justep/input/input" class="form-control"
          xid="input" bind-ref="userData.ref('name')"/> 
      </div>  
      <div class="x-col x-col-10" xid="col3"> 
        <label xid="label2" bind-text="userData.label('pass')" class="pull-right">label</label> 
      </div>  
      <div class="x-col" xid="col4"> 
        <input component="$UI/system/components/justep/input/input" class="form-control"
          xid="input3" bind-ref="userData.ref('pass')"/> 
      </div> 
    </div>  
    <div component="$UI/system/components/justep/row/row" class="x-row" xid="row2"> 
      <div class="x-col x-col-10" xid="col6"> 
        <label xid="label3" bind-text="userData.label('name')" class="pull-right">label</label> 
      </div>  
      <div class="x-col" xid="col10"> 
        <input component="$UI/system/components/justep/input/input" class="form-control"
          xid="input5" bind-ref="userData.ref('col3')"/> 
      </div>  
      <div class="x-col x-col-10" xid="col7"> 
        <label xid="label4" bind-text="userData.label('pass')" class="pull-right">label</label> 
      </div>  
      <div class="x-col" xid="col5"> 
        <input component="$UI/system/components/justep/input/input" class="form-control"
          xid="input4" bind-ref="userData.ref('col4')"/> 
      </div> 
    </div>  
    <div component="$UI/system/components/justep/row/row" class="x-row" xid="row4"> 
      <div class="x-col x-col-10" xid="col12"> 
        <label xid="label5" bind-text="userData.label('name')" class="pull-right">label</label> 
      </div>  
      <div class="x-col" xid="col14"> 
        <input component="$UI/system/components/justep/input/input" class="form-control"
          xid="input7" bind-ref="userData.ref('col5')"/> 
      </div>  
      <div class="x-col x-col-10" xid="col13"> 
        <label xid="label6" bind-text="userData.label('pass')" class="pull-right">label</label> 
      </div>  
      <div class="x-col" xid="col11"> 
        <input component="$UI/system/components/justep/input/input" class="form-control"
          xid="input6" bind-ref="userData.ref('col6')"/> 
      </div> 
    </div>  
    <div component="$UI/system/components/justep/row/row" class="x-row" xid="row5"> 
      <div class="x-col x-col-10" xid="col16"> 
        <label xid="label7" bind-text="userData.label('name')" class="pull-right">label</label> 
      </div>  
      <div class="x-col" xid="col18"> 
        <input component="$UI/system/components/justep/input/input" class="form-control"
          xid="input9" bind-ref="userData.ref('col7')"/> 
      </div>  
      <div class="x-col x-col-10" xid="col17"> 
        <label xid="label8" bind-text="userData.label('pass')" class="pull-right">label</label> 
      </div>  
      <div class="x-col" xid="col15"> 
        <input component="$UI/system/components/justep/input/input" class="form-control"
          xid="input8" bind-ref="userData.ref('col8')"/> 
      </div> 
    </div>  
    <div component="$UI/system/components/justep/row/row" class="x-row" xid="row6"> 
      <div class="x-col x-col-10" xid="col20"> 
        <label xid="label9" bind-text="userData.label('name')" class="pull-right">label</label> 
      </div>  
      <div class="x-col" xid="col22"> 
        <input component="$UI/system/components/justep/input/input" class="form-control"
          xid="input11" bind-ref="userData.ref('col9')"/> 
      </div>  
      <div class="x-col x-col-10" xid="col21"> 
        <label xid="label10" bind-text="userData.label('pass')" class="pull-right">label</label> 
      </div>  
      <div class="x-col" xid="col19"> 
        <input component="$UI/system/components/justep/input/input" class="form-control"
          xid="input10" bind-ref="userData.ref('col10')"/> 
      </div> 
    </div>  
    <div component="$UI/system/components/justep/row/row" class="x-row" xid="row7"> 
      <div class="x-col x-col-10" xid="col24"> 
        <label xid="label11" bind-text="userData.label('name')" class="pull-right">label</label> 
      </div>  
      <div class="x-col" xid="col26"> 
        <input component="$UI/system/components/justep/input/input" class="form-control"
          xid="input13" bind-ref="userData.ref('col11')"/> 
      </div>  
      <div class="x-col x-col-10" xid="col25"> 
        <label xid="label12" bind-text="userData.label('pass')" class="pull-right">label</label> 
      </div>  
      <div class="x-col" xid="col23"> 
        <input component="$UI/system/components/justep/input/input" class="form-control"
          xid="input12" bind-ref="userData.ref('col12')"/> 
      </div> 
    </div>  
    <div component="$UI/system/components/justep/row/row" class="x-row" xid="row8"> 
      <div class="x-col x-col-10" xid="col28"> 
        <label xid="label13" bind-text="userData.label('name')" class="pull-right">label</label> 
      </div>  
      <div class="x-col" xid="col30"> 
        <input component="$UI/system/components/justep/input/input" class="form-control"
          xid="input15" bind-ref="userData.ref('col13')"/> 
      </div>  
      <div class="x-col x-col-10" xid="col29"> 
        <label xid="label14" bind-text="userData.label('pass')" class="pull-right">label</label> 
      </div>  
      <div class="x-col" xid="col27"> 
        <input component="$UI/system/components/justep/input/input" class="form-control"
          xid="input14" bind-ref="userData.ref('col14')"/> 
      </div> 
    </div>  
    <div component="$UI/system/components/justep/row/row" class="x-row" xid="row9"> 
      <div class="x-col x-col-10" xid="col32"> 
        <label xid="label15" bind-text="userData.label('name')" class="pull-right">label</label> 
      </div>  
      <div class="x-col" xid="col34"> 
        <input component="$UI/system/components/justep/input/input" class="form-control"
          xid="input17" bind-ref="userData.ref('col15')"/> 
      </div>  
      <div class="x-col x-col-10" xid="col33"> 
        <label xid="label16" bind-text="userData.label('pass')" class="pull-right">label</label> 
      </div>  
      <div class="x-col" xid="col31"> 
        <input component="$UI/system/components/justep/input/input" class="form-control"
          xid="input16" bind-ref="userData.ref('col16')"/> 
      </div> 
    </div>  
    <div component="$UI/system/components/justep/row/row" class="x-row" xid="row10"> 
      <div class="x-col x-col-10" xid="col36"> 
        <label xid="label17" bind-text="userData.label('name')" class="pull-right">label</label> 
      </div>  
      <div class="x-col" xid="col38"> 
        <input component="$UI/system/components/justep/input/input" class="form-control"
          xid="input19" bind-ref="userData.ref('col17')"/> 
      </div>  
      <div class="x-col x-col-10" xid="col37"> 
        <label xid="label18" bind-text="userData.label('pass')" class="pull-right">label</label> 
      </div>  
      <div class="x-col" xid="col35"> 
        <input component="$UI/system/components/justep/input/input" class="form-control"
          xid="input18" bind-ref="userData.ref('col18')"/> 
      </div> 
    </div>  
    <div component="$UI/system/components/justep/row/row" class="x-row" xid="row11"> 
      <div class="x-col x-col-10" xid="col40"> 
        <label xid="label19" bind-text="userData.label('name')" class="pull-right">label</label> 
      </div>  
      <div class="x-col" xid="col42"> 
        <input component="$UI/system/components/justep/input/input" class="form-control"
          xid="input21" bind-ref="userData.ref('col19')"/> 
      </div>  
      <div class="x-col x-col-10" xid="col41"> 
        <label xid="label20" bind-text="userData.label('pass')" class="pull-right">label</label> 
      </div>  
      <div class="x-col" xid="col39"> 
        <input component="$UI/system/components/justep/input/input" class="form-control"
          xid="input20" bind-ref="userData.ref('col20')"/> 
      </div> 
    </div>  
    <div component="$UI/system/components/justep/row/row" class="x-row" xid="row12"> 
      <div class="x-col x-col-10" xid="col45"> 
        <label xid="label22" bind-text="userData.label('name')" class="pull-right">label</label> 
      </div>  
      <div class="x-col" xid="col44"> 
        <input component="$UI/system/components/justep/input/input" class="form-control"
          xid="input23" bind-ref="userData.ref('col21')"/> 
      </div>  
      <div class="x-col x-col-10" xid="col46"> 
        <label xid="label21" bind-text="userData.label('pass')" class="pull-right">label</label> 
      </div>  
      <div class="x-col" xid="col43"> 
        <input component="$UI/system/components/justep/input/input" class="form-control"
          xid="input22" bind-ref="userData.ref('col22')"/> 
      </div> 
    </div>  
    <div component="$UI/system/components/justep/row/row" class="x-row" xid="row13"> 
      <div class="x-col x-col-10" xid="col49"> 
        <label xid="label24" bind-text="userData.label('address')" class="pull-right">label</label> 
      </div>  
      <div class="x-col" xid="col48"> 
        <textarea component="$UI/system/components/justep/textarea/textarea" class="form-control"
          xid="textarea1" style="height:100px;" bind-ref="userData.ref('address')"/> 
      </div> 
    </div>  
    <div component="$UI/system/components/justep/row/row" class="x-row" xid="row3"> 
      <div class="x-col" xid="col8"> 
        <a component="$UI/system/components/justep/button/button" class="btn btn-link pull-right"
          label="提交" xid="subBtn" onClick="subBtnClick"> 
          <i xid="i1"/>  
          <span xid="span2">提交</span> 
        </a> 
      </div>  
      <div class="x-col" xid="col9"> 
        <a component="$UI/system/components/justep/button/button" class="btn btn-link"
          label="重置" xid="regestBtn" onClick="regestBtnClick"> 
          <i xid="i2"/>  
          <span xid="span3">重置</span> 
        </a> 
      </div> 
    </div> 
  </div> 
</div>
