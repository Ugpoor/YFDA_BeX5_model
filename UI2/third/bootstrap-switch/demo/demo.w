<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window" component="$UI/system/components/justep/window/window">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="position:absolute;height:auto;left:453px;top:68px;"
    onLoad="modelLoad"></div>  
  <div component="$UI/system/components/justep/panel/panel" class="x-panel x-full"
    xid="panel1"> 
    <div class="x-panel-top" xid="top1"> 
      <div component="$UI/system/components/justep/titleBar/titleBar" class="x-titlebar"
        xid="titleBar1" title="bootstrap-switch"> 
        <div class="x-titlebar-left" xid="div1"> 
          <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-only-icon"
            xid="button1" onClick="{operation:'window.close'}" icon="icon-chevron-left"> 
            <i xid="i1" class="icon-chevron-left"/>  
            <span xid="span1"/> 
          </a> 
        </div>  
        <div class="x-titlebar-title" xid="div2">bootstrap-switch</div>  
        <div class="x-titlebar-right reverse" xid="div3"/> 
      </div> 
    </div>  
    <div class="x-panel-content" xid="content1"> 
      <div class="container"> 
        <div class="row"> 
          <div class="col-sm-6 col-lg-4"> 
            <h2 class="h4">State</h2>  
            <p> 
              <input xid="switch-state" type="checkbox" checked="true"/> 
            </p>  
            <div class="btn-group"> 
              <button type="button" data-switch-toggle="state" class="btn btn-default">Toggle</button>  
              <button type="button" data-switch-set="state" data-switch-value="true"
                class="btn btn-default">Set true</button>  
              <button type="button" data-switch-set="state" data-switch-value="false"
                class="btn btn-default">Set false</button>  
              <button type="button" data-switch-get="state" class="btn btn-default">Get</button> 
            </div> 
          </div>  
          <div class="col-sm-6 col-lg-4"> 
            <h2 class="h4">Size</h2>  
            <p> 
              <input xid="switch-size" type="checkbox" checked="true" data-size="mini"/> 
            </p>  
            <div class="btn-group"> 
              <button type="button" data-switch-set="size" data-switch-value="mini"
                class="btn btn-default">Mini</button>  
              <button type="button" data-switch-set="size" data-switch-value="small"
                class="btn btn-default">Small</button>  
              <button type="button" data-switch-set="size" data-switch-value="normal"
                class="btn btn-default">Normal</button>  
              <button type="button" data-switch-set="size" data-switch-value="large"
                class="btn btn-default">Large</button>  
              <button type="button" data-switch-get="size" class="btn btn-default">Get</button> 
            </div> 
          </div>  
          <div class="col-sm-6 col-lg-4"> 
            <h2 class="h4">Animate</h2>  
            <p> 
              <input xid="switch-animate" type="checkbox" checked="true"/> 
            </p>  
            <p> 
              <button type="button" data-switch-toggle="animate" class="btn btn-default">Toggle</button>  
              <button type="button" data-switch-get="animate" class="btn btn-default">Get</button> 
            </p> 
          </div>  
          <div class="col-sm-6 col-lg-4"> 
            <h2 class="h4">Disabled</h2>  
            <p> 
              <input xid="switch-disabled" type="checkbox" checked="true" disabled="true"/> 
            </p>  
            <p> 
              <button type="button" data-switch-toggle="disabled" class="btn btn-default">Toggle</button>  
              <button type="button" data-switch-get="disabled" class="btn btn-default">Get</button> 
            </p> 
          </div>  
          <div class="col-sm-6 col-lg-4"> 
            <h2 class="h4">Readonly</h2>  
            <p> 
              <input xid="switch-readonly" type="checkbox" checked="true" readonly="true"/> 
            </p>  
            <p> 
              <button type="button" data-switch-toggle="readonly" class="btn btn-default">Toggle</button>  
              <button type="button" data-switch-get="readonly" class="btn btn-default">Get</button> 
            </p> 
          </div>  
          <div class="col-sm-6 col-lg-4"> 
            <h2 class="h4">Indeterminate</h2>  
            <p> 
              <input xid="switch-indeterminate" type="checkbox" checked="true"
                data-indeterminate="true"/> 
            </p>  
            <p> 
              <button type="button" data-switch-toggle="indeterminate" class="btn btn-default">Toggle</button>  
              <button type="button" data-switch-get="indeterminate" class="btn btn-default">Get</button> 
            </p> 
          </div>  
          <div class="col-sm-6 col-lg-4"> 
            <h2 class="h4">Inverse</h2>  
            <p> 
              <input xid="switch-inverse" type="checkbox" checked="true" data-inverse="true"/> 
            </p>  
            <p> 
              <button type="button" data-switch-toggle="inverse" class="btn btn-default">Toggle</button>  
              <button type="button" data-switch-get="inverse" class="btn btn-default">Get</button> 
            </p> 
          </div>  
          <div class="col-sm-6 col-lg-4"> 
            <h2 class="h4">On Color</h2>  
            <p> 
              <input xid="switch-onColor" type="checkbox" checked="true" data-on-color="info"/> 
            </p>  
            <p class="btn-group"> 
              <div class="btn-group"> 
                <button type="button" data-toggle="dropdown" class="btn btn-default dropdown-toggle">Set
                  <span class="caret"/>
                </button>  
                <div role="menu" class="dropdown-menu"> 
                  <li>
                    <a data-switch-set="onColor" data-switch-value="primary">Primary</a>
                  </li>  
                  <li>
                    <a data-switch-set="onColor" data-switch-value="info">Info</a>
                  </li>  
                  <li>
                    <a data-switch-set="onColor" data-switch-value="success">Success</a>
                  </li>  
                  <li>
                    <a data-switch-set="onColor" data-switch-value="warning">Warning</a>
                  </li>  
                  <li>
                    <a data-switch-set="onColor" data-switch-value="default">Default</a>
                  </li> 
                </div> 
              </div>  
              <button type="button" data-switch-get="onColor" class="btn btn-default">Get</button> 
            </p> 
          </div>  
          <div class="col-sm-6 col-lg-4"> 
            <h2 class="h4">Off Color</h2>  
            <p> 
              <input xid="switch-offColor" type="checkbox" data-off-color="warning"/> 
            </p>  
            <p class="btn-group"> 
              <div class="btn-group"> 
                <button type="button" data-toggle="dropdown" class="btn btn-default dropdown-toggle">Set
                  <span class="caret"/>
                </button>  
                <div role="menu" class="dropdown-menu"> 
                  <li>
                    <a data-switch-set="offColor" data-switch-value="primary">Primary</a>
                  </li>  
                  <li>
                    <a data-switch-set="offColor" data-switch-value="info">Info</a>
                  </li>  
                  <li>
                    <a data-switch-set="offColor" data-switch-value="success">Success</a>
                  </li>  
                  <li>
                    <a data-switch-set="offColor" data-switch-value="warning">Warning</a>
                  </li>  
                  <li>
                    <a data-switch-set="offColor" data-switch-value="default">Default</a>
                  </li> 
                </div> 
              </div>  
              <button type="button" data-switch-get="offColor" class="btn btn-default">Get</button> 
            </p> 
          </div>  
          <div class="col-sm-6 col-lg-4"> 
            <h2 class="h4">On Text</h2>  
            <p> 
              <input xid="switch-onText" type="checkbox" checked="true" data-on-text="Yes"/> 
            </p>  
            <div class="row"> 
              <div class="col-sm-6"> 
                <input type="text" data-switch-set-value="onText" value="Yes"
                  class="form-control"/> 
              </div> 
            </div> 
          </div>  
          <div class="col-sm-6 col-lg-4"> 
            <h2 class="h4">Off Text</h2>  
            <p> 
              <input xid="switch-offText" type="checkbox" data-off-text="No"/> 
            </p>  
            <div class="row"> 
              <div class="col-sm-6"> 
                <input type="text" data-switch-set-value="offText" value="No"
                  class="form-control"/> 
              </div> 
            </div> 
          </div>  
          <div class="col-sm-6 col-lg-4"> 
            <h2 class="h4">Label Text</h2>  
            <p> 
              <input xid="switch-labelText" type="checkbox" data-label-text="Label"/> 
            </p>  
            <div class="row"> 
              <div class="col-sm-6"> 
                <input type="text" data-switch-set-value="labelText" class="form-control"/> 
              </div> 
            </div> 
          </div>  
          <div class="col-sm-6 col-lg-4"> 
            <h2 class="h4">Handle Width</h2>  
            <p> 
              <input xid="switch-handleWidth" type="checkbox" data-handle-width="100"/> 
            </p>  
            <div class="row"> 
              <div class="col-sm-6"> 
                <input type="number" data-switch-set-value="handleWidth" value="100"
                  class="form-control"/> 
              </div> 
            </div> 
          </div>  
          <div class="col-sm-6 col-lg-4"> 
            <h2 class="h4">Label Width</h2>  
            <p> 
              <input xid="switch-labelWidth" type="checkbox" data-label-width="100"/> 
            </p>  
            <div class="row"> 
              <div class="col-sm-6"> 
                <input type="number" data-switch-set-value="labelWidth" value="100"
                  class="form-control"/> 
              </div> 
            </div> 
          </div>  
          <div class="col-sm-6 col-lg-4"> 
            <h2 class="h4">Create | Destroy</h2>  
            <p> 
              <input xid="switch-create-destroy" type="checkbox" checked="true"
                data-switch-no-init=""/> 
            </p>  
            <div class="row"> 
              <div class="col-sm-6"> 
                <button type="button" data-switch-create-destroy="" data-destroy-text="Destroy"
                  class="btn btn-default">Create</button> 
              </div> 
            </div> 
          </div> 
        </div>
        <br/>
        <br/>  
        <div class="text-center"> 
          <h2 class="h4">Radio All Off</h2>  
          <div class="row"> 
            <div class="col-sm-6"> 
              <h3 class="h5">Disabled</h3>  
              <input type="radio" name="radio1" checked="true" class="switch-radio1"/>  
              <input type="radio" name="radio1" class="switch-radio1"/>  
              <input type="radio" name="radio1" class="switch-radio1"/> 
            </div>  
            <div class="col-sm-6"> 
              <h3 class="h5">Enabled</h3>  
              <input type="radio" name="radio2" checked="true" data-radio-all-off="true"
                class="switch-radio2"/>  
              <input type="radio" name="radio2" data-radio-all-off="true" class="switch-radio2"/>  
              <input type="radio" name="radio2" data-radio-all-off="true" class="switch-radio2"/> 
            </div> 
          </div>
          <br/>  
          <hr/>  
          <h2 class="h4">Inside Modals</h2>  
          <button data-toggle="modal" data-target="#modal-switch" class="btn btn-default">Open Modal</button>  
          <div xid="modal-switch" tabindex="-1" role="dialog" aria-labelledby="modal-switch-label"
            class="modal fade"> 
            <div class="modal-dialog"> 
              <div class="modal-content"> 
                <div class="modal-header"> 
                  <button type="button" data-dismiss="modal" class="close">
                    <span aria-hidden="true"/>
                    <span class="sr-only">Close</span>
                  </button>  
                  <div xid="modal-switch-label" class="modal-title">Title</div> 
                </div>  
                <div class="modal-body"> 
                  <input xid="switch-modal" type="checkbox" checked="true"/> 
                </div> 
              </div> 
            </div> 
          </div> 
        </div> 
      </div> 
    </div> 
  </div> 
</div>
