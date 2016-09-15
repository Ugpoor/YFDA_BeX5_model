<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xmlns:xu="http://www.xmldb.org/xupdate"
  xmlns:xui="http://www.justep.com/xui" __id="id_1" extends="../parent/parent.w" component="$UI/system/components/justep/window/window"
  xid="window" class="window" design="device:m;">  
  <div xid="model" style="height:auto;left:191px;top:24px;" xui:update-mode="merge"/>  
  <div autoLoad="true" component="$UI/system/components/justep/data/data" idColumn="business"
    xid="businessData" xui:parent="model" xui:update-mode="insert"> 
    <column label="商家" name="business" type="String" xid="xid1_2"/>  
    <column label="折扣" name="zhekou" type="String" xid="xid2_2"/>  
    <data xid="default1_2">[{"business":"京东","zhekou":"7折"},{"business":"淘宝","zhekou":"9折"},{"business":"天猫","zhekou":"8折"}]</data> 
  </div>  
  <div class="x-control-group" component="$UI/system/components/justep/controlGroup/controlGroup"
    title="折扣商家" xid="controlGroup1_2" xui:parent="content1" xui:update-mode="insert"> 
    <div class="x-control-group-title" xid="controlGroupTitle1_2"> 
      <span xid="span1_2"> <![CDATA[折扣商家]]> </span> 
    </div>  
    <div class="x-list x-cards" component="$UI/system/components/justep/list/list"
      data="businessData" xid="list1_2"> 
      <ul class="x-list-template x-min-height list-group" componentname="$UI/system/components/justep/list/list#listTemplateUl"
        id="undefined_listTemplateUl1_2" xid="listTemplateUl1_2"> 
        <li class="x-min-height list-group-item" componentname="li(html)"
          id="undefined_li1_2" xid="li1_2"> 
          <div class="x-row" component="$UI/system/components/justep/row/row"
            xid="row1_2"> 
            <div class="x-col" xid="col1_2"> 
              <label bind-text="ref('business')" style="font-size:16px;" xid="label1_2">label</label> 
            </div>  
            <div class="x-col" xid="col2_2"> 
              <div bind-ref="ref('zhekou')" class="x-output" component="$UI/system/components/justep/output/output"
                style="color:#FF5555;font-size:16px;" xid="output1_2"/> 
            </div> 
          </div> 
        </li> 
      </ul> 
    </div> 
  </div> 
</div>
