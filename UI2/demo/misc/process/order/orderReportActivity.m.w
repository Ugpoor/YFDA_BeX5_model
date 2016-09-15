<div 
  xmlns:xu="http://www.xmldb.org/xupdate" 
  xmlns:xui="http://www.justep.com/xui" 
  xmlns="http://www.w3.org/1999/xhtml" 
  xid="window" 
  class="window" 
  component="$UI/system/components/justep/window/window" 
  extends="mainActivity.m.w" >

  <div xid="item1" xui:update-mode="delete"/>
  <div xid="item3" xui:update-mode="delete"/>
  <div xid="item2" xui:update-mode="delete"/>
   <div xid="mainData" autoLoad="true" autoNew="false"  xui:update-mode="merge"/>
   <div xid="detailData" autoLoad="true"  xui:update-mode="merge"/>
    <li class="x-menu-item" xid="item1_2" xui:parent="menu1" xui:update-mode="insert" >
<a class="btn btn-link" component="$UI/system/components/justep/button/button" onClick="{operation:'process.advance'}" xid="button1_2" >
<i xid="i1_2" />
<span xid="span1_2" >


流转</span>
</a>
</li>
    <li class="x-menu-item" xid="item4_2" xui:parent="menu1" xui:update-mode="insert" >
<a class="btn btn-link" component="$UI/system/components/justep/button/button" onClick="{operation:'process.back'}" xid="button4_2" >
<i xid="i4_2" />
<span xid="span4_2" >


回退</span>
</a>
</li>
    <li class="x-menu-item" xid="item2_2" xui:parent="menu1" xui:update-mode="insert" >
<a class="btn btn-link" component="$UI/system/components/justep/button/button" onClick="{operation:'process.abort'}" xid="button2_2" >
<i xid="i2_2" />
<span xid="span2_2" >


终止</span>
</a>
</li>
    <li class="x-menu-item" xid="item5_1" xui:parent="menu1" xui:update-mode="insert" >
<a class="btn btn-link" component="$UI/system/components/justep/button/button" onClick="{operation:'process.showChart'}" xid="button5_1" >
<i xid="i5_1" />
<span xid="span5_1" >
</span>
</a>
</li>
    <li class="x-menu-divider divider" xid="divider1_1" xui:parent="menu1" xui:update-mode="insert" />
    <li class="x-menu-item" xid="item3_2" xui:parent="menu1" xui:update-mode="insert" >
<a class="btn btn-link" component="$UI/system/components/justep/button/button" onClick="addDetailClick" xid="button3_2" >
<i xid="i3_2" />
<span xid="span3_2" >
</span>
</a>
</li>

</div>