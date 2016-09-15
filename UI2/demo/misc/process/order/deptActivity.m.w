<div 
  xmlns:xu="http://www.xmldb.org/xupdate" 
  xmlns:xui="http://www.justep.com/xui" 
  xmlns="http://www.w3.org/1999/xhtml" 
  xid="window" 
  class="window" 
  component="$UI/system/components/justep/window/window" 
  extends="mainActivity.m.w" >

  <div xid="rule1" xui:update-mode="delete"/>
  <div xid="rule3" xui:update-mode="delete"/>
  <div xid="i99" xui:update-mode="delete"/>
  <div xid="col2" xui:update-mode="delete"/>
  <div xid="item3" xui:update-mode="delete"/>
  <div xid="item2" xui:update-mode="delete"/>
   <div xid="mainData" autoLoad="true" autoNew="false"  xui:update-mode="merge"/>
    <rule xid="rule1_3" xui:parent="mainData" xui:update-mode="insert" >
<col name="fCustomerID" xid="ruleCol1_3" >
<readonly xid="readonly1_3" >
<expr xid="default1_3" >




js:true</expr>
</readonly>
</col>
<col name="fRequiredDate" xid="ruleCol2_3" >
<readonly xid="readonly2_3" >
<expr xid="default2_3" >




js:true</expr>
</readonly>
</col>
<col name="fShippedDate" xid="ruleCol3_3" >
<readonly xid="readonly3_3" >
<expr xid="default3_3" >




js:true</expr>
</readonly>
</col>
<col name="fOrderDate" xid="ruleCol4_3" >
<readonly xid="readonly4_3" >
<expr xid="default4_3" >




js:true</expr>
</readonly>
</col>
<col name="fPicture" xid="ruleCol5_3" >
<readonly xid="readonly5_3" >
<expr xid="default5_3" >




js:true</expr>
</readonly>
</col>
</rule>
   <div xid="detailData" autoLoad="true"  xui:update-mode="merge"/>
    <rule xid="rule2_4" xui:parent="detailData" xui:update-mode="insert" >
<readonly xid="readonly2_4" >
<expr xid="default2_4" >










js:true</expr>
</readonly>
</rule>
   <div xid="titleBar1" title="订单-主管审批"  xui:update-mode="merge"/>
   <div xid="div2" class="x-titlebar-title"  xui:update-mode="replace-and-replace">

订单-主管审批</div>    <div class="x-control-group" component="$UI/system/components/justep/controlGroup/controlGroup" title="主管审核" xid="controlGroup1_1" xui:parent="content1" xui:update-mode="insert" >
<div class="x-control-group-title" xid="controlGroupTitle1_1" >






主管审核</div>
<div class="x-label-edit" component="$UI/system/components/justep/labelEdit/labelEdit" xid="labelToggle1_1" >
<label class="x-label x-label-w" xid="label1_1" >
<![CDATA[是否同意]]>
</label>
<span bind-ref="mainData.ref('fAuditorIsArgee')" checkedValue="1" class="x-toggle x-edit" component="$UI/system/components/justep/button/toggle" xid="toggle1_1" />
</div>
<div class="x-label-edit" component="$UI/system/components/justep/labelEdit/labelEdit" xid="labelTextarea1_1" >
<label class="x-label x-label-w" xid="label2_1" >
<![CDATA[审核意见]]>
</label>
<textarea bind-ref="mainData.ref('fAuditor')" class="form-control x-edit" component="$UI/system/components/justep/textarea/textarea" xid="textarea1_1" />
</div>
</div>
    <li class="x-menu-item" xid="item1_4" xui:parent="menu1" xui:update-mode="insert" >
<a class="btn btn-link" component="$UI/system/components/justep/button/button" onClick="{operation:'process.back'}" xid="button1_4" >
<i xid="i1_4" />
<span xid="span1_4" >
</span>
</a>
</li>
    <li class="x-menu-item" xid="item2_4" xui:parent="menu1" xui:update-mode="insert" >
<a class="btn btn-link" component="$UI/system/components/justep/button/button" label="" onClick="{operation:'process.abort'}" xid="button2_4" >
<i xid="i2_4" />
<span xid="span2_4" >
</span>
</a>
</li>
    <li class="x-menu-item" xid="item1_3" xui:parent="menu1" xui:update-mode="insert" >
<a class="btn btn-link" component="$UI/system/components/justep/button/button" label="" onClick="{operation:'process.showChart'}" xid="button1_3" >
<i xid="i1_3" />
<span xid="span1_3" >
</span>
</a>
</li>
</div>