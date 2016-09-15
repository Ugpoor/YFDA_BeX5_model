<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window" component="$UI/system/components/justep/window/window"
  design="device:pc">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:83px;top:241px;"> 
    <div component="$UI/system/components/justep/data/data" autoLoad="true"
      xid="userData" idColumn="name"> 
      <column label="用户名：" name="name" type="String" xid="xid1"/>  
      <column label="密码：" name="pass" type="String" xid="xid2"/>  
      <column label="邮箱：" name="email" type="String" xid="xid3"/>  
      <column label="QQ：" name="QQ" type="String" xid="xid4"/>  
      <column label="手机号码：" name="tel" type="String" xid="xid5"/>  
      <column label="常住地址：" name="address" type="String" xid="xid6"/> 
    </div> 
  </div>  
  <span component="$UI/system/components/justep/windowReceiver/windowReceiver"
    xid="windowReceiver" style="left:69px;top:84px;"/>  
  <div component="$UI/system/components/justep/panel/panel" class="x-panel x-full"
    xid="panel2"> 
    <div class="x-panel-top" xid="top2"> 
      <div component="$UI/system/components/justep/titleBar/titleBar" class="x-titlebar"
        xid="titleBar3" title="带验证表单"> 
        <div class="x-titlebar-left" xid="div7"> 
          <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-only-icon"
            label="button" xid="closeBtn" icon="icon-android-arrow-back" onClick="closeBtnClick"> 
            <i xid="i2" class="icon-android-arrow-back"/>  
            <span xid="span3"/> 
          </a> 
        </div>  
        <div class="x-titlebar-title" xid="div8">带验证表单</div>  
        <div class="x-titlebar-right reverse" xid="div9"/> 
      </div> 
    </div>  
    <div class="x-panel-content" xid="content6"> 
      <div component="$UI/system/components/justep/contents/contents" class="x-contents x-full"
        active="0" xid="contents3"> 
        <div class="x-contents-content" xid="content7"> 
          <div class="form-horizontal container-fluid" component="$UI/system/components/bootstrap/form/form"
            xid="form2"> 
            <div component="$UI/system/components/justep/labelEdit/labelEdit"
              class="x-label-edit x-label30" xid="labelInput2"> 
              <label class="x-label" xid="label2" bind-text="userData.label('name')"/>  
              <input component="$UI/system/components/justep/input/input" class="form-control x-edit"
                xid="name"/> 
            </div>  
            <div component="$UI/system/components/justep/labelEdit/labelEdit"
              class="x-label-edit x-label30" xid="labelInput1"> 
              <label class="x-label" xid="label1" bind-text="userData.label('pass')"/>  
              <input component="$UI/system/components/justep/input/input" type="password"
                class="form-control x-edit" xid="pass"/> 
            </div>  
            <div component="$UI/system/components/justep/row/row" class="x-row"
              xid="row1"> 
              <div class="x-col" xid="col1"/>  
              <div class="x-col" xid="col3"> 
                <a component="$UI/system/components/justep/button/button"
                  class="btn btn-link" label="下一页" xid="nextBtn" target="content8"
                  onClick="nextBtnClick"> 
                  <i xid="i4"/>  
                  <span xid="span5">下一页</span> 
                </a> 
              </div> 
            </div> 
          </div> 
        </div>  
        <div class="x-contents-content" xid="content8"> 
          <div class="form-horizontal container-fluid" component="$UI/system/components/bootstrap/form/form"
            xid="form3"> 
            <div component="$UI/system/components/justep/labelEdit/labelEdit"
              class="x-label-edit x-label30" xid="labelInput3"> 
              <label class="x-label" xid="label4" bind-text="userData.label('email')"/>  
              <input component="$UI/system/components/justep/input/input" class="form-control x-edit"
                xid="email"/> 
            </div>  
            <div component="$UI/system/components/justep/labelEdit/labelEdit"
              class="x-label-edit x-label30" xid="labelInput4"> 
              <label class="x-label" xid="label3" bind-text="userData.label('QQ')"/>  
              <input component="$UI/system/components/justep/input/input" class="form-control x-edit"
                xid="QQ"/> 
            </div>  
            <div component="$UI/system/components/justep/row/row" class="x-row"
              xid="row2"> 
              <div class="x-col" xid="col4"> 
                <a component="$UI/system/components/justep/button/button"
                  class="btn btn-link pull-right" label="上一页" xid="button6" target="content7"> 
                  <i xid="i6"/>  
                  <span xid="span7">上一页</span> 
                </a> 
              </div>  
              <div class="x-col" xid="col5"> 
                <a component="$UI/system/components/justep/button/button"
                  class="btn btn-link" label="下一页" target="content9" xid="regBtn"
                  onClick="regBtnClick"> 
                  <i xid="i5"/>  
                  <span xid="span6">下一页</span> 
                </a> 
              </div> 
            </div> 
          </div> 
        </div>  
        <div class="x-contents-content" xid="content9"> 
          <div class="form-horizontal container-fluid" component="$UI/system/components/bootstrap/form/form"
            xid="form4"> 
            <div component="$UI/system/components/justep/labelEdit/labelEdit"
              class="x-label-edit x-label30" xid="labelInput6"> 
              <label class="x-label" xid="label6" bind-text="userData.label('tel')"/>  
              <input component="$UI/system/components/justep/input/input" class="form-control x-edit"
                xid="tel"/> 
            </div>  
            <div component="$UI/system/components/justep/labelEdit/labelEdit"
              class="x-label-edit x-label30" xid="labelInput5"> 
              <label class="x-label" xid="label5" bind-text="userData.label('address')"/>  
              <input component="$UI/system/components/justep/input/input" class="form-control x-edit"
                xid="address"/> 
            </div>  
            <div component="$UI/system/components/justep/row/row" class="x-row"
              xid="row3"> 
              <div class="x-col" xid="col7"> 
                <a component="$UI/system/components/justep/button/button"
                  class="btn btn-link pull-right" label="上一页" xid="button7" target="content8"> 
                  <i xid="i7"/>  
                  <span xid="span9">上一页</span> 
                </a> 
              </div>  
              <div class="x-col" xid="col6"> 
                <a component="$UI/system/components/justep/button/button"
                  class="btn btn-link" label="提交" xid="closeBtnClick" onClick="closeBtnClickClick"> 
                  <i xid="i8"/>  
                  <span xid="span8">提交</span> 
                </a> 
              </div> 
            </div> 
          </div> 
        </div> 
      </div> 
    </div>  
    <div class="x-panel-bottom" xid="bottom2"/> 
  </div> 
</div>
