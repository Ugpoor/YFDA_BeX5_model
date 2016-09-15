<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window" component="$UI/system/components/justep/window/window"
  design="device:pc">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:41px;top:284px;"> 
    <div component="$UI/system/components/justep/data/data" autoLoad="true"
      xid="data" idColumn="fID" onCustomRefresh="dataCustomRefresh"> 
      <column label="ID" name="fID" type="String" xid="xid10"/>  
      <column label="图片" name="img" type="String" xid="xid8"/>  
      <data xid="default2">[]</data> 
    </div>  
    <div component="$UI/system/components/justep/data/data" autoLoad="true"
      xid="numData" idColumn="num"> 
      <column label="数字" name="num" type="String" xid="xid9"/>  
      <column label="等级" name="grade" type="String" xid="xid1"/>  
      <data xid="default3">[{"num":"1"}]</data>
    </div> 
  </div>  
  <h4 xid="h42"><![CDATA[评星等级  
   ]]>
  <a component="$UI/system/components/justep/button/button" class="btn btn-link" label="js" xid="jsBtn" onClick="jsBtnClick">
   <i xid="i4"></i>
   <span xid="span9">js</span></a>
  <a component="$UI/system/components/justep/button/button" class="btn btn-link" label="源码" xid="sourceBtn" onClick="sourceClick">
   <i xid="i4"></i>
   <span xid="span9">源码</span></a></h4><div component="$UI/system/components/justep/controlGroup/controlGroup" class="x-control-group"
    xid="controlGroup"> 
    <div class="x-control-group-title" xid="controlGroupTitle1"> 
      <span xid="span1">title</span> 
    </div>  
    <div component="$UI/system/components/bootstrap/row/row" class="row" xid="row1"> 
      <div class="col col-xs-4" xid="col2" style="width:auto;"> 
        <div component="$UI/system/components/justep/list/list" class="x-list"
          xid="list1" data="data"> 
          <ul class="x-list-template" xid="listTemplateUl1"> 
            <li xid="li3" class="pull-left"> 
              <div component="$UI/system/components/justep/output/output" class="x-output output padd"
                xid="output" bind-ref="ref('img')" bind-mousemove="outputMousemove"
                bind-css="{&quot;img&quot;:  $model.numData.val(&quot;num&quot;)==1}" style="width:12px;height:14px;"/> 
            </li> 
          </ul> 
        </div> 
      </div>  
      <div class="col col-xs-1" xid="col3" style="width:auto;"> 
        <div component="$UI/system/components/justep/output/output" class="x-output"
          xid="output2" bind-ref="numData.ref('grade')"/> 
      </div> 
    </div> 
  </div> 
</div>
