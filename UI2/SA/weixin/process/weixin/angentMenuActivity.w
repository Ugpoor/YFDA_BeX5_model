<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window" component="$UI/system/components/justep/window/window"
  design="device:pc">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:249px;top:304px;"> 
    <div component="$UI/system/components/justep/data/data" autoLoad="true"
      xid="wxset" idColumn="id" onValueChanged="wxsetValueChanged"> 
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
      <column label="返回域" name="callbackDomain" type="String" xid="xid11"/>  
      <column label="传入应用ID" name="oldagentId" type="String" xid="xid1"/> 
    </div>  
    <div component="$UI/system/components/justep/data/data" autoLoad="false"
      xid="treedata" idColumn="id" onCreate="treedataCreate" onCustomRefresh="treedataCustomRefresh"
      onValueChanged="treedataValueChanged"> 
      <data xid="default1">[]</data>  
      <data xid="default1">[]</data>  
      <column label="名称" name="Name" type="String" xid="default2"/>  
      <column label="微信URL" name="URL" type="String" xid="default3"/>  
      <column label="id" name="id" type="String" xid="column16"/>  
      <column label="父" name="parent" type="String" xid="column13"/>  
      <column label="层级" name="level" type="String" xid="column19"/>  
      <column label="功能路径" name="path" type="String" xid="column17"/>  
      <column label="功能URL" name="funcURL" type="String" xid="default15"/> 
    </div> 
  </div>  
  <div component="$UI/system/components/justep/panel/panel" class="x-panel x-full"
    xid="panel1"> 
    <div class="x-panel-content" xid="content1"> 
      <div component="$UI/system/components/bootstrap/row/row" class="row"
        xid="row4" style="width:99%;"> 
        <div class="col col-xs-6 col-sm-6 col-md-6 col-lg-6" xid="col3"> 
          <div component="$UI/system/components/bootstrap/row/row" class="row"
            xid="row1"> 
            <div class="col col-xs-12 col-sm-12 col-md-12 col-lg-12" xid="col1"> 
              <div component="$UI/system/components/justep/labelEdit/labelEdit"
                class="x-label-edit" xid="labelEdit2"> 
                <label class="x-label" xid="label2" style="width:120px;"><![CDATA[应用ID]]></label>  
                <div class="x-edit" xid="div2"> 
                  <input component="$UI/system/components/justep/input/input"
                    class="form-control" xid="iptagentId" bind-ref="wxset.ref('agentId')"/> 
                </div> 
              </div> 
            </div> 
          </div>  
          
          <div component="$UI/system/components/bootstrap/row/row" class="row"
            xid="row2"> 
            <div class="col col-xs-12 col-sm-12 col-md-12 col-lg-12" xid="col4"> 
              <div component="$UI/system/components/justep/labelEdit/labelEdit"
                class="x-label-edit" xid="labelEdit3"> 
                <label class="x-label" xid="label3" style="width:120px;"><![CDATA[可信域名]]></label>  
                <div class="x-edit" xid="div3"> 
                  <input component="$UI/system/components/justep/input/input"
                    class="form-control" xid="iptcallbackDomain" bind-ref="wxset.ref('callbackDomain')"/>
                </div> 
              </div>
            </div> 
          </div>  
           <div component="$UI/system/components/bootstrap/row/row" class="row"
            xid="row5"> 
            <div class="col col-xs-12 col-sm-12 col-md-12 col-lg-12" xid="col10">
              <div component="$UI/system/components/justep/labelEdit/labelEdit"
                class="x-label-edit" xid="labelEdit4"> 
                <label class="x-label" xid="label4" style="width:120px;"><![CDATA[Secret]]></label>  
                <div class="x-edit" xid="div4"> 
                  <input component="$UI/system/components/justep/input/input"
                    class="form-control" xid="iptcorpSecret" bind-ref="wxset.ref('corpSecret')"/>
                </div> 
              </div>
            </div> 
          </div>  
          <div component="$UI/system/components/bootstrap/row/row" class="row"
            xid="row3"> 
            <div class="col col-xs-12 col-sm-12 col-md-12 col-lg-12" xid="col7"> 
              <div component="$UI/system/components/justep/labelEdit/labelEdit"
                class="x-label-edit" xid="labelEdit1"> 
                <label class="x-label" xid="label1" style="width:120px;"><![CDATA[微信管理员账号]]></label>  
                <div class="x-edit" xid="div1"> 
                  <input component="$UI/system/components/justep/input/input"
                    class="form-control" xid="iptuserId" bind-ref="wxset.ref('userId')"/>
                </div> 
              </div>
            </div> 
          </div>  
         
          <div component="$UI/system/components/bootstrap/row/row" class="row"
            xid="row6"> 
            <div class="col col-xs-12 col-sm-12 col-md-12 col-lg-12" xid="col13">
              <div component="$UI/system/components/justep/labelEdit/labelEdit"
                class="x-label-edit" xid="labelEdit5"> 
                <label class="x-label" xid="label5" style="width:120px;"><![CDATA[Token]]></label>  
                <div class="x-edit" xid="div5"> 
                  <input component="$UI/system/components/justep/input/input"
                    class="form-control" xid="ipttoken" bind-ref="wxset.ref('token')"/>
                </div> 
              </div>
            </div> 
          </div>  
          <div component="$UI/system/components/bootstrap/row/row" class="row"
            xid="row7"> 
            <div class="col col-xs-12 col-sm-12 col-md-12 col-lg-12" xid="col16">
              <div component="$UI/system/components/justep/labelEdit/labelEdit"
                class="x-label-edit" xid="labelEdit6"> 
                <label class="x-label" xid="label6" style="width:120px;"><![CDATA[EncodingAESKey]]></label>  
                <div class="x-edit" xid="div6"> 
                  <input component="$UI/system/components/justep/input/input"
                    class="form-control" xid="iptaesKey" bind-ref="wxset.ref('aesKey')"/>
                </div> 
              </div>
            </div> 
          </div> 
        </div>  
        <div class="col col-xs-6 col-sm-6 col-md-6 col-lg-6" xid="col6"> 
          <div component="$UI/system/components/justep/toolBar/toolBar" class="x-toolbar form-inline x-toolbar-spliter"
            xid="toolBar1"> 
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
          <div component="$UI/system/components/justep/grid/grid" hiddenCaptionbar="true"
            xid="grid1" data="treedata" width="95%" directEdit="true" expandColumn="Name"
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
                  <div class="input-group" xid="inputGroup1" style="width:100%;"> 
                    <input type="text" class="form-control" xid="input2" bind-ref="dDoc.ref('fKeyword')"
                      style="border-right-style:none;width:90%;" bind-value="ref('path')"/>  
                    <div class="input-group-addon" xid="span14" style="background-color:transparent;border-left-style:none;"
                      bind-click="span14Click"> 
                      <i xid="i1" class="icon-android-search"/> 
                    </div> 
                  </div> 
                </editor> 
              </column> 
            </columns> 
          </div> 
        </div> 
      </div> 
    </div>  
    <div class="x-panel-bottom" xid="bottom1"> 
      <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-only-label x-dialog-button"
        label="取消" xid="cancelBtn" onClick="{&quot;operation&quot;:&quot;windowReceiver.windowCancel&quot;}"> 
        <i xid="i3"/>  
        <span xid="span1">取消</span> 
      </a>  
      <a component="$UI/system/components/justep/button/button" class="btn btn-primary x-dialog-button"
        label="确定" xid="okBtn" onClick="okBtnClick"> 
        <i xid="i2"/>  
        <span xid="span2">确定</span> 
      </a> 
    </div> 
  </div>  
  <span component="$UI/system/components/justep/windowReceiver/windowReceiver"
    xid="windowReceiver" onReceive="windowReceiverReceive" style="left:128px;top:417px;"/>  
  <span component="$UI/system/components/justep/windowDialog/windowDialog" xid="functionDialog"
    src="$UI/SA/OPM/dialogs/selectFunction/selectSingleFunction.w" title="选择功能" onReceive="functionDialogReceive"
    status="normal" width="500px" height="600px" style="left:369px;top:57px;"/> 
</div>
