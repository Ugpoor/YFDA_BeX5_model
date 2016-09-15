<div 
  xmlns:xui="http://www.justep.com/xui" 
  xmlns:xu="http://www.xmldb.org/xupdate" 
  component="$UI/system/components/justep/window/window" 
  xid="window" 
  xmlns="http://www.w3.org/1999/xhtml" 
  extends="$UI/demo/plugin/template/demo.w" 
  __id="id_1" 
  design="device:m;" 
  class="window" >

  <div xid="div6" xui:update-mode="delete"/>
  <div xid="div7" xui:update-mode="delete"/>
  <div xid="accountP" xui:update-mode="delete"/>
   <div xid="model" onModelConstructDone="modelModelConstructDone"  xui:update-mode="merge"/>
   <div xid="titleBar" title="http"  xui:update-mode="merge"/>
   <p xid="p1"  xui:update-mode="merge-and-replace">







ID：cordova-plugin-http</p>   <p xid="introduceP"  xui:update-mode="merge-and-replace">







本插件功能是向服务器发送HTTP请求，包括get、post、head等。</p>   <p xid="platformP"  xui:update-mode="merge-and-replace">







Android、IOS</p>    <div style="padding:10px;" xid="div11_3" xui:parent="demoContent" xui:update-mode="insert" >
<a class="btn btn-default" component="$UI/system/components/justep/button/button" label="get" onClick="getClick" style="width:100%;" xid="get" >
<i xid="i11_3" />
<span xid="span11_3" >


























get</span>
</a>
</div>
    <div style="padding:10px;" xid="div21_3" xui:parent="demoContent" xui:update-mode="insert" >
<a class="btn btn-default" component="$UI/system/components/justep/button/button" label="head" onClick="headClick" style="width:100%;" xid="head" >
<i xid="i21_3" />
<span xid="span21_3" >


















head</span>
</a>
</div>
    <div style="padding:10px;" xid="div11_1" xui:parent="demoContent" xui:update-mode="insert" >
<a class="btn btn-default" component="$UI/system/components/justep/button/button" label="post" onClick="postClick" style="width:100%;" xid="post" >
<i xid="i11_1" />
<span xid="span11_1" >


















post</span>
</a>
</div>
    <div xid="div1_2" xui:parent="demoContent" xui:update-mode="insert" >
<p style="font-size:medium;font-weight:bolder;" xid="p31_2" xui:parent="div3" xui:update-mode="insert" >
<![CDATA[HTTP请求相关的控制]]>
</p>
<p xid="p21_2" xui:parent="div3" xui:update-mode="insert" >
<![CDATA[SSLPinning协议：允许或禁止SSL pinning协议，默认为禁止；证书：允许或禁止所有证书，默认为禁止。域名：允许或禁止证书中包含的域名，默认为允许。]]>
</p>
</div>
    <div style="padding:10px;" xid="div12_1" xui:parent="demoContent" xui:update-mode="insert" >
<a class="btn btn-default" component="$UI/system/components/justep/button/button" label="SSLPinning协议" onClick="enableSSLPinningClick" style="width:100%;" xid="enableSSLPinning" >
<i xid="i12_1" />
<span xid="span12_1" >
















SSLPinning协议</span>
</a>
</div>
    <div style="padding:10px;" xid="div21_1" xui:parent="demoContent" xui:update-mode="insert" >
<a class="btn btn-default" component="$UI/system/components/justep/button/button" label="证书" onClick="acceptAllCertsClick" style="width:100%;" xid="acceptAllCerts" >
<i xid="i21_1" />
<span xid="span21_1" >
















证书</span>
</a>
</div>
    <div style="padding:10px;" xid="div31_1" xui:parent="demoContent" xui:update-mode="insert" >
<a class="btn btn-default" component="$UI/system/components/justep/button/button" label="域名" onClick="validateDomainNameClick" style="width:100%;" xid="validateDomainName" >
<i xid="i31_1" />
<span xid="span31_1" >
















域名</span>
</a>
</div>
    <div xid="div21_2" xui:parent="demoContent" xui:update-mode="insert" />
    <p style="font-size:medium;font-weight:bolder;" xid="p51_2" xui:parent="demoContent" xui:update-mode="insert" >
<![CDATA[文件传输]]>
</p>
    <p xid="p41_2" xui:parent="demoContent" xui:update-mode="insert" >
<![CDATA[下载文件。]]>
</p>
    <div style="padding:10px;" xid="div51_1" xui:parent="demoContent" xui:update-mode="insert" >
<a class="btn btn-default" component="$UI/system/components/justep/button/button" label="上传文件" onClick="uploadFileClick" style="width:100%;" target="infoContent" xid="uploadFile" >
<i xid="i51_1" />
<span xid="span51_1" >




上传文件</span>
</a>
</div>
    <div style="padding:10px;" xid="div13_1" xui:parent="demoContent" xui:update-mode="insert" >
<a class="btn btn-default" component="$UI/system/components/justep/button/button" label="下载文件" onClick="downloadFileClick" style="width:100%;" target="infoContent" xid="button11_1" >
<i xid="i13_1" />
<span xid="span13_1" >


下载文件</span>
</a>
</div>
    <p style="font-size:medium;font-weight:bolder;" xid="p11_2" xui:parent="div3" xui:update-mode="insert" >
<![CDATA[HTTP请求]]>
</p>
    <p xid="p111_2" xui:parent="div3" xui:update-mode="insert" >
<![CDATA[get请求；head请求；post请求。]]>
</p>
   <div xid="codeContent" style="padding:10px"  xui:update-mode="merge"/>
    <p xid="p1111_4" xui:parent="codeContent" xui:update-mode="insert" >
<![CDATA[get请求]]>
</p>
    <div xid="getClick" xui:parent="codeContent" xui:update-mode="insert" />
    <p xid="p11_1" xui:parent="codeContent" xui:update-mode="insert" >
<![CDATA[head请求]]>
</p>
    <div xid="headClick" xui:parent="codeContent" xui:update-mode="insert" />
    <p xid="p21_1" xui:parent="codeContent" xui:update-mode="insert" >
<![CDATA[post请求]]>
</p>
    <div xid="postClick" xui:parent="codeContent" xui:update-mode="insert" />
    <p xid="p31_1" xui:parent="codeContent" xui:update-mode="insert" >
<![CDATA[SSLPinning协议开关]]>
</p>
    <div xid="enableSSLPinningClick" xui:parent="codeContent" xui:update-mode="insert" >
</div>
    <p xid="p41_1" xui:parent="codeContent" xui:update-mode="insert" >
<![CDATA[证书开关]]>
</p>
    <div xid="acceptAllCertsClick" xui:parent="codeContent" xui:update-mode="insert" />
    <p xid="p51_1" xui:parent="codeContent" xui:update-mode="insert" >
<![CDATA[域名开关]]>
</p>
    <div xid="validateDomainNameClick" xui:parent="codeContent" xui:update-mode="insert" />
    <p xid="p61_1" xui:parent="codeContent" xui:update-mode="insert" >
<![CDATA[下载文件]]>
</p>
    <div xid="downloadFileClick" xui:parent="codeContent" xui:update-mode="insert" />
    <p xid="p12_1" xui:parent="codeContent" xui:update-mode="insert" >
<![CDATA[上传文件]]>
</p>
    <div xid="uploadFileClick" xui:parent="codeContent" xui:update-mode="insert" />

</div>