<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window" component="$UI/system/components/justep/window/window"
  design="device:pc">  
  <div component="$UI/system/components/justep/model/model" xid="model"> 
    <div component="$UI/system/components/justep/data/data" autoLoad="true"
      xid="data" idColumn="id"> 
      <column label="id" name="id" type="String" xid="default1"/>  
      <column label="SIMPLE_METER_VALUE" name="SIMPLE_METER_VALUE" type="String"
        xid="default3"/>  
      <column label="DIALMETER_VALUE" name="DIALMETER_VALUE" type="String" xid="default4"/>  
      <column label="ARCDIALMETER_VALUE" name="ARCDIALMETER_VALUE" type="String"
        xid="default5"/>  
      <column label="THERMOMETER_VALUE" name="THERMOMETER_VALUE" type="String"
        xid="default6"/>  
      <column label="TEST1" name="TEST1" type="String" xid="default7"/>  
      <column label="TEST2" name="TEST2" type="String" xid="default8"/>  
      <column label="TEST3" name="TEST3" type="String" xid="default9"/>  
      <data xid="default10">[{"id":"1","SIMPLE_METER_VALUE":"15","DIALMETER_VALUE":"40","ARCDIALMETER_VALUE":"60","THERMOMETER_VALUE":"28","TEST1":"30","TEST2":"50","TEST3":"80"}]</data> 
    </div> 
  </div>  
  <div component="$UI/system/components/bootstrap/tabs/tabs" xid="tabs"> 
    <ul class="nav nav-tabs" xid="tabNav1"> 
      <li class="active" xid="li1"> 
        <a content="tabContent1" xid="tabItem1"><![CDATA[简单仪盘表]]></a> 
      </li>  
      <li role="presentation" xid="li2"> 
        <a content="tabContent2" xid="tabItem2" bind-click="tabItem2Click"><![CDATA[刻度盘]]></a> 
      </li>  
      <li xid="li5"> 
        <a content="tabContent5" xid="tabItem5" bind-click="tabItem5Click"><![CDATA[弧度刻度盘]]></a> 
      </li>  
      <li xid="li6"> 
        <a content="tabContent6" xid="tabItem6" bind-click="tabItem6Click"><![CDATA[温度计]]></a> 
      </li>  
      <li xid="li7"> 
        <a content="tabContent7" xid="tabItem7" bind-click="tabItem7Click"><![CDATA[混合仪表盘]]></a> 
      </li> 
    </ul>  
    <div class="tab-content" xid="div1"> 
      <div class="tab-pane active" xid="tabContent1"> 
        <div component="$UI/system/components/justep/toolBar/toolBar" class="x-toolbar form-inline x-toolbar-spliter"
          xid="toolBar"> 
          <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
            onClick="{'operation':'chart_meter.pageSetup'}" xid="button1"> 
            <i xid="i1"/>  
            <span xid="span1"/> 
          </a>  
          <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
            onClick="{'operation':'chart_meter.preview'}" xid="button2"> 
            <i xid="i2"/>  
            <span xid="span2"/> 
          </a>  
          <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
            onClick="{'operation':'chart_meter.print'}" xid="button3"> 
            <i xid="i3"/>  
            <span xid="span3"/> 
          </a>  
          <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
            onClick="{'operation':'chart_meter.exportPDF'}" xid="button4"> 
            <i xid="i4"/>  
            <span xid="span4"/> 
          </a>  
          <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
            onClick="{'operation':'chart_meter.exportWord'}" xid="button5"> 
            <i xid="i5"/>  
            <span xid="span5"/> 
          </a>  
          <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
            onClick="{'operation':'chart_meter.exportExcel'}" xid="button6"> 
            <i xid="i6"/>  
            <span xid="span6"/> 
          </a> 
        </div>  
        <div component="$UI/system/components/justep/chart/chart" chartName="chart"
          autoLoad="true" data-list="" xid="chart_meter" style="width:400px;height:400px;" dataList="data"> 
          <chart xid="chart2"> 
            <config xid="default2"/>  
            <series-set xid="series-set1"> 
              <series xid="chartSeries1" chart-type="simple-meter" name="simplemeterchart"> 
                <config xid="default11"> 
                  <simple-range lower="-10" upper="50" xid="default13"/>  
                  <simple-interval label="凉爽" lower="10" upper="20" outline-color="#000000"
                    outline-stroke="2.0f" background-color="#80FF80" xid="default14"/>  
                  <simple-interval label="舒适" lower="20" upper="30" outline-color="#000000"
                    outline-stroke="2.0f" background-color="#EAEA00" xid="default15"/>  
                  <simple-interval label="炎热" lower="30" upper="50" outline-color="#000000"
                    outline-stroke="2.0f" background-color="#FF0000" xid="default16"/>  
                  <simple-interval label="寒冷" lower="-10" upper="10" outline-color="#000000"
                    outline-stroke="2.0f" background-color="#FF0080" xid="default17"/> 
                </config>  
                <data value="SIMPLE_METER_VALUE" ref="data" xid="default12"/> 
              </series> 
            </series-set> 
          </chart> 
        </div> 
      </div>  
      <div class="tab-pane" xid="tabContent2"> 
        <div component="$UI/system/components/justep/toolBar/toolBar" class="x-toolbar form-inline x-toolbar-spliter"
          xid="chart_dialmeterBar"> 
          <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
            onClick="{'operation':'chart_dialmeter.pageSetup'}" xid="button7"> 
            <i xid="i7"/>  
            <span xid="span7"/> 
          </a>  
          <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
            onClick="{'operation':'chart_dialmeter.preview'}" xid="button8"> 
            <i xid="i8"/>  
            <span xid="span8"/> 
          </a>  
          <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
            onClick="{'operation':'chart_dialmeter.print'}" xid="button9"> 
            <i xid="i9"/>  
            <span xid="span9"/> 
          </a>  
          <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
            onClick="{'operation':'chart_dialmeter.exportPDF'}" xid="button10"> 
            <i xid="i10"/>  
            <span xid="span10"/> 
          </a>  
          <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
            onClick="{'operation':'chart_dialmeter.exportWord'}" xid="button11"> 
            <i xid="i11"/>  
            <span xid="span11"/> 
          </a>  
          <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
            onClick="{'operation':'chart_dialmeter.exportExcel'}" xid="button12"> 
            <i xid="i12"/>  
            <span xid="span12"/> 
          </a> 
        </div>  
        <div component="$UI/system/components/justep/chart/chart" chartName="chart"
          autoLoad="false" data-list="" xid="chart_dialmeter" style="width:400px;height:400px;" dataList="data"> 
          <chart xid="chart3"> 
            <config xid="default18"/>  
            <series-set xid="series-set2"> 
              <series xid="chartSeries2" chart-type="dial-meter" name="dialmeterchart"> 
                <config xid="default19"> 
                  <dial-scale visible="true" lower-bound="0" upper-bound="100" start-angle="-120"
                    extent="-300" major-tick-increment="10" minor-tick-count="4" xid="default21"/>  
                  <dial-rangle lower="0" upper="60" color="#66CD00" xid="default22"/>  
                  <dial-rangle lower="60" upper="80" color="#FFD700" xid="default23"/>  
                  <dial-rangle lower="80" upper="100" color="#FF4040" xid="default24"/> 
                </config>  
                <data value="DIALMETER_VALUE" ref="data" xid="default20"/> 
              </series> 
            </series-set> 
          </chart> 
        </div> 
      </div>  
      <div class="tab-pane" xid="tabContent5"> 
        <div component="$UI/system/components/justep/toolBar/toolBar" class="x-toolbar form-inline x-toolbar-spliter"
          xid="dial_meterBar"> 
          <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
            onClick="{'operation':'dial_meter.pageSetup'}" xid="button13"> 
            <i xid="i13"/>  
            <span xid="span13"/> 
          </a>  
          <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
            onClick="{'operation':'dial_meter.preview'}" xid="button14"> 
            <i xid="i14"/>  
            <span xid="span14"/> 
          </a>  
          <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
            onClick="{'operation':'dial_meter.print'}" xid="button15"> 
            <i xid="i15"/>  
            <span xid="span15"/> 
          </a>  
          <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
            onClick="{'operation':'dial_meter.exportPDF'}" xid="button16"> 
            <i xid="i16"/>  
            <span xid="span16"/> 
          </a>  
          <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
            onClick="{'operation':'dial_meter.exportWord'}" xid="button17"> 
            <i xid="i17"/>  
            <span xid="span17"/> 
          </a>  
          <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
            onClick="{'operation':'dial_meter.exportExcel'}" xid="button18"> 
            <i xid="i18"/>  
            <span xid="span18"/> 
          </a> 
        </div>  
        <div component="$UI/system/components/justep/chart/chart" chartName="chart"
          autoLoad="false" data-list="" xid="dial_meter" style="width:500px;height:400px;" dataList="data"> 
          <chart xid="chart5"> 
            <config xid="default25"/>  
            <series-set xid="series-set3"> 
              <series xid="chartSeries3" chart-type="arc-dial-meter" name="arcdialmeterchart"> 
                <config xid="default26"> 
                  <arc-dial-scale visible="true" lower-bound="0" upper-bound="100" start-angle="115.0"
                    extent="-50" major-tick-increment="10.0" minor-tick-count="4"
                    xid="default28"/>  
                  <arc-dial-rangle lower="0" upper="60" color="#66CD00" xid="default29"/>  
                  <arc-dial-rangle lower="60" upper="80" color="#FFD700" xid="default30"/>  
                  <arc-dial-rangle lower="80" upper="100" color="#FF4040" xid="default31"/> 
                </config>  
                <data value="ARCDIALMETER_VALUE" ref="data" xid="default27"/> 
              </series> 
            </series-set> 
          </chart> 
        </div> 
      </div>  
      <div class="tab-pane" xid="tabContent6"> 
        <div component="$UI/system/components/justep/toolBar/toolBar" class="x-toolbar form-inline x-toolbar-spliter"
          xid="chart_thermometermeterBar"> 
          <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
            onClick="{'operation':'chart_thermometermeter.pageSetup'}" xid="button19"> 
            <i xid="i19"/>  
            <span xid="span19"/> 
          </a>  
          <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
            onClick="{'operation':'chart_thermometermeter.preview'}" xid="button20"> 
            <i xid="i20"/>  
            <span xid="span20"/> 
          </a>  
          <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
            onClick="{'operation':'chart_thermometermeter.print'}" xid="button21"> 
            <i xid="i21"/>  
            <span xid="span21"/> 
          </a>  
          <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
            onClick="{'operation':'chart_thermometermeter.exportPDF'}" xid="button22"> 
            <i xid="i22"/>  
            <span xid="span22"/> 
          </a>  
          <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
            onClick="{'operation':'chart_thermometermeter.exportWord'}" xid="button23"> 
            <i xid="i23"/>  
            <span xid="span23"/> 
          </a>  
          <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
            onClick="{'operation':'chart_thermometermeter.exportExcel'}" xid="button24"> 
            <i xid="i24"/>  
            <span xid="span24"/> 
          </a> 
        </div>  
        <div component="$UI/system/components/justep/chart/chart" chartName="chart"
          autoLoad="false" data-list="" xid="chart_thermometermeter" style="width:400px;height:400px;" dataList="data"> 
          <chart xid="chart7"> 
            <config xid="default32"/>  
            <series-set xid="series-set4"> 
              <series xid="chartSeries4" chart-type="thermometer-meter" name="thermometermeterchart"> 
                <config xid="default33"> 
                  <thermometer-range lower="0" upper="100" xid="default35"/> 
                </config>  
                <data value="THERMOMETER_VALUE" ref="data" xid="default34"/> 
              </series> 
            </series-set> 
          </chart> 
        </div> 
      </div>  
      <div class="tab-pane" xid="tabContent7"> 
        <div component="$UI/system/components/justep/toolBar/toolBar" class="x-toolbar form-inline x-toolbar-spliter"
          xid="chart_multidialBar"><a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left" onClick="{'operation':'chart_multidial.pageSetup'}" xid="button25">
   <i xid="i25"></i>
   <span xid="span25"></span></a>
  <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left" onClick="{'operation':'chart_multidial.preview'}" xid="button26">
   <i xid="i26"></i>
   <span xid="span26"></span></a>
  <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left" onClick="{'operation':'chart_multidial.print'}" xid="button27">
   <i xid="i27"></i>
   <span xid="span27"></span></a>
  <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left" onClick="{'operation':'chart_multidial.exportPDF'}" xid="button28">
   <i xid="i28"></i>
   <span xid="span28"></span></a>
  <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left" onClick="{'operation':'chart_multidial.exportWord'}" xid="button29">
   <i xid="i29"></i>
   <span xid="span29"></span></a>
  <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left" onClick="{'operation':'chart_multidial.exportExcel'}" xid="button30">
   <i xid="i30"></i>
   <span xid="span30"></span></a></div>  
        <div component="$UI/system/components/justep/chart/chart" chartName="chart"
          autoLoad="false" data-list="" xid="chart_multidial" dataList="data" style="width:400px;height:400px;"> 
          <chart xid="chart9"> 
            <config xid="default36"/>  
            <series-set xid="series-set5"><series xid="chartSeries5" chart-type="dial-meter" name="dialmeterchart"><config xid="default37"><dial-scale visible="true" lower-bound="0" upper-bound="100" start-angle="-120" extent="-300" major-tick-increment="10" minor-tick-count="4" xid="default39"></dial-scale>
  <dial-rangle lower="0" upper="40" color="#66CD00" xid="default40"></dial-rangle>
  <dial-rangle lower="40" upper="50" color="#FFD700" xid="default41"></dial-rangle>
  <dial-rangle lower="50" upper="60" color="#FF4040" xid="default42"></dial-rangle>
  <dial-rangle lower="60" upper="100" color="#0000FF" xid="default43"></dial-rangle></config>
  <data value="TEST1" ref="data" xid="default38"></data></series>
  <series xid="chartSeries6" chart-type="dial-meter" name="dialmeterchart"><config xid="default44"><dial-scale visible="true" lower-bound="0" upper-bound="100" start-angle="-120" extent="-300" major-tick-increment="10" minor-tick-count="4" xid="default46"></dial-scale>
  <dial-rangle lower="0" upper="60" color="#66CD00" xid="default47"></dial-rangle>
  <dial-rangle lower="60" upper="80" color="#FFD700" xid="default48"></dial-rangle>
  <dial-rangle lower="80" upper="100" color="#FF4040" xid="default49"></dial-rangle></config>
  <data value="TEST2" ref="data" xid="default45"></data></series>
  <series xid="chartSeries7" chart-type="dial-meter" name="dialmeterchart"><config xid="default50"><dial-scale visible="true" lower-bound="0" upper-bound="100" start-angle="-120" extent="-300" major-tick-increment="10" minor-tick-count="4" xid="default52"></dial-scale>
  <dial-rangle lower="0" upper="40" color="#66CD00" xid="default53"></dial-rangle>
  <dial-rangle lower="40" upper="50" color="#FFD700" xid="default54"></dial-rangle>
  <dial-rangle lower="50" upper="60" color="#FF4040" xid="default55"></dial-rangle>
  <dial-rangle lower="60" upper="100" color="#0000FF" xid="default56"></dial-rangle></config>
  <data value="TEST3" ref="data" xid="default51"></data></series></series-set> 
          </chart> 
        </div> 
      </div> 
    </div> 
  </div> 
</div>
