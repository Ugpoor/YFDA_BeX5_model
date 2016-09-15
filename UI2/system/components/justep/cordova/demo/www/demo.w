<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" component="$UI/system/components/justep/window/window">
  <div class="panel panel-primary cordova-testunit">
    <div class="panel-heading cordova-testunit">
      <div class="panel-title text-center">
        <span style="position: absolute;left: 5px;" data-bind="click:backHome2">
          <i xid="i1" class="glyphicon glyphicon-chevron-left"/>
        </span>
        <span>Apache Cordova Tests</span>
      </div>
    </div>
    <div class="panel-content"/>
  </div>  
  <div id="info"> 
    <h4>cordova.version: 
      <span id="cordova"></span>
    </h4>  
    <h4>Platform: 
      <span id="platform"></span>
    </h4>  
    <h4>Version: 
      <span id="version"></span>
    </h4>  
    <h4>UUID: 
      <span id="uuid"></span>
    </h4>  
    <h4>Model: 
      <span id="model"></span>
    </h4>  
    <h4>Width: 
      <span id="width"></span>, Height: 
      <span id="height"></span>, Color Depth: 
      <span id="colorDepth"/>
    </h4>  
    <h4>User-Agent: 
      <span id="user-agent"></span>
    </h4> 
  </div>  
  <table class="table" width="100%"> 
    <tr>
      <td>
        <a data-bind="attr:{href:(function(){
        	return require.toUrl('accelerometer/index.w?process=/SA/OPM/system/systemProcess&amp;activity=mainActivity');
        })()}" class="btn btn-default btn-block btn-block">Accelerometer</a>
      </td>
    </tr>  
    <tr>
      <td>
        <a data-bind="attr:{href:(function(){
        	return require.toUrl('audio/index.w?process=/SA/OPM/system/systemProcess&amp;activity=mainActivity');
        })()}" 
         class="btn btn-default btn-block">Audio Play/Record</a>
      </td>
    </tr>  
    <tr>
      <td>
        <a data-bind="attr:{href:(function(){
        	return require.toUrl('battery/index.w?process=/SA/OPM/system/systemProcess&amp;activity=mainActivity');
        })()}" 
         class="btn btn-default btn-block">Battery</a>
      </td>
    </tr>  
    <tr>
      <td>
        <a data-bind="attr:{href:(function(){
        	return require.toUrl('camera/index.w?process=/SA/OPM/system/systemProcess&amp;activity=mainActivity');
        })()}" class="btn btn-default btn-block">Camera</a>
      </td>
    </tr>  
    <tr>
      <td>
        <a data-bind="attr:{href:(function(){
        	return require.toUrl('capture/index.w?process=/SA/OPM/system/systemProcess&amp;activity=mainActivity');
        })()}"
         class="btn btn-default btn-block">Capture</a>
      </td>
    </tr>  
    <tr>
      <td>
        <a data-bind="attr:{href:(function(){
        	return require.toUrl('compass/index.w?process=/SA/OPM/system/systemProcess&amp;activity=mainActivity');
        })()}"
         class="btn btn-default btn-block">Compass</a>
      </td>
    </tr>  
    <tr>
      <td>
        <a data-bind="attr:{href:(function(){
        	return require.toUrl('contacts/index.w?process=/SA/OPM/system/systemProcess&amp;activity=mainActivity');
        })()}"
         class="btn btn-default btn-block">Contacts</a>
      </td>
    </tr>  
    <tr>
      <td>
        <a data-bind="attr:{href:(function(){
        	return require.toUrl('events/index.w?process=/SA/OPM/system/systemProcess&amp;activity=mainActivity');
        })()}"
         class="btn btn-default btn-block">Events</a>
      </td>
    </tr>  
    <tr>
      <td>
        <a data-bind="attr:{href:(function(){
        	return require.toUrl('location/index.w?process=/SA/OPM/system/systemProcess&amp;activity=mainActivity');
        })()}"
         class="btn btn-default btn-block">Location</a>
      </td>
    </tr>  
    <tr>
      <td>
        <a data-bind="attr:{href:(function(){
        	return require.toUrl('network/index.w?process=/SA/OPM/system/systemProcess&amp;activity=mainActivity');
        })()}"
         class="btn btn-default btn-block">Network</a>
      </td>
    </tr>  
    <tr>
      <td>
        <a data-bind="attr:{href:(function(){
        	return require.toUrl('vibration/index.w?process=/SA/OPM/system/systemProcess&amp;activity=mainActivity');
        })()}" class="btn btn-default btn-block">Vibration</a>
      </td>
    </tr>  
    <tr>
      <td>
        <a data-bind="attr:{href:(function(){
        	return require.toUrl('file/index.w?process=/SA/OPM/system/systemProcess&amp;activity=mainActivity');
        })()}" class="btn btn-default btn-block">File &amp; File Transfer</a>
      </td>
    </tr>  
    <tr>
      <td>
        <a data-bind="attr:{href:(function(){
        	return require.toUrl('baiduMap/map.w?process=/SA/OPM/system/systemProcess&amp;activity=mainActivity');
        })()}" class="btn btn-default btn-block">baidu Map</a>
      </td>
    </tr> 
  </table> 
</div>