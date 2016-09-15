<?xml version="1.0" encoding="utf-8"?>

<xui:window xmlns:xui="http://www.justep.com/xui" xmlns:justep="http://www.justep.com/x5#" xmlns:xbl="http://www.w3.org/ns/xbl" xmlns:xhtml="http://www.w3.org/1999/xhtml" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xforms="http://www.justep.com/xforms" xmlns:ev="http://www.w3.org/2001/xml-events" xmlns:saxon="http://saxon.sf.net/" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:ns="http://www.justep.com/x5#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xsl:version="2.0" component="/UI/system/components/window.xbl.xml#window">  
  <xforms:model id="docHistoryDialog" style="top:206px;height:auto;left:302px;"> 
    <xui:data id="historyRecord" columns="sDocVersionID,sDocName,sSize,sPersonName,sDeptName,sTime" store-type="grid" component="/UI/system/components/data.xbl.xml#data"/> 
  </xforms:model>  
  <xui:resource> 
    <xhtml:script language="JavaScript" type="text/javascript" src="/UI/system/service/doc/docUtil2.js"/>  
    <xhtml:script src="/UI/system/components/dialog/dialog.js"/>  
    <xhtml:script src="/UI/system/components/windowDialog/windowDialog.js"/>  
    <xhtml:script src="/UI/system/components/windowDialog/windowDialogReceiver.js"/>  
    <xhtml:script> <![CDATA[
			justep.windowDialogReceiver.acceptParentParamsFun = function(event){
				var data = event.data;
				var docID = data.docID;
				var response = justep.doc.InnerUtils.getAccessRecord(docID, true, false, false);
				justep.xbl("historyRecord").loadXML(response.responseXML, null, true);
				justep.xbl("historyRecord").setIndex(0);
			}
		]]> </xhtml:script> 
  </xui:resource>  
  <xui:view style="width:100%;height:100%;"> 
    <xui:layout style="width:100%;height:100%;">
      <xhtml:table style="width:100%;height:100%;table-layout:fixed" cellspacing="8" cellpadding="0" border="0" component="/UI/system/components/tableLayout.xbl.xml#tableLayout"> 
        <xhtml:tr> 
          <xhtml:td> 
            <xhtml:div data="historyRecord" id="historyRecordNav" component="/UI/system/components/grid.xbl.xml#grid" style="width:100%;height:100%" class="grid-flat xui-grid-hide-VLine"> 
              <xui:column width="30" ref="sDocVersionID" label="版本" align="center"/>  
              <xui:column width="*" ref="sDocName" label="名称"/>  
              <xui:column width="120" ref="sSize" label="大小(字节)" align="center"/>  
              <xui:column width="120" ref="sPersonName" label="下载人" align="center"/>  
              <xui:column width="120" ref="sDeptName" label="下载人部门" visable="false"/>  
              <xui:column width="120" type="dateTime" ref="sTime" label="下载时间" readonly="true"/> 
            </xhtml:div> 
          </xhtml:td> 
        </xhtml:tr>  
        <xhtml:tr style="height: 22px"> 
          <xhtml:td align="right"> 
            <xui:place control="trigger1" id="controlPlace1"></xui:place></xhtml:td> 
        </xhtml:tr> 
      </xhtml:table> 
    </xui:layout> 
  <xforms:trigger component="/UI/system/components/trigger.xbl.xml#trigger" id="trigger1" class="button-green">
   <xforms:label id="default1"><![CDATA[关闭]]></xforms:label>
  <xforms:action id="action1" ev:event="DOMActivate"><xforms:script id="xformsScript1"><![CDATA[justep.windowDialogReceiver.windowCancel()]]></xforms:script></xforms:action></xforms:trigger></xui:view> 
</xui:window>
