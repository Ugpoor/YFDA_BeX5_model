<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window" component="$UI/system/components/justep/window/window"
  design="device:pc">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:446px;top:76px;"> 
    <div component="$UI/system/components/justep/data/data" autoLoad="true"
      xid="familyData" idColumn="family"> 
      <column label="名族：" name="family" type="String" xid="xid1"/>  
      <data xid="default2">[{"family":"汉族"},{"family":"回族"},{"family":"彝族"},{"family":"维吾尔族"},{"family":"哈尼族"}]</data> 
    </div>  
    <div component="$UI/system/components/justep/data/data" autoLoad="true"
      xid="userData" idColumn="userName" onCustomRefresh="userDataCustomRefresh" autoNew="false"> 
      <column label="用户名：" name="userName" type="String" xid="xid2"/>  
      <column label="密码：" name="userPwd" type="String" xid="xid3"/>  
      <column label="名族：" name="userFamily" type="String" xid="xid4"/>  
      <column label="电话：" name="userTel" type="String" xid="xid5"/>  
      <column label="QQ：" name="userQQ" type="String" xid="xid6"/>  
      <column label="地址：" name="userAddress" type="String" xid="xid7"/>  
      <column label="邮箱：" name="userEmail" type="String" xid="xid8"/>  
      <column label="爱好：" name="userHobby" type="String" xid="xid9"/>  
      <column label="职业：" name="userJob" type="String" xid="xid10"/>  
      <column label="学历：" name="userEdu" type="String" xid="xid11"/>  
      <data xid="default3">[{"userName":"小明","userPwd":"123","userFamily":"汉族","userTel":"1234565","userQQ":"54322","userAddress":"北京","userEmail":"123@.com","userHobby":"打球","userJob":"软件工程师","userEdu":"本科"}]</data> 
    </div>  
    <div component="$UI/system/components/justep/data/data" autoLoad="true"
      xid="detailData" idColumn="userName" autoNew="false"> 
      <column label="用户名：" name="userName" type="String" xid="column1"/>  
      <column label="密码：" name="userPwd" type="String" xid="column2"/>  
      <column label="名族：" name="userFamily" type="String" xid="column3"/>  
      <column label="电话：" name="userTel" type="String" xid="column4"/>  
      <column label="QQ：" name="userQQ" type="String" xid="column5"/>  
      <column label="地址：" name="userAddress" type="String" xid="column6"/>  
      <column label="邮箱：" name="userEmail" type="String" xid="column7"/>  
      <column label="爱好：" name="userHobby" type="String" xid="column8"/>  
      <column label="职业：" name="userJob" type="String" xid="column9"/>  
      <column label="学历：" name="userEdu" type="String" xid="column10"/>  
      <data xid="default1">[{"userName":"小明","userPwd":"123","userFamily":"汉族","userTel":"1234565","userQQ":"54322","userAddress":"北京","userEmail":"123@.com","userHobby":"打球","userJob":"软件工程师","userEdu":"本科"}]</data>  
      <column label="备注：" name="desc" type="String" xid="xid12"/> 
    </div> 
  </div>  
  <div component="$UI/system/components/justep/contents/contents" class="x-contents x-full"
    active="0" xid="contents"> 
    <div class="x-contents-content" xid="content2"> 
      <div component="$UI/system/components/justep/controlGroup/controlGroup"
        class="x-control-group" title="1、表单的使用" xid="controlGroup4" style="margin-top:10px;"> 
        <div class="x-control-group-title" xid="controlGroupTitle4" style="background-color:white;"> 
          <span xid="span8">1、表单的使用</span> 
        </div>  
        <a component="$UI/system/components/justep/button/button" class="btn btn-link"
          label="js" xid="showJs" onClick="showJsSource" style="margin-left:15px;"> 
          <i xid="i2"/>  
          <span xid="span3">js</span> 
        </a>  
        <a component="$UI/system/components/justep/button/button" class="btn btn-link"
          label="源码" xid="sourceBtn" onClick="sourceBtnClick"> 
          <i xid="i2"/>  
          <span xid="span2">源码</span> 
        </a>  
        <form action="post" method="" xid="form2" class="form"> 
          <div component="$UI/system/components/justep/labelEdit/labelEdit"
            class="x-label-edit x-label30" xid="labelInput3" style="width:300px;"> 
            <label class="x-label" xid="label5" bind-text="userData.label('userName')"/>  
            <input component="$UI/system/components/justep/input/input" class="form-control x-edit"
              xid="input3" bind-ref="userData.ref('userName')" style="width:200px;"/> 
          </div>  
          <div component="$UI/system/components/justep/labelEdit/labelEdit"
            class="x-label-edit x-label30" xid="labelInput3" style="width:300px;"> 
            <label class="x-label" xid="label6" bind-text="userData.label('userPwd')"/>  
            <input component="$UI/system/components/justep/input/input" class="form-control x-edit"
              xid="input3" bind-ref="userData.ref('userPwd')" style="width:200px;"/> 
          </div>  
          <div component="$UI/system/components/justep/labelEdit/labelEdit"
            class="x-label-edit x-label30" xid="labelSelect2" style="width:300px;"> 
            <label class="x-label" xid="label7" bind-text="userData.label('userFamily')"/>  
            <select component="$UI/system/components/justep/select/select" class="form-control x-edit"
              xid="select2" bind-ref="userData.ref('userFamily')" bind-options="familyData"
              bind-optionsValue="family" bind-optionsLabel="family" style="width:200px;"/> 
          </div>  
          <div component="$UI/system/components/justep/labelEdit/labelEdit"
            class="x-label-edit x-label19" xid="labelTextarea2" style="width:500px;"> 
            <label class="x-label" xid="label5" bind-text="userData.label('userAddress')"
              style="width:87px;"/>  
            <textarea component="$UI/system/components/justep/textarea/textarea"
              class="form-control x-edit" xid="textarea2" bind-ref="userData.ref('userAddress')"
              style="width:400px;"/> 
          </div>  
          <div component="$UI/system/components/justep/row/row" class="x-row"
            xid="row2" style="width:400px;"> 
            <div class="x-col" xid="col3"> 
              <a component="$UI/system/components/justep/button/button" class="btn btn-link pull-right"
                label="提交" xid="subBtn"> 
                <i xid="i3"/>  
                <span xid="span4">提交</span> 
              </a> 
            </div>  
            <div class="x-col" xid="col4"> 
              <a component="$UI/system/components/justep/button/button" class="btn btn-link"
                label="重置" xid="clearBtn" onClick="clearBtnClick"> 
                <i xid="i4"/>  
                <span xid="span6">重置</span> 
              </a> 
            </div> 
          </div> 
        </form> 
      </div>  
      <div component="$UI/system/components/justep/controlGroup/controlGroup"
        class="x-control-group" title="2、表单隐藏" xid="controlGroup1" style="margin-top:10px;"> 
        <div class="x-control-group-title" xid="controlGroupTitle1" style="background-color:white;"> 
          <span xid="span7">2、表单隐藏</span>  
          <a component="$UI/system/components/justep/button/button" class="btn btn-link"
            label="隐藏" xid="disableBtn" onClick="disableBtnClick"> 
            <i xid="i7"/>  
            <span xid="span11">隐藏</span> 
          </a> 
        </div>  
        <div class="form-horizontal container-fluid" component="$UI/system/components/bootstrap/form/form"
          xid="disableform" style="margin-left:20px;"> 
          <div component="$UI/system/components/justep/labelEdit/labelEdit"
            class="x-label-edit x-label30" xid="labelInput5" style="width:300px;"> 
            <label class="x-label" xid="label11" bind-text="userData.label('userName')"/>  
            <input component="$UI/system/components/justep/input/input" class="form-control x-edit"
              xid="input5" style="width:200px;"/> 
          </div>  
          <div component="$UI/system/components/justep/labelEdit/labelEdit"
            class="x-label-edit x-label30" xid="labelInput5" style="width:300px;"> 
            <label class="x-label" xid="label12" bind-text="userData.label('userPwd')"/>  
            <input component="$UI/system/components/justep/input/input" class="form-control x-edit"
              xid="input5" style="width:200px;"/> 
          </div>  
          <div component="$UI/system/components/justep/labelEdit/labelEdit"
            class="x-label-edit x-label30" xid="labelSelect4" style="width:300px;"> 
            <label class="x-label" xid="label13" bind-text="userData.label('userFamily')"/>  
            <select component="$UI/system/components/justep/select/select" class="form-control x-edit"
              xid="select4" bind-options="familyData" bind-optionsValue="family" bind-optionsLabel="family"
              style="width:200px;"/> 
          </div>  
          <div component="$UI/system/components/justep/labelEdit/labelEdit"
            class="x-label-edit x-label19" xid="labelTextarea4" style="width:500px;"> 
            <label class="x-label" xid="label11" bind-text="userData.label('userAddress')"
              style="width:87px;"/>  
            <textarea component="$UI/system/components/justep/textarea/textarea"
              class="form-control x-edit" xid="textarea4" style="width:400px;"/> 
          </div>  
          <div component="$UI/system/components/justep/row/row" class="x-row"
            xid="row4" style="width:400px;"> 
            <div class="x-col" xid="col8"> 
              <a component="$UI/system/components/justep/button/button" class="btn btn-link pull-right"
                label="提交" xid="submitBtn"> 
                <i xid="i8"/>  
                <span xid="span12">提交</span> 
              </a> 
            </div>  
            <div class="x-col" xid="col7"> 
              <a component="$UI/system/components/justep/button/button" class="btn btn-link"
                label="重置" xid="regestBtn" onClick="clearBtnClick"> 
                <i xid="i9"/>  
                <span xid="span13">重置</span> 
              </a> 
            </div> 
          </div> 
        </div> 
      </div>  
      <div component="$UI/system/components/justep/controlGroup/controlGroup"
        class="x-control-group" title="3、表单的使用,存放详细信息" xid="controlGroup2" style="margin-top:10px;"> 
        <div class="x-control-group-title" xid="controlGroupTitle2" style="background-color:white;"> 
          <span xid="span14">3、表单的使用,存放详细信息</span> 
        </div>  
        <form action="post" method="" xid="form5" class="form"> 
          <div component="$UI/system/components/justep/row/row" class="x-row"
            xid="row7"> 
            <div class="x-col" xid="col15"> 
              <label xid="label20" bind-text="detailData.label('userName')" class="pull-right">label</label> 
            </div>  
            <div class="x-col" xid="col16"> 
              <div component="$UI/system/components/justep/output/output" class="x-output"
                xid="output3" bind-ref="detailData.ref('userName')"/> 
            </div>  
            <div class="x-col" xid="col17"> 
              <label xid="label21" bind-text="detailData.label('userPwd')" class="pull-right">label</label> 
            </div>  
            <div class="x-col" xid="col18"> 
              <div component="$UI/system/components/justep/output/output" class="x-output"
                xid="output4" bind-ref="detailData.ref('userPwd')"/> 
            </div> 
          </div>  
          <div component="$UI/system/components/justep/row/row" class="x-row"
            xid="row8"> 
            <div class="x-col" xid="col22"> 
              <label xid="label22" bind-text="detailData.label('userFamily')"
                class="pull-right">label</label> 
            </div>  
            <div class="x-col" xid="col21"> 
              <div component="$UI/system/components/justep/output/output" class="x-output"
                xid="output6" bind-ref="detailData.ref('userFamily')"/> 
            </div>  
            <div class="x-col" xid="col20"> 
              <label xid="label23" bind-text="detailData.label('userTel')" class="pull-right">label</label> 
            </div>  
            <div class="x-col" xid="col19"> 
              <div component="$UI/system/components/justep/output/output" class="x-output"
                xid="output5" bind-ref="detailData.ref('userTel')"/> 
            </div> 
          </div>  
          <div component="$UI/system/components/justep/row/row" class="x-row"
            xid="row9"> 
            <div class="x-col" xid="col26"> 
              <label xid="label24" bind-text="detailData.label('userQQ')" class="pull-right">label</label> 
            </div>  
            <div class="x-col" xid="col25"> 
              <div component="$UI/system/components/justep/output/output" class="x-output"
                xid="output8" bind-ref="detailData.ref('userQQ')"/> 
            </div>  
            <div class="x-col" xid="col24"> 
              <label xid="label25" bind-text="detailData.label('userAddress')"
                class="pull-right">label</label> 
            </div>  
            <div class="x-col" xid="col23"> 
              <div component="$UI/system/components/justep/output/output" class="x-output"
                xid="output7" bind-ref="detailData.ref('userAddress')"/> 
            </div> 
          </div>  
          <div component="$UI/system/components/justep/row/row" class="x-row"
            xid="row10"> 
            <div class="x-col" xid="col30"> 
              <label xid="label26" bind-text="detailData.label('userEmail')"
                class="pull-right">label</label> 
            </div>  
            <div class="x-col" xid="col29"> 
              <div component="$UI/system/components/justep/output/output" class="x-output"
                xid="output10" bind-ref="detailData.ref('userEmail')"/> 
            </div>  
            <div class="x-col" xid="col28"> 
              <label xid="label27" bind-text="detailData.label('userHobby')"
                class="pull-right">label</label> 
            </div>  
            <div class="x-col" xid="col27"> 
              <div component="$UI/system/components/justep/output/output" class="x-output"
                xid="output9" bind-ref="detailData.ref('userHobby')"/> 
            </div> 
          </div>  
          <div component="$UI/system/components/justep/row/row" class="x-row"
            xid="row11"> 
            <div class="x-col" xid="col34"> 
              <label xid="label28" bind-text="detailData.label('userJob')" class="pull-right">label</label> 
            </div>  
            <div class="x-col" xid="col33"> 
              <div component="$UI/system/components/justep/output/output" class="x-output"
                xid="output12" bind-ref="detailData.ref('userJob')"/> 
            </div>  
            <div class="x-col" xid="col32"> 
              <label xid="label29" bind-text="detailData.label('userEdu')" class="pull-right">label</label> 
            </div>  
            <div class="x-col" xid="col31"> 
              <div component="$UI/system/components/justep/output/output" class="x-output"
                xid="output11" bind-ref="detailData.ref('userEdu')"/> 
            </div> 
          </div> 
        </form> 
      </div>  
      <div component="$UI/system/components/justep/controlGroup/controlGroup"
        class="x-control-group" title="4、双列布局" xid="controlGroup5" style="margin-top:10px;"> 
        <div class="x-control-group-title" xid="controlGroupTitle5" style="background-color:white;"> 
          <span xid="span18">4、双列布局</span> 
        </div>  
        <form action="post" method="" xid="form6" class="form"> 
          <div component="$UI/system/components/justep/row/row" class="x-row"
            xid="row14"> 
            <div class="x-col" xid="col41"> 
              <label xid="label35" bind-text="detailData.label('userName')" class="pull-right">label</label> 
            </div>  
            <div class="x-col" xid="col42"> 
              <input component="$UI/system/components/justep/input/input" class="form-control"
                xid="input8" bind-ref="detailData.ref('userName')"/> 
            </div>  
            <div class="x-col" xid="col43"> 
              <label xid="label36" bind-text="detailData.label('userName')" class="pull-right">label</label> 
            </div>  
            <div class="x-col" xid="col53"> 
              <input component="$UI/system/components/justep/input/input" class="form-control"
                xid="input9" bind-ref="detailData.ref('userPwd')"/> 
            </div> 
          </div>  
          <div component="$UI/system/components/justep/row/row" class="x-row"
            xid="row15"> 
            <div class="x-col" xid="col44"> 
              <label xid="label37" bind-text="detailData.label('userFamily')"
                class="pull-right">label</label> 
            </div>  
            <div class="x-col" xid="col45"> 
              <input component="$UI/system/components/justep/input/input" class="form-control"
                xid="input10" bind-ref="detailData.ref('userFamily')"/> 
            </div>  
            <div class="x-col" xid="col46"> 
              <label xid="label38" bind-text="detailData.label('userTel')" class="pull-right">label</label> 
            </div>  
            <div class="x-col" xid="col54"> 
              <input component="$UI/system/components/justep/input/input" class="form-control"
                xid="input11" bind-ref="detailData.ref('userTel')"/> 
            </div> 
          </div>  
          <div component="$UI/system/components/justep/row/row" class="x-row"
            xid="row16"> 
            <div class="x-col" xid="col47"> 
              <label xid="label39" bind-text="detailData.label('userQQ')" class="pull-right">label</label> 
            </div>  
            <div class="x-col" xid="col48"> 
              <input component="$UI/system/components/justep/input/input" class="form-control"
                xid="input12" bind-ref="detailData.ref('userQQ')"/> 
            </div>  
            <div class="x-col" xid="col49"> 
              <label xid="label40" bind-text="detailData.label('userAddress')"
                class="pull-right">label</label> 
            </div>  
            <div class="x-col" xid="col55"> 
              <input component="$UI/system/components/justep/input/input" class="form-control"
                xid="input14" bind-ref="detailData.ref('userAddress')"/> 
            </div> 
          </div>  
          <div component="$UI/system/components/justep/row/row" class="x-row"
            xid="row17"> 
            <div class="x-col x-col-25" xid="col50"> 
              <label xid="label41" bind-text="detailData.label('desc')" class="pull-right">label</label> 
            </div>  
            <div class="x-col" xid="col51"> 
              <textarea component="$UI/system/components/justep/textarea/textarea"
                class="form-control" xid="textarea7"/> 
            </div> 
          </div>  
          <div component="$UI/system/components/justep/row/row" class="x-row"
            xid="row13" style="width:400px;"> 
            <div class="x-col" xid="col40"> 
              <a component="$UI/system/components/justep/button/button" class="btn btn-link pull-right"
                label="提交" xid="submBtn"> 
                <i xid="i13"/>  
                <span xid="span20">提交</span> 
              </a> 
            </div>  
            <div class="x-col" xid="col39"> 
              <a component="$UI/system/components/justep/button/button" class="btn btn-link"
                label="重置" xid="regestBotton" onClick="clearBtnClick"> 
                <i xid="i12"/>  
                <span xid="span19">重置</span> 
              </a> 
            </div> 
          </div> 
        </form> 
      </div> 
    </div> 
  </div> 
</div>
