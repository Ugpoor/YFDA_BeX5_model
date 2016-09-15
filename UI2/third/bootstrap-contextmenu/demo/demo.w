<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window" component="$UI/system/components/justep/window/window">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="position:absolute;height:auto;left:453px;top:68px;"
    onLoad="modelLoad"/>  
  <div component="$UI/system/components/justep/panel/panel" class="x-panel x-full"
    xid="panel1"> 
    <div class="x-panel-top" xid="top1"> 
      <div component="$UI/system/components/justep/titleBar/titleBar" class="x-titlebar"
        xid="titleBar1" title="bootstrap-contextmenu"> 
        <div class="x-titlebar-left" xid="div1"> 
          <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-only-icon"
            xid="button1" onClick="{operation:'window.close'}" icon="icon-chevron-left"> 
            <i xid="i1" class="icon-chevron-left"/>  
            <span xid="span1"/> 
          </a> 
        </div>  
        <div class="x-titlebar-title" xid="div2">bootstrap-tagsinput</div>  
        <div class="x-titlebar-right reverse" xid="div3"/> 
      </div> 
    </div>  
    <div class="x-panel-content" xid="content1"> 
      <div class="bg-primary main" data-toggle="context">This is an area where the context menu is active 
        <span style="background-color: #cecece">鼠标右键点击我试试</span>
      </div>  
      <div class="context-menu2"> 
        <ul class="dropdown-menu" role="menu"> 
          <li>
            <a tabindex="-1">Action</a>
          </li>  
          <li>
            <a tabindex="-1">Another action</a>
          </li>  
          <li>
            <a tabindex="-1">Something else here</a>
          </li>  
          <li class="divider"/>  
          <li>
            <a tabindex="-1">Separated link</a>
          </li> 
        </ul> 
      </div> 
    </div> 
  </div> 
</div>
