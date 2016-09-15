<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window" component="$UI/system/components/justep/window/window" sysParam="false">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:493px;top:453px;"> 
    <div component="$UI/system/components/justep/data/data" xid="flowToData"
      idColumn="rowid"> 
      <column name="rowid" type="String"/>  
      <column name="sName" type="String"/>  
      <column name="sExecuteMode" type="String"/>  
      <column name="sPreemptMode" type="String"/>  
      <column name="sExecuteMode2" type="String"/>
      <column name="action" type="String"/>  
      <rule> 
        <readonly> 
          <expr/> 
        </readonly>  
        <col name="sPreemptMode"> 
          <readonly> 
            <expr><![CDATA[js:val('sExecuteMode')!='temPreempt']]></expr> 
          </readonly>  
          <calculate> 
            <expr/> 
          </calculate>  
          <constraint> 
            <expr/> 
          </constraint>  
          <required> 
            <expr/> 
          </required> 
        </col> 
      </rule>  
      <data/> 
    </div>  
    <div component="$UI/system/components/justep/data/data" xid="executeModeData" autoLoad="true"
      idColumn="rowid"> 
      <column name="rowid" type="String"/>  
      <column name="label" type="String"/>  
      <column name="value" type="String"/>  
      <data><![CDATA[
      [{rowid: '0', label: '抢占', value: 'temPreempt'}, 
      {rowid: '1', label: '顺序', value: 'temSequential'},
      {rowid: '2', label: '同时', value: 'temSimultaneous'}]
      ]]></data> 
    </div>  
    <div component="$UI/system/components/justep/data/data" xid="executeMode2Data"  autoLoad="true"
      idColumn="rowid"> 
      <column name="rowid" type="String"/>  
      <column name="label" type="String"/>  
      <column name="value" type="String"/>  
      <data><![CDATA[
      [{rowid: '0', label: '原路返回', value: 'flowToFront'}, 
      {rowid: '1', label: '重新流转', value: 'flowToAgain'},
      {rowid: '2', label: '原路返回或重新流转', value: 'flowToFrontOrAgain'}]
      ]]></data> 
    </div>  
    <div component="$UI/system/components/justep/data/data" xid="preemptModeData"  autoLoad="true"
      idColumn="rowid"> 
      <column name="rowid" type="String"/>  
      <column name="label" type="String"/>  
      <column name="value" type="String"/>  
      <data><![CDATA[
      [{rowid: '0', label: '打开时抢占', value: 'tpmOpen'}, 
      {rowid: '1', label: '执行时抢占', value: 'tpmExecute'}]
      ]]></data> 
    </div> 
  </div>  
  <span xid="windowReceive" component="$UI/system/components/justep/windowReceiver/windowReceiver"
    onReceive="windowReceiveReceive" style="top:12px;left:92px;"/>  
  <div component="$UI/system/components/justep/panel/panel" class="x-panel x-full" xid="panel"> 
    <div class="x-panel-top" xid="panelTop"> 
      <div xid="bar" component="$UI/system/components/justep/titleBar/titleBar" title="高级选项"
        class="x-titlebar"> 
        <div class="x-titlebar-left"> 
			<a component="$UI/system/components/justep/button/button" label=""
				class="btn btn-link btn-only-icon " icon="icon-chevron-left"
				onClick="cancelBtnClick" xid="cancelBtn">
				<i class="icon-chevron-left" />
				<span></span>
			</a>
        </div>  
        <div class="x-titlebar-title">高级选项</div>  
        <div class="x-titlebar-right reverse"> 
          <a component="$UI/system/components/justep/button/button" label=""
            class="btn btn-link btn-only-icon " icon="icon-checkmark-round" xid="okBtn"
            onClick="okBtnClick"> 
            <i class="icon-checkmark-round"/>  
            <span></span> 
          </a> 
        </div> 
      </div> 
    </div>  
    <div class="x-panel-content" xid="panelContent"> 
      <div component="$UI/system/components/justep/controlGroup/controlGroup"
        class="x-control-group"> 
        <div class="x-control-group-title hide"/>  
        <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit  x-label30"> 
          <label class="x-label left">任务标题</label>  
          <div class="x-edit"> 
          	<!-- padding-left由于oa重写导致出问题 -->
            <input class="form-control" style="padding-left:12px" component="$UI/system/components/justep/input/input"
              data="flowToData" bind-ref="flowToData.ref('sName')"/> 
          </div> 
        </div>  
        <div component="$UI/system/components/justep/labelEdit/labelEdit" bind-visible="flowToData.val('action') != 'backQuery'" class="x-label-edit  x-label30"> 
          <label class="x-label left">执行模式</label>  
          <div class="x-edit"> 
            <select class="form-control" component="$UI/system/components/justep/select/select"
              bind-ref="flowToData.ref('sExecuteMode')" bind-options="executeModeData"
              bind-optionsLabel="label" bind-optionsValue="value" bind-optionsCaption="请选择..."/> 
          </div> 
        </div>  
        <div component="$UI/system/components/justep/labelEdit/labelEdit" bind-visible="flowToData.val('action') != 'backQuery'" class="x-label-edit  x-label30"> 
          <label class="x-label left">抢占模式</label>  
          <div class="x-edit"> 
            <select class="form-control" component="$UI/system/components/justep/select/select"
              bind-ref="flowToData.ref('sPreemptMode')" bind-options="preemptModeData"
              bind-optionsLabel="label" bind-optionsValue="value" bind-optionsCaption="请选择..."/> 
          </div> 
        </div> 
        <div component="$UI/system/components/justep/labelEdit/labelEdit" bind-visible="flowToData.val('action') == 'backQuery'" class="x-label-edit  x-label30"> 
          <label class="x-label left">返回模式</label>  
          <div class="x-edit"> 
            <select class="form-control" component="$UI/system/components/justep/select/select"
              bind-ref="flowToData.ref('sExecuteMode2')" bind-options="executeMode2Data"
              bind-optionsLabel="label" bind-optionsValue="value" bind-optionsCaption="请选择..."/> 
          </div> 
        </div> 
      </div> 
    </div> 
  </div> 
</div>
