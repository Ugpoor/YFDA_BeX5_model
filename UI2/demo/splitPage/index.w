<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window" component="$UI/system/components/justep/window/window"
  design="device:m;">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:47px;top:258px;">
    <div component="$UI/system/components/justep/data/data" autoLoad="true"
      xid="userData" idColumn="id" onCustomRefresh="userDataCustomRefresh" limit="5">
      <column label="ID" name="id" type="String" xid="xid1"/>  
      <column label="用户名" name="userName" type="String" xid="xid2"/>  
      <column label="密码" name="password" type="String" xid="xid3"/>  
      <column label="地址" name="address" type="String" xid="xid4"/>
    </div>
  </div>  
  <div component="$UI/system/components/justep/panel/panel" class="x-panel x-full"
    xid="panel1"> 
    <div class="x-panel-top" xid="top1">
      <div component="$UI/system/components/justep/titleBar/titleBar" class="x-titlebar"
        xid="titleBar1" title="查看用户信息"> 
        <div class="x-titlebar-left" xid="left1"/>  
        <div class="x-titlebar-title" xid="title1">查看用户信息</div>  
        <div class="x-titlebar-right reverse" xid="right1"/>
      </div>
    </div>  
    <div class="x-panel-content" xid="content1">
      <div component="$UI/system/components/justep/list/list" class="x-list"
        xid="userList" data="userData" limit="5"> 
        <ul class="x-list-template" xid="listTemplateUl1"> 
          <li xid="li1">
            <div component="$UI/system/components/justep/row/row" class="x-row"
              xid="row1"> 
              <div class="x-col" xid="col1">
                <div component="$UI/system/components/justep/output/output"
                  class="x-output" xid="output1" bind-ref="ref(&quot;userName&quot;)"/>
              </div>  
              <div class="x-col" xid="col2">
                <div component="$UI/system/components/justep/output/output"
                  class="x-output" xid="output2" bind-ref="ref(&quot;password&quot;)"/>
              </div>  
              <div class="x-col" xid="col3">
                <div component="$UI/system/components/justep/output/output"
                  class="x-output" xid="output3" bind-ref="ref(&quot;address&quot;)"/>
              </div>
            </div>
          </li>
        </ul> 
      </div>  
      <div component="$UI/system/components/justep/button/buttonGroup" class="btn-group btn-group-justified center-block"
        tabbed="true" xid="buttonGroup1">
        <a component="$UI/system/components/justep/button/button" class="btn btn-default"
          label="上一页" xid="prePage" onClick="prePageClick"> 
          <i xid="i1"/>  
          <span xid="span1">上一页</span>
        </a>
        <a component="$UI/system/components/justep/button/button" class="btn btn-default"
          label="下一页" xid="nextPage" onClick="nextPageClick"> 
          <i xid="i2"/>  
          <span xid="span2">下一页</span>
        </a>
      </div>
    </div>  
    <div class="x-panel-bottom" xid="bottom1"/>
  </div>
</div>
