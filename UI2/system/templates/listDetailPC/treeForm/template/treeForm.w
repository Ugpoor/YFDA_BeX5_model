<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window" component="$UI/system/components/justep/window/window"
  design="device:pc">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:264px;top:676px;"> {{#each datas}} 
    <div component="$UI/system/components/justep/data/bizData" xid="treeData"
      autoLoad="true" autoNew="false" concept="{{data_concept}}" columns="{{data_relations}}"
      isTree="true"> 
      <reader action="{{data_reader}}"/>{{/each}}{{#each tree}}
      <treeOption parentRelation="{{parent_relation}}" nodeKindRelation="{{node_kindRelation}}"
        rootFilter="{{root_filter}}"/>{{/each}}
    </div> 
  </div>  
  <div class="container-fluid" xid="view"> 
    <div component="$UI/system/components/justep/toolBar/toolBar" class="x-toolbar form-inline x-toolbar-spliter"
      xid="toolBar1"> 
      <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
        onClick="{'operation':'treeData.new'}" xid="button3"> 
        <i xid="i3"/>  
        <span xid="span3"/> 
      </a>
      <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
        onClick="{'operation':'treeData.save'}" xid="button1"> 
        <i xid="i1"/>  
        <span xid="span1"/> 
      </a>  
      <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
        onClick="{'operation':'treeData.delete'}" xid="button2"> 
        <i xid="i2"/>  
        <span xid="span2"/> 
      </a>  
      <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
        onClick="{'operation':'treeData.newChild'}" xid="button4"> 
        <i xid="i4"/>  
        <span xid="span4"/> 
      </a>  
      <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
        onClick="{'operation':'treeData.newBrother'}" xid="button5"> 
        <i xid="i5"/>  
        <span xid="span5"/> 
      </a>  
      <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
        onClick="{'operation':'treeData.delete'}" xid="button6"> 
        <i xid="i6"/>  
        <span xid="span6"/> 
      </a>  
      <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
        onClick="{'operation':'treeData.refresh'}" xid="button7"> 
        <i xid="i7"/>  
        <span xid="span7"/> 
      </a> 
    </div>  
    <div component="$UI/system/components/bootstrap/row/row" class="row" xid="row1"> 
      <div class="col col-xs-3" xid="col1" style="overflow: auto;"> {{#each tree}}
        <div component="$UI/system/components/justep/grid/grid" hiddenCaptionbar="true"
          altRows="true" class="x-grid-no-bordered" xid="grid2" data="treeData" directEdit="false"
          height="auto" width="100%" appearance="tree" expandColumn="{{tree_nodeName}}"> 
          <columns xid="columns2"> 
            <column name="{{tree_nodeName}}" xid="column1"/> 
          </columns> 
        </div>{{/each}}
      </div>  
      <div class="col col-xs-9 col-spliter-left" xid="col2"> 
        <div xid="mainForm" class="form-horizontal" component="$UI/system/components/bootstrap/form/form"
              style="margin:30px 10px">{{#each form}} 
              <div xid="formGroup{{addOne @index}}" class="form-group"> 
                <div xid="col{{addOne @index}}1" class="col-sm-2"> 
                  <label xid="{{form_field}}L" class="control-label" bind-text="treeData.label('{{form_field}}')"/> 
                </div>  
                <div xid="col{{addOne @index}}2" class="col-sm-10">{{#if form_selectDataID}} 
                  <select xid="{{form_field}}" class="form-control" component="$UI/system/components/justep/select/select"
                    bind-ref="treeData.ref('{{form_refID}}')" bind-labelRef="treeData.ref('{{form_field}}')"
                    bind-options="{{form_selectDataID}}" bind-optionsLabel="{{form_selectLabelName}}"
                    bind-optionsValue="{{form_selectConcept}}" bind-optionsCaption="请选择..."/>{{else}}{{#if form_password}}
                  <input xid="{{form_field}}" component="$UI/system/components/justep/input/password"
                    class="form-control x-edit" data="treeData" bind-ref="treeData.ref('{{form_field}}')"/>{{/if}}{{#if form_range}}
                  <input xid="{{form_field}}" component="$UI/system/components/justep/input/range"
                    class="x-edit" bind-ref="treeData.ref('{{form_field}}')"
                    min="-10000" max="10000"/>{{/if}}{{#if form_output}}
                  <output xid="{{form_field}}" class="form-control" component="$UI/system/components/justep/output/output"
                    bind-ref="treeData.ref('{{form_field}}')"/>{{/if}}{{#if form_textarea}}
                  <textarea xid="{{form_field}}" class="form-control" component="$UI/system/components/justep/textarea/textarea"
                    bind-ref="treeData.ref('{{form_field}}')"/> {{/if}}{{#if form_input}}
                  <input xid="{{form_field}}" class="form-control" component="$UI/system/components/justep/input/input"
                    bind-ref="treeData.ref('{{form_field}}')"/>{{/if}}{{/if}}
                </div> 
              </div>{{/each}}
            </div>  
      </div> 
    </div> 
  </div> 
</div>
