<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window x-full-screen" component="$UI/system/components/justep/window/window"
  design="device:pc">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:306px;top:523px;"
    onLoad="modelLoad"> 
    <div component="$UI/system/components/justep/data/data" autoLoad="true"
      xid="inputData" idColumn="param_string"> 
      <column name="param_string" type="String" xid="default1"/>  
      <column name="param_integer" type="Integer" xid="default2"/>  
      <column name="param_long" type="Long" xid="default3"/>  
      <column name="param_double" type="Double" xid="default4"/>  
      <column name="param_float" type="Float" xid="default5"/>  
      <column name="param_datetime" type="DateTime" xid="default6"/>  
      <column name="param_date" type="Date" xid="default7"/>  
      <column name="param_time" type="Time" xid="default8"/>  
      <column name="param_boolean" type="Boolean" xid="default9"/>  
      <column name="param_decimal" type="Decimal" xid="default10"/>  
      <data xid="default11">[{"param_string":"北京起步科技有限公司","param_integer":2147483647,"param_long":2147483648,"param_double":123456.789,"param_float":123456.789,"param_datetime":"2012-12-31T23:59:59.999Z","param_date":"2012-12-31","param_time":"23:59:59","param_boolean":"true","param_decimal":987654321098.7654}]</data> 
    </div>  
    <div component="$UI/system/components/justep/data/bizData" xid="orgData"
      concept="SA_OPOrg"> 
      <reader xid="default12" action="/system/logic/action/queryOrgAction"/> 
    </div> 
  </div>  
  <div component="$UI/system/components/bootstrap/tabs/tabs" xid="tabs1" onSelect="tabs1Select"> 
    <ul class="nav nav-tabs" xid="tabNav1"> 
      <li class="active" xid="li7"> 
        <a content="tabContent1" xid="tabItem1"><![CDATA[调用动作-传参]]></a> 
      </li>  
      <li role="presentation" xid="li8"> 
        <a content="tabContent2" xid="tabItem2"><![CDATA[调用动作-返回]]></a> 
      </li>  
      <li xid="li9"> 
        <a content="tabContent3" xid="tabItem3"><![CDATA[同步和异步]]></a> 
      </li>  
      <li xid="li10"> 
        <a content="tabContent4" xid="tabItem4"><![CDATA[批请求]]></a> 
      </li>  
      <li xid="li11"> 
        <a content="tabContent5" xid="tabItem5"><![CDATA[form表单-post方式]]></a> 
      </li>  
      <li xid="li12"> 
        <a content="tabContent6" xid="tabItem6"><![CDATA[URL-get方式]]></a> 
      </li> 
    </ul>  
    <div class="tab-content" xid="div1" style="padding-top: 20px;"> 
      <div class="tab-pane active container-fluid" xid="tabContent1"> 
        <div class="panel panel-default" component="$UI/system/components/bootstrap/panel/panel"
          xid="panel2"> 
          <div class="panel-heading" xid="heading1"> 
            <h4 class="panel-title" xid="h41">案例说明</h4> 
          </div>  
          <div class="panel-body" xid="body1"> 
            <h5 xid="h51">X5的动作（Action）是服务端逻辑的模型封装，是业务服务器对外的唯一服务接口。在页面中一般通过平台提供的JS API-"biz.Request.sendBizRequest"以ajax的方式调用动作。</h5>  
            <h5 xid="h52">X5的动作支持各种类型的参数和返回值，本案例展示的是调用动作时如何传入各种类型的参数。本案例的服务端动作，参见动作模型文件“/BIZ/demo/actions/logic/action/invokeAction.action.m”中的demoActionParams。</h5> 
          </div> 
        </div>  
        <div class="panel panel-default" component="$UI/system/components/bootstrap/panel/panel"
          xid="panel10"> 
          <div class="panel-body" xid="body2"> 
            <div class="form-horizontal container-fluid" component="$UI/system/components/bootstrap/form/form"
              xid="form1"> 
              <div class="form-group" xid="formGroup1"> 
                <div class="col-sm-2" xid="col4"> 
                  <label class="control-label" xid="controlLabel1">string</label> 
                </div>  
                <div class="col-sm-4" xid="col5"> 
                  <input component="$UI/system/components/justep/input/input"
                    class="form-control" xid="input1" bind-ref="inputData.ref('param_string')"/> 
                </div>  
                <div class="col-sm-2" xid="col9"> 
                  <label class="control-label" xid="controlLabel2">integer</label> 
                </div>  
                <div class="col-sm-4" xid="col8"> 
                  <input component="$UI/system/components/justep/input/input"
                    class="form-control" xid="input2" bind-ref="inputData.ref('param_integer')"/> 
                </div> 
              </div>  
              <div class="form-group" xid="formGroup2"> 
                <div class="col-sm-2" xid="col1"> 
                  <label class="control-label" xid="controlLabel3">long</label> 
                </div>  
                <div class="col-sm-4" xid="col2"> 
                  <input component="$UI/system/components/justep/input/input"
                    class="form-control" xid="input3" bind-ref="inputData.ref('param_long')"/> 
                </div>  
                <div class="col-sm-2" xid="col3"> 
                  <label class="control-label" xid="controlLabel4">double</label> 
                </div>  
                <div class="col-sm-4" xid="col6"> 
                  <input component="$UI/system/components/justep/input/input"
                    class="form-control" xid="input4" bind-ref="inputData.ref('param_double')"/> 
                </div> 
              </div>  
              <div class="form-group" xid="formGroup11"> 
                <div class="col-sm-2" xid="col26"> 
                  <label class="control-label" xid="controlLabel5">float</label> 
                </div>  
                <div class="col-sm-4" xid="col28"> 
                  <input component="$UI/system/components/justep/input/input"
                    class="form-control" xid="input5" bind-ref="inputData.ref('param_float')"/> 
                </div>  
                <div class="col-sm-2" xid="col27"> 
                  <label class="control-label" xid="controlLabel6">datetime</label> 
                </div>  
                <div class="col-sm-4" xid="col7"> 
                  <input component="$UI/system/components/justep/input/input"
                    class="form-control" xid="input6" bind-ref="inputData.ref('param_datetime')"/> 
                </div> 
              </div>  
              <div class="form-group" xid="formGroup12"> 
                <div class="col-sm-2" xid="col30"> 
                  <label class="control-label" xid="controlLabel7">date</label> 
                </div>  
                <div class="col-sm-4" xid="col32"> 
                  <input component="$UI/system/components/justep/input/input"
                    class="form-control" xid="input7" bind-ref="inputData.ref('param_date')"/> 
                </div>  
                <div class="col-sm-2" xid="col31"> 
                  <label class="control-label" xid="controlLabel8">time</label> 
                </div>  
                <div class="col-sm-4" xid="col29"> 
                  <input component="$UI/system/components/justep/input/input"
                    class="form-control" xid="input8" bind-ref="inputData.ref('param_time')"/> 
                </div> 
              </div>  
              <div class="form-group" xid="formGroup13"> 
                <div class="col-sm-2" xid="col34"> 
                  <label class="control-label" xid="controlLabel9">boolean</label> 
                </div>  
                <div class="col-sm-4" xid="col36"> 
                  <input component="$UI/system/components/justep/input/input"
                    class="form-control" xid="input9" bind-ref="inputData.ref('param_boolean')"/> 
                </div>  
                <div class="col-sm-2" xid="col35"> 
                  <label class="control-label" xid="controlLabel10">decimal</label> 
                </div>  
                <div class="col-sm-4" xid="col33"> 
                  <input component="$UI/system/components/justep/input/input"
                    class="form-control" xid="input10" bind-ref="inputData.ref('param_decimal')"/> 
                </div> 
              </div>  
              <div class="form-group" xid="formGroup14"> 
                <div class="col-sm-4" xid="col39"> 
                  <a component="$UI/system/components/justep/button/button"
                    class="btn btn-success form-control" label="简单参数" xid="simpleParamBtn"
                    onClick="simpleParamBtnClick"> 
                    <i xid="i7"/>  
                    <span xid="span7">简单参数</span> 
                  </a> 
                </div>  
                <div class="col-sm-4" xid="col40"> 
                  <a component="$UI/system/components/justep/button/button"
                    class="btn btn-success form-control" label="List参数" xid="listParamBtn"
                    onClick="listParamBtnClick"> 
                    <i xid="i8"/>  
                    <span xid="span8">List参数</span> 
                  </a> 
                </div>  
                <div class="col-sm-4" xid="col41"> 
                  <a component="$UI/system/components/justep/button/button"
                    class="form-control btn btn-success" label="Map参数" xid="mapParamBtn"
                    onClick="mapParamBtnClick"> 
                    <i xid="i9"/>  
                    <span xid="span9"/> 
                  </a> 
                </div> 
              </div>  
              <div class="form-group" xid="formGroup15"> 
                <div class="col-sm-4" xid="col43"> 
                  <a component="$UI/system/components/justep/button/button"
                    class="form-control btn btn-success" label="XML参数" xid="xmlParamBtn"
                    onClick="xmlParamBtnClick"> 
                    <i xid="i10"/>  
                    <span xid="span10"/> 
                  </a> 
                </div>  
                <div class="col-sm-4" xid="col44"> 
                  <a component="$UI/system/components/justep/button/button"
                    class="form-control btn btn-success" label="Table参数" xid="tableParamBtn"
                    onClick="tableParamBtnClick"> 
                    <i xid="i11"/>  
                    <span xid="span11"/> 
                  </a> 
                </div>  
                <div class="col-sm-4" xid="col47"> 
                  <a component="$UI/system/components/justep/button/button"
                    class="form-control btn btn-success" label="自定义对象参数" xid="objectParamBtn"
                    onClick="objectParamBtnClick"> 
                    <i xid="i12"/>  
                    <span xid="span12"/> 
                  </a> 
                </div> 
              </div> 
            </div> 
          </div> 
        </div> 
      </div>  
      <div class="tab-pane container-fluid" xid="tabContent2"> 
        <div class="panel panel-default" component="$UI/system/components/bootstrap/panel/panel"
          xid="panel6"> 
          <div class="panel-heading" xid="heading2"> 
            <h4 class="panel-title" xid="h46">案例说明</h4> 
          </div>  
          <div class="panel-body" xid="body4"> 
            <h5 xid="h54">X5的动作（Action）是服务端逻辑的模型封装，是业务服务器对外的唯一服务接口。在页面中一般通过平台提供的JS API-"biz.Request.sendBizRequest"以ajax的方式调用动作。</h5>  
            <h5 xid="h53">X5的动作支持各种类型的参数和返回值，本案例展示的是调用动作时，如何接收各种类型的返回值。本案例的服务端动作，参见动作模型文件“/BIZ/demo/actions/logic/action/invokeAction.action.m”的demoReturnSimple、demoReturnList、demoReturnMap、demoReturnXML、demoReturnTable、demoReturnObject。</h5> 
          </div> 
        </div>  
        <div class="form-horizontal container-fluid" component="$UI/system/components/bootstrap/form/form"
          xid="form2"> 
          <div class="form-group" xid="formGroup16"> 
            <div class="col-sm-4" xid="col48"> 
              <a component="$UI/system/components/justep/button/button" class="btn btn-success form-control"
                label="返回简单值" xid="returnSimpleBtn" onClick="returnSimpleBtnClick"> 
                <i xid="i3"/>  
                <span xid="span6">返回简单值</span> 
              </a> 
            </div>  
            <div class="col-sm-4" xid="col49"> 
              <a component="$UI/system/components/justep/button/button" class="btn btn-success form-control"
                label="返回List" xid="returnListBtn" onClick="returnListBtnClick"> 
                <i xid="i2"/>  
                <span xid="span4">List参数</span> 
              </a> 
            </div>  
            <div class="col-sm-4" xid="col50"> 
              <a component="$UI/system/components/justep/button/button" class="form-control btn btn-success"
                label="返回Map" xid="returnMapBtn" onClick="returnMapBtnClick"> 
                <i xid="i1"/>  
                <span xid="span5"/> 
              </a> 
            </div> 
          </div>  
          <div class="form-group" xid="formGroup17"> 
            <div class="col-sm-4" xid="col52"> 
              <a component="$UI/system/components/justep/button/button" class="form-control btn btn-success"
                label="返回XML" xid="returnXMLBtn" onClick="returnXMLBtnClick"> 
                <i xid="i4"/>  
                <span xid="span3"/> 
              </a> 
            </div>  
            <div class="col-sm-4" xid="col53"> 
              <a component="$UI/system/components/justep/button/button" class="form-control btn btn-success"
                label="返回Table" xid="returnTableBtn" onClick="returnTableBtnClick"> 
                <i xid="i5"/>  
                <span xid="span2"/> 
              </a> 
            </div>  
            <div class="col-sm-4" xid="col54"> 
              <a component="$UI/system/components/justep/button/button" class="form-control btn btn-success"
                label="返回自定义对象" xid="returnObjectBtn" onClick="returnObjectBtnClick"> 
                <i xid="i6"/>  
                <span xid="span1"/> 
              </a> 
            </div> 
          </div> 
        </div> 
      </div>  
      <div class="tab-pane" xid="tabContent3"> 
        <div class="panel panel-default" component="$UI/system/components/bootstrap/panel/panel"
          xid="panel7"> 
          <div class="panel-heading" xid="heading8"> 
            <h4 class="panel-title" xid="h47">案例说明</h4> 
          </div>  
          <div class="panel-body" xid="body7"> 
            <h5 xid="h55">X5的动作（Action）是服务端逻辑的模型封装，是业务服务器对外的唯一服务接口。在页面中一般通过平台提供的JS API-"biz.Request.sendBizRequest"以ajax的方式调用动作。</h5>  
            <h5 xid="h56">biz.Request.sendBizRequest和biz.Request.sendAsyncBizRequest分别支持同步和异步两种调用方式。同步调用时，请求发出后当前线程会等待直到请求结束结果返回，才执行后续代码。异步调用时，请求发出后当前线程不等待请求结束，直接执行后续代码；而在请求结束后通过回调函数返回执行结果。</h5>  
            <h5 xid="h57"><![CDATA[为了便于观察代码执行的前后情况，本案例的服务端动作做了三秒的延时，参见动作模型文件“/BIZ/demo/actions/logic/action/invokeAction.action.m”的demoAsync。]]></h5> 
          </div> 
        </div>  
        <div class="form-horizontal container-fluid" component="$UI/system/components/bootstrap/form/form"
          xid="form3"> 
          <div class="form-group" xid="formGroup18"> 
            <div class="col-sm-6" xid="col56"> 
              <a component="$UI/system/components/justep/button/button" class="btn btn-success form-control"
                label="sendBizRequest - 同步调用" xid="syncBtn" onClick="syncBtnClick"> 
                <i xid="i16"/>  
                <span xid="span13">sendBizRequest - 同步调用</span> 
              </a> 
            </div>  
            <div class="col-sm-6" xid="col58"> 
              <a component="$UI/system/components/justep/button/button" class="btn btn-success form-control"
                label="sendAsyncBizRequest - 异步调用" xid="asyncBtn" onClick="asyncBtnClick"> 
                <i xid="i17"/>  
                <span xid="span14">sendAsyncBizRequest - 异步调用</span> 
              </a> 
            </div> 
          </div> 
        </div> 
      </div>  
      <div class="tab-pane" xid="tabContent4"> 
        <div class="panel panel-default" component="$UI/system/components/bootstrap/panel/panel"
          xid="panel1"> 
          <div class="panel-heading" xid="heading5"> 
            <h4 class="panel-title" xid="h42">案例说明</h4> 
          </div>  
          <div class="panel-body" xid="body3"> 
            <h5 xid="h510">X5的动作（Action）是服务端逻辑的模型封装，是业务服务器对外的唯一服务接口。在页面中一般通过平台提供的JS API-"biz.Request.sendBizRequest"以ajax的方式调用动作。</h5>  
            <h5 xid="h59"><![CDATA[有时需要在一个业务请求中执行多个服务端动作，并且要求在一个事务中，这就是动作的批请求模式。在批请求模式中，多个动作并不是立即执行的，而是缓存并打包成一个请求后统一发到BIZ服务器；在请求结束后再通过回调函数返回每个动作的执行结果。]]></h5>  
            <h5 xid="h58"><![CDATA[很明显，在批请求模式中，对于每个动作来说都是以异步方式执行的。如果有特殊情况，在批模式下但是需要执行一个动作并同步返回结果，可以在执行biz.Request.sendBizRequest时设置选项"directExecute"=true。另外要注意的是，data和process等组件的动作执行时会自动开启批模式，因此在这些组件的事件代码中调用动作默认是异步方式的，如果以同步方式调用也需要设置选项"directExecute"=true。]]></h5>  
            <h5 xid="h511"><![CDATA[批请求相关的API-biz.Request.beginBatch（开启批）、biz.Request.endBatch（结束批）、biz.Request.cancelBatch（取消批）。本案例的服务端动作，参见动作模型文件“/BIZ/demo/actions/logic/action/invokeAction.action.m”的demoBatchAction1、demoBatchAction2。]]></h5> 
          </div> 
        </div>  
        <div class="form-horizontal container-fluid" component="$UI/system/components/bootstrap/form/form"
          xid="form4"> 
          <div class="form-group" xid="formGroup3"> 
            <div class="col-sm-3" xid="col10"> 
              <span component="$UI/system/components/justep/button/checkbox"
                class="x-checkbox" xid="directExecuteBox" label="第一个动作立即执行"/> 
            </div>  
            <div class="col-sm-3" xid="col11"> 
              <a component="$UI/system/components/justep/button/button" class="btn btn-success form-control"
                label="执行批请求" xid="batchBtn" onClick="batchBtnClick"> 
                <i xid="i13"/>  
                <span xid="span15">执行批请求</span> 
              </a> 
            </div> 
          </div> 
        </div> 
      </div>  
      <div class="tab-pane" xid="tabContent5"> 
        <form xid="postForm" enctype="multipart/form-data"
          accept="application/json" method="post" action="/UI2/system/service/common/bizAction.j"
          target="postResultIframe" class="form-horizontal container-fluid"> 
          <div class="form-group" xid="formGroup9"> 
            <div class="col-sm-2" xid="col37"> 
              <label class="control-label" xid="controlLabel15"><![CDATA[file]]></label> 
            </div>  
            <div class="col-sm-10" xid="col38"> 
              <input class="form-control" xid="uploadFile" name="file" type="file" /> 
            </div> 
          </div><div class="form-group" xid="formGroup19"> 
            <div class="col-sm-3" xid="col46"> 
              <a component="$UI/system/components/justep/button/button" class="btn btn-success form-control" label="上传文件（Post）" xid="postBtn" onClick="postBtnClick"> 
                <i xid="i14" />  
                <span xid="span16">上传文件（Post）</span> 
              </a> 
            </div> 
          </div><div class="form-group" xid="formGroup4">
   <div class="col-sm-2" xid="col14">
    <label class="control-label" xid="controlLabel11">process</label></div> 
   <div class="col-sm-10" xid="col15">
    <input class="form-control" xid="input11" name="process" value="/demo/actions/process/invokeAction/invokeActionProcess"></input></div> </div><div class="form-group" xid="formGroup5">
   <div class="col-sm-2" xid="col18">
    <label class="control-label" xid="controlLabel12">activity</label></div> 
   <div class="col-sm-10" xid="col19">
    <input class="form-control" xid="input12" name="activity" value="mainActivity"></input></div> </div><div class="form-group" xid="formGroup6">
   <div class="col-sm-2" xid="col20">
    <label class="control-label" xid="controlLabel13">action</label></div> 
   <div class="col-sm-10" xid="col21">
    <input class="form-control" xid="input13" name="action" value="demoUploadFile"></input></div> </div><div class="form-group" xid="formGroup8">
   <div class="col-sm-2" xid="col24">
    <label class="control-label" xid="controlLabel14">fileName</label></div> 
   <div class="col-sm-10" xid="col25">
    <input class="form-control" xid="uploadFileName" name="fileName"></input></div> </div>  
          <div class="form-group" xid="formGroup10">
   <div class="col-sm-2" xid="col45">
    <label class="control-label" xid="controlLabel17">接收返回内容</label></div> 
   <div class="col-sm-10" xid="col42">
    <iframe src="" xid="postResultIframe" name="postResultIframe" width="100%" height="100px"></iframe></div> </div> 
        </form> 
      </div>  
      <div class="tab-pane" xid="tabContent6"><div class="form-horizontal container-fluid" component="$UI/system/components/bootstrap/form/form" xid="form7"><div class="form-group" xid="formGroup22">
   <div class="col-sm-3" xid="col68"><a component="$UI/system/components/justep/button/button" class="btn btn-success form-control" label="显示图片" xid="showImageBtn" onClick="showImageBtnClick">
   <i xid="i18"></i>
   <span xid="span18">显示图片</span></a></div>
   <div class="col-sm-3" xid="col69"><a component="$UI/system/components/justep/button/button" class="btn btn-success form-control" label="下载文件" xid="downloadFileBtn" onClick="downloadFileBtnClick">
   <i xid="i19"></i>
   <span xid="span19">下载文件</span></a></div>
   </div><div class="form-group" xid="formGroup20">
   <div class="col-sm-2" xid="col59"><label class="control-label" xid="controlLabel18"><![CDATA[文件名]]></label></div>
   <div class="col-sm-4" xid="col60"><input type="text" value="demo.gif" xid="downloadFileName" class="form-control"></input></div>
   <div class="col-sm-6" xid="col63"><label class="control-label" xid="controlLabel19"><![CDATA[服务端文件，可以使用前一个案例中上传的文件]]></label></div></div>
  <div class="form-group" xid="formGroup21">
   <div class="col-sm-2" xid="col64"><label class="control-label" xid="controlLabel20"><![CDATA[图片]]></label></div>
   <div class="col-sm-10" xid="col65"><img src="" alt="" xid="showImage" class="img-responsive"></img></div>
   </div>
  </div></div> 
    </div> 
  </div>  
  <div class="panel panel-default" component="$UI/system/components/bootstrap/panel/panel" xid="panel5"> 
    <div class="panel-heading" xid="heading4"> 
      <h4 class="panel-title" xid="h44"> 
        <a xid="a10">返回结果</a> 
      </h4> 
    </div>  
    <div class="panel-body" xid="result" /> 
  </div><div class="panel panel-default" component="$UI/system/components/bootstrap/panel/panel"
    xid="panel4"> 
    <div class="panel-heading" xid="heading3"> 
      <h4 class="panel-title" xid="h43"> 
        <a xid="a9">执行代码</a> 
      </h4> 
    </div>  
    <div class="panel-body" xid="code"/> 
  </div>  
   
</div>
