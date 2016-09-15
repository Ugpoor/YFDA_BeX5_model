<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window mobile-login" component="$UI/system/components/justep/window/window"
  sysParam="false" design="device:m;">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:679px;top:95px;"
    onLoad="modelLoad"> 
    <div component="$UI/system/components/justep/data/data" xid="langs" idColumn="fName"
      autoLoad="true"> 
      <column name="fName" type="String" label="名称"/>  
      <column name="fLabel" type="String" label="显示名称"/>  
      <rule xid="rule1"/>  
      <data xid="default1">[{"fName":"zh_CN","fLabel":"中文"}]</data> 
    </div> 
  </div>  
  <span component="$UI/system/components/justep/windowReceiver/windowReceiver"
    xid="receiver"/>  
  <div class="page-login"> 
    <div class="page-header" style="text-align: center;font-size: 24px; margin-top:0; padding-top: 24px;"> 
      <div class="form-container" align="center">CloudX5登录</div> 
    </div>  
    <div class="page-body" style="padding: 10px;"> 
      <div class="form-container" style="max-width: 420px;margin: 0 auto;padding: 0 15px;"> 
        <form class="form-horizontal ng-pristine ng-valid"> 
          <fieldset> 
            <div class="form-group"> 
              <div class="input-group"> 
                <span class="input-group-addon"> 
                  <span class="glyphicon glyphicon-envelope"/> 
                </span>  
                <input component="$UI/system/components/justep/input/input" class="form-control"
                  xid="name" placeHolder="用户名"/> 
              </div> 
            </div>  
            <div class="form-group"> 
              <div class="input-group"> 
                <span class="input-group-addon"> 
                  <span class="glyphicon glyphicon-lock"/> 
                </span>  
                <input component="$UI/system/components/justep/input/password"
                  class="form-control" xid="password" placeHolder="密码"/> 
              </div> 
            </div>  
            <div class="form-group"> 
              <a component="$UI/system/components/justep/button/button" class="btn btn-default btn-block"
                label="登录" xid="login" onClick="loginClick"> 
                <i xid="i1"/>  
                <span xid="span1">登录</span> 
              </a> 
            </div>  
            <div class="form-group"> 
              <div component="$UI/system/components/justep/row/row" class="x-row"
                xid="row1"> 
                <div class="x-col x-col-23" xid="col1"> 
                  <span component="$UI/system/components/justep/button/checkbox"
                    class="x-checkbox" xid="noDisplay" label="不再自动显示" onChange="noDisplayChange"
                    bind-click="noDisplayClick"/>
                </div>  
                <div class="x-col" xid="col2"></div>  
                <div class="x-col" xid="col3" style="text-align:center;"> 
                  <a style="margin-top:4px;display:inline-block;" xid="regBtn"
                    bind-click="regBtnClick">注册</a> 
                </div> 
              </div> 
            </div> 
          </fieldset> 
        </form> 
      </div>  
    </div>  
    <div xid="dialog"/> 
  </div> 
</div>
