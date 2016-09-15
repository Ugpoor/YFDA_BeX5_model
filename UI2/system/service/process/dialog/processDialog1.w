<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window" component="$UI/system/components/justep/window/window">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:496px;top:429px;"> 
    <div component="$UI/system/components/justep/data/data" xid="controlData"  autoLoad="true"
      idColumn="rowid"> 
      <column name="rowid" type="String"/>  
      <column name="message" type="String"/>  
      <column name="postscript" type="String"/>  
      <data><![CDATA[
      [{rowid: '0', message: '', postscript:''}]
      ]]></data> 
    </div>  
    <div component="$UI/system/components/justep/data/data" xid="activityData"
      idColumn="rowid"> 
      <column name="rowid" type="String"/>  
      <column name="selected" type="Integer"/>  
      <column name="isEnd" type="Integer"/>  
      <column name="label" type="String"/>  
      <data/> 
    </div>  
    <div component="$UI/system/components/justep/data/data" xid="flowToData"
      idColumn="rowid"> 
      <column name="rowid" type="String"/>  
      <column name="sName" type="String"/>  
      <column name="sExecuteMode" type="String"/>  
      <column name="sPreemptMode" type="String"/>  
      <column name="sExecuteMode2" type="String"/>  
      <data/> 
    </div>  
    <div component="$UI/system/components/justep/data/data" xid="noticeData"
      idColumn="rowid"> 
      <column name="rowid" type="String"/>  
      <column name="selected" type="Integer"/>  
      <column name="sName" type="String"/>  
      <data/> 
    </div>  
    <div component="$UI/system/components/justep/data/data" xid="executorData"
      idColumn="rowid" confirmDelete="false"> 
      <column name="rowid" type="String"/>  
      <column name="owner" type="String"/>  
      <column name="sFID" type="String"/>  
      <column name="sFName" type="String"/>  
      <column name="responsible" type="Integer"/>  
      <column name="sName" type="String"/>  
      <data/> 
    </div> 
  </div>  
  <span xid="windowReceive" component="$UI/system/components/justep/windowReceiver/windowReceiver"
    onReceive="windowReceiveReceive" style="top:12px;left:92px;"/>  
  <div xid="dialogs"/>  
  <div component="$UI/system/components/justep/panel/panel" class="x-panel x-full"> 
    <div class="x-panel-top"> 
      <div xid="bar" component="$UI/system/components/justep/titleBar/titleBar"
        title="" class="x-titlebar"> 
        <div class="x-titlebar-left">
			<a component="$UI/system/components/justep/button/button" label=""
				class="btn btn-link btn-only-icon" icon="icon-chevron-left"
				onClick="cancelBtnClick" xid="cancelBtn">
				<i class="icon-chevron-left" />
				<span></span>
			</a>
        </div>  
        <div class="x-titlebar-title"/>  
        <div class="x-titlebar-right reverse"> 
          <a component="$UI/system/components/justep/button/button" label=""
            class="btn btn-link btn-only-icon" icon="glyphicon glyphicon-ok" onClick="okBtnClick"
            xid="okBtn"> 
            <i class="glyphicon glyphicon-ok"/>  
            <span></span> 
          </a> 
        </div> 
      </div> 
    </div>  
    <div class="x-panel-content"> 
      <label xid="message" class="text-center" style="width:100%;font-weight: bold;margin:8px"
        bind-visible="$model.activityData.getCount() == 0" bind-text="$model.controlData.ref('message')"/>  
      <div class="panel-group"> 
        <div class="panel panel-default x-list" bind-visible="$model.activityData.getCount() &gt; 0"
          data="activityData" component="$UI/system/components/justep/list/list"> 
          <div class="panel-heading">环节</div>  
          <ul class="list-group x-list-template "> 
            <li class="list-group-item"> 
              <div class="x-row x-row-center" component="$UI/system/components/justep/row/row"> 
                <div class="x-col x-col-10"> 
                  <span component="$UI/system/components/justep/button/checkbox"
                    bind-ref="ref('selected')" class="x-checkbox" onChange="checkbox2Change"/> 
                </div>  
                <div class="x-col"> 
                  <div class="x-row x-row-center" component="$UI/system/components/justep/row/row"> 
                    <div class="x-col font-bold"> 
                      <label bind-text="ref('label')"/> 
                    </div> 
                  </div>  
                  <div class="x-list" component="$UI/system/components/justep/list/list"
                    data="executorData" filter="js:val('rowid') == $row.val('owner')"> 
                    <div class="x-list-template"> 
                      <div class="x-row x-row-center " component="$UI/system/components/justep/row/row"> 
                        <div class="x-col"> 
                          <label bind-text="ref('sName')"/> 
                        </div>  
                        <div class="x-col x-col-10"> 
                          <a component="$UI/system/components/justep/button/button" 
                            label="删除" class="pull-right btn btn-link " xid="deleteToExecutorBtn" 
                            onClick="deleteToExecutorBtnClick"> 
                            <i/>  
                            <span>删除</span> 
                          </a> 
                        </div> 
                      </div> 
                    </div> 
                  </div>  
                  <div class="x-row" bind-visible="!val('isEnd')" component="$UI/system/components/justep/row/row"> 
                    <div class="x-col"> 
                      <a component="$UI/system/components/justep/button/button"
                        label="添加办理人" class="btn btn-link" xid="addToExecutorBtn"
                        style="padding-left:0px;" onClick="addToExecutorBtnClick"> 
                        <i/>  
                        <span>添加办理人</span> 
                      </a> 
                    </div>  
                    <div class="x-col"> 
                      <a component="$UI/system/components/justep/button/button"
                        label="高级选项" class="pull-right btn btn-link" xid="advanceToBtn"
                        onClick="advanceBtnClick"> 
                        <i/>  
                        <span>高级选项</span> 
                      </a> 
                    </div> 
                  </div> 
                </div> 
              </div> 
            </li> 
          </ul> 
        </div>  
        <div class="panel panel-default x-list" bind-visible="$model.noticeData.getCount() &gt; 0"
          data="noticeData" component="$UI/system/components/justep/list/list"> 
          <div class="panel-heading">通知</div>  
          <ul class="list-group x-list-template "> 
            <li class="list-group-item"> 
              <div class="x-row x-row-center" component="$UI/system/components/justep/row/row"> 
                <div class="x-col x-col-10"> 
                  <span component="$UI/system/components/justep/button/checkbox"
                    bind-ref="ref('selected')" class="x-checkbox"/> 
                </div>  
                <div class="x-col"> 
                  <div class="x-row" component="$UI/system/components/justep/row/row"> 
                    <div class="x-col"> 
                      <input class="form-control" component="$UI/system/components/justep/input/input"
                        data="noticeData" bind-ref="ref('sName')"/> 
                    </div> 
                  </div>  
                  <div component="$UI/system/components/justep/list/list" class="x-list"
                    data="executorData" filter="js:val('rowid') == $row.val('owner')"> 
                    <div class="x-list-template"> 
                      <div class="x-row x-row-center " component="$UI/system/components/justep/row/row"> 
                        <div class="x-col"> 
                          <label bind-text="ref('sName')"/> 
                        </div>  
                        <div class="x-col x-col-10"> 
                          <a component="$UI/system/components/justep/button/button"
                            label="删除" class="pull-right btn btn-link " xid="deleteNoticeExecutorBtn"
                            onClick="deleteNoticeExecutorBtnClick"> 
                            <i/>  
                            <span>删除</span> 
                          </a> 
                        </div> 
                      </div> 
                    </div>  
                    <div class="x-row" component="$UI/system/components/justep/row/row"> 
                      <div class="x-col"> 
                        <a component="$UI/system/components/justep/button/button"
                          label="添加办理人" class="btn btn-link" xid="addNoticeExecutorBtn"
                          onClick="addNoticeExecutorBtnClick"
                          style="padding-left:0px;"> 
                          <i/>  
                          <span>添加办理人</span> 
                        </a> 
                      </div> 
                    </div> 
                  </div> 
                </div> 
              </div> 
            </li> 
          </ul> 
        </div>  
        <div class="panel panel-default"> 
          <div class="panel-heading">附言</div>  
          <textarea class="form-control" component="$UI/system/components/justep/textarea/textarea"
            data="controlData" bind-ref="$model.controlData.ref('postscript')" rows="5"
            style="border-top-right-radius: 0px;border-top-left-radius: 0px;"/> 
        </div>  
        <!-- 
          <div class="panel panel-default x-list" bind-visible="$model.activityData.getCount() &gt; 0"
            data="flowToData" component="$UI/system/components/justep/list/list"> 
            <div class="panel-heading">test: flowto</div>  
            <ul class="list-group x-list-template "> 
              <li class="list-group-item"> 
                
                  <div class="x-row x-row-center" component="$UI/system/components/justep/row/row"> 
                    <div class="x-col"> 
                      <label bind-text="ref('sName')"/> 
                    </div>  
                    <div class="x-col"> 
                      <label bind-text="ref('sExecuteMode')"/> 
                    </div>  
                    <div class="x-col"> 
                      <label bind-text="ref('sPreemptMode')"/> 
                    </div> 
                  </div> 
                 
              </li> 
            </ul> 
          </div>
          --> 
      </div> 
    </div> 
  </div> 
</div>
