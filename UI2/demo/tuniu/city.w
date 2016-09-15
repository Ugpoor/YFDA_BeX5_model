<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" class="main13" component="$UI/system/components/justep/window/window"
  design="device:m;" xid="window">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:308px;top:194px;"> 
    <div component="$UI/system/components/justep/data/data" autoLoad="true"
      xid="cityData" idColumn="fID" onCustomRefresh="cityDataCustomRefresh"> 
      <column label="id" name="fID" type="String" xid="xid1"/>  
      <column label="名称" name="fName" type="String" xid="xid2"/>  
      <column label="热门" name="fHot" type="String" xid="xid3"/>  
      <column label="拼音首字母" name="fPinyin" type="String" xid="xid4"/>  
      <column label="当前选中" name="fCurrent" type="Integer" xid="xid6"/> 
    </div>  
    <div component="$UI/system/components/justep/data/data" autoLoad="true"
      xid="data" idColumn="fPinyin"> 
      <column label="拼音" name="fPinyin" type="String" xid="xid5"/>  
      <data xid="default1">[{"fPinyin":"A"},{"fPinyin":"B"},{"fPinyin":"C"},{"fPinyin":"D"},{"fPinyin":"F"},{"fPinyin":"G"},{"fPinyin":"H"},{"fPinyin":"J"},{"fPinyin":"K"},{"fPinyin":"L"},{"fPinyin":"M"},{"fPinyin":"N"},{"fPinyin":"Q"},{"fPinyin":"R"},{"fPinyin":"S"},{"fPinyin":"T"},{"fPinyin":"W"},{"fPinyin":"X"},{"fPinyin":"Y"},{"fPinyin":"Z"}]</data> 
    </div> 
  </div>  
  <span component="$UI/system/components/justep/windowReceiver/windowReceiver"
    xid="windowReceiver"/>  
  <div component="$UI/system/components/justep/panel/panel" class="x-panel x-full x-card"> 
    <div class="x-panel-content x-cards"> 
      <h5 xid="h51" class="text-muted">当前定位城市</h5>  
      <div xid="div1" class="currentCity panel"> 
        <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-only-icon text-success"
          xid="button6" icon="icon-ios7-location-outline" label="昆明"> 
          <i xid="i6" class="icon-ios7-location-outline"/>  
          <span xid="span6">昆明</span> 
        </a>  
        <span xid="span1"><![CDATA[昆明]]></span> 
      </div>  
      <h5 xid="h52" class="text-muted"><![CDATA[热门预定城市]]></h5>  
      <div component="$UI/system/components/justep/list/list" class="x-list cityList  panel"
        xid="list1" data="cityData" filter="$row.val(&quot;fHot&quot;)==&quot;1&quot;"> 
        <ul class="x-list-template" xid="listTemplateUl1" bind-click="listClick"> 
          <li xid="li1" class="col text-center" bind-css="{'current':val('fCurrent')==1}"> 
            <span xid="span2" bind-text="ref('fName')"/> 
          </li> 
        </ul> 
      </div>  
      <div component="$UI/system/components/justep/list/list" class="x-list clearfix"
        xid="list2" data="data"> 
        <ul class="x-list-template" xid="listTemplateUl2"> 
          <li xid="li2"> 
            <h5 xid="h53" class="text-muted" bind-text="ref('fPinyin')"><![CDATA[]]> </h5>  
            <div component="$UI/system/components/justep/list/list" class="x-list cityList clearfix panel"
              xid="list3" data="cityData" filter="$row.val('fPinyin')==$object.val('fPinyin')"> 
              <ul class="x-list-template" xid="listTemplateUl3" bind-click="listClick"> 
                <li xid="li3" class="col text-center" bind-css="{'current':val('fCurrent')==1}"> 
                  <span xid="span3" bind-text="ref('fName')"/> 
                </li> 
              </ul> 
            </div> 
          </li> 
        </ul> 
      </div> 
    </div> 
  </div> 
</div>
