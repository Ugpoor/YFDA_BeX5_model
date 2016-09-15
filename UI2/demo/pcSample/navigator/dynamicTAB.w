<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window" component="$UI/system/components/justep/window/window"
  design="device:pc">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:204px;top:241px;"/>  
  <div component="$UI/system/components/justep/controlGroup/controlGroup" class="x-control-group"
    title="2、标签在底部" xid="controlGroup1" style="height:357px;"> 
    <div class="x-control-group-title" xid="controlGroupTitle1"> 
      <span xid="span1">title</span> 
    </div>  
    <div xid="div3" style="height:248px;"> 
      <div component="$UI/system/components/justep/contents/contents" class="x-contents x-full"
        active="0" xid="contents5" style="height:257px;top:50px;"> 
        <div class="x-contents-content" xid="content10"> 
          <a component="$UI/system/components/justep/button/button" class="btn btn-link"
            label="js" xid="js" onClick="jsClick"> 
            <i xid="i1"/>  
            <span xid="span2">js</span> 
          </a>  
          <a component="$UI/system/components/justep/button/button" class="btn btn-link"
            label="源码" xid="source" onClick="sourceClick"> 
            <i xid="ii29"/>  
            <span xid="span900">源码</span> 
          </a>  
          <div component="$UI/system/components/justep/row/row" class="x-row"
            xid="row1"> 
            <div class="x-col" xid="col1"> 
              <span xid="span7"><![CDATA[内容页1]]></span> 
            </div> 
          </div>  
          <div component="$UI/system/components/justep/row/row" class="x-row"
            xid="row2"> 
            <div class="x-col" xid="col4"> 
              <span xid="span8">内容页1</span> 
            </div> 
          </div>  
          <div component="$UI/system/components/justep/row/row" class="x-row"
            xid="row3"> 
            <div class="x-col" xid="col5"> 
              <span xid="span9">内容页1</span> 
            </div> 
          </div>  
          <div component="$UI/system/components/justep/row/row" class="x-row"
            xid="row4"> 
            <div class="x-col" xid="col6"> 
              <span xid="span10">内容页1</span> 
            </div> 
          </div> 
        </div>  
        <div class="x-contents-content" xid="content11"> 
          <iframe src="./iframe/iframe2.w" xid="iframe1" style="height:188px;width:418px;"
            frameborder="0px"/> 
        </div> 
      </div> 
    </div>  
    <a component="$UI/system/components/justep/button/button" class="btn btn-link  active"
      label="选项卡1" xid="button3" target="content10"> 
      <i xid="i3"/>  
      <span xid="span5">选项卡1</span> 
    </a>  
    <a component="$UI/system/components/justep/button/button" class="btn btn-link"
      label="选项卡2" xid="button4" target="content11"> 
      <i xid="i4"/>  
      <span xid="span6">选项卡2</span> 
    </a> 
  </div> 
</div>
