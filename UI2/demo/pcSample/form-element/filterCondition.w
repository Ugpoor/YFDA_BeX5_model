<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window" component="$UI/system/components/justep/window/window"
  design="device:pc">  
  <div component="$UI/system/components/justep/model/model" xid="model" onLoad="modelLoad"
    style="height:auto;left:92px;top:18px;"> 
    <div component="$UI/system/components/justep/data/data" autoLoad="true"
      xid="data" idColumn="fID"> 
      <column label="ID" name="fID" type="String" xid="xid1"/>  
      <column label="员工" name="emp" type="String" xid="xid2"/>  
      <column label="实例数据" name="example" type="String" xid="xid3"/>  
      <column label="默认" name="default" type="String" xid="xid4"/>  
      <column label="初始值" name="init" type="String" xid="xid5"/>  
      <column label="动态选中" name="dynamic" type="String" xid="xid6"/>  
      <column label="品牌" name="brand" type="String" xid="xid7"/>  
      <column label="种类" name="class" type="String" xid="xid8"/>  
      <column label="列名" name="listing" type="String" xid="xid9"/>  
      <column label="功能" name="function" type="String" xid="xid12"/>  
      <column label="价格" name="price" type="String" xid="xid13"/>  
      <data xid="default1">[{"fID":"","emp":"员工1","example":"员工1","default":"员工1","init":"员工1","dynamic":"员工1","brand":"夏普","class":"等离子电视","listing":"品牌","function":"3D电视","price":"1~1999"},{"fID":"","emp":"员工2","example":"员工2","default":"员工2","init":"员工2","dynamic":"员工2","brand":"索尼","class":"LCD背光电视","listing":"种类","function":"非3D电视","price":"2000~3999"},{"fID":"","emp":"员工3","example":"员工3","default":"员工3","init":"员工3","dynamic":"员工3","brand":"三星","class":"LED背光电视","listing":"功能","function":"智能电视","price":"4000~5999"},{"fID":"","emp":"员工4","example":"员工4","default":"员工4","init":"员工4","dynamic":"员工4","brand":"海信","class":"LED液晶电视","listing":"价格","function":"非智能电视","price":"6000~9999"},{"emp":"员工5","example":"员工5","default":"员工5","init":"员工5","dynamic":"员工5","brand":"TCL","class":"OLED液晶电视","function":"网络电视","price":"10000~14999"},{"emp":"员工6","example":"员工6","default":"员工6","init":"员工6","dynamic":"员工6","brand":"创维","class":"LCD液晶电视","function":"非网络电视","price":"15000~19999"},{"emp":"员工7","example":"员工7","default":"员工7","init":"员工7","dynamic":"员工7","brand":"飞利浦","class":"曲面电视","function":"4K超清智能","price":"20000~25999"},{"emp":"员工8","example":"员工8","default":"员工8","init":"员工8","dynamic":"员工8","brand":"长虹","class":"普通电视","function":"其它","price":"26000~30000"},{"emp":"员工9","example":"员工9","default":"员工9","init":"员工9","dynamic":"员工9","brand":"康佳","price":"30000以上"},{"emp":"员工10","brand":"熊猫"}]</data>
    </div>  
    <div component="$UI/system/components/justep/data/data" autoLoad="true"
      xid="columnData" idColumn="fID">
      <column label="ID" name="fID" type="String" xid="xid10"/>  
      <column label="列名" name="listing" type="String" xid="xid11"/>  
      <data xid="default2">[{"listing":"品牌"},{"listing":"种类"},{"listing":" 尺寸"},{"listing":"价格"}]</data>
    </div>  
    <div component="$UI/system/components/justep/data/data" autoLoad="true"
      xid="multipleData" idColumn="fID">
      <column label="ID" name="fID" type="String" xid="xid14"/>  
      <column label="品牌" name="brand" type="String" xid="xid15"/>  
      <column label="种类" name="class" type="String" xid="xid16"/>  
      <column label="尺寸" name="size" type="String" xid="xid17"/>  
      <column label="价格" name="price" type="String" xid="xid18"/>  
      <data xid="default3">[{"brand":"乐视","class":"4K超清","size":"32英寸及以下","price":" 0~1399"},{"brand":"飞利浦","class":"智能","size":"39-40英寸","price":"1400~3099"},{"brand":"海信","class":"非智能","size":"42-43英寸","price":"3100~5499"},{"brand":"小米","class":"网络","size":"46-49英寸","price":"5500~9099"},{"brand":"TCL","class":"非网络","size":"50-52英寸","price":"9100~17299"},{"brand":"康佳","class":"曲面","size":"55英寸","price":"17300~37999"},{"brand":"长虹","class":"激光","size":"58-60英寸","price":"38000~49999"},{"brand":"创维","class":"其它","size":"65英寸以上","price":"50000以上"}]</data>
    </div>
  </div>  
  <div component="$UI/system/components/justep/contents/contents" class="x-contents x-full"
    active="0" xid="contents"> 
    <div class="x-contents-content" xid="content1"> 
      <h4 xid="h41"><![CDATA[文件条件选择  
    ]]>
  <a component="$UI/system/components/justep/button/button" class="btn btn-link " label="js" xid="jsBtn" onClick="jsBtnClick">
   <i xid="i7"></i>
   <span xid="span13">js</span></a><a component="$UI/system/components/justep/button/button" class="btn btn-link " label="源码" xid="sourceBtn" bind-visible="isVisible" onClick="sourceClick">
   <i xid="i6"></i>
   <span xid="span12">源码</span></a>
  </h4><div component="$UI/system/components/justep/controlGroup/controlGroup"
        class="x-control-group" title="1.单选" xid="controlGroup1"> 
        <div class="x-control-group-title" xid="controlGroupTitle2"> 
          <span xid="span4">title</span>
        </div>  
        <div component="$UI/system/components/justep/list/list" class="x-list"
          xid="list2" data="data"> 
          <ul class="x-list-template" xid="listTemplateUl2"> 
            <li xid="li2" class="pull-left checked"> 
              <div component="$UI/system/components/bootstrap/row/row" class="row"
                xid="row1"> 
                <div class="col col-xs-4" xid="col1" style="height:auto;width:auto;"> 
                  <div component="$UI/system/components/justep/output/output"
                    class="x-output radio" xid="outputCkecked" bind-ref="ref('example')"
                    style="height:31px;width:105px;" bind-click="outputCkeckedClick"/>
                </div> 
              </div> 
            </li> 
          </ul> 
        </div>  
        <a component="$UI/system/components/justep/button/button" class="btn btn-link"
          label="获取选中值" xid="radioValueBtn" style="height:auto;width:auto;" onClick="radioValueBtnClick"> 
          <i xid="i2"/>  
          <span xid="span3">获取选中值</span>
        </a> 
      </div>
      <div component="$UI/system/components/justep/controlGroup/controlGroup"
        class="x-control-group" title="2.多选" xid="controlGroup2"> 
        <div class="x-control-group-title" xid="controlGroupTitle1"> 
          <span xid="span1">title</span> 
        </div>  
        <div component="$UI/system/components/justep/list/list" class="x-list"
          xid="list1" data="data"> 
          <ul class="x-list-template" xid="listTemplateUl1"> 
            <li xid="li1" class="pull-left checked"> 
              <div component="$UI/system/components/bootstrap/row/row" class="row"
                xid="row2"> 
                <div class="col col-xs-4" xid="col4" style="height:auto;width:auto;"> 
                  <div component="$UI/system/components/justep/output/output"
                    class="x-output output" xid="output" bind-ref="ref('emp')" style="height:31px;width:105px;"
                    bind-click="outputClick"/> 
                </div> 
              </div> 
            </li> 
          </ul> 
        </div>  
        <a component="$UI/system/components/justep/button/button" class="btn btn-link"
          label="获取选中值" xid="valueBtn" style="height:auto;width:auto;" onClick="valueBtnClick"> 
          <i xid="i1"/>  
          <span xid="span2">获取选中值</span> 
        </a> 
      </div>  
      <div component="$UI/system/components/justep/controlGroup/controlGroup"
        class="x-control-group" title="3.始终选中一项" xid="controlGroup3" style="height:155px;width:100%;"> 
        <div class="x-control-group-title" xid="controlGroupTitle3"> 
          <span xid="span5">title</span>
        </div>  
        <div component="$UI/system/components/justep/list/list" class="x-list"
          xid="list3" data="data"> 
          <ul class="x-list-template" xid="listTemplateUl3"> 
            <li xid="li3" class="pull-left "> 
              <div component="$UI/system/components/bootstrap/row/row" class="row"
                xid="row3"> 
                <div class="col col-xs-4" xid="col2" style="height:auto;width:auto;"> 
                  <div component="$UI/system/components/justep/output/output"
                    class="x-output default" xid="defaultOutput" bind-ref="ref('default')"
                    style="height:31px;width:105px;" bind-click="defaultOutputClick"/>
                </div> 
              </div> 
            </li> 
          </ul> 
        </div> 
      </div>  
      <div component="$UI/system/components/justep/controlGroup/controlGroup"
        class="x-control-group" title="4.设置初始值" xid="controlGroup4" style="height:154px;"> 
        <div class="x-control-group-title" xid="controlGroupTitle5" style="height:42px;"> 
          <span xid="span9">title</span>
        </div>  
        <div component="$UI/system/components/justep/list/list" class="x-list"
          xid="list5" data="data"> 
          <ul class="x-list-template" xid="listTemplateUl5"> 
            <li xid="li5" class="pull-left checked"> 
              <div component="$UI/system/components/bootstrap/row/row" class="row"
                xid="row5"> 
                <div class="col col-xs-4" xid="col5" style="height:auto;width:auto;"> 
                  <div component="$UI/system/components/justep/output/output"
                    class="x-output init" xid="initOutput" bind-ref="ref('init')"
                    style="height:31px;width:105px;" bind-click="initOutputClick"/>
                </div> 
              </div> 
            </li> 
          </ul> 
        </div> 
      </div>  
      <div component="$UI/system/components/justep/controlGroup/controlGroup"
        class="x-control-group" title="5.动态选中" xid="controlGroup5" style="height:175px;"> 
        <div class="x-control-group-title" xid="controlGroupTitle4"> 
          <span xid="span6">title</span>
        </div>  
        <div component="$UI/system/components/justep/list/list" class="x-list"
          xid="list4" data="data"> 
          <ul class="x-list-template" xid="listTemplateUl4"> 
            <li xid="li4" class="pull-left checked"> 
              <div component="$UI/system/components/bootstrap/row/row" class="row"
                xid="row4"> 
                <div class="col col-xs-4" xid="col3" style="height:auto;width:auto;"> 
                  <div component="$UI/system/components/justep/output/output"
                    class="x-output dynamic" xid="dynamicOutput" bind-ref="ref('dynamic')"
                    style="height:31px;width:105px;" bind-click="dynamicOutputClick"/>
                </div> 
              </div> 
            </li> 
          </ul> 
        </div>  
        <a component="$UI/system/components/justep/button/button" class="btn btn-link"
          label="选中前两项" xid="dynamicBtn" style="height:auto;width:auto;" onClick="dynamicBtnClick"> 
          <i xid="i3"/>  
          <span xid="span7">选中前两项</span>
        </a> 
      </div>  
      <div component="$UI/system/components/justep/controlGroup/controlGroup"
        class="x-control-group" title="6.综合" xid="controlGroup6" style="height:303px;"> 
        <div class="x-control-group-title" xid="controlGroupTitle6"> 
          <span xid="span8">title</span>
        </div>  
        <div component="$UI/system/components/bootstrap/row/row" class="row"
          xid="row8"> 
          <div class="col col-xs-2 col-sm-2 col-md-2 col-lg-2" xid="col10"
            style="background-color:#D7D7D7;">
            <div component="$UI/system/components/justep/list/list" class="x-list"
              xid="list7" data="columnData"> 
              <ul class="x-list-template x-min-height" xid="listTemplateUl7"
                componentname="$UI/system/components/justep/list/list#listTemplateUl"
                id="undefined_listTemplateUl7"> 
                <li xid="li7" class="x-min-height" componentname="li(html)"
                  id="undefined_li7"> 
                  <div component="$UI/system/components/bootstrap/row/row"
                    class="row" xid="row9"> 
                    <div class="col col-xs-2 col-sm-2 col-md-2 col-lg-2" xid="col13"
                      style="height:auto;width:auto;"> 
                      <div component="$UI/system/components/justep/output/output"
                        class="x-output padd" xid="output2" bind-ref="ref('listing')"
                        style="font-family:Arial;font-size:large;font-weight:bold;"/>
                    </div> 
                  </div> 
                </li> 
              </ul> 
            </div>
          </div>  
          <div class="col col-xs-10 col-sm-10 col-md-10 col-lg-10" xid="col12">
            <div component="$UI/system/components/justep/row/row" class="x-row"
              xid="row10" style="height:75px;width:100%;border-style:ridge ridge ridge ridge;"> 
              <div component="$UI/system/components/justep/list/list" class="x-list"
                xid="list8" data="multipleData"> 
                <ul class="x-list-template" xid="listTemplateUl8"> 
                  <li xid="li8" class="pull-left">
                    <div component="$UI/system/components/justep/output/output"
                      class="x-output brand" xid="brandOutput" bind-ref="ref('brand')"
                      style="height:31px;width:105px;text-align:center;" bind-click="brandOutputClick"/>
                  </li> 
                </ul> 
              </div>
            </div>  
            <div component="$UI/system/components/justep/row/row" class="x-row"
              xid="row11" style="height:75px;width:100%;border-style:ridge ridge ridge ridge;">
              <div component="$UI/system/components/justep/list/list" class="x-list"
                xid="list9" data="multipleData"> 
                <ul class="x-list-template" xid="listTemplateUl9"> 
                  <li xid="li9" class="pull-left">
                    <div component="$UI/system/components/justep/output/output"
                      class="x-output form class" xid="classOutput" bind-ref="ref('class')"
                      style="height:31px;width:105px;text-align:center;" bind-click="classOutputClick"/>
                  </li>
                </ul> 
              </div>
            </div>  
            <div component="$UI/system/components/justep/row/row" class="x-row"
              xid="row12" style="height:75px;width:100%;border-style:ridge ridge ridge ridge;"> 
              <div component="$UI/system/components/justep/list/list" class="x-list"
                xid="list10" data="multipleData"> 
                <ul class="x-list-template" xid="listTemplateUl10"> 
                  <li xid="li10" class="pull-left">
                    <div component="$UI/system/components/justep/output/output"
                      class="x-output form size" xid="sizeOutput" bind-ref="ref('size')"
                      style="height:31px;width:105px;text-align:center;" bind-click="sizeOutputClick"/>
                  </li>
                </ul> 
              </div>
            </div>  
            <div component="$UI/system/components/justep/row/row" class="x-row"
              xid="row14" style="height:75px;width:100%;border-style:ridge ridge ridge ridge;">
              <div component="$UI/system/components/justep/list/list" class="x-list"
                xid="list11" data="multipleData"> 
                <ul class="x-list-template" xid="listTemplateUl11"> 
                  <li xid="li11" class="pull-left">
                    <div component="$UI/system/components/justep/output/output"
                      class="x-output form price" xid="priceOutput" bind-ref="ref('price')"
                      style="height:31px;width:105px;text-align:center;" bind-click="priceOutputClick"/>
                  </li>
                </ul> 
              </div>
            </div>
          </div>
        </div>  
        <div component="$UI/system/components/bootstrap/row/row" class="row"
          xid="row24"> 
          <div class="col col-xs-5" xid="col17"/>
          <a component="$UI/system/components/justep/button/button" class="btn btn-link"
            label="提交" xid="submitBtn" onClick="submitBtnClick"> 
            <i xid="i5"/>  
            <span xid="span11">提交</span>
          </a>
          <a component="$UI/system/components/justep/button/button" class="btn btn-link"
            label="重置" xid="resetBtn" onClick="resetBtnClick"> 
            <i xid="i4"/>  
            <span xid="span10">重置</span>
          </a> 
        </div>
      </div>
    </div> 
  </div>  
  <span component="$UI/system/components/justep/messageDialog/messageDialog"
    xid="messageDialog" style="left:105px;top:12px;"/>
</div>
