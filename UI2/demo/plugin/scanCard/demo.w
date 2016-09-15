<div 
  xmlns:xui="http://www.justep.com/xui" 
  xmlns:xu="http://www.xmldb.org/xupdate" 
  xmlns="http://www.w3.org/1999/xhtml" 
  component="$UI/system/components/justep/window/window" 
  xid="window" 
  extends="$UI/demo/plugin/template/demo.w" 
  __id="id_1" 
  design="device:m;" 
  class="window" >

  <div xid="div3" xui:update-mode="delete"/>
  <div xid="div6" xui:update-mode="delete"/>
  <div xid="div7" xui:update-mode="delete"/>
   <div xid="model" onModelConstructDone="modelModelConstructDone"  xui:update-mode="merge"/>
   <div xid="titleBar" title="scanCard"  xui:update-mode="merge"/>
    <div style="height:30px;" xid="div2_1" xui:parent="infoContent" xui:update-mode="insert" />
    <h4 xid="h41_1" xui:parent="infoContent" xui:update-mode="insert" >
<![CDATA[注意事项：]]>
</h4>
    <p xid="p5_1" xui:parent="infoContent" xui:update-mode="insert" >
<![CDATA[本demo使用的是脉可寻提供的一套公共测试的参数，拍照后会将数据上传至脉可寻的服务器，凡是用这套参数的测试者均可获取该数据，故如涉及个人隐私，请谨慎拍照上传。]]>
</p>
   <p xid="p1"  xui:update-mode="merge-and-replace">


ID：com.justep.cordova.plugin.scanCard</p>   <p xid="introduceP"  xui:update-mode="merge-and-replace">










名片识别插件，集成了脉可寻的SDK，免去自行录入名片或纠正识别结果的烦恼，开发者需要先申请key和secure才可以使用，本demo使用的是脉可寻提供的测试的一套参数。您只需要打开摄像头，拍取名片的照片，即可识别名片中的信息并将其上传至脉可寻的服务器，提供查询客户信息的接口，方便以后查询使用。脉可寻识别服务的流程为：认证->打开SDK相机页面->拍摄名片->确认上传成功->获取数据。
</p>   <p xid="platformP"  xui:update-mode="merge-and-replace">










iOS，Android</p>    <div style="height:70px;padding:0px 20px 20px 20px;" xid="div1_6" xui:parent="demoContent" xui:update-mode="insert" >
<p xid="p1_8" >
<![CDATA[授权相关接口：根据脉可寻的规范使用脉可寻的SDK，首先要授权。提供三个接口，分别为授权，检查是否授权，清除授权。<br/>授权接口需要传入一个合作伙伴客户标识，在此传入“12345”]]>
</p>
</div>
    <div style="height:50px;padding:40px" xid="div2_6" xui:parent="demoContent" xui:update-mode="insert" >
<a class="btn btn-default" component="$UI/system/components/justep/button/button" label="授权" onClick="aouthClick" style="width:100%;" xid="aouth" >
<i xid="i1_8" />
<span xid="span1_8" >


















授权</span>
</a>
</div>
    <div style="height:50px;padding:40px" xid="div3_6" xui:parent="demoContent" xui:update-mode="insert" >
<a class="btn btn-default" component="$UI/system/components/justep/button/button" label="检查是否授权" onClick="checkClick" style="width:100%;" xid="check" >
<i xid="i3_8" />
<span xid="span3_8" >


















检查是否授权</span>
</a>
</div>
    <div style="height:50px;padding:40px" xid="div4_6" xui:parent="demoContent" xui:update-mode="insert" >
<a class="btn btn-default" component="$UI/system/components/justep/button/button" label="清除授权" onClick="clearClick" style="width:100%;" xid="clear" >
<i xid="i2_8" />
<span xid="span2_8" >


















