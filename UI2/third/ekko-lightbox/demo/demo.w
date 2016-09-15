<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window" component="$UI/system/components/justep/window/window">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="position:absolute;height:auto;left:453px;top:68px;"
    onLoad="modelLoad"/>  
  <div component="$UI/system/components/justep/panel/panel" class="x-panel x-full"
    xid="panel1"> 
    <div class="x-panel-top" xid="top1"> 
      <div component="$UI/system/components/justep/titleBar/titleBar" class="x-titlebar"
        xid="titleBar1" title="ekko-lightbox"> 
        <div class="x-titlebar-left" xid="div1"> 
          <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-only-icon"
            xid="button1" onClick="{operation:'window.close'}" icon="icon-chevron-left"> 
            <i xid="i1" class="icon-chevron-left"/>  
            <span xid="span1"/> 
          </a> 
        </div>  
        <div class="x-titlebar-title" xid="div2">ekko-lightbox</div>  
        <div class="x-titlebar-right reverse" xid="div3"/> 
      </div> 
    </div>  
    <div class="x-panel-content" xid="content1"> 
      <div class="container"> 
        <h3 class="page-header" id="single-image">Example #1: Single Image</h3>  
        <p>Note: uses modal plugin title option via 
          <code>data-title</code>, and the custom footer tag using 
          <code>data-footer</code>
        </p>  
        <div class="row"> 
          <div class="col-sm-offset-4 col-sm-3"> 
            <a href="img/tumblr_mrn3dc10Wa1r1thfzo8_1280.jpg"
              data-toggle="lightbox" data-title="A random title" data-footer="A custom footer text"> 
              <img src="img/tumblr_mrn3dc10Wa1r1thfzo8_1280.jpg"
                class="img-responsive"/> 
            </a> 
          </div> 
        </div>  
        <h3 class="page-header" id="image-gallery">Example #2: Gallery of Images</h3>  
        <p>By default, gallery images must be wrapped in a tag (probably 
          <code>&lt;div&gt;</code>) - which doesn't have the class 
          <code>.row</code>. This is so you can create columns/rows.
        </p>  
        <p>A custom selector for the parent can be used, see 
          <a href="#wrappers">example #11</a>. Note how the final image is not in the gallery intentionally.
        </p>  
        <div class="row"> 
          <div class="col-md-offset-2 col-md-8"> 
            <div class="row"> 
              <a href="img/tumblr_mrn3dc10Wa1r1thfzo8_1280.jpg"
                data-toggle="lightbox" data-gallery="multiimages" data-title="People walking down stairs"
                class="col-sm-4"> 
                <img src="img/tumblr_mrn3dc10Wa1r1thfzo8_1280.jpg"
                  class="img-responsive"/> 
              </a>  
              <a href="img/tumblr_mrn3dc10Wa1r1thfzo1_1280.jpg"
                data-toggle="lightbox" data-gallery="multiimages" data-title="Man getting wet"
                class="col-sm-4"> 
                <img src="img/tumblr_mrn3dc10Wa1r1thfzo1_1280.jpg"
                  class="img-responsive"/> 
              </a>  
              <a href="img/tumblr_mrn3dc10Wa1r1thfzo2_1280.jpg"
                data-toggle="lightbox" data-gallery="multiimages" data-title="Someone lost their dress"
                class="col-sm-4"> 
                <img src="img/tumblr_mrn3dc10Wa1r1thfzo2_1280.jpg"
                  class="img-responsive"/> 
              </a> 
            </div>  
            <div class="row"> 
              <a href="img/tumblr_mrn3dc10Wa1r1thfzo3_1280.jpg"
                data-toggle="lightbox" data-gallery="multiimages" data-footer="Big ass waterfall- using footer instead of title"
                class="col-sm-4"> 
                <img src="img/tumblr_mrn3dc10Wa1r1thfzo3_1280.jpg"
                  class="img-responsive"/> 
              </a>  
              <a href="img/tumblr_mrn3dc10Wa1r1thfzo4_1280.jpg"
                data-toggle="lightbox" data-gallery="multiimages" data-title="Cool bottle"
                data-footer="Now fill it with whiskey" class="col-sm-4"> 
                <img src="img/tumblr_mrn3dc10Wa1r1thfzo4_1280.jpg"
                  class="img-responsive"/> 
              </a>  
              <a href="img/tumblr_mrn3dc10Wa1r1thfzo8_1280.jpg"
                data-toggle="lightbox" class="col-sm-4"> 
                <img src="img/tumblr_mrn3dc10Wa1r1thfzo8_1280.jpg"
                  class="img-responsive"/> 
              </a> 
            </div> 
          </div> 
        </div> 
      </div> 
    </div> 
  </div> 
</div>
