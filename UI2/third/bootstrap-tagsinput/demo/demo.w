<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window" component="$UI/system/components/justep/window/window">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="position:absolute;height:auto;left:453px;top:68px;"
    onLoad="modelLoad"/>  
  <div component="$UI/system/components/justep/panel/panel" class="x-panel x-full"
    xid="panel1"> 
    <div class="x-panel-top" xid="top1"> 
      <div component="$UI/system/components/justep/titleBar/titleBar" class="x-titlebar"
        xid="titleBar1" title="bootstrap-tagsinput"> 
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
      <div class="example example_markup"> 
        <h3>Markup</h3>  
        <p>Just add 
          <code>data-role="tagsinput"</code> to your input field to automatically change it to a tags input field.
        </p>  
        <div class="bs-example"> 
          <input type="text" value="Amsterdam,Washington,Sydney,Beijing,Cairo"
            data-role="tagsinput"/> 
        </div> 
      </div>  
      <div class="example example_multivalue"> 
        <h3>True multi value</h3>  
        <p>Use a 
          <code>&lt;select multiple /&gt;</code> as your input element for a tags input, to gain true multivalue support. Instead of a comma separated string, the values will be set in an array. Existing 
          <code>&lt;option /&gt;</code> elements will automatically be set as tags. This makes it also possible to create tags containing a comma.
        </p>  
        <div class="bs-example"> 
          <select multiple="true" data-role="tagsinput"> 
            <option value="Amsterdam">Amsterdam</option>  
            <option value="Washington">Washington</option>  
            <option value="Sydney">Sydney</option>  
            <option value="Beijing">Beijing</option>  
            <option value="Cairo">Cairo</option> 
          </select> 
        </div> 
      </div>  
       
    </div> 
  </div> 
</div>
