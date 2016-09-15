using System;
using System.Web;
using com.justep.Sample.WeiXin.Comm;
using Senparc.Weixin.MP;
using Senparc.Weixin.MP.CommonAPIs;
using Senparc.Weixin.MP.Entities.Menu;
using Senparc.Weixin.MP.Entities.Request;

namespace weixin
{

    public class WxMpServiceInstance
    {
        private static WxMpServiceInstance instance;
        private static readonly object LockObject = new object();
        public string AccessToken { get; }

        public static WxMpServiceInstance GetInstance()
        {
            if (instance == null)
            {
                lock (LockObject)
                {
                    if (instance == null)
                    {
                        instance = new WxMpServiceInstance();
                    }
                }
            }

            return instance;
        }

        private WxMpServiceInstance()
        {
            AccessToken = AccessTokenContainer.TryGetAccessToken(ConfigHelper.AppConfig["appId"], ConfigHelper.AppConfig["appSecret"]);

            //AddTestRouter();
            BuildMenu();
        }

        public void DoResponse(HttpRequest request, HttpResponse response)
        {
            string token = ConfigHelper.AppConfig["token"];

            string signature = request.Params["signature"];
            string nonce = request.Params["nonce"];
            string timestamp = request.Params["timestamp"];
            string echostr = request.Params["echostr"];

            response.ContentType = "text/html;charset=utf-8";

            //返回随机字符串则表示验证通过
            var checkResult = CheckSignature.Check(signature, timestamp, nonce, token);
            if (checkResult == false)
            {
                response.Write("如果你在浏览器中看到这句话，说明此地址可以被作为微信公众账号后台的Url，请注意保持Token一致。");
                response.End();
            }
            else if (!string.IsNullOrEmpty(echostr))
            {
                response.Write(echostr); //返回解密后的随机字符串则表示验证通过
                response.End();
            }

            var messageHandler = new CustomMessageHandler(request.InputStream, new PostModel() { Token = token, EncodingAESKey = null, AppId = ConfigHelper.AppConfig["appId"] });//接收消息

            messageHandler.Execute();//执行微信处理过程

            response.ClearContent();
            response.ContentType = "text/xml";
            messageHandler.FinalResponseDocument.Save(response.OutputStream);
            //return new WeixinResult(messageHandler);//返回结果
        }
        
        // 创建菜单
        private void BuildMenu()
        {
            var x5Meuns = new ButtonGroup();

            var indexPage = new SingleViewButton
            {
                name = "起步科技",
                type = ButtonType.view.ToString(),
                url = "http://www.justep.com"
            };
            x5Meuns.button.Add(indexPage);

            var demoPage = new SingleViewButton
            {
                name = "外卖",
                type = ButtonType.view.ToString(),
                url = "https://open.weixin.qq.com/connect/oauth2/authorize?appid=" +
                    ConfigHelper.AppConfig["appId"] +
                    "&redirect_uri=http%3A%2F%2Fwx.justep.com%2Ftakeout%2Findex.html&"
                    + "response_type=code&scope=snsapi_userinfo&state=STATE#wechat_redirect"
            };
            x5Meuns.button.Add(demoPage);

            var takeout = new SingleViewButton
            {
                name = "外卖案例",
                type = ButtonType.view.ToString(),
                url =
                    "https://open.weixin.qq.com/connect/oauth2/authorize?appid=" +
                    ConfigHelper.AppConfig["appId"] +
                    "&redirect_uri=http%3A%2F%2Fwx.justep.com%2Fx5%2FUI2%2Ftakeout%2Findex.w&"
                    + "response_type=code&scope=snsapi_userinfo&state=STATE#wechat_redirect"
            };
            Console.WriteLine(takeout.url);
            x5Meuns.button.Add(takeout);

            try
            {
                CommonApi.DeleteMenu(AccessToken);
                CommonApi.CreateMenu(AccessToken, x5Meuns);
            }
            catch (Exception e)
            {
                Console.WriteLine(e.Message);
                throw;
            }
        }
    }
}