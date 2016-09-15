<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window" component="$UI/system/components/justep/window/window"
  design="device:pc">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:180px;top:166px;"> 
    <div component="$UI/system/components/justep/data/data" autoLoad="true"
      xid="tableData" idColumn="tID"> 
      <column label="ID" name="tID" type="String" xid="xid1"/>  
      <column label="姓名" name="tName" type="String" xid="xid2"/>  
      <column label="性别" name="tSex" type="String" xid="xid3"/>  
      <column label="年龄" name="tAge" type="Float" xid="xid4"/>  
      <column label="职业" name="tJob" type="String" xid="xid5"/>  
      <column label="手机" name="tPhone" type="String" xid="xid6"/>  
      <column label="地址" name="tAddress" type="String" xid="xid7"/>  
      <data xid="default1">[{"tID":"1","tName":"张小三","tSex":"男","tAge":21,"tJob":"Java开发工程师","tPhone":"18888888889","tAddress":"北京市东城区西长安街","tRemark":"北京市东城区西长安街天安门广场"},{"tID":"2","tName":"李小四","tSex":"女","tAge":20,"tJob":"平面设计工程师","tPhone":"13264987091","tAddress":"北京市朝阳区十里河","tRemark":"十里河万家灯火欢乐无限,万家灯火欢乐无限"},{"tID":"3","tName":"张三","tSex":"男","tAge":41,"tJob":"中层领导","tPhone":"18888888888","tAddress":"北京市东城区西长安街","tRemark":"北京市东城区西长安街"},{"tID":"4","tName":"张三","tSex":"男","tAge":38,"tJob":"经理","tPhone":"13596487298","tAddress":"北京市东城区西长安街","tRemark":"北京市东城区西长安街"},{"tID":"5","tName":"张三","tSex":"男","tAge":38,"tJob":"经理","tPhone":"13398746534","tAddress":"北京市东城区西长安街","tRemark":"北京市东城区西长安街"},{"tID":"6","tName":"张三","tSex":"男","tAge":38,"tJob":"经理","tPhone":"17036985429","tAddress":"北京市东城区西长安街","tRemark":"北京市东城区西长安街"},{"tID":"7","tName":"张三","tSex":"男","tAge":38,"tJob":"经理","tPhone":"15896324719","tAddress":"北京市东城区西长安街","tRemark":"北京市东城区西长安街"},{"tID":"8","tName":"张三","tSex":"男","tAge":38,"tJob":"总监","tPhone":"15298476324","tAddress":"北京市东城区西长安街","tRemark":"北京市东城区西长安街"},{"tID":"9","tName":"张三","tSex":"男","tAge":38,"tJob":"经理","tPhone":"13894658753","tAddress":"北京市东城区西长安街","tRemark":"北京市东城区西长安街"},{"tID":"10","tName":"李四","tSex":"女","tAge":21,"tJob":"销售员","tPhone":"15298476324","tAddress":"上海新东方东方明珠之城","tRemark":"香港九龙岛环线"},{"tID":"11","tName":"肖红","tSex":"女","tAge":22,"tJob":"销售员","tPhone":"13596487298","tAddress":"西藏布达拉宫旁边","tRemark":"上海新东方东方明珠之城"},{"tID":"12","tName":"李四","tSex":"男","tAge":26,"tJob":"业务员","tPhone":"15896324719","tAddress":"香港九龙岛环线","tRemark":"香港九龙岛环线"},{"tID":"13","tName":"王五","tSex":"女","tAge":28,"tJob":"销售员","tPhone":"15298476324","tAddress":"上海新东方东方明珠之城","tRemark":"西藏布达拉宫旁边"},{"tID":"14","tName":"李四","tSex":"女","tAge":32,"tJob":"售后服务","tPhone":"13596487298","tAddress":"西藏布达拉宫旁边","tRemark":"香港九龙岛环线"},{"tID":"15","tName":"李四","tSex":"男","tAge":24,"tJob":"销售员","tPhone":"13264987091","tAddress":"上海新东方东方明珠之城","tRemark":"西藏布达拉宫旁边"}]</data>  
      <column label="备注" name="tRemark" type="String" xid="xid8"/> 
    </div>  
    <div component="$UI/system/components/justep/data/data" autoLoad="true"
      xid="popOverData" idColumn="tName"> 
      <column label="姓名" name="tName" type="String" xid="xid9"/>  
      <column label="性别" name="tSex" type="String" xid="xid10"/>  
      <column label="年龄" name="tAge" type="String" xid="xid11"/>  
      <data xid="default2">[]</data>  
      <column label="手机" name="tPhone" type="String" xid="xid13"/>  
      <column label="地址" name="tAddress" type="String" xid="xid14"/> 
    </div> 
  </div>  
  <div component="$UI/system/components/justep/popOver/popOver" class="x-popOver"
    xid="demoPopOver" opacity="0.1" dismissible="true" direction="right-bottom" anchor="nameColumn"> 
    <div class="x-popOver-overlay" xid="div6"/>  
    <div class="x-popOver-content panel panel-default" xid="div7"> 
      <div component="$UI/system/components/justep/bar/bar" class="x-titlebar x-bar"
        xid="bar" bind-html="&quot;用户详细信息&quot;"/>  
      <ul role="menu" aria-labelledby="dropdownMenu1" xid="ul1" class="panel-body"> 
        <li role="presentation" xid="li1"> 
          <div component="$UI/system/components/justep/labelEdit/labelEdit"
            class="x-label-edit x-label30" xid="labelOutput1"> 
            <label class="x-label" xid="label1" style="text-align:right;"><![CDATA[姓名：]]></label>  
            <div component="$UI/system/components/justep/output/output" class="x-output x-edit"
              xid="output6" bind-ref="popOverData.ref('tName')"/> 
          </div> 
        </li>  
        <li role="presentation" xid="li2"> 
          <div component="$UI/system/components/justep/labelEdit/labelEdit"
            class="x-label-edit x-label30" xid="labelOutput2"> 
            <label class="x-label" xid="label2" style="text-align:right;"><![CDATA[性别：]]></label>  
            <div component="$UI/system/components/justep/output/output" class="x-output x-edit"
              xid="output7" bind-ref="popOverData.ref('tSex')"/> 
          </div> 
        </li>  
        <li role="presentation" xid="li3"> 
          <div component="$UI/system/components/justep/labelEdit/labelEdit"
            class="x-label-edit x-label30" xid="labelOutput3"> 
            <label class="x-label" xid="label3" style="text-align:right;"><![CDATA[年龄：]]></label>  
            <div component="$UI/system/components/justep/output/output" class="x-output x-edit"
              xid="output8" bind-ref="popOverData.ref('tAge')"/> 
          </div> 
        </li>  
        <li role="presentation" xid="li4"> 
          <div component="$UI/system/components/justep/labelEdit/labelEdit"
            class="x-label-edit x-label30" xid="labelOutput4"> 
            <label class="x-label" xid="label4" style="text-align:right;"><![CDATA[手机：]]></label>  
            <div component="$UI/system/components/justep/output/output" class="x-output x-edit"
              xid="output9" bind-ref="popOverData.ref('tPhone')"/> 
          </div> 
        </li>  
        <li role="presentation" xid="li5"> 
          <div component="$UI/system/components/justep/labelEdit/labelEdit"
            class="x-label-edit x-label30" xid="labelOutput5"> 
            <label class="x-label" xid="label5" style="text-align:right;"><![CDATA[地址：]]></label>  
            <div component="$UI/system/components/justep/output/output" class="x-output x-edit"
              xid="output10" bind-ref="popOverData.ref('tAddress')"/> 
          </div> 
        </li> 
      </ul> 
    </div> 
  </div>  
  <h4 xid="h41"><![CDATA[单元格信息提示]]>  
    <a component="$UI/system/components/justep/button/button" class="btn btn-link"
      label="JS代码" xid="JS" onClick="showJSButtonClick"> 
      <i xid="i1"/>  
      <span xid="span1">JS代码</span> 
    </a>  
    <a component="$UI/system/components/justep/button/button" class="btn btn-link"
      label="源码" xid="source" bind-visible="isVisible" onClick="showSourceBtnClick"> 
      <i xid="i2"/>  
      <span xid="span2">源码</span> 
    </a> 
  </h4>  
  <div component="$UI/system/components/justep/dataTables/dataTables" flexibleWidth="true"
    rowActiveClass="active" xid="dataTables" data="tableData" responsive="false" class="table table-bordered table-hover table-striped"
    onCellRender="dataTablesCellRender" onRowClick="dataTablesRowClick"> 
    <columns xid="columns"> 
      <column name="tName" xid="nameColumn" width="100px" label="姓名" orderable="false"/>  
      <column name="tSex" xid="column10" width="50px" label="性别" orderable="false"
        className="text-center"/>  
      <column name="tAge" xid="column11" width="50px" label="年龄" orderable="false"
        className="text-center"/>  
      <column name="tJob" xid="column12" label="职业" width="150px" orderable="false"
        className="text-center"/>  
      <column name="tPhone" xid="column13" label="手机" width="100px" orderable="false"
        className="text-center"/>  
      <column name="tAddress" xid="column14" label="地址" width="270px" orderable="false"/>  
      <column name="tRemark" xid="column15" label="备注" width="" orderable="false"/>  
      <column name="tHint" xid="tHintcolumn" label="操作" width="100px" orderable="false"
        className="text-center"/> 
    </columns> 
  </div> 
</div>
