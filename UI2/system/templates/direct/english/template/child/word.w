<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xmlns:xu="http://www.xmldb.org/xupdate"
  xmlns:xui="http://www.justep.com/xui" __id="id_1" extends="../parent/parent.w" component="$UI/system/components/justep/window/window"
  xid="window" class="window" design="device:m;">  
  <div xid="row1" xui:update-mode="delete"/>  
  <div xid="model" style="height:auto;left:420px;top:12px;" xui:update-mode="merge"/>  
  <div autoLoad="true" component="$UI/system/components/justep/data/data" idColumn="word"
    xid="wordData" xui:parent="model" xui:update-mode="insert"> 
    <column label="单词" name="word" type="String" xid="xid1"/>  
    <data xid="default1">[{"word":"四级单词"},{"word":"六级单词"},{"word":"考研单词"}]</data> 
  </div>  
  <div xid="content1" _xid="C6FC2BDD00B000017B1DD7F5C9E08D40" style="bottom: 0px;"
    class="x-panel-content  x-scroll-view" xui:update-mode="merge"/>  
  <div class="x-scroll" component="$UI/system/components/justep/scrollView/scrollView"
    xid="scrollView1_15" xui:parent="content1" xui:update-mode="insert"> 
    <div class="x-content-center x-pull-down container" xid="div1_15"> 
      <i class="x-pull-down-img glyphicon x-icon-pull-down" xid="i1_15"/>  
      <span class="x-pull-down-label" xid="span1_15">下拉刷新...</span> 
    </div>  
    <div class="x-scroll-content" xid="div2_15"> 
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
      <img alt="" bind-attr-src=" $model.getImageUrl('9.jpg')" src="" style="width:100%;"
        xid="image1" xui:parent="content1" xui:update-mode="insert"/>  
      <div class="titleCss" xid="div3" xui:parent="content1" xui:update-mode="insert">每天更新100个单词</div>  
      <div class="x-control-group" component="$UI/system/components/justep/controlGroup/controlGroup"
        title="单词" xid="controlGroup1" xui:parent="content1" xui:update-mode="insert"> 
        <div class="x-control-group-title" xid="controlGroupTitle1"> 
          <span style="font-size:16px;" xid="span5">title</span> 
        </div>  
        <div class="x-list x-cards" component="$UI/system/components/justep/list/list"
          data="wordData" xid="list1"> 
          <ul class="x-list-template x-min-height list-group" componentname="$UI/system/components/justep/list/list#listTemplateUl"
            id="undefined_listTemplateUl1" xid="listTemplateUl1"> 
            <li class="x-min-height list-group-item" componentname="li(html)"
              id="undefined_li1" xid="li1"> 
              <div bind-ref="ref('word')" class="x-output" component="$UI/system/components/justep/output/output"
                style="font-size:16px;" xid="output1"/> 
            </li> 
          </ul> 
        </div> 
      </div> 
    </div>  
    <div class="x-content-center x-pull-up" xid="div3_15"> 
      <span class="x-pull-up-label" xid="span2_15">加载更多...</span> 
    </div> 
  </div> 
</div>
