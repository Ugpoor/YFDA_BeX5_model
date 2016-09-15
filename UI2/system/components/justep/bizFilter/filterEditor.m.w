<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window" component="$UI/system/components/justep/window/window">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:233px;top:257px;"> 
    <div component="$UI/system/components/justep/data/bizData" xid="patternData"
      concept="SA_FilterPattern" directDelete="false" confirmRefresh="false" confirmDelete="false"
      limit="1"> 
      <reader xid="default1" action="/system/logic/action/queryFilterPatternAction"/>  
      <writer xid="default2" action="/system/logic/action/saveFilterPatternAction"/>  
      <creator xid="default3" action="/system/logic/action/createFilterPatternAction"/>  
      <rule xid="rule1"> 
        <col name="sName" xid="ruleCol1"> 
          <required xid="required1"> 
            <expr xid="default5">js: true</expr>  
            <message xid="default6">请输入模板名称</message> 
          </required> 
        </col> 
      </rule> 
    </div>  
    <div component="$UI/system/components/justep/data/data" xid="listData"
      idColumn="id" autoLoad="true" confirmDelete="false" confirmRefresh="false"> 
      <column label="id" name="id" type="String" xid="default15"/>  
      <column label="列" name="col" type="String" xid="default21"/>  
      <column label="列显示名称" name="label" type="String" xid="xid1"/>  
      <column label="类型" name="type" type="String" xid="xid2"/>  
      <column label="关系" name="relation" type="String" xid="xid3"/>  
      <column label="运算符" name="operator" type="String" xid="xid4"/>  
      <column label="值" name="value" type="String" xid="xid5"/>  
      <column label="表达式" name="expr" type="String" xid="default16"/>  
      <column label="表达式KSQL" name="exprKSQL" type="String" xid="default17"/>  
      <column label="逻辑关系" name="logic" type="String" xid="default18"/>  
      <column label="左括号" name="leftBracket" type="Boolean" xid="default19"/>  
      <column label="右括号" name="rightBracket" type="Boolean" xid="default20"/> 
    </div> 
  </div>  
  <span component="$UI/system/components/justep/windowReceiver/windowReceiver"
    xid="receiver" style="left:95px;top:226px;" onReceive="receiverReceive"/>  
  <span component="$UI/system/components/justep/windowDialog/windowDialog" xid="exprDialog"
    style="left:136px;top:152px;" src="$UI/system/components/justep/bizFilter/exprEditor.m.w"
    onReceive="exprDialogReceive"/>  
  <span component="$UI/system/components/justep/windowDialog/windowDialog" xid="patternDialog"
    style="left:84px;top:152px;" src="$UI/system/components/justep/bizFilter/filterPattern.m.w"
    onReceive="patternDialogReceive"/>  
  <div component="$UI/system/components/justep/panel/panel" class="x-panel x-full"
    xid="panel1"> 
    <div class="x-panel-top" xid="top1" height="48"> 
      <div component="$UI/system/components/justep/titleBar/titleBar" class="x-titlebar"
        xid="titleBar" title="编辑查询条件"> 
        <div class="x-titlebar-left" xid="div4"> 
          <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-only-icon"
            label="取消" xid="cancelBtn" onClick="cancelBtnClick" icon="icon-chevron-left"> 
            <i xid="i13" class="icon-chevron-left"/>  
            <span xid="span13">取消</span> 
          </a>  
          <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-only-icon"
            label="加载查询模板" xid="loadPatternBtn" onClick="loadPatternBtnClick" icon="icon-android-storage"
            bind-visible="$model.openMode.get() == 'editFilter'"> 
            <i xid="i11" class="icon-android-storage"/>  
            <span xid="span11">加载查询模板</span> 
          </a> 
        </div>  
        <div class="x-titlebar-title" xid="div5">编辑查询条件</div>  
        <div class="x-titlebar-right reverse" xid="div6"> 
          <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-only-icon"
            label="确定" xid="okBtn" onClick="okBtnClick" icon="icon-checkmark"> 
            <i xid="i12" class="icon-checkmark"/>  
            <span xid="span12">确定</span> 
          </a>  
          <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-only-icon"
            label="添加" xid="addExprBtn" onClick="addExprBtnClick" icon="icon-android-add"> 
            <i xid="i8" class="icon-android-add"/>  
            <span xid="span8">添加</span> 
          </a> 
        </div> 
      </div> 
    </div>  
    <div class="x-panel-content" xid="content1"> 
      <div xid="patternNameDiv" style="display: none;margin: 2px; padding: 5px 10px;"
        class="bg-warning" bind-visible="$model.openMode.get() != 'editFilter'"> 
        <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label20"
          xid="labelInput1"> 
          <label xid="label1" style="width: 70px;">模板名称</label>  
          <input component="$UI/system/components/justep/input/input" class="form-control input-sm x-edit"
            xid="input1" bind-ref="patternData.ref('sName')"/> 
        </div> 
      </div>  
      <div component="$UI/system/components/justep/list/list" class="x-list"
        xid="list1" data="listData" autoLoad="true" style="margin: 5px;"> 
        <ul class="x-list-template" xid="listTemplateUl1"> 
          <li xid="li1" style="padding: 10px;"> 
            <table style="width: 100%;"> 
              <tr> 
                <td style="width: 20px;"> 
                  <a component="$UI/system/components/justep/button/button"
                    class="btn btn-link btn-xs" label="(" xid="leftBracket" onClick="bracketClick"> 
                    <i xid="i4"/>  
                    <span xid="span4" bind-css="{'text-info h2': val('leftBracket'), 'text-muted h4': !val('leftBracket')}">(</span> 
                  </a> 
                </td>  
                <td> 
                  <div component="$UI/system/components/justep/output/output"
                    class="x-output" xid="output1" bind-ref="ref('expr')" bind-click="editExprBtnClick"
                    style="cursor:pointer; padding-top: 0px; word-break: break-all;"/> 
                </td>  
                <td style="width: 20px;"> 
                  <a component="$UI/system/components/justep/button/button"
                    class="btn btn-link btn-xs" label=")" xid="rightBracket" onClick="bracketClick"> 
                    <i xid="i5"/>  
                    <span xid="span5" bind-css="{'text-info h2': val('rightBracket'), 'text-muted h4': !val('rightBracket')}">)</span> 
                  </a> 
                </td>  
                <td style="width: 40px"> 
                  <a component="$UI/system/components/justep/button/button"
                    class="btn btn-link btn-xs" label="并且" xid="logicBtn" onClick="logicBtnClick"> 
                    <i xid="i3"/>  
                    <span xid="span3" bind-text="$model.logic2label(val('logic'))"
                      bind-css="{'text-success': val('logic')=='AND','text-danger': val('logic')=='OR'}">并且</span> 
                  </a> 
                </td>  
                <td style="width: 25px"> 
                  <a component="$UI/system/components/justep/button/button"
                    class="btn btn-link btn-xs btn-only-icon" label="button" xid="editExprBtn"
                    icon="icon-edit" onClick="editExprBtnClick"> 
                    <i xid="i2" class="icon-edit"/>  
                    <span xid="span2"/> 
                  </a> 
                </td>  
                <td style="width: 25px"> 
                  <a component="$UI/system/components/justep/button/button"
                    class="btn btn-link btn-xs btn-only-icon" label="button" xid="delExprBtn"
                    icon="icon-close" onClick="delExprBtnClick"> 
                    <i xid="i1" class="icon-close"/>  
                    <span xid="span1"/> 
                  </a> 
                </td> 
              </tr> 
            </table> 
          </li> 
        </ul> 
      </div> 
    </div> 
  </div> 
</div>
