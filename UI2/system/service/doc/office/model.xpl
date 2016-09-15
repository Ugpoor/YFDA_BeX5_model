<?xml version="1.0" encoding="UTF-8"?>
<p:config xmlns:p="http://www.orbeon.com/oxf/pipeline" 
	xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" 
	xmlns:oxf="http://www.orbeon.com/oxf/processors" 
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
	xmlns:xforms="http://www.justep.com/xforms" 
	xmlns:justep="http://www.justep.com/x5#" 
	xmlns:ns="http://www.justep.com/x5#" 
	xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
	<!--  officeView传递参数使用  -->
    <p:param name="instance" type="input" /> 
     <p:param name="data" type="output" />  

	<p:processor name="oxf:identity"> 
		<p:input name="data" href="#instance"/>  
		<p:output name="data" ref="data"/> 
	</p:processor> 
</p:config>
