<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window" component="$UI/system/components/justep/window/window">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="position:absolute;height:auto;left:453px;top:68px;"
    onLoad="modelLoad"/>  
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
        <form class="form-horizontal" role="form"> 
          <div class="form-group"> 
            <label for="basic" class="col-lg-2 control-label">"Basic" (liveSearch disabled)</label>  
            <div class="col-lg-10"> 
              <select id="basic" class="selectpicker show-tick form-control"> 
                <option>cow</option>  
                <option data-subtext="option subtext">bull</option>  
                <option class="get-class" disabled="true">ox</option>  
                <optgroup label="test" data-subtext="optgroup subtext"> 
                  <option>ASD</option>  
                  <option selected="true">Bla</option>  
                  <option>Ble</option> 
                </optgroup> 
              </select> 
            </div> 
          </div> 
        </form>  
        <hr/>  
        <form class="form-horizontal" role="form"> 
          <div class="form-group"> 
            <label for="basic" class="col-lg-2 control-label">"Basic" (liveSearch enabled)</label>  
            <div class="col-lg-10"> 
              <select id="basic" class="selectpicker show-tick form-control" data-live-search="true"> 
                <option>cow</option>  
                <option data-subtext="option subtext">bull</option>  
                <option class="get-class" disabled="true">ox</option>  
                <optgroup label="test" data-subtext="optgroup subtext"> 
                  <option>ASD</option>  
                  <option selected="true">Bla</option>  
                  <option>Ble</option> 
                </optgroup> 
              </select> 
            </div> 
          </div> 
        </form>  
        <hr/>  
        <form class="form-horizontal" role="form"> 
          <div class="form-group"> 
            <label for="basic2" class="col-lg-2 control-label">"Basic" (multiple, maxOptions=1)</label>  
            <div class="col-lg-10"> 
              <select id="basic2" class="show-tick form-control" multiple="true"> 
                <option>cow</option>  
                <option>bull</option>  
                <option class="get-class" disabled="true">ox</option>  
                <optgroup label="test" data-subtext="another test"> 
                  <option>ASD</option>  
                  <option selected="true">Bla</option>  
                  <option>Ble</option> 
                </optgroup> 
              </select> 
            </div> 
          </div> 
        </form>  
        <hr/>  
        <form class="form-horizontal" role="form"> 
          <div class="form-group"> 
            <label for="maxOption2" class="col-lg-2 control-label">multiple, show-menu-arrow, maxOptions=2</label>  
            <div class="col-lg-10"> 
              <select id="maxOption2" class="selectpicker show-menu-arrow form-control"
                multiple="true" data-max-options="2"> 
                <option>chicken</option>  
                <option>turkey</option>  
                <option disabled="true">duck</option>  
                <option>goose</option> 
              </select> 
            </div> 
          </div> 
        </form>  
        <hr/>  
        <form class="form-inline"> 
          <div class="form-group"> 
            <label class="col-md-1 control-label" for="lunch">Lunch:</label> 
          </div>  
          <div class="form-group"> 
            <select id="lunch" class="selectpicker" data-live-search="true" title="Please select a lunch ..."> 
              <option>Hot Dog, Fries and a Soda</option>  
              <option>Burger, Shake and a Smile</option>  
              <option>Sugar, Spice and all things nice</option>  
              <option>Baby Back Ribs</option>  
              <option>A really really long option made to illustrate an issue with the live search in an inline form</option> 
            </select> 
          </div> 
        </form>  
        <hr/>  
        <form class="form-horizontal" role="form"> 
          <div class="form-group form-group-lg"> 
            <label for="error" class="col-lg-2 control-label">error</label>  
            <div class="col-lg-10 error"> 
              <select id="error" class="selectpicker show-tick form-control"> 
                <option>pen</option>  
                <option>pencil</option>  
                <option selected="true">brush</option> 
              </select> 
            </div> 
          </div> 
        </form>  
        <hr/>  
        <form class="form-horizontal" role="form"> 
          <div class="form-group has-error form-group-lg"> 
            <label class="control-label col-lg-2" for="country">error type 2</label>  
            <div class="col-lg-10"> 
              <select id="country" name="country" class="form-control selectpicker"> 
                <option>Argentina</option>  
                <option>United State</option>  
                <option>Mexico</option> 
              </select>  
              <p class="help-block">No service available in the selected country</p> 
            </div> 
          </div> 
        </form>  
        <hr/>  
        <nav class="navbar navbar-default" role="navigation"> 
          <div class="container-fluid"> 
            <div class="navbar-header"> 
              <a class="navbar-brand" href="#">Navbar</a> 
            </div>  
            <form class="navbar-form navbar-left" role="search"> 
              <div class="form-group"> 
                <select class="selectpicker" multiple="true" data-live-search="true"
                  data-live-search-placeholder="Search" data-actions-box="true"> 
                  <optgroup label="filter1"> 
                    <option>option1</option>  
                    <option>option2</option>  
                    <option>option3</option>  
                    <option>option4</option> 
                  </optgroup>  
                  <optgroup label="filter2"> 
                    <option>option1</option>  
                    <option>option2</option>  
                    <option>option3</option>  
                    <option>option4</option> 
                  </optgroup>  
                  <optgroup label="filter3"> 
                    <option>option1</option>  
                    <option>option2</option>  
                    <option>option3</option>  
                    <option>option4</option> 
                  </optgroup> 
                </select> 
              </div>  
              <div class="input-group"> 
                <input type="text" class="form-control" placeholder="Search"
                  name="q"/>  
                <div class="input-group-btn"> 
                  <button class="btn btn-default" type="submit">
                    <i class="glyphicon glyphicon-search"/>
                  </button> 
                </div> 
              </div>  
              <button type="submit" class="btn btn-default">Search</button> 
            </form> 
          </div>  
          <!-- .container-fluid --> 
        </nav>  
        <hr/>  
        <select id="first-disabled" class="selectpicker" data-hide-disabled="true"
          data-live-search="true"> 
          <optgroup disabled="disabled" label="disabled"> 
            <option>Hidden</option> 
          </optgroup>  
          <optgroup label="Fruit"> 
            <option>Apple</option>  
            <option>Orange</option> 
          </optgroup>  
          <optgroup label="Vegetable"> 
            <option>Corn</option>  
            <option>Carrot</option> 
          </optgroup> 
        </select>  
        <hr/>  
        <select id="first-disabled2" class="selectpicker" multiple="true" data-hide-disabled="true"
          data-size="5"> 
          <option>Apple</option>  
          <option>Banana</option>  
          <option>Orange</option>  
          <option>Pineapple</option>  
          <option>Apple2</option>  
          <option>Banana2</option>  
          <option>Orange2</option>  
          <option>Pineapple2</option>  
          <option>Apple2</option>  
          <option>Banana2</option>  
          <option>Orange2</option>  
          <option>Pineapple2</option> 
        </select>  
        <button id="special" class="btn btn-default">Hide selected by disabling</button>  
        <button id="special2" class="btn btn-default">Reset</button>  
        <p>Just select 1st element, click button and check list again</p>  
        <hr/>  
        <div class="input-group"> 
          <span class="input-group-addon">@</span>  
          <select class="form-control selectpicker"> 
            <option>One</option>  
            <option>Two</option>  
            <option>Three</option> 
          </select> 
        </div>  
        <hr/>  
        <div class="input-group"> 
          <span class="input-group-addon">@</span>  
          <select class="form-control selectpicker" data-mobile="true"> 
            <option>One</option>  
            <option>Two</option>  
            <option>Three</option> 
          </select> 
        </div>  
        <p>With 
          <code>data-mobile="true"</code> option.
        </p>  
        <hr/>  
        <select id="done" class="selectpicker" multiple="true" data-done-button="true"> 
          <option>Apple</option>  
          <option>Banana</option>  
          <option>Orange</option>  
          <option>Pineapple</option>  
          <option>Apple2</option>  
          <option>Banana2</option>  
          <option>Orange2</option>  
          <option>Pineapple2</option>  
          <option>Apple2</option>  
          <option>Banana2</option>  
          <option>Orange2</option>  
          <option>Pineapple2</option> 
        </select>  
        <hr/>  
        <select id="tokens" class="selectpicker" multiple="true" data-live-search="true"> 
          <option data-tokens="first">I actually am called "first"</option>  
          <option data-tokens="second">And me "second"</option>  
          <option data-tokens="last">I am "last"</option> 
        </select>  
        <hr/>  
        <form class="form-inline"> 
          <div class="form-group"> 
            <label class="col-md-1 control-label" for="lunchBegins">Lunch (Begins search):</label> 
          </div>  
          <div class="form-group"> 
            <select id="lunchBegins" class="selectpicker" data-live-search="true"
              data-live-search-style="begins" title="Please select a lunch ..."> 
              <option>Hot Dog, Fries and a Soda</option>  
              <option>Burger, Shake and a Smile</option>  
              <option>Sugar, Spice and all things nice</option>  
              <option>Baby Back Ribs</option>  
              <option>A really really long option made to illustrate an issue with the live search in an inline form</option> 
            </select> 
          </div> 
        </form> 
      </div> 
    </div> 
  </div> 
</div>
