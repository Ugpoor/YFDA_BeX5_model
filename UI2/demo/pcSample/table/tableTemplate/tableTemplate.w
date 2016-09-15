<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window" component="$UI/system/components/justep/window/window"
  design="device:pc">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:70px;top:412px;"
    onLoad="modelLoad"> 
    <div component="$UI/system/components/justep/data/data" autoLoad="true"
      xid="popOverdata" idColumn="uName"> 
      <column label="姓名" name="uName" type="String" xid="xid9"/>  
      <column label="性别" name="uSex" type="String" xid="xid10"/>  
      <column label="年龄" name="uAge" type="Float" xid="xid11"/>  
      <column label="学历" name="uEducation" type="String" xid="xid12"/>  
      <column label="入职日期" name="uHiredate" type="Date" xid="xid13"/>  
      <column label="备注" name="uRemark" type="String" xid="xid14"/> 
    </div>  
    <div component="$UI/system/components/justep/data/data" autoLoad="true"
      xid="userData" idColumn="uId" onCustomRefresh="userDataCustomRefresh" confirmDelete="false"
      confirmRefresh="false"> 
      <column label="ID" name="uId" type="String" xid="xid1"/>  
      <column label="姓名" name="uName" type="String" xid="xid2"/>  
      <column label="密码" name="uPassword" type="String" xid="xid3"/>  
      <column label="性别" name="uSex" type="String" xid="xid4"/>  
      <column label="年龄" name="uAge" type="String" xid="xid5"/>  
      <column label="学历" name="uEducation" type="String" xid="xid6"/>  
      <column label="入职日期" name="uHiredate" type="String" xid="xid7"/>  
      <column label="备注" name="uRemark" type="String" xid="xid8"/>  
      <data xid="default1">[]</data>  
      <rule xid="rule1"> 
        <col name="uName" xid="ruleCol1"> 
          <required xid="required1"> 
            <expr xid="default3"/>  
            <message xid="default4"/> 
          </required> 
        </col> 
      </rule> 
    </div>  
    <div component="$UI/system/components/justep/data/data" autoLoad="true"
      xid="fileData" idColumn="fID"> 
      <column label="ID" name="fID" type="String" xid="xid18"/>  
      <column label="文件" name="fFile" type="String" xid="xid19"/>  
      <data xid="default2">[{"fID":"1","fFile":""}]</data> 
    </div> 
  </div>  
  <div component="$UI/system/components/justep/popOver/popOver" class="x-popOver"
    xid="popOver" position="center" anchor="column2"> 
    <div class="x-popOver-overlay" xid="div12"/>  
    <div class="x-popOver-content panel panel-default" xid="div13"> 
      <div component="$UI/system/components/justep/bar/bar" class="x-titlebar x-bar"
        xid="bar1" bind-html="&quot;用户详细信息&quot;"/>
      <ul role="menu" aria-labelledby="dropdownMenu1" xid="ul1" class="panel-body"> 
        <li role="presentation" xid="li3"> 
          <div component="$UI/system/components/justep/labelEdit/labelEdit"
            class="x-label-edit x-label30" xid="labelOutput1"> 
            <label class="x-label" xid="label2" style="text-align:right;"><![CDATA[姓名：]]></label>  
            <div component="$UI/system/components/justep/output/output" class="x-output x-edit"
              xid="output7" bind-ref="userData.ref('uName')"/> 
          </div> 
        </li>  
        <li role="presentation" xid="li4"> 
          <div component="$UI/system/components/justep/labelEdit/labelEdit"
            class="x-label-edit x-label30" xid="labelOutput2"> 
            <label class="x-label" xid="label3" style="text-align:right;"><![CDATA[性别：]]></label>  
            <div component="$UI/system/components/justep/output/output" class="x-output x-edit"
              xid="output8" bind-ref="userData.ref('uSex')"/> 
          </div> 
        </li>  
        <li role="presentation" xid="li3"> 
          <div component="$UI/system/components/justep/labelEdit/labelEdit"
            class="x-label-edit x-label30" xid="labelOutput3"> 
            <label class="x-label" xid="label4" style="text-align:right;"><![CDATA[年龄：]]></label>  
            <div component="$UI/system/components/justep/output/output" class="x-output x-edit"
              xid="output9" bind-ref="userData.ref('uAge')"/> 
          </div> 
        </li>  
        <li role="presentation" xid="li4"> 
          <div component="$UI/system/components/justep/labelEdit/labelEdit"
            class="x-label-edit x-label30" xid="labelOutput4"> 
            <label class="x-label" xid="label5" style="text-align:right;"><![CDATA[学历：]]></label>  
            <div component="$UI/system/components/justep/output/output" class="x-output x-edit"
              xid="output10" bind-ref="userData.ref('uEducation')"/> 
          </div> 
        </li>  
        <li role="presentation" xid="li5"> 
          <div component="$UI/system/components/justep/labelEdit/labelEdit"
            class="x-label-edit x-label30" xid="labelOutput5"> 
            <label class="x-label" xid="label6" style="text-align:right;"><![CDATA[入职日期：]]></label>  
            <div component="$UI/system/components/justep/output/output" class="x-output x-edit"
              xid="output11" bind-ref="userData.ref('uHiredate')" format="yyyy年MM月dd日"/> 
          </div> 
        </li>  
        <li role="presentation" xid="li6"> 
          <div component="$UI/system/components/justep/labelEdit/labelEdit"
            class="x-label-edit x-label30" xid="labelOutput6"> 
            <label class="x-label" xid="label7" style="text-align:right;"><![CDATA[备注：]]></label>  
            <div component="$UI/system/components/justep/output/output" class="x-output x-edit"
              xid="output12" bind-ref="userData.ref('uRemark')"/> 
          </div> 
        </li> 
      </ul> 
    </div> 
  </div>  
  <h4 xid="h42"><![CDATA[表格基本模板]]>  
    <a component="$UI/system/components/justep/button/button" class="btn btn-link"
      label="JS" xid="jsButton" onClick="jsButtonClick"> 
      <i xid="i2"/>  
      <span xid="span3">JS</span> 
    </a>  
    <a component="$UI/system/components/justep/button/button" class="btn btn-link"
      label="源码" xid="source" bind-visible="isVisible" onClick="sourceClick" icon="icon-document-text"> 
      <i xid="i6" class="icon-document-text"/>  
      <span xid="span7">源码</span> 
    </a> 
  </h4>  
  <div component="$UI/system/components/justep/controlGroup/controlGroup" class="x-control-group"
    title="功能面板" xid="controlGroup1" collapsible="true"> 
    <div class="x-control-group-title x-control-group-title-info" xid="controlGroupTitle1"> 
      <span xid="span9"><![CDATA[功能面板]]></span> 
    </div>  
    <div class="form-horizontal container-fluid" component="$UI/system/components/bootstrap/form/form(bootstrap)"
      xid="form1" style="height:50px;"> 
      <div class="form-group" xid="formGroup1"> 
        <div class="col-sm-6" xid="col8"> 
          <div component="$UI/system/components/justep/labelEdit/labelEdit"
            class="x-label-edit" xid="labelEditBtn1"> 
            <label class="x-label" style="width:50x;" xid="label1"><![CDATA[姓名：]]></label>  
            <div class="x-edit" xid="div3"> 
              <div class="input-group" xid="div4"> 
                <input component="$UI/system/components/justep/input/input" class="form-control"
                  xid="queryInput"/>  
                <span class="input-group-btn" xid="span1"> 
                  <a component="$UI/system/components/justep/button/button"
                    class="btn btn-default" icon="icon-android-search" xid="queryButton"
                    onClick="queryButtonClick"> 
                    <i class="icon-android-search" xid="i1"/>  
                    <span xid="span8"><![CDATA[查询]]></span> 
                  </a> 
                </span> 
              </div> 
            </div>  
            <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
              label="重置" xid="resetButton" icon="icon-loop" onClick="resetButtonClick"> 
              <i xid="i3" class="icon-loop"/>  
              <span xid="span2">重置</span> 
            </a> 
          </div> 
        </div> 
      </div> 
    </div> 
  </div>  
  <div> 
    <a component="$UI/system/components/justep/button/button" class="btn btn-link pull-left"
      label="新增用户" xid="addButton" onClick="addButtonClick" icon="icon-ios7-plus"> 
      <i xid="i4" class="icon-ios7-plus"/>  
      <span xid="span4">新增用户</span> 
    </a>  
    <a component="$UI/system/components/justep/button/button" class="btn btn-link pull-left"
      label="批量删除" xid="removeButton" onClick="removeButtonClick" icon="icon-ios7-trash"> 
      <i xid="i5" class="icon-ios7-trash"/>  
      <span xid="span6">批量删除</span> 
    </a>  
    <div component="$UI/system/components/justep/attachment/attachmentSimple"
      xid="attachmentSimple" bind-ref="fileData.ref('fFile')" class="o-uploadFile pull-left"> 
      <div class="x-attachment" xid="div25"> 
        <div class="x-attachment-content" xid="div26"> 
          <div class="x-attachment-cell" data-bind="visible:$state.get() == 'upload'"
            xid="div31"> 
            <div class="x-attachment-item x-item-upload" data-bind="visible:$state.get() == 'upload'"
              xid="div32">
              <i xid="i7" class="icon-document-text"/> 附件上传
            </div> 
          </div>  
          <div style="clear:both;" xid="div35"/> 
        </div> 
      </div> 
    </div> 
  </div>  
  <div component="$UI/system/components/justep/dataTables/dataTables" flexibleWidth="true"
    class="table table-bordered table-hover table-striped" xid="userDataTables" data="userData"
    multiSelect="true" scrollY="360" scrollX="1" responsive="false" onCellRender="userDataTablesCellRender"
    onRowClick="userDataTablesRowClick" onRowCheckedAll="userDataTablesRowCheckedAll"
    showRowNumber="false"> 
    <columns xid="columns1"> 
      <column name="uName" xid="column2" width="100" orderable="false" className="text-center"/>  
      <column name="uPassword" xid="column3" width="100" orderable="false" visible="false"/>  
      <column name="uSex" xid="column4" width="50" orderable="false" className="text-center"/>  
      <column name="uAge" xid="column5" width="50" orderable="false" className="text-center"/>  
      <column name="uEducation" xid="column6" width="150" orderable="false" className="text-center"/>  
      <column name="uHiredate" xid="column7" width="150" orderable="false" className="text-center"/>  
      <column name="uRemark" xid="column8" width="" orderable="false"/>  
      <column name="uOperate" xid="column9" label="操作" width="200" orderable="false"
        className="text-center"/> 
    </columns> 
  </div>  
  <div component="$UI/system/components/justep/pagerBar/pagerBar" class="x-pagerbar container-fluid"
    xid="pagerBar1" data="userData"> 
    <div class="row" xid="div5"> 
      <div class="col-sm-3" xid="div6"> 
        <div class="x-pagerbar-length" xid="div7"> 
          <label component="$UI/system/components/justep/pagerLimitSelect/pagerLimitSelect"
            class="x-pagerlimitselect" xid="pagerLimitSelect2" defaultValue="10"> 
            <span xid="span11">显示</span>  
            <select component="$UI/system/components/justep/select/select" class="form-control input-sm"
              xid="select2"> 
              <option value="10" xid="default6">10</option>  
              <option value="20" xid="default7">20</option>  
              <option value="50" xid="default8">50</option>  
              <option value="100" xid="default9">100</option> 
            </select>  
            <span xid="span12">条</span> 
          </label> 
        </div> 
      </div>  
      <div class="col-sm-3" xid="div8"> 
        <div class="x-pagerbar-info" xid="div9">当前显示0条，共0条</div> 
      </div>  
      <div class="col-sm-6" xid="div10"> 
        <div class="x-pagerbar-pagination" xid="div11"> 
          <ul class="pagination" component="$UI/system/components/bootstrap/pagination/pagination"
            xid="pagination1"> 
            <li class="prev" xid="li1"> 
              <a href="#" xid="a2"> 
                <span aria-hidden="true" xid="span13">«</span>  
                <span class="sr-only" xid="span14">Previous</span> 
              </a> 
            </li>  
            <li class="next" xid="li2"> 
              <a href="#" xid="a3"> 
                <span aria-hidden="true" xid="span15">»</span>  
                <span class="sr-only" xid="span16">Next</span> 
              </a> 
            </li> 
          </ul> 
        </div> 
      </div> 
    </div> 
  </div>  
  <span component="$UI/system/components/justep/windowDialog/windowDialog" xid="windowDialogUpdate"
    src="$UI/demo/sample/table/tableTemplate/toUpdate.w" title="修改" showTitle="true"
    status="normal" width="50%" height="60%" onReceive="windowDialogUpdateReceive"/>  
  <span component="$UI/system/components/justep/windowDialog/windowDialog" xid="windowDialogAdd"
    showTitle="true" title="新增用户" status="normal" width="55%" height="80%" src="$UI/demo/sample/table/tableTemplate/toAdd.w"
    onReceive="windowDialogAddReceive"/> 
</div>
