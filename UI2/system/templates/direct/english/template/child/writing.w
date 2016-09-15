<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xmlns:xu="http://www.xmldb.org/xupdate"
  xmlns:xui="http://www.justep.com/xui" __id="id_1" extends="../parent/parent.w" component="$UI/system/components/justep/window/window"
  xid="window" class="window" design="device:m;">  
  <div xid="row1" xui:update-mode="delete"/>  
  <div xid="model" style="height:auto;left:420px;top:12px;" xui:update-mode="merge"/>  
  <div autoLoad="true" component="$UI/system/components/justep/data/data" idColumn="title"
    xid="recomData" xui:parent="model" xui:update-mode="insert"> 
    <column label="标题" name="title" type="String" xid="xid4"/>  
    <column label="时间" name="time" type="String" xid="xid5"/>  
    <column label="图片" name="photo" type="String" xid="xid6"/>  
    <data xid="default3">[{"title":"英语作文必备句式","time":"2015-12-12","photo":"6.jpg"},{"title":"新东方四级资料","time":"2015-12-12","photo":"7.jpg"},{"title":"好用的英语学习软件","time":"2015-12-12","photo":"8.jpg"}]</data> 
  </div>  
  <div xid="content1" _xid="C6FC2BE8FFA00001367512C113C05AE0" style="bottom: 0px;"
    class="x-panel-content  x-scroll-view" xui:update-mode="merge"/>  
  <div class="x-scroll" component="$UI/system/components/justep/scrollView/scrollView"
    xid="scrollView1_16" xui:parent="content1" xui:update-mode="insert"> 
    <div class="x-content-center x-pull-down container" xid="div1_16"> 
      <i class="x-pull-down-img glyphicon x-icon-pull-down" xid="i1_16"/>  
      <span class="x-pull-down-label" xid="span1_16">下拉刷新...</span> 
    </div>  
    <div class="x-scroll-content" xid="div2_16"> 
      <div __id="id_51" class="x-row" component="$UI/system/components/justep/row/row"
        style="background-color:#68c398;height:49px;" xid="row1"> 
        <div __id="id_52" class="x-col x-col-center" xid="col1"> 
          <a __id="id_53" class="btn btn-link" component="$UI/system/components/justep/button/button"
            label="英语角" style="color:#FFFFFF;font-size:18px;" xid="button2"> 
            <i __id="id_54" xid="i2"/>  
            <span __id="id_55" xid="span2">英语角</span> 
          </a> 
        </div>  
        <div __id="id_56" class="x-col x-col-fixed" style="width:auto;" xid="col2"> 
          <a __id="id_57" class="btn btn-link btn-only-icon" component="$UI/system/components/justep/button/button"
            icon="icon-person" label="button" onClick="openDemo" style="font-size:20px;color:#FFFFFF;height:38px;margin-top:-8px;"
            urlMapping="login" xid="loginBtn"> 
            <i __id="id_58" class="icon-person" xid="i3"/>  
            <span __id="id_59" xid="span3"/> 
          </a> 
        </div>  
        <div __id="id_60" class="x-col x-col-fixed" style="width:auto;" xid="col3"> 
          <a __id="id_61" class="btn btn-link btn-only-icon" component="$UI/system/components/justep/button/button"
            icon="icon-drag" label="button" onClick="menuBtnClick" style="font-size:20px;color:#FFFFFF;height:38px;margin-top:-8px;"
            xid="menuBtn"> 
            <i __id="id_62" class="icon-drag" xid="i4"/>  
            <span __id="id_63" xid="span4"/> 
          </a> 
        </div> 
      </div>  
      <div class="x-control-group" component="$UI/system/components/justep/controlGroup/controlGroup"
        title="为你推荐" xid="controlGroup1" xui:parent="content1" xui:update-mode="insert"> 
        <div class="x-control-group-title" style="font-size:18px;" xid="controlGroupTitle1"> 
          <span xid="span5">为你推荐</span> 
        </div>  
        <div class="x-list" component="$UI/system/components/justep/list/list"
          data="recomData" xid="list2"> 
          <ul class="x-list-template" xid="listTemplateUl2"> 
            <li xid="li2"> 
              <div class="x-row" component="$UI/system/components/justep/row/row"
                xid="row2"> 
                <div class="x-col x-col-33" xid="col4"> 
                  <img alt="" bind-attr-src=" $model.getImageUrl( val(&quot;photo&quot;))"
                    src="" style="width:100%;" xid="image3"/> 
                </div>  
                <div class="x-col" xid="col5"> 
                  <div bind-ref="ref('title')" class="x-output" component="$UI/system/components/justep/output/output"
                    style="font-size:18px;color:#272727;margin-top:-10px;" xid="output2"/>  
                  <div bind-ref="ref('time')" class="x-output" component="$UI/system/components/justep/output/output"
                    style="color:#898989;" xid="output3"/> 
                </div> 
              </div> 
            </li> 
          </ul> 
        </div> 
      </div> 
    </div>  
    <div class="x-content-center x-pull-up" xid="div3_16"> 
      <span class="x-pull-up-label" xid="span2_16">加载更多...</span> 
    </div> 
  </div> 
</div>
