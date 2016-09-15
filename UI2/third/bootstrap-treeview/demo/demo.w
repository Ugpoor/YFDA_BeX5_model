<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window" component="$UI/system/components/justep/window/window">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="position:absolute;height:auto;left:453px;top:68px;"
    onLoad="modelLoad"/>  
  <div component="$UI/system/components/justep/panel/panel" class="x-panel x-full"
    xid="panel1"> 
    <div class="x-panel-top" xid="top1"> 
      <div component="$UI/system/components/justep/titleBar/titleBar" class="x-titlebar"
        xid="titleBar1" title="bootstrap-treeview"> 
        <div class="x-titlebar-left" xid="div1"> 
          <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-only-icon"
            xid="button1" onClick="{operation:'window.close'}" icon="icon-chevron-left"> 
            <i xid="i1" class="icon-chevron-left"/>  
            <span xid="span1"/> 
          </a> 
        </div>  
        <div class="x-titlebar-title" xid="div2">bootstrap-treeview</div>  
        <div class="x-titlebar-right reverse" xid="div3"/> 
      </div> 
    </div>  
    <div class="x-panel-content" xid="content1"> 
      <div class="container"> 
        <h1>Bootstrap Tree View</h1>  
        <br/>  
        <div class="row"> 
          <div class="col-sm-4"> 
            <h2>Default</h2>  
            <div id="treeview1" class=""/> 
          </div>  
          <div class="col-sm-4"> 
            <h2>Collapsed</h2>  
            <div id="treeview2" class=""/> 
          </div>  
          <div class="col-sm-4"> 
            <h2>Expanded</h2>  
            <div id="treeview3" class=""/> 
          </div> 
        </div>  
        <div class="row"> 
          <div class="col-sm-4"> 
            <h2>Blue Theme</h2>  
            <div id="treeview4" class=""/> 
          </div>  
          <div class="col-sm-4"> 
            <h2>Custom Icons</h2>  
            <div id="treeview5" class=""/> 
          </div>  
          <div class="col-sm-4"> 
            <h2>Tags as Badges</h2>  
            <div id="treeview6" class=""/> 
          </div> 
        </div>  
        <div class="row"> 
          <div class="col-sm-4"> 
            <h2>No Border</h2>  
            <div id="treeview7" class=""/> 
          </div>  
          <div class="col-sm-4"> 
            <h2>Colourful</h2>  
            <div id="treeview8" class=""/> 
          </div>  
          <div class="col-sm-4"> 
            <h2>Node Overrides</h2>  
            <div id="treeview9" class=""/> 
          </div> 
        </div>  
        <div class="row"> 
          <div class="col-sm-4"> 
            <h2>Link enabled, or</h2>  
            <div id="treeview10" class=""/> 
          </div>  
          <div class="col-sm-4"></div>  
          <div class="col-sm-4"></div> 
        </div>  
        <div class="row"> 
          <hr/>  
          <h2>Searchable Tree</h2>  
          <div class="col-sm-4"> 
            <h2>Input</h2>  
            <!-- <form> -->  
            <div class="form-group"> 
              <label for="input-search" class="sr-only">Search Tree:</label>  
              <input type="input" class="form-control" id="input-search" placeholder="Type to search..."
                value=""/> 
            </div>  
            <div class="checkbox"> 
              <label> 
                <input type="checkbox" class="checkbox" id="chk-ignore-case"
                  value="false"/> Ignore Case
              </label> 
            </div>  
            <div class="checkbox"> 
              <label> 
                <input type="checkbox" class="checkbox" id="chk-exact-match"
                  value="false"/> Exact Match
              </label> 
            </div>  
            <div class="checkbox"> 
              <label> 
                <input type="checkbox" class="checkbox" id="chk-reveal-results"
                  value="false"/> Reveal Results
              </label> 
            </div>  
            <button type="button" class="btn btn-success" id="btn-search">Search</button>  
            <button type="button" class="btn btn-default" id="btn-clear-search">Clear</button>  
            <!-- </form> --> 
          </div>  
          <div class="col-sm-4"> 
            <h2>Tree</h2>  
            <div id="treeview-searchable" class=""/> 
          </div>  
          <div class="col-sm-4"> 
            <h2>Results</h2>  
            <div id="search-output"/> 
          </div> 
        </div>  
        <div class="row"> 
          <hr/>  
          <h2>Selectable Tree</h2>  
          <div class="col-sm-4"> 
            <h2>Input</h2>  
            <div class="form-group"> 
              <label for="input-select-node" class="sr-only">Search Tree:</label>  
              <input type="input" class="form-control" id="input-select-node"
                placeholder="Identify node..." value="Parent 1"/> 
            </div>  
            <div class="checkbox"> 
              <label> 
                <input type="checkbox" class="checkbox" id="chk-select-multi"
                  value="false"/> Multi Select
              </label> 
            </div>  
            <div class="checkbox"> 
              <label> 
                <input type="checkbox" class="checkbox" id="chk-select-silent"
                  value="false"/> Silent (No events)
              </label> 
            </div>  
            <div class="form-group"> 
              <button type="button" class="btn btn-success select-node" id="btn-select-node">Select Node</button> 
            </div>  
            <div class="form-group"> 
              <button type="button" class="btn btn-danger select-node" id="btn-unselect-node">Unselect Node</button> 
            </div>  
            <div class="form-group"> 
              <button type="button" class="btn btn-primary select-node" id="btn-toggle-selected">Toggle Node</button> 
            </div> 
          </div>  
          <div class="col-sm-4"> 
            <h2>Tree</h2>  
            <div id="treeview-selectable" class=""/> 
          </div>  
          <div class="col-sm-4"> 
            <h2>Events</h2>  
            <div id="selectable-output"/> 
          </div> 
        </div>  
        <div class="row"> 
          <hr/>  
          <h2>Expandible Tree</h2>  
          <div class="col-sm-4"> 
            <h2>Input</h2>  
            <div class="form-group"> 
              <label for="input-expand-node" class="sr-only">Search Tree:</label>  
              <input type="input" class="form-control" id="input-expand-node"
                placeholder="Identify node..." value="Parent 1"/> 
            </div>  
            <div class="checkbox"> 
              <label> 
                <input type="checkbox" class="checkbox" id="chk-expand-silent"
                  value="false"/> Silent (No events)
              </label> 
            </div>  
            <div class="form-group row"> 
              <div class="col-sm-6"> 
                <button type="button" class="btn btn-success expand-node" id="btn-expand-node">Expand Node</button> 
              </div>  
              <div class="col-sm-6"> 
                <select class="form-control" id="select-expand-node-levels"> 
                  <option>1</option>  
                  <option>2</option> 
                </select> 
              </div> 
            </div>  
            <div class="form-group"> 
              <button type="button" class="btn btn-danger expand-node" id="btn-collapse-node">Collapse Node</button> 
            </div>  
            <div class="form-group"> 
              <button type="button" class="btn btn-primary expand-node" id="btn-toggle-expanded">Toggle Node</button> 
            </div>  
            <hr/>  
            <div class="form-group row"> 
              <div class="col-sm-6"> 
                <button type="button" class="btn btn-success" id="btn-expand-all">Expand All</button> 
              </div>  
              <div class="col-sm-6"> 
                <select class="form-control" id="select-expand-all-levels"> 
                  <option>1</option>  
                  <option>2</option> 
                </select> 
              </div> 
            </div>  
            <button type="button" class="btn btn-danger" id="btn-collapse-all">Collapse All</button> 
          </div>  
          <div class="col-sm-4"> 
            <h2>Tree</h2>  
            <div id="treeview-expandible" class=""/> 
          </div>  
          <div class="col-sm-4"> 
            <h2>Events</h2>  
            <div id="expandible-output"/> 
          </div> 
        </div>  
        <div class="row"> 
          <hr/>  
          <h2>Checkable Tree</h2>  
          <div class="col-sm-4"> 
            <h2>Input</h2>  
            <div class="form-group"> 
              <label for="input-check-node" class="sr-only">Search Tree:</label>  
              <input type="input" class="form-control" id="input-check-node"
                placeholder="Identify node..." value="Parent 1"/> 
            </div>  
            <div class="checkbox"> 
              <label> 
                <input type="checkbox" class="checkbox" id="chk-check-silent"
                  value="false"/> Silent (No events)
              </label> 
            </div>  
            <div class="form-group row"> 
              <div class="col-sm-6"> 
                <button type="button" class="btn btn-success check-node" id="btn-check-node">Check Node</button> 
              </div> 
            </div>  
            <div class="form-group"> 
              <button type="button" class="btn btn-danger check-node" id="btn-uncheck-node">Uncheck Node</button> 
            </div>  
            <div class="form-group"> 
              <button type="button" class="btn btn-primary check-node" id="btn-toggle-checked">Toggle Node</button> 
            </div>  
            <hr/>  
            <div class="form-group row"> 
              <div class="col-sm-6"> 
                <button type="button" class="btn btn-success" id="btn-check-all">Check All</button> 
              </div> 
            </div>  
            <button type="button" class="btn btn-danger" id="btn-uncheck-all">Uncheck All</button> 
          </div>  
          <div class="col-sm-4"> 
            <h2>Tree</h2>  
            <div id="treeview-checkable" class=""/> 
          </div>  
          <div class="col-sm-4"> 
            <h2>Events</h2>  
            <div id="checkable-output"/> 
          </div> 
        </div>  
        <div class="row"> 
          <hr/>  
          <h2>Disabled Tree</h2>  
          <div class="col-sm-4"> 
            <h2>Input</h2>  
            <div class="form-group"> 
              <label for="input-disable-node" class="sr-only">Search Tree:</label>  
              <input type="input" class="form-control" id="input-disable-node"
                placeholder="Identify node..." value="Parent 1"/> 
            </div>  
            <div class="checkbox"> 
              <label> 
                <input type="checkbox" class="checkbox" id="chk-disable-silent"
                  value="false"/> Silent (No events)
              </label> 
            </div>  
            <div class="form-group row"> 
              <div class="col-sm-6"> 
                <button type="button" class="btn btn-success disable-node" id="btn-disable-node">Disable Node</button> 
              </div> 
            </div>  
            <div class="form-group"> 
              <button type="button" class="btn btn-danger disable-node" id="btn-enable-node">Enable Node</button> 
            </div>  
            <div class="form-group"> 
              <button type="button" class="btn btn-primary disable-node" id="btn-toggle-disabled">Toggle Node</button> 
            </div>  
            <hr/>  
            <div class="form-group row"> 
              <div class="col-sm-6"> 
                <button type="button" class="btn btn-success" id="btn-disable-all">Disable All</button> 
              </div> 
            </div>  
            <button type="button" class="btn btn-danger" id="btn-enable-all">Enable All</button> 
          </div>  
          <div class="col-sm-4"> 
            <h2>Tree</h2>  
            <div id="treeview-disabled" class=""/> 
          </div>  
          <div class="col-sm-4"> 
            <h2>Events</h2>  
            <div id="disabled-output"/> 
          </div> 
        </div>  
        <div class="row"> 
          <hr/>  
          <h2>Data</h2>  
          <div class="col-sm-4"> 
            <h2>JSON Data</h2>  
            <div id="treeview12" class=""/> 
          </div>  
          <div class="col-sm-4"> 
            <h2/>  
            <div id="treeview13" class=""/> 
          </div>  
          <div class="col-sm-4"> 
            <h2/>  
            <div id="treeview14"/> 
          </div> 
        </div>  
        <br/>  
        <br/>  
        <br/>  
        <br/> 
      </div> 
    </div> 
  </div> 
</div>
