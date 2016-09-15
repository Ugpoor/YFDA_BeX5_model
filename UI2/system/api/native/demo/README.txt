一、微信测试
1 准备一个微信公众号（https://mp.weixin.qq.com/） 
2 公众号需要具有相应的能力,(自带扫二维码，获取用户地址等，若要支付需另外申请)
3 在mp.weixin.qq.com控制台配置 Baas URL,以便取到token  比如配baas: http://www.XXX.com/baas/weixin/weixin/service 

4 配置测试机,映射到外网路径（让微信访问得到你的baas url）
5 修改baas配置文件：weixin.conifg.xml. 写入你的公众号appid,等。
6 编译baas,启动服务。

7 修改UI2/system/config/config.json appId参数 （其它参数有变化亦当修改。）
8 用微信开发者工具打开.../test.w 测试。
  或用微信打开url查看效果.


二、在app 中测试：
1 分享接口，需要weixin 应用参数。
2 支付接口，需要weixin 应用参数。用com.justep.x5.takeout 和 android.keystore  
