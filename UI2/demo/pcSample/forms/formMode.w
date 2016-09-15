<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window" component="$UI/system/components/justep/window/window"
  design="device:pc">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:254px;top:81px;"> 
    <div component="$UI/system/components/justep/data/data" autoLoad="true"
      xid="SexData" idColumn="sex"> 
      <column label="性别" name="sex" type="String" xid="xid1"/>  
      <data xid="default2">[{"sex":"男"},{"sex":"女"}]</data> 
    </div>  
    <div component="$UI/system/components/justep/data/data" autoLoad="true"
      xid="marryData" idColumn="marriage"> 
      <column label="婚姻情况" name="marriage" type="String" xid="xid2"/>  
      <data xid="default3">[{"marriage":"已婚"},{"marriage":"未婚"}]</data> 
    </div>  
    <div component="$UI/system/components/justep/data/data" autoLoad="true"
      xid="userDeTailData" idColumn="org"> 
      <column label="籍贯：" name="org" type="String" xid="xid3"/>  
      <column label="名族：" name="family" type="String" xid="xid4"/>  
      <column label="学历：" name="edu" type="String" xid="xid5"/>  
      <column label="权限：" name="Jurisdiction" type="String" xid="xid6"/>  
      <column label="邮政编码：" name="code" type="String" xid="xid7"/>  
      <column label="固定电话：" name="tel" type="String" xid="xid8"/>  
      <column label="上传附件：" name="update1" type="String" xid="xid9"/>  
      <column label="上传文档：" name="update2" type="String" xid="xid10"/>  
      <column label="备注：" name="desc" type="String" xid="xid11"/>  
      <data xid="default5">[{"org":"北京","family":"汉族","edu":"本科","Jurisdiction":"","code":"111111","tel":"123456","update1":"","update2":"","desc":""}]</data> 
    </div>  
    <div component="$UI/system/components/justep/data/data" autoLoad="true"
      xid="juriData" idColumn="juri"> 
      <column label="权限" name="juri" type="String" xid="xid12"/>  
      <data xid="default6">[{"juri":"添加"},{"juri":"删除"},{"juri":"修改"},{"juri":"查看"}]</data> 
    </div> 
  </div>  
  <div component="$UI/system/components/justep/contents/contents" class="x-contents x-full"
    active="0" xid="contents"> 
    <div class="x-contents-content" xid="content1"> 
      <div component="$UI/system/components/justep/panel/panel" class="x-panel x-full"
        xid="panel1"> 
        <div class="x-panel-top" xid="top1"> 
          <div component="$UI/system/components/justep/titleBar/titleBar" class="x-titlebar"
            title="form和fieldset" xid="titleBar1"> 
            <div class="x-titlebar-left" xid="div1"/>  
            <div class="x-titlebar-title" xid="div2">form和fieldset</div>  
            <div class="x-titlebar-right reverse" xid="div3"></div> 
          </div> 
        </div>  
        <div class="x-panel-content" xid="content2"> 
          <div class="form-horizontal pull-left container-fluid" component="$UI/system/components/bootstrap/form/form"
            xid="form1"> 
            <a component="$UI/system/components/justep/button/button" class="btn btn-link"
              label="js" xid="showJs" onClick="showJsSource"> 
              <i xid="i2"/>  
              <span xid="span3">js</span>
            </a>
            <a component="$UI/system/components/justep/button/button" class="btn btn-link"
              label="源码" xid="sourceBtn" onClick="sourceBtnClick"> 
              <i xid="i4"/>  
              <span xid="span4">源码</span>
            </a>
            <fieldset xid="fieldset1" style="height:205px;width:563px;"> 
              <legend xid="default1">用户基本信息</legend>  
              <div component="$UI/system/components/justep/row/row" class="x-row"
                xid="row1"> 
                <div class="x-col x-col-12" xid="col1"> 
                  <label xid="label1" class="pull-right"><![CDATA[姓名：]]></label> 
                </div>  
                <div class="x-col" xid="col2"> 
                  <input component="$UI/system/components/justep/input/input"
                    class="form-control" xid="input1"/> 
                </div>  
                <div class="x-col x-col-12" xid="col3"> 
                  <label xid="label2" class="pull-right"><![CDATA[性别：]]></label> 
                </div>  
                <div class="x-col" xid="col4"> 
                  <span component="$UI/system/components/justep/select/radioGroup"
                    class="x-radio-group" xid="radioGroup1" bind-itemset="SexData"
                    bind-itemsetValue="ref('sex')" bind-itemsetLabel="ref('sex')"/> 
                </div> 
              </div>  
              <div component="$UI/system/components/justep/row/row" class="x-row"
                xid="row2"> 
                <div class="x-col x-col-12" xid="col5"> 
                  <label xid="label3" class="pull-right" title="">曾用名：</label> 
                </div>  
                <div class="x-col" xid="col6"> 
                  <input component="$UI/system/components/justep/input/input"
                    class="form-control" xid="input3"/> 
                </div>  
                <div class="x-col x-col-12" xid="col7"> 
                  <label xid="label4" class="pull-right"><![CDATA[婚姻：]]></label> 
                </div>  
                <div class="x-col" xid="col8"> 
                  <span component="$UI/system/components/justep/select/radioGroup"
                    class="x-radio-group" xid="radioGroup2" bind-itemset="marryData"
                    bind-itemsetValue="ref('marriage')" bind-itemsetLabel="ref('marriage')"/> 
                </div> 
              </div> 
            </fieldset>  
            <fieldset xid="fieldset2" class="fiel1" style="height:175px;width:577px;"> 
              <legend xid="default4">用户详细信息</legend>  
              <div component="$UI/system/components/justep/row/row" class="x-row"
                xid="row3"> 
                <div class="x-col" xid="col9"> 
                  <label xid="label5" bind-text="userDeTailData.label('org')"
                    class="pull-right">label</label> 
                </div>  
                <div class="x-col" xid="col10"> 
                  <div component="$UI/system/components/justep/output/output"
                    class="x-output" xid="output2" bind-ref="userDeTailData.ref('org')"/> 
                </div>  
                <div class="x-col" xid="col11"> 
                  <label xid="label9" bind-text="userDeTailData.label('family')"
                    class="pull-right">label</label> 
                </div>  
                <div class="x-col" xid="col15"> 
                  <div component="$UI/system/components/justep/output/output"
                    class="x-output" xid="output4" bind-ref="userDeTailData.ref('family')"/> 
                </div> 
              </div>  
              <div component="$UI/system/components/justep/row/row" class="x-row"
                xid="row4"> 
                <div class="x-col" xid="col12"> 
                  <label xid="label6" bind-text="userDeTailData.label('edu')"
                    class="pull-right">label</label> 
                </div>  
                <div class="x-col" xid="col13"> 
                  <div component="$UI/system/components/justep/output/output"
                    class="x-output" xid="output6" bind-ref="userDeTailData.ref('edu')"/> 
                </div>  
                <div class="x-col" xid="col14"> 
                  <label xid="label10" bind-text="userDeTailData.label('Jurisdiction')"
                    class="pull-right">label</label> 
                </div>  
                <div class="x-col" xid="col16"> 
                  <select component="$UI/system/components/justep/select/select"
                    class="form-control" xid="select1" bind-ref="userDeTailData.ref('Jurisdiction')"
                    bind-options="juriData" bind-optionsValue="juri" bind-optionsLabel="juri"/> 
                </div> 
              </div> 
            </fieldset>  
            <fieldset xid="fieldset3" class="fiel2" style="width:574px;"> 
              <legend xid="default7">用户其他信息</legend>  
              <div component="$UI/system/components/justep/row/row" class="x-row"
                xid="row5"> 
                <div class="x-col x-col-13" xid="col17"> 
                  <label xid="label11" bind-text="userDeTailData.label('code')">label</label> 
                </div>  
                <div class="x-col" xid="col18"> 
                  <input component="$UI/system/components/justep/input/input"
                    class="form-control" xid="input7"/> 
                </div>  
                <div class="x-col x-col-13" xid="col19"> 
                  <label xid="label12" bind-text="userDeTailData.label('update1')">label</label> 
                </div>  
                <div class="x-col" xid="col30"> 
                  <input component="$UI/system/components/justep/input/input"
                    class="form-control" xid="input5"/> 
                </div> 
              </div>  
              <div component="$UI/system/components/justep/row/row" class="x-row"
                xid="row6"> 
                <div class="x-col" xid="col20"> 
                  <label xid="label13" bind-text="userDeTailData.label('tel')">label</label> 
                </div>  
                <div class="x-col" xid="col21"> 
                  <input component="$UI/system/components/justep/input/input"
                    class="form-control" xid="input8"/> 
                </div>  
                <div class="x-col" xid="col22"> 
                  <label xid="label14" bind-text="userDeTailData.label('update2')">label</label> 
                </div>  
                <div class="x-col" xid="col32"> 
                  <input component="$UI/system/components/justep/input/input"
                    class="form-control" xid="input6"/> 
                </div> 
              </div>  
              <div component="$UI/system/components/justep/row/row" class="x-row"
                xid="row7" style="margin-left:20px;"> 
                <div class="x-col x-col-13" xid="col23"> 
                  <label xid="label15" bind-text="userDeTailData.label('desc')"
                    class="pull-right">label</label> 
                </div>  
                <div class="x-col x-col-80" xid="col24"> 
                  <textarea component="$UI/system/components/justep/textarea/textarea"
                    class="form-control" xid="textarea1" bind-ref="userDeTailData.ref('desc')"/> 
                </div> 
              </div> 
            </fieldset> 
          </div> 
        </div> 
      </div> 
    </div> 
  </div> 
</div>
