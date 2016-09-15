<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window" component="$UI/system/components/justep/window/window"
  design="device:pc">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:245px;top:401px;"> 
    <div component="$UI/system/components/justep/data/data" autoLoad="true"
      xid="dictionaryData" idColumn="fID" limit="2" onCustomRefresh="dictionaryDataCustomRefresh"> 
      <column label="   " name="fID" type="String" xid="xid1"/>  
      <column label="字典项值" name="fValue" type="String" xid="xid2"/>  
      <column label="字典项名称" name="fName" type="String" xid="xid3"/>  
      <column label="字典项说明" name="fRemark" type="String" xid="xid4"/>  
      <column label="字典项排列顺序" name="fOrder" type="String" xid="xid5"/>  
      <data xid="default1">[]</data>
    </div> 
  </div>  
  <div component="$UI/system/components/justep/controlGroup/controlGroup" class="x-control-group"
    title="数据维护" xid="controlGroup"> 
    <div class="x-control-group-title" xid="controlGroupTitle1" style="background-color:#298CC7;"> 
      <span xid="span1">title</span>  
      <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-only-icon pull-right"
        label="button" xid="button1" icon="icon-android-close" onClick="{operation:'windowReceiver1.windowEnsure'}"> 
        <i xid="i1" class="icon-android-close"/>  
        <span xid="span2"/> 
      </a> 
    </div>  
    <div component="$UI/system/components/justep/button/buttonGroup" class="btn-group"
      tabbed="true" xid="buttonGroup1" style="width:100%;"> 
      <a component="$UI/system/components/justep/button/button" class="btn btn-link text-warning btn1"
        label="新增" xid="add" style="width:80px;" icon="icon-android-add"> 
        <i xid="i2" class="icon-android-add"/>  
        <span xid="span3">新增</span> 
      </a>  
      <a component="$UI/system/components/justep/button/button" class="btn btn-link text-warning btn1"
        label="修改" xid="edit" style="width:80px;" icon="icon-edit"> 
        <i xid="i3" class="icon-edit"/>  
        <span xid="span4">修改</span> 
      </a>  
      <a component="$UI/system/components/justep/button/button" class="btn btn-link text-warning btn1"
        label="删除" xid="delete" style="width:80px;" icon="icon-trash-b"> 
        <i xid="i4" class="icon-trash-b"/>  
        <span xid="span5">删除</span> 
      </a>  
      <a component="$UI/system/components/justep/button/button" class="btn btn-link text-warning btn1"
        label="保存" xid="save" style="width:80px;" icon="icon-android-checkmark"> 
        <i xid="i5" class="icon-android-checkmark"/>  
        <span xid="span6">保存</span> 
      </a> 
    <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-lg pull-right" label="源码" xid="sourceBtn" onClick="sourceClick">
   <i xid="i7"></i>
   <span xid="span8">源码</span></a><a component="$UI/system/components/justep/button/button" class="btn btn-link btn-lg pull-right" label="js" xid="jsBtn" onClick="jsBtnClick">
   <i xid="i6"></i>
   <span xid="span7">js</span></a>
  </div>  
    <div component="$UI/system/components/justep/dataTables/dataTables" flexibleWidth="true"
      rowActiveClass="active" class="table table-hover table-striped" xid="dataTables3"
      data="dictionaryData" ordering="false"> 
      <columns xid="columns3"> 
        <column name="fID" xid="column10"/>  
        <column name="fValue" xid="column11"/>  
        <column name="fName" xid="column12"/>  
        <column name="fRemark" xid="column13"/>  
        <column name="fOrder" xid="column14"/> 
      </columns> 
    </div>  
    <div component="$UI/system/components/justep/pagerBar/pagerBar" class="x-pagerbar container-fluid"
      xid="pagerBar2" data="dictionaryData"> 
      <div class="row" xid="div9"> 
        <div class="col-sm-3" xid="div10"> 
          <div class="x-pagerbar-length" xid="div11"> 
            <label component="$UI/system/components/justep/pagerLimitSelect/pagerLimitSelect"
              class="x-pagerlimitselect" xid="pagerLimitSelect2"> 
              <span xid="span13">显示</span>  
              <select component="$UI/system/components/justep/select/select" class="form-control input-sm"
                xid="select2"> 
                <option value="10" xid="default6">10</option>  
                <option value="20" xid="default7">20</option>  
                <option value="50" xid="default8">50</option>  
                <option value="100" xid="default9">100</option> 
              </select>  
              <span xid="span14">条</span> 
            </label> 
          </div> 
        </div>  
        <div class="col-sm-3" xid="div12"> 
          <div class="x-pagerbar-info" xid="div13">当前显示0条，共0条</div> 
        </div>  
        <div class="col-sm-6" xid="div14"> 
          <div class="x-pagerbar-pagination" xid="div15"> 
            <ul class="pagination" component="$UI/system/components/bootstrap/pagination/pagination"
              xid="pagination2"> 
              <li class="prev" xid="li3"> 
                <a href="#" xid="a3"> 
                  <span aria-hidden="true" xid="span15">«</span>  
                  <span class="sr-only" xid="span16">Previous</span> 
                </a> 
              </li>  
              <li class="next" xid="li4"> 
                <a href="#" xid="a4"> 
                  <span aria-hidden="true" xid="span17">»</span>  
                  <span class="sr-only" xid="span18">Next</span> 
                </a> 
              </li> 
            </ul> 
          </div> 
        </div> 
      </div> 
    </div> 
  </div>  
  <span component="$UI/system/components/justep/windowReceiver/windowReceiver"
    xid="windowReceiver1" style="left:46px;top:190px;"/> 
</div>
