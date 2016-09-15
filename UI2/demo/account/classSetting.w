<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" component="$UI/system/components/justep/window/window" design="device:m;"
  xid="window" class="window">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:130px;top:300px;"> 
    <div component="$UI/system/components/justep/data/baasData" autoLoad="true"
      xid="classData" idColumn="fID" onAfterSave="classDataAfterSave" saveAction="saveAccount_class"
      queryAction="queryAccount_class" tableName="account_class" url="/justep/account" directDelete="true"> 
      <column label="主键" name="fID" type="String" xid="xid1"/>  
      <column label="支出\收入" name="fType" type="String" xid="xid2"/>  
      <column label="分类" name="fClass" type="String" xid="xid10"/>  
      <data xid="default1">[]</data> 
    </div>  
    <div component="$UI/system/components/justep/data/data" autoLoad="true"
      xid="typeData" idColumn="fType" limit="20"> 
      <column label="fType" name="fType" type="String" xid="xid11"/>  
      <data xid="default3">[{"fType":"收入"},{"fType":"支出"}]</data> 
    </div> 
  </div>  
  <div component="$UI/system/components/justep/panel/panel" class="x-panel x-full"
    xid="panel1"> 
    <div class="x-panel-top" xid="top1"> 
      <div component="$UI/system/components/justep/titleBar/titleBar" title="设置分类"
        class="x-titlebar"> 
        <div class="x-titlebar-left"> 
          <a component="$UI/system/components/justep/button/button" label=""
            class="btn btn-link btn-only-icon" icon="icon-chevron-left" xid="backBtn"
            onClick="{operation:'window.close'}"> 
            <i class="icon-chevron-left"/>  
            <span/> 
          </a> 
        </div>  
        <div class="x-titlebar-title">设置分类</div>  
        <div class="x-titlebar-right reverse"> 
          <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-only-icon"
            label="保存" xid="saveBtn" icon="icon-android-checkmark" onClick="{operation:'classData.save'}"> 
            <i xid="i3" class="icon-android-checkmark"/>  
            <span xid="span4">保存</span> 
          </a>  
          <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-only-icon"
            label="新增" xid="newBtn" icon="icon-android-add" onClick="newBtnClick"> 
            <i xid="i4" class="icon-android-add"/>  
            <span xid="span5">新增</span> 
          </a> 
        </div> 
      </div> 
    </div>  
    <div class="x-panel-content" xid="content1" style="bottom: 0px;"> 
      <div component="$UI/system/components/justep/list/list" class="x-list"
        xid="list1" data="classData"> 
        <ul class="x-list-template" xid="listTemplateUl1"> 
          <li xid="li1"> 
            <div component="$UI/system/components/justep/row/row" class="x-row x-row-center"
              xid="row1"> 
              <div class="x-col x-col-33" xid="col1"> 
                <select component="$UI/system/components/justep/select/select"
                  class="form-control" xid="select1" bind-options="$model.typeData"
                  bind-optionsValue="fType" bind-ref="ref('fType')"/> 
              </div>  
              <div class="x-col" xid="col2"> 
                <input component="$UI/system/components/justep/input/input" class="form-control"
                  xid="input1" bind-ref="ref('fClass')"/> 
              </div>  
              <div class="x-col x-col-fixed" xid="col3" style="width:50px;"> 
                <a component="$UI/system/components/justep/button/button"
                  class="btn btn-link btn-only-icon" label="删除" xid="deleteBtn" icon="icon-android-close"
                  onClick="deleteBtnClick"> 
                  <i xid="i2" class="icon-android-close"/>  
                  <span xid="span3">删除</span> 
                </a> 
              </div> 
            </div> 
          </li> 
        </ul> 
      </div> 
    </div> 
  </div> 
</div>
