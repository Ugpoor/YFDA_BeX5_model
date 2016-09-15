<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window " component="$UI/system/components/justep/window/window">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:73px;top:180px;"> 
    <div component="$UI/system/components/justep/data/data" xid="typeData"
      idColumn="visible" autoNew="true"> 
      <column label="col0" name="visible" type="String" xid="default2"/> 
    </div> 
  </div>  
  <span component="$UI/system/components/justep/messageDialog/messageDialog"
    xid="messageDialog" message="'演示数据初始化成功，请用demo重新登录后使用'"/>  
  <div component="$UI/system/components/justep/panel/panel" class="x-panel x-full initPage"
    xid="panel1"> 
    <div class="x-panel-top" xid="top1"> 
      <div component="$UI/system/components/justep/titleBar/titleBar" class="x-titlebar"
        xid="titleBar1" title="初始化演示数据"> 
        <div class="x-titlebar-left" xid="div1"> 
          <a component="$UI/system/components/justep/button/button" class="btn btn-link"
            xid="backBtn" icon="icon-chevron-left" bind-click="backBtnClick"> 
            <i xid="i1" class="icon-chevron-left"/>  
            <span xid="span1"/> 
          </a> 
        </div>  
        <div class="x-titlebar-title" xid="div2">初始化演示数据</div>  
        <div class="x-titlebar-right reverse" xid="div3"/> 
      </div> 
    </div>  
    <div class="x-panel-content" xid="content1"> 
      <div component="$UI/system/components/justep/row/row" class="x-row" xid="row1"
        style="height:50px;"> 
        <div class="x-col" xid="col1"/>  
        <div class="x-col x-col-80" xid="col2"> 
          <div xid="initBtn" bind-click="initBtnClick" style="text-align:center;background-color:#2fa4e7;padding-top:10px;padding-left:10px;height:40px;color:#FFFFFF;">初始化数据</div> 
        </div>  
        <div class="x-col" xid="col3"/> 
      </div>  
      <div component="$UI/system/components/justep/row/row" class="x-row" xid="row2"
        style="height:50px;"> 
        <div class="x-col" xid="col4"/>  
        <div class="x-col x-col-80" xid="col5"> 
          <label xid="lbProgress" style="width:100%;" bind-visible="$model.typeData.getValue('visible') == 'show'"><![CDATA[演示数据初始化中，请稍候。。。]]></label>  
          <label xid="label1" style="width:100%;" bind-visible="$model.typeData.getValue('visible') == 'finish'"><![CDATA[演示数据初始化完成！]]></label> 
        </div>  
        <div class="x-col" xid="col6"/> 
      </div>  
      </div>  
    <div class="x-panel-bottom" xid="bottom1"/> 
  </div> 
</div>
