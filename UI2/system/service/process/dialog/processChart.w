<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xmlns:xu="http://www.xmldb.org/xupdate" sysParam="portal"
  xmlns:xui="http://www.justep.com/xui" component="$UI/system/components/justep/window/window" xid="window" class="window">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:193px;top:274px;"
    onLoad="modelLoad"/>  
  <span xid="windowReceive" component="$UI/system/components/justep/windowReceiver/windowReceiver"
    onReceive="windowReceiveReceive" style="left:332px;top:107px;"/>  
  <div class="x-processChart" xid="processChart" component="$UI/system/components/justep/processChart/processChart"
    onPertItemClick="pertItemClick" onTrackItemClick="trackItemClick"/> 
  <!--    
  <div style="width:100%;height:100%"> 
    <div class="x-processChart" xid="processChart" component="$UI/system/components/justep/processChart/processChart"
      onPertItemClick="pertItemClick" onTrackItemClick="trackItemClick"/> 
    <ul component="$UI/system/components/bootstrap/navs/navs" class="nav nav-tabs"> 
      <li role="presentation" class="active"> 
        <a bind-click="$model.comp('processChart').showTrack.bind($model.comp('processChart'))"><![CDATA[轨迹图]]></a> 
      </li>  
      <li xid="li4"> 
        <a bind-click="$model.comp('processChart').showPert.bind($model.comp('processChart'))" ><![CDATA[波特图]]></a> 
      </li> 
    </ul>
  </div>
  --> 
</div>
