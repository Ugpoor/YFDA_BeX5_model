<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" component="$UI/system/components/justep/window/window" design="device:m;"
  xid="window" class="window">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:102px;top:337px;"
    onModelConstructDone="modelModelConstructDone" onLoad="modelLoad"> 
    <div component="$UI/system/components/justep/data/data" autoLoad="true"
      xid="groupData" idColumn="id"> 
      <column name="id" type="String" xid="xid1"/>  
      <column label="分组" name="groupName" type="String" xid="xid2"/>  
      <data xid="default1">[{"id":"1","groupName":"我的设备"},{"id":"2","groupName":"手机通讯录"},{"id":"3","groupName":"我的好友"},{"id":"4","groupName":"同事"}]</data>  
      <column label="人数" name="count" type="Integer" xid="xid10"/>  
      <column label="在线人数" name="lineCount" type="Integer" xid="xid11"/>
    </div>  
    <div component="$UI/system/components/justep/data/data" autoLoad="true"
      xid="contactData" idColumn="id"> 
      <column name="id" type="String" xid="xid3"/>  
      <column label="组ID" name="groupID" type="String" xid="xid4"/>  
      <column label="名称" name="name" type="String" xid="xid5"/>  
      <column label="备注" name="note" type="String" xid="xid8"/>  
      <column label="网络" name="network" type="String" xid="xid6"/>  
      <column label="状态" name="state" type="String" xid="xid7"/>  
      <column label="头像" name="img" type="String" xid="xid9"/>  
      <data xid="default2">[{"id":"1","groupID":"1","name":"我的电脑","note":"无需数据线，手机轻松传文件到电脑","network":"","state":"在线","img":"./img/1.jpg"},{"id":"2","groupID":"1","name":"我的打印机","note":"将手机文件或照片发到电脑连接的打印机","state":"离线","img":"./img/2.jpg"},{"id":"3","groupID":"1","name":"发现新设备","note":"搜索附近的设备，用QQ轻松连接设备。","state":"离线","img":"./img/3.jpg"},{"id":"4","groupID":"2","name":"Ciel","network":"4G","state":"在线","img":"./img/4.jpg"},{"id":"5","groupID":"2","name":"曾经拥有","note":"","network":"W","state":"在线","img":"./img/5.jpg"},{"id":"6","groupID":"2","name":"华仔","note":"想要改变命运，首先改变自己","network":"W","state":"在线","img":"./img/6.jpg"},{"id":"7","groupID":"2","name":"御光剑影","network":"3G","state":"在线","img":"./img/7.jpg"},{"id":"8","groupID":"2","name":"寒北","network":"2G","state":"在线","img":"./img/8.jpg"},{"id":"9","groupID":"2","name":"被遗忘的角落","note":"新的人生，新的自己，一切从新开始！","network":"","state":"离线","img":"./img/9.jpg"},{"id":"10","groupID":"3","name":"泉哥","note":"","network":"3G","state":"在线","img":"./img/10.jpg"},{"id":"11","groupID":"3","name":"JACKIE","note":"游戏化思维、社会化学习、专业化生存","network":"","state":"离线","img":"./img/11.jpg"},{"id":"12","groupID":"3","name":"哈根达斯","note":"","state":"离线","img":"./img/12.jpg"}]</data>
    </div> 
  </div>  
  <div component="$UI/system/components/justep/panel/panel" class="x-panel x-full x-cards"
    xid="panel1"> 
    <div class="x-panel-top" xid="top1" height="48"> 
      <div component="$UI/system/components/justep/titleBar/titleBar" title="联系人"
        class="x-titlebar"> 
        <div class="x-titlebar-left"> 
          <img src="./img/4.jpg" alt="" xid="image2" class="img-circle o-headImg"/>
        </div>  
        <div class="x-titlebar-title">联系人</div>  
        <div class="x-titlebar-right reverse">
          <a component="$UI/system/components/justep/button/button" class="btn btn-link"
            label="添加" xid="button2"> 
            <i xid="i3"/>  
            <span xid="span15">添加</span>
          </a>
        </div> 
      </div> 
    </div>  
    <div class="x-panel-content" xid="content1"> 
      <div class="panel panel-default" component="$UI/system/components/bootstrap/panel/panel" xid="panel2">
   
   <div class="o-seach"><a component="$UI/system/components/justep/button/button" class="btn x-gray btn-sm btn-block" label="搜索" xid="button1" icon="icon-ios7-search-strong">
   <i xid="i1" class="icon-ios7-search-strong text-muted"></i>
   <span xid="span6" class="text-muted">搜索</span></a></div><div component="$UI/system/components/justep/row/row" class="x-row text-center o-types" xid="row2"> 
        <div class="x-col" xid="col4">
          <img src="./img/icon1.png" alt="" xid="image3" class="o-headImg" />  
          <p xid="p1" bind-text="'新朋友'" />
        </div>  
        <div class="x-col" xid="col5">
          <img src="./img/icon2.png" alt="" xid="image4" class="o-headImg" />  
          <p xid="p2" bind-text="'特别关心'" />
        </div>  
        <div class="x-col" xid="col6">
          <img src="./img/icon3.png" alt="" xid="image5" class="o-headImg" />  
          <p xid="p3" bind-text="'群组'" />
        </div>  
        <div class="x-col" xid="col7">
          <img src="./img/icon4.png" alt="" xid="image6" class="o-headImg" />  
          <p xid="p4" bind-text="'公众号'" />
        </div>
      </div></div>
      <ul component="$UI/system/components/justep/list/list" class="x-list x-list-template"
        xid="groupList" dataItemAlias="groupRow" data="groupData"> 
        <li xid="li1"> 
          <div component="$UI/system/components/justep/controlGroup/controlGroup"
            class="x-control-group o-group" title="title" xid="controlGroup1" collapsible="true"
            collapsed="true"> 
            <div class="x-control-group-title o-groupTitle" xid="controlGroupTitle1"> 
              <div xid="div1" class="pull-right text-muted o-count">
                <span xid="span8" bind-text="ref(&quot;lineCount&quot;)"/>
                <span xid="span9"><![CDATA[/]]></span>  
                <span xid="span10" bind-text="ref(&quot;count&quot;)"/> 
              </div>
              <i class="icon-arrow-right-b"/>  
              <span xid="span5" bind-text="ref(&quot;groupName&quot;)">title</span>
            </div>  
            <div component="$UI/system/components/justep/list/list" class="x-list o-contactList"
              xid="contactList" data="contactData" filter="$row.val('groupID')==groupRow.val('id')"> 
              <ul class="x-list-template" xid="listTemplateUl1"> 
                <li xid="li3">
                  <div class="media" xid="media1"> 
                    <div class="media-left" xid="mediaLeft1"> 
                      <a href="#" xid="a1"> 
                        <img class="media-object img-circle o-headImg" src=""
                          alt="" xid="image1" bind-attr-src="ref(&quot;img&quot;)" bind-css="{'o-offline':val('state')=='离线'}"/>
                      </a> 
                    </div>  
                    <div class="media-body" xid="mediaBody1"> 
                      <div xid="div2" class="pull-right text-muted">
                        <span xid="span13" bind-text="ref(&quot;network&quot;)" bind-visible="val(&quot;network&quot;)!='W'"/>  
                        <i xid="i2" class="icon-wifi" bind-visible="val(&quot;network&quot;)=='W'"/>
                      </div>
                      <h4 class="media-heading" xid="h41" bind-text="ref(&quot;name&quot;)">Media heading</h4>  
                      <span xid="span2" class="text-muted">[</span>  
                      <span xid="span3" bind-text="ref(&quot;state&quot;)" class="text-muted"/>  
                      <span xid="span4" class="text-muted">]</span>  
                      <span xid="span1" class="text-muted o-note" bind-text="ref(&quot;note&quot;)"/>
                    </div> 
                  </div>
                </li>
              </ul> 
            </div> 
          </div> 
        </li> 
      </ul> 
    </div> 
  </div> 
</div>
