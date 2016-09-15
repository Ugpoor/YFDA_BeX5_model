<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" component="$UI/system/components/justep/window/window">  
  <div component="$UI/system/components/justep/model/model" xid="model"> 
    <div component="$UI/system/components/justep/data/bizData" xid="bizData1" autoLoad="true"
      concept="DEMO_TABLE1" columns="version,fString,fInteger,fFloat,fDecimal,fDate,fDateTime,fTime,fText"
      limit="2" onDataChange="bizData1DataChange"> 
      <reader action="/demo/components/logic/action/queryDEMO_TABLE1Action"/>  
      <writer action="/demo/components/logic/action/saveDEMO_TABLE1Action"/>  
      <creator action="/demo/components/logic/action/createDEMO_TABLE1Action"/>  
      <calculateRelation relation="calcCheckBox"/>  
      <calculateRelation relation="recNO" type="Integer"/>  
      <rule> 
        <readonly> 
          <expr><![CDATA[]]></expr> 
        </readonly>  
        <col name="fString"> 
          <readonly>
            <expr><![CDATA[js:1000<val('fInteger')]]></expr>
          </readonly>  
          <calculate>
            <expr/>
          </calculate>  
          <constraint>
            <expr><![CDATA[js:$val.indexOf(val('fInteger'))<0]]></expr>  
            <message xid="default1"><![CDATA[]]></message>
          </constraint>  
          <required>
            <expr><![CDATA[js:true]]></expr>
          </required> 
        </col> 
      </rule> 
    </div>  
    <div component="$UI/system/components/justep/data/bizData" xid="selectData" autoLoad="true"
      concept="DEMO_TABLE1" columns="fString,fInteger,fFloat,fDecimal,fDate,fDateTime,fTime,fText"
      limit="5"> 
      <reader action="/demo/components/logic/action/queryDEMO_TABLE1Action"/>  
    </div>  
    <div component="$UI/system/components/justep/data/data" xid="data1" idColumn="fName">
      <column name="fName" type="String" label="显示名称"/>
      <column name="fAge" type="Integer" label="年龄"/>
      <rule xid="rule1"/>
      <data><![CDATA[
      [{fName:'abc',fAge:18},{fName:'test',fAge:28}]
      ]]></data>
    </div>
  </div>  
  <div> 
    <h1>Data,BizData Component Demo</h1>  
    <h3>Data组件</h3>  
    <div> 
      <table> 
        <tr valign="top"> 
          <td> 
            <div>主当前行:</div>  
            <div> 
              <label bind-text="mainData.label('sName')"/>  
              <input bind-value="mainData.ref('sName')" bind-validation="mainData.ref('sName')"/> 
            </div>  
            <div> 
              <label bind-text="mainData.label('sAge')"/>  
              <input bind-value="mainData.ref('sAge')"/> 
            </div>  
            <div> 
              <label bind-text="mainData.label('sAmt')"/>  
              <input bind-value="mainData.ref('sAmt')"/> 
            </div>  
            <div> 
              <span>平均年龄：</span>  
              <span bind-text="mainData.ageAvg" id="span2"/> 
            </div>  
            <div> 
              <span>总价格：</span>  
              <span bind-text="mainData.amtSum" id="span3"/> 
            </div>  
            <div> 
              <span>修改状态：</span>  
              <span bind-text="mainData.isChanged()" id="span3"/> 
            </div> 
          </td>  
          <td> 
            <div>主数据：</div>  
            <div> 
              <input bind-click="mainDataNew" type="button" value="new"
                id="input6" class="btn btn-info"/>  
              <input bind-click="call(mainData,mainData.deleteData)" type="button"
                value="del" id="input6-1" class="btn btn-info"/>  
              <input bind-click="call(mainData,mainData.tojson)" type="button"
                value="getJson" id="input7" class="btn btn-info"/>  
              <input bind-click="call(mainData,mainData.first)" type="button"
                value="&lt;&lt;" id="input8" class="btn btn-info"/>  
              <input bind-click="call(mainData,mainData.pre)" type="button"
                value="&lt;" id="input9" class="btn btn-info"/>  
              <input bind-click="call(mainData,mainData.next)" type="button"
                value="&gt;" id="input11" class="btn btn-info"/>  
              <input bind-click="call(mainData,mainData.last)" type="button"
                value="&gt;&gt;" id="input12" class="btn btn-info"/> 
            </div>  
            <ul bind-foreach="mainData.datas"> 
              <li bind-css="{ curRow: $model.mainData.currentRow.get() == $object }"> 
                <div> 
                  <label bind-text="label('sName')"/>  
                  <input bind-value="ref('sName')"/> 
                </div>  
                <div> 
                  <label bind-text="label('sAge')"/>  
                  <input bind-value="ref('sAge')"/> 
                </div>  
                <div> 
                  <label bind-text="label('sAmt')"/>  
                  <input bind-value="ref('sAmt')"/> 
                </div>  
                <div> 
                  <label bind-text="label('SA_Task')"/>  
                  <span bind-text="ref('SA_Task')"/> 
                </div> 
              </li> 
            </ul> 
          </td>  
          <td> 
            <div>从数据：</div>  
            <div> 
              <input bind-click="slaveDataNew" type="button" value="new"
                id="input6-1" class="btn btn-info"/>  
              <input bind-click="call(slaveData,slaveData.deleteData)" type="button"
                value="del" id="input6-2" class="btn btn-info"/>  
              <input bind-click="call(slaveData,slaveData.first)" type="button"
                value="&lt;&lt;" id="input8-1" class="btn btn-info"/>  
              <input bind-click="call(slaveData,slaveData.pre)" type="button"
                value="&lt;" id="input9-1" class="btn btn-info"/>  
              <input bind-click="call(slaveData,slaveData.next)" type="button"
                value="&gt;" id="input11-1" class="btn btn-info"/>  
              <input bind-click="call(slaveData,slaveData.last)" type="button"
                value="&gt;&gt;" id="input12-1" class="btn btn-info"/> 
            </div>  
            <ul bind-foreach="slaveData.datas"> 
              <li bind-css="{ curRow: $model.slaveData.currentRow.get() == $object}"> 
                <div> 
                  <label bind-text="label('sName')"/>  
                  <input bind-value="ref('sName')"/> 
                </div>  
                <div> 
                  <label bind-text="label('sCount')"/>  
                  <input bind-value="ref('sCount')"/> 
                </div>  
                <div> 
                  <label bind-text="label('sUnitprice')"/>  
                  <input bind-value="ref('sUnitprice')"/> 
                </div>  
                <div> 
                  <label bind-text="label('sAmt')"/>  
                  <input bind-value="ref('sAmt')"/> 
                </div>  
                <div> 
                  <label bind-text="label('sInfo')"/>  
                  <input bind-value="ref('sInfo')"/> 
                </div>  
                <div> 
                  <label bind-text="label('SA_Task_Info')"/>  
                  <span bind-text="ref('SA_Task_Info')"/> 
                </div>  
                <div> 
                  <label bind-text="label('SA_Task')"/>  
                  <span bind-text="ref('SA_Task')"/> 
                </div> 
              </li> 
            </ul> 
          </td>  
          <td> 
            <div> 
              <label bind-text="slaveData.label('sName')"/>  
              <input bind-value="slaveData.ref('sName')"/> 
            </div>  
            <div> 
              <label bind-text="slaveData.label('sCount')"/>  
              <input bind-value="slaveData.ref('sCount')"/> 
            </div>  
            <div> 
              <label bind-text="slaveData.label('sUnitprice')"/>  
              <input bind-value="slaveData.ref('sUnitprice')"/> 
            </div>  
            <div> 
              <label bind-text="slaveData.label('sAmt')"/>  
              <input bind-value="slaveData.ref('sAmt')"/> 
            </div>  
            <div> 
              <label bind-text="slaveData.label('sInfo')"/>  
              <input bind-value="slaveData.ref('sInfo')"/> 
            </div>  
            <div> 
              <label bind-text="slaveData.label('SA_Task_Info')"/>  
              <span bind-text="slaveData.ref('SA_Task_Info')"/> 
            </div>  
            <div> 
              <label bind-text="slaveData.label('SA_Task')"/>  
              <span bind-text="slaveData.ref('SA_Task')"/> 
            </div> 
          </td> 
        </tr> 
      </table>  
      <p bind-text="mainData.getInvalidInfo()"/>  
      <p bind-text="slaveData.getInvalidInfo()"/> 
    </div>  
    <h3>BizData组件</h3>  
    <div> 
      <label>数据约束规则</label>  
      <label>fString:</label>  
      <label>1、必须有值</label>  
      <label>2、必须包含字符串'abc'</label>  
      <label>3、必须包含fInteger</label>  
      <label>fInteger:</label>  
      <label>1、必须有值</label>  
      <label>2、必须是数字</label>  
      <label>数据只读规则</label>  
      <label>当fInteger大于500时fString只读</label> 
    </div>  
    <div> 
      <span>修改状态：</span>  
      <span bind-text="bizChanged"/>  
      <span>校验状态：</span>  
      <span bind-text="bizData.isValid()"/>  
      <span>记录数：</span>  
      <span bind-text="bizData.getCount()"/> 
    </div>  
    <div> 
      <span>直接删除：</span>  
      <input type="checkbox" bind-checked="bizDataDirectDelete"/>  
      <span>，删除提示：</span>  
      <input type="checkbox" bind-checked="bizDataDeleteConfirm"/>  
      <span>，data只读：</span>  
      <input type="checkbox" bind-checked="bizDataReadonly"/> 
    </div>  
    <div> 
      <input bind-click="call(bizData,bizData.newData)" type="button" value="New"
        class="btn btn-info"/>  
      <input bind-click="call(bizData,bizData.refreshData)" type="button"
        value="Refresh" class="btn btn-info"/>  
      <input bind-click="call(bizData,bizData.deleteData)" type="button"
        value="Del" class="btn btn-info"/>  
      <input bind-click="call(bizData,bizData.saveData)" type="button" value="Save"
        class="btn btn-info"/>  
      <input bind-click="call(bizData,bizData.first)" type="button" value="&lt;&lt;"
        class="btn btn-info"/>  
      <input bind-click="call(bizData,bizData.pre)" type="button" value="&lt;"
        class="btn btn-info"/>  
      <input bind-click="call(bizData,bizData.next)" type="button" value="&gt;"
        class="btn btn-info"/>  
      <input bind-click="call(bizData,bizData.last)" type="button" value="&gt;&gt;"
        class="btn btn-info"/>  
      <input bind-click="test" type="button" value="test" class="btn btn-info"/> 
    </div>  
    <table> 
      <tr valign="top" class="tr"> 
        <td id="td"> 
          <ul bind-foreach="bizData.datas"> 
            <li bind-css="{ curRow:$model.bizData.currentRow.get() == $object }"> 
              <div> 
                <label bind-text="label('fString')"/>  
                <input bind-value="ref('fString')" bind-validation="ref('fString')" bind-readonly="ref('fString')"/> 
              </div>  
              <div> 
                <label bind-text="label('fInteger')"/>  
                <input bind-value="ref('fInteger')" bind-validation="ref('fInteger')" bind-readonly="ref('fInteger')"/> 
              </div>  
              <div> 
                <label bind-text="label('fFloat')"/>  
                <input bind-value="ref('fFloat')" bind-readonly="ref('fFloat')"/> 
              </div>  
              <div> 
                <label bind-text="label('fDecimal')"/>  
                <input bind-value="ref('fDecimal')" bind-readonly="ref('fDecimal')"/> 
              </div>  
              <div> 
                <label bind-text="label('fDateTime')"/>  
                <input bind-value="ref('fDateTime')" bind-readonly="ref('fDateTime')"/> 
              </div>  
              <div> 
                <label bind-text="label('fText')"/>  
                <input bind-value="ref('fText')" bind-readonly="ref('fText')"/> 
              </div>  
              <div> 
                <label bind-text="label('fTime')"/>  
                <input bind-value="ref('fTime')" bind-readonly="ref('fTime')"/> 
              </div> 
            </li> 
          </ul> 
        </td>  
        <td> 
          <div>当前行:</div>  
          <div> 
            <label bind-text="bizData.label('fString')"/>  
            <input class="form-control String" bind-value="bizData.ref('fString')" bind-validation="bizData.ref('fString')" bind-readonly="bizData.ref('fString')"/>  
            <!-- 
						 -->  
            <!--
					<input component="$UI/system/components/input/input" config='{"width":160,"placeHolder":"请输入字符串"}'
						xid="input1" bind-ref="bizData.ref('fString')">
						<input/>
						<div xid="search">
							<img style="width:16px; height:22px" src="$UI/system/components/input/img/datePicker.gif"></img>
						</div>
					</div>
					--> 
          </div>  
          <div> 
            <label bind-text="bizData.label('fInteger')"/>  
            <input bind-value="bizData.ref('fInteger')" bind-validation="bizData.ref('fInteger')" bind-readonly="bizData.ref('fInteger')"/>  
            <!-- 
						 --> 
          </div>  
          <div> 
            <label bind-text="bizData.label('fFloat')"/>  
            <input bind-value="bizData.ref('fFloat')" bind-readonly="bizData.ref('fFloat')"/> 
          </div>  
          <div> 
            <label bind-text="bizData.label('fDecimal')"/>  
            <input bind-value="bizData.ref('fDecimal')" bind-readonly="bizData.ref('fDecimal')"/> 
          </div>  
          <div> 
            <label bind-text="bizData.label('fDateTime')"/>  
            <input bind-value="bizData.ref('fDateTime')" bind-readonly="bizData.ref('fDateTime')"/> 
          </div>  
          <div> 
            <label bind-text="bizData.label('fText')"/>  
            <input bind-value="bizData.ref('fText')" bind-readonly="bizData.ref('fText')"/> 
          </div>  
          <div> 
            <label bind-text="bizData.label('fTime')"/>  
            <input bind-value="bizData.ref('fTime')" bind-readonly="bizData.ref('fTime')"/> 
          </div> 
        </td> 
      </tr> 
    </table>  
    <h3>描述的BizData组件</h3>  
    <div> 
      <a component="$UI/system/components/justep/button/button" class="btn btn-info btn-icon-left" onClick="{operation:'bizData1.new'}">
      <i/><span></span>
      </a>  
      <a onClick="{operation:'bizData1.refresh'}" component="$UI/system/components/justep/button/button"
        class="btn btn-info btn-icon-left">
      <i/><span></span>
      </a>  
      <a onClick="{params:{ids:'js:$m.ids'},operation:'bizData1.delete'}" component="$UI/system/components/justep/button/button"
        class="btn btn-info btn-icon-left">
      <i/><span></span>
      </a>  
      <a onClick="{operation:'bizData1.save'}" component="$UI/system/components/justep/button/button"
        class="btn btn-info btn-icon-left">
      <i/><span></span>
      </a>  
      <a onClick="createInput" component="$UI/system/components/justep/button/button"
        label="createInput" class="btn btn-info">
      <i/><span>createInput</span>
      </a>  
      <a onClick="createOutput" component="$UI/system/components/justep/button/button"
        label="createOutput" class="btn btn-info">
      <i/><span>createOutput</span>
      </a>  
      <a onClick="createTextarea" component="$UI/system/components/justep/button/button"
        label="createTextarea" class="btn btn-info">
      <i/><span>createTextarea</span>
      </a>  
      <a onClick="{operation:'bizData1.firstRow'}" component="$UI/system/components/justep/button/button"
        label="" class="btn btn-info btn-icon-left">
      <i/><span></span>
      </a>  
      <a component="$UI/system/components/justep/button/button"
        class="btn btn-info btn-icon-left" onClick="{operation:'bizData1.prevRow'}">
      <i/><span></span>
      </a>  
      <a component="$UI/system/components/justep/button/button"
        class="btn btn-info btn-icon-right" onClick="{operation:'bizData1.nextRow'}">
      <i/><span></span>
      </a>  
      <a onClick="{operation:'bizData1.lastRow'}" component="$UI/system/components/justep/button/button"
        label="" class="btn btn-info btn-icon-right">
      <i/><span></span>
      </a> 
    </div>  
    <div>当前行:</div>  
    <div> 
      <label bind-text="bizData1.label('fString')"/>  
      <input component="$UI/system/components/justep/input/input" placeHolder="请输入字符串"
        style="width:300px" xid="input1" class="form-control" data="bizData1" bind-ref="bizData1.ref('fString')"/>  
      <input component="$UI/system/components/justep/input/password" placeHolder="请输入字符串"
        style="width:300px" xid="input1-pw" class="form-control" data="bizData1" bind-ref="bizData1.ref('fString')"/>  
      <span style="display: block;" component="$UI/system/components/justep/button/checkbox"
        class="x-checkbox" name="checkbox" value="1" label="选项----1" bind-ref="bizData1.ref('fString')"/>  
      <span component="$UI/system/components/justep/button/toggle" class="x-toggle"
        type="checkbox" name="checkbox1" value="1" ON="开" OFF="关" bind-ref="bizData1.ref('fString')"/>  
      <div component="$UI/system/components/justep/select/radioGroup" class="x-radio-group"
        _vertical="true" name="r" bind-itemset="selectData" bind-itemsetValue="ref('fString')"
        bind-itemsetLabel="ref('fString')" bind-ref="bizData1.ref('fString')"/> 
    </div>  
    <div> 
      <label bind-text="bizData1.label('fInteger')"/>  
      <input component="$UI/system/components/justep/input/range" xid="input2" 
        min="1" max="10000" data="bizData1" bind-ref="bizData1.ref('fInteger')"/> 
    </div>  
    <div> 
      <label bind-text="bizData1.label('fFloat')"/>  
      <input component="$UI/system/components/justep/input/input" placeHolder="请输入数值"
        xid="input3" class="form-control" data="bizData1" bind-ref="bizData1.ref('fFloat')"/> 
    </div>  
    <div> 
      <label bind-text="bizData1.label('fDecimal')"/>  
      <input component="$UI/system/components/justep/input/input" placeHolder="请输入数值"
        xid="input4" class="form-control" data="bizData1" bind-ref="bizData1.ref('fDecimal')"/> 
    </div>  
    <div xid="create-input"> 
      <label bind-text="bizData1.label('fDateTime')"/>  
      <input component="$UI/system/components/justep/input/input" placeHolder="请输入日期时间"
        xid="input5" class="form-control" data="bizData1" format="yy-MM-dd hh:mm" bind-ref="bizData1.ref('fDateTime')"/> 
    </div>  
    <div xid="create-output"> 
      <label bind-text="bizData1.label('fText')"/>  
      <select class="form-control" component="$UI/system/components/justep/select/select" bind-ref="bizData1.ref('fText')" bind-labelRef="bizData1.ref('fString')"
        bind-options="selectData" bind-optionsLabel="fString" bind-optionsValue="DEMO_TABLE1"
        bind-optionsCaption="请选择..."/>  
      <input component="$UI/system/components/justep/input/input" placeHolder="请输入text"
        xid="input6" class="form-control" data="bizData1" bind-ref="bizData1.ref('fText')"
        onRender="input6Render"/>  
      <input component="$UI/system/components/justep/input/input" placeHolder="请输入text"
        xid="input6-1" class="form-control" data="bizData1" bind-ref="bizData1.ref('fText')"/>  
      <span component="$UI/system/components/justep/button/checkbox" class="x-checkbox" bind-ref="bizData1.ref('fText')" label="选项----1"></span>
      <div component="$UI/system/components/justep/select/checkboxGroup" class="x-checkbox-group" 
        name="c" bind-itemset="selectData" bind-itemsetValue="ref('DEMO_TABLE1')"
        bind-itemsetLabel="ref('fString')" bind-ref="bizData1.ref('fText')"/> 
    </div>  
    <div> 
      <label bind-text="bizData1.label('fTime')"/>  
      <input component="$UI/system/components/justep/input/input" placeHolder="请输入时间"
        xid="input7" class="form-control" data="bizData1" bind-ref="bizData1.ref('fTime')"/> 
    </div>  
    <ul bind-foreach="bizData1.datas"> 
      <li bind-css="{ curRow:     $model.bizData1.currentRow.get() == $object }"> 
        <div> 
          <label bind-text="label('fString')"/>  
          <input component="$UI/system/components/justep/input/input" placeHolder="请输入字符串"
            xid="input1-1" class="form-control" data="bizData1" bind-ref="ref('fString')"/>  
          <span style="display: block;" component="$UI/system/components/justep/button/checkbox"
            class="x-checkbox" value="1" label="选项----1" bind-ref="ref('fString')"/>  
          <span component="$UI/system/components/justep/button/toggle" class="x-toggle"
            type="checkbox" value="1" ON="开" OFF="关" bind-ref="ref('fString')"/> 
        </div>  
        <div> 
          <label bind-text="label('fInteger')"/>  
          <input component="$UI/system/components/justep/input/input" xid="input2-1"
            class="form-control" data="bizData1" bind-ref="ref('fInteger')"/> 
        </div>  
        <div> 
          <label bind-text="label('fFloat')"/>  
          <input component="$UI/system/components/justep/input/input" xid="input3-1"
            class="form-control" data="bizData1" bind-ref="ref('fFloat')"/> 
        </div>  
        <div> 
          <label bind-text="label('fDecimal')"/>  
          <input component="$UI/system/components/justep/input/input" xid="input3-1"
            class="form-control" data="bizData1" bind-ref="ref('fDecimal')"/> 
        </div>  
        <div> 
          <label bind-text="label('fDateTime')"/>  
          <input component="$UI/system/components/justep/input/input" placeHolder="请输入日期时间"
            xid="input5-1" class="form-control" data="bizData1" format="yyyy-MM-dd hh:mm"
            bind-ref="ref('fDateTime')"/>  
          <div component="$UI/system/components/justep/output/output" placeHolder="请输入日期时间"
            xid="output5-1" class="x-output" data="bizData1" format="yyyy-MM-dd hh:mm"
            bind-ref="ref('fDateTime')"/> 
        </div>  
        <div> 
          <label bind-text="label('fText')"/>  
      <div component="$UI/system/components/justep/select/checkboxGroup" class="x-checkbox-group" 
        name="ccc" bind-itemset="$model.selectData" bind-itemsetValue="ref('DEMO_TABLE1')"
        bind-itemsetLabel="ref('fString')" bind-ref="ref('fText')"/> 
      <select class="form-control" component="$UI/system/components/justep/select/select" bind-ref="ref('fText')" bind-labelRef="ref('fString')"
        bind-options="$model.selectData" bind-optionsLabel="fString" bind-optionsValue="DEMO_TABLE1"
        bind-optionsCaption="请选择..."/>  
          <input component="$UI/system/components/justep/input/input" placeHolder="请输入text"
            xid="input6-2" class="form-control" data="bizData1" bind-ref="ref('fText')" onRender="input6Render"/>  
          <input component="$UI/system/components/justep/input/input" placeHolder="请输入text"
            xid="input6-21" class="form-control" data="bizData1" bind-ref="ref('fText')"/>  
          <div component="$UI/system/components/justep/output/output" xid="output6-21"
            class="x-output" data="bizData1" bind-ref="ref('fText')" onRender="output6Render"/>  
          <textarea component="$UI/system/components/justep/textarea/textarea" xid="textarea6-21"
            class="form-control" data="bizData1" bind-ref="ref('fText')"/> 
        </div>  
        <div> 
          <label bind-text="label('fTime')"/>  
          <input component="$UI/system/components/justep/input/input" xid="input3-1"
            class="form-control" data="bizData1" bind-ref="ref('fTime')"/> 
        </div> 
      </li> 
    </ul> 

    <h3>描述的Data组件</h3>  
    <div> 
      <a component="$UI/system/components/justep/button/button" onClick="{operation:'data1.new'}"
        label="" class="btn btn-info btn-icon-left"><i/><span></span></a>  
      <a onClick="{operation:'data1.refresh'}" component="$UI/system/components/justep/button/button"
        label="" class="btn btn-info btn-icon-left"><i/><span></span></a>  
      <a onClick="{operation:'data1.delete'}" component="$UI/system/components/justep/button/button"
        label="" class="btn btn-info btn-icon-left"><i/><span></span></a>  
      <a onClick="{operation:'data1.save'}" component="$UI/system/components/justep/button/button"
        label="" class="btn btn-info btn-icon-left"><i/><span></span></a>  
      <a onClick="{operation:'data1.firstRow'}" component="$UI/system/components/justep/button/button"
        label="" class="btn btn-info btn-icon-left"><i/><span></span></a>  
      <a onClick="{operation:'data1.prevRow'}" component="$UI/system/components/justep/button/button"
        label="" class="btn btn-info btn-icon-left"><i/><span></span></a>  
      <a onClick="{operation:'data1.nextRow'}" component="$UI/system/components/justep/button/button"
        label="" class="btn btn-info btn-icon-right"><i/><span></span></a>  
      <a onClick="{operation:'data1.lastRow'}" component="$UI/system/components/justep/button/button"
        label="" class="btn btn-info btn-icon-right"><i/><span></span></a> 
    </div> 
    <div>当前行:</div> 
    <div> 
      <label bind-text="data1.label('fName')"/>  
      <input component="$UI/system/components/justep/input/input" placeHolder="请输入名称"
        style="width:300px" xid="input51" class="form-control" data="data1" bind-ref="data1.ref('fName')"/>  
    </div>    
    <div> 
      <label bind-text="data1.label('fAge')"/>  
      <input component="$UI/system/components/justep/input/input" placeHolder="请输入年龄"
        style="width:300px" xid="input52" class="form-control" data="data1" bind-ref="data1.ref('fAge')"/>  
    </div>    
  </div> 
</div>
