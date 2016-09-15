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
      idColumn="id" autoLoad="true" confirmDelete="false" confirmRefresh="false" onValueChanged="listDataValueChanged"> 
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
      <column name="stringValue" type="String" xid="xid6"/>  
      <column name="integerValue" type="Integer" xid="xid7"/>  
      <column name="floatValue" type="Float" xid="xid8"/>  
      <column name="dateValue" type="Date" xid="xid9"/>  
      <column name="timeValue" type="Time" xid="xid10"/>  
      <column name="datetimeValue" type="DateTime" xid="xid11"/> 
    </div>  
    <div component="$UI/system/components/justep/data/data" xid="relationData"
      idColumn="col" confirmDelete="false" confirmRefresh="false" onCustomRefresh="relationDataCustomRefresh"> 
      <data xid="default11">[]</data>  
      <column label="列别名" name="col" type="String" xid="column1"/>  
      <column label="关系名" name="relation" type="String" xid="column6"/>  
      <column label="显示名" name="label" type="String" xid="column5"/>  
      <column label="类型" name="type" type="String" xid="column4"/>  
      <column label="类型显示" name="typeLabel" type="String" xid="column3"/>  
      <column label="selected" name="selected" type="Boolean" xid="column2"/>  
      <rule xid="rule2"> 
        <col name="selected" xid="ruleCol2"> 
          <calculate xid="calculate1"> 
            <expr xid="default7">js: $data.getCurrentRow() == $row</expr> 
          </calculate> 
        </col> 
      </rule> 
    </div> 
  </div>  
  <span component="$UI/system/components/justep/windowDialog/windowDialog" xid="selectValueDialog"
    style="left:96px;top:153px;" src="$UI/system/components/justep/bizFilter/selectValue.w"
    onReceive="selectValueDialogReceive" status="normal" showTitle="true" title="选择数据"/>  
  <span component="$UI/system/components/justep/windowReceiver/windowReceiver"
    xid="receiver" style="left:95px;top:226px;" onReceive="receiverReceive"/>  
  <span component="$UI/system/components/justep/windowDialog/windowDialog" xid="patternDialog"
    style="left:94px;top:189px;" src="$UI/system/components/justep/bizFilter/filterPattern.w"
    onReceive="patternDialogReceive" status="normal" showTitle="true" title="查询模板"/>  
  <span component="$UI/system/components/justep/org/orgDialogPC" showTitle="true" xid="orgDialog" style="left:96px;top:272px;" onReceive="orgDialogReceive"></span><div component="$UI/system/components/justep/panel/panel" class="x-panel x-full"
    xid="panel1"> 
    <div class="x-panel-top" xid="top1" height="48"> 
      <div xid="div1" style="padding: 5px 0;"> 
        <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
          label="添加查询条件" xid="addExprBtn" onClick="addExprBtnClick" icon="icon-android-add"> 
          <i xid="i8" class="icon-android-add"/>  
          <span xid="span8">添加查询条件</span> 
        </a>  
        <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
          label="加载查询模板" xid="loadPatternBtn" onClick="loadPatternBtnClick" icon="icon-android-storage"
          bind-visible="$model.openMode.get() == 'editFilter'"> 
          <i xid="i11" class="icon-android-storage"/>  
          <span xid="span11">加载查询模板</span> 
        </a> 
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
        <table class="x-list-template" xid="listTemplateUl1" style="width: 100%;"> 
          <tr> 
            <td style="width: 20px;"> 
              <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-xs"
                label="(" xid="leftBracket" onClick="bracketClick"> 
                <i xid="i4"/>  
                <span xid="span4" bind-css="{'text-info h2': val('leftBracket'), 'text-muted h4': !val('leftBracket')}">(</span> 
              </a> 
            </td>  
            <td> 
              <select component="$UI/system/components/justep/select/select" class="form-control input-sm"
                xid="select1" bind-ref="ref('col')" bind-labelRef="ref('label')" bind-options="$model.relationData"
                bind-optionsValue="col" bind-optionsLabel="label"/> 
            </td>  
            <td style="width: 80px;"> 
              <select component="$UI/system/components/justep/select/select" class="form-control input-sm"
                xid="select2" bind-ref="ref('operator')" bind-options="$model.createOperatorData(val('type'))"
                bind-optionsValue="operator"/> 
            </td>  
            <td> 
              <input component="$UI/system/components/justep/input/input" class="form-control input-sm"
                xid="stringInput" bind-ref="ref('stringValue')" bind-visible="!val('type') || val('type') == 'String'"
                bind-disable="$model.valueIsDisabled($object)"/>  
              <input component="$UI/system/components/justep/input/input" class="form-control input-sm"
                xid="integerInput" bind-ref="ref('integerValue')" bind-visible="val('type') == 'Integer'"
                bind-disable="$model.valueIsDisabled($object)"/>  
              <input component="$UI/system/components/justep/input/input" class="form-control input-sm"
                xid="floatInput" bind-ref="ref('floatValue')" bind-visible="val('type') == 'Float'"
                bind-disable="$model.valueIsDisabled($object)"/>  
              <input component="$UI/system/components/justep/input/input" class="form-control input-sm"
                xid="dateInput" bind-ref="ref('dateValue')" format="yyyy年MM月dd日" bind-visible="val('type') == 'Date'"
                bind-disable="$model.valueIsDisabled($object)"/>  
              <input component="$UI/system/components/justep/input/input" class="form-control input-sm"
                xid="timeInput" bind-ref="ref('timeValue')" format="hh时mm分ss秒" bind-visible="val('type') == 'Time'"
                bind-disable="$model.valueIsDisabled($object)"/>  
              <input component="$UI/system/components/justep/input/input" class="form-control input-sm"
                xid="datetimeInput" bind-ref="ref('datetimeValue')" format="yyyy年MM月dd日 hh时mm分ss秒"
                bind-visible="val('type') == 'DateTime'" bind-disable="$model.valueIsDisabled($object)"/> 
            </td>  
            <td style="width: 30px;"> 
              <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-sm btn-only-icon"
                label="选择数据" xid="btnSelectValue" icon="icon-ios7-more" onClick="btnSelectValueClick"
                bind-disable="$model.valueIsDisabled($object)"> 
                <i xid="i2" class="icon-ios7-more"/>  
                <span xid="span2">选择数据</span> 
              </a> 
            </td>  
            <td style="width: 20px;"> 
              <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-xs"
                label=")" xid="rightBracket" onClick="bracketClick"> 
                <i xid="i5"/>  
                <span xid="span5" bind-css="{'text-info h2': val('rightBracket'), 'text-muted h4': !val('rightBracket')}">)</span> 
              </a> 
            </td>  
            <td style="width: 40px"> 
              <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-xs"
                label="并且" xid="logicBtn" onClick="logicBtnClick"> 
                <i xid="i3"/>  
                <span xid="span3" bind-text="$model.logic2label(val('logic'))"
                  bind-css="{'text-success': val('logic')=='AND','text-danger': val('logic')=='OR'}">并且</span> 
              </a> 
            </td>  
            <td style="width: 25px"> 
              <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-xs btn-only-icon"
                label="button" xid="delExprBtn" icon="icon-close" onClick="delExprBtnClick"> 
                <i xid="i1" class="icon-close"/>  
                <span xid="span1"/> 
              </a> 
            </td> 
          </tr> 
        </table> 
      </div> 
    </div>  
    <div class="x-panel-bottom" xid="bottom1"> 
      <div style="width: 150px;float: right;"> 
        <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-only-label x-dialog-button"
          label="取消" xid="cancelBtn" onClick="cancelBtnClick"> 
          <i xid="i13"/>  
          <span xid="span13">取消</span> 
        </a>  
        <a component="$UI/system/components/justep/button/button" class="btn btn-primary btn-only-label x-dialog-button"
          label="确定" xid="okBtn" onClick="okBtnClick"> 
          <i xid="i12"/>  
          <span xid="span12">确定</span> 
        </a> 
      </div> 
       <div style="width: 100px;float: right; padding-top: 8px;" bind-visible="$model.isPublicPattern"> 
       <a component="$UI/system/components/justep/button/button" class="btn btn-link" label="设置" xid="btnSelectOrg" onClick="btnSelectOrgClick">
   <i xid="i6"></i>
   <span xid="span6">设置</span></a>
  </div> 
      <div style="margin-right: 250px;" bind-visible="$model.isPublicPattern"><div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label30" xid="labelInput2">
   <label class="x-label" xid="label2" bind-text="'组织范围：'" style="width:80px;"></label>
   <input component="$UI/system/components/justep/input/input" class="form-control x-edit" xid="input2" bind-ref="patternData.ref('sOrgFName')" readonly="true" placeHolder="全部"></input></div></div> 
    </div> 
  </div> 
</div>
