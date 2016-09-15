<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window" component="$UI/system/components/justep/window/window">  
  <div component="$UI/system/components/justep/controlGroup/controlGroup" class="x-control-group"
    title="文档检索" xid="controlGroup1"> 
    <div class="x-control-group-title" xid="controlGroupTitle1"> 
      <span xid="span1"><![CDATA[文档检索]]></span> 
    </div>  
    <div class="x-control-group-body"> 
      <div class="input-group"> 
        <input type="text" class="form-control" bind-value="docSearchData.ref('searchWord')"/>  
        <span class="input-group-btn"> 
          <button class="btn btn-primary" type="button" xid="searchBtn" bind-click="searchBtnClick"><![CDATA[搜!]]></button> 
        </span> 
      </div> 
    </div> 
  </div>  
  <div data-bind="visible:$docs.searchWord.get() != ''"> 
    <div class="panel panel-default"> 
      <div class="panel-heading">搜索 "
        <mark data-bind="text:$docs.searchWord"/>"获得
        <mark data-bind="text:$docs.dataSize"/>条结果
      </div>  
      <div class="panel-body"> 
        <ol class="container" data-bind="foreach:$docs.rows"> 
          <li class="row">
            <div>
              <div class="row"> 
                <div class="col-xs-8"> 
                  <h4>
                    <a data-bind="text:$object.title,click:$model.browseDoc.bind($model)"/> 
                  </h4> 
                </div> 
                <div class="col-xs-4">
                  <!-- <h4> 
                    <a data-bind="click:$model.sourceLocation.bind($model)">[源位置]</a> 
                  </h4> --> 
                </div> 
              </div>  
              <div class="row"> 
                <div class="col-xs-4"> 
                  <span>作者:</span>  
                  <span data-bind="text:$object.creatorName"/> 
                </div>  
                <div class="col-xs-4"> 
                  <span>成文日期:</span>  
                  <span data-bind="text:$object.lastWriteTime"/> 
                </div> 
              </div>  
              <div class="row"> 
                <div class="col-xs-8"> 
                  <span>关键字:</span>  
                  <span data-bind="text:$object.keywords"/> 
                </div> 
              </div> 
            </div> 
          </li> 
        </ol> 
      </div> 
    </div>  
    <nav> 
      <ul class="pager pull-right"> 
        <li>
          <a data-bind="click:$model.prePage.bind($model)">上一页</a>
        </li>  
        <li>
          <a data-bind="click:$model.nextPage.bind($model)">下一页</a>
        </li> 
      </ul> 
    </nav> 
  </div>  
  <div component="$UI/system/components/justep/model/model" xid="model1" style="position:absolute;;left:205.0px;top:240.0px" onModelConstructDone="model1ModelConstructDone"> 
    <div component="$UI/system/components/justep/data/data" autoLoad="true"
      xid="docSearchData" idColumn="id"> 
      <column label="id" name="id" type="String" xid="default8"/>  
      <column label="searchWord" name="searchWord" type="String" xid="default9"/>  
      <column label="pageNum" name="pageNum" type="String" xid="default10"/>  
      <column label="pageSize" name="pageSize" type="String" xid="default11"/>  
      <data xid="default12">[{"id":"1","searchWord":"","pageNum":"-1","pageSize":"50"}]</data> 
    </div> 
  </div> 
</div>
