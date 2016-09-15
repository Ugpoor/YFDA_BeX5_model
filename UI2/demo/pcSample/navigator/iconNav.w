<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window" component="$UI/system/components/justep/window/window"
  design="device:pc">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:67px;top:126px;"/>  
  <span component="$UI/system/components/justep/messageDialog/messageDialog"
    xid="message"/>  
  <a component="$UI/system/components/justep/button/button" class="btn btn-link "
    label="js" xid="js" onClick="jsClick"> 
    <i xid="i1"/>  
    <span xid="span1">js</span>
  </a>  
  <a component="$UI/system/components/justep/button/button" class="btn btn-link"
    label="源码" xid="source" onClick="sourceClick"> 
    <i xid="i1"/>  
    <span xid="span2">source</span>
  </a>  
  <div component="$UI/system/components/justep/row/row" class="x-row" xid="row2"> 
    <div class="x-col x-col-fixed" xid="centerCol" style="width:auto;" bind-click="centerColClick">
      <div xid="div1">
        <img src="$UI/demo/sample/navigator/img/1.1.jpg" alt="" xid="image1"/>
      </div>
    </div>  
    <div class="x-col x-col-fixed" xid="favoriteCol" style="width:auto;" bind-click="favoriteColClick">
      <div xid="div2">
        <img src="$UI/demo/sample/navigator/img/2.jpg" alt="" xid="image2"/>
      </div>
    </div>  
    <div class="x-col x-col-fixed" xid="searchCol" style="width:auto;" bind-click="searchColClick">
      <div xid="div3"> 
        <img src="$UI/demo/sample/navigator/img/3.jpg" alt="" xid="image3"/>
      </div>
    </div>
  </div>  
  <div component="$UI/system/components/justep/row/row" class="x-row" xid="row3"> 
    <div class="x-col x-col-fixed" xid="docCol" style="width:auto;" bind-click="docColClick">
      <div xid="div4"> 
        <img src="$UI/demo/sample/navigator/img/4.jpg" alt="" xid="image4"/>
      </div>
    </div>  
    <div class="x-col x-col-fixed" xid="helpCol" style="width:auto;" bind-click="helpColClick">
      <div xid="div5"> 
        <img src="$UI/demo/sample/navigator/img/5.jpg" alt="" xid="image5"/>
      </div>
    </div>  
    <div class="x-col x-col-fixed" xid="saveCol" style="width:auto;" bind-click="saveColClick">
      <div xid="div6"> 
        <img src="$UI/demo/sample/navigator/img/6.jpg" alt="" xid="image6"/>
      </div>
    </div>
  </div>  
  <div component="$UI/system/components/justep/row/row" class="x-row" xid="row1"> 
    <div class="x-col x-col-fixed" xid="adnexaCol" style="width:auto;" bind-click="adnexaColClick">
      <div xid="div7"> 
        <img src="$UI/demo/sample/navigator/img/7.jpg" alt="" xid="image7"/>
      </div>
    </div>  
    <div class="x-col x-col-fixed" xid="noticeCol" style="width:auto;" bind-click="noticeColClick">
      <div xid="div8"> 
        <img src="$UI/demo/sample/navigator/img/8.jpg" alt="" xid="image8"/>
      </div>
    </div>  
    <div class="x-col x-col-fixed" xid="recycleCol" style="width:auto;" bind-click="recycleColClick">
      <div xid="div9"> 
        <img src="$UI/demo/sample/navigator/img/9.jpg" alt="" xid="image9"/>
      </div>
    </div>
  </div> 
</div>
