<div 
  xmlns:xu="http://www.xmldb.org/xupdate" 
  xmlns:xui="http://www.justep.com/xui" 
  __id="id_1" 
  component="$UI/system/components/justep/window/window" 
  extends="$UI/SA/OPM/authorizationByRole/mainActivity.w" 
  xid="window" 
  class="window x-full-screen container-fluid" 
  xmlns="http://www.w3.org/1999/xhtml" 
  design="device:pc" >

   <div xid="roleData" limit="-1" onRefreshCreateParam="roleDataRefreshCreateParam"  xui:update-mode="merge"/>
   <span xid="orgDialog" manageCodes="systemManagement"  xui:update-mode="merge"/>

</div>