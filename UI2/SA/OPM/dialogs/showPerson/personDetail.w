<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window container-fluid justep-opm-persondetail" component="$UI/system/components/justep/window/window">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:689px;top:71px;"> 
    <div component="$UI/system/components/justep/data/bizData" xid="personData"
      concept="SA_OPPerson" limit="1" confirmRefresh="false"> 
      <reader xid="default1" action="/SA/OPM/logic/action/queryOPPersonAction"/>  
      <writer xid="default2" action="/SA/OPM/logic/action/saveOPPersonAction"/>  
      <creator xid="default3" action="/SA/OPM/logic/action/createOPPersonAction"/>  
      <rule xid="rule1"> 
        <readonly xid="readonly1"> 
          <expr xid="default5">js:$model.openMode.get() == 'view'</expr> 
        </readonly>  
        <col name="sName" xid="ruleCol1"> 
          <required xid="required1"> 
            <expr xid="default6"><![CDATA[js:true]]></expr>  
            <message xid="default7"/> 
          </required> 
        </col>  
        <col name="sCode" xid="ruleCol2"> 
          <required xid="required2"> 
            <expr xid="default8"><![CDATA[js:true]]></expr>  
            <message xid="default9"/> 
          </required> 
        </col>  
        <col name="sPasswordModifyTime" xid="ruleCol3"> 
          <readonly xid="readonly2"> 
            <expr xid="default10">js:true</expr> 
          </readonly> 
        </col> 
      </rule> 
    </div>  
    <div component="$UI/system/components/justep/data/bizData" xid="mainOrgData"
      concept="SA_OPOrg" columns="SA_OPOrg,sFName"> 
      <reader xid="default4" action="/SA/OPM/logic/action/queryOPOrgAction"/>  
      <rule xid="rule4"> 
        <readonly xid="readonly4"> 
          <expr xid="default14">js:true</expr> 
        </readonly> 
      </rule> 
    </div> 
  </div>  
  <span component="$UI/system/components/justep/windowReceiver/windowReceiver"
    xid="windowReceiver" style="left:138px;top:218px;" onReceive="windowReceiverReceive"/>  
  <div component="$UI/system/components/justep/panel/panel" class="x-panel x-full"
    xid="panel2"> 
    <div class="x-panel-content" xid="content1"> 
      <table component="$UI/system/components/bootstrap/table/table" xid="table2"
        class="table table-bordered"> 
        <tbody xid="tbody2"> 
          <tr xid="tr4"> 
            <td xid="td5"> 
              <div class="form-horizontal container-fluid" component="$UI/system/components/bootstrap/form/form" xid="form1">
   <div class="form-group" xid="formGroup1">
    <div class="col-xs-2" xid="col14"><label class="control-label" xid="controlLabel1"><![CDATA[主要岗位]]></label></div>
    <div class="col-xs-10" xid="col15">
     <input component="$UI/system/components/justep/input/input" class="form-control input-sm x-edit" xid="input1" bind-ref="mainOrgData.ref('sFName')"></input></div> </div> 
   <div class="form-group" xid="formGroup2">
    <div class="col-xs-2" xid="col18"><label class="control-label" xid="controlLabel2"><![CDATA[名称]]></label></div>
    <div class="col-xs-4" xid="col23">
     <input component="$UI/system/components/justep/input/input" class="form-control input-sm x-edit" xid="input2" bind-ref="personData.ref('sName')"></input></div> 
    <div class="col-xs-2" xid="col24"><label class="control-label" xid="controlLabel3"><![CDATA[编码]]></label></div>
    <div class="col-xs-4" xid="col25">
     <input component="$UI/system/components/justep/input/input" class="form-control input-sm x-edit" xid="input3" bind-ref="personData.ref('sCode')"></input></div> </div> 
   <div class="form-group" xid="formGroup3">
    <div class="col-xs-2" xid="col27"><label class="control-label" xid="controlLabel4"><![CDATA[性别]]></label></div>
    <div class="col-xs-4" xid="col26">
     <input component="$UI/system/components/justep/input/input" class="form-control input-sm x-edit" xid="input4" bind-ref="personData.ref('sSex')"></input></div> 
    <div class="col-xs-2" xid="col29"><label class="control-label" xid="controlLabel5"><![CDATA[身份证号]]></label></div>
    <div class="col-xs-4" xid="col28">
     <input component="$UI/system/components/justep/input/input" class="form-control input-sm x-edit" xid="input5" bind-ref="personData.ref('sIDCard')"></input></div> </div> 
   <div class="form-group" xid="formGroup4">
    <div class="col-xs-2" xid="col31"><label class="control-label" xid="controlLabel6"><![CDATA[证件类型]]></label></div>
    <div class="col-xs-4" xid="col30">
     <input component="$UI/system/components/justep/input/input" class="form-control input-sm x-edit" xid="input15" bind-ref="personData.ref('sCardKind')"></input></div> 
    <div class="col-xs-2" xid="col33"><label class="control-label" xid="controlLabel7"><![CDATA[证件号码]]></label></div>
    <div class="col-xs-4" xid="col32">
     <input component="$UI/system/components/justep/input/input" class="form-control input-sm x-edit" xid="input14" bind-ref="personData.ref('sCardNO')"></input></div> </div> 
   <div class="form-group" xid="formGroup5">
    <div class="col-xs-2" xid="col35"><label class="control-label" xid="controlLabel8"><![CDATA[移动电话]]></label></div>
    <div class="col-xs-4" xid="col34">
     <input component="$UI/system/components/justep/input/input" class="form-control input-sm x-edit" xid="input6" bind-ref="personData.ref('sMobilePhone')"></input></div> 
    <div class="col-xs-2" xid="col37"><label class="control-label" xid="controlLabel9"><![CDATA[办公电话]]></label></div>
    <div class="col-xs-4" xid="col36">
     <input component="$UI/system/components/justep/input/input" class="form-control input-sm x-edit" xid="input7" bind-ref="personData.ref('sOfficePhone')"></input></div> </div> 
   <div class="form-group" xid="formGroup6">
    <div class="col-xs-2" xid="col39"><label class="control-label" xid="controlLabel10"><![CDATA[家庭电话]]></label></div>
    <div class="col-xs-4" xid="col38">
     <input component="$UI/system/components/justep/input/input" class="form-control input-sm x-edit" xid="input8" bind-ref="personData.ref('sFamilyPhone')"></input></div> 
    <div class="col-xs-2" xid="col41"><label class="control-label" xid="controlLabel11"><![CDATA[电子邮件]]></label></div>
    <div class="col-xs-4" xid="col40">
     <input component="$UI/system/components/justep/input/input" class="form-control input-sm x-edit" xid="input10" bind-ref="personData.ref('sMail')"></input></div> </div> 
   <div class="form-group" xid="formGroup7">
    <div class="col-xs-2" xid="col43"><label class="control-label" xid="controlLabel12"><![CDATA[QQ]]></label></div>
    <div class="col-xs-4" xid="col42">
     <input component="$UI/system/components/justep/input/input" class="form-control input-sm x-edit" xid="input11" bind-ref="personData.ref('sQQ')"></input></div> 
    <div class="col-xs-2" xid="col45"><label class="control-label" xid="controlLabel13"><![CDATA[MSN]]></label></div>
    <div class="col-xs-4" xid="col44">
     <input component="$UI/system/components/justep/input/input" class="form-control input-sm x-edit" xid="input9" bind-ref="personData.ref('sMsn')"></input></div> </div> 
   <div class="form-group" xid="formGroup8">
    <div class="col-xs-2" xid="col47"><label class="control-label" xid="controlLabel15"><![CDATA[邮编]]></label></div>
    <div class="col-xs-4" xid="col46">
     <input component="$UI/system/components/justep/input/input" class="form-control input-sm x-edit" xid="input16" bind-ref="personData.ref('sZip')"></input></div> 
    <div class="col-xs-2" xid="col49"><label class="control-label" xid="controlLabel14"><![CDATA[家庭住址]]></label></div>
    <div class="col-xs-4" xid="col48">
     <input component="$UI/system/components/justep/input/input" class="form-control input-sm x-edit" xid="input17" bind-ref="personData.ref('sFamilyAddress')"></input></div> </div> 
   <div class="form-group" xid="formGroup9">
    <div class="col-xs-2" xid="col51"><label class="control-label" xid="controlLabel17"><![CDATA[登录名]]></label></div>
    <div class="col-xs-4" xid="col50">
     <input component="$UI/system/components/justep/input/input" class="form-control" xid="input12" bind-ref="personData.ref('sLoginName')"></input></div> 
    <div class="col-xs-2" xid="col53"><label class="control-label" xid="controlLabel16"><![CDATA[密码时限（天）]]></label></div>
    <div class="col-xs-4" xid="col52">
     <input component="$UI/system/components/justep/input/input" class="form-control input-sm x-edit" xid="input13" bind-ref="personData.ref('sPasswordTimeLimit')"></input></div> </div> </div></td>  
            <td xid="td7" style="width: 250px;"> 
              <div class="x-blob" component="$UI/system/components/justep/blob/blobImage"
                style="width:100%;height:auto;" xid="blobImage1" bind-ref="personData.ref('sPhoto')"
                blobConcept="SA_OPPerson" blobRelation="sPhoto" blobLastModifiedRelation="sPhotoLastModified"
                limitSize="1m" onUploadStart="blobImage1UploadStart"> 
                <div class="x-blob-bar" xid="div1"> 
                  <i class="x-blob-edit icon-compose" xid="i3"/>  
                  <i class="x-blob-del icon-close-round" xid="i4"/> 
                </div>  
                <img class="x-blob-img x-autofill" xid="image1" style="border:dashed thin #C0C0C0;"/> 
              </div> 
            </td> 
          </tr> 
        </tbody> 
      </table> 
    </div>  
    <div class="x-panel-bottom" xid="bottom1"> 
      <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-only-label x-dialog-button" label="取消" xid="cancelBtn" onClick='{"operation":"windowReceiver.windowCancel"}'>
   <i xid="i1"></i>
   <span xid="span1">取消</span></a>
  <a component="$UI/system/components/justep/button/button" class="btn btn-primary btn-only-label x-dialog-button" label="确定" xid="okBtn" onClick="okBtnClick" bind-disable="$model.openMode.get() == 'view'">
   <i xid="i2"></i>
   <span xid="span2">确定</span></a></div> 
  </div> 
</div>
