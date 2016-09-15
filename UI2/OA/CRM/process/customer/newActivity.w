<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window" component="$UI/system/components/justep/window/window">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:481px;top:364px;"> 
    <div component="$UI/system/components/justep/data/bizData" xid="customerData"
      concept="OA_Customer" autoNew="false"> 
      <reader xid="default1" action="/OA/CRM/logic/action/queryOA_CustomerAction"/>  
      <writer xid="default2" action="/OA/CRM/logic/action/saveOA_CustomerAction"/>  
      <creator xid="default3" action="/OA/CRM/logic/action/createOA_CustomerAction"/>  
      <calculateRelation relation="fAreaInfo" xid="calculateRelation1"/>  
      <rule xid="rule1"> 
        <col name="fName" xid="ruleCol1"> 
          <required xid="required1"> 
            <expr xid="default16"/>  
            <message xid="default17"/>
          </required> 
        </col>  
        <col name="fAreaInfo" xid="ruleCol2"> 
          <calculate xid="calculate1"> 
            <expr xid="default18">js:  ($row.val("fProvince")?($row.val("fProvince")):'') + ($row.val("fCity")?('-' + $row.val("fCity")):'') + ($row.val("fZone")?('-' + $row.val("fZone")):'')</expr>
          </calculate> 
        </col> 
      </rule>
    </div>  
    <div component="$UI/system/components/justep/data/bizData" xid="custMoreData"
      concept="OA_CustomrMore" autoLoad="true"> 
      <reader xid="default4" action="/OA/CRM/logic/action/queryOA_CustomrMoreAction"/>  
      <writer xid="default5" action="/OA/CRM/logic/action/saveOA_CustomrMoreAction"/>  
      <creator xid="default6" action="/OA/CRM/logic/action/createOA_CustomrMoreAction"/>  
      <master xid="default7" data="customerData" relation="fCustomerID"/> 
    </div>  
    <div component="$UI/system/components/justep/data/bizData" xid="moreFieldData"
      concept="OA_CustomrMore"> 
      <reader xid="default8" action="/OA/CRM/logic/action/queryOA_CustomrMoreAction"/>  
      <writer xid="default9" action="/OA/CRM/logic/action/saveOA_CustomrMoreAction"/>  
      <creator xid="default10" action="/OA/CRM/logic/action/createOA_CustomrMoreAction"/> 
    </div>  
    <div component="$UI/system/components/justep/data/bizData" xid="provinceData"
      concept="DEMO_Province" autoLoad="false" limit="12"> 
      <reader xid="default11" action="/demo/common/logic/action/queryDEMO_ProvinceAction"/> 
    </div>  
    <div component="$UI/system/components/justep/data/bizData" xid="cityData"
      concept="DEMO_City" autoLoad="false" limit="12"> 
      <reader xid="default12" action="/demo/common/logic/action/queryDEMO_CityAction"/> 
    </div>  
    <div component="$UI/system/components/justep/data/bizData" xid="zoneData"
      concept="DEMO_Zone" autoLoad="false" limit="12"> 
      <reader xid="default13" action="/demo/common/logic/action/queryDEMO_ZoneAction"/> 
    </div>  
    <div component="$UI/system/components/justep/data/data" xid="statusData"
      idColumn="status" autoNew="true"> 
      <column label="col0" name="status" type="String" xid="default14"/>  
    </div> 
  </div>  
  <div component="$UI/system/components/justep/contents/contents" class="x-contents x-full"
    active="0" xid="contents"> 
    <div class="x-contents-content" xid="mainField"> 
      <div component="$UI/system/components/justep/panel/panel" class="x-panel x-full"
        xid="panel1"> 
        <div class="x-panel-top" xid="top1"> 
          <div component="$UI/system/components/justep/titleBar/titleBar" class="x-titlebar"
            xid="titleBar" title="新建客户"> 
            <div class="x-titlebar-left" xid="div1"> 
              <a component="$UI/system/components/justep/button/button" class="btn btn-link"
                label="" xid="backBtn" icon="icon-chevron-left" onClick="backBtnClick"> 
                <i xid="i1" class="icon-chevron-left"/>  
                <span xid="span1"/> 
              </a> 
            </div>  
            <div class="x-titlebar-title" xid="div2">新建客户</div>  
            <div class="x-titlebar-right reverse" xid="div3" style="width:94px;"> 
              <a component="$UI/system/components/justep/button/button" class="btn btn-link"
                label="" xid="saveBtn" icon="icon-checkmark-round" onClick="saveBtnClick"> 
                <i xid="i2" class="icon-checkmark-round"/>  
                <span xid="span2"/> 
              </a> 
            </div> 
          </div> 
        </div>  
        <div class="x-panel-content" xid="content4"> 
          <div xid="div25" class="input-group input-group-row"> 
            <span xid="span75" class="input-group-addon"><![CDATA[公司名称]]></span>  
            <input component="$UI/system/components/justep/input/input" class="form-control"
              xid="iptTheme" bind-ref="customerData.ref('fName')" style="text-align:right;"
              placeHolder="必填"/> 
          </div>  
          <div xid="div26" class="input-group input-group-row"> 
            <span xid="span76" class="input-group-addon"><![CDATA[简介]]></span>  
            <input component="$UI/system/components/justep/input/input" class="form-control"
              xid="iptContent" bind-ref="customerData.ref('fContent')" style="text-align:right;"
              placeHolder="选填"/> 
          </div>  
          <div xid="div20" class="input-group input-group-row"> 
            <span xid="span7" class="input-group-addon"><![CDATA[电话]]></span>  
            <input component="$UI/system/components/justep/input/input" class="form-control"
              xid="iptPhone" bind-ref="customerData.ref('fPhone')" style="text-align:right;"
              placeHolder="选填"/> 
          </div>  
          <div xid="div201" class="input-group input-group-row" bind-visible="$model.customerData.getValue('fPhone2')!= null"> 
            <span xid="span711" class="input-group-addon"><![CDATA[电话]]></span>  
            <input component="$UI/system/components/justep/input/input" class="form-control"
              xid="iptPhone2" bind-ref="customerData.ref('fPhone2')" style="text-align:right;"
              placeHolder="选填"/> 
          </div>  
          <div xid="div30" class="input-group input-group-row"> 
            <span xid="span307" class="input-group-addon"><![CDATA[网址]]></span>  
            <input component="$UI/system/components/justep/input/input" class="form-control"
              xid="ipturl" bind-ref="customerData.ref('fURL')" style="text-align:right;"
              placeHolder="选填"/> 
          </div>  
          <div xid="div21" class="input-group input-group-row" bind-click="selectProvinceClick"> 
            <span xid="span71" class="input-group-addon"><![CDATA[地域]]></span>  
            <!--  <input component="$UI/system/components/justep/input/input" class="form-control"
              xid="iptEndTime" bind-ref="customerData.ref('fProvince')" style="text-align:right;"
              placeHolder="请输入省"/>  -->  
            <div component="$UI/system/components/justep/output/output" class="x-output form-control"
              xid="output3" bind-ref="customerData.ref('fAreaInfo')" style="text-align:right;"/>  
            <span xid="span14" class="input-group-addon right-open"> 
              <i xid="i13" class="icon-chevron-right"/> 
            </span> 
          </div>  
          <div xid="div31" class="input-group input-group-row"> 
            <span xid="span317" class="input-group-addon"><![CDATA[地址]]></span>  
            <input component="$UI/system/components/justep/input/input" class="form-control"
              xid="iptPlace" bind-ref="customerData.ref('fAddr')" style="text-align:right;"
              placeHolder="选填" min="js:new Date()"/> 
          </div>  
          <div xid="div35" class="input-group input-group-row" bind-visible="$model.customerData.getValue('fEmployeeNum')!= null"> 
            <span xid="span357" class="input-group-addon"><![CDATA[员工数]]></span>  
            <input component="$UI/system/components/justep/input/input" class="form-control"
              xid="iptnum" bind-ref="customerData.ref('fEmployeeNum')" style="text-align:right;"/> 
          </div>  
          <div component="$UI/system/components/justep/list/list" class="x-list"
            xid="listMoreField" data="custMoreData" style="padding-right:0px;padding-left:0px;"> 
            <ul class="x-list-template" xid="listTemplateUl1"> 
              <li xid="li1"> 
                <div xid="div351" class="input-group input-group-row"> 
                  <span xid="span3571" class="input-group-addon" bind-text="ref('fFieldName')"><![CDATA[]]></span>  
                  <input component="$UI/system/components/justep/input/input"
                    class="form-control" xid="iptPlace1" bind-ref="ref('fFieldValue')"
                    style="text-align:right;"/> 
                </div> 
              </li> 
            </ul> 
          </div>  
          <div xid="divAddMore" class="input-group input-group-row" bind-click="divAddMoreClick"> 
            <span xid="span74" class="input-group-addon"><![CDATA[新增]]></span>  
            <div xid="iptAddMore" class="form-control" style="text-align:right;"/>  
            <span xid="span15" class="input-group-addon right-open"> 
              <i xid="i10" class="icon-chevron-right"/> 
            </span> 
          </div>  
          <div xid="div11"> 
            <div component="$UI/system/components/justep/attachment/attachment"
              access="duud" xid="attachment1" bind-ref="customerData.ref('fAttachment')"> 
              <div class="x-attachment" xid="div12"> 
                <div class="x-attachment-content x-card-border" xid="div13"> 
                  <div class="x-doc-process" xid="div14"> 
                    <div class="progress-bar x-doc-process-bar" role="progressbar"
                      style="width:0%;" xid="div15"/> 
                  </div>  
                  <div data-bind="foreach:$attachmentItems" xid="div16"> 
                    <div class="x-attachment-cell" xid="div17"> 
                      <div class="x-attachment-item x-item-other" data-bind="click:$model.previewOrRemoveItem.bind($model),style:{opacity: $model.$access.get() % 4 &gt;= 2 || $model.$state.get() == 'remove' ? '1.0' : '0.5',backgroundImage:($model.previewPicture.bind($model,$object))()}"
                        xid="div18"> 
                        <a data-bind="visible:$model.$state.get() == 'remove'"
                          class="x-remove-barget" xid="a1"/> 
                      </div> 
                    </div> 
                  </div>  
                  <div class="x-attachment-cell" data-bind="visible:$state.get() == 'upload' &amp;&amp; ($limit.get() == '-1' || $limit.get() &gt; $attachmentItems.get().length)"
                    xid="div19"> 
                    <div class="x-attachment-item x-item-upload" data-bind="visible:$state.get() == 'upload' &amp;&amp; $access.get() % 512 &gt;= 256"
                      xid="div27"/> 
                  </div>  
                  <div class="x-attachment-cell" data-bind="visible:$state.get() == 'upload' &amp;&amp; $attachmentItems.get().length &gt; 0"
                    xid="div28"> 
                    <div class="x-attachment-item x-item-remove" data-bind="click:changeState.bind($object,'remove'),visible:$access.get() % 2048 &gt;= 1024"
                      xid="div29"/> 
                  </div>  
                  <div style="clear:both;" xid="div32"/> 
                </div> 
              </div> 
            </div> 
          </div>  
          <div xid="div33"> 
            <div class="x-ro x-ro-border" component="$UI/system/components/justep/social/relativeOrg/relativeOrg"
              xid="relativeOrg1" groupName="负责人可以管理客户，建议添加主管部门经理等" groupID="E" data="customerData"
              bind-nameRef="customerData.ref('fName')" multiSelection="true" statusEnabled="false"> 
              <div component="$UI/system/components/justep/data/bizData" concept="SA_Social"
                xid="bizData3"/> 
            </div> 
          </div>  
          <div xid="div34"> 
            <div class="x-ro x-ro-border" component="$UI/system/components/justep/social/relativeOrg/relativeOrg"
              xid="relativeOrg2" groupID="P" groupName="相关人可以查看客户信息" data="customerData"
              bind-nameRef="customerData.ref('fName')" multiSelection="true" statusEnabled="false" socialData="bizData3"> 
              <div component="$UI/system/components/justep/data/bizData" concept="SA_Social"
                xid="bizData4"/> 
            </div> 
          </div>  
          <a component="$UI/system/components/justep/button/button" class="btn x-red"
            label="删除客户" xid="delBtn" style="width:100%;padding:10px 10px 10px 10px;"
            onClick="divDelClick" bind-visible="$model.statusData.val('status')=='edit'"> 
            <i xid="i4"/>  
            <span xid="span4">删除客户</span> 
          </a> 
        </div> 
      </div> 
    </div>  
    <div class="x-contents-content" xid="checkField"> 
      <div component="$UI/system/components/justep/panel/panel" class="x-panel x-full"
        xid="panel2"> 
        <div class="x-panel-top" xid="top2"> 
          <div component="$UI/system/components/justep/titleBar/titleBar" class="x-titlebar"
            xid="titleBar2" title="选择添加字段"> 
            <div class="x-titlebar-left" xid="div4"> 
              <a component="$UI/system/components/justep/button/button" class="btn btn-link"
                label="" xid="checkBackBtn" icon="icon-chevron-left" onClick="checkBackBtnClick"> 
                <i xid="i3" class="icon-chevron-left"/>  
                <span xid="span3"/> 
              </a> 
            </div>  
            <div class="x-titlebar-title" xid="div5">选择添加字段</div>  
            <div class="x-titlebar-right reverse" xid="div6"/> 
          </div> 
        </div>  
        <div class="x-panel-content" xid="content1"> 
          <div xid="div331" class="input-group input-group-row"> 
            <span xid="span3376" class="input-group-addon"><![CDATA[电话]]></span>  
            <input component="$UI/system/components/justep/input/input" class="form-control"
              xid="iptPhoneChe" bind-ref="customerData.ref('fPhone2')" style="text-align:right;"
              placeHolder="选填"/> 
          </div>  
          <div xid="div341" class="input-group input-group-row"> 
            <span xid="span347" class="input-group-addon"><![CDATA[员工数]]></span>  
            <input component="$UI/system/components/justep/input/input" class="form-control"
              xid="iptEployeeChe" bind-ref="customerData.ref('fEmployeeNum')" style="text-align:right;"
              placeHolder="选填"/> 
          </div>  
          <div xid="divAddField" class="input-group input-group-row" bind-click="divAddFieldClick"> 
            <span xid="span3572" class="input-group-addon"><![CDATA[自定义字段]]></span>  
            <div xid="iptAddMoreChe" class="form-control" style="text-align:right;"/>  
            <span xid="span16" class="input-group-addon right-open"> 
              <i xid="i11" class="icon-chevron-right"/>
            </span>
          </div> 
        </div>  
        <div class="x-panel-bottom" xid="bottom2"/> 
      </div> 
    </div>  
    <div class="x-contents-content" xid="moreField"> 
      <div component="$UI/system/components/justep/panel/panel" class="x-panel x-full"
        xid="panel3"> 
        <div class="x-panel-top" xid="top3"> 
          <div component="$UI/system/components/justep/titleBar/titleBar" class="x-titlebar"
            xid="titleBar3"> 
            <div class="x-titlebar-left" xid="div7"> 
              <a component="$UI/system/components/justep/button/button" class="btn btn-link"
                label="" xid="moreBaceBtn" icon="icon-chevron-left" onClick="moreBaceBtnClick"> 
                <i xid="i6" class="icon-chevron-left"/>  
                <span xid="span6"/> 
              </a> 
            </div>  
            <div class="x-titlebar-title" xid="div8"/>  
            <div class="x-titlebar-right reverse" xid="div9"> 
              <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-only-icon"
                label="保存" xid="moreSaveBtn" onClick="moreSaveBtnClick" icon="icon-android-checkmark"> 
                <i xid="i5" class="icon-android-checkmark"/>  
                <span xid="span5">保存</span> 
              </a> 
            </div> 
          </div> 
        </div>  
        <div class="x-panel-content" xid="content2"> 
          <div xid="div40" class="input-group input-group-row"> 
            <span xid="span407" class="input-group-addon"><![CDATA[]]></span>  
            <input component="$UI/system/components/justep/input/input" class="form-control"
              xid="input1" bind-ref="moreFieldData.ref('fFieldName')" placeHolder="请输入字段名称"
              style="text-align:center"/> 
          </div>  
          <div xid="div41" class="input-group input-group-row"> 
            <span xid="span417" class="input-group-addon"><![CDATA[]]></span>  
            <textarea component="$UI/system/components/justep/textarea/textarea"
              class="form-control" xid="textarea1" bind-ref="moreFieldData.ref('fFieldValue')"
              placeHolder="请输入字段内容" style="text-align:center"/> 
          </div> 
        </div>  
        <div class="x-panel-bottom" xid="bottom3"/> 
      </div> 
    </div>  
    <div class="x-contents-content" xid="province"> 
      <div component="$UI/system/components/justep/panel/panel" class="x-panel x-full"
        xid="panel4"> 
        <div class="x-panel-top" xid="top4"> 
          <div component="$UI/system/components/justep/titleBar/titleBar" class="x-titlebar"
            xid="titleBar4" title="省"> 
            <div class="x-titlebar-left" xid="div10"> 
              <a component="$UI/system/components/justep/button/button" class="btn btn-link"
                label="" xid="proBackBtn" icon="icon-chevron-left" bind-click="backMain"> 
                <i xid="i7" class="icon-chevron-left"/>  
                <span xid="span8"/> 
              </a> 
            </div>  
            <div class="x-titlebar-title" xid="div36">省</div>  
            <div class="x-titlebar-right reverse" xid="div37"/> 
          </div> 
        </div>  
        <div class="x-panel-content x-scroll-view" xid="content7"> 
          <div class="x-scroll" component="$UI/system/components/justep/scrollView/scrollView"
            xid="scrollView1"> 
            <div class="x-scroll-content" xid="div39"> 
              <div component="$UI/system/components/justep/list/list" class="x-list"
                xid="listProvince" limit="20" data="provinceData" bind-click="listProvinceClick"> 
                <ul class="x-list-template" xid="listTemplateUl2"> 
                  <li xid="liProvince"> 
                    <div xid="provincediv" class="input-group input-group-row"> 
                      <span xid="spanprovince" class="input-group-addon"><![CDATA[]]></span>  
                      <div component="$UI/system/components/justep/output/output"
                        class="form-control" xid="optprovince" bind-ref="ref('fName')"
                        style="text-align:left;"/> 
                    </div> 
                  </li> 
                </ul> 
              </div> 
            </div>  
            <div class="x-content-center x-pull-up" xid="div42"> 
              <span class="x-pull-up-label" xid="span9">加载更多...</span> 
            </div> 
          </div> 
        </div> 
      </div> 
    </div>  
    <div class="x-contents-content" xid="city"> 
      <div component="$UI/system/components/justep/panel/panel" class="x-panel x-full"
        xid="panel5"> 
        <div class="x-panel-top" xid="top5"> 
          <div component="$UI/system/components/justep/titleBar/titleBar" class="x-titlebar"
            xid="titleBar5" title="市"> 
            <div class="x-titlebar-left" xid="div43"> 
              <a component="$UI/system/components/justep/button/button" class="btn btn-link"
                label="" xid="cityBackBtn" icon="icon-chevron-left" bind-click="backMain"> 
                <i xid="i8" class="icon-chevron-left"/>  
                <span xid="span10"/> 
              </a> 
            </div>  
            <div class="x-titlebar-title" xid="div44">市</div>  
            <div class="x-titlebar-right reverse" xid="div45"/> 
          </div> 
        </div>  
        <div class="x-panel-content x-scroll-view" xid="content8"> 
          <div class="x-scroll" component="$UI/system/components/justep/scrollView/scrollView"
            xid="scrollView2"> 
            <div class="x-scroll-content" xid="div47"> 
              <div component="$UI/system/components/justep/list/list" class="x-list"
                xid="listCity" data="cityData" limit="20" bind-click="listCityClick"> 
                <ul class="x-list-template" xid="listTemplateUl3"> 
                  <li xid="liCity"> 
                    <div xid="citydiv" class="input-group input-group-row"> 
                      <span xid="spancity" class="input-group-addon"><![CDATA[]]></span>  
                      <div component="$UI/system/components/justep/output/output"
                        class="form-control" xid="optcity" bind-ref="ref('fName')"
                        style="text-align:left;"/> 
                    </div> 
                  </li> 
                </ul> 
              </div> 
            </div>  
            <div class="x-content-center x-pull-up" xid="div48"> 
              <span class="x-pull-up-label" xid="span11">加载更多...</span> 
            </div> 
          </div> 
        </div>  
        <div class="x-panel-bottom" xid="bottom5"/> 
      </div> 
    </div>  
    <div class="x-contents-content" xid="zone"> 
      <div component="$UI/system/components/justep/panel/panel" class="x-panel x-full"
        xid="panel6"> 
        <div class="x-panel-top" xid="top6"> 
          <div component="$UI/system/components/justep/titleBar/titleBar" class="x-titlebar"
            xid="titleBar6" title="区"> 
            <div class="x-titlebar-left" xid="div49"> 
              <a component="$UI/system/components/justep/button/button" class="btn btn-link"
                label="" xid="zoneBackBtn" icon="icon-chevron-left" bind-click="backMain"> 
                <i xid="i9" class="icon-chevron-left"/>  
                <span xid="span12"/> 
              </a> 
            </div>  
            <div class="x-titlebar-title" xid="div50">区</div>  
            <div class="x-titlebar-right reverse" xid="div51"/> 
          </div> 
        </div>  
        <div class="x-panel-content x-scroll-view" xid="content9"> 
          <div class="x-scroll" component="$UI/system/components/justep/scrollView/scrollView"
            xid="scrollView3"> 
            <div class="x-scroll-content" xid="div53"> 
              <div component="$UI/system/components/justep/list/list" class="x-list"
                xid="listZone" limit="20" data="zoneData" bind-click="listZoneClick"> 
                <ul class="x-list-template" xid="listTemplateUl4"> 
                  <li xid="liZone"> 
                    <div xid="zonediv" class="input-group input-group-row"> 
                      <span xid="zonespan" class="input-group-addon"><![CDATA[]]></span>  
                      <div component="$UI/system/components/justep/output/output"
                        class="form-control" xid="zoneopt" bind-ref="ref('fName')"
                        style="text-align:left;"/> 
                    </div> 
                  </li> 
                </ul> 
              </div> 
            </div>  
            <div class="x-content-center x-pull-up" xid="div54"> 
              <span class="x-pull-up-label" xid="span13">加载更多...</span> 
            </div> 
          </div> 
        </div>  
        <div class="x-panel-bottom" xid="bottom6"/> 
      </div> 
    </div> 
  </div>  
  <span component="$UI/system/components/justep/windowReceiver/windowReceiver"
    xid="windowReceiver" onReceive="windowReceiverReceive" style="left:138px;top:10px;"/>  
  <span component="$UI/system/components/justep/windowDialog/windowDialog" xid="mapDialog"
    src="$UI/OA/common/process/map.w" style="left:101px;top:9px;"/> 
<span component="$UI/system/components/justep/messageDialog/messageDialog" xid="closeMsgDlg" type="YesNo" onClose="closeMsgDlgClose" title="提示" message="是否取消当前操作？" style="left:62px;top:8px;"></span></div>
