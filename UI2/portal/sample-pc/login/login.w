<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window portal-login-page" component="$UI/system/components/justep/window/window" sysParam="false">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:256px;top:6px;"
    onLoad="modelLoad"> 
    <div component="$UI/system/components/justep/data/data" xid="langs" idColumn="fName" autoLoad="true"> 
      <column name="fName" type="String" label="名称"/>  
      <column name="fLabel" type="String" label="显示名称"/>  
      <rule xid="rule1"/>  
      <data><![CDATA[
      [{fName:'zh_CN', fLabel:'中文'}]
      ]]></data> 
    </div> 
  </div>  
  <span component="$UI/system/components/justep/windowReceiver/windowReceiver" xid="receiver" style="left:19px;top:14px;"></span><div class="page-login"> 
    <div class="page-header" style="text-align: center;font-size: 24px; margin-top:0; padding-top: 24px;"> 
      <div class="form-container" align="center">登录WeX5</div> 
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
              <div component="$UI/system/components/justep/row/row" class="row"
                xid="row1"> 
                <div class="col-xs-3" xid="col1">
                  <span component="$UI/system/components/justep/button/checkbox"
                    class="x-checkbox" xid="remember" label="记住我" onChange="rememberChange"/>
                </div>  
                <div class="col-xs-3" xid="col2">
                  <span component="$UI/system/components/justep/button/checkbox"
                    class="x-checkbox" xid="autoLogin" label="自动登录" onChange="autoLoginChange"/>
                </div>
                <div class="x-col lang-switch" xid="col9" style="display:none;">
                  <a component="$UI/system/components/justep/button/button"
                    class="btn btn-link show-langs" label="显示语言选择" xid="showLangBtn" style="padding-top: 0px;margin-top:-2px;float:right;" onClick="showLangBtnClick"> 
                    <i xid="i3"/>  
                    <span xid="span3">显示语言选择</span>
                  </a>
                  <a component="$UI/system/components/justep/button/button"
                    class="btn btn-link hide-langs" label="隐藏语言选择" xid="hideLangBtn" style="padding-top: 0px;margin-top:-2px;float:right;display:none;" onClick="hideLangBtnClick"> 
                    <i xid="i11"/>  
                    <span xid="span33">隐藏语言选择</span>
                  </a>
                </div> 
                 
                  
                </div> 
            </div>
            <div class="form-group"> 
              <div class="input-group login-lang" style="display:none;"> 
                <span class="input-group-addon"> 
                  <span class="glyphicon glyphicon-flag"/> 
                </span>  
              <select component="$UI/system/components/justep/select/select" class="form-control"
                xid="lang" bind-options="langs" bind-optionsLabel="fLabel" bind-optionsValue="fName" onChange="langChange"/> 
              </div> 
            </div>  
          </fieldset> 
        </form> 
      </div> 
    </div> 
  </div> 
</div>
