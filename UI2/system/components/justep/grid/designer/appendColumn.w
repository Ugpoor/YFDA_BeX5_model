<div 
  xmlns:xu="http://www.xmldb.org/xupdate" 
  xmlns:xui="http://www.justep.com/xui" 
  __id="id_1" 
  extends="$UI/system/components/justep/dataTables/designer/appendColumn.w" 
  component="$UI/system/components/justep/window/window" 
  xmlns="http://www.w3.org/1999/xhtml" >

   <div xid="model" style="height:auto;left:201px;top:131px;"  xui:update-mode="merge"/>
    <div autoLoad="true" component="$UI/system/components/justep/data/data" idColumn="type" xid="editorsdata" xui:parent="model" xui:update-mode="insert" >
<column label="编辑器类型" name="type" type="String" xid="xid1_2" />
<column label="编辑器显示名" name="name" type="String" xid="xid2_2" />
</div>
    <column label="编辑器" name="editor" type="String" xid="xid5_1" xui:parent="data" xui:update-mode="insert" />
    <th xid="col1_1" xui:parent="tr1" xui:update-mode="insert" >
<label bind-text="$model.data.label('editor')" xid="label1_2" />
</th>
    <td xid="td1_1" xui:parent="tr2" xui:update-mode="insert" >
<select bind-options="$model.editorsdata" bind-optionsCaption="请选择" bind-optionsLabel="name" bind-optionsValue="type" bind-ref="ref('editor')" class="form-control" component="$UI/system/components/justep/select/select" xid="select1_2" />
</td>

</div>