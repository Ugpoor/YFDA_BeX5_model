<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window" component="$UI/system/components/justep/window/window"
  design="device:pc">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:99px;top:365px;"> 
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
      <data xid="default1">[{"tID":"1","tName":"张小三","tSex":"男","tAge":21,"tJob":"Java开发工程师","tPhone":"18888888889","tAddress":"北京市东城区西长安街","tRemark":"北京市东城区西长安街天安门广场"},{"tID":"2","tName":"李小四","tSex":"女","tAge":20,"tJob":"平面设计工程师","tPhone":"13264987091","tAddress":"北京市朝阳区十里河","tRemark":"十里河万家灯火欢乐无限,万家灯火欢乐无限"},{"tID":"3","tName":"张三","tSex":"男","tAge":41,"tJob":"中层领导","tPhone":"18888888888","tAddress":"北京市东城区西长安街","tRemark":"北京市东城区西长安街"},{"tID":"4","tName":"张三","tSex":"男","tAge":38,"tJob":"经理","tPhone":"17036985429","tAddress":"北京市东城区西长安街","tRemark":"北京市东城区西长安街"},{"tID":"5","tName":"张三","tSex":"男","tAge":38,"tJob":"总监","tPhone":"15298476324","tAddress":"北京市东城区西长安街","tRemark":"北京市东城区西长安街"},{"tID":"6","tName":"李四","tSex":"女","tAge":21,"tJob":"销售员","tPhone":"15298476324","tAddress":"上海新东方东方明珠之城","tRemark":"香港九龙岛环线"},{"tID":"7","tName":"肖红","tSex":"女","tAge":22,"tJob":"销售员","tPhone":"13596487298","tAddress":"西藏布达拉宫旁边","tRemark":"上海新东方东方明珠之城"},{"tID":"8","tName":"李四","tSex":"男","tAge":26,"tJob":"业务员","tPhone":"15896324719","tAddress":"香港九龙岛环线","tRemark":"香港九龙岛环线"},{"tID":"9","tName":"王五","tSex":"女","tAge":28,"tJob":"销售员","tPhone":"15298476324","tAddress":"上海新东方东方明珠之城","tRemark":"西藏布达拉宫旁边"},{"tID":"10","tName":"小明","tSex":"男","tAge":7,"tJob":"小学生","tPhone":"13529976320","tAddress":"太阳系地球村","tRemark":"地址不详"},{"tID":"11","tName":"小红","tSex":"女","tAge":13,"tJob":"初中生","tPhone":"15198676324","tAddress":"新疆维吾尔族自治区","tRemark":"太阳当空照，花儿对我笑"},{"tID":"12","tName":"小白","tSex":"男","tAge":18,"tJob":"高中生","tPhone":"18520763209","tAddress":"局部地区","tRemark":"小鸟说：早早早，再不起床就要迟到了"}]</data> 
    </div>  
    <div component="$UI/system/components/justep/data/data" autoLoad="true"
      xid="selectData" idColumn="sName"> 
      <column label="名称" name="sName" type="String" xid="xid9"/>  
      <data xid="default2">[{"sName":"院系一"},{"sName":"院系二"},{"sName":"院系三"},{"sName":"院系四"},{"sName":"院系五"}]</data> 
    </div> 
  </div>  
  <h4 xid="h41"><![CDATA[含横向滚动条]]>  
    <a component="$UI/system/components/justep/button/button" class="btn btn-link"
      label="JS" xid="showJSButton" onClick="showJSButtonClick"> 
      <i xid="i2"/>  
      <span xid="span2">JS</span> 
    </a>  
    <a component="$UI/system/components/justep/button/button" class="btn btn-link"
      label="源码" xid="source" bind-visible="isVisible" onClick="showSourceBtnClick"> 
      <i xid="i3"/>  
      <span xid="span3">源码</span> 
    </a> 
  </h4>  
  <div component="$UI/system/components/justep/controlGroup/controlGroup" class="x-control-group"
    title="功能面板" xid="controlGroup" collapsible="true"> 
    <div class="x-control-group-title x-control-group-title-info" xid="controlGroupTitle"> 
      <span xid="span5"><![CDATA[功能面板]]></span> 
    </div>  
    <div class="form-horizontal container-fluid" component="$UI/system/components/bootstrap/form/form(bootstrap)"
      xid="form"> 
      <div class="form-group" xid="formGroup1"> 
        <div class="col-sm-1 pull-left" xid="col13" style="width:auto;"> 
          <label class="control-label pull-right" xid="controlLabel1" style="width:40px;"><![CDATA[院系:]]></label> 
        </div>  
        <div class="col-sm-3 pull-left" xid="col14"> 
          <select component="$UI/system/components/justep/select/select" class="form-control"
            xid="select" bind-options="selectData" bind-optionsValue="sName" bind-optionsLabel="sName"
            bind-optionsCaption="请选择" style="width:150px;"/> 
        </div>  
        <div class="col-sm-1 pull-left" xid="col15"> 
          <label class="control-label pull-right" xid="controlLabel2" style="width:40px;"><![CDATA[日期:]]></label> 
        </div>  
        <div class="col-sm-3 pull-left" xid="col16"> 
          <input component="$UI/system/components/justep/input/input" class="form-control"
            xid="input7" style="width:150px;" format="yyyy-MM-dd" dataType="Date"/> 
        </div>  
        <div class="col-sm-1 pull-left" xid="col17"> 
          <label class="control-label pull-right" xid="controlLabel3"><![CDATA[关键字:]]></label> 
        </div>  
        <div class="col-sm-3 pull-left" xid="col18"> 
          <div component="$UI/system/components/justep/labelEdit/labelEdit"
            class="x-label-edit form-control" xid="labelEditBtn1"> 
            <label style="width:auto;" xid="label1"><![CDATA[]]></label>  
            <div class="x-edit" xid="div4"> 
              <div class="input-group" xid="div5"> 
                <input component="$UI/system/components/justep/input/input" class="form-control"
                  xid="input11"/>  
                <span class="input-group-btn" xid="span1"> 
                  <a component="$UI/system/components/justep/button/button"
                    class="btn btn-default" icon="icon-android-search" xid="button1"> 
                    <i class="icon-android-search" xid="i1"/> 
                  </a> 
                </span> 
              </div> 
            </div> 
          </div> 
        </div> 
      </div> 
    </div> 
  </div>  
  <div component="$UI/system/components/justep/dataTables/dataTables" flexibleWidth="false"
    rowActiveClass="active" xid="dataTables" data="tableData" scrollY="300px" responsive="false"
    class="table table-bordered table-hover table-striped" scrollX="1"> 
    <columns xid="columns"> 
      <column name="tID" xid="column1" width="50px" orderable="false"/>
      <column name="tName" xid="column9" width="100px" label="姓名" orderable="false"/>  
      <column name="tSex" xid="column10" width="50px" label="性别" orderable="false"/>  
      <column name="tAge" xid="column11" width="50px" label="年龄" orderable="false"/>  
      <column name="tJob" xid="column12" label="职业" width="200px" orderable="false"/>  
      <column name="tPhone" xid="column13" label="手机" width="150px" orderable="false"/>  
      <column name="tAddress" xid="column14" label="地址" width="400px" orderable="false"/>  
      <column name="tRemark" xid="column15" label="备注" width="400px" orderable="false"/> 
    </columns> 
  </div> 
</div>
