<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window" component="$UI/system/components/justep/window/window"
  design="device:pc">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:234px;top:256px;"
    onLoad="modelLoad"> 
    <div component="$UI/system/components/justep/data/data" autoLoad="true"
      xid="data" idColumn="fID"> 
      <column label="ID" name="fID" type="String" xid="xid1"/>  
      <column label="类型" name="type" type="String" xid="xid2"/>  
      <column label="属性" name="property" type="String" xid="xid5"/>  
      <column label="年龄" name="age" type="String" xid="xid6"/>  
      <data xid="default1">[{"type":"全部","property":"正片","age":"全部"},{"type":"战斗","property":"连载","age":"6岁以下"},{"type":"热血","property":"完结","age":"6-12岁"},{"type":"冒险励志","property":"短片","age":"12-18岁"},{"type":" 英雄","age":"18岁以上"},{"type":" 后宫 "},{"type":"耽美"},{"type":" 魔法"},{"type":" 奇幻"},{"type":" 搞笑"},{"type":" 恋爱"},{"type":" 校园 "},{"type":"宠物"},{"type":" 日常 "},{"type":"童话"},{"type":" 惊悚"},{"type":"竞技"},{"type":"都市"},{"type":"动作"},{"type":"科幻"},{"type":"治愈"},{"type":"教育"},{"type":"怪物"},{"type":"成人"},{"type":"轻松"},{"type":"神话"},{"type":"生活"},{"type":"益智"},{"type":"机战"},{"type":"运动"},{"type":"神魔"},{"type":"真人"},{"type":"魔幻"},{"type":"LOLI"},{"type":"女性向"},{"type":"美少女"},{"type":"男性向"},{"type":"悬疑推理"}]</data> 
    </div>  
    <div component="$UI/system/components/justep/data/data" autoLoad="true"
      xid="numData" idColumn="fID"> 
      <column label="ID" name="fID" type="String" xid="xid3"/>  
      <column label="数字" name="num" type="String" xid="xid4"/>  
      <data xid="default2">[{"num":"1"}]</data>  
      <column label="内容" name="text" type="String" xid="xid9"/> 
    </div>  
    <div component="$UI/system/components/justep/data/data" autoLoad="true"
      xid="checkedData" idColumn="fID" confirmDelete="false"> 
      <column label="ID" name="fID" type="String" xid="xid7"/>  
      <column label="选中项" name="checked" type="String" xid="xid8"/> 
    </div> 
  </div>  
  <div component="$UI/system/components/justep/contents/contents" class="x-contents x-full"
    active="0" xid="contents"> 
    <div class="x-contents-content" xid="content1"> 
      <h4 xid="h41"><![CDATA[鼠标移入展开(单选)]]>
  <a component="$UI/system/components/justep/button/button" class="btn btn-link" label="js" xid="jsBtn" onClick="jsBtnClick">
   <i xid="i2"></i>
   <span xid="span3">js</span></a>
  <a component="$UI/system/components/justep/button/button" class="btn btn-link" label="源码" xid="sourceBtn" onClick="sourceClick">
   <i xid="i3"></i>
   <span xid="span4">源码</span></a></h4><div component="$UI/system/components/justep/controlGroup/controlGroup"
        class="x-control-group " xid="controlGroup1" style="height:48px;"> 
        <div class="x-control-group-title" xid="controlGroupTitle1"> 
          <span xid="span1">title</span> 
        </div>  
        <div xid="div2" class="mgr pull-left"> 
          <div component="$UI/system/components/justep/titleBar/titleBar" class="x-titlebar"
            xid="titleBar2" style="width:150px;background-color:#0080FF;color:#FFFFFF;"
            title="标题"> 
            <div class="x-titlebar-left" xid="div5"/>  
            <div class="x-titlebar-title" xid="div6">标题</div>  
            <div class="x-titlebar-right reverse" xid="div7"/> 
          </div>  
          <div xid="div4" style="height:auto;width:auto;"> 
            <label xid="label3"><![CDATA[按属性]]></label>  
            <div xid="div9" class="nature"> 
              <div component="$UI/system/components/justep/list/list" class="x-list"
                xid="list3" data="data"> 
                <ul class="x-list-template" xid="listTemplateUl3"> 
                  <li xid="li3" class="pull-left"> 
                    <div component="$UI/system/components/justep/output/output"
                      class="x-output  padd property pass" xid="propertyOutput" style="border-radius:4px;"
                      bind-ref="ref('property')" bind-click="propertyOutputClick"/> 
                  </li> 
                </ul> 
              </div> 
            </div> 
          </div>  
          <div xid="div8" style="height:auto;width:auto;"> 
            <label xid="label4"><![CDATA[按年龄]]></label>  
            <div xid="div10" class="style"> 
              <div component="$UI/system/components/justep/list/list" class="x-list"
                xid="list4" data="data"> 
                <ul class="x-list-template" xid="listTemplateUl4"> 
                  <li xid="li4" class="pull-left"> 
                    <div component="$UI/system/components/justep/output/output"
                      class="x-output  padd age pass" xid="ageOutput" style="border-radius:4px;"
                      bind-ref="ref('age')" bind-click="ageOutputClick"/> 
                  </li> 
                </ul> 
              </div> 
            </div> 
          </div>  
          <div xid="div3"> 
            <label xid="label2">按类型</label>  
            <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-xs btn-only-icon padding"
              label="button" xid="button1" icon="icon-chevron-right"> 
              <i xid="i1" class="icon-chevron-right"/>  
              <span xid="span2"/>
            </a>  
            <div xid="div" bind-mousemove="divMousemove" bind-css="{'css': $model.numData.val(&quot;num&quot;)==1,'big': $model.numData.val(&quot;num&quot;)==0}"
              bind-mouseout="div1Mouseout" style="border-style:ridge ridge ridge ridge;border-width:1px 1px 1px 1px;border-color:#FF8000 #FF8000 #FF8000 #FF8000;"> 
              <div component="$UI/system/components/justep/list/list" class="x-list"
                xid="list1" data="data"> 
                <ul class="x-list-template" xid="listTemplateUl1"> 
                  <li xid="li1" class="pull-left"> 
                    <div component="$UI/system/components/justep/output/output"
                      class="x-output  padd type pass" xid="typeOutput" style="border-radius:4px;"
                      bind-ref="ref('type')" bind-click="typeOutputClick"/>
                  </li> 
                </ul> 
              </div> 
            </div> 
          </div>
        </div>  
        <div xid="div1" style="border-style:ridge ridge ridge ridge;border-width:2px 2px 2px 2px;position:absolute;left:200px;width:80%;height:150px;"> 
          <div component="$UI/system/components/justep/row/row" class="x-row"
            xid="row1" style="position:relative;border-style:ridge ridge ridge ridge;border-width:2px 2px 2px 2px;"> 
            <label xid="label1" style="width:87px;height:30px;left:10px;position:relative;top:5px;"><![CDATA[筛选条件]]></label>  
            <div component="$UI/system/components/justep/list/list" class="x-list"
              xid="list6" data="checkedData"> 
              <ul class="x-list-template" xid="listTemplateUl6"> 
                <li xid="li6" class="pull-left "> 
                  <a component="$UI/system/components/justep/button/button"
                    class="btn btn-link btn-icon-right button" label="button" xid="button"
                    icon="icon-close-round" style="border-style:ridge ridge ridge ridge;border-width:1px 1px 1px 1px;border-color:#0080FF #0080FF #0080FF #0080FF;"
                    onClick="buttonClick"> 
                    <i xid="i4" class="icon-close-round"/>  
                    <span xid="span5" bind-text="ref('checked')" class="li"/> 
                  </a> 
                </li> 
              </ul> 
            </div> 
          </div>  
          <div component="$UI/system/components/justep/row/row" class="x-row"
            xid="row2" style="position:relative;"> 
            <div class="x-col" xid="col20"> 
              <div component="$UI/system/components/justep/row/row" class="x-row"
                xid="row7"> 
                <label xid="label5" style="width:87px;height:20px;"><![CDATA[选中项]]></label> 
              </div>  
              <div component="$UI/system/components/justep/row/row" class="x-row"
                xid="row8"> 
                <textarea component="$UI/system/components/justep/textarea/textarea"
                  class="form-control" xid="textarea3" bind-text=" $model.dataEach(event)"
                  style="resize:both;"/> 
              </div> 
            </div> 
          </div> 
        </div> 
      </div> 
    </div> 
  </div> 
</div>
