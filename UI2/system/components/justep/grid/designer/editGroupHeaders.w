<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" component="$UI/system/components/justep/window/window">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:474px;top:150px;"
    onLoad="modelLoad"/>  
  <div component="$UI/system/components/justep/controlGroup/controlGroup" class="x-control-group"
    title="列头" xid="controlGroup1"> 
    <div class="x-control-group-title" xid="controlGroupTitle1"> 
      <span xid="span1">title</span>  
      <i xid="i1" class="icon-android-add" style="font-size:20px;float:right;" bind-click="i1Click"/> 
    </div>  
    <div xid="div1" bind-foreach="groupHeaders"> 
      <div class="panel panel-default"> 
       <div class=" panel-body">
        <div component="$UI/system/components/justep/button/buttonGroup" class="btn-group btn-group-justified"
          tabbed="false" xid="buttonGroup1">
          <a component="$UI/system/components/justep/button/button" class="btn btn-default"
            label="删除当前列头设置" xid="button2" bind-click="button2Click"> 
            <i xid="i4"/>  
            <span xid="label5">删除当前列头设置</span>
          </a>  
          <a component="$UI/system/components/justep/button/button" class="btn btn-default"
            label="增加合并定义" xid="button3" bind-click="button3Click"> 
            <i xid="i5"/>  
            <span xid="label6">增加合并定义</span>
          </a>
        </div> 
        </div> 
        <table class="table table-bordered"> 
          <tr bind-foreach="$model.columns"> 
            <td bind-text="name"/> 
          </tr>  
          <tr bind-foreach="displayItems"> 
            <td bind-text="name" bind-attr-colspan="colspan"/> 
          </tr> 
        </table>  
        <div bind-foreach="items" class="list-group"> 
          <div class="list-group-item"> 
            <div component="$UI/system/components/justep/labelEdit/labelEdit"
              class="x-label-edit x-label20" xid="labelEdit1"> 
              <label class="x-label" xid="label1"><![CDATA[合并列]]></label>  
              <div class="x-edit" xid="div2"> 
                <select xid="select1" class="form-control" data-bind="options: $model.columns,optionsText: 'name',optionsValue: 'field',value: startColumn,optionsCaption: '请选择列...'"/>  
                <!-- 
                  <input type="text" value="" class="form-control"
                    bind-value="startColumn"/> 
                   --> 
              </div> 
            </div>  
            <div component="$UI/system/components/justep/labelEdit/labelEdit"
              class="x-label-edit x-label20" xid="labelEdit2"> 
              <label class="x-label" xid="label3"><![CDATA[合并列数]]></label>  
              <div class="x-edit" xid="div3"> 
                <input type="text" value="" xid="input2" class="form-control"
                  bind-value="columnCount"/> 
              </div> 
            </div>  
            <div component="$UI/system/components/justep/labelEdit/labelEdit"
              class="x-label-edit x-label20" xid="labelEdit3"> 
              <label class="x-label" xid="label4"><![CDATA[列头名称]]></label>  
              <div class="x-edit" xid="div4"> 
                <input type="text" value="" xid="input3" class="form-control"
                  bind-value="titleText"/> 
              </div> 
            </div> 
          <a component="$UI/system/components/justep/button/button" class="btn btn-default btn-block" label="删除当前合并定义" xid="button4" bind-click="button4Click">
   <i xid="i6"></i>
   <span xid="label7">删除当前合并定义</span></a></div> 
        </div> 
      </div> 
    </div> 
  </div> 
</div>
