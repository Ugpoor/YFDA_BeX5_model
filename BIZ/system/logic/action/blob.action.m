<?xml version="1.0" encoding="utf-8"?>
<model xmlns="http://www.justep.com/model"
	xmlns:m="http://www.justep.com/model">
	<action name="blobUpdateAction" global="true" procedure="blobUpdateProcedure">
		<label language="zh_CN">blob更新</label>
		<public name="blobDataModel" type="String" />
		<public name="blobConcept" type="String" />
		<public name="blobRelation" type="String" />
		<public name="blobLastModifiedRelation" type="String" />
		<public name="blobConceptValue" type="String" />
		<public type="String" required="false" name="limitSize"/>
		<public name="blobData" type="Object" />
	
</action>
	<action name="blobDeleteAction" global="true" procedure="blobDeleteProcedure">
		<label language="zh_CN">blob数据清除</label>
		<public name="blobDataModel" type="String" />
		<public name="blobConcept" type="String" />
		<public name="blobRelation" type="String" />
		<public name="blobLastModifiedRelation" type="String" />
		<public name="blobConceptValue" type="String" />
	</action>
	<action name="blobDownloadAction" global="true" procedure="blobDownloadProcedure">
		<label language="zh_CN">blob数据下载</label>
		<public name="blobDataModel" type="String" />
		<public name="blobConcept" type="String" />
		<public name="blobRelation" type="String" />
		<public name="blobConceptValue" type="String" />
	</action>
	<action name="getBlobLastModifiedAction" global="true" procedure="getBlobLastModifiedProcedure">
		<label language="zh_CN">获取blob数据更新时间</label>
		<public name="blobDataModel" type="String" />
		<public name="blobConcept" type="String" />
		<public name="blobLastModifiedRelation" type="String" />
		<public name="blobConceptValue" type="String" />
	</action>
</model>	