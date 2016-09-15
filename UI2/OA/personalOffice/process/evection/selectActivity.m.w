<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window" component="$UI/system/components/justep/window/window">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="width:109px;height:auto;left:268px;top:230px;"> 
    <div component="$UI/system/components/justep/data/bizData" xid="detailData"
      concept="OA_Evection" autoLoad="false" confirmDelete="true" autoNew="false"> 
      <reader xid="default1" action="/OA/personalOffice/logic/action/queryOA_EvectionAction"/>  
      <writer xid="default2" action="/OA/personalOffice/logic/action/saveOA_EvectionAction"/>  
      <creator xid="default3" action="/OA/personalOffice/logic/action/createOA_EvectionAction"/>  
      <rule xid="rule1"> 
        <col name="fName" xid="ruleCol1"> 
          <readonly xid="readonly1"> 
            <expr xid="default4"><![CDATA[]]></expr> 
          </readonly> 
        </col> 
      </rule> 
    </div>  
    </div>  
  <span component="$UI/system/components/justep/windowReceiver/windowReceiver"
    xid="windowReceiver" onReceive="windowReceiverReceive" style="top:419px;left:-2px;"/>  
  <div component="$UI/system/components/justep/contents/contents" class="x-contents x-full"
    active="0" xid="contents1"> 
    <div class="x-contents-content" xid="choicePsm"> 
      <div component="$UI/system/components/justep/panel/panel" class="x-panel x-full"
        xid="panel3"> 
        <div class="x-panel-top" xid="top3"> 
          <div component="$UI/system/components/justep/titleBar/titleBar" class="x-titlebar"
            xid="titleBar3" title="审批"> 
            <div class="x-titlebar-left" xid="div14"> 
              <a component="$UI/system/components/justep/button/button" class="btn btn-link"
                xid="backBut" icon="icon-chevron-left" onClick="backButClick"> 
                <i xid="i10" class="icon-chevron-left"/>  
                <span xid="span6"/> 
              </a> 
            </div>  
            <div class="x-titlebar-title" xid="div15">审批</div>  
            <div class="x-titlebar-right reverse" xid="div16"> 
              <a component="$UI/system/components/justep/button/button" class="btn btn-link"
                xid="saveBut" icon="icon-checkmark-round" bind-click="saveButClick"> 
                <i xid="i11" class="icon-checkmark-round"/>  
                <span xid="span7"/> 
              </a> 
            </div> 
          </div> 
        </div>  
        <div class="x-panel-content" xid="content2"> 
          <div component="$UI/system/components/justep/controlGroup/controlGroup"
            class="x-control-group" title="title" xid="controlGroup2" style="height:286px;"> 
            <div class="x-ro x-ro-border" component="$UI/system/components/justep/social/relativeOrg/relativeOrg"
              xid="nextExecutor" groupName="选择下一级审核人员" data="detailData" bind-nameRef="detailData.ref('fName')"
              groupID="A" multiSelection="false" multiValue="true" onChange="nextExecutorChange"> 
              <div component="$UI/system/components/justep/data/bizData" concept="SA_Social"
                xid="bizData3"/>  

            </div>  
            <div class="x-ro x-ro-border" component="$UI/system/components/justep/social/relativeOrg/relativeOrg"
              xid="selectParticipants" groupName="知会相关人员" data="detailData" bind-nameRef="detailData.ref('fName')"
              groupID="P" multiSelection="true"> 
              <div component="$UI/system/components/justep/data/bizData" concept="SA_Social"
                xid="bizData4"/>  

            </div> 
          </div> 
        </div>  
        </div> 
    </div> 
  </div> 
</div>
