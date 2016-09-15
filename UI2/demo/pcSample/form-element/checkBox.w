<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window" component="$UI/system/components/justep/window/window"
  design="device:pc">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="width:151px;height:auto;left:167px;top:106px;"> 
    <div component="$UI/system/components/justep/data/data" autoLoad="true"
      xid="basicData" idColumn="hobby"> 
      <column label="爱好" name="hobby" type="String" xid="xid1"/>  
      <column label="兴趣" name="interesting" type="String" xid="xid4"/>  
      <column label="默认" name="default" type="String" xid="xid5"/>  
      <column label="爱好" name="enable" type="String" xid="xid6"/>  
      <column label="爱好" name="getData" type="String" xid="xid8"/>  
      <column label="爱好" name="dynamic" type="String" xid="xid10"/>  
      <column label="自定义" name="custom" type="String" xid="xid12"/>  
      <column label="数值" name="num" type="Boolean" xid="xid2"/>  
      <data xid="default1">[{"hobby":"足球","interesting":"爬山","default":"爬山","enable":"足球","getData":"足球","dynamic":"足球","custom":"游泳"},{"hobby":"篮球","interesting":"跑步","default":"跑步","enable":"篮球","getData":"篮球","dynamic":"篮球","custom":"运动"},{"hobby":"排球","interesting":"听歌","enable":"排球","getData":"排球","dynamic":"排球","custom":"健身"}]</data>  
      <rule xid="rule1"> 
        <col name="hobby" xid="ruleCol1"> 
          <readonly xid="readonly1"> 
            <expr xid="default2"/>
          </readonly> 
        </col>  
        <col name="enable" xid="ruleCol2"> 
          <readonly xid="readonly2"> 
            <expr xid="default3">$model.defaultData.val("enable")</expr>
          </readonly> 
        </col> 
      </rule>
    </div>  
    <div component="$UI/system/components/justep/data/data" autoLoad="true"
      xid="defaultData" idColumn="interesting"> 
      <column label="兴趣" name="interesting" type="String" xid="xid7"/>  
      <column label="值" name="value" type="String" xid="xid9"/>  
      <data xid="default4">[{"interesting":"跑步 爬山","value":""}]</data>  
      <column label="动态" name="dynamic" type="String" xid="xid11"/>  
      <column label="返回" name="enable" type="Boolean" xid="xid3"/>
    </div>  
    <div component="$UI/system/components/justep/data/data" autoLoad="true"
      xid="createData" idColumn="create"> 
      <column label="创建" name="create" type="String" xid="xid13"/>  
      <column label="兴趣" name="hobby" type="String" xid="xid14"/>  
      <data xid="default5">[{}]</data> 
    </div> 
  </div>  
  <div component="$UI/system/components/justep/contents/contents" class="x-contents x-full"
    active="0" xid="contents"> 
    <div class="x-contents-content" xid="content1"> 
      <h4 xid="h41"><![CDATA[多选按钮  
   ]]>
  <a component="$UI/system/components/justep/button/button" label="js" xid="jdBtn" class="btn btn-link" onClick="jdBtnClick">
   <i xid="i9"></i>
   <span xid="span16">js</span></a><a component="$UI/system/components/justep/button/button" class="btn btn-link " label="源码" xid="sourceBtn" bind-visible="isVisible" onClick="sourceClick">
   <i xid="i2"></i>
   <span xid="span6">源码</span></a>
  </h4><div component="$UI/system/components/justep/controlGroup/controlGroup"
        class="x-control-group" title="1.点击进行选中" xid="controlGroup1" collapsible="true"> 
        <div class="x-control-group-title" xid="controlGroupTitle1"> 
          <span xid="span5"/> 
        </div>  
        <div component="$UI/system/components/bootstrap/row/row" class="row"
          xid="row1"> 
          <div class="col-sm-6 pull-left" xid="col1"> 
            <div component="$UI/system/components/justep/labelEdit/labelEdit"
              class="x-label-edit x-label30" xid="labelCheckboxGroup1" style="height:68px;width:309px;"> 
              <label class="x-label" xid="label1" bind-text="basicData.label('hobby')"/>  
              <span component="$UI/system/components/justep/select/checkboxGroup"
                class="x-checkboxs x-edit" xid="checkboxGroup1" bind-itemset="basicData"
                bind-itemsetValue="ref('hobby')" bind-itemsetLabel="ref('hobby')"/> 
            </div> 
          </div> 
        </div> 
      </div>  
      <div component="$UI/system/components/justep/controlGroup/controlGroup"
        class="x-control-group" title="2.设置初始值" xid="controlGroup2" collapsible="true"> 
        <div class="x-control-group-title" xid="controlGroupTitle2"> 
          <span xid="span1"/> 
        </div>  
        <div component="$UI/system/components/bootstrap/row/row" class="row"
          xid="row2"> 
          <div class="col-sm-6 pull-left" xid="col2"> 
            <div component="$UI/system/components/justep/labelEdit/labelEdit"
              class="x-label-edit x-label30" xid="labelCheckboxGroup2" style="height:68px;width:309px;"> 
              <label class="x-label" xid="label2" bind-text="basicData.label('interesting')"/>  
              <span component="$UI/system/components/justep/select/checkboxGroup"
                class="x-checkboxs x-edit" xid="checkboxGroup2" bind-itemset="basicData"
                bind-itemsetValue="ref('interesting')" bind-itemsetLabel="ref('interesting')"
                bind-ref="defaultData.ref('interesting')"/> 
            </div> 
          </div> 
        </div> 
      </div>  
      <div component="$UI/system/components/justep/controlGroup/controlGroup"
        class="x-control-group" title="3.动态选中" xid="controlGroup3" collapsible="true"> 
        <div class="x-control-group-title" xid="controlGroupTitle3"> 
          <span xid="span2"/> 
        </div>  
        <div component="$UI/system/components/bootstrap/row/row" class="row"
          xid="row3"> 
          <div class="col-sm-6 pull-left" xid="dynamicCol"> 
            <div component="$UI/system/components/justep/labelEdit/labelEdit"
              class="x-label-edit x-label30" xid="labelCheckboxGroup3" style="height:68px;width:309px;"> 
              <label class="x-label" xid="label3" bind-text="basicData.label('hobby')"/>  
              <span component="$UI/system/components/justep/select/checkboxGroup"
                class="x-checkboxs x-edit" xid="checkboxGroup3" bind-itemset="basicData"
                bind-itemsetValue="ref('dynamic')" bind-itemsetLabel="ref('dynamic')"
                bind-ref="defaultData.ref('dynamic')"/> 
            </div>  
            <a component="$UI/system/components/justep/button/button" class="btn btn-default"
              label="我都喜欢" xid="likeBallBtn" onClick="likeBallBtnClick"> 
              <i xid="i5"/>  
              <span xid="span11">我都喜欢</span> 
            </a>  
            <a component="$UI/system/components/justep/button/button" class="btn btn-default"
              label="喜欢篮球" xid="likeBasketballBtn" onClick="likeBasketballBtnClick"> 
              <i xid="i6"/>  
              <span xid="span12">喜欢篮球</span> 
            </a>  
            <a component="$UI/system/components/justep/button/button" class="btn btn-default"
              label="都不喜欢" xid="dislike" onClick="dislikeClick"> 
              <i xid="i7"/>  
              <span xid="span13">都不喜欢</span> 
            </a> 
          </div> 
        </div> 
      </div>  
      <div component="$UI/system/components/justep/controlGroup/controlGroup"
        class="x-control-group" title="4.禁用 启用" xid="controlGroup4" collapsible="true"> 
        <div class="x-control-group-title" xid="controlGroupTitle4"> 
          <span xid="span3"/> 
        </div>  
        <div component="$UI/system/components/bootstrap/row/row" class="row"
          xid="row4"> 
          <div class="col-sm-6 pull-left" xid="col4"> 
            <div component="$UI/system/components/justep/labelEdit/labelEdit"
              class="x-label-edit x-label30" xid="labelCheckboxGroup4" style="height:68px;width:309px;"> 
              <label class="x-label" xid="label4" bind-text="basicData.label('hobby')"/>  
              <span component="$UI/system/components/justep/select/checkboxGroup"
                class="x-checkboxs x-edit" xid="checkboxGroup" bind-itemset="basicData"
                bind-itemsetValue="ref('enable')" bind-itemsetLabel="ref('enable')"/> 
            </div>  
            <a component="$UI/system/components/justep/button/button" class="btn btn-link"
              label="启用" xid="enableBtn" style="width:49px;" onClick="enableBtnClick"> 
              <i xid="i1"/>  
              <span xid="span4">启用</span> 
            </a>  
            <a component="$UI/system/components/justep/button/button" class="btn btn-link"
              label="禁用" xid="disabledBtn" onClick="disabledBtnClick"> 
              <i xid="i3"/>  
              <span xid="span7">禁用</span> 
            </a> 
          </div> 
        </div> 
      </div>  
      <div component="$UI/system/components/justep/controlGroup/controlGroup"
        class="x-control-group" title="5.获取选中值" xid="controlGroup5" collapsible="true"> 
        <div class="x-control-group-title" xid="controlGroupTitle6"> 
          <span xid="span9"/> 
        </div>  
        <div component="$UI/system/components/bootstrap/row/row" class="row"
          xid="row6"> 
          <div class="col-sm-6 pull-left" xid="col6"> 
            <div component="$UI/system/components/justep/labelEdit/labelEdit"
              class="x-label-edit x-label30" xid="labelCheckboxGroup6" style="height:68px;width:309px;"> 
              <label class="x-label" xid="label6" bind-text="basicData.label('hobby')"/>  
              <span component="$UI/system/components/justep/select/checkboxGroup"
                class="x-checkboxs x-edit" xid="checkboxGroupValue" bind-itemset="basicData"
                bind-itemsetValue="ref('hobby')" bind-itemsetLabel="ref('hobby')"
                bind-ref="defaultData.ref('value')"/> 
            </div>  
            <a component="$UI/system/components/justep/button/button" class="btn btn-link"
              label="获取选种值" xid="getValueBtn" onClick="getValueBtnClick"> 
              <i xid="i4"/>  
              <span xid="span10">获取选种值</span> 
            </a> 
          </div> 
        </div> 
      </div>  
      <div component="$UI/system/components/justep/controlGroup/controlGroup"
        class="x-control-group" title="6.自定义样式" xid="controlGroup6" collapsible="true"> 
        <div class="x-control-group-title" xid="controlGroupTitle7"> 
          <span xid="span15"/> 
        </div>  
        <div component="$UI/system/components/bootstrap/row/row" class="row"
          xid="row7"> 
          <div class="col-sm-6 pull-left" xid="col7"> 
            <div component="$UI/system/components/justep/labelEdit/labelEdit"
              class="x-label-edit x-label30" xid="labelCheckboxGroup7" style="height:68px;width:526px;"> 
              <label class="x-label" xid="label7" bind-text="basicData.label('custom')"
                style="width:92px;"/>  
              <span component="$UI/system/components/justep/select/checkboxGroup"
                class="x-checkbox-group x-checkbox-group-lg bg-success x-checkboxs x-edit"
                xid="checkboxGroup7" bind-itemset="basicData" bind-itemsetValue="ref('custom')"
                bind-itemsetLabel="ref('custom')" style="width:290px;"/> 
            </div> 
          </div> 
        </div> 
      </div> 
    </div> 
  </div> 
</div>
