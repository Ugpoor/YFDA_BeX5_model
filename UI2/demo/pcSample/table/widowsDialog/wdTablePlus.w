<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window" component="$UI/system/components/justep/window/window"
  design="device:pc">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:104px;top:586px;"> 
    <div component="$UI/system/components/justep/data/data" autoLoad="true"
      xid="tableData" idColumn="tID"> 
      <column label="ID" name="tID" type="String" xid="xid1"/>  
      <column label="姓名" name="tName" type="String" xid="xid2"/>  
      <column label="性别" name="tSex" type="String" xid="xid3"/>  
      <column label="年龄" name="tAge" type="Float" xid="xid4"/>  
      <column label="职业" name="tJob" type="String" xid="xid5"/>  
      <column label="手机" name="tPhone" type="String" xid="xid6"/>  
      <column label="地址" name="tAddress" type="String" xid="xid7"/>  
      <column label="备注" name="tRemark" type="String" xid="xid8"/>  
      <data xid="default1">[{"tID":"1","tName":"张小三","tSex":"男","tAge":21,"tJob":"Java开发工程师","tPhone":"18985141393","tAddress":"北京市东城区西长安街","tRemark":"北京市东城区西长安街天安门广场"},{"tID":"2","tName":"李小四","tSex":"女","tAge":20,"tJob":"平面设计工程师","tPhone":"15178897336","tAddress":"北京市朝阳区十里河","tRemark":"十里河万家灯火欢乐无限,万家灯火欢乐无限"},{"tID":"3","tName":"张三","tSex":"男","tAge":41,"tJob":"中层领导","tPhone":"15197620236","tAddress":"北京市东城区西长安街","tRemark":"北京市东城区西长安街"},{"tID":"4","tName":"王五","tSex":"男","tAge":44,"tJob":"销售总监","tPhone":"183698527167","tAddress":"上海市浦东新区黄浦江边","tRemark":"上海自来水来自海上"},{"tID":"5","tName":"王小五","tSex":"男","tAge":22,"tJob":"销售员","tPhone":"13251786736","tAddress":"上海市浦东新区黄浦江边","tRemark":"上海市浦东新区黄浦江边上海自来水来自海上"},{"tID":"6","tName":"王李马","tSex":"男","tAge":51,"tJob":"老板","tPhone":"18888888888","tAddress":"北京市东城区西长安街","tRemark":"北京市东城区西长安街北京市东城区西长安街北京市东城区西长安街"},{"tID":"7","tName":"李四","tSex":"女","tAge":40,"tJob":"部门经理","tPhone":"13517897336","tAddress":"北京市朝阳区十里河","tRemark":"十里河万家灯火欢乐无限,万家灯火欢乐无限"},{"tID":"8","tName":"小明","tSex":"男","tAge":22,"tJob":"学生","tPhone":"183698527167","tAddress":"新疆维吾尔族自治区","tRemark":"根据给定的ID匹配一个元素。 如果选择器中包含特殊字符，可以用两个斜杠转义。"},{"tID":"9","tName":"晓红","tSex":"女","tAge":18,"tJob":"学生","tPhone":"15178897336","tAddress":"北京市东城区西长安街","tRemark":"。。。。。。。。。。。。。"},{"tID":"10","tName":"小明","tSex":"男","tAge":20,"tJob":"学生","tPhone":"13289643725","tAddress":"新疆维吾尔族自治区","tRemark":"根据给定的ID匹配一个元素。 如果选择器中包含特殊字符，可以用两个斜杠转义。"}]</data> 
    </div>  
    <div component="$UI/system/components/justep/data/data" autoLoad="true"
      xid="selectData" idColumn="sName"> 
      <column label="名称" name="sName" type="String" xid="xid9"/>  
      <data xid="default2">[{"sName":"院系一"},{"sName":"院系二"},{"sName":"院系三"}]</data> 
    </div> 
  </div>  
  <div component="$UI/system/components/justep/panel/panel" class="x-panel x-full"
    xid="panel1"> 
    <div class="x-panel-content" xid="content1"> 
      <div component="$UI/system/components/justep/controlGroup/controlGroup"
        class="x-control-group" title="功能面板" xid="controlGroup" collapsible="true"> 
        <div class="x-control-group-title" xid="controlGroupTitle"> 
          <span xid="span5"><![CDATA[功能面板]]></span> 
        </div>  
        <div class="form-group" xid="formGroup1"> 
          <div class="col-sm-2" xid="col3" style="width:auto;"> 
            <label class="control-label pull-right" xid="controlLabel3" style="width:40px;">院系:</label> 
          </div>  
          <div class="col-sm-4" xid="col2"> 
            <select component="$UI/system/components/justep/select/select" class="form-control"
              xid="select1" bind-options="selectData" bind-optionsValue="sName" bind-optionsLabel="sName"
              bind-optionsCaption="请选择"/> 
          </div>  
          <div class="col-sm-2" xid="col5" style="width:auto;"> 
            <label class="control-label pull-right" xid="controlLabel4">关键词：</label> 
          </div>  
          <div class="col-sm-4" xid="col4"> 
            <div class="x-edit" xid="div2"> 
              <div class="input-group" xid="div1"> 
                <input component="$UI/system/components/justep/input/input" class="form-control"
                  xid="input1" dataType="String" maxLength="5"/>  
                <span class="input-group-btn" xid="span4"> 
                  <a component="$UI/system/components/justep/button/button"
                    class="btn btn-default" icon="icon-android-search" xid="button2"> 
                    <i class="icon-android-search" xid="i4"/> 
                  </a> 
                </span> 
              </div> 
            </div>  
            <!-- <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit form-control" xid="labelInput1">
     <label style="width:auto;" xid="label2"></label>
      </div> --> 
          </div> 
        </div> 
      </div>  
      <div component="$UI/system/components/justep/dataTables/dataTables" flexibleWidth="false"
        rowActiveClass="active" xid="dataTables" data="tableData" responsive="false"
        class="table table-hover table-striped" scrollX="1" scrollY="370"> 
        <columns xid="columns"> 
          <column name="tName" xid="column9" width="100" orderable="false"/>  
          <column name="tSex" xid="column10" width="100" orderable="false"/>  
          <column name="tAge" xid="column11" width="100" orderable="false"/>  
          <column name="tJob" xid="column12" width="100" orderable="false"/>  
          <column name="tPhone" xid="column13" width="100" orderable="false"/>  
          <column name="tAddress" xid="column14" width="150" orderable="false"/>  
          <column name="tRemark" xid="column15" label="备注" orderable="false"/> 
        </columns> 
      </div> 
    </div>  
    <div class="x-panel-bottom" xid="bottom1"> 
      <a component="$UI/system/components/justep/button/button" class="btn btn-default btn-only-label x-dialog-button"
        label="取消" xid="cancelBtn" onClick="{operation:'winReceiver.windowCancel'}"> 
        <i xid="i2"/>  
        <span xid="span2">取消</span> 
      </a>  
      <a component="$UI/system/components/justep/button/button" class="btn btn-info x-dialog-button"
        label="确定" xid="OKBtn"> 
        <i xid="i1"/>  
        <span xid="span1">确定</span> 
      </a> 
    </div> 
  </div>  
  <span component="$UI/system/components/justep/windowReceiver/windowReceiver"
    xid="winReceiver">
    <column name="tID" xid="column8" visible="false" width="100px"/>  
    <div class="form-horizontal container-fluid" component="$UI/system/components/bootstrap/form/form(bootstrap)"
      xid="form"/>
  </span> 
</div>
