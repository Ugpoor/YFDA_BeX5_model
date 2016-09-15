<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" class="main13" component="$UI/system/components/justep/window/window"
  design="device:mobile;" xid="window">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:13px;top:202px;"> 
    <div component="$UI/system/components/justep/data/data" autoLoad="true"
      xid="classData" idColumn="fID" onCustomRefresh="classDataCustomRefresh"> 
      <column label="id" name="fID" type="String" xid="default1"/>  
      <column label="标题" name="fTitle" type="String" xid="default2"/>  
      <column label="图片" name="fImg" type="String" xid="default3"/>  
      <column label="价格" name="fNote" type="String" xid="default4"/> 
    </div> 
  </div>  
  <div component="$UI/system/components/justep/list/list" class="x-list" xid="list2"
    data="classData"> 
    <ul class="x-list-template" xid="listTemplateUl2" bind-click="listClick"> 
      <li xid="li2" class="list-group-item x-flex"> 
        <div xid="div2" class="media-left"> 
          <a xid="a2"> 
            <img alt="" xid="image3" class="img-rounded img-responsive img5"
              bind-attr-src="$model.getImageUrl(val('fImg'))"/>
          </a> 
        </div>  
        <div class="x-flex1" xid="div1"> 
          <h4 bind-text="ref('fTitle')" style="text-align: justify;" xid="h41"/>  
          <span bind-text="ref('fNote')" class="text-muted" style="text-align: justify;"
            xid="span1"/>
        </div>  
        <div class="text-muted" xid="div3"> 
          <a component="$UI/system/components/justep/button/button" class="btn btn-only-icon"
            label="button" xid="button27" icon="icon-ios7-arrow-forward"> 
            <i xid="i33" class="text-muted icon-ios7-arrow-forward"/>  
            <span xid="span11"/>
          </a> 
        </div> 
      </li> 
    </ul> 
  </div>
</div>
