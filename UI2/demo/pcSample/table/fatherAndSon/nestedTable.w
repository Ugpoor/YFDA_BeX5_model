<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window" component="$UI/system/components/justep/window/window"
  design="device:pc">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:226px;top:310px;">
    <div component="$UI/system/components/justep/data/data" autoLoad="true"
      xid="mainData" idColumn="mID">
      <column label="ID" name="mID" type="String" xid="xid16"/>  
      <column label="姓名" name="mName" type="String" xid="xid17"/>  
      <column label="性别" name="mSex" type="String" xid="xid18"/>  
      <column label="年龄" name="mAge" type="String" xid="xid19"/>  
      <column label="备注" name="mRemark" type="String" xid="xid20"/>  
      <data xid="default5">[{"mID":"1","mName":"张三","mSex":"男","mAge":"23","mRemark":"大家好，我叫张三，性别男，爱好女，身高180cm，体重180斤，有车有房有存款。"},{"mID":"2","mName":"李四","mSex":"女","mAge":"19","mRemark":"五十六个民族，五十六枝花，五十六个兄弟姐妹是一家，五十六种语言汇成一句话：钱不够花，钱不够花，钱不够花！！！"},{"mID":"3","mName":"小明","mSex":"男","mAge":"21","mRemark":"无所不能的小明是个传说，江湖中一直在流传，小明的传奇故事"}]</data>
    </div>
    <div component="$UI/system/components/justep/data/data" autoLoad="true"
      xid="secondData" idColumn="sid">
      <column label="ID" name="sid" type="String" xid="xid11"/>  
      <column label="课程" name="sOne" type="String" xid="xid5"/>  
      <column label="成绩" name="sTwo" type="String" xid="xid6"/>  
      <column label="描述" name="sThree" type="String" xid="xid7"/>  
      <column label="parent" name="parent" type="String" xid="xid9"/>  
      <data xid="default2">[{"sid":"1","sOne":"语文","sTwo":"110","sThree":"3+大综合","parent":"1"},{"sid":"2","sOne":"数学","sTwo":"120","sThree":"3+大综合","parent":"1"},{"sid":"3","sOne":"英语","sTwo":"110","sThree":"3+大综合","parent":"1"},{"sid":"4","sOne":"综合","sTwo":"210","sThree":"3+大综合","parent":"1"},{"sid":"5","sOne":"语文","sTwo":"120","sThree":"语数外","parent":"2"},{"sid":"6","sOne":"数学","sTwo":"105","sThree":"语数外","parent":"2"},{"sid":"7","sOne":"英语","sTwo":"125","sThree":"语数外","parent":"2"},{"sid":"8","sOne":"语文","sTwo":"110","sThree":"语文","parent":"3"},{"sid":"9","sOne":"数学","sTwo":"110","sThree":"数学","parent":"3"}]</data>
    </div>  
    <div component="$UI/system/components/justep/data/data" autoLoad="true"
      xid="aData" idColumn="mID">
      <column label="ID" name="mID" type="String" xid="xid10"/>  
      <column label="姓名" name="mName" type="String" xid="xid12"/>  
      <column label="性别" name="mSex" type="String" xid="xid13"/>  
      <column label="年龄" name="mAge" type="String" xid="xid14"/>  
      <column label="备注" name="mRemark" type="String" xid="xid15"/>  
      <data xid="default1">[{"mID":"1","mName":"张三","mSex":"男","mAge":"15","mRemark":"张三是何许人也"},{"mID":"2","mName":"李四","mSex":"女","mAge":"19","mRemark":"奋战高考300天"},{"mID":"3","mName":"王二","mSex":"男","mAge":"8","mRemark":"小P孩儿"}]</data>
    </div>  
    <div component="$UI/system/components/justep/data/data" autoLoad="true"
      xid="bData" idColumn="sId" onCustomRefresh="bDataCustomRefresh">
      <column label="ID" name="sId" type="String" xid="xid1"/>  
      <column label="课程" name="sCourse" type="String" xid="xid2"/>  
      <column label="成绩" name="sScore" type="String" xid="xid3"/>  
      <column label="描述" name="sDescribe" type="String" xid="xid4"/>  
      <column label="parent" name="parent" type="String" xid="xid8"/>  
      <data xid="default3">[]</data>
    </div>
  </div>  
  <h4 xid="h41"><![CDATA[父子表格]]>
    <a component="$UI/system/components/justep/button/button" class="btn btn-link"
      label="JS" xid="showJSButton" onClick="showJSButton"> 
      <i xid="i5"/>  
      <span xid="span1">JS</span>
    </a>
    <a component="$UI/system/components/justep/button/button" class="btn btn-link"
      label="源码" xid="source" onClick="sourceClick"> 
      <i xid="i6"/>  
      <span xid="span2">源码</span>
    </a>
  </h4>
  <h5 xid="h52"><![CDATA[1、基本使用－默认父子表格全部展开。]]></h5>
  <div component="$UI/system/components/fragment/list/listTable" data="mainData"
    masterData="" masterCol="" xid="listTable3" class="o-box"> 
    <div component="$UI/system/components/justep/list/list" class="x-list"
      data="mainData" xid="list3"> 
      <table class="table table-bordered table-hover table-striped table-condensed"
        component="$UI/system/components/bootstrap/table/table" xid="table3"> 
        <thead xid="thead3"> 
          <tr class="success" xid="tr6"> 
            <th width="60px" xid="col10"> 
              <label xid="label12"/>
            </th>  
            <th xid="col11"> 
              <label bind-text="$model.mainData.label('mName')" xid="label13"/>
            </th>  
            <th xid="col12"> 
              <label bind-text="$model.mainData.label('mSex')" xid="label14"/>
            </th>  
            <th xid="col13"> 
              <label bind-text="$model.mainData.label('mAge')" xid="label15"/>
            </th>  
            <th xid="col14"> 
              <label bind-text="$model.mainData.label('mRemark')" xid="label16"/>
            </th> 
          </tr> 
        </thead>  
        <tbody class="x-list-template" bind-click="$model!=$object?$object.data.to($object):null"
          xid="listTemplate3"> 
          <tr class="info" bind-click="function(){var $e = $($element);$('&gt;td&gt;i.x-expand-i',$e).toggleClass('icon-android-add');$e.next().toggleClass('hide');}"
            xid="tr7"> 
            <td class="text-center" style="vertical-align:middle;" xid="td11"> 
              <i class="x-expand-i " style="color:#808080;padding-right:6px;"
                xid="i3"/>  
              <label bind-text="$index()+1" xid="label17"/>
            </td>  
            <td xid="td12"> 
              <div component="$UI/system/components/justep/output/output" class="x-output"
                bind-ref="ref('mName')" xid="output8"/>
            </td>  
            <td xid="td13"> 
              <div component="$UI/system/components/justep/output/output" class="x-output"
                bind-ref="ref('mSex')" xid="output9"/>
            </td>  
            <td xid="td14"> 
              <div component="$UI/system/components/justep/output/output" class="x-output"
                bind-ref="ref('mAge')" xid="output10"/>
            </td>  
            <td xid="td15"> 
              <div component="$UI/system/components/justep/output/output" class="x-output"
                bind-ref="ref('mRemark')" xid="output11"/>
            </td> 
          </tr>  
          <tr xid="tr8"> 
            <td colspan="5" xid="td16"> 
              <div component="$UI/system/components/fragment/list/listTable"
                data="secondData" masterData="mainData" masterCol="parent" xid="listTable4"> 
                <div component="$UI/system/components/justep/list/list" class="x-list"
                  data="secondData" xid="list4"> 
                  <table class="table table-bordered table-hover table-striped table-condensed"
                    component="$UI/system/components/bootstrap/table/table" xid="table4"> 
                    <thead xid="thead4"> 
                      <tr class="danger" xid="tr9"> 
                        <th width="60px" xid="col15"> 
                          <label xid="label18"/>
                        </th>  
                        <th xid="col16"> 
                          <label bind-text="$model.secondData.label('sOne')"
                            xid="label19"/>
                        </th>  
                        <th xid="col17"> 
                          <label bind-text="$model.secondData.label('sTwo')"
                            xid="label20"/>
                        </th>  
                        <th xid="col18"> 
                          <label bind-text="$model.secondData.label('sThree')"
                            xid="label21"/>
                        </th> 
                      </tr> 
                    </thead>  
                    <tbody class="x-list-template" bind-click="$model!=$object?$object.data.to($object):null"
                      xid="listTemplate4"> 
                      <tr class="warning" xid="tr10"> 
                        <td class="text-center" style="vertical-align:middle;"
                          xid="td17"> 
                          <i class="x-expand-i " style="color:#808080;padding-right:6px;"
                            xid="i4"/>  
                          <label bind-text="$index()+1" xid="label22"/>
                        </td>  
                        <td xid="td18"> 
                          <div component="$UI/system/components/justep/output/output"
                            class="x-output" bind-ref="ref('sOne')" xid="output12"/>
                        </td>  
                        <td xid="td19"> 
                          <div component="$UI/system/components/justep/output/output"
                            class="x-output" bind-ref="ref('sTwo')" xid="output13"/>
                        </td>  
                        <td xid="td20"> 
                          <div component="$UI/system/components/justep/output/output"
                            class="x-output" bind-ref="ref('sThree')" xid="output14"/>
                        </td> 
                      </tr> 
                    </tbody> 
                  </table> 
                </div> 
              </div> 
            </td> 
          </tr> 
        </tbody> 
      </table> 
    </div> 
  </div>
  <hr xid="hr1"/>
  <h5 xid="h51"><![CDATA[2、另一种展开方式－父子表格全部折叠]]></h5>
  <div component="$UI/system/components/fragment/list/listTable" data="mainData"
    masterData="" masterCol="" xid="listTable1" class="o-box"> 
    <div component="$UI/system/components/justep/list/list" class="x-list"
      data="mainData" xid="list1"> 
      <table class="table table-bordered table-hover table-striped table-condensed"
        component="$UI/system/components/bootstrap/table/table" xid="table1"> 
        <thead xid="thead1"> 
          <tr class="success" xid="tr1"> 
            <th width="60px" xid="col1"> 
              <label xid="label1"/>
            </th>  
            <th xid="col2" style="width:180px;"> 
              <label bind-text="$model.mainData.label('mName')" xid="label2"/>
            </th>  
            <th xid="col3" style="width:180px;"> 
              <label bind-text="$model.mainData.label('mSex')" xid="label3"/>
            </th>  
            <th xid="col4" style="width:180px;"> 
              <label bind-text="$model.mainData.label('mAge')" xid="label4"/>
            </th>  
            <th xid="col5"> 
              <label bind-text="$model.mainData.label('mRemark')" xid="label5"/>
            </th> 
          </tr> 
        </thead>  
        <tbody class="x-list-template" bind-click="$model!=$object?$object.data.to($object):null"
          xid="listTemplate1"> 
          <tr class="info" bind-click="function(){var $e = $($element);$('&gt;td&gt;i.x-expand-i',$e).toggleClass('icon-arrow-right-b');$e.next().toggleClass('hide');}"
            xid="tr2"> 
            <td class="text-center" style="vertical-align:middle;" xid="td1"> 
              <i class="x-expand-i icon-arrow-right-b" style="color:#808080;padding-right:6px;"
                xid="i1"/>  
              <label bind-text="$index()+1" xid="label6"/>
            </td>  
            <td xid="td2"> 
              <div component="$UI/system/components/justep/output/output" class="x-output"
                bind-ref="ref('mName')" xid="output1"/>
            </td>  
            <td xid="td3"> 
              <div component="$UI/system/components/justep/output/output" class="x-output"
                bind-ref="ref('mSex')" xid="output2"/>
            </td>  
            <td xid="td4"> 
              <div component="$UI/system/components/justep/output/output" class="x-output"
                bind-ref="ref('mAge')" xid="output3"/>
            </td>  
            <td xid="td5"> 
              <div component="$UI/system/components/justep/output/output" class="x-output"
                bind-ref="ref('mRemark')" xid="output4"/>
            </td> 
          </tr>  
          <tr class="hide" xid="tr3"> 
            <td colspan="5" xid="td6"> 
              <div component="$UI/system/components/fragment/list/listTable"
                data="secondData" masterData="mainData" masterCol="parent" xid="listTable2"> 
                <div component="$UI/system/components/justep/list/list" class="x-list"
                  data="secondData" xid="list2"> 
                  <table class="table table-bordered table-hover table-striped table-condensed"
                    component="$UI/system/components/bootstrap/table/table" xid="table2"> 
                    <thead xid="thead2"> 
                      <tr class="danger" xid="tr4"> 
                        <th width="60px" xid="col6"> 
                          <label xid="label7"/>
                        </th>  
                        <th xid="col7"> 
                          <label bind-text="$model.secondData.label('sOne')"
                            xid="label8"/>
                        </th>  
                        <th xid="col8"> 
                          <label bind-text="$model.secondData.label('sTwo')"
                            xid="label9"/>
                        </th>  
                        <th xid="col9"> 
                          <label bind-text="$model.secondData.label('sThree')"
                            xid="label10"/>
                        </th> 
                      </tr> 
                    </thead>  
                    <tbody class="x-list-template" bind-click="$model!=$object?$object.data.to($object):null"
                      xid="listTemplate2"> 
                      <tr class="warning" xid="tr5"> 
                        <td class="text-center" style="vertical-align:middle;"
                          xid="td7"> 
                          <i class="x-expand-i " style="color:#808080;padding-right:6px;"
                            xid="i2"/>  
                          <label bind-text="$index()+1" xid="label11"/>
                        </td>  
                        <td xid="td8"> 
                          <div component="$UI/system/components/justep/output/output"
                            class="x-output" bind-ref="ref('sOne')" xid="output5"/>
                        </td>  
                        <td xid="td9"> 
                          <div component="$UI/system/components/justep/output/output"
                            class="x-output" bind-ref="ref('sTwo')" xid="output6"/>
                        </td>  
                        <td xid="td10"> 
                          <div component="$UI/system/components/justep/output/output"
                            class="x-output" bind-ref="ref('sThree')" xid="output7"/>
                        </td> 
                      </tr> 
                    </tbody> 
                  </table> 
                </div> 
              </div> 
            </td> 
          </tr> 
        </tbody> 
      </table> 
    </div> 
  </div>
  <hr xid="hr2"/>
  <h5 xid="h53"><![CDATA[3、ajax加载子表－点击表格行ajax加载]]></h5>
  <div component="$UI/system/components/fragment/list/listTable" data="aData"
    masterData="" masterCol="" xid="listTable5" class="o-box"> 
    <div component="$UI/system/components/justep/list/list" class="x-list"
      data="aData" xid="list6"> 
      <table class="table table-bordered table-hover table-striped table-condensed"
        component="$UI/system/components/bootstrap/table/table" xid="table5"> 
        <thead xid="thead6"> 
          <tr class="success" xid="tr11"> 
            <th width="60px" xid="col23"> 
              <label xid="label31"/>
            </th>  
            <th xid="col25" style="width:180px;"> 
              <label bind-text="$model.aData.label('mName')" xid="label32"/>
            </th>  
            <th xid="col24" style="width:180px;"> 
              <label bind-text="$model.aData.label('mSex')" xid="label33"/>
            </th>  
            <th xid="col20" style="width:180px;"> 
              <label bind-text="$model.aData.label('mAge')" xid="label28"/>
            </th>  
            <th xid="col19"> 
              <label bind-text="$model.aData.label('mRemark')" xid="label27"/>
            </th> 
          </tr> 
        </thead>  
        <tbody class="x-list-template" bind-click="$model!=$object?$object.data.to($object):null"
          xid="listTemplate5"> 
          <tr class="info" bind-click="function(){var $e = $($element);$('&gt;td&gt;i.x-expand-i',$e).toggleClass('icon-arrow-right-b');$e.next().toggleClass('hide');}"
            xid="tr12"> 
            <td class="text-center" style="vertical-align:middle;" xid="td24"> 
              <i class="x-expand-i icon-arrow-right-b" style="color:#808080;padding-right:6px;"
                xid="i8"/>  
              <label bind-text="$index()+1" xid="label26"/>
            </td>  
            <td xid="td26"> 
              <div component="$UI/system/components/justep/output/output" class="x-output"
                bind-ref="ref('mName')" xid="output18"/>
            </td>  
            <td xid="td25"> 
              <div component="$UI/system/components/justep/output/output" class="x-output"
                bind-ref="ref('mSex')" xid="output17"/>
            </td>  
            <td xid="td28"> 
              <div component="$UI/system/components/justep/output/output" class="x-output"
                bind-ref="ref('mAge')" xid="output16"/>
            </td>  
            <td xid="td27"> 
              <div component="$UI/system/components/justep/output/output" class="x-output"
                bind-ref="ref('mRemark')" xid="output15"/>
            </td> 
          </tr>  
          <tr xid="tr13" class="hide"> 
            <td colspan="5" xid="td30"> 
              <div component="$UI/system/components/fragment/list/listTable"
                data="bData" masterData="aData" masterCol="parent" xid="listTable6"> 
                <div component="$UI/system/components/justep/list/list" class="x-list"
                  data="bData" xid="list5"> 
                  <table class="table table-bordered table-hover table-striped table-condensed"
                    component="$UI/system/components/bootstrap/table/table" xid="table6"> 
                    <thead xid="thead5"> 
                      <tr class="danger" xid="tr14"> 
                        <th width="60px" xid="col22"> 
                          <label xid="label25"/>
                        </th>  
                        <th xid="col21"> 
                          <label xid="label30" bind-text="$model.bData.label('sCourse')"/>
                        </th>  
                        <th xid="col27"> 
                          <label bind-text="$model.bData.label('sScore')" xid="label29"/>
                        </th>  
                        <th xid="col26"> 
                          <label bind-text="$model.bData.label('sDescribe')"
                            xid="label24"/>
                        </th> 
                      </tr> 
                    </thead>  
                    <tbody class="x-list-template" bind-click="$model!=$object?$object.data.to($object):null"
                      xid="listTemplate6"> 
                      <tr class="warning" xid="tr15"> 
                        <td class="text-center" style="vertical-align:middle;"
                          xid="td29"> 
                          <i class="x-expand-i " style="color:#808080;padding-right:6px;"
                            xid="i7"/>  
                          <label bind-text="$index()+1" xid="label23"/>
                        </td>  
                        <td xid="td23"> 
                          <div component="$UI/system/components/justep/output/output"
                            class="x-output" bind-ref="ref('sCourse')" xid="output21"/>
                        </td>  
                        <td xid="td22"> 
                          <div component="$UI/system/components/justep/output/output"
                            class="x-output" bind-ref="ref('sScore')" xid="output20"/>
                        </td>  
                        <td xid="td21"> 
                          <div component="$UI/system/components/justep/output/output"
                            class="x-output" bind-ref="ref('sDescribe')" xid="output19"/>
                        </td> 
                      </tr> 
                    </tbody> 
                  </table> 
                </div> 
              </div> 
            </td> 
          </tr> 
        </tbody> 
      </table> 
    </div> 
  </div>
  </div>
