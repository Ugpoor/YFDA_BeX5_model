<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window" component="$UI/system/components/justep/window/window">  
  <div component="$UI/system/components/justep/toolBar/toolBar" class="x-toolbar x-toolbar-spliter" xid="toolBar1"><a component="$UI/system/components/justep/button/button" class="btn btn-link" label="新增" xid="newDocNameSpaceBtn" onClick="newDocNameSpaceBtnClick" icon="icon-android-add"> 
          <i xid="i1" class="icon-android-add" />  
          <span xid="span1">新增</span> 
        </a><a component="$UI/system/components/justep/button/button" class="btn btn-link" label="删除" xid="delDocNameSpaceBtn" onClick="delDocNameSpaceBtnClick" icon="icon-android-trash"> 
          <i xid="i2" class="icon-android-trash" />  
          <span xid="span2">删除</span> 
        </a><a component="$UI/system/components/justep/button/button" class="btn btn-link" label="刷新" xid="button3" onClick="{&quot;operation&quot;:&quot;docNameSpaceData.refresh&quot;}"> 
          <i xid="i3" />  
          <span xid="span3">刷新</span> 
        </a></div><div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:32px;top:94px;"> 
    <div component="$UI/system/components/justep/data/bizData" xid="docNameSpaceData"
      concept="SA_DocNameSpace" limit="-1" autoLoad="true" directDelete="false" confirmRefresh="false"> 
      <reader xid="default1" action="/SA/doc/logic/action/queryNameSpaceAction"/>  
      <writer xid="default2" action="/SA/doc/logic/action/saveNameSpaceAction"/>  
      <creator xid="default3" action="/SA/doc/logic/action/createNameSpaceAction"/>  
      <filter name="filter0" xid="filter1"><![CDATA[SA_DocNameSpace.sFlag=1]]></filter> 
    <rule xid="rule1">
   <col name="sDisplayName" xid="ruleCol1">
    <required xid="required1">
     <expr xid="default7">true</expr></required> </col> </rule></div>  
    <div component="$UI/system/components/justep/data/bizData" xid="docNodeData"
      concept="SA_DocNode" limit="20"> 
      <reader xid="default4" action="/system/logic/action/queryDocNodeAction"/>  
      <writer xid="default5" action="/system/logic/action/saveDocNodeAction"/>  
      <creator xid="default6" action="/system/logic/action/createDocNodeAction"/> 
    </div> 
  </div>  
  <div component="$UI/system/components/justep/grid/grid" class="x-grid-no-bordered" hiddenCaptionbar="true"
    xid="grid1" data="docNameSpaceData" width="100%" height="auto"> 
    <columns xid="columns1"> 
      <column width="300" name="sDisplayName" xid="column1"/>  
      <column name="sUrl" xid="column2"/> 
    </columns> 
  </div>  
  <div component="$UI/system/components/bootstrap/dialog/dialog" class="modal fade"
    xid="docNameSpaceDialog" onHide="docNameSpaceDialogHide" style="top:30px;"> 
    <div class="modal-dialog" xid="div1"> 
      <div class="modal-content" xid="div2"> 
        <div class="modal-header" xid="div3"> 
          <h4 class="modal-title" xid="h41"><![CDATA[文档配置]]></h4> 
        </div>  
        <div class="modal-body" xid="div4"> 
          <div component="$UI/system/components/justep/labelEdit/labelEdit"
            class="x-label-edit x-label20" xid="labelInput1"> 
            <label class="x-label" xid="label1" bind-text="'显示名'"/>  
            <input component="$UI/system/components/justep/input/input" class="form-control x-edit"
              xid="input1" bind-ref="docNameSpaceData.ref('sDisplayName')" pattern="/^[A-Za-z0-9]{0,200}$/g"/> 
          </div>  
          <div component="$UI/system/components/justep/labelEdit/labelEdit"
            class="x-label-edit x-label20" xid="labelInput3"> 
            <label class="x-label" xid="label3" bind-text="'文档服务地址'"/>  
            <input component="$UI/system/components/justep/input/input" class="form-control x-edit"
              xid="input3" bind-ref="docNameSpaceData.ref('sUrl')" placeHolder="http://localhost:8080/DocServer/"/> 
          </div> 
        </div>  
        <div class="modal-footer" xid="div5"> 
          <button type="button" class="btn btn-primary" xid="saveNewDocNameSpaceBtn"
            bind-click="saveNewDocNameSpaceBtnClick"><![CDATA[确定]]></button>
          <button type="button" class="btn btn-link" data-dismiss="modal" xid="cancelNewDocNameSpaceBtn"
            bind-click="cancelNewDocNameSpaceBtnClick"><![CDATA[取消]]></button>
        </div> 
      </div> 
    </div> 
  </div> 
</div>
