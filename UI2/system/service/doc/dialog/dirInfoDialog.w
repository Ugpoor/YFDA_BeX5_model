<?xml version="1.0" encoding="utf-8"?>

<xui:window xmlns:xui="http://www.justep.com/xui" xmlns:justep="http://www.justep.com/x5#" xmlns:xbl="http://www.w3.org/ns/xbl" xmlns:xhtml="http://www.w3.org/1999/xhtml" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xforms="http://www.justep.com/xforms" xmlns:ev="http://www.w3.org/2001/xml-events" xmlns:saxon="http://saxon.sf.net/" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:ns="http://www.justep.com/x5#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xsl:version="2.0" component="/UI/system/components/window.xbl.xml#window">  
  <xforms:model id="docInfoDialog"> 
    <xui:data id="docInfo" columns="sEditorName,sDocName,sSize,sCreatorName,sCreateTime,sCreatorName,sEditorDeptName,sLastWriterName,sLastWriteTime,sParentID,sKind,sDocPath,sDocDisplayPath,sFileID,sSequence,sCreatorFID,sCreatorDeptName,sEditorFID,sLastWriterFID,sLastWriterDeptName,sDescription,sDocSerialNumber,sKeywords,sClassification,sFinishTime,sDocLiveVersionID,sProcess,sActivity" store-type="simple" component="/UI/system/components/data.xbl.xml#data"><rule id="dataRule1" column="sCreateTime" type="xsd:dateTime"></rule>
  <rule id="dataRule2" column="sFinishTime" type="xsd:dateTime"></rule></xui:data>  
    <xforms:bind nodeset="instance('docInfo')/sFinishTime" type="xsd:dateTime"/> 
  </xforms:model>  
  <xui:resource> 
    <xhtml:style>.th{align:center;} .faultwindow{background-color:#cccccc} .image_shadow{position:relative;float:left;clear:right;background:url(../images/shadow.gif) no-repeat right bottom;} .image_shadow div{position:relative;display:block;margin:-5px 5px 5px -5px;padding:3px;background:white;border:solid 1px #ccc;} .test{color:#000000;font-weight:normal;background-color:#CCCCCC;border-style:outset; }</xhtml:style>  
    <xhtml:script src="/UI/system/components/dialog/dialog.js"/>  
    <xhtml:script src="/UI/system/components/windowDialog/windowDialog.js"/>  
    <xhtml:script src="/UI/system/components/windowDialog/windowDialogReceiver.js"/> 
    <xhtml:script> <![CDATA[
			var gridData ;
			justep.windowDialogReceiver.acceptParentParamsFun = function(event){
				var data = event.data;
				gridData = data;
				var docInfo = justep.xbl("docInfo");
				docInfo.newData(0);
				var rowId = docInfo.getCurrentRowId();
				docInfo.setValue("sDocName",gridData.getValue("sDocName"), rowId);
				docInfo.setValue("sKind",gridData.getValue("sKind"), rowId);
				docInfo.setValue("sSize",gridData.getValue("sSize"), rowId);
				docInfo.setValue("sDocDisplayPath",gridData.getValue("sDocDisplayPath"), rowId);
				docInfo.setValue("sCreatorName",gridData.getValue("sCreatorName"), rowId);
				docInfo.setValue("sCreateTime",gridData.getValue("sCreateTime"), rowId);
				docInfo.setValue("sCreatorDeptName",gridData.getValue("sCreatorDeptName"), rowId);
				docInfo.setValue("sEditorName",gridData.getValue("sEditorName"), rowId);
				docInfo.setValue("sEditorDeptName",gridData.getValue("sEditorDeptName"), rowId);
				docInfo.setValue("sLastWriterDeptName",gridData.getValue("sLastWriterDeptName"), rowId);
				docInfo.setValue("sLastWriterName",gridData.getValue("sLastWriterName"), rowId);
				docInfo.setValue("sLastWriteTime",gridData.getValue("sLastWriteTime"), rowId);
				docInfo.setValue("sDocSerialNumber",gridData.getValue("sDocSerialNumber"), rowId);
				docInfo.setValue("sFinishTime",gridData.getValue("sFinishTime"), rowId);
				docInfo.setValue("sClassification",gridData.getValue("sClassification"), rowId);
				docInfo.setValue("sKeywords",gridData.getValue("sKeywords"), rowId);
				docInfo.setValue("sDescription",gridData.getValue("sDescription"), rowId);
			}
			
		 	function getDocInfoData(){
		 		xforms.blur(true);
		 		var docInfo = justep.xbl("docInfo");
		 		if(docInfo.isChanged){
			 		var rowId = gridData.getCurrentRowId();
					gridData.setValue("sDocName",docInfo.getValue("sDocName"), rowId);
					gridData.setValue("sKind",docInfo.getValue("sKind"), rowId);
					gridData.setValue("sSize",docInfo.getValue("sSize"), rowId);
					gridData.setValue("sDocDisplayPath",docInfo.getValue("sDocDisplayPath"), rowId);
					gridData.setValue("sCreatorName",docInfo.getValue("sCreatorName"), rowId);
					gridData.setValue("sCreateTime",docInfo.getValue("sCreateTime"), rowId);
					gridData.setValue("sCreatorDeptName",docInfo.getValue("sCreatorDeptName"), rowId);
					gridData.setValue("sEditorName",docInfo.getValue("sEditorName"), rowId);
					gridData.setValue("sEditorDeptName",docInfo.getValue("sEditorDeptName"), rowId);
					gridData.setValue("sLastWriterDeptName",docInfo.getValue("sLastWriterDeptName"), rowId);
					gridData.setValue("sLastWriterName",docInfo.getValue("sLastWriterName"), rowId);
					gridData.setValue("sLastWriteTime",docInfo.getValue("sLastWriteTime"), rowId);
					gridData.setValue("sDocSerialNumber",docInfo.getValue("sDocSerialNumber"), rowId);
					gridData.setValue("sFinishTime",docInfo.getValue("sFinishTime"), rowId);
					gridData.setValue("sClassification",docInfo.getValue("sClassification"), rowId);
					gridData.setValue("sKeywords",docInfo.getValue("sKeywords"), rowId);
					gridData.setValue("sDescription",docInfo.getValue("sDescription"), rowId);
		 		}
		 	}
			]]> </xhtml:script> 
  </xui:resource>  
  <xui:view> 
    <xui:layout style="width:100%;height:100%;">
      <xhtml:div component="/UI/system/components/borderLayout.xbl.xml#borderLayout" 
      	style="width:100%; height:100%" border-size="8px" id="border1">
       <center id="cent__">
        	<xhtml:div component="/UI/system/components/tabs.xbl.xml#tabs" id="tabbar" style="height:100%;width:100%;"> 
              <xui:tab> 
                <xui:label>常规</xui:label>  
                <xhtml:table heigth="100%" width="100%"> 
                  <xhtml:tr style="height:25px"> 
                    <xhtml:td style="width:8px;">
                    </xhtml:td>  
                    <xhtml:td scope="row" style="width:100px;"> 
                      <xhtml:div class="th">名称:</xhtml:div> 
                    </xhtml:td>  
                    <xhtml:td style="width:320px;"> 
                      <xforms:input auto-size="true" style="width:100%" ref="instance('docInfo')/sDocName"/> 
                    </xhtml:td>  
                    <xhtml:td style="width:8px;">
                    </xhtml:td> 
                  </xhtml:tr>  
                  <xhtml:tr style="height:30px"> 
                    <xhtml:td/>  
                    <xhtml:td scope="row"> 
                      <xhtml:div class="th">类型:</xhtml:div> 
                    </xhtml:td>  
                    <xhtml:td> 
                      <xforms:output ref="instance('docInfo')/sKind"/> 
                    </xhtml:td>  
                    <xhtml:td/> 
                  </xhtml:tr>  
                  <xhtml:tr style="height:30px"> 
                    <xhtml:td/>  
                    <xhtml:td> 
                      <xhtml:div class="th">大小(字节):</xhtml:div> 
                    </xhtml:td>  
                    <xhtml:td> 
                      <xforms:output ref="instance('docInfo')/sSize" xforms:format="format-number('0,000')"/> 
                    </xhtml:td>  
                    <xhtml:td/> 
                  </xhtml:tr>  
                  <xhtml:tr style="height:38px"> 
                    <xhtml:td/>  
                    <xhtml:td scope="row"> 
                      <xhtml:div class="th">路径:</xhtml:div> 
                    </xhtml:td>  
                    <xhtml:td> 
                      <xforms:output ref="instance('docInfo')/sDocDisplayPath"/> 
                    </xhtml:td>  
                    <xhtml:td/> 
                  </xhtml:tr>  
                  <xhtml:tr style="height:3px"> 
                    <xhtml:td/>  
                    <xhtml:td colspan="2"> 
                      <xhtml:div style="overflow:hidden;display:block;background:silver; width:100%;height:1px"/> 
                    </xhtml:td>  
                    <xhtml:td/> 
                  </xhtml:tr>  
                  <xhtml:tr style="height:30px"> 
                    <xhtml:td/>  
                    <xhtml:td scope="row"> 
                      <xhtml:div class="th">创建人:</xhtml:div> 
                    </xhtml:td>  
                    <xhtml:td> 
                      <xforms:output ref="instance('docInfo')/sCreatorName"/> 
                    </xhtml:td> 
                  </xhtml:tr>  
                  <xhtml:tr style="height:30px"> 
                    <xhtml:td/>  
                    <xhtml:td> 
                      <xhtml:div class="th">创建部门：</xhtml:div> 
                    </xhtml:td>  
                    <xhtml:td> 
                      <xforms:output ref="instance('docInfo')/sCreatorDeptName"/> 
                    </xhtml:td> 
                  </xhtml:tr>  
                  <xhtml:tr style="height:30px"> 
                    <xhtml:td/>  
                    <xhtml:td scope="row"> 
                      <xhtml:div width="120px" class="th">创建时间:</xhtml:div> 
                    </xhtml:td>  
                    <xhtml:td> 
                      <xforms:output ref="instance('docInfo')/sCreateTime" xforms:format="format-dateTime('yyyy-MM-dd hh:mm:ss')"/> 
                    </xhtml:td> 
                  </xhtml:tr>  
                  <xhtml:tr style="height:3px"> 
                    <xhtml:td/>  
                    <xhtml:td colspan="2"> 
                      <xhtml:div style="overflow:hidden;display:block;background:silver; width:100%;height:1px"/> 
                    </xhtml:td>  
                    <xhtml:td/> 
                  </xhtml:tr>  
                  <xhtml:tr style="height:30px"> 
                    <xhtml:td/>  
                    <xhtml:td scope="row"> 
                      <xhtml:div class="th">编辑人:</xhtml:div> 
                    </xhtml:td>  
                    <xhtml:td> 
                      <xforms:output ref="instance('docInfo')/sEditorName"/> 
                    </xhtml:td>  
                    <xhtml:td/> 
                  </xhtml:tr>  
                  <xhtml:tr style="height:30px"> 
                    <xhtml:td/>  
                    <xhtml:td> 
                      <xhtml:div class="th">编辑部门:</xhtml:div> 
                    </xhtml:td>  
                    <xhtml:td> 
                      <xforms:output ref="instance('docInfo')/sEditorDeptName"/> 
                    </xhtml:td>  
                    <xhtml:td/> 
                  </xhtml:tr>  
                  <xhtml:tr style="height:3px"> 
                    <xhtml:td/>  
                    <xhtml:td colspan="2"> 
                      <xhtml:div style="overflow:hidden;display:block;background:silver; width:100%;height:1px"/> 
                    </xhtml:td>  
                    <xhtml:td/> 
                  </xhtml:tr>  
                  <xhtml:tr style="height:30px"> 
                    <xhtml:td/>  
                    <xhtml:td scope="row"> 
                      <xhtml:div class="th">最后修改人:</xhtml:div> 
                    </xhtml:td>  
                    <xhtml:td> 
                      <xforms:output ref="instance('docInfo')/sLastWriterName"/> 
                    </xhtml:td>  
                    <xhtml:td/> 
                  </xhtml:tr>  
                  <xhtml:tr style="height:30px"> 
                    <xhtml:td/>  
                    <xhtml:td> 
                      <xhtml:div class="th">最后修改部门:</xhtml:div> 
                    </xhtml:td>  
                    <xhtml:td> 
                      <xforms:output ref="instance('docInfo')/sLastWriterDeptName"/> 
                    </xhtml:td>  
                    <xhtml:td/> 
                  </xhtml:tr>  
                  <xhtml:tr style="height:22px"> 
                    <xhtml:td/>  
                    <xhtml:td scope="row"> 
                      <xhtml:div width="120px" class="th">最后修改时间:</xhtml:div> 
                    </xhtml:td>  
                    <xhtml:td> 
                      <xforms:output ref="instance('docInfo')/sLastWriteTime" xforms:format="format-dateTime('yyyy-MM-dd hh:mm:ss')"/> 
                    </xhtml:td> 
                  </xhtml:tr>  
                </xhtml:table> 
              </xui:tab>  
              <xui:tab> 
                <xui:label>摘要</xui:label>  
                <xhtml:table width="100%"> 
                  <xhtml:tr style="height:25px"> 
                    <xhtml:td style="width:8px;">
                    </xhtml:td>  
                    <xhtml:td style="width:100px;">
                      <xhtml:div class="th">文件编号：</xhtml:div> 
                    </xhtml:td>  
                    <xhtml:td style="width:320px;"> 
                      <xforms:input auto-size="true" style="width:100%" ref="instance('docInfo')/sDocSerialNumber"/> 
                    </xhtml:td>  
                    <xhtml:td style="width:8px;">
                    </xhtml:td> 
                  </xhtml:tr>  
                  <xhtml:tr style="height:30px"> 
                    <xhtml:td/>  
                    <xhtml:td> 
                      <xhtml:div class="th">成文日期：</xhtml:div> 
                    </xhtml:td>  
                    <xhtml:td> 
                      <xforms:input xforms:format="format-dateTime('yyyy-MM-dd hh:mm:ss')" style="width:100%" ref="instance('docInfo')/sFinishTime"/> 
                    </xhtml:td>  
                    <xhtml:td/> 
                  </xhtml:tr>  
                  <xhtml:tr style="height:30px"> 
                    <xhtml:td/>  
                    <xhtml:td> 
                      <xhtml:div class="th">关 键 字：</xhtml:div> 
                    </xhtml:td>  
                    <xhtml:td> 
                      <xforms:input ref="instance('docInfo')/sKeywords" style="width:100%"/> 
                    </xhtml:td>  
                    <xhtml:td/> 
                  </xhtml:tr>  
                  <xhtml:tr style="height:120px"> 
                    <xhtml:td/>  
                    <xhtml:td> 
                      <xhtml:div class="th">文件描述：</xhtml:div> 
                    </xhtml:td>  
                    <xhtml:td> 
                      <xforms:textarea id="docDescTextarea" xforms:rows="4" xforms:cols="75" ref="instance('docInfo')/sDescription" style="width:100%;height:200px;margin-top:10px"/> 
                    </xhtml:td>  
                    <xhtml:td/> 
                  </xhtml:tr>  
                </xhtml:table> 
              </xui:tab> 
            </xhtml:div>
      </center>  
      <bottom id="bot__" size="30px">
      		
  <xui:place control="trigger2" id="controlPlace2" style="float:right;width:75px;margin-top:8px;"></xui:place><xui:place control="trigger1" id="controlPlace1" style="float:right;width:75px;margin-top:8px;margin-right:8px;"></xui:place></bottom>	 
      </xhtml:div>
    </xui:layout> 
  <xforms:trigger component="/UI/system/components/trigger.xbl.xml#trigger" id="trigger1" class="button-green">
   <xforms:label id="default1"><![CDATA[确定]]></xforms:label>
  <xforms:action id="action1" ev:event="DOMActivate"><xforms:script id="xformsScript1"><![CDATA[justep.windowDialogReceiver.windowEnsure(getDocInfoData())]]></xforms:script></xforms:action></xforms:trigger>
  <xforms:trigger component="/UI/system/components/trigger.xbl.xml#trigger" id="trigger2" appearance="minimal">
   <xforms:label id="default2"><![CDATA[取消]]></xforms:label>
  <xforms:action id="action2" ev:event="DOMActivate"><xforms:script id="xformsScript2"><![CDATA[justep.windowDialogReceiver.windowCancel()]]></xforms:script></xforms:action></xforms:trigger></xui:view> 
</xui:window>