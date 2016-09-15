<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window" component="$UI/system/components/justep/window/window">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:472px;top:72px;"
    onLoad="modelLoad"> 
    <div component="$UI/system/components/justep/data/data" xid="newsData"
      idColumn="fID" autoLoad="true"> 
      <column label="ID" name="fID" type="String" xid="default1"/>  
      <column label="图片" name="fImage" type="String" xid="default2"/>  
      <column label="标题" name="fTitle" type="String" xid="default3"/>  
      <column label="内容" name="fContent" type="String" xid="default5"/>  
      <data xid="default10">[{"fID":"1","fImage":"./img/0.jpg","fTitle":"台媒猜测大陆测试歼20引擎","fContent":"两型新引擎高原测试，台媒猜测含歼20的国产动力涡扇15。"},{"fID":"2","fImage":"./img/1.jpg","fTitle":"普京称俄军2天击垮东欧5国","fContent":"普京称俄军有能力两天占领东欧五国首度，引起东欧国家紧张。"},{"fID":"3","fImage":"./img/2.jpg","fTitle":"俄出动十万军队在远东演习","fContent":"俄军开始东方2014演习，1500辆坦克70艘军舰参演。"},{"fID":"4","fImage":"./img/3.jpg","fTitle":"埃及狂购35亿美元俄制武器","fContent":"俄媒称订单中含战斗机、潜艇、中远程防空导弹等多种武器。"},{"fID":"5","fImage":"./img/4.jpg","fTitle":"日本拟动用自卫队保护核电站","fContent":"有分析称核电站面临安全威胁只是安倍突破自卫队限制的借口。"},{"fID":"6","fImage":"./img/5.jpg","fTitle":"美中校向华裔女友泄密获刑7年","fContent":"泄漏的文件包括文件包括美军事防御计划大纲，美军亚太部署。"},{"fID":"7","fImage":"./img/6.jpg","fTitle":"中俄联盟？俄军演先知会中国","fContent":"北京获悉俄远东军演消息早于俄官兵，俄媒称此确认中俄结盟。"},{"fID":"8","fImage":"./img/7.jpg","fTitle":"俄称4年造出世界最大无人机","fContent":"俄罗斯表示计划2018年试飞重达20吨的无人作战飞机。"},{"fID":"9","fImage":"./img/8.jpg","fTitle":"海军练远程空战余油险不够回","fContent":"东海舰队三代机部队千余公里外空战，落地时油表接近归零。"},{"fID":"10","fImage":"./img/9.jpg","fTitle":"美称中国装备新款反航母导弹","fContent":"美专家称中国东风25飞得更快更难拦截，可能曾推销给沙特。"},{"fID":"11","fImage":"./img/10.jpg","fTitle":"中国城市战型火箭筒亮相南非","fContent":"简氏称DZJ08特意减小杀伤半径，防止在巷战中伤及..."},{"fID":"12","fImage":"./img/11.jpg","fTitle":"基地组织错将巴军舰当美航母","fContent":"基地组织日前袭击巴军港，原想袭美航母，却不知其早已..."},{"fID":"13","fImage":"./img/12.jpg","fTitle":"美媒称翼龙无人机中东销路好","fContent":"外媒称翼龙比CH4性能好，解放军无人机团或配多达1..."},{"fID":"14","fImage":"./img/13.jpg","fTitle":"大校：光靠嘴炮挡不住美潜艇","fContent":"陈虎表示靠嘴批美潜艇抵近中国毫无意义，须能发现其踪..."}]</data> 
    </div> 
  </div>  
  <div component="$UI/system/components/justep/panel/panel" class="x-panel x-full"
    xid="panel1"> 
    <div class="x-panel-top" xid="top1"> 
      <div component="$UI/system/components/justep/titleBar/titleBar" class="x-titlebar"
        xid="titleBar1" title="List"> 
        <div class="x-titlebar-left" xid="div1"> 
          <a component="$UI/system/components/justep/button/button" class="btn btn-link"
            xid="button1" icon="icon-chevron-left" onClick="closeWin"> 
            <i xid="i1" class="icon-chevron-left"/>  
            <span xid="span1"/> 
          </a> 
        </div>  
        <div class="x-titlebar-title" xid="div2">List</div>  
        <div class="x-titlebar-right reverse" xid="div3"> 
          <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-only-icon"
            xid="button3" icon="icon-android-note" onClick="showListSource" bind-visible="isVisible"> 
            <i xid="i3" class="icon-android-note"/>  
            <span xid="span5"/> 
          </a> 
        </div> 
      </div> 
    </div>  
    <div class="x-panel-content" xid="content1"> 
      <div component="$UI/system/components/justep/contents/contents" class="x-contents x-full"
        active="0" xid="contents"> 
        <div class="x-contents-content x-scroll-view"
          xid="newsContent"> 
          <div class="x-scroll" component="$UI/system/components/justep/scrollView/scrollView"
            xid="demoList"> 
            <div class="x-content-center x-pull-down container" xid="div4"> 
              <i class="x-pull-down-img glyphicon x-icon-pull-down" xid="i7"/>  
              <span class="x-pull-down-label" xid="span6">下拉刷新...</span> 
            </div>  
            <div class="x-scroll-content" style="padding:6px;" xid="div7"> 
              <ul xid="newsList" class="x-list x-list-template" component="$UI/system/components/justep/list/list"
                data="newsData" limit="8"> 
                <li class="media"> 
                  <div class="pull-left media-object"> 
                    <img class="img-rounded x-news-image" bind-attr-src="$model.getImageUrl($object)"/> 
                  </div>  
                  <div class="media-body"> 
                    <h4 class="media-heading" bind-text="ref('fTitle')"/>  
                    <div bind-text="ref('fContent')"/> 
                  </div> 
                </li> 
              </ul> 
            </div>  
            <div class="x-content-center x-pull-up" xid="div8"> 
              <span class="x-pull-up-label" xid="span7">加载更多...</span> 
            </div> 
          </div> 
        </div>  
        <div class="x-contents-content" xid="textContent"> 
          <ul component="$UI/system/components/justep/list/list" class="x-list list-group x-list-template"
            xid="textList" data="getTexts"> 
            <li xid="li2" class="list-group-item"> 
              <span xid="span9" bind-text="ref('fTitle')"/>  
              <i xid="i9" class="pull-right icon-chevron-right"/> 
            </li> 
          </ul> 
        </div>  
        <div class="x-contents-content x-scroll-view"
          xid="orgImgContent"> 
          <div class="x-scroll" component="$UI/system/components/justep/scrollView/scrollView"
            xid="demoList1"> 
            <div class="x-content-center x-pull-down container"> 
              <i class="x-pull-down-img glyphicon x-icon-pull-down"/>  
              <span class="x-pull-down-label">下拉刷新...</span> 
            </div>  
            <div class="x-scroll-content" style="padding:6px;"> 
              <div xid="orgList" class="x-list" component="$UI/system/components/justep/list/list"
                data="newsData" limit="8"> 
                <div class="x-list-template row"> 
                  <div class="col-xs-6 col-sm-4"> 
                    <div class="thumbnail"> 
                      <img class="img-rounded" bind-attr-src="$model.getImageUrl($object)"/>  
                      <div class="caption"> 
                        <span bind-text="ref('fTitle')"/> 
                      </div> 
                    </div> 
                  </div> 
                </div> 
              </div> 
            </div>  
            <div class="x-content-center x-pull-up"> 
              <span class="x-pull-up-label">加载更多...</span> 
            </div> 
          </div> 
        </div>  
        <div class="x-contents-content" xid="tableContent"> 
          <div component="$UI/system/components/justep/list/list" class="x-list"
            data="newsData" xid="list2"> 
            <table class="table table-bordered table-hover table-striped" component="$UI/system/components/bootstrap/table/table"
              xid="table1"> 
              <thead xid="thead2"> 
                <tr xid="tr3"> 
                  <th xid="col1">#</th>  
                  <th xid="col2" bind-text="newsData.label('fTitle')"><![CDATA[fTitle]]></th>  
                  <th xid="col3" bind-text="newsData.label('fContent')"><![CDATA[fContent]]></th> 
                </tr> 
              </thead>  
              <tbody class="x-list-template" xid="listTemplate2"> 
                <tr xid="tr4"> 
                  <td xid="td2" bind-text="$index()+1">1</td>  
                  <td xid="td3" bind-text="ref('fTitle')"/>  
                  <td xid="td4" bind-text="ref('fContent')"/> 
                </tr> 
              </tbody> 
            </table> 
          </div> 
        </div> 
      </div> 
    </div>  
    <span component="$UI/system/components/justep/windowDialog/windowDialog"
      xid="windowDialog" src="$UI/system/components/justep/common/demo/dialog.w" style="left:375px;top:287px;"
      status="normal"/>  
    <div class="x-panel-bottom" xid="bottom1"> 
      <div component="$UI/system/components/justep/button/buttonGroup" class="btn-group btn-group-justified x-card"
        tabbed="true" xid="buttonGroup1" style="height:48px;"> 
        <a component="$UI/system/components/justep/button/button" class="btn btn-default btn-icon-top"
          label="新闻列表" xid="button4" target="newsContent" icon="glyphicon glyphicon-list-alt"> 
          <i xid="i4" class="glyphicon glyphicon-list-alt"/>  
          <span xid="span3">新闻列表</span> 
        </a>  
        <a component="$UI/system/components/justep/button/button" class="btn btn-default btn-icon-top"
          label="文字列表" xid="button2" target="textContent" icon="glyphicon glyphicon-list"> 
          <i xid="i8" class="glyphicon glyphicon-list"/>  
          <span xid="span8">文字列表</span> 
        </a>  
        <a component="$UI/system/components/justep/button/button" class="btn btn-default btn-icon-top"
          label="照片墙" xid="button5" target="orgImgContent" icon="glyphicon glyphicon-film"> 
          <i xid="i5" class="glyphicon glyphicon-film"/>  
          <span xid="span4">照片墙</span> 
        </a>  
        <a component="$UI/system/components/justep/button/button" class="btn btn-default btn-icon-top"
          label="动态表格" xid="button6" target="tableContent" icon="glyphicon glyphicon-th"> 
          <i xid="i10" class="glyphicon glyphicon-th"/>  
          <span xid="span10">动态表格</span> 
        </a> 
      </div> 
    </div> 
  </div> 
</div>
