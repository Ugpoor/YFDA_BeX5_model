<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window portal-main-config" component="$UI/system/components/justep/window/window">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:31px;top:180px;"
    onLoad="modelLoad"> 
    <div component="$UI/system/components/justep/data/data" autoLoad="true"
      xid="widgetsData" idColumn="id"> 
      <column name="id" type="String" xid="xid1"/>  
      <column name="title" type="String" xid="xid2"/>  
      <column name="dir" type="String" xid="xid3"/>  
      <column name="open" type="Boolean" xid="xid4"/>  
    </div> 
  </div>  
  <span component="$UI/system/components/justep/windowReceiver/windowReceiver"
    xid="windowReceiver1" style="left:42px;top:50px;" onReceive="windowReceiver1Receive"/>  
  <div component="$UI/system/components/justep/panel/panel" class="x-panel x-full"
    xid="panel"> 
    <div class="x-panel-content" xid="content" style="overflow-x: hidden;"> 
      <div component="$UI/system/components/justep/tabs/tabs" class="x-tabs"
        xid="tabs1"> 
        <div component="$UI/system/components/justep/panel/panel" class="x-panel"
          xid="panel1"> 
          <div class="x-panel-top" xid="top1"> 
            <ul class="nav nav-tabs" xid="navs1"> 
              <li class="active" xid="li1"> 
                <a xid="tabItem1"><![CDATA[ 选择widget]]></a> 
              </li>  
              <li xid="li2"> 
                <a xid="tabItem2"><![CDATA[选择布局]]></a> 
              </li> 
            </ul> 
          </div>  
          <div class="x-panel-content" xid="content2"> 
            <div component="$UI/system/components/justep/contents/contents"
              class="x-contents" active="0" xid="contents1"> 
              <div class="x-contents-content active" xid="content1"> 
                <div component="$UI/system/components/justep/list/list" class="x-list"
                  xid="widgetsList" data="widgetsData"> 
                  <ul class="x-list-template list-group" xid="listTemplateUl2"> 
                    <li class="list-group-item" xid="li4"> 
                      <span component="$UI/system/components/justep/button/toggle"
                        class="x-toggle pull-right" xid="toggle2" bind-ref="ref('open')"
                        type="checkbox"/>  
                      <div component="$UI/system/components/justep/output/output"
                        class="x-output" xid="title" bind-ref="ref('title')"/> 
                    </li> 
                  </ul> 
                </div> 
              </div>  
              <div class="x-contents-content" xid="content3"> 
                <div class="container-fluid"> 
                  <div class="row"> 
                    <div class="col col-lg-4 col-md-6 col-sm-12 col-xs-12"> 
                      <img layoutID="layout1" class="item selected" src="$UI/portal/pc/main/config/img/layout4.png"
                        style="width: 100%;"/> 
                    </div>  
                    <div class="col col-lg-4 col-md-6 col-sm-12 col-xs-12"> 
                      <img layoutID="layout2" class="item" src="$UI/portal/pc/main/config/img/layout3.png"
                        style="width: 100%;"/> 
                    </div>  
                    <div class="col col-lg-4 col-md-6 col-sm-12 col-xs-12"> 
                      <img layoutID="layout3" class="item" src="$UI/portal/pc/main/config/img/layout1.png"
                        style="width: 100%;"/> 
                    </div>  
                    <div class="col col-lg-4 col-md-6 col-sm-12 col-xs-12"> 
                      <img layoutID="layout4" class="item" src="$UI/portal/pc/main/config/img/layout2.png"
                        style="width: 100%;"/> 
                    </div> 
                  </div> 
                </div> 
              </div> 
            </div> 
          </div> 
        </div> 
      </div> 
    </div>  
    <div class="x-panel-bottom" xid="bottom"> 
      <div style="width: 164px;margin: 0 auto;"> 
        <a component="$UI/system/components/justep/button/button" class="btn btn-default"
          label="确定" xid="okBtn" style="width: 80px;" onClick="okBtnClick"> 
          <i xid="i2"/>  
          <span xid="span2">确定</span> 
        </a>  
        <a component="$UI/system/components/justep/button/button" class="btn btn-link"
          label="取消" xid="cancelBtn" style="width: 80px;" onClick="{&quot;operation&quot;:&quot;windowReceiver1.windowCancel&quot;}"
          icon="icon"> 
          <span xid="span3"/> 
        </a> 
      </div> 
    </div> 
  </div> 
</div>
