<?xml version="1.0" encoding="UTF-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window" component="$UI/system/components/justep/window/window" design="device:pc">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:187px;top:504px;"><div component="$UI/system/components/justep/data/data" autoLoad="true" xid="memory" idColumn="fID" confirmDelete="false"><column label="ID" name="fID" type="String" xid="xid14"></column>
  <column label="内容" name="fContent" type="String" xid="xid15"></column>
  <column label="用户名" name="fUserName" type="String" xid="xid16"></column>
  <column label="地址" name="fAddress" type="String" xid="xid17"></column></div>
  <div component="$UI/system/components/justep/data/data" autoLoad="true" xid="orderData" idColumn="fID" onCustomRefresh="orderDataCustomRefresh" limit="10"><column label="ID" name="fID" type="String" xid="xid10"></column>
  <column label="内容" name="fContent" type="String" xid="xid11"></column>
  <column label="用户名" name="fUserName" type="String" xid="xid12"></column>
  <column label="地址" name="fAddress" type="String" xid="xid13"></column>
  <column label="电话" name="fPhoneNumber" type="String" xid="xid18"></column></div></div> 
<h4 xid="h41" class="center-block"><![CDATA[选中项分页记忆]]>
  <a component="$UI/system/components/justep/button/button" class="btn btn-link" label="js" xid="js" onClick="jsClick">
   <i xid="i2"></i>
   <span xid="span8">js</span></a>
  <a component="$UI/system/components/justep/button/button" class="btn btn-link" label="源码" xid="source" onClick="sourceClick">
   <i xid="i3"></i>
   <span xid="span9">源码</span></a></h4><a component="$UI/system/components/justep/button/button" class="btn btn-link" label="获取选中项" xid="obtain" onClick="obtainClick">
   <i xid="i1"></i>
   <span xid="span1">获取选中项</span></a>
  <div component="$UI/system/components/justep/grid/grid" hiddenCaptionbar="true" altRows="true" class="x-grid-no-bordered" xid="pagingGrid" data="orderData" multiselect="true" showRowNumber="true" width="100%" onRowChecked="pagingGridRowChecked" height="auto">
   <columns xid="columns1"><column name="fUserName" xid="column3" width="100"></column><column name="fContent" xid="column2"></column>
  
  <column name="fAddress" xid="column4"></column>
  <column width="100" name="fPhoneNumber" xid="column5"></column></columns></div>
  <div component="$UI/system/components/justep/pagerBar/pagerBar" class="x-pagerbar container-fluid" xid="pagerBar1" data="orderData">
   <div class="row" xid="div1">
    <div class="col-sm-3" xid="div2">
     <div class="x-pagerbar-length" xid="div3">
      <label component="$UI/system/components/justep/pagerLimitSelect/pagerLimitSelect" class="x-pagerlimitselect" xid="pagerLimitSelect1" defaultValue="10">
       <span xid="span12">显示</span>
       <select component="$UI/system/components/justep/select/select" class="form-control input-sm" xid="select1">
        <option value="10" xid="default1">10</option>
        <option value="20" xid="default2">20</option>
        <option value="50" xid="default3">50</option>
        <option value="100" xid="default4">100</option></select> 
       <span xid="span13">条</span></label> </div> </div> 
    <div class="col-sm-3" xid="div4">
     <div class="x-pagerbar-info" xid="div5">当前显示0条，共0条</div></div> 
    <div class="col-sm-6" xid="div6">
     <div class="x-pagerbar-pagination" xid="div7">
      <ul class="pagination" component="$UI/system/components/bootstrap/pagination/pagination" xid="pagination3">
       <li class="prev" xid="li11">
        <a href="#" xid="a11">
         <span aria-hidden="true" xid="span14">«</span>
         <span class="sr-only" xid="span15">Previous</span></a> </li> 
       <li class="next" xid="li12">
        <a href="#" xid="a12">
         <span aria-hidden="true" xid="span16">»</span>
         <span class="sr-only" xid="span17">Next</span></a> </li> </ul> </div> </div> </div> </div></div>