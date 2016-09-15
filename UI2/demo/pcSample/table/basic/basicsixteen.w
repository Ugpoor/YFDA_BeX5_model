<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window" component="$UI/system/components/justep/window/window"
  design="device:pc">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;top:531px;left:738px;">
    <div component="$UI/system/components/justep/data/data" autoLoad="true"
      xid="data" idColumn="tName">
      <column label="姓名" name="tName" type="String" xid="xid1"/>  
      <column label="年龄" name="tAge" type="String" xid="xid2"/>  
      <column label="籍贯" name="tNative" type="String" xid="xid3"/>  
      <column label="性别" name="tSex" type="String" xid="xid4"/>  
      <column label="民族" name="tNation" type="String" xid="xid5"/>  
      <column label="职业" name="tJob" type="String" xid="xid6"/>  
      <column label="学历" name="tDegree" type="String" xid="xid7"/>  
      <column label="手机" name="tPhone" type="String" xid="xid8"/>  
      <column label="邮箱" name="tEmail" type="String" xid="xid9"/>  
      <column label="详细地址" name="tAddress" type="String" xid="xid10"/>  
      <data xid="default1">[{"tName":"张小三","tAge":"21","tNative":"北京","tSex":"男","tNation":"汉族","tJob":"软件设计师","tDegree":"本科","tPhone":"18888888888","tEmail":"tiananmen@sina.com","tAddress":"北京市东城区西长安街天安门广场"}]</data>
    </div>
  </div>  
  <h4 xid="h41">表单-view模式表单
    <a component="$UI/system/components/justep/button/button" class="btn btn-link"
      label="js" xid="showJSButton" onClick="showJSButtonClick"> 
      <i xid="i3"/>  
      <span xid="span3">js</span>
    </a>
    <a component="$UI/system/components/justep/button/button" class="btn btn-link"
      label="源码" xid="source" onClick="sourceClick"> 
      <i xid="i4"/>  
      <span xid="span4">源码</span>
    </a> 
  </h4>  
  <h4 xid="h42" class="panel-body bg-primary text-center"><![CDATA[详细信息]]></h4>
  <div component="$UI/system/components/bootstrap/row/row" class="row" xid="row3"> 
    <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4 col-spliter-right"
      xid="col33"> 
      <div class="form-group" xid="formGroup14"> 
        <div class="col-sm-4 text-right" xid="col34"> 
          <label class="control-label" xid="controlLabel14"><![CDATA[姓名：]]></label>
        </div>  
        <div class="col-sm-8" xid="col35"> 
          <input class="form-control" component="$UI/system/components/justep/input/input"
            xid="input14" bind-ref="$model.data.ref(&quot;tName&quot;)"/>
        </div> 
      </div> 
    </div>  
    <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4 col-spliter-right"
      xid="col36"> 
      <div class="form-group" xid="formGroup15"> 
        <div class="col-sm-4 text-right" xid="col37"> 
          <label class="control-label" xid="controlLabel15"><![CDATA[性别：]]></label>
        </div>  
        <div class="col-sm-8" xid="col38"> 
          <input class="form-control" component="$UI/system/components/justep/input/input"
            xid="input15" bind-ref="$model.data.ref(&quot;tSex&quot;)"/>
        </div> 
      </div> 
    </div>  
    <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4 col-spliter-right"
      xid="col39"> 
      <div class="form-group" xid="formGroup16"> 
        <div class="col-sm-4 text-right" xid="col40"> 
          <label class="control-label" xid="controlLabel16"><![CDATA[籍贯：]]></label>
        </div>  
        <div class="col-sm-8" xid="col41"> 
          <input class="form-control" component="$UI/system/components/justep/input/input"
            xid="input16" bind-ref="$model.data.ref(&quot;tNative&quot;)"/>
        </div> 
      </div> 
    </div>  
    <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4 col-spliter-right"
      xid="col48"> 
      <div class="form-group" xid="formGroup18"> 
        <div class="col-sm-4 text-right" xid="col47"> 
          <label class="control-label" xid="controlLabel17"><![CDATA[民族：]]></label>
        </div>  
        <div class="col-sm-8" xid="col46"> 
          <input class="form-control" component="$UI/system/components/justep/input/input"
            xid="input19" bind-ref="$model.data.ref(&quot;tNation&quot;)"/>
        </div> 
      </div> 
    </div>  
    <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4 col-spliter-right"
      xid="col45"> 
      <div class="form-group" xid="formGroup17"> 
        <div class="col-sm-4 text-right" xid="col44"> 
          <label class="control-label" xid="controlLabel18"><![CDATA[年龄：]]></label>
        </div>  
        <div class="col-sm-8" xid="col43"> 
          <input class="form-control" component="$UI/system/components/justep/input/input"
            xid="input18" bind-ref="$model.data.ref(&quot;tAge&quot;)"/>
        </div> 
      </div> 
    </div>  
    <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4 col-spliter-right"
      xid="col42"> 
      <div class="form-group" xid="formGroup19"> 
        <div class="col-sm-4 text-right" xid="col49"> 
          <label class="control-label" xid="controlLabel19"><![CDATA[职业：]]></label>
        </div>  
        <div class="col-sm-8" xid="col50"> 
          <input class="form-control" component="$UI/system/components/justep/input/input"
            xid="input17" bind-ref="$model.data.ref(&quot;tJob&quot;)"/>
        </div> 
      </div> 
    </div>  
    <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4 col-spliter-right"
      xid="col66"> 
      <div class="form-group" xid="formGroup24"> 
        <div class="col-sm-4 text-right" xid="col65"> 
          <label class="control-label" xid="controlLabel23"><![CDATA[学历：]]></label>
        </div>  
        <div class="col-sm-8" xid="col64"> 
          <input class="form-control" component="$UI/system/components/justep/input/input"
            xid="input25" bind-ref="$model.data.ref(&quot;tDegree&quot;)"/>
        </div> 
      </div> 
    </div>  
    <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4 col-spliter-right"
      xid="col63"> 
      <div class="form-group" xid="formGroup23"> 
        <div class="col-sm-4 text-right" xid="col62"> 
          <label class="control-label" xid="controlLabel24"><![CDATA[手机：]]></label>
        </div>  
        <div class="col-sm-8" xid="col61"> 
          <input class="form-control" component="$UI/system/components/justep/input/input"
            xid="input24" bind-ref="$model.data.ref(&quot;tPhone&quot;)"/>
        </div> 
      </div> 
    </div>  
    <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4 col-spliter-right"
      xid="col60"> 
      <div class="form-group" xid="formGroup25"> 
        <div class="col-sm-4 text-right" xid="col67"> 
          <label class="control-label" xid="controlLabel25"><![CDATA[邮箱：]]></label>
        </div>  
        <div class="col-sm-8" xid="col68"> 
          <input class="form-control" component="$UI/system/components/justep/input/input"
            xid="input23" bind-ref="$model.data.ref(&quot;tEmail&quot;)"/>
        </div> 
      </div> 
    </div>  
    <div class="col col-xs-12 col-sm-12 col-md-12 col-lg-12" xid="col71"> 
      <div class="form-group" xid="formGroup26"> 
        <div class="col-sm-2 text-center" xid="col70"> 
          <label class="control-label" xid="controlLabel26"><![CDATA[详细地址：]]></label>
        </div>  
        <div class="col-sm-9" xid="col69"> 
          <input class="form-control" component="$UI/system/components/justep/input/input"
            xid="input26" bind-ref="$model.data.ref(&quot;tAddress&quot;)"/>
        </div> 
      </div> 
    </div>
  </div> 
</div>
