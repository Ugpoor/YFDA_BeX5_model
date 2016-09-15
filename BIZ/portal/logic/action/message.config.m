<model xmlns="http://www.justep.com/model">
	<config name="messageConfig" value="">
		<item name="items">
			<item name="wait">
				<item name="process" value="/SA/task/taskView/taskViewProcess"/>
				<item name="activity" value="mainActivity"/>
				<item name="action" value="queryWaitMessageAction"/>
			</item>
			<item name="submit">
				<item name="process" value="/SA/task/taskView/taskViewProcess"/>
				<item name="activity" value="mainActivity"/>
				<item name="action" value="querySubmitMessageAction"/>
			</item>
			<item name="tasksAssigned">
				<item name="process" value="/OA/personalOffice/process/tasksAssigned/tasksAssignedProcess"/>
				<item name="activity" value="mainActivity"/>
				<item name="action" value="tasksAssignedPortalAction"/>
			</item>
			<item name="schedule">
				<item name="process" value="/OA/personalOffice/process/schedule/scheduleProcess"/>
				<item name="activity" value="mainActivity"/>
				<item name="action" value="schedulePortalAction"/>
			</item>
			<item name="evection">
				<item name="process" value="/OA/personalOffice/process/evection/evectionProcess"/>
				<item name="activity" value="mainActivity"/>
				<item name="action" value="evectionPortalAction"/>
			</item>
			<item name = "leave">
				<item name="process" value="/OA/personalOffice/process/leaveApply/leaveApplyProcess"/>
				<item name="activity" value="listActivity"/>
				<item name="action" value="leavePortalAction"/>
			</item>
		</item>
	</config>  
</model>