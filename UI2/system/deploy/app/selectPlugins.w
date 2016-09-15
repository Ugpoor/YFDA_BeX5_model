<?xml version="1.0" encoding="utf-8"?>
<div xmlns="http://www.w3.org/1999/xhtml" component="$UI/system/components/justep/window/window" class="window" sysParam="false">
	<div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:311px;top:343px;" onLoad="modelLoad">
		<div component="$UI/system/components/justep/data/data" xid="pluginsData" idColumn="id" autoLoad="false" limit="-1">
			<data xid="default9">[]</data>
  <column label="选择" name="checked" type="Boolean" xid="xid1"></column>
  <column label="插件ID" name="id" type="String" xid="default5"></column>
  <column label="插件名称" name="name" type="String" xid="default6"></column>
  <column label="描述" name="description" type="String" xid="xid2"></column>
  <column label="Dependency" name="dependency" type="String" xid="default7"></column>
  <column label="需要配置参数" name="hasParams" type="Boolean" xid="xid3"></column></div>
		<div component="$UI/system/components/justep/data/data" autoLoad="true" xid="pluginsConfigData" idColumn="id" limit="-1">
			<column label="ID" name="id" type="String" xid="xid5"></column>
  <column label="系统" name="platform" type="String" xid="xid8"></column>
  <column label="属性名" name="name" type="String" xid="xid9"></column>
  <column label="属性显示名" name="displayName" type="String" xid="xid6"></column>
  <data xid="default1">[]</data>
  <column label="属性值" name="value" type="String" xid="xid7"></column>
  <column label="数据类型" name="type" type="String" xid="xid11"></column>
  <column label="默认值" name="defaultValue" type="String" xid="xid12"></column>
  <column label="取值列表" name="values" type="String" xid="xid13"></column></div>
	<div component="$UI/system/components/justep/data/data" autoLoad="true" xid="filterData" idColumn="id"><column label="ID" name="id" type="String" xid="xid4"></column>
  <column label="Value" name="value" type="String" xid="xid10"></column>
  <data xid="default2">[{&quot;id&quot;:&quot;1&quot;,&quot;value&quot;:&quot;全部&quot;},{&quot;id&quot;:&quot;2&quot;,&quot;value&quot;:&quot;已选择&quot;},{&quot;id&quot;:&quot;3&quot;,&quot;value&quot;:&quot;未选择&quot;}]</data></div>
  <div component="$UI/system/components/justep/data/data" xid="itemData" idColumn="value" autoLoad="true">
   <column label="值" name="value" type="String" xid="column2"></column>
  <data xid="default10">[]</data></div></div>

	<div xid="modeDiv" style="padding-top:8px;padding-bottom:8px;">
		<span component="$UI/system/components/justep/button/checkbox" class="x-checkbox" xid="autoSelectPlugins" label="自动追加使用到的Cordova插件。根据包含的UI资源自动分析使用到的插件。注意：如果使用到的插件有参数需要配置，请在下方插件列表中进行设置。手工选择的插件将一定包含在应用中" checked="true" onChange="checkbox2Change" style="padding-left:5px"></span><label xid="label1" class="x-label" style="padding-left:4px"><![CDATA[小提示：应用下的plugins目录可以包含自定义插件，它将优先于系统Native/plugins中插件被使用]]></label><div component="$UI/system/components/justep/row/row" class="x-row" xid="row1">
			<div class="x-col-fixed" xid="col2">

				
				
			<div xid="div1" style="padding-top:10px;width:255px;" class="form-inline"><select component="$UI/system/components/justep/select/select" xid="filterSelect" class="form-control" bind-options="filterData" bind-optionsValue="id" bind-optionsLabel="value" style="width:134px;" onChange="filterChange"></select><span component="$UI/system/components/justep/button/checkbox" class="x-checkbox" xid="paramsCheckbox" label="需参数配置" style="padding-left:8px;padding-right:8px" onChange="filterChange"></span></div></div>
			<div class="x-col" xid="col1">
				<div class="input-group" component="$UI/system/components/bootstrap/inputGroup/inputGroup" xid="inputGroup1">
					<input type="text" class="form-control" component="$UI/system/components/justep/input/input" xid="searchInput" placeHolder="请输入查询的关键字" bind-keyup="searchInputKeyup"></input>
					<div class="input-group-btn" xid="div2">
						<a component="$UI/system/components/justep/button/button" class="btn btn-icon-right btn-only-icon" label="button" xid="queryButton" onClick="queryButtonClick">
							<i xid="i1" class="icon-ios7-search"></i>
							<span xid="span1"></span>
						</a>
					</div>
				</div>
			</div>
		</div>
	<div class="form-horizontal container-fluid" component="$UI/system/components/bootstrap/form/form" xid="form1"></div>
  </div>
	<div xid="pluginsDiv" style="overflow-y:auto">
		<div component="$UI/system/components/fragment/list/listTable" data="pluginsData" masterData="" masterCol="" xid="listTable3">
			<div component="$UI/system/components/justep/list/list" class="x-list" data="pluginsData" xid="pluginsList" filter="$model.customFilter($row)">
				<table class="table table-bordered table-hover table-striped table-condensed" component="$UI/system/components/bootstrap/table/table" xid="table3">
					<thead xid="thead3">
						<tr class="success" xid="tr6">
							<th xid="col10" style="width:40px;">
								<label bind-text="$model.pluginsData.label('checked')" xid="label8"></label>
							</th>
							<th xid="col11">
								<label bind-text="$model.pluginsData.label('name')" xid="label10"></label></th>
							<th xid="col13">
								<label bind-text="$model.pluginsData.label('description')" xid="label11"></label>
							</th>
						</tr>
					</thead>
					<tbody class="x-list-template" bind-click="$model!=$object?$object.data.to($object):null" xid="listTemplate3">
						<tr class="info" bind-click="function(){var $e = $($element);$('&gt;td&gt;i.x-expand-i',$e).toggleClass('icon-arrow-right-b');$e.next().toggleClass('hide');}" xid="tr7">
							<td xid="td8">
								<i xid="i2" class="icon-arrow-right-b" bind-visible='$object.val("hasParams")'></i><span component="$UI/system/components/justep/button/checkbox" class="x-checkbox" bind-ref="ref('checked')" xid="checkbox7"></span>
							</td>
							<td xid="td9">
								<div component="$UI/system/components/justep/output/output" class="x-output" bind-ref="ref('name')" xid="output5"></div><div component="$UI/system/components/justep/output/output" class="x-output" bind-ref="ref('id')" xid="output4"></div>
							</td>
							<td xid="td11">
								<div component="$UI/system/components/justep/output/output" class="x-output" bind-ref="ref('description')" xid="output6"></div>
							</td>
						</tr>
						<tr class="hide" xid="tr8" bind-visible='$object.val("hasParams")'>
							<td colspan="4" xid="td12">
								<div component="$UI/system/components/fragment/list/listTable" data="pluginsConfigData" masterData="pluginsData" masterCol="id" xid="listTable4">
									<div component="$UI/system/components/justep/list/list" class="x-list" data="pluginsConfigData" xid="list4">
										<table class="table table-bordered table-hover table-striped table-condensed" component="$UI/system/components/bootstrap/table/table" xid="table4">
											<thead xid="thead4">
												<tr class="danger" xid="tr9">
													<th width="60px" xid="col14">
														<label xid="label12"></label>
													</th>
													<th xid="col15">
														<label bind-text="$model.pluginsConfigData.label('platform')" xid="label13"></label>
													</th>
													<th xid="col16">
														<label bind-text="$model.pluginsConfigData.label('displayName')" xid="label14"></label>
													</th>
													<th xid="col17">
														<label bind-text="$model.pluginsConfigData.label('value')" xid="label15"></label>
													</th>
												</tr>
											</thead>
											<tbody class="x-list-template" bind-click="$model!=$object?$object.data.to($object):null" xid="listTemplate4">
												<tr class="warning" xid="tr10">
													<td class="text-center" style="vertical-align:middle;" xid="td13">
														<i class="x-expand-i " style="color:#808080;padding-right:6px;" xid="i4"></i>
														<label bind-text="$index()+1" xid="label16"></label>
													</td>
													<td xid="td14">
														<div component="$UI/system/components/justep/output/output" class="x-output" bind-ref="ref('platform')" xid="output7"></div>
													</td>
													<td xid="td15">
														<div component="$UI/system/components/justep/output/output" bind-ref="ref('displayName')" xid="output8" style="display:inline-block" class="x-output"></div>
													<div component="$UI/system/components/justep/output/output" xid="output1" style="display:inline-block" class="x-output" bind-text="'(' + val('name') + ')'"></div></td>
													<td xid="td16">
														<div bind-ifnot="($object.val(&quot;type&quot;) === 'boolean') || ($object.val(&quot;type&quot;) === 'enumerate')">
														<input component="$UI/system/components/justep/input/input" class="form-control" bind-ref="ref('value')" xid="input3"></input>
														</div>
														<div bind-if="($object.val(&quot;type&quot;) === 'boolean') || ($object.val(&quot;type&quot;) === 'enumerate')" >
													<select component="$UI/system/components/justep/select/select" class="form-control" xid="select1" bind-ref="ref('value')" bind-options="$model.getParamValueItems($object)" bind-optionsValue="value"></select></div>
													</td>
												</tr>
											</tbody>
										</table>
									</div>
								</div>
							</td>
						</tr>
					</tbody>
				</table>
			</div>
			
		</div>
	</div>
</div>