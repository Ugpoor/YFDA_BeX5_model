<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window" component="$UI/system/components/justep/window/window"
  design="device:pc">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:233px;top:111px;"> 
    <div component="$UI/system/components/justep/data/data" autoLoad="true"
      xid="userData" idColumn="name"> 
      <column label="姓名：" name="name" type="String" xid="xid1"/>  
      <column label="性别：" name="sex" type="String" xid="xid2"/>  
      <column label="曾用名：" name="uname" type="String" xid="xid3"/>  
      <column label="年龄：" name="age" type="String" xid="xid4"/>  
      <column label="身高：" name="height" type="String" xid="xid5"/>  
      <column label="身份证号码：" name="IDcode" type="String" xid="xid6"/>  
      <column label="出生日期：" name="birthday" type="String" xid="xid7"/>  
      <column label="职业：" name="vocation" type="String" xid="xid8"/>  
      <column label="文化程度：" name="culture" type="String" xid="xid9"/>  
      <column label="政治面貌：" name="politics" type="String" xid="xid10"/>  
      <column label="婚姻状况：" name="marry" type="String" xid="xid11"/>  
      <column label="名族：" name="family" type="String" xid="xid12"/>  
      <column label="户口所在地：" name="Household" type="String" xid="xid13"/>  
      <column label="现居住地：" name="live" type="String" xid="xid14"/>  
      <column label="备注：" name="desc" type="String" xid="xid15"/>  
      <data xid="default1">[{"name":"张三","sex":"男","uname":"张小三","age":"15","height":"178","IDcode":"1234","birthday":"0812","vocation":"软件工程师","culture":"本科","politics":"团员","marry":"未婚","family":"汉族","Household":"北京","live":"北京","desc":"无备注信息"}]</data> 
    </div>  
    <div component="$UI/system/components/justep/data/data" autoLoad="true"
      xid="uData" idColumn="name" onCustomRefresh="uDataCustomRefresh" onCustomSave="uDataCustomSave"> 
      <column label="姓名：" name="name" type="String" xid="column3"/>  
      <column label="性别：" name="sex" type="String" xid="column5"/>  
      <column label="曾用名：" name="uname" type="String" xid="column1"/>  
      <column label="年龄：" name="age" type="String" xid="column2"/>  
      <column label="身高：" name="height" type="String" xid="column4"/>  
      <column label="身份证号码：" name="IDcode" type="String" xid="column6"/>  
      <column label="出生日期：" name="birthday" type="String" xid="column7"/>  
      <column label="职业：" name="vocation" type="String" xid="column8"/>  
      <column label="文化程度：" name="culture" type="String" xid="column9"/>  
      <column label="政治面貌：" name="politics" type="String" xid="column10"/>  
      <column label="婚姻状况：" name="marry" type="String" xid="column11"/>  
      <column label="名族：" name="family" type="String" xid="column14"/>  
      <column label="户口所在地：" name="Household" type="String" xid="column15"/>  
      <column label="现居住地：" name="live" type="String" xid="column12"/>  
      <column label="备注：" name="desc" type="String" xid="column13"/>  
      <data xid="default2">[{}]</data>  
      <rule xid="rule1"> 
        <col name="name" xid="ruleCol1"> 
          <required xid="required1"> 
            <expr xid="default3">true</expr>
          </required> 
        </col>  
        <col name="sex" xid="ruleCol2"> 
          <required xid="required2"> 
            <expr xid="default4"/>
          </required> 
        </col>  
        <col name="uname" xid="ruleCol3"> 
          <required xid="required3"> 
            <expr xid="default5"/>
          </required> 
        </col>  
        <col name="age" xid="ruleCol4"> 
          <required xid="required4"> 
            <expr xid="default6"/>
          </required> 
        </col>  
        <col name="height" xid="ruleCol5"> 
          <required xid="required5"> 
            <expr xid="default7"/>
          </required> 
        </col>  
        <col name="IDcode" xid="ruleCol6"> 
          <required xid="required6"> 
            <expr xid="default8"/>
          </required> 
        </col> 
      </rule>
    </div> 
  </div>  
  <h3 xid="h31" style="margin:20px;"><![CDATA[响应式布局]]></h3>  
  <a component="$UI/system/components/justep/button/button" class="btn btn-link"
    label="js" xid="showJs" onClick="showJsSource"> 
    <i xid="i4"/>  
    <span xid="span7">js</span>
  </a>
  <a component="$UI/system/components/justep/button/button" class="btn btn-link"
    label="源码" xid="sourceBtn" onClick="sourceBtnClick"> 
    <i xid="i4"/>  
    <span xid="span5">源码</span>
  </a>
  <div component="$UI/system/components/justep/controlGroup/controlGroup" class="x-control-group"
    title="信息添加" xid="controlGroup1"> 
    <div class="x-control-group-title" xid="controlGroupTitle1"> 
      <span xid="span1">信息添加</span> 
    </div>  
    <div component="$UI/system/components/justep/row/row" class="x-row" xid="row1"
      style="height:auto;"> 
      <div class="x-col x-col-fixed" xid="col1" style="height:auto;width:auto;"> 
        <img src="$UI/demo/sample/forms/img/1.jpg" alt="" xid="image1"/> 
      </div>  
      <div class="x-col" xid="col2" style="height:100%;"> 
        <div component="$UI/system/components/justep/row/row" class="x-row"
          xid="row2"> 
          <div class="x-col x-col-10" xid="col4"> 
            <label xid="label1" class="pull-right" bind-text="uData.label('name')">label</label> 
          </div>  
          <div class="x-col" xid="col5"> 
            <input component="$UI/system/components/justep/input/input" class="form-control"
              xid="input1" bind-ref="uData.ref('name')"/> 
          </div>  
          <div class="x-col x-col-10" xid="col6"> 
            <label xid="label8" class="pull-right" bind-text="uData.label('sex')">label</label> 
          </div>  
          <div class="x-col" xid="col25"> 
            <input component="$UI/system/components/justep/input/input" class="form-control"
              xid="input2" bind-ref="uData.ref('sex')"/> 
          </div> 
        </div>  
        <div component="$UI/system/components/justep/row/row" class="x-row"
          xid="row3"> 
          <div class="x-col x-col-10" xid="col7"> 
            <label xid="label2" class="pull-right" bind-text="uData.label('uname')">label</label> 
          </div>  
          <div class="x-col" xid="col8"> 
            <input component="$UI/system/components/justep/input/input" class="form-control"
              xid="input3" bind-ref="uData.ref('uname')"/> 
          </div>  
          <div class="x-col x-col-10" xid="col9"> 
            <label xid="label9" class="pull-right" bind-text="uData.label('age')">label</label> 
          </div>  
          <div class="x-col" xid="col26"> 
            <input component="$UI/system/components/justep/input/input" class="form-control"
              xid="input4" bind-ref="uData.ref('age')"/> 
          </div> 
        </div>  
        <div component="$UI/system/components/justep/row/row" class="x-row"
          xid="row4"> 
          <div class="x-col x-col-10" xid="col10"> 
            <label xid="label3" class="pull-right" bind-text="uData.label('height')">label</label> 
          </div>  
          <div class="x-col" xid="col11"> 
            <input component="$UI/system/components/justep/input/input" class="form-control"
              xid="input5" bind-ref="uData.ref('height')"/> 
          </div>  
          <div class="x-col x-col-10" xid="col12"> 
            <label xid="label10" class="pull-right" bind-text="uData.label('IDcode')">label</label> 
          </div>  
          <div class="x-col" xid="col27"> 
            <input component="$UI/system/components/justep/input/input" class="form-control"
              xid="input6" bind-ref="uData.ref('IDcode')"/> 
          </div> 
        </div>  
        <div component="$UI/system/components/justep/row/row" class="x-row"
          xid="row5"> 
          <div class="x-col x-col-10" xid="col13"> 
            <label xid="label4" class="pull-right" bind-text="uData.label('birthday')">label</label> 
          </div>  
          <div class="x-col" xid="col14"> 
            <input component="$UI/system/components/justep/input/input" class="form-control"
              xid="input7" bind-ref="uData.ref('birthday')"/> 
          </div>  
          <div class="x-col x-col-10" xid="col15"> 
            <label xid="label11" class="pull-right" bind-text="uData.label('vocation')">label</label> 
          </div>  
          <div class="x-col" xid="col28"> 
            <input component="$UI/system/components/justep/input/input" class="form-control"
              xid="input8" bind-ref="uData.ref('vocation')"/> 
          </div> 
        </div>  
        <div component="$UI/system/components/justep/row/row" class="x-row"
          xid="row6"> 
          <div class="x-col x-col-10" xid="col16"> 
            <label xid="label5" class="pull-right" bind-text="uData.label('culture')">label</label> 
          </div>  
          <div class="x-col" xid="col17"> 
            <input component="$UI/system/components/justep/input/input" class="form-control"
              xid="input9" bind-ref="uData.ref('culture')"/> 
          </div>  
          <div class="x-col x-col-10" xid="col18"> 
            <label xid="label12" class="pull-right" bind-text="uData.label('politics')">label</label> 
          </div>  
          <div class="x-col" xid="col29"> 
            <input component="$UI/system/components/justep/input/input" class="form-control"
              xid="input10" bind-ref="uData.ref('politics')"/> 
          </div> 
        </div>  
        <div component="$UI/system/components/justep/row/row" class="x-row"
          xid="row7"> 
          <div class="x-col x-col-10" xid="col19"> 
            <label xid="label6" class="pull-right" bind-text="uData.label('marry')">label</label> 
          </div>  
          <div class="x-col" xid="col20"> 
            <input component="$UI/system/components/justep/input/input" class="form-control"
              xid="input12" bind-ref="uData.ref('marry')"/> 
          </div>  
          <div class="x-col x-col-10" xid="col21"> 
            <label xid="label13" class="pull-right" bind-text="uData.label('family')">label</label> 
          </div>  
          <div class="x-col" xid="col30"> 
            <input component="$UI/system/components/justep/input/input" class="form-control"
              xid="input13" bind-ref="uData.ref('family')"/> 
          </div> 
        </div>  
        <div component="$UI/system/components/justep/row/row" class="x-row"
          xid="row8"> 
          <div class="x-col x-col-10" xid="col22"> 
            <label xid="label7" class="pull-right" bind-text="uData.label('Household')">label</label> 
          </div>  
          <div class="x-col" xid="col23"> 
            <input component="$UI/system/components/justep/input/input" class="form-control"
              xid="input14" bind-ref="uData.ref('Household')"/> 
          </div>  
          <div class="x-col x-col-10" xid="col24"> 
            <label xid="label14" class="pull-right" bind-text="uData.label('live')">label</label> 
          </div>  
          <div class="x-col" xid="col31"> 
            <input component="$UI/system/components/justep/input/input" class="form-control"
              xid="input15" bind-ref="uData.ref('live')"/> 
          </div> 
        </div>  
        <div component="$UI/system/components/justep/row/row" class="x-row"
          xid="row10"> 
          <div class="x-col x-col-10" xid="col35"> 
            <label xid="label15" class="pull-right" bind-text="userData.label('desc')">label</label> 
          </div>  
          <div class="x-col" xid="col36"> 
            <textarea component="$UI/system/components/justep/textarea/textarea"
              class="form-control" xid="textarea2" style="width:60%;height:80px;"
              bind-ref="uData.ref('desc')"/> 
          </div> 
        </div>  
        <div component="$UI/system/components/justep/row/row" class="x-row"
          xid="row9"> 
          <div class="x-col" xid="col32"> 
            <a component="$UI/system/components/justep/button/button" class="btn btn-link pull-right"
              label="保存" xid="addBtn" onClick="addBtnClick"> 
              <i xid="i1"/>  
              <span xid="span2">保存</span> 
            </a> 
          </div>  
          <div class="x-col" xid="col33"> 
            <a component="$UI/system/components/justep/button/button" class="btn btn-link"
              label="重置" xid="regest" onClick="regestClick"> 
              <i xid="i2"/>  
              <span xid="span3">重置</span> 
            </a> 
          </div> 
        </div> 
      </div> 
    </div> 
  </div>  
  <div component="$UI/system/components/justep/controlGroup/controlGroup" class="x-control-group2"
    title="信息展示" xid="controlGroup2"> 
    <div class="x-control-group-title" xid="controlGroupTitle2"> 
      <span xid="span6"><![CDATA[信息展示]]></span> 
    </div>  
    <div component="$UI/system/components/justep/row/row" class="x-row" xid="row11"
      style="height:auto;"> 
      <div class="x-col x-col-fixed" xid="col51" style="height:auto;width:auto;"> 
        <img src="$UI/demo/sample/forms/img/1.jpg" alt="" xid="image2"/> 
      </div>  
      <div class="x-col" xid="col52" style="height:100%;"> 
        <div component="$UI/system/components/justep/row/row" class="x-row"
          xid="row14"> 
          <div class="x-col x-col-10" xid="col48"> 
            <label xid="label28" class="pull-right" bind-text="userData.label('name')">label</label> 
          </div>  
          <div class="x-col " xid="col47"> 
            <div component="$UI/system/components/justep/output/output" class="x-output"
              xid="output1" bind-ref="userData.ref('name')"/> 
          </div>  
          <div class="x-col x-col-10" xid="col50"> 
            <label xid="label27" class="pull-right" bind-text="userData.label('sex')">label</label> 
          </div>  
          <div class="x-col" xid="col61"> 
            <div component="$UI/system/components/justep/output/output" class="x-output"
              xid="output2" bind-ref="userData.ref('sex')"/> 
          </div> 
        </div>  
        <div component="$UI/system/components/justep/row/row" class="x-row"
          xid="row15"> 
          <div class="x-col x-col-10" xid="col49"> 
            <label xid="label29" class="pull-right" bind-text="userData.label('uname')">label</label> 
          </div>  
          <div class="x-col" xid="col60"> 
            <div component="$UI/system/components/justep/output/output" class="x-output"
              xid="output3" bind-ref="userData.ref('uname')"/> 
          </div>  
          <div class="x-col x-col-10" xid="col58"> 
            <label xid="label26" class="pull-right" bind-text="userData.label('age')">label</label> 
          </div>  
          <div class="x-col" xid="col54"> 
            <div component="$UI/system/components/justep/output/output" class="x-output"
              xid="output4" bind-ref="userData.ref('age')"/> 
          </div> 
        </div>  
        <div component="$UI/system/components/justep/row/row" class="x-row"
          xid="row12"> 
          <div class="x-col x-col-10" xid="col3"> 
            <label xid="label30" class="pull-right" bind-text="userData.label('height')">label</label> 
          </div>  
          <div class="x-col" xid="col40"> 
            <div component="$UI/system/components/justep/output/output" class="x-output"
              xid="output6" bind-ref="userData.ref('height')"/> 
          </div>  
          <div class="x-col x-col-10" xid="col39"> 
            <label xid="label20" class="pull-right" bind-text="userData.label('IDcode')">label</label> 
          </div>  
          <div class="x-col" xid="col53"> 
            <div component="$UI/system/components/justep/output/output" class="x-output"
              xid="output5" bind-ref="userData.ref('IDcode')"/> 
          </div> 
        </div>  
        <div component="$UI/system/components/justep/row/row" class="x-row"
          xid="row13"> 
          <div class="x-col x-col-10" xid="col38"> 
            <label xid="label25" class="pull-right" bind-text="userData.label('birthday')">label</label> 
          </div>  
          <div class="x-col" xid="col37"> 
            <div component="$UI/system/components/justep/output/output" class="x-output"
              xid="output7" bind-ref="userData.ref('birthday')"/> 
          </div>  
          <div class="x-col x-col-10" xid="col44"> 
            <label xid="label16" class="pull-right" bind-text="userData.label('vocation')">label</label> 
          </div>  
          <div class="x-col" xid="col56"> 
            <div component="$UI/system/components/justep/output/output" class="x-output"
              xid="output8" bind-ref="userData.ref('vocation')"/> 
          </div> 
        </div>  
        <div component="$UI/system/components/justep/row/row" class="x-row"
          xid="row18"> 
          <div class="x-col x-col-10" xid="col43"> 
            <label xid="label24" class="pull-right" bind-text="userData.label('culture')">label</label> 
          </div>  
          <div class="x-col" xid="col42"> 
            <div component="$UI/system/components/justep/output/output" class="x-output"
              xid="output9" bind-ref="userData.ref('culture')"/> 
          </div>  
          <div class="x-col x-col-10" xid="col41"> 
            <label xid="label17" class="pull-right" bind-text="userData.label('politics')">label</label> 
          </div>  
          <div class="x-col" xid="col55"> 
            <div component="$UI/system/components/justep/output/output" class="x-output"
              xid="output10" bind-ref="userData.ref('politics')"/> 
          </div> 
        </div>  
        <div component="$UI/system/components/justep/row/row" class="x-row"
          xid="row19"> 
          <div class="x-col x-col-10" xid="col34"> 
            <label xid="label23" class="pull-right" bind-text="userData.label('marry')">label</label> 
          </div>  
          <div class="x-col" xid="col45"> 
            <div component="$UI/system/components/justep/output/output" class="x-output"
              xid="output11" bind-ref="userData.ref('marry')"/> 
          </div>  
          <div class="x-col x-col-10" xid="col46"> 
            <label xid="label18" class="pull-right" bind-text="userData.label('family')">label</label> 
          </div>  
          <div class="x-col" xid="col63"> 
            <div component="$UI/system/components/justep/output/output" class="x-output"
              xid="output12" bind-ref="userData.ref('family')"/> 
          </div> 
        </div>  
        <div component="$UI/system/components/justep/row/row" class="x-row"
          xid="row16"> 
          <div class="x-col x-col-10" xid="col59"> 
            <label xid="label22" class="pull-right" bind-text="userData.label('Household')">label</label> 
          </div>  
          <div class="x-col" xid="col57"> 
            <div component="$UI/system/components/justep/output/output" class="x-output"
              xid="output13" bind-ref="userData.ref('Household')"/> 
          </div>  
          <div class="x-col x-col-10" xid="col62"> 
            <label xid="label19" class="pull-right" bind-text="userData.label('live')">label</label> 
          </div>  
          <div class="x-col" xid="col64"> 
            <div component="$UI/system/components/justep/output/output" class="x-output"
              xid="output14" bind-ref="userData.ref('live')"/> 
          </div> 
        </div>  
        <div component="$UI/system/components/justep/row/row" class="x-row"
          xid="row20"> 
          <div class="x-col x-col-10" xid="col67"> 
            <label xid="label21" class="pull-right" bind-text="userData.label('desc')">label</label> 
          </div>  
          <div class="x-col" xid="col66"> 
            <div component="$UI/system/components/justep/output/output" class="x-output"
              xid="output15" bind-ref="userData.ref('desc')"/> 
          </div> 
        </div> 
      </div> 
    </div> 
  </div> 
</div>
