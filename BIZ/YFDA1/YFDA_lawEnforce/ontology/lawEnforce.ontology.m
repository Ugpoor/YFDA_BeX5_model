<?xml version="1.0" encoding="UTF-8"?>
<model xmlns="http://www.justep.com/model">
<concept name="YF_Application" default-value-expr="guid()"><has-relation relation="version" default-value-expr="0"><label language="zh_CN">版本</label>
</has-relation>
<label language="zh_CN">申请表</label>
<has-relation relation="fApplicationId" data-type="String"></has-relation>
<has-relation relation="fApplicationType" data-type="String" required="false"></has-relation>
<has-relation relation="fUser"></has-relation><has-relation relation="fApplyTime" data-type="DateTime"></has-relation>
<has-relation relation="fApplicationStatus" data-type="String"></has-relation>


</concept>
<relation name="fApplicationId" data-type="String"><label language="zh_CN">申请表Id</label>
</relation>
<relation name="fApplicationType" data-type="String"><label language="zh_CN">申请表类型</label>
</relation>
<relation name="fApplyTime" data-type="DateTime"><label language="zh_CN">申请时间</label>
</relation>
<relation name="fApplicationStatus" data-type="String"><label language="zh_CN">申请状态</label>
</relation>
<concept name="YF_Applier" default-value-expr="guid()"><has-relation relation="version" default-value-expr="0"><label language="zh_CN">版本</label>
</has-relation>
<label language="zh_CN">申请人</label>

<has-relation relation="fUser" data-type="String"></has-relation>
<has-relation relation="fPwd" data-type="String"></has-relation>
<has-relation relation="fIdCode" data-type="String"></has-relation>
<has-relation relation="fRegMobile" data-type="String"></has-relation>
<has-relation relation="fAppCom" data-type="String"></has-relation>
<has-relation relation="fAppComRep" data-type="String"></has-relation>
<has-relation relation="fCompanyType" data-type="String"></has-relation>
<has-relation relation="fComDistrict" data-type="String"></has-relation>
<has-relation relation="fComAve" data-type="String"></has-relation>
<has-relation relation="fComTel" data-type="String"></has-relation>
<has-relation relation="fComZip" data-type="String"></has-relation>
<has-relation relation="fComRegAddr" data-type="String"></has-relation>
<has-relation relation="fComContactMan" data-type="String"></has-relation>
<has-relation relation="fComContactManTel" data-type="String"></has-relation>
<has-relation relation="fComContactManAddr" data-type="String"></has-relation>
</concept>
<relation name="fUser" data-type="String"><label language="zh_CN">申请人用户名</label>
</relation>
<relation name="fPwd" data-type="String"><label language="zh_CN">申请人密码</label>
</relation>
<relation name="fIdCode" data-type="String"><label language="zh_CN">申请人识别号</label>
</relation>
<relation name="fRegMobile" data-type="String"><label language="zh_CN">申请人注册手机</label>
</relation>
<relation name="fAppCom" data-type="String"><label language="zh_CN">申请单位</label>
</relation>
<relation name="fAppComRep" data-type="String"><label language="zh_CN">申请单位法人</label>
</relation>
<relation name="fCompanyType" data-type="String"><label language="zh_CN">公司类型</label>
</relation>
<relation name="fComDistrict" data-type="String"><label language="zh_CN">公司所属区域</label>
</relation>
<relation name="fComAve" data-type="String"><label language="zh_CN">公司所属街道</label>
</relation>
<relation name="fComTel" data-type="String"><label language="zh_CN">公司电话</label>
</relation>
<relation name="fComZip" data-type="String"><label language="zh_CN">公司邮编</label>
</relation>
<relation name="fComRegAddr" data-type="String"><label language="zh_CN">公司注册地</label>
</relation>
<relation name="fComContactMan" data-type="String"><label language="zh_CN">公司联系人</label>
</relation>
<relation name="fComContactManTel" data-type="String"><label language="zh_CN">公司联系人电话</label>
</relation>
<relation name="fComContactManAddr" data-type="String"><label language="zh_CN">公司联系人地址</label>
</relation>
<concept name="YF_Acce" default-value-expr="guid()"><has-relation relation="version" default-value-expr="0"><label language="zh_CN">版本</label>
</has-relation>
<label language="zh_CN">申请附件</label>
<has-relation relation="fAcceId" data-type="String"></has-relation>
<has-relation relation="fAcceName" data-type="String"></has-relation>
<has-relation relation="fAcceLink" data-type="String"></has-relation>
<has-relation relation="fApplicationId"></has-relation><has-relation relation="fAcceValid" data-type="Integer"></has-relation>

</concept>
<relation name="fAcceId" data-type="String"><label language="zh_CN">附件Id</label>
</relation>
<relation name="fAcceName" data-type="String"><label language="zh_CN">附件名称</label>
</relation>
<relation name="fAcceLink" data-type="String"><label language="zh_CN">附件链接</label>
</relation>
<relation name="fAcceValid" data-type="Integer"><label language="zh_CN">是否有效</label>
</relation>
<concept name="YF_Process" default-value-expr="guid()"><has-relation relation="version" default-value-expr="0"><label language="zh_CN">版本</label>
</has-relation>
<label language="zh_CN">申请流程</label>
<has-relation relation="fProcessId" data-type="String"></has-relation>

<has-relation relation="fTime" data-type="DateTime"></has-relation>
<has-relation relation="fApplicationId"></has-relation>
<has-relation relation="fApplicationStatus"></has-relation>
<has-relation relation="fProcessMemo" data-type="String"></has-relation>
<has-relation relation="fperInCharge" data-type="String"></has-relation>
<has-relation relation="fperInChargeId" data-type="String"></has-relation>
</concept>
<relation name="fProcessId" data-type="String"><label language="zh_CN">流程Id</label>
</relation>
<relation name="fTime" data-type="DateTime"><label language="zh_CN">流程时间</label>
</relation>
<relation name="fProcessMemo" data-type="String"><label language="zh_CN">流程备注</label>
</relation>

<concept name="YF_mainApplication" default-value-expr="guid()"><has-relation relation="version" default-value-expr="0"><label language="zh_CN">版本</label>
</has-relation>
<label language="zh_CN">申请主表</label>
<has-relation relation="fApplicationId"></has-relation>
<has-relation relation="fApplicationType"></has-relation>
<has-relation relation="fApplyTime"></has-relation>
<has-relation relation="fApplicationStatus"></has-relation>
<has-relation relation="fUser"></has-relation>
<has-relation relation="fIdCode"></has-relation>
<has-relation relation="fAppCom"></has-relation>
<has-relation relation="fAppComRep"></has-relation>
<has-relation relation="fCompanyType"></has-relation>
<has-relation relation="fComDistrict"></has-relation>
<has-relation relation="fComAve"></has-relation>
<has-relation relation="fComTel"></has-relation>
<has-relation relation="fComZip"></has-relation>
<has-relation relation="fComRegAddr"></has-relation>
<has-relation relation="fComContactMan"></has-relation>
<has-relation relation="fComContactManTel"></has-relation>
<has-relation relation="fComContactManAddr"></has-relation>
<has-relation relation="fProcessId"></has-relation>
<has-relation relation="fTime"></has-relation>
<has-relation relation="fProcessMemo"></has-relation>
<has-relation relation="fperInChargeId"></has-relation>
</concept>
<relation name="fperInCharge" data-type="String"><label language="zh_CN">流程负责人</label>
</relation>
<relation name="fperInChargeId" data-type="String"><label language="zh_CN">流程负责人Id</label>
</relation>
</model>