<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" component="$UI/system/components/justep/window/window" xid="window" design="device:mobile">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="left:18px;top:83px;height:244px;"> 
    <div component="$UI/system/components/justep/data/data" autoLoad="true"
      xid="data" idColumn="id"> 
      <column label="id" name="id" type="String"/>  
      <column label="title" name="title" type="String"/>  
      <column label="companyName" name="companyName" type="String"/>  
      <column label="地址" name="address" type="String"/>  
      <column label="电话" name="tel" type="String"/>  
      <column label="邮编" name="postalCode" type="String"/>  
      <column label="网址" name="website" type="String"/>  
      <column label="邮箱" name="email" type="String"/>  
      <data xid="default2">[{"id":"1","title":"联系我们","companyName":"北京起步科技有限公司","address":"北京市朝阳区东三环南路98号高和蓝峰大厦18层","tel":"(010)2883925","postalCode":"111111","website":"http://www.justep.com","email":"justep@justep.com.cn"}]</data> 
    </div> 
  </div>  
  <div component="$UI/system/components/justep/panel/panel" class="x-panel x-full"> 
    <div class="x-panel-top" height="88"> 
      <div component="$UI/system/components/justep/titleBar/titleBar" title="联系我们"
        class="x-titlebar"> 
        <div class="x-titlebar-left"> 
          <a component="$UI/system/components/justep/button/button" label=""
            class="btn btn-link btn-only-icon" icon="icon-chevron-left" onClick="{operation:'window.close'}"
            xid="backBtn"> 
            <i class="icon-chevron-left"/>  
            <span/> 
          </a> 
        </div>  
        <div class="x-titlebar-title">联系我们</div>  
        <div class="x-titlebar-right reverse"/> 
      </div> 
    <div component="$UI/system/components/justep/button/buttonGroup" class="btn-group btn-group-justified o-class" tabbed="true" xid="buttonGroup1">
   <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-only-label active" label="联系我们" xid="button1" target="content1">
    <i xid="i3"></i>
    <span xid="span8">联系我们</span></a> 
   <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-only-label" label="关于我们" xid="button2" target="content2">
    <i xid="i4"></i>
    <span xid="span9">关于我们</span></a> </div></div>  
    <div class="x-panel-content panel-body"> 
      <div component="$UI/system/components/justep/contents/contents" class="x-contents x-full" active="0" xid="contents1">
   <div class="x-contents-content" xid="content1"><div class="panel-body"><h4 bind-text="data.ref('companyName')" xid="h42" class="text-black"></h4>
  <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label15" xid="labelOutput1">
   <label class="x-label" xid="label1" bind-text="data.label('address')"></label>
   <div component="$UI/system/components/justep/output/output" class="x-output x-edit" xid="output2" bind-ref="data.ref('address')"></div></div>
  <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label15" xid="labelOutput2">
   <label class="x-label" xid="label2" bind-text="data.label('tel')"></label>
   <div component="$UI/system/components/justep/output/output" class="x-output x-edit" xid="output3" bind-ref="data.ref('tel')"></div></div>
  <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label15" xid="labelOutput3">
   <label class="x-label" xid="label3" bind-text="data.label('postalCode')"></label>
   <div component="$UI/system/components/justep/output/output" class="x-output x-edit" xid="output4" bind-ref="data.ref('postalCode')"></div></div>
  <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label15" xid="labelOutput4">
   <label class="x-label" xid="label4" bind-text="data.label('website')"></label>
   <div component="$UI/system/components/justep/output/output" class="x-output x-edit" xid="output5" bind-ref="data.ref('website')"></div></div>
  <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label15" xid="labelOutput5">
   <label class="x-label" xid="label5" bind-text="data.label('email')"></label>
   <div component="$UI/system/components/justep/output/output" class="x-output x-edit" xid="output6" bind-ref="data.ref('email')"></div></div></div></div>
  <div class="x-contents-content" xid="content2"><div class=" panel-body">
   <p xid="p1">起步软件公司（Justep）成立于2006年7月。Justep先后推出了Justep X3、Justep X5企业管理与政务管理平台等系列产品，成功应用于政府、制造、航天、电力、交通和矿业等数十个领域和行业，获得广大客户的广泛认同和高度赞誉，多年来一直在用户满意度、企业用户数和合作伙伴数、产品竞争力等方面行业排名第一！起步科技坚持对客户抱以踏实认真的态度，把客户价值和成功当作最根本的目标和评判依据，致力于帮助更多的中国企业实现管理信息化的成功！</p>
   <p xid="p2">起步软件推出的X5系列平台是集云应用、企业应用、移动应用共存的开发平台领导厂商，同时也是中国领先的管理软件联盟运营商。通过创新的技术、产品和商业模式，构建了业界的管理软件开发商联盟，推进中国信息化行业的商业模式升级，引领互联网、移动、云技术和电子商务普及时代的信息化发展方向。起步软件开创了企业应用在互联网、移动、云技术时代的全新架构和开发模式，满足了信息化建设在新技术和商业环境下的“自我掌控、随需应变、持续完善、面向未来”的需求。X5已成为管理软件和电子政务的优选平台，已被数千家开发商采用，成功应用于政府、军队、金融、制造、航天、能源、交通和建设等各个领域和行业。</p></div></div>
  </div></div> 
  </div> 
</div>
