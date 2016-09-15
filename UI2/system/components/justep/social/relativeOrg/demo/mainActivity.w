<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window"
	component="$UI/system/components/justep/window/window">
	<div component="$UI/system/components/justep/model/model" xid="model">
	    <div component="$UI/system/components/justep/data/bizData" xid="taskData" 
	      autoLoad="true" concept="SA_Task" orderBy="sCreateTime:desc" confirmRefresh="false" limit="5"> 
	      <reader action="/SA/task/logic/action/queryTaskAction"/> 
	      <writer action="/SA/task/logic/action/saveTaskAction"/> 
	    </div> 
	</div>
	
	
	
	
	
	<div component="$UI/system/components/justep/panel/panel" class="x-panel x-full"
		>
		<div class="x-panel-top">
			<div component="$UI/system/components/justep/titleBar/titleBar"
				title="相关人" class="x-titlebar">
				<div class="x-titlebar-left">
					<a component="$UI/system/components/justep/button/button" label=""
						class="btn btn-link btn-only-icon" icon="icon-chevron-left"
						onClick="backBtnClick" xid="backBtn">
						<i class="icon-chevron-left" />
						<span></span>
					</a>
				</div>
				<div class="x-titlebar-title">相关人</div>
				<div class="x-titlebar-right reverse">
				</div>
			</div>
		</div>
		<div class="x-panel-content" refresh="true">
			
 			<div class="x-list x-inner-scroll" component="$UI/system/components/justep/list/list"
        		data="taskData" limit="20">
        		<div class="x-list-content">
					<ul class="x-list-template"> 
	                <li class="list-group-item" bind-css="{ 'x-currentRow': $model.taskData.currentRow.get() == $object }" > 
	                  <div class="x-row x-row-center" component="$UI/system/components/justep/row/row"> 
	                    <div class="x-col" style="font-weight:bold"> 
	                      <span component="$UI/system/components/justep/output/output"
	                        data="taskData" bind-ref="ref('sName')"/> 
	                    </div>  
	                  </div>  
	                  <div class="x-row x-row-center" style="color:gray" component="$UI/system/components/justep/row/row"> 
	                    <div class="x-col"> 
	                      <span component="$UI/system/components/justep/output/output"
	                        data="taskData" bind-ref="ref('sCreatorFName')"/> 
	                    </div>  
	                    <div class="x-col"> 
	                      <span component="$UI/system/components/justep/output/output"
	                        data="taskData" bind-ref="ref('sCreateTime')" format="yyyy-MM-dd"/> 
	                    </div> 
	                  </div> 
	                </li> 
	              </ul>         		
        		</div>
        		
			<div component="$UI/system/components/justep/controlGroup/controlGroup"
				class="x-control-group">
				
				<input bind-value='$model.taskData.ref("sName")'></input>
				<!-- 
				<button bind-click='clearMessageNumber'>clearMessageNumber</button>
				<button xid="save" bind-click='saveClick'>保存</button>
				
				<button bind-click='clearMessageNumber'>clearMessageNumber</button>
				<button bind-click='updateMessageNumber'>updateMessageNumber</button>
				 -->
				
				<div component="$UI/system/components/justep/social/relativeOrg/relativeOrgs" 
					data="taskData" class="x-ros x-ros-border"  bind-nameRef="taskData.ref('sName')">
					<div component='$UI/system/components/justep/data/bizData' concept='SA_Social' xid="socialData"/>
					<div class="x-ros-item" groupName="负责人" groupID="master" limit="1" 
						filter="" multiSelection="false" statusEnabled="true" multiValue="true"/>
					<div class="x-ros-item" groupName="相关人" groupID="guest" limit="5" 
						filter="" multiSelection="true" statusEnabled="true" readonly=""/>
				</div>
			</div>
				 	
        	</div>	 		
		</div>
	</div>
</div>

