<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window" component="$UI/system/components/justep/window/window"
  design="device:m;">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:153px;top:61px;"> 
    <div component="$UI/system/components/justep/data/data" autoLoad="true"
      xid="processData" idColumn="pro"> 
      <column label="流程" name="pro" type="String" xid="xid1"/>  
      <data xid="default1">[{"pro":"1、起步CEO致辞开始"},{"pro":"2、起步市场总监介绍"},{"pro":"3、起步技术总监介绍"}]</data> 
    </div>  
    <div component="$UI/system/components/justep/data/data" autoLoad="true"
      xid="timeData" idColumn="name"> 
      <column label="时间" name="name" type="String" xid="xid2"/>  
      <column label="内容" name="content" type="String" xid="xid3"/>  
      <data xid="default2">[{"name":"活动时间：","content":"2015-1-25 9：00-11：00"},{"name":"活动地点：","content":"北京起步科技有限公司"}]</data> 
    </div>  
    <div component="$UI/system/components/justep/data/data" autoLoad="true"
      xid="userData" idColumn="title"> 
      <column label="标题" name="title" type="String" xid="xid4"/>  
      <column label="内容" name="content" type="String" xid="xid5"/>  
      <data xid="default3">[{"title":"你的姓名*"},{"title":"E-mail*"},{"title":"联系电话*"}]</data> 
    </div> 
  </div>  
  <img src="" alt="" xid="image1" bind-attr-src='$model.toUrl("./img/1.jpg")'
    style="width:100%;"/>  
  <div component="$UI/system/components/justep/controlGroup/controlGroup" class="x-control-group"
    title="【活动流程】" xid="controlGroup1"> 
    <div class="x-control-group-title" xid="controlGroupTitle1"> 
      <span xid="span1" style="font-size:18px;"><![CDATA[【活动流程】]]></span> 
    </div>  
    <div component="$UI/system/components/justep/list/list" class="x-list"
      xid="list1" data="processData"> 
      <ul class="x-list-template" xid="listTemplateUl1"> 
        <li xid="li1"> 
          <div component="$UI/system/components/justep/output/output" class="x-output"
            xid="output1" bind-ref="ref('pro')" style="font-size:16px;"/> 
        </li> 
      </ul> 
    </div> 
  </div>  
  <div component="$UI/system/components/justep/controlGroup/controlGroup" class="x-control-group"
    title="【活动时间地点】" xid="controlGroup2"> 
    <div class="x-control-group-title" xid="controlGroupTitle2"> 
      <span xid="span2" style="font-size:18px;">title</span> 
    </div>  
    <div component="$UI/system/components/justep/list/list" class="x-list"
      xid="list2" data="timeData"> 
      <ul class="x-list-template" xid="listTemplateUl2"> 
        <li xid="li2"> 
          <div component="$UI/system/components/justep/row/row" class="x-row"
            xid="row1"> 
            <div class="x-col x-col-fixed" xid="col1" style="width:auto;"> 
              <label xid="label1" bind-text="ref('name')" style="font-size:16px;">label</label> 
            </div>  
            <div class="x-col" xid="col2"> 
              <div component="$UI/system/components/justep/output/output" style="margin-top:-8px;font-size:16px;"
                class="x-output" xid="output2" bind-ref="ref('content')"/> 
            </div> 
          </div> 
        </li> 
      </ul> 
    </div> 
  </div>  
  <img src="" alt="" xid="image2" bind-attr-src=' $model.toUrl("./img/2.jpg")'
    style="width:100%;"/>  
  <div component="$UI/system/components/justep/controlGroup/controlGroup" class="x-control-group"
    title="【欢迎报名】" xid="controlGroup3" style="margin-top:30px;"> 
    <div class="x-control-group-title" xid="controlGroupTitle3"> 
      <span xid="span3" style="font-size:18px;"><![CDATA[【欢迎报名】]]></span> 
    </div>  
    <div xid="div1" style="font-size:16px;margin-top:30px;margin-left:10px;">活动结束，还有神秘大礼相送</div>  
    <div component="$UI/system/components/justep/list/list" class="x-list"
      xid="list3" data="userData"> 
      <ul class="x-list-template" xid="listTemplateUl3"> 
        <li xid="li3" style="margin-top:30px;margin-left:10px;"> 
          <label xid="label3" bind-text="ref('title')" style="font-size:16px;">label</label>  
          <input component="$UI/system/components/justep/input/input" class="form-control"
            xid="input1"/> 
        </li> 
      </ul> 
    </div> 
  </div>  
  <div component="$UI/system/components/justep/controlGroup/controlGroup" class="x-control-group" title="活动负责人：XXX" xid="controlGroup4" style="margin-bottom: 20px;"> 
    <div class="x-control-group-title" xid="controlGroupTitle4"> 
      <span xid="span4" style="font-size:18px;"><![CDATA[活动负责人：XXX]]></span> 
    </div>  
    <div xid="div2" style="margin-top:10px;font-size:16px;margin-left:10px;">手机：XXXXXXXXX</div>  
    <div xid="div3" style="margin-top:10px;font-size:16px;margin-left:10px;">邮箱：XXXXXXXXX</div> 
  <a component="$UI/system/components/justep/button/button" class="btn btn-success center-block" label="我要报名" xid="enrollBtn" style="margin-top:20px;font-weight:bold;font-size:16px;">
   <i xid="i1"></i>
   <span xid="span5">我要报名</span></a></div> 
</div>
