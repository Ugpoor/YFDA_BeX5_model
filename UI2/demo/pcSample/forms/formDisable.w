<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window" component="$UI/system/components/justep/window/window"
  design="device:pc">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:186px;top:5px;"> 
    <div component="$UI/system/components/justep/data/data" autoLoad="true"
      xid="familyData" idColumn="family"> 
      <column label="名族：" name="family" type="String" xid="xid1"/>  
      <data xid="default2">[{"family":"汉族"},{"family":"回族"},{"family":"彝族"},{"family":"维吾尔族"},{"family":"哈尼族"}]</data> 
    </div>  
    <div component="$UI/system/components/justep/data/data" autoLoad="true"
      xid="userData" idColumn="userName"> 
      <column label="用户名：" name="userName" type="String" xid="xid2"/>  
      <column label="密码：" name="password" type="String" xid="xid3"/>  
      <column label="名族：" name="family" type="String" xid="xid4"/>  
      <column label="常住地址：" name="address" type="String" xid="xid5"/>  
      <data xid="default1">[{"userName":"张三","password":"123","family":"回族","address":"北京"}]</data> 
    </div> 
  </div>  
  <div component="$UI/system/components/justep/controlGroup/controlGroup" class="x-control-group"
    title="1、表单的禁用" xid="controlGroup"> 
    <div class="x-control-group-title" xid="controlGroupTitle4" style="background-color:white;"/>  
    <a component="$UI/system/components/justep/button/button" class="btn btn-link"
      label="js" xid="showJs" onClick="showJsSource" style="margin-left:15px;"> 
      <i xid="i7"/>  
      <span xid="span7">js</span> 
    </a>  
    <a component="$UI/system/components/justep/button/button" class="btn btn-link"
      label="源码" xid="sourceBtn" onClick="sourceBtnClick"> 
      <i xid="i6"/>  
      <span xid="span6">源码</span> 
    </a>  
    <a style="position:absolute;z-index:100;margin-left:350px;margin-top:-50px;color:#000000;"
      component="$UI/system/components/justep/button/button" class="btn btn-link"
      label="禁用表单" xid="showBtn" onClick="showBtnClick"> 
      <i xid="i5"/>  
      <span xid="span5">禁用表单</span> 
    </a>  
    <form action="post" method="" xid="form1" class="form" bind-disable="true"> 
      <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label30"
        xid="labelInput3" style="width:300px;"> 
        <label class="x-label" xid="label5" bind-text="userData.label('userName')"/>  
        <input component="$UI/system/components/justep/input/input" class="form-control x-edit"
          xid="input3" bind-ref="userData.ref('userName')" style="width:200px;"/> 
      </div>  
      <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label30"
        xid="labelInput2" style="width:300px;"> 
        <label class="x-label" xid="label2" bind-text="userData.label('password')"/>  
        <input component="$UI/system/components/justep/input/input" class="form-control x-edit"
          xid="input2" bind-ref="userData.ref('password')" style="width:200px;"/> 
      </div>  
      <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label30"
        xid="labelSelect1" style="width:300px;"> 
        <label class="x-label" xid="label3" bind-text="userData.label('family')"/>  
        <select component="$UI/system/components/justep/select/select" class="form-control x-edit"
          xid="select1" bind-ref="userData.ref('family')" bind-options="familyData"
          bind-optionsValue="family" bind-optionsLabel="family" style="width:200px;"/> 
      </div>  
      <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label19"
        xid="labelTextarea1" style="width:500px;"> 
        <label class="x-label" xid="label4" bind-text="userData.label('address')"
          style="width:87px;"/>  
        <textarea component="$UI/system/components/justep/textarea/textarea" class="form-control x-edit"
          xid="textarea1" bind-ref="userData.ref('address')" style="width:400px;"/> 
      </div>  
      <div component="$UI/system/components/justep/row/row" class="x-row" xid="row2"
        style="width:400px;"> 
        <div class="x-col" xid="col3"> 
          <a component="$UI/system/components/justep/button/button" class="btn btn-link pull-right"
            label="提交" xid="subBtn" onClick="subBtnClick"> 
            <i xid="i2"/>  
            <span xid="span2">提交</span> 
          </a> 
        </div>  
        <div class="x-col" xid="col4"> 
          <a component="$UI/system/components/justep/button/button" class="btn btn-link"
            label="重置" xid="clearBtn" onClick="clearBtnClick"> 
            <i xid="i3"/>  
            <span xid="span3">重置</span> 
          </a> 
        </div> 
      </div> 
    </form> 
  </div>  
  <div component="$UI/system/components/justep/popOver/popOver" class="x-popOver"
    xid="popOver" dismissible="false" anchor="input2" position="center" direction="right-bottom"> 
    <div class="x-popOver-overlay" xid="div1" style="width:500px;height:266px;margin-top:95px;margin-left:40px;"/>  
    <div class="x-popOver-content" xid="div2"> 
      <a component="$UI/system/components/justep/button/button" class="btn btn-link"
        label="已禁用" xid="button1" style="background-color:white;"> 
        <i xid="i1"/>  
        <span xid="span1">已禁用</span> 
      </a> 
    </div> 
  </div> 
</div>
