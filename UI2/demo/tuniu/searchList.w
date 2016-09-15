<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" class="main" component="$UI/system/components/justep/window/window"
  design="device:m;" xid="window">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:308px;top:194px;"
    onLoad="modelLoad"> 
    <div component="$UI/system/components/justep/data/data" autoLoad="true"
      xid="productData" idColumn="fID" onCustomRefresh="productDataCustomRefresh"> 
      <column label="id" name="fID" type="String" xid="xid1"/>  
      <column label="标题" name="fTitle" type="String" xid="xid2"/>  
      <column label="图片" name="fImg" type="String" xid="xid3"/>  
      <column label="价格" name="fPrice" type="Float" xid="xid4"/>  
      <column label="原价" name="fOriginalPrice" type="String" xid="xid7"/>  
      <column label="满意度" name="fSatisfaction" type="Integer" xid="xid5"/>  
      <column label="点评" name="fComments" type="Integer" xid="xid6"/> 
    </div> 
  </div>  
  <div component="$UI/system/components/justep/panel/panel" class="x-panel x-full x-card"> 
    <div class="x-panel-top" height="88"> 
      <div component="$UI/system/components/justep/titleBar/titleBar" class="x-titlebar"> 
        <div class="x-titlebar-left text-success" xid="div6"> 
          <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-only-icon"
            xid="backBtn" icon="icon-chevron-left" label="昆明" onClick="backBtnClick"> 
            <i xid="i6" class="icon-chevron-left"/>  
            <span xid="span6">昆明</span> 
          </a> 
        </div>  
        <div class="x-titlebar-title"> 
          <div class="form-group has-feedback text-muted"> 
            <input component="$UI/system/components/justep/input/input" class="form-control input-sm" onChange="seachBtnClick"/>  
            <i class="icon-ios7-search-strong form-control-feedback"/> 
          </div> 
        </div>  
        <div class="x-titlebar-right reverse text-success" xid="div5"> 
          <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-only-icon"
            label="button" xid="homeBtn" icon="icon-home" onClick="homeBtnClick"> 
            <i xid="i12" class="icon-home"/>  
            <span xid="span21"/> 
          </a> 
        </div> 
      </div>  
      <div component="$UI/system/components/justep/button/buttonGroup" class="btn-group btn-group-justified"
        tabbed="true" xid="buttonGroup1">
        <div class="dropdown btn-group" component="$UI/system/components/bootstrap/dropdown/dropdown"
          xid="dropdown1"> 
          <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-right dropdown-toggle"
            label="30天销量" icon="icon-arrow-down-b" xid="button3"> 
            <i class="icon-arrow-down-b text-muted" xid="i3"/>  
            <span xid="span13" class="text-muted">30天销量</span>
          </a>  
          <ul component="$UI/system/components/justep/menu/menu" class="x-menu dropdown-menu"
            xid="menu1"> 
            <li class="x-menu-item" xid="item1"> 
              <a component="$UI/system/components/justep/button/button" class="btn btn-link"
                label="30天销量" xid="button4"> 
                <i xid="i4"/>  
                <span xid="span14">30天销量</span>
              </a> 
            </li>  
            <li class="x-menu-divider divider" xid="divider1"></li><li class="x-menu-item" xid="item2"> 
              <a component="$UI/system/components/justep/button/button" class="btn btn-link"
                label="60天销量" xid="button5"> 
                <i xid="i5"/>  
                <span xid="span15">60天销量</span>
              </a> 
            </li> 
          </ul> 
        </div>  
        <a component="$UI/system/components/justep/button/button" class="btn"
          label="筛选" xid="button9"> 
          <i xid="i11"/>  
          <span xid="span20" class="text-muted">筛选</span>
        </a>
      </div>
      </div>  
    <div class="x-panel-content"> 
      <div component="$UI/system/components/justep/list/list" class="x-list"
        xid="list1" data="productData"> 
        <ul class="x-list-template" xid="listTemplateUl1" bind-click="detailClick"> 
          <li xid="li1"> 
             
          <div class="media" xid="div4"><div class="media-left" xid="div2"> 
              <a><img alt="" xid="image1" class="img-rounded media-object" bind-attr-src="$model.getImageUrl(val('fImg'))" style="width:75px;" height="80px" /></a> 
            </div><div class="media-body"> 
              <h5 class="media-heading text-black" bind-text="ref('fTitle')"><![CDATA[]]></h5>  
              <div class="text-muted"> 
                <span xid="span27" class="text-danger">￥</span>  
                <span xid="span26" bind-text="ref('fPrice')" class="text-danger h4" />  
                <span xid="span23">起</span>  
                <span xid="span25" class="text-del">￥</span>  
                <span xid="span18" bind-text="ref('fOriginalPrice')" class="text-del" /> 
              </div>  
              <div class="text-muted"> 
                <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-only-icon" label="button" xid="button7" icon="icon-ios7-contact-outline"> 
                  <i xid="i9" class="icon-ios7-contact-outline text-muted" />  
                  <span xid="span22" /> 
                </a>  
                <span xid="span16" bind-text="ref('fComments')" />  
                <span xid="span29">点评</span>  
                <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-only-icon" label="button" xid="button6" icon="icon-ios7-heart-outline"> 
                  <i xid="i8" class="icon-ios7-heart-outline text-muted" />  
                  <span xid="span17" /> 
                </a>  
                <span xid="span30" bind-text="ref('fSatisfaction')" />  
                <span xid="span28">%满意</span> 
              </div> 
            </div></div></li> 
        </ul> 
      </div> 
    </div> 
  </div> 
</div>
