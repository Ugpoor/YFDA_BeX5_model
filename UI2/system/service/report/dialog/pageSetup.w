<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window" component="$UI/system/components/justep/window/window"
  design="device:mobile">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:397px;top:354px;"> 
    <div component="$UI/system/components/justep/data/data" autoLoad="true"
      xid="orientationData" idColumn="code"> 
      <column label="code" name="code" type="String" xid="default1"/>  
      <column label="orientation" name="orientation" type="String" xid="default2"/>  
      <data xid="default3">[{"orientation":"纵向"},{"code":"Landscape","orientation":"横向"}]</data> 
    </div>  
    <div component="$UI/system/components/justep/data/data" autoLoad="true"
      xid="pageType" idColumn="paperType"> 
      <column label="paperType" name="paperType" type="String" xid="default4"/>  
      <column label="displayName" name="displayName" type="String" xid="default5"/>  
      <column label="pageWidth" name="pageWidth" type="String" xid="default6"/>  
      <column label="pageHeight" name="pageHeight" type="String" xid="default7"/>  
      <data xid="default9">[{"paperType":"A3","displayName":"A3","pageWidth":"297mm","pageHeight":"420mm"},{"paperType":"A4","displayName":"A4","pageWidth":"210mm","pageHeight":"297mm"},{"paperType":"A5","displayName":"A5","pageWidth":"148mm","pageHeight":"210mm"},{"paperType":"B4","displayName":"B4","pageWidth":"257mm","pageHeight":"364mm"},{"paperType":"B5","displayName":"B5","pageWidth":"182mm","pageHeight":"257mm"},{"paperType":"4K","displayName":"4开纸","pageWidth":"368mm","pageHeight":"520mm"},{"paperType":"8K","displayName":"8开纸","pageWidth":"260mm","pageHeight":"368mm"},{"paperType":"16K","displayName":"16开纸","pageWidth":"184mm","pageHeight":"260mm"},{"paperType":"32K","displayName":"32开纸","pageWidth":"130mm","pageHeight":"184mm"},{"paperType":"B32K","displayName":"大32开纸","pageWidth":"140mm","pageHeight":"203mm"},{"paperType":"DL","displayName":"DL信封","pageWidth":"110mm","pageHeight":"220mm"},{"paperType":"C3","displayName":"C3信封","pageWidth":"324mm","pageHeight":"458mm"},{"paperType":"C4","displayName":"C4信封","pageWidth":"229mm","pageHeight":"324mm"},{"paperType":"C5","displayName":"C5信封","pageWidth":"162mm","pageHeight":"229mm"},{"paperType":"C6","displayName":"C6信封","pageWidth":"114mm","pageHeight":"162mm"},{"paperType":"B4L","displayName":"B4信封","pageWidth":"250mm","pageHeight":"353mm"},{"paperType":"B5L","displayName":"B5信封","pageWidth":"176mm","pageHeight":"250mm"},{"paperType":"B6L","displayName":"B6信封","pageWidth":"176mm","pageHeight":"125mm"},{"paperType":"custom","displayName":"自定义","pageWidth":"100mm","pageHeight":"100mm"}]</data> 
    </div>  
    <div component="$UI/system/components/justep/data/data" autoLoad="true"
      xid="pageInfo" idColumn="fid" onValueChanged="pageInfoValueChanged"> 
      <data xid="default22">[{"fid":"1"}]</data>  
      <column label="fid" name="fid" type="String" xid="default23"/>  
      <column label="显示名称" name="displayName" type="String" xid="default24"/>  
      <column label="类型" name="paperType" type="String" xid="default25"/>  
      <column label="宽度" name="pageWidth" type="String" xid="default26"/>  
      <column label="高度" name="pageHeight" type="String" xid="default27"/>  
      <column label="方向" name="orientation" type="String" xid="default28"/>  
      <column label="上页边距" name="marginTop" type="String" xid="default29"/>  
      <column label="下页边距" name="marginBottom" type="String" xid="default30"/>  
      <column label="左页边距" name="marginLeft" type="String" xid="default31"/>  
      <column label="右页边距" name="marginRight" type="String" xid="default32"/>  
      <column label="页眉" name="marginHeader" type="String" xid="default33"/>  
      <column label="页脚" name="marginFootter" type="String" xid="default34"/> 
    </div> 
  </div>  
  <div component="$UI/system/components/justep/panel/panel" class="x-panel x-full"
    xid="panel1"> 
    <div class="x-panel-content" xid="content1"> 
      <div component="$UI/system/components/justep/controlGroup/controlGroup"
        class="x-control-group" title="纸张" xid="controlGroup1"> 
        <div class="x-control-group-title" xid="controlGroupTitle1"> 
          <span xid="span3">title</span> 
        </div>  
        <div class="form-horizontal container-fluid" component="$UI/system/components/bootstrap/form/form"
          xid="form1"> 
          <div class="form-group" xid="formGroup1"> 
            <div class="col-sm-2" xid="col1"> 
              <label class="control-label" xid="controlLabel1" bind-text=" $model.pageInfo.label(&quot;paperType&quot;)"><![CDATA[]]></label> 
            </div>  
            <div class="col-sm-4" xid="col2"> 
              <select component="$UI/system/components/justep/select/select" class="form-control"
                xid="select1" bind-ref="pageInfo.ref('paperType')" bind-labelRef="pageInfo.ref('displayName')"
                bind-options="pageType" bind-optionsValue="paperType" bind-optionsLabel="displayName"/> 
            </div> 
          </div>  
          <div class="form-group"> 
            <div class="col-sm-2" xid="col3"> 
              <label class="control-label" xid="controlLabel2" bind-text=" $model.pageInfo.label(&quot;pageWidth&quot;)"/> 
            </div>  
            <div class="col-sm-4" xid="col4"> 
              <input component="$UI/system/components/justep/input/input" class="form-control"
                xid="input1" bind-ref="pageInfo.ref('pageWidth')"/> 
            </div>  
            <div class="col-sm-2" xid="col5"> 
              <label class="control-label" xid="controlLabel3" bind-text=" $model.pageInfo.label(&quot;pageHeight&quot;)"/> 
            </div>  
            <div class="col-sm-4" xid="col6"> 
              <input component="$UI/system/components/justep/input/input" class="form-control"
                xid="input2" bind-ref="pageInfo.ref('pageHeight')"/> 
            </div> 
          </div> 
        </div> 
      </div>  
      <div component="$UI/system/components/justep/controlGroup/controlGroup"
        class="x-control-group" title="边距" xid="controlGroup2"> 
        <div class="x-control-group-title" xid="controlGroupTitle2"> 
          <span xid="span4">title</span> 
        </div>  
        <div class="form-horizontal container-fluid" component="$UI/system/components/bootstrap/form/form"
          xid="form2"> 
          <div class="form-group" xid="formGroup2"> 
            <div class="col-sm-2" xid="col7"> 
              <label class="control-label" xid="controlLabel4" bind-text=" $model.pageInfo.label(&quot;marginTop&quot;)"/> 
            </div>  
            <div class="col-sm-4" xid="col8"> 
              <input component="$UI/system/components/justep/input/input" class="form-control"
                xid="input3" bind-ref="pageInfo.ref('marginTop')"/> 
            </div>  
            <div class="col-sm-2" xid="col9"> 
              <label class="control-label" xid="controlLabel5" bind-text=" $model.pageInfo.label(&quot;marginBottom&quot;)"/> 
            </div>  
            <div class="col-sm-4" xid="col10"> 
              <input component="$UI/system/components/justep/input/input" class="form-control"
                xid="input4" bind-ref="pageInfo.ref('marginBottom')"/> 
            </div> 
          </div>  
          <div class="form-group"> 
            <div class="col-sm-2" xid="col11"> 
              <label class="control-label" xid="controlLabel6" bind-text=" $model.pageInfo.label(&quot;marginLeft&quot;)"/> 
            </div>  
            <div class="col-sm-4" xid="col12"> 
              <input component="$UI/system/components/justep/input/input" class="form-control"
                xid="input5" bind-ref="pageInfo.ref('marginLeft')"/> 
            </div>  
            <div class="col-sm-2" xid="col13"> 
              <label class="control-label" xid="controlLabel7" bind-text=" $model.pageInfo.label(&quot;marginRight&quot;)"/> 
            </div>  
            <div class="col-sm-4" xid="col14"> 
              <input component="$UI/system/components/justep/input/input" class="form-control"
                xid="input6" bind-ref="pageInfo.ref('marginRight')"/> 
            </div> 
          </div> 
        </div> 
      </div>  
      <div component="$UI/system/components/justep/controlGroup/controlGroup"
        class="x-control-group" title="方向" xid="controlGroup3"> 
        <div class="x-control-group-title" xid="controlGroupTitle3"> 
          <span xid="span5">title</span> 
        </div>  
        <div class="form-horizontal container-fluid" component="$UI/system/components/bootstrap/form/form"
          xid="form4"> 
          <div class="form-group" xid="formGroup4"> 
            <div class="col-sm-1" xid="col23"/>
            <div class="col-sm-11" xid="col19"> 
              <span component="$UI/system/components/justep/select/radioGroup"
                class="x-radio-group" xid="radioGroup1" bind-ref="pageInfo.ref('orientation')"
                bind-itemset="orientationData" bind-itemsetValue="ref('code')" bind-itemsetLabel="ref('orientation')"/> 
            </div>  
          </div> 
        </div> 
      </div>  
      <div component="$UI/system/components/justep/controlGroup/controlGroup"
        class="x-control-group" title="页眉页脚" xid="controlGroup4"> 
        <div class="x-control-group-title" xid="controlGroupTitle4"> 
          <span xid="span6">title</span> 
        </div>  
        <div class="form-horizontal container-fluid" component="$UI/system/components/bootstrap/form/form"
          xid="form3"> 
          <div class="form-group" xid="formGroup3"> 
            <div class="col-sm-2" xid="col15"> 
              <label class="control-label" xid="controlLabel8" bind-text=" $model.pageInfo.label(&quot;marginHeader&quot;)"/> 
            </div>  
            <div class="col-sm-4" xid="col16"> 
              <input component="$UI/system/components/justep/input/input" class="form-control"
                xid="input7" bind-ref="pageInfo.ref('marginHeader')"/> 
            </div>  
            <div class="col-sm-2" xid="col17"> 
              <label class="control-label" xid="controlLabel9" bind-text=" $model.pageInfo.label(&quot;marginFootter&quot;)"/> 
            </div>  
            <div class="col-sm-4" xid="col18"> 
              <input component="$UI/system/components/justep/input/input" class="form-control"
                xid="input8" bind-ref="pageInfo.ref('marginFootter')"/> 
            </div> 
          </div> 
        </div> 
      </div> 
    </div>  
    <div class="x-panel-bottom" xid="bottom1"> 
      <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-only-label x-dialog-button"
        label="取消" xid="cancelBtn" onClick="{&quot;operation&quot;:&quot;wReceiver.windowCancel&quot;}"> 
        <i xid="i2"/>  
        <span xid="span2">取消</span> 
      </a>  
      <a component="$UI/system/components/justep/button/button" class="btn btn-primary x-dialog-button"
        label="确定" xid="OKBtn" onClick="OKBtnClick"> 
        <i xid="i1"/>  
        <span xid="span1">确定</span> 
      </a> 
    </div> 
  </div>  
  <span component="$UI/system/components/justep/windowReceiver/windowReceiver"
    xid="wReceiver" style="left:443px;top:568px;" onReceive="wReceiverReceive"/> 
</div>
