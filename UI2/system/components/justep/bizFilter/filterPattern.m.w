<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window" component="$UI/system/components/justep/window/window">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:291px;top:113px;"> 
    <div component="$UI/system/components/justep/data/bizData" xid="patternData"
      concept="SA_FilterPattern" directDelete="true" confirmRefresh="false" confirmDelete="true"
      orderBy="sName asc" confirmDeleteText="要删除这个查询模板吗？"> 
      <reader xid="default1" action="/system/logic/action/queryFilterPatternAction"/>  
      <writer xid="default2" action="/system/logic/action/saveFilterPatternAction"/>  
      <creator xid="default3" action="/system/logic/action/createFilterPatternAction"/>  
      <calculateRelation relation="isPublic" xid="calculateRelation1"></calculateRelation>
  <rule xid="rule1">
   <col name="sName" xid="ruleCol1">
    <required xid="required1">
     <expr xid="default5">js: true</expr>
     <message xid="default6">请输入模板名称</message></required> </col> 
   <col name="selected" xid="ruleCol2">
    <calculate xid="calculate1">
     <expr xid="default4">js: $data.getCurrentRow() == $row</expr></calculate> </col> 
   <col name="isPublic" xid="ruleCol3">
    <calculate xid="calculate2">
     <expr xid="default7"><![CDATA[!$row.val("sPerson")]]></expr></calculate> </col> </rule></div> 
  </div>  
  <span component="$UI/system/components/justep/windowReceiver/windowReceiver"
    xid="receiver" style="left:98px;top:235px;" onReceive="receiverReceive"/>  
  <div component="$UI/system/components/justep/panel/panel" class="x-panel x-full"
    xid="panel"> 
    <div class="x-panel-top" xid="top1"> 
      <div component="$UI/system/components/justep/titleBar/titleBar" class="x-titlebar"
        xid="titleBar" title="查询模板"> 
        <div class="x-titlebar-left" xid="div1"> 
          <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-only-icon"
            label="取消" xid="cancelBtn"
            onClick="{&quot;operation&quot;:&quot;receiver.windowCancel&quot;}"> 
            <i xid="i5"/>  
            <span xid="span7">取消</span> 
          </a> 
        </div>  
        <div class="x-titlebar-title" xid="div2">查询模板</div>  
        <div class="x-titlebar-right reverse" xid="div3"> 
          <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-only-icon"
            label="新建模板" xid="newBtn" bind-click="newBtnClick" bind-disable=" " icon="icon-android-add"> 
            <i xid="i1" class="icon-android-add"/>  
            <span xid="span1">新建模板</span> 
          </a> 
        </div> 
      </div> 
    </div>  
    <div class="x-panel-content xui-hignlight-selected x-scroll-view" xid="content1"
      style="bottom: 0px;"> 
      <div class="x-scroll" component="$UI/system/components/justep/scrollView/scrollView"
        xid="scrollView1"> 
        <div class="x-scroll-content" xid="div6"> 
          <div component="$UI/system/components/justep/list/list" class="x-list"
            xid="patternList" data="patternData" autoLoad="false" style="margin: 5px;"> 
            <ul class="x-list-template" xid="listTemplateUl1"> 
              <li xid="listItem" style="padding: 10px;"> 
                <table style="width: 100%;"> 
                  <tr> 
                    <td> 
                      <div component="$UI/system/components/justep/output/output"
                        class="x-output" xid="output1" bind-click="okBtnClick"
                        style="cursor:pointer; word-break: break-all;" bind-text="val('sName') + (val('isPublic') ? '(公共)' : '')"/> 
                    </td>  
                    <td style="width:25px;"> 
                      <a component="$UI/system/components/justep/button/button"
                        class="btn btn-link btn-xs btn-only-icon" label="编辑模板" xid="editPatternBtn"
                        icon="icon-edit" onClick="editPatternBtnClick" bind-disable="val('isPublic') &amp;&amp; !$model.isManager.get()"> 
                        <i xid="i3" class="icon-edit"/>  
                        <span xid="span3">编辑模板</span> 
                      </a> 
                    </td>  
                    <td style="width:25px;"> 
                      <a component="$UI/system/components/justep/button/button"
                        class="btn btn-link btn-xs btn-only-icon" label="删除模板" xid="delPatternBtn"
                        icon="icon-close" onClick="delPatternBtnClick" bind-disable="val('isPublic') &amp;&amp; !$model.isManager.get()"> 
                        <i xid="i2" class="icon-close"/>  
                        <span xid="span2">删除模板</span> 
                      </a> 
                    </td> 
                  </tr> 
                </table> 
              </li> 
            </ul> 
          </div> 
        </div>  
        <div class="x-content-center x-pull-up" xid="div7"> 
          <span class="x-pull-up-label" xid="span4">加载更多...</span> 
        </div> 
      </div> 
    </div> 
  </div>  
  <div component="$UI/system/components/justep/popOver/popOver" class="x-popOver"
    xid="popOver1"> 
    <div class="x-popOver-overlay" xid="div4"/>  
    <div class="x-popOver-content" xid="div5"/> 
  </div>  
  <span component="$UI/system/components/justep/windowDialog/windowDialog" xid="filterDialog"
    style="left:97px;top:159px;" src="$UI/system/components/justep/bizFilter/filterEditor.m.w"
    onReceive="filterDialogReceive"/> 
</div>
