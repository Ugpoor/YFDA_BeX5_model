<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window" component="$UI/system/components/justep/window/window"
  design="device:pc">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:501px;top:69px;"
    onModelConstructDone="modelModelConstructDone"> 
    <div component="$UI/system/components/justep/data/data" autoLoad="true"
      xid="wxset" idColumn="id" onCustomRefresh="wxsetCustomRefresh" confirmDelete="false"
      onValueChanged="wxsetValueChanged"> 
      <column label="id" name="id" type="String" xid="xid12"/>  
      <column label="企业号" name="corpId" type="String" xid="column1"/>  
      <column label="密钥" name="corpSecret" type="String" xid="column2"/>  
      <column label="应用ID" name="agentId" type="String" xid="xid3"/>  
      <column label="token" name="token" type="String" xid="xid4"/>  
      <column label="aesKey" name="aesKey" type="String" xid="xid5"/>  
      <column label="accessToken" name="accessToken" type="String" xid="xid6"/>  
      <column label="expiresIn" name="expiresIn" type="String" xid="xid7"/>  
      <column label="userId" name="userId" type="String" xid="xid8"/>  
      <column label="部门ID" name="departmentId" type="String" xid="xid9"/>  
      <column label="tagId" name="tagId" type="String" xid="xid10"/>  
      <column label="可信域名" name="callbackDomain" type="String" xid="xid11"/>  
      <rule xid="rule1"> 
        <col name="corpId" xid="ruleCol1"> 
          <required xid="required1"> 
            <expr xid="default4">true</expr> 
          </required> 
        </col>  
        <col name="corpSecret" xid="ruleCol2"> 
          <required xid="required2"> 
            <expr xid="default5">true</expr> 
          </required> 
        </col>  
        <col name="agentId" xid="ruleCol3"> 
          <required xid="required3"> 
            <expr xid="default6">true</expr> 
          </required> 
        </col>  
        <col name="token" xid="ruleCol4"> 
          <required xid="required4"> 
            <expr xid="default7">true</expr> 
          </required> 
        </col>  
        <col name="aesKey" xid="ruleCol5"> 
          <required xid="required5"> 
            <expr xid="default8">true</expr> 
          </required> 
        </col>  
        <col name="userId" xid="ruleCol6"> 
          <required xid="required6"> 
            <expr xid="default9"/> 
          </required> 
        </col>  
        <col name="callbackDomain" xid="ruleCol7"> 
          <required xid="required7"> 
            <expr xid="default10">true</expr> 
          </required> 
        </col>  
        <col name="accessToken" xid="ruleCol8"> 
          <calculate xid="calculate1"> 
            <expr xid="default11"/> 
          </calculate> 
        </col>  
        <col name="expiresIn" xid="ruleCol9"> 
          <calculate xid="calculate2"> 
            <expr xid="default12"/> 
          </calculate> 
        </col>  
        <col name="departmentId" xid="ruleCol10"> 
          <calculate xid="calculate3"> 
            <expr xid="default13"/> 
          </calculate> 
        </col>  
        <col name="tagId" xid="ruleCol11"> 
          <calculate xid="calculate4"> 
            <expr xid="default14"/> 
          </calculate> 
        </col> 
      </rule> 
    </div>  
    <div component="$UI/system/components/justep/data/bizData" autoLoad="true"
      xid="WeixinCp" concept="SA_WeixinCp"> 
      <reader xid="default17" action="/SA/weixin/logic/action/querySA_WeixinCpAction"/>  
      <writer xid="default18" action="/SA/weixin/logic/action/saveSA_WeixinCpAction"/>  
      <creator xid="default19" action="/SA/weixin/logic/action/createSA_WeixinCpAction"/> 
    </div>  
    <div component="$UI/system/components/justep/data/data" autoLoad="false"
      xid="treedata" idColumn="id" onCreate="treedataCreate" onCustomRefresh="treedataCustomRefresh"
      onValueChanged="treedataValueChanged"> 
      <data xid="default1">[]</data>  
      <data xid="default1">[]</data>  
      <data xid="default1">[]</data>  
      <data xid="default1">[]</data>  
      <data xid="default1">[]</data>  
      <data xid="default1">[]</data>  
      <data xid="default1">[]</data>  
      <data xid="default1">[]</data>  
      <column label="名称" name="Name" type="String" xid="default2"/>  
      <column label="微信URL" name="URL" type="String" xid="default3"/>  
      <column label="id" name="id" type="String" xid="column16"/>  
      <column label="父" name="parent" type="String" xid="column13"/>  
      <column label="层级" name="level" type="String" xid="column19"/>  
      <column label="功能路径" name="path" type="String" xid="column17"/>  
      <column label="功能URL" name="funcURL" type="String" xid="default15"/>  
      <column label="configKey" name="configKey" type="String" xid="xid2"/>  
      <rule xid="rule2"> 
        <col name="path" xid="ruleCol12"> 
          <readonly xid="readonly1"> 
            <expr xid="default16"/> 
          </readonly> 
        </col> 
      </rule> 
    </div>  
    <div component="$UI/system/components/justep/data/data" autoLoad="false"
      xid="callbackData" idColumn="callbackURL" autoNew="true"> 
      <column label="回调地址" name="callbackURL" type="String" xid="xid1"/> 
    </div> 
  </div>  
  <div component="$UI/system/components/bootstrap/row/row" class="row" xid="row2"
    style="width:99%;"/>  
  <div component="$UI/system/components/bootstrap/row/row" class="row" xid="row4"
    style="width:99%;"> 
    <div class="col col-xs-8 col-sm-8 col-md-8 col-lg-8" xid="col2"> 
      <div component="$UI/system/components/bootstrap/row/row" class="row"
        xid="row12"> 
        <div class="col col-xs-12 col-sm-12 col-md-12 col-lg-12" xid="col17"> 
          <span xid="span4"><![CDATA[第一步：配置应用]]></span> 
        </div> 
      </div>  
      <div component="$UI/system/components/bootstrap/row/row" class="row"
        xid="row8"> 
        <div class="col col-xs-1" xid="col20"/>  
        <div class="col col-xs-10 col-sm-10 col-md-10 col-lg-10" xid="col5"> 
          <form class="form-horizontal" xid="form2"> 
            <div class="form-group" xid="formGroup2"> 
              <label class="col-xs-3 control-label" style="word-spacing:20px;padding-top: 12px;"
                xid="controlLabel1"><![CDATA[CorpID]]></label>  
              <div class="col-xs-9" xid="col50"> 
                <input component="$UI/system/components/justep/input/input" class="form-control x-edit"
                  xid="input11" bind-ref="wxset.ref('corpId')"/>
              </div> 
            </div>  
            <div class="form-group" xid="formGroup3"> 
              <label class="col-xs-3 control-label" style="word-spacing:20px;padding-top: 12px;"
                xid="controlLabel2"><![CDATA[Secret]]></label>  
              <div class="col-xs-9" xid="col51"> 
                <input component="$UI/system/components/justep/input/input" class="form-control x-edit"
                  xid="input12" bind-ref="wxset.ref('corpSecret')"/>
              </div> 
            </div>  
            <div class="form-group" xid="formGroup5"> 
              <label class="col-xs-3 control-label" xid="controlLabel4"><![CDATA[微信管理员账号]]></label>
              <div xid="col53" class="col-xs-9">
                <input type="text" class="form-control" component="$UI/system/components/justep/input/input"
                  xid="input13" bind-ref="wxset.ref('userId')"/>
              </div> 
            </div>  
            <div class="form-group" xid="formGroup6"> 
              <label class="col-xs-3 control-label" xid="controlLabel5"><![CDATA[应用ID]]></label>
              <div class="col-xs-9" xid="col57">
                <input component="$UI/system/components/justep/input/input" class="form-control x-edit"
                  xid="input9" bind-ref="wxset.ref('agentId')"/>
              </div> 
            </div>  
            <div class="form-group" xid="formGroup7"> 
              <label class="col-xs-3 control-label" xid="controlLabel6"><![CDATA[可信域名]]></label>
              <div class="col-xs-9" xid="col61">
                <input component="$UI/system/components/justep/input/input" class="form-control x-edit"
                  xid="input10" bind-ref="wxset.ref('callbackDomain')"/>
              </div> 
            </div>
            <div class="form-group" xid="formGroup4"> 
              <label class="col-xs-3 control-label" style="word-spacing:20px;padding-top: 12px;"
                xid="controlLabel3"><![CDATA[Token]]></label>  
              <div class="col-xs-9" xid="col52"> 
                <div class="input-group" component="$UI/system/components/bootstrap/inputGroup/inputGroup"
                  xid="inputGroup2"> 
                  <input type="text" class="form-control" component="$UI/system/components/justep/input/input"
                    xid="input2" bind-ref="wxset.ref('token')"/>  
                  <div class="input-group-btn" xid="div14"> 
                    <a component="$UI/system/components/justep/button/button"
                      class="btn btn-default" label="随机获取" xid="button3" onClick="button3Click"
                      style="width:77px;"> 
                      <i xid="i24"/>  
                      <span xid="span18">随机获取</span>
                    </a>
                  </div> 
                </div> 
              </div> 
            </div>  
            <div class="form-group" xid="formGroup8"> 
              <label class="col-xs-3 control-label" style="word-spacing:20px;padding-top: 12px;"
                xid="controlLabel7"><![CDATA[EncodingAESKey]]></label>  
              <div class="col-xs-9" xid="col65"> 
                <div class="input-group" component="$UI/system/components/bootstrap/inputGroup/inputGroup"
                  xid="inputGroup1"> 
                  <input type="text" class="form-control" component="$UI/system/components/justep/input/input"
                    xid="input14" bind-ref="wxset.ref('aesKey')"/>  
                  <div class="input-group-btn" xid="div1"> 
                    <a component="$UI/system/components/justep/button/button"
                      class="btn btn-default" label="随机获取" xid="button2" onClick="button2Click"
                      style="width:77px;"> 
                      <i xid="i22"/>  
                      <span xid="span17">随机获取</span>
                    </a>
                  </div> 
                </div> 
              </div> 
            </div>  
            <div class="form-group" xid="formGroup9"> 
              <label class="col-xs-3 control-label" style="word-spacing:20px;padding-top: 12px;"
                xid="controlLabel8"><![CDATA[回调地址]]></label>  
              <div class="col-xs-9" xid="col66"> 
                <div class="input-group" component="$UI/system/components/bootstrap/inputGroup/inputGroup"
                  xid="inputGroup3"> 
                  <input type="text" class="form-control" component="$UI/system/components/justep/input/input"
                    xid="input15" bind-ref="callbackData.ref('callbackURL')"/>  
                  <div class="input-group-btn" xid="div2"> 
                    <a component="$UI/system/components/justep/button/button"
                      class="btn btn-default" label="复制" xid="button1" onClick="button1Click"> 
                      <i xid="i21"/>  
                      <span xid="span16">复制</span>
                    </a>
                  </div> 
                </div> 
              </div> 
            </div>
          </form> 
        </div> 
      </div>  
      <div component="$UI/system/components/bootstrap/row/row" class="row"
        xid="row10"> 
        <div class="col col-xs-1 col-sm-1 col-md-1 col-lg-1" xid="col8"/>  
        <div class="col col-xs-4" xid="col9"> 
          <a component="$UI/system/components/justep/button/button" class="btn x-yellow btn-sm"
            label="保存配置" xid="btnSave" onClick="btnSaveClick" bind-enable="canOK"> 
            <i xid="i1"/>  
            <span xid="span1">保存配置</span> 
          </a> 
        </div>  
        <div class="col col-xs-4" xid="col11"/> 
      </div>  
      <div component="$UI/system/components/bootstrap/row/row" class="row"
        xid="row11"> 
        <div class="col col-xs-12 col-sm-12 col-md-12 col-lg-12" xid="col14"> 
          <span xid="span5"><![CDATA[第二步：数据同步]]></span> 
        </div> 
      </div>  
      <div component="$UI/system/components/bootstrap/row/row" class="row"
        xid="row14"> 
        <div class="col col-xs-1 col-sm-1 col-md-1 col-lg-1" xid="col12"/>  
        <div class="col col-xs-4" xid="col15"> 
          <a component="$UI/system/components/justep/button/button" class="btn x-yellow btn-sm"
            label="同步组织机构" xid="btnOrgSynch" onClick="btnOrgSynchClick"> 
            <i xid="i2"/>  
            <span xid="span2">同步组织机构</span> 
          </a> 
        </div>  
        <div class="col col-xs-4" xid="col18"/> 
      </div>  
   
       
     
      <div component="$UI/system/components/bootstrap/row/row" class="row"
        xid="row13"> 
        <div class="col col-xs-1 col-sm-1 col-md-1 col-lg-1" xid="col28"/>  
        <div class="col col-xs-10 col-sm-10 col-md-10 col-lg-10" xid="col29"> 
          <span xid="span7"><![CDATA[同步操作将在后台执行，执行结果请进入功能“\协同办公\系统工具\操作日志”，以“微信”进行模糊检索]]></span> 
        </div> 
      </div>  
      <div component="$UI/system/components/bootstrap/row/row" class="row"
        xid="row15"> 
        <div class="col col-xs-1 col-sm-1 col-md-1 col-lg-1" xid="col19"/>  
        <div class="col col-xs-4" xid="col30"> 
          <a component="$UI/system/components/justep/button/button" class="btn x-yellow btn-sm"
            label="同步菜单" xid="btnMenuSynch" onClick="btnMenuSynchClick"> 
            <i xid="i4"/>  
            <span xid="span3">同步菜单</span> 
          </a> 
        </div>  
        <div class="col col-xs-4" xid="col31"/> 
      </div>  
      <div component="$UI/system/components/bootstrap/row/row" class="row"
        xid="row16"> 
        <div class="col col-xs-1" xid="col46"/>  
        <div class="col col-xs-10 col-sm-10 col-md-10 col-lg-10" xid="col37"> 
          <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
            label="新建菜单" xid="btnNewMenu" icon="icon-android-add" onClick="btnNewMenuClick"> 
            <i xid="i15" class="icon-android-add"/>  
            <span xid="span11">新建菜单</span> 
          </a>  
          <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
            label="删除" xid="btnDeleteMenu" onClick="btnDeleteMenuClick" icon="icon-android-remove"> 
            <i xid="i11" class="icon-android-remove"/>  
            <span xid="span12">删除</span> 
          </a> 
        </div> 
      </div>  
      <div component="$UI/system/components/bootstrap/row/row" class="row"
        xid="row17"> 
        <div class="col col-xs-1 col-sm-1 col-md-1 col-lg-1" xid="col40"/>  
        <div class="col col-xs-10 col-sm-11 col-md-10 col-lg-10" xid="col41"> 
          <div component="$UI/system/components/justep/grid/grid" hiddenCaptionbar="true"
            xid="grid1" data="treedata" width="100%" directEdit="true" expandColumn="Name"
            height="auto" useVirtualRoot="true" virtualRootLabel="应用菜单" appearance="treeGrid"> 
            <columns xid="columns1"> 
              <column width="200" name="Name" xid="column3" editable="true" label="名称"> 
                <editor xid="editor1"> 
                  <input component="$UI/system/components/justep/input/input"
                    class="form-control" xid="input4" style="width:179px;" bind-ref="ref('Name')"/> 
                </editor> 
              </column>  
              <column width="300" name="path" xid="column4" label="功能路径" editable="true"> 
                <editor xid="editor2">
   <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit" xid="labelEdit1">
    <div class="x-edit" xid="div3">
     <div class="input-group" xid="div4">
      <input component="$UI/system/components/justep/input/input" class="form-control" xid="input1" bind-ref="ref('path')" bind-enable="$model.treedata.val(&quot;path&quot;) != '首页'"></input>
      <span class="input-group-btn" xid="span6">
       <a component="$UI/system/components/justep/button/button" class="btn btn-default" icon="icon-android-search" xid="button4" onClick="button4Click">
        <i class="icon-android-search" xid="i3"></i></a> </span> </div> </div> </div> </editor></column> 
            </columns> 
          </div> 
        </div> 
      </div> 
    </div>  
    <div class="col col-xs-4 col-sm-4 col-md-4 col-lg-4" xid="col6"/> 
  </div>  
  <span component="$UI/system/components/justep/windowDialog/windowDialog" xid="functionDialog"
    src="$UI/SA/OPM/dialogs/selectFunction/selectSingleFunction.w" title="选择功能" onReceive="functionDialogReceive"
    status="normal" width="500px" height="600px" style="left:369px;top:57px;"/> 
</div>
