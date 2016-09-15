<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" component="$UI/system/components/justep/window/window" sysParam="portal">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="top:26px;height:auto;left:378px;" onActive="modelActive" onLoad="modelLoad"> 
    <div component="$UI/system/components/justep/data/bizData" xid="taskData" 
      autoLoad="false" concept="SA_Task" orderBy="sCreateTime desc" confirmRefresh="false" limit="5"  offset="-1" columns="sName,sCreateTime,sExecutorFName,sExecutorNames,sCreatorFName,sProcess,sActivity,sExecutorFID,sCURL,sData1,sData2,sData3,sData4"> 
      <reader action="/SA/task/logic/action/querySubmitTask2Action"/> 
    </div> 
  </div>  
  <div/>  
      <div class="x-list" component="$UI/system/components/justep/list/list"
        data="taskData" limit="5" autoLoad="false" xid="list"> 
        <div class="x-list-head"/>  
        <div class="x-list-content"> 
             <ul class="x-list-template"> 
             <!-- bind-css="{ 'x-currentRow': $model.taskData.currentRow.get() == $object }" -->
               <li class="list-group-item"  bind-click="li2Click"> 
                 <div class="x-row x-row-center" component="$UI/system/components/justep/row/row"> 
                   <div class="x-col" style="font-weight:bold"> 
                     <span component="$UI/system/components/justep/output/output"
                       data="taskData" bind-ref="ref('sName')"/> 
                   </div>  
                 </div>  
                 <div class="x-row x-row-center" style="color:gray" component="$UI/system/components/justep/row/row"> 
                   <div class="x-col"> 
                     <span component="$UI/system/components/justep/output/output"
                       data="taskData" bind-ref="ref('sExecutorFName')"/> 
                   </div>  
                   <div class="x-col"> 
                     <span component="$UI/system/components/justep/output/output"
                       data="taskData" bind-ref="ref('sCreateTime')" format="yyyy-MM-dd"/> 
                   </div> 
                 </div> 
               </li> 
             </ul> 
        </div> 
      </div> 
</div>
