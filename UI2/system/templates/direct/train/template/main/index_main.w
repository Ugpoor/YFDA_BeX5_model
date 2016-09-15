<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window" component="$UI/system/components/justep/window/window"
  design="device:m;">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:343px;top:0px;"></div>  
  <div component="$UI/system/components/justep/panel/panel" class="x-panel x-full"
    xid="panel1"> 
    <div class="x-panel-top" xid="top1" height="48" style="background-color:black;"> 
      <div component="$UI/system/components/justep/titleBar/titleBar" class="x-titlebar"
        xid="titleBar1" title="教育培训" style="font-size:large;background-color:black;height:48px;"> 
        <div class="x-titlebar-left" xid="div2"> 
          <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-only-icon"
            label="button" xid="regsBtn" icon="icon-chevron-left" onClick="{operation:'window.close'}"> 
            <i xid="i2" class="icon-chevron-left"/>  
            <span xid="span2"/> 
          </a> 
        </div>  
        <div class="x-titlebar-title" xid="div2">教育培训</div>  
        <div class="x-titlebar-right reverse" xid="div3"/> 
      </div> 
    </div>  
    <div class="x-panel-content" xid="content1"> 
      <div component="$UI/system/components/justep/contents/contents" class="x-contents x-full"
        active="0" xid="contents"> 
        <div class="x-contents-content" xid="firstPage" style="height:auto;"> 
          <div component="$UI/system/components/justep/row/row" class="x-row"
            xid="row14" style="background-color:#C0C0C0;height:50px;"> 
            <div class="x-col x-col-center" xid="col35" style="height:100%;"> 
              <div component="$UI/system/components/justep/row/row" class="x-row"
                xid="row4"> 
                <div class="x-col" xid="col14"> 
                  <input component="$UI/system/components/justep/input/input"
                    class="form-control" xid="input1" readonly="true" style="background-color:#fff;height:30px;margin-top:-10px;"/> 
                </div> 
              </div>  
              <div component="$UI/system/components/justep/row/row" class="x-row"
                xid="row7"> 
                <div class="x-col x-col-center" xid="col19"> 
                  <a component="$UI/system/components/justep/button/button"
                    class="btn btn-link center-block search" label="搜索" xid="searchBtn"
                    icon="icon-ios7-search-strong" style="font-size:20px;color:#2B2B2B;"
                    onClick="openDemo" urlMapping="search"> 
                    <i xid="i8" class="icon-ios7-search-strong"/>  
                    <span xid="span8">搜索</span> 
                  </a> 
                </div> 
              </div> 
            </div> 
          </div>  
          <div component="$UI/system/components/justep/row/row" class="x-row"
            xid="row1" style="margin-top:20px;height:100px;" bind-click="showCourse"> 
            <div class="x-col x-col-25" xid="col1"> 
              <img alt="" xid="image1" class="center-block img" bind-attr-src=" $model.getImageUrl('1.jpg')"/>  
              <div xid="div" class="kemu">数学</div> 
            </div>  
            <div class="x-col x-col-25" xid="col2"> 
              <img alt="" xid="image2" class="center-block img" bind-attr-src="$model.getImageUrl('2.jpg')"/>  
              <div xid="div6" class="kemu">语文</div> 
            </div>  
            <div class="x-col x-col-25" xid="col3"> 
              <img alt="" xid="image3" class="center-block img" bind-attr-src="$model.getImageUrl('3.jpg')"/>  
              <div xid="div7" class="kemu">英语</div> 
            </div>  
            <div class="x-col x-col-25" xid="col4"> 
              <img alt="" xid="image4" class="center-block img" bind-attr-src="$model.getImageUrl('4.jpg')"/>  
              <div xid="div8" class="kemu">化学</div> 
            </div> 
          </div>  
          <div component="$UI/system/components/justep/row/row" class="x-row"
            xid="row2" style="height:100px;" bind-click="showCourse"> 
            <div class="x-col x-col-25" xid="col6"> 
              <img alt="" xid="image6" class="center-block img" bind-attr-src="$model.getImageUrl('5.jpg')"/>  
              <div xid="div9" class="kemu">生物</div> 
            </div>  
            <div class="x-col x-col-25" xid="col8"> 
              <img alt="" xid="image5" class="center-block img" bind-attr-src="$model.getImageUrl('6.jpg')"/>  
              <div xid="div12" class="kemu">物理</div> 
            </div>  
            <div class="x-col x-col-25" xid="col7"> 
              <img alt="" xid="image8" class="center-block img" bind-attr-src="$model.getImageUrl('7.jpg')"/>  
              <div xid="div11" class="kemu">地理</div> 
            </div>  
            <div class="x-col x-col-25" xid="col5"> 
              <img alt="" xid="image7" class="center-block img" bind-attr-src="$model.getImageUrl('8.jpg')"/>  
              <div xid="div10" class="kemu">画图</div> 
            </div> 
          </div>  
          <div xid="div5" style="color:#000040;border-bottom: 1px #ccc solid;"/>  
          <div component="$UI/system/components/justep/row/row" class="x-row"
            xid="row3"> 
            <div class="x-col x-col-33" xid="col9" style="color:#FF0000;"> 
              <div xid="div13" class="pull-right">特别推荐</div> 
            </div>  
            <div class="x-col x-col-fixed" xid="col10" style="width:auto;"> 
              <div xid="div15">|</div> 
            </div>  
            <div class="x-col" xid="subCol" bind-click="showCourse"> 
              <div xid="div14" style="color:#3E3E3E;font-weight:normal;">一对一高考特训</div> 
            </div> 
          </div>  
          <img alt="" xid="image9" style="width:100%;" bind-attr-src="$model.getImageUrl('9.jpg')"/>  
          <div component="$UI/system/components/bootstrap/row/row" class="row"
            xid="row5" style="width:100%;"> 
            <div class="col" xid="col15"> 
              <div xid="div16" class="kecheng" style="width:80%;"> 
                <div style="margin-left:20px;color:#000000;width:80%;" xid="div17">优质课程</div> 
              </div> 
            </div> 
          </div>  
          <div xid="div17" class="css1"> 
            <div xid="div18">高三英语高级培训！备战高考！</div>  
            <div xid="div19" style="color:#FF0000;">hot~</div> 
          </div>  
          <div xid="div20" class="css1"> 
            <div xid="div22">高一物理入门！</div>  
            <div xid="div21" style="color:#FF0000;">hot~</div> 
          </div>  
          <div xid="div23" class="css1"> 
            <div xid="div25">《追忆似水年华》文学阅读培训！</div>  
            <div xid="div24" style="color:#FF0000;">hot~</div> 
          </div> 
        </div> 
      </div> 
    </div>  
    <div class="x-panel-bottom" xid="bottom1" height="48"> 
      <div component="$UI/system/components/justep/button/buttonGroup" class="btn-group btn-group-justified"
        tabbed="true" xid="buttonGroup1" style="color:#6E6E6E;background-color:#848484;height:100%;width:100%;"> 
        <a component="$UI/system/components/justep/button/button" class="btn btn-link"
          label="首页" style="min-width:1110px;" xid="button2"> 
          <i xid="i2"/>  
          <span xid="span2">首页</span> 
        </a>  
        <a component="$UI/system/components/justep/button/button" class="btn btn-link"
          label="课程列表" xid="button3" onClick="openDemo" urlMapping="course"> 
          <i xid="i3"/>  
          <span xid="span3">课程列表</span> 
        </a>  
        <a component="$UI/system/components/justep/button/button" class="btn btn-link"
          label="师资力量" xid="teaBtn" onClick="openDemo" urlMapping="teachers"> 
          <i xid="i4"/>  
          <span xid="span4">师资力量</span> 
        </a>  
        <a component="$UI/system/components/justep/button/button" class="btn btn-link"
          label="学习论坛" xid="stuBtn" onClick="openDemo" urlMapping="forum"> 
          <i xid="i6"/>  
          <span xid="span6">学习论坛</span> 
        </a>
        <a component="$UI/system/components/justep/button/button" class="btn btn-link"
          label="关于我们" xid="aboutBtn" onClick="openDemo" urlMapping="about"> 
          <i xid="i7"/>  
          <span xid="span7">关于我们</span> 
        </a> 
      </div> 
    </div> 
  </div> 
</div>
