<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" class="window" component="$UI/system/components/justep/window/window">  
  <div component="$UI/system/components/justep/model/model" xid="model1" style="position:absolute;;left:316px;top:47px"> 
    <div component="$UI/system/components/justep/data/data" autoLoad="true"
      xid="historyRecord" idColumn="SA_DocLog" onCustomRefresh="historyRecordCustomRefresh"> 
      <column label="SA_DocLog" name="SA_DocLog" type="String" xid="default1"/>  
      <column label="版本" name="sDocVersionID" type="String" xid="default2"/>  
      <column label="名称" name="sDocName" type="String" xid="default3"/>  
      <column label="大小" name="sSize" type="String" xid="default5"/>  
      <column label="提交人" name="sPersonName" type="String" xid="default6"/>  
      <column label="提交部门" name="sDeptName" type="String" xid="default7"/>  
      <column label="提交时间" name="sTime" type="String" xid="default8"/> 
    </div> 
  </div>  
  <span component="$UI/system/components/justep/windowReceiver/windowReceiver"
    xid="docHistoryDialog" style="left:343px;top:266px;" onReceive="docHistoryDialogReceive"/>  
  <div component="$UI/system/components/justep/button/buttonGroup" class="btn-group btn-group-justified" tabbed="true" xid="buttonGroup2"> 
          
          
          
          
         
      </div><div component="$UI/system/components/justep/toolBar/toolBar" class="x-toolbar x-toolbar-spliter" xid="toolBar1"><a component="$UI/system/components/justep/button/button" class="btn btn-link" label="下载文件" xid="button3" icon="icon-archive" onClick="downloadDoc"> 
          <i xid="i3" class="icon-archive" />  
          <span xid="label3">下载文件</span> 
        </a><a component="$UI/system/components/justep/button/button" class="btn btn-link" label="查看文件" xid="button4" icon="icon-eye" onClick="browseDoc"> 
          <i xid="i4" class="icon-eye" />  
          <span xid="label4">查看文件</span> 
        </a><a component="$UI/system/components/justep/button/button" class="btn btn-link" label="查看修订文件" xid="button5" icon="icon-eye" onClick="browseRevisionDoc"> 
          <i xid="i5" class="icon-eye" />  
          <span xid="label5">查看修订文件</span> 
        </a><a component="$UI/system/components/justep/button/button" class="btn btn-link" label="删除当前历史版本" xid="button6" icon="icon-ios7-close" onClick="deleteCurrentVersion"> 
          <i xid="i6" class="icon-ios7-close" />  
          <span xid="label6">删除当前历史版本</span> 
        </a><a component="$UI/system/components/justep/button/button" class="btn btn-link" label="删除历史版本" xid="button7" icon="icon-ios7-close" onClick="deleteVersion"> 
          <i xid="i7" class="icon-ios7-close" />  
          <span xid="label7">删除历史版本</span> 
        </a></div><div component="$UI/system/components/bootstrap/tabs/tabs" xid="tabs1"> 
        <ul class="nav nav-tabs" xid="tabNav1"> 
          <li class="active" xid="li1"> 
            <a content="tabContent1" xid="tabItem1">常规</a> 
          </li>  
          <li role="presentation" xid="li2" bind-click="li2Click"> 
            <a content="tabContent2" xid="tabItem2" onSelect="tabItem2Select">修订项</a> 
          </li>
        </ul>
        <div class="tab-content" style="height:100%" xid="inputGroup1"> 
          <div class="tab-pane active" xid="tabContent1"> 
             
          <div component="$UI/system/components/justep/grid/grid" class="x-grid-no-bordered" xid="grid2" data="historyRecord" height="auto" width="100%" hiddenCaptionbar="true"> 
              <columns xid="columns2"> 
                <column align="center" name="sDocVersionID" label="版本" width="100" />  
                <column align="center" name="sDocName"/>  
                <column align="center" name="sSize" label="大小" width="100" />  
                <column align="center" name="sPersonName" label="提交人" width="100" />  
                <column align="center" name="sDeptName" label="提交部门" width="100" />  
                <column align="center" name="sTime" label="提交时间" width="100"/> 
              </columns> 
            </div></div>  
          <div class="tab-pane" xid="tabContent2">
            <textarea rows="5" xid="commentArea" style="width:100%;"/>
          </div> 
        </div> 
      </div>
  </div>
