<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window" component="$UI/system/components/justep/window/window"
  design="device:pc">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:88px;top:269px;"> 
    <div component="$UI/system/components/justep/data/bizData" autoLoad="true"
      xid="main" concept="Portal2ProfileManager"> 
      <reader xid="default1" action="/portal2/logic/action/queryPortal2ProfileManagerAction"/>  
      <writer xid="default2" action="/portal2/logic/action/savePortal2ProfileManagerAction"/>  
      <creator xid="default3" action="/portal2/logic/action/createPortal2ProfileManagerAction"/>  
      <filter name="filter0" xid="filter1"><![CDATA[Portal2ProfileManager.sPublishType='portal3']]></filter>  
      <rule xid="rule1"> 
        <col name="sThemeID" xid="ruleCol1"> 
          <required xid="required1"> 
            <expr xid="default4">true</expr> 
          </required> 
        </col>  
        <col name="sOrgID" xid="ruleCol2"> 
          <required xid="required2"> 
            <expr xid="default5">true</expr> 
          </required> 
        </col> 
      </rule> 
    </div>  
    <div component="$UI/system/components/justep/data/bizData" autoLoad="true"
      xid="themes" concept="Portal2Profiles"> 
      <reader xid="default6" action="/portal2/logic/action/queryPortal2ProfilesAction"/>  
      <writer xid="default7" action="/portal2/logic/action/savePortal2ProfilesAction"/>  
      <creator xid="default8" action="/portal2/logic/action/createPortal2ProfilesAction"/>  
      <filter name="filter0" xid="filter2"><![CDATA[Portal2Profiles.sPublishType='system4portal3' and Portal2Profiles.sThemeActivity='activity']]></filter>
    </div> 
  </div>  
  <div component="$UI/system/components/justep/toolBar/toolBar" class="x-toolbar form-inline x-toolbar-spliter"
    xid="toolBar1"> 
    <a component="$UI/system/components/justep/button/button" class="btn btn-default btn-icon-left"
      label="新建" xid="createBtn" style="margin-left:10px;" icon="icon-plus" onClick="createBtnClick"> 
      <i xid="i1" class="icon-plus"/>  
      <span xid="span1">新建</span> 
    </a>  
    <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
      label="保存" xid="saveBtn" style="margin-left:10px;" icon="glyphicon glyphicon-floppy-disk"
      onClick="{operation:'main.save'}"> 
      <i xid="i2" class="glyphicon glyphicon-floppy-disk"/>  
      <span xid="span2">保存</span> 
    </a>  
    <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
      label="删除" xid="deleteBtn" style="margin-left:10px;" icon="glyphicon glyphicon-trash"
      onClick="{operation:'main.delete'}"> 
      <i xid="i3" class="glyphicon glyphicon-trash"/>  
      <span xid="span3">删除</span> 
    </a>  
    <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
      label="刷新" xid="refreshBtn" style="margin-left:10px;" icon="glyphicon glyphicon-repeat"
      onClick="{operation:'main.refresh'}"> 
      <i xid="i4" class="glyphicon glyphicon-repeat"/>  
      <span xid="span4">刷新</span> 
    </a> 
  </div>  
  <div component="$UI/system/components/justep/grid/grid" hiddenCaptionbar="true"
    altRows="true" class="x-grid-no-bordered" xid="grid1" data="main"> 
    <columns xid="columns1"> 
      <column width="400" name="sFName" xid="column1" label="组织" editable="true"> 
        <editor xid="editor3"> 
          <div class="x-gridSelect" component="$UI/system/components/justep/org/orgSelectPC"
            xid="orgSelectPC1" bind-ref="ref('sOrgID')" bind-labelRef="ref('sFName')"> 
            <div component="$UI/system/components/justep/data/bizData" autoLoad="false"
              xid="bizData1"/>  
            <option xid="option1" value="SA_OPOrg" label="sFName"> 
              <columns xid="columns2"> 
                <column name="sName" xid="column3"/> 
              </columns> 
            </option> 
          </div> 
        </editor> 
      </column>  
      <column width="300" name="sThemeName" xid="column4" editable="true"> 
        <editor xid="editor5"> 
          <div class="x-gridSelect" component="$UI/system/components/justep/gridSelect/gridSelect"
            xid="gridSelect1" bind-ref="ref('sThemeID')" bind-labelRef="ref('sThemeName')"> 
            <option xid="option2" data="themes" value="Portal2Profiles" label="sThemeName"/>
          </div>
        </editor> 
      </column> 
    </columns> 
  </div> 
</div>
