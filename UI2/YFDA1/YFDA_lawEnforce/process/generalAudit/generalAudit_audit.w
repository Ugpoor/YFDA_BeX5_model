<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window" component="$UI/system/components/justep/window/window"
  design="device:pc;">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:380px;top:216px;">
    <div component="$UI/system/components/justep/data/bizData" xid="mainData"
      directDelete="true" autoLoad="false" autoNew="true" concept="YF_mainApplication"
      orderBy="" columns="" isTree="false"> 
      <reader action="/YFDA1/YFDA_lawEnforce/logic/action/queryYF_mainApplicationAction"/>  
      <writer action="/YFDA1/YFDA_lawEnforce/logic/action/saveYF_mainApplicationAction"/>  
      <creator action="/YFDA1/YFDA_lawEnforce/logic/action/createYF_mainApplicationAction"/> 
    </div>
    <div component="$UI/system/components/justep/data/bizData" xid="detailData"
      directDelete="true" autoLoad="true" autoNew="false" concept="YF_Acce"
      orderBy="" columns="" isTree="false"> 
      <reader action="/YFDA1/YFDA_lawEnforce/logic/action/queryYF_AcceAction"/>  
      <writer action="/YFDA1/YFDA_lawEnforce/logic/action/saveYF_AcceAction"/>  
      <creator action="/YFDA1/YFDA_lawEnforce/logic/action/createYF_AcceAction"/>  
      <master xid="default1" data="mainData" relation="fApplicationId"/> 
    </div>
  </div>  
  <div component="$UI/system/components/justep/process/process" xid="process"
    data="mainData" style="width:24px;height:5px;left:184px;top:769px;"/>  
  <div component="$UI/system/components/justep/popMenu/popMenu" class="x-popMenu"
    xid="moreMenu" opacity="0" anchor="moreBtn" direction="left-bottom"> 
    <div class="x-popMenu-overlay" xid="moreMenuOverlay"/>  
    <ul component="$UI/system/components/justep/menu/menu" class="x-menu dropdown-menu x-popMenu-content"
      xid="moreContent"> 
      <li class="x-menu-item" xid="backItem"> 
        <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
          xid="backBtn" onClick="{operation:'process.back'}"> 
          <i xid="i8"/>  
          <span xid="span6"/> 
        </a> 
      </li>  
      <li class="x-menu-item" xid="suspendItem"> 
        <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
          xid="suspendBtn" onClick="{operation:'process.suspend'}"> 
          <i xid="i3"/>  
          <span xid="span3"/> 
        </a> 
      </li>  
      <li class="x-menu-item" xid="abortItem"> 
        <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
          xid="abortBtn" onClick="{operation:'process.abort'}"> 
          <i xid="i4"/>  
          <span xid="span4"/> 
        </a> 
      </li>  
      <li class="x-menu-item" xid="chartItem"> 
        <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
          xid="chartBtn" onClick="{operation:'process.showChart'}"> 
          <i xid="i5"/>  
          <span xid="span5"/> 
        </a> 
      </li>  
      <li class="x-menu-item" xid="recordItem"> 
        <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
          xid="recordBtn" onClick="{operation:'process.processRecord'}"> 
          <i xid="i55"/>  
          <span xid="span55"/> 
        </a> 
      </li> 
    </ul> 
  </div>  
  <div xid="view"> 
  <div xid="mainForm" class="form-horizontal container-fluid" component="$UI/system/components/bootstrap/form/form">
    <div component="$UI/system/components/bootstrap/row/row" class="row" xid="row3" style="height:100%;">
   <div xid="col14" class="col-sm-4">
            <textarea xid="fApplicationType" class="form-control" component="$UI/system/components/justep/textarea/textarea" bind-ref="mainData.ref('fApplicationType')" style="width:100%;"></textarea></div></div><div component="$UI/system/components/justep/toolBar/toolBar" class="x-toolbar x-toolbar-spliter form-inline" xid="processBar"> 
      <a component="$UI/system/components/justep/button/button" xid="advanceBtn" onClick="{operation:'process.advance'}"> 
        <i xid="i2"/>  
        <span xid="span2">流转</span> 
      </a>  
      <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
        xid="saveBtn" onClick="{operation:'mainData.save'}"> 
        <i xid="i1"/>  
        <span xid="span1"/> 
      </a>  
      <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-only-label"
        label="更多" xid="moreBtn" onClick="{operation:'moreMenu.show'}"> 
        <i xid="i15"/>  
        <span xid="span15">更多</span> 
      </a> 
    </div>  
      <div xid="formGroup1" class="form-group"> 
          <div xid="col11" class="col-sm-2"> 
            <label xid="fApplicationIdL" class="control-label" bind-text="mainData.label('fApplicationId')"/> 
          </div>  
          <div xid="col12" class="col-sm-4">
            <textarea xid="fApplicationId" class="form-control" component="$UI/system/components/justep/textarea/textarea"
              bind-ref="mainData.ref('fApplicationId')" style="width:100%;height:100%;"/> 
          </div>  
           
        </div> 
        <div xid="formGroup2" class="form-group"> 
          <div xid="col21" class="col-sm-2"> 
            <label xid="fApplyTimeL" class="control-label" bind-text="mainData.label('fApplyTime')"/> 
          </div>  
          <div xid="col22" class="col-sm-4">
            <textarea xid="fApplyTime" class="form-control" component="$UI/system/components/justep/textarea/textarea"
              bind-ref="mainData.ref('fApplyTime')"/> 
          </div>  
          <div xid="col23" class="col-sm-2"> 
            <label xid="fApplicationStatusL" class="control-label" bind-text="mainData.label('fApplicationStatus')"/> 
          </div>  
          <div xid="col24" class="col-sm-4">
            <textarea xid="fApplicationStatus" class="form-control" component="$UI/system/components/justep/textarea/textarea"
              bind-ref="mainData.ref('fApplicationStatus')"/> 
          </div> 
        </div> 
        <div xid="formGroup3" class="form-group"> 
          <div xid="col31" class="col-sm-2"> 
            <label xid="fUserL" class="control-label" bind-text="mainData.label('fUser')"/> 
          </div>  
          <div xid="col32" class="col-sm-4">
            <textarea xid="fUser" class="form-control" component="$UI/system/components/justep/textarea/textarea"
              bind-ref="mainData.ref('fUser')"/> 
          </div>  
          <div xid="col33" class="col-sm-2"> 
            <label xid="fIdCodeL" class="control-label" bind-text="mainData.label('fIdCode')"/> 
          </div>  
          <div xid="col34" class="col-sm-4">
            <textarea xid="fIdCode" class="form-control" component="$UI/system/components/justep/textarea/textarea"
              bind-ref="mainData.ref('fIdCode')"/> 
          </div> 
        </div> 
        <div xid="formGroup4" class="form-group"> 
          <div xid="col41" class="col-sm-2"> 
            <label xid="fAppComL" class="control-label" bind-text="mainData.label('fAppCom')"/> 
          </div>  
          <div xid="col42" class="col-sm-4">
            <textarea xid="fAppCom" class="form-control" component="$UI/system/components/justep/textarea/textarea"
              bind-ref="mainData.ref('fAppCom')"/> 
          </div>  
          <div xid="col43" class="col-sm-2"> 
            <label xid="fAppComRepL" class="control-label" bind-text="mainData.label('fAppComRep')"/> 
          </div>  
          <div xid="col44" class="col-sm-4">
            <textarea xid="fAppComRep" class="form-control" component="$UI/system/components/justep/textarea/textarea"
              bind-ref="mainData.ref('fAppComRep')"/> 
          </div> 
        </div> 
        <div xid="formGroup5" class="form-group"> 
          <div xid="col51" class="col-sm-2"> 
            <label xid="fCompanyTypeL" class="control-label" bind-text="mainData.label('fCompanyType')"/> 
          </div>  
          <div xid="col52" class="col-sm-4">
            <textarea xid="fCompanyType" class="form-control" component="$UI/system/components/justep/textarea/textarea"
              bind-ref="mainData.ref('fCompanyType')"/> 
          </div>  
          <div xid="col53" class="col-sm-2"> 
            <label xid="fComDistrictL" class="control-label" bind-text="mainData.label('fComDistrict')"/> 
          </div>  
          <div xid="col54" class="col-sm-4">
            <textarea xid="fComDistrict" class="form-control" component="$UI/system/components/justep/textarea/textarea"
              bind-ref="mainData.ref('fComDistrict')"/> 
          </div> 
        </div> 
        <div xid="formGroup6" class="form-group"> 
          <div xid="col61" class="col-sm-2"> 
            <label xid="fComAveL" class="control-label" bind-text="mainData.label('fComAve')"/> 
          </div>  
          <div xid="col62" class="col-sm-4">
            <textarea xid="fComAve" class="form-control" component="$UI/system/components/justep/textarea/textarea"
              bind-ref="mainData.ref('fComAve')"/> 
          </div>  
          <div xid="col63" class="col-sm-2"> 
            <label xid="fComTelL" class="control-label" bind-text="mainData.label('fComTel')"/> 
          </div>  
          <div xid="col64" class="col-sm-4">
            <textarea xid="fComTel" class="form-control" component="$UI/system/components/justep/textarea/textarea"
              bind-ref="mainData.ref('fComTel')"/> 
          </div> 
        </div> 
        <div xid="formGroup7" class="form-group"> 
          <div xid="col71" class="col-sm-2"> 
            <label xid="fComZipL" class="control-label" bind-text="mainData.label('fComZip')"/> 
          </div>  
          <div xid="col72" class="col-sm-4">
            <textarea xid="fComZip" class="form-control" component="$UI/system/components/justep/textarea/textarea"
              bind-ref="mainData.ref('fComZip')"/> 
          </div>  
          <div xid="col73" class="col-sm-2"> 
            <label xid="fComRegAddrL" class="control-label" bind-text="mainData.label('fComRegAddr')"/> 
          </div>  
          <div xid="col74" class="col-sm-4">
            <textarea xid="fComRegAddr" class="form-control" component="$UI/system/components/justep/textarea/textarea"
              bind-ref="mainData.ref('fComRegAddr')"/> 
          </div> 
        </div> 
        <div xid="formGroup8" class="form-group"> 
          <div xid="col81" class="col-sm-2"> 
            <label xid="fComContactManL" class="control-label" bind-text="mainData.label('fComContactMan')"/> 
          </div>  
          <div xid="col82" class="col-sm-4">
            <textarea xid="fComContactMan" class="form-control" component="$UI/system/components/justep/textarea/textarea"
              bind-ref="mainData.ref('fComContactMan')"/> 
          </div>  
          <div xid="col83" class="col-sm-2"> 
            <label xid="fComContactManTelL" class="control-label" bind-text="mainData.label('fComContactManTel')"/> 
          </div>  
          <div xid="col84" class="col-sm-4">
            <textarea xid="fComContactManTel" class="form-control" component="$UI/system/components/justep/textarea/textarea"
              bind-ref="mainData.ref('fComContactManTel')"/> 
          </div> 
        </div> 
        <div xid="formGroup9" class="form-group"> 
          <div xid="col91" class="col-sm-2"> 
            <label xid="fComContactManAddrL" class="control-label" bind-text="mainData.label('fComContactManAddr')"/> 
          </div>  
          <div xid="col92" class="col-sm-4">
            <textarea xid="fComContactManAddr" class="form-control" component="$UI/system/components/justep/textarea/textarea"
              bind-ref="mainData.ref('fComContactManAddr')"/> 
          </div>  
          <div xid="col93" class="col-sm-2"> 
            <label xid="fProcessIdL" class="control-label" bind-text="mainData.label('fProcessId')"/> 
          </div>  
          <div xid="col94" class="col-sm-4">
            <textarea xid="fProcessId" class="form-control" component="$UI/system/components/justep/textarea/textarea"
              bind-ref="mainData.ref('fProcessId')"/> 
          </div> 
        </div> 
        <div xid="formGroup10" class="form-group"> 
          <div xid="col101" class="col-sm-2"> 
            <label xid="fTimeL" class="control-label" bind-text="mainData.label('fTime')"/> 
          </div>  
          <div xid="col102" class="col-sm-4">
            <textarea xid="fTime" class="form-control" component="$UI/system/components/justep/textarea/textarea"
              bind-ref="mainData.ref('fTime')"/> 
          </div>  
          <div xid="col103" class="col-sm-2"> 
            <label xid="fProcessMemoL" class="control-label" bind-text="mainData.label('fProcessMemo')"/> 
          </div>  
          <div xid="col104" class="col-sm-4">
            <input xid="fProcessMemo" class="form-control" component="$UI/system/components/justep/input/input"
              bind-ref="mainData.ref('fProcessMemo')"/>
          </div> 
        </div> 
        <div xid="formGroup11" class="form-group"> 
          <div xid="col111" class="col-sm-2"> 
            <label xid="fperInChargeIdL" class="control-label" bind-text="mainData.label('fperInChargeId')"/> 
          </div>  
          <div xid="col112" class="col-sm-4">
            <textarea xid="fperInChargeId" class="form-control" component="$UI/system/components/justep/textarea/textarea"
              bind-ref="mainData.ref('fperInChargeId')"/> 
          </div> 
        </div> 
          </div> 
        <div component="$UI/system/components/justep/controlGroup/controlGroup"
          class="x-control-group" title="从列表" collapsible="true" xid="detailCG"> 
          <div class="x-control-group-title"> 
            <span xid="span7">title</span> 
          </div>  
          <div> 
            <div component="$UI/system/components/justep/toolBar/toolBar" class="x-toolbar x-toolbar-spliter form-inline"
              xid="detailBar"> 
              <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
                xid="addBtn" icon="icon-plus" onClick="{operation:'detailData.new'}"> 
                <i xid="i6" class="icon-plus"/>  
                <span xid="span10"/> 
              </a>  
              <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
                xid="deleteBtn" onClick="{operation:'detailData.delete'}"> 
                <i xid="i7"/>  
                <span xid="span11"/> 
              </a> 
            </div>  
            <div component="$UI/system/components/justep/grid/grid" hiddenCaptionbar="true"
              xid="detail" data="detailData" width="100%" height="auto" class="x-grid-no-bordered"> 
              <columns xid="column">
                <column name="fAcceId" label="附件Id"
                  editable="true"> 
                  <editor xid="fAcceIdE"> 
                    <input xid="fAcceIdI" component="$UI/system/components/justep/input/input"
                      class="form-control" bind-ref="ref('fAcceId')"/> 
                  </editor> 
                </column> 
                <column name="fAcceName" label="附件名称"
                  editable="true"> 
                  <editor xid="fAcceNameE"> 
                    <input xid="fAcceNameI" component="$UI/system/components/justep/input/input"
                      class="form-control" bind-ref="ref('fAcceName')"/> 
                  </editor> 
                </column> 
                <column name="fAcceLink" label="附件链接"
                  editable="true"> 
                  <editor xid="fAcceLinkE"> 
                    <input xid="fAcceLinkI" component="$UI/system/components/justep/input/input"
                      class="form-control" bind-ref="ref('fAcceLink')"/> 
                  </editor> 
                </column> 
                <column name="fAcceValid" label="是否有效"
                  editable="true"> 
                  <editor xid="fAcceValidE"> 
                    <input xid="fAcceValidI" component="$UI/system/components/justep/input/input"
                      class="form-control" bind-ref="ref('fAcceValid')"/> 
                  </editor> 
                </column> 
              </columns> 
            </div> 
          </div> 
        </div> 
    
  </div> 
</div>