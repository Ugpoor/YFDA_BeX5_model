<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window" component="$UI/system/components/justep/window/window"
  design="device:m;">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:348px;top:465px;"> 
    <div component="$UI/system/components/justep/data/data" autoLoad="true"
      xid="channelData" idColumn="value"> 
      <column label="值" name="value" type="String" xid="xid1"/>  
      <data xid="default1">[{"value":"官方网站"},{"value":"媒体报道"},{"value":"微信微博"},{"value":"朋友介绍"}]</data>
    </div>  
    <div component="$UI/system/components/justep/data/data" autoLoad="true"
      xid="interestedData" idColumn="vale">
      <column label="zhi " name="vale" type="String" xid="xid3"/>  
      <data xid="default2">[{"vale":"选项1"},{"vale":"选项2"},{"vale":"选项3"}]</data>
    </div>
  <div component="$UI/system/components/justep/data/data" autoLoad="false" xid="messageData" idColumn="channel" autoNew="true"><column label="频道" name="channel" type="String" xid="xid2"></column>
  <column label="兴趣" name="interested" type="String" xid="xid4"></column>
  <column label="满意度" name="satisfied" type="String" xid="xid5"></column>
  <column label="反馈" name="feedback" type="String" xid="xid6"></column>
  <column label="昵称" name="nickname" type="String" xid="xid7"></column>
  <column label="公司" name="company" type="String" xid="xid8"></column>
  <column label="职位" name="position" type="String" xid="xid9"></column>
  <column label="电话" name="phone" type="String" xid="xid10"></column>
  <column label="邮箱" name="email" type="String" xid="xid11"></column></div></div>  
  <img src="" alt="" xid="image1" class="img-responsive" bind-attr-src="$model.toUrl('./img/1.png')"/>  
  <div xid="div1" class="title"> 
    <p xid="p1" style="text-align:center;font-size:18px;line-height:25px;"><![CDATA[感谢您参加大会!]]></p>  
    <div xid="div2" class="sTitle"> 
      <p xid="p2" style="font-size:1em;text-align:center;line-height:20px;"><![CDATA[为了能够给您带来更好的参会体验，诚挚邀请您参与我们的问卷调查。]]></p> 
    </div> 
  </div>  
  <div xid="div7" class="list-group"> 
    <a xid="channel" class="list-group-item"> 
      <p xid="p8" style="font-size:18px;" fid="channel"><![CDATA[1.通过何种渠道了解到此次大会的？]]></p>  
      <div xid="div6" class="div-channel">
        <span component="$UI/system/components/justep/select/checkboxGroup"
          class="x-checkbox-group x-checkbox-group-vertical" xid="checkboxGroup2"
          bind-itemset="channelData" bind-itemsetValue="ref(&quot;value&quot;)" bind-itemsetLabel="ref(&quot;value&quot;)" bind-ref='$model.messageData.ref("channel")'/>
      </div>
    </a>  
    <a xid="interested" class="list-group-item"> 
      <p xid="p5" style="font-size:18px;" fid="interested"><![CDATA[2.对本次活动的哪些环节最感兴趣？]]></p>  
      <div xid="div8" class="div-interested">
        <span component="$UI/system/components/justep/select/checkboxGroup"
          class="x-checkbox-group x-checkbox-group-vertical" xid="checkboxGroup3"
          bind-itemset="interestedData" bind-itemsetValue="ref(&quot;vale&quot;)" bind-itemsetLabel="ref(&quot;vale&quot;)" bind-ref='$model.messageData.ref("interested")'/>
      </div>
    </a>  
    <a xid="star" class="list-group-item"> 
      <p xid="p6" style="font-size:18px;" fid="star"><![CDATA[3.对本次活动的总体满意度如何？]]></p>  
      <div xid="starGroup" bind-click="changeStarColor" fid="star"> 
        <span xid="span1" class="star" count="1" fid="star"/>  
        <span xid="span2" class="star" count="2" fid="star"/>  
        <span xid="span3" class="star" count="3" fid="star"/>  
        <span xid="span4" class="star" count="4" fid="star"/>  
        <span xid="span5" class="star" count="5" fid="star"/>  
        <span xid="span6" class="star" count="6" fid="star"/>  
        <span xid="span7" class="star" count="7" fid="star"/>  
        <span xid="span8" class="star" count="8" fid="star"/>  
        <span xid="span9" class="star" count="9" fid="star"/>  
        <span xid="span10" class="star" count="10" fid="star"/> 
      </div> 
    </a>  
    <a xid="feedback" class="list-group-item"> 
      <p xid="p7" style="font-size:18px;" fid="feedback"><![CDATA[4.有其他反馈相对我们说的吗?]]></p>  
      <div xid="div3" class="ssTitle" fid="feedback"> 
        <p xid="p4" style="text-align:left;" fid="feedback"><![CDATA[欢迎各种吐槽、批评或表扬，我们会认真听取你的建议和意见。]]></p> 
      </div>  
      <textarea component="$UI/system/components/justep/textarea/textarea" class="form-control"
        xid="feedBacktextarea" fid="feedback" style="height:100px;" bind-ref='$model.messageData.ref("feedback")'/> 
    </a>  
    <a xid="div4" class="list-group-item"> 
      <p xid="p9" style="font-size:18px;" fid="div4"><![CDATA[联系方式]]></p>  
      <div xid="div5" class="ssTitle"> 
        <p xid="p10" style="text-align:left;">你的反馈对我们来说非常重要，请尽量留下有效的联系方式，以便我们跟进处理~</p> 
      </div> 
    </a>  
    <a xid="nickname" class="list-group-item"> 
      <p xid="p11" style="font-size:18px;" fid="nickname"><![CDATA[我们该如何称呼你？*]]></p>  
      <input component="$UI/system/components/justep/input/input" class="form-control"
        xid="callInput" fid="nickname" bind-ref='$model.messageData.ref("nickname")'/> 
    </a>  
    <a xid="company" class="list-group-item"> 
      <p xid="p12" style="font-size:18px;" fid="company"><![CDATA[公司*]]></p>  
      <input component="$UI/system/components/justep/input/input" class="form-control"
        xid="companyInput" fid="company" bind-ref='$model.messageData.ref("company")'/> 
    </a>  
    <a xid="position" class="list-group-item"> 
      <p xid="p13" style="font-size:18px;" fid="position"><![CDATA[职位*]]></p>  
      <input component="$UI/system/components/justep/input/input" class="form-control"
        xid="positionInput" fid="position" bind-ref='$model.messageData.ref("position")'/> 
    </a>  
    <a xid="phone" class="list-group-item"> 
      <p xid="p14" style="font-size:18px;" fid="phone"><![CDATA[手机*]]></p>  
      <input component="$UI/system/components/justep/input/input" class="form-control"
        xid="phoneInput" fid="phone" bind-ref='$model.messageData.ref("phone")'/> 
    </a>  
    <a xid="email" class="list-group-item"> 
      <p xid="p15" style="font-size:18px;" fid="email"><![CDATA[E-mail*]]></p>  
      <input component="$UI/system/components/justep/input/input" class="form-control"
        xid="emailInput" fid="email" bind-ref='$model.messageData.ref("email")'/> 
    </a>  
    <div component="$UI/system/components/justep/row/row" class="x-row" xid="row1"> 
      <div class="x-col" xid="col1"/>  
      <div class="x-col" xid="col2"> 
        <a component="$UI/system/components/justep/button/button" class="btn btn-default btn-block"
          label="提交" xid="submitBtn"> 
          <i xid="i1"/>  
          <span xid="span11">提交</span> 
        </a> 
      </div>  
      <div class="x-col" xid="col3"/> 
    </div> 
  </div> 
</div>
