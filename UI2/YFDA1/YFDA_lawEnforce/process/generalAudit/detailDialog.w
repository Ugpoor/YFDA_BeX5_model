<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window" component="$UI/system/components/justep/window/window"
  design="device:pc">  
  <div component="$UI/system/components/justep/model/model" xid="model">
    <div component="$UI/system/components/justep/data/bizData" xid="dialogData"
      directDelete="true" autoLoad="true" concept="YF_Acce"
      columns="fAcceId,fAcceName,fAcceLink,fApplicationId,fAcceValid" autoNew="false"> 
      <reader action="/YFDA1/YFDA_lawEnforce/logic/action/queryYF_AcceAction"/>  
      <writer action="/YFDA1/YFDA_lawEnforce/logic/action/saveYF_AcceAction"/>  
      <creator action="/YFDA1/YFDA_lawEnforce/logic/action/createYF_AcceAction"/>  
      <calculateRelation relation="calcCheckBox"/>
    </div>
  </div>  
  <div class="form-horizontal container-fluid" component="$UI/system/components/bootstrap/form/form"
    xid="form">
    <div class="form-group"> 
      <div class="col-sm-2"> 
        <label class="control-label" bind-text="dialogData.label('fApplicationId')"/> 
      </div>  
      <div class="col-sm-4">
        <input class="form-control" component="$UI/system/components/justep/input/input"
          data="dialogData" bind-ref="dialogData.ref('fApplicationId')"/>
      </div>  
      <div class="col-sm-2"> 
        <label class="control-label" bind-text="dialogData.label('fApplicationType')"/> 
      </div>  
      <div class="col-sm-4">
        <input class="form-control" component="$UI/system/components/justep/input/input"
          data="dialogData" bind-ref="dialogData.ref('fApplicationType')"/>
      </div> 
    </div> 
    <div class="form-group"> 
      <div class="col-sm-2"> 
        <label class="control-label" bind-text="dialogData.label('fApplyTime')"/> 
      </div>  
      <div class="col-sm-4">
        <input class="form-control" component="$UI/system/components/justep/input/input"
          data="dialogData" bind-ref="dialogData.ref('fApplyTime')"/>
      </div>  
      <div class="col-sm-2"> 
        <label class="control-label" bind-text="dialogData.label('fApplicationStatus')"/> 
      </div>  
      <div class="col-sm-4">
        <input class="form-control" component="$UI/system/components/justep/input/input"
          data="dialogData" bind-ref="dialogData.ref('fApplicationStatus')"/>
      </div> 
    </div> 
    <div class="form-group"> 
      <div class="col-sm-2"> 
        <label class="control-label" bind-text="dialogData.label('fUser')"/> 
      </div>  
      <div class="col-sm-4">
        <input class="form-control" component="$UI/system/components/justep/input/input"
          data="dialogData" bind-ref="dialogData.ref('fUser')"/>
      </div>  
      <div class="col-sm-2"> 
        <label class="control-label" bind-text="dialogData.label('fIdCode')"/> 
      </div>  
      <div class="col-sm-4">
        <input class="form-control" component="$UI/system/components/justep/input/input"
          data="dialogData" bind-ref="dialogData.ref('fIdCode')"/>
      </div> 
    </div> 
    <div class="form-group"> 
      <div class="col-sm-2"> 
        <label class="control-label" bind-text="dialogData.label('fAppCom')"/> 
      </div>  
      <div class="col-sm-4">
        <input class="form-control" component="$UI/system/components/justep/input/input"
          data="dialogData" bind-ref="dialogData.ref('fAppCom')"/>
      </div>  
      <div class="col-sm-2"> 
        <label class="control-label" bind-text="dialogData.label('fAppComRep')"/> 
      </div>  
      <div class="col-sm-4">
        <input class="form-control" component="$UI/system/components/justep/input/input"
          data="dialogData" bind-ref="dialogData.ref('fAppComRep')"/>
      </div> 
    </div> 
    <div class="form-group"> 
      <div class="col-sm-2"> 
        <label class="control-label" bind-text="dialogData.label('fCompanyType')"/> 
      </div>  
      <div class="col-sm-4">
        <input class="form-control" component="$UI/system/components/justep/input/input"
          data="dialogData" bind-ref="dialogData.ref('fCompanyType')"/>
      </div>  
      <div class="col-sm-2"> 
        <label class="control-label" bind-text="dialogData.label('fComDistrict')"/> 
      </div>  
      <div class="col-sm-4">
        <input class="form-control" component="$UI/system/components/justep/input/input"
          data="dialogData" bind-ref="dialogData.ref('fComDistrict')"/>
      </div> 
    </div> 
    <div class="form-group"> 
      <div class="col-sm-2"> 
        <label class="control-label" bind-text="dialogData.label('fComAve')"/> 
      </div>  
      <div class="col-sm-4">
        <input class="form-control" component="$UI/system/components/justep/input/input"
          data="dialogData" bind-ref="dialogData.ref('fComAve')"/>
      </div>  
      <div class="col-sm-2"> 
        <label class="control-label" bind-text="dialogData.label('fComTel')"/> 
      </div>  
      <div class="col-sm-4">
        <input class="form-control" component="$UI/system/components/justep/input/input"
          data="dialogData" bind-ref="dialogData.ref('fComTel')"/>
      </div> 
    </div> 
    <div class="form-group"> 
      <div class="col-sm-2"> 
        <label class="control-label" bind-text="dialogData.label('fComZip')"/> 
      </div>  
      <div class="col-sm-4">
        <input class="form-control" component="$UI/system/components/justep/input/input"
          data="dialogData" bind-ref="dialogData.ref('fComZip')"/>
      </div>  
      <div class="col-sm-2"> 
        <label class="control-label" bind-text="dialogData.label('fComRegAddr')"/> 
      </div>  
      <div class="col-sm-4">
        <input class="form-control" component="$UI/system/components/justep/input/input"
          data="dialogData" bind-ref="dialogData.ref('fComRegAddr')"/>
      </div> 
    </div> 
    <div class="form-group"> 
      <div class="col-sm-2"> 
        <label class="control-label" bind-text="dialogData.label('fComContactMan')"/> 
      </div>  
      <div class="col-sm-4">
        <input class="form-control" component="$UI/system/components/justep/input/input"
          data="dialogData" bind-ref="dialogData.ref('fComContactMan')"/>
      </div>  
      <div class="col-sm-2"> 
        <label class="control-label" bind-text="dialogData.label('fComContactManTel')"/> 
      </div>  
      <div class="col-sm-4">
        <input class="form-control" component="$UI/system/components/justep/input/input"
          data="dialogData" bind-ref="dialogData.ref('fComContactManTel')"/>
      </div> 
    </div> 
    <div class="form-group"> 
      <div class="col-sm-2"> 
        <label class="control-label" bind-text="dialogData.label('fComContactManAddr')"/> 
      </div>  
      <div class="col-sm-4">
        <input class="form-control" component="$UI/system/components/justep/input/input"
          data="dialogData" bind-ref="dialogData.ref('fComContactManAddr')"/>
      </div>  
      <div class="col-sm-2"> 
        <label class="control-label" bind-text="dialogData.label('fProcessId')"/> 
      </div>  
      <div class="col-sm-4">
        <input class="form-control" component="$UI/system/components/justep/input/input"
          data="dialogData" bind-ref="dialogData.ref('fProcessId')"/>
      </div> 
    </div> 
    <div class="form-group"> 
      <div class="col-sm-2"> 
        <label class="control-label" bind-text="dialogData.label('fTime')"/> 
      </div>  
      <div class="col-sm-4">
        <input class="form-control" component="$UI/system/components/justep/input/input"
          data="dialogData" bind-ref="dialogData.ref('fTime')"/>
      </div>  
      <div class="col-sm-2"> 
        <label class="control-label" bind-text="dialogData.label('fProcessMemo')"/> 
      </div>  
      <div class="col-sm-4">
        <input class="form-control" component="$UI/system/components/justep/input/input"
          data="dialogData" bind-ref="dialogData.ref('fProcessMemo')"/>
      </div> 
    </div> 
    <div class="form-group"> 
      <div class="col-sm-2"> 
        <label class="control-label" bind-text="dialogData.label('fperInChargeId')"/> 
      </div>  
      <div class="col-sm-4">
        <input class="form-control" component="$UI/system/components/justep/input/input"
          data="dialogData" bind-ref="dialogData.ref('fperInChargeId')"/>
      </div> 
    </div> 
    
    <div class="x-panel-bottom" xid="bottom1" height="42"> 
      <a class="btn btn-link btn-only-label x-dialog-button" component="$UI/system/components/justep/button/button"
        label="取    消" onClick="cancelBtnClick" style="margin-left:30px;width:80px;"
        xid="cancelBtn"> 
        <i xid="i4_1"/>  
        <span xid="span4_1">取 消</span> 
      </a>  
      <a component="$UI/system/components/justep/button/button" class="btn btn-primary x-dialog-button"
        label="确定" xid="OKBtn" onClick="okBtnClick"> 
        <i xid="i1"/>  
        <span xid="span1">确定</span> 
      </a> 
    </div> 
  </div>  
  <span component="$UI/system/components/justep/windowReceiver/windowReceiver"
    xid="windowReceiver" onReceive="windowReceiverReceive"/>
</div>