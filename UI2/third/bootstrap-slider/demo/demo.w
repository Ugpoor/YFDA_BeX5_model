<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window" component="$UI/system/components/justep/window/window">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="position:absolute;height:auto;left:453px;top:68px;"
    onLoad="modelLoad"/>  
  <div component="$UI/system/components/justep/panel/panel" class="x-panel x-full"
    xid="panel1"> 
    <div class="x-panel-top" xid="top1"> 
      <div component="$UI/system/components/justep/titleBar/titleBar" class="x-titlebar"
        xid="titleBar1" title="bootstrap-slider"> 
        <div class="x-titlebar-left" xid="div1"> 
          <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-only-icon"
            xid="button1" icon="icon-chevron-left" onClick="{operation:'window.close'}"> 
            <i xid="i1" class="icon-chevron-left"/>  
            <span xid="span1"/> 
          </a> 
        </div>  
        <div class="x-titlebar-title" xid="div2">bootstrap-slider</div>  
        <div class="x-titlebar-right reverse" xid="div3"/> 
      </div> 
    </div>  
    <div class="x-panel-content" xid="content1"> 
      <div class="examples"> 
        <div class="slider-example"> 
          <h3>Example 1:</h3>  
          <p>Basic example with custom formatter and colored selected region via CSS.</p>  
          <div class="well"> 
            <input id="ex1" data-slider-id="ex1Slider" type="text" data-slider-min="-5"
              data-slider-max="20" data-slider-step="1" data-slider-value="14"/> 
          </div> 
        </div>  
        <div class="slider-example"> 
          <h3>Example 2:</h3>  
          <p>Range selector, options specified via data attribute.</p>  
          <div class="well">Filter by price interval: 
            <b>€ 10</b>  
            <input id="ex2" type="text" class="span2" value="" data-slider-min="10"
              data-slider-max="1000" data-slider-step="5" data-slider-value="[250,450]"/>  
            <b>€ 1000</b> 
          </div> 
        </div>  
        <div class="slider-example"> 
          <h3>Example 3:</h3>  
          <p>Using events to work with the values and style the selection and handles via CSS. The tooltip is disabled and diferent shapes for the handles.</p>  
          <div class="well"> 
            <p> 
              <b>R</b>  
              <input type="text" class="span2" value="" data-slider-min="0" data-slider-max="255"
                data-slider-step="1" data-slider-value="128" data-slider-id="RC" id="R"
                data-slider-tooltip="hide" data-slider-handle="square"/> 
            </p>  
            <p> 
              <b>G</b>  
              <input type="text" class="span2" value="" data-slider-min="0" data-slider-max="255"
                data-slider-step="1" data-slider-value="128" data-slider-id="GC" id="G"
                data-slider-tooltip="hide" data-slider-handle="round"/> 
            </p>  
            <p> 
              <b>B</b>  
              <input type="text" class="span2" value="" data-slider-min="0" data-slider-max="255"
                data-slider-step="1" data-slider-value="128" data-slider-id="BC" id="B"
                data-slider-tooltip="hide" data-slider-handle="triangle"/> 
            </p>  
            <div id="RGB"/> 
          </div> 
        </div>  
        <div class="slider-example"> 
          <h3>Example 4:</h3>  
          <p>Vertical Slider with reversed values (largest to smallest).</p>  
          <div class="well"> 
            <input id="ex4" type="text" data-slider-min="-5" data-slider-max="20"
              data-slider-step="1" data-slider-value="-3" data-slider-orientation="vertical"/> 
          </div> 
        </div>  
        <div class="slider-example"> 
          <h3>Example 5:</h3>  
          <p>Destroy instance of slider by calling destroy() method on slider instance via JavaScript.</p>  
          <div class="well"> 
            <input id="ex5" type="text" data-slider-min="-5" data-slider-max="20"
              data-slider-step="1" data-slider-value="0"/>  
            <button id="destroyEx5Slider" class="btn btn-danger">Click to Destroy</button> 
          </div> 
        </div>  
        <div class="slider-example"> 
          <h3>Example 6:</h3>  
          <p>Able to bind to 'slide' JQuery event on slider, which is triggered whenever the slider is used.</p>  
          <div class="well"> 
            <input id="ex6" type="text" data-slider-min="-5" data-slider-max="20"
              data-slider-step="1" data-slider-value="3"/>  
            <span id="ex6CurrentSliderValLabel">Current Slider Value: 
              <span id="ex6SliderVal">3</span> 
            </span> 
          </div> 
        </div>  
        <div class="slider-example"> 
          <h3>Example 7:</h3>  
          <p>Sliders can be enabled and disabled.</p>  
          <div class="well"> 
            <input id="ex7" type="text" data-slider-min="0" data-slider-max="20"
              data-slider-step="1" data-slider-value="5" data-slider-enabled="false"/>  
            <input id="ex7-enabled" type="checkbox"/> Enabled
          </div> 
        </div>  
        <div class="slider-example"> 
          <h3>Example 8:</h3>  
          <p>Tooltip can always be displayed.</p>  
          <div class="well"> 
            <input id="ex8" data-slider-id="ex1Slider" type="text" data-slider-min="0"
              data-slider-max="20" data-slider-step="1" data-slider-value="14"/> 
          </div> 
        </div>  
        <div class="slider-example"> 
          <h3>Example 9:</h3>  
          <p>Precision (number of places after the decimal) can be specified.</p>  
          <div class="well"> 
            <input id="ex9" type="text"/> 
          </div> 
        </div>  
        <div class="slider-example"> 
          <h3>Example 10:</h3>  
          <p>Setting custom handlers.</p>  
          <div class="well"> 
            <input id="ex10" type="text" data-slider-handle="custom"/> 
          </div> 
        </div>  
        <div class="slider-example"> 
          <h3>Example 11:</h3>  
          <p>Using a custom step interval.</p>  
          <div class="well"> 
            <input id="ex11" type="text" data-slider-handle="custom"/> 
          </div> 
        </div>  
        <div class="slider-example"> 
          <h3>Example 12:</h3>  
          <p>Coloring the low and high track segments.</p>  
          <div class="well">Single-value slider, high track:
            <br/>  
            <input id="ex12a" type="text"/>  
            <br/> Note that there is no low track on the single-value slider. The area lesser than the value of the handle is the selection.
            <br/>  
            <br/> Range slider, low track:
            <br/>  
            <input id="ex12b" type="text"/>  
            <br/>  
            <br/> Range slider, low and high tracks, and selection:
            <br/>  
            <input id="ex12c" type="text"/> 
          </div> 
        </div>  
        <div class="slider-example"> 
          <h3>Example 13:</h3>  
          <p>Using tick marks and labels.</p>  
          <div class="well"> 
            <input id="ex13" type="text"/> 
          </div> 
        </div>  
        <div class="slider-example"> 
          <h3>Example 14:</h3>  
          <p>Using tick marks at specific positions..</p>  
          <div class="well"> 
            <input id="ex14" type="text"/> 
          </div> 
        </div>  
        <div class="slider-example"> 
          <h3>Example 15:</h3>  
          <p>With a logarithmic scale.</p>  
          <div class="well"> 
            <input id="ex15" type="text" data-slider-min="1000" data-slider-max="10000000"
              data-slider-step="5"/> 
          </div> 
        </div>  
        <div class="slider-example"> 
          <h3>Example 16:</h3>  
          <p>Focus the slider handle after a value change.</p>  
          <div class="well">Single-value slider:
            <br/>  
            <input id="ex16a" type="text"/>  
            <br/>  
            <br/>  
            <br/> Range slider: 
            <br/>  
            <input id="ex16b" type="text"/> 
          </div> 
        </div>  
        <div class="slider-example"> 
          <h3>Example 17:</h3>  
          <p>Unusual tooltip positions</p>  
          <div class="well">Horizontal slider with tooltip on the bottom
            <br/>  
            <br/>  
            <input id="ex17a" type="text"/>  
            <br/>  
            <br/>  
            <br/> Vertical slider with tooltip on the left
            <br/>  
            <br/>  
            <input id="ex17b" type="text"/> 
          </div> 
        </div> 
      </div>  
      <!-- /examples --> 
    </div> 
  </div> 
</div>
