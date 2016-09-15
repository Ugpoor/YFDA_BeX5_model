<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" component="$UI/system/components/justep/window/window" design="device:m;"
  xid="window" class="window">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:358px;top:-4px;"> 
    <div component="$UI/system/components/justep/data/data" autoLoad="true"
      xid="categoryData" idColumn="fid"> 
      <column label="id" name="fid" type="String" xid="xid1"/>  
      <column label="小说类型：" name="name" type="String" xid="xid2"/>  
      <column label="value" name="value" type="String" xid="xid7"/>  
      <data xid="default1">[{"fid":"1","name":"言情","value":"111"},{"fid":"2","name":"都市","value":"222"},{"fid":"3","name":"玄幻","value":"333"}]</data>
    </div>  
    <div component="$UI/system/components/justep/data/data" autoLoad="true"
      xid="novelData" idColumn="name"> 
      <column label="小说名称：" name="name" type="String" xid="xid5"/>  
      <column label="" name="value" type="String" xid="xid6"/>  
      <data xid="default2">[{"id":"1","name":"步步惊心","value":"111"},{"id":"2","name":"特种教师","value":"111"},{"id":"3","name":"超级兵王","value":"111"},{"id":"4","name":"校花的贴身高手","value":"222"},{"id":"5","name":"最强弃少","value":"222"},{"id":"6","name":"权利巅峰","value":"222"},{"id":"7","name":"完美世界","value":"333"},{"id":"8","name":"斗破苍穹","value":"333"},{"id":"9","name":"大主宰","value":"333"}]</data>
    </div> 
  </div>  
  <div component="$UI/system/components/justep/panel/panel" class="x-panel x-full"
    xid="panel1"> 
    <div class="x-panel-top" xid="top1"> 
      <div component="$UI/system/components/justep/titleBar/titleBar" title="二级联动"
        class="x-titlebar"> 
        <div class="x-titlebar-left"> 
          <a component="$UI/system/components/justep/button/button" label=""
            class="btn btn-link btn-only-icon" icon="icon-chevron-left" onClick="{operation:'window.close'}"
            xid="backBtn"> 
            <i class="icon-chevron-left"/>  
            <span/> 
          </a> 
        </div>  
        <div class="x-titlebar-title">二级联动</div>  
        <div class="x-titlebar-right reverse"/> 
      </div> 
    </div>  
    <div class="x-panel-content" xid="content1"> 
      <div component="$UI/system/components/justep/contents/contents" class="x-contents x-full"
        active="0" xid="contents1"> 
        <div class="x-contents-content" xid="content2"> 
          <div component="$UI/system/components/justep/row/row" class="x-row"
            xid="row1" style="margin-top:10px;"> 
            <div class="x-col x-col-fixed" xid="col1" style="width:auto;">
              <span xid="span1" bind-text="$model.categoryData.label(&quot;name&quot;)"/>
            </div>  
            <div class="x-col" xid="col2">
              <select component="$UI/system/components/justep/select/select" bind-optionsCaption="请选择..."
                class="form-control" xid="category" bind-options="categoryData" bind-optionsValue="value"
                bind-optionsLabel="name" style="margin-top:-5px;" onChange="categoryChange"/>
            </div> 
          </div>  
          <div component="$UI/system/components/justep/row/row" class="x-row"
            xid="row2"> 
            <div class="x-col x-col-fixed" xid="col4" style="width:auto;">
              <span xid="span2" bind-text="$model.novelData.label(&quot;name&quot;)"/>
            </div>  
            <div class="x-col" xid="col5">
              <select component="$UI/system/components/justep/select/select" class="form-control"
                xid="novel" data-bind="                  options: novel,                  optionsText: 'name',                  optionsValue: 'value',             optionsCaption='请选择...'             "
                bind-optionsCaption="请选择" bind-labelRef="$model.novelData.ref(&quot;name&quot;)"
                style="margin-top:-5px;" onChange="novelChange"/>
            </div> 
          </div>  
          <span xid="categorySpan" style="margin-top:20px;margin-left:10px;"/>  
          <span xid="novelSpan"/>
        </div> 
      </div> 
    </div> 
  </div> 
</div>