清除授权</span>
</a>
</div>
    <div xid="div5_6" xui:parent="demoContent" xui:update-mode="insert" />
    <div xid="div6_6" xui:parent="demoContent" xui:update-mode="insert" />
    <div xid="div7_6" xui:parent="demoContent" xui:update-mode="insert" />
    <div style="height:50px;padding:40px 20px 40px 20px;" xid="div8_6" xui:parent="demoContent" xui:update-mode="insert" >
<p xid="p3_1" >
<![CDATA[拍照上传相关接口：默认拍照后直接将照片上传，如果上传失败，可以调用重新上传接口。]]>
</p>
</div>
    <div style="height:50px;padding:40px" xid="div9_6" xui:parent="demoContent" xui:update-mode="insert" >
<a class="btn btn-default" component="$UI/system/components/justep/button/button" label="拍照" onClick="takePictureClick" style="width:100%;" xid="takePicture" >
<i xid="i4_1" />
<span xid="span4_1" >














拍照</span>
</a>
</div>
    <div style="height:50px;padding:40px" xid="div10_6" xui:parent="demoContent" xui:update-mode="insert" >
<a class="btn btn-default" component="$UI/system/components/justep/button/button" label="重新上传照片" onClick="uploadClick" style="width:100%;" xid="upload" >
<i xid="i5_1" />
<span xid="span5_1" >














重新上传照片</span>
</a>
</div>
    <div style="height:60px;padding:40px 20px 40px 20px;" xid="div11_6" xui:parent="demoContent" xui:update-mode="insert" >
<p xid="p4_1" >
<![CDATA[获取名片信息相关接口：本插件提供了两个接口，一个是根据UUID来获取数据，一个是根据时间来获取数据，在此展示其中一个。]]>
</p>
</div>
    <div style="height:50px;padding:40px" xid="div1_1" xui:parent="demoContent" xui:update-mode="insert" >
<a class="btn btn-default" component="$UI/system/components/justep/button/button" label="根据UUID获取数据" onClick="getByUUIDClick" style="width:100%;" xid="getByUUID" >
<i xid="i6_1" />
<span xid="span6_1" >














根据UUID获取数据</span>
</a>
</div>
   <div xid="codeContent" style="padding:10px"  xui:update-mode="merge"/>
    <p xid="p2_8" xui:parent="codeContent" xui:update-mode="insert" >
<![CDATA[回调方法]]>
</p>
    <div xid="callBack" xui:parent="codeContent" xui:update-mode="insert" />
    <div xid="div19_6" xui:parent="codeContent" xui:update-mode="insert" />
    <p xid="p1_6" xui:parent="codeContent" xui:update-mode="insert" >
<![CDATA[授权]]>
</p>
    <div xid="aouthClick" xui:parent="codeContent" xui:update-mode="insert" />
    <p xid="p2_6" xui:parent="codeContent" xui:update-mode="insert" >
<![CDATA[检查是否授权]]>
</p>
    <div xid="checkClick" xui:parent="codeContent" xui:update-mode="insert" />
    <p xid="p3_6" xui:parent="codeContent" xui:update-mode="insert" >
<![CDATA[清除授权]]>
</p>
    <div xid="clearClick" xui:parent="codeContent" xui:update-mode="insert" />
    <p xid="p4_6" xui:parent="codeContent" xui:update-mode="insert" >
<![CDATA[拍照]]>
</p>
    <div xid="takePictureClick" xui:parent="codeContent" xui:update-mode="insert" />
    <p xid="p5_6" xui:parent="codeContent" xui:update-mode="insert" >
<![CDATA[重新上传图片]]>
</p>
    <div xid="uploadClick" xui:parent="codeContent" xui:update-mode="insert" />
    <p xid="p6_6" xui:parent="codeContent" xui:update-mode="insert" >
<![CDATA[根据UUID获取数据]]>
</p>
    <div xid="getByUUIDClick" xui:parent="codeContent" xui:update-mode="insert" />

</div>