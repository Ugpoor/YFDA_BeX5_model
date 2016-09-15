<div 
  xmlns:xu="http://www.xmldb.org/xupdate" 
  xmlns:xui="http://www.justep.com/xui" 
  __id="id_1" 
  extends="$UI/SA/OPM/grade/mainActivity.w" 
  component="$UI/system/components/justep/window/window" 
  xid="window" 
  class="window x-full-screen container-fluid" 
  xmlns="http://www.w3.org/1999/xhtml" 
  design="device:mobile" >

   <span xid="orgDialog" manageCodes="systemManagement" rootFilter="1=1"  xui:update-mode="merge"/>
   <div xid="orgTreePC1" manageCodes="systemManagement"  xui:update-mode="merge"/>
    <treeOption rootFilter="1=1" xid="default1_1" xui:parent="orgTreeData" xui:update-mode="insert" />

</div>