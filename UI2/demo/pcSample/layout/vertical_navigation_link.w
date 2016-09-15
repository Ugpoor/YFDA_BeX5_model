<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window" component="$UI/system/components/justep/window/window"
  design="device:pc">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:205px;top:340px;">
    <div component="$UI/system/components/justep/data/data" autoLoad="true"
      xid="statusData" idColumn="edit">
      <column label="edit" name="edit" type="String" xid="xid1"/>  
      <data xid="default1">[{"edit":"1"}]</data>
    </div>
  </div>  
  <h4 xid="h41"><![CDATA[纵向导航链接]]>  
    <a component="$UI/system/components/justep/button/button" class="btn btn-link"
      label="JS" xid="jsBtn" onClick="jsBtnClick"> 
      <i xid="i1"/>  
      <span xid="span1">JS</span>
    </a>  
    <a component="$UI/system/components/justep/button/button" class="btn btn-link"
      label="源码" xid="sourceBtn" onClick="sourceBtnClick"> 
      <i xid="i2"/>  
      <span xid="span2">源码</span>
    </a>
  </h4>
  <div component="$UI/system/components/justep/row/row" class="x-row" xid="row1"
    style="height:96%;"> 
    <div class="x-col x-col-fixed" xid="col1" style="width:auto;">
      <div xid="menu" style="height:100%;width:123px;" class="div1"> 
        <a component="$UI/system/components/justep/button/button" class="btn2 btn btn-link btn-icon-right"
          label="选项1" xid="select1" bind-css="{'btn1': $model.statusData.val(&quot;edit&quot;) == 1}"
          onClick="buttonOneClick" icon="icon-chevron-right" target="content1"> 
          <i xid="i12" class="icon-chevron-right" bind-visible=" $model.statusData.val(&quot;edit&quot;) == 1"/>  
          <span xid="span12">选项1</span>
        </a>
        <a component="$UI/system/components/justep/button/button" class="btn2 btn btn-link btn-icon-right"
          label="选项2" xid="select2" bind-css="{'btn1': $model.statusData.val(&quot;edit&quot;) == 2}"
          onClick="buttonTwoClick" icon="icon-chevron-right" target="content2"> 
          <i xid="i13" class="icon-chevron-right" bind-visible=" $model.statusData.val(&quot;edit&quot;) == 2"/>  
          <span xid="span13">选项2</span>
        </a>
        <a component="$UI/system/components/justep/button/button" class="btn2 btn btn-link btn-icon-right"
          label="选项3" xid="select3" bind-css="{'btn1': $model.statusData.val(&quot;edit&quot;) == 3}"
          onClick="buttonThreeClick" icon="icon-chevron-right" target="content3"> 
          <i xid="i14" class="icon-chevron-right" bind-visible=" $model.statusData.val(&quot;edit&quot;) == 3"/>  
          <span xid="span14">选项3</span>
        </a>
        <a component="$UI/system/components/justep/button/button" class="btn2  btn btn-link btn-icon-right"
          label="选项4" xid="select4" bind-css="{'btn1': $model.statusData.val(&quot;edit&quot;) == 4}"
          onClick="buttonFourClick" icon="icon-chevron-right" target="content4"> 
          <i xid="i15" class="icon-chevron-right" bind-visible=" $model.statusData.val(&quot;edit&quot;) == 4"/>  
          <span xid="span15">选项4</span>
        </a>
        <a component="$UI/system/components/justep/button/button" class="btn2 btn btn-link btn-icon-right"
          label="选项5" xid="select5" bind-css="{'btn1': $model.statusData.val(&quot;edit&quot;) == 5}"
          onClick="buttonFiveClick" icon="icon-chevron-right" target="content5"> 
          <i xid="i16" class="icon-chevron-right" bind-visible=" $model.statusData.val(&quot;edit&quot;) == 5"/>  
          <span xid="span16">选项5</span>
        </a> 
      </div>
    </div>  
    <div class="x-col x-padding" xid="col3" style="height:100%;">
      <div component="$UI/system/components/justep/contents/contents" class="x-contents "
        active="0" xid="page" style="width:100%;height:100%;"> 
        <div class="x-contents-content" xid="content1">
          <div xid="div3" style="height:160px;width:140px;"> 
            <label xid="label1" style="width:140px;"><![CDATA[纵向导航（链接）]]></label>
          </div>  
          <div xid="div2" style="height:160px;width:140px;"> 
            <label xid="label2"><![CDATA[纵向导航（链接）]]></label>
          </div>  
          <div xid="div4" style="height:160px;width:140px;"> 
            <label xid="label3"><![CDATA[纵向导航（链接）]]></label>
          </div>  
          <div xid="div5" style="height:160px;width:140px;"> 
            <label xid="label4"><![CDATA[纵向导航（链接）]]></label>
          </div>  
          <div xid="div6" style="height:160px;width:140px;"> 
            <label xid="label5"><![CDATA[纵向导航（链接）]]></label>
          </div> 
        </div>  
        <div class="x-contents-content" xid="content2">
          <div xid="div10" style="height:160px;width:100px;"> 
            <label xid="label6"><![CDATA[一级栏目2]]></label>
          </div>  
          <div xid="div11" style="height:160px;width:100px;"> 
            <label xid="label7"><![CDATA[一级栏目2]]></label>
          </div>  
          <div xid="div9" style="height:160px;width:100px;"> 
            <label xid="label8"><![CDATA[一级栏目2]]></label>
          </div>  
          <div xid="div8" style="height:160px;width:100px;"> 
            <label xid="label10"><![CDATA[一级栏目2]]></label>
          </div>  
          <div xid="div7" style="height:160px;width:100px;"> 
            <label xid="label9"><![CDATA[一级栏目2]]></label>
          </div>
        </div>  
        <div class="x-contents-content" xid="content3">
          <div xid="div15" style="height:160px;width:100px;"> 
            <label xid="label11"><![CDATA[一级栏目3]]></label>
          </div>  
          <div xid="div16" style="height:160px;width:100px;"> 
            <label xid="label12"><![CDATA[一级栏目3]]></label>
          </div>  
          <div xid="div14" style="height:160px;width:100px;"> 
            <label xid="label13"><![CDATA[一级栏目3]]></label>
          </div>  
          <div xid="div13" style="height:160px;width:100px;"> 
            <label xid="label15"><![CDATA[一级栏目3]]></label>
          </div>  
          <div xid="div12" style="height:160px;width:100px;"> 
            <label xid="label14"><![CDATA[一级栏目3]]></label>
          </div>
        </div>  
        <div class="x-contents-content" xid="content4">
          <div xid="div20" style="height:160px;width:100px;"> 
            <label xid="label16"><![CDATA[一级栏目4]]></label>
          </div>  
          <div xid="div21" style="height:160px;width:100px;"> 
            <label xid="label17"><![CDATA[一级栏目4]]></label>
          </div>  
          <div xid="div19" style="height:160px;width:100px;"> 
            <label xid="label18"><![CDATA[一级栏目4]]></label>
          </div>  
          <div xid="div18" style="height:160px;width:100px;"> 
            <label xid="label20"><![CDATA[一级栏目4]]></label>
          </div>  
          <div xid="div17" style="height:160px;width:100px;"> 
            <label xid="label19"><![CDATA[一级栏目4]]></label>
          </div>
        </div>  
        <div class="x-contents-content" xid="content5">
          <div xid="div25" style="height:160px;width:100px;"> 
            <label xid="label21"><![CDATA[一级栏目5]]></label>
          </div>  
          <div xid="div26" style="height:160px;width:100px;"> 
            <label xid="label22"><![CDATA[一级栏目5]]></label>
          </div>  
          <div xid="div24" style="height:160px;width:100px;"> 
            <label xid="label23"><![CDATA[一级栏目5]]></label>
          </div>  
          <div xid="div23" style="height:160px;width:100px;"> 
            <label xid="label25"><![CDATA[一级栏目5]]></label>
          </div>  
          <div xid="div22" style="height:160px;width:100px;"> 
            <label xid="label24"><![CDATA[一级栏目5]]></label>
          </div> 
        </div>
      </div>
    </div>
  </div> 
</div>
