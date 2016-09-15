<div 
  xmlns:xu="http://www.xmldb.org/xupdate" 
  xmlns:xui="http://www.justep.com/xui" 
  xmlns="http://www.w3.org/1999/xhtml" 
  xid="window" 
  class="window" 
  component="$UI/system/components/justep/window/window" 
  extends="deptActivity.m.w" >

  <div xid="rule1_3" xui:update-mode="delete"/>
    <rule xid="rule1_3" xui:parent="mainData" xui:update-mode="insert" >
<col name="fCustomerID" xid="ruleCol1_3" >
<readonly xid="readonly1_3" >
<expr xid="default1_3" >


js:true</expr>
</readonly>
</col>
<col name="fAuditorID" xid="ruleCol2_3" >
<readonly xid="readonly2_3" >
<expr xid="default2_3" >


js:true</expr>
</readonly>
</col>
<col name="fAuditorIsArgee" xid="ruleCol3_3" >
<readonly xid="readonly3_3" >
<expr xid="default3_3" >


js:true</expr>
</readonly>
</col>
<col name="fAuditor" xid="ruleCol4_3" >
<readonly xid="readonly4_3" >
<expr xid="default4_3" >


js:true</expr>
</readonly>
</col>
<col name="fAuditorDate" xid="ruleCol5_3" >
<readonly xid="readonly5_3" >
<expr xid="default5_3" >


js:true</expr>
</readonly>
</col>
<col name="fPicture" xid="ruleCol6_3" >
<readonly xid="readonly6_3" >
<expr xid="default6_3" >


js:true</expr>
</readonly>
</col>
</rule>
   <div xid="titleBar1" title="订单-经理审批"  xui:update-mode="merge"/>
   <div xid="div2" class="x-titlebar-title"  xui:update-mode="merge">
订单-经理审批</div>    <div class="x-control-group" component="$UI/system/components/justep/controlGroup/controlGroup" title="总经理审批" xid="controlGroup1_3" xui:parent="content1" xui:update-mode="insert" >
<div class="x-control-group-title" xid="controlGroupTitle1_3" >




总经理审批</div>
<div class="x-label-edit" component="$UI/system/components/justep/labelEdit/labelEdit" xid="labelToggle1_3" >
<label class="x-label  x-label-w" xid="label1_3" >
<![CDATA[是否同意]]>
</label>
<span bind-ref="mainData.ref('fExamineIsArgee')" checkedValue="1" class="x-toggle x-edit" component="$UI/system/components/justep/button/toggle" xid="toggle1_3" />
</div>
<div class="x-label-edit" component="$UI/system/components/justep/labelEdit/labelEdit" xid="labelTextarea1_3" >
<label class="x-label x-label-w" xid="label2_3" >
<![CDATA[审批意见]]>
</label>
<textarea bind-ref="mainData.ref('fExamine')" class="form-control x-edit" component="$UI/system/components/justep/textarea/textarea" xid="textarea1_3" />
</div>
</div>

</div>