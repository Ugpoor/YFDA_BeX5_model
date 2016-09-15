using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection;
using System.Text;
using System.Threading.Tasks;
using System.Web;
using System.Xml;
using cn.jpush.api;
using cn.jpush.api.common;
using cn.jpush.api.common.resp;
using cn.jpush.api.push;
using cn.jpush.api.push.mode;
using Newtonsoft.Json.Linq;

namespace com.justep.Sample.JPush
{
    using JSONObject = JObject;
    public class Push
    {
        private static string appKey = "";
        private static string masterSecret = "";
        private static bool apnsProduction = false;
        private static JPushClient jpushClient;

        static Push()
        {
            var configFile = Assembly.GetEntryAssembly().Location + "jpush/jpush.config.xml";
            
            try
            {
                XmlDocument doc = new XmlDocument();
                doc.Load(configFile);
                var config = doc.DocumentElement;
                if (config != null)
                {
                    appKey = config.GetElementsByTagName("appKey").ToString();
                    masterSecret = config.GetElementsByTagName("masterSecret").ToString();
                    apnsProduction = (config.GetElementsByTagName("apnsProduction").ToString() == "true");
                }
            }
            catch (Exception e)
            {
                throw new SystemException(e.Message, e);
            }

        }

        public static JSONObject push(HttpContext context)
        {
            String registrationId = context.Request.Params["registrationId"];
            try
            {
                sendPushMessage(registrationId, appKey, masterSecret);
            }
            catch (APIConnectionException e)
            {
                throw new SystemException(e.Message, e);
            }
            catch (APIRequestException e)
            {
                throw new SystemException(e.Message, e);
            }
            return null;
        }

        public static MessageResult sendPushMessage(string registrationId, string key, string secret)
        {

            //ClientConfig config = ClientConfig.getInstance();
            //jpushClient = new JPushClient(secret, key, 3, null, config);
            jpushClient = new JPushClient(key, secret);
            PushPayload payload = new PushPayload();
            payload.platform = Platform.all();
            payload.audience = Audience.s_registrationId(registrationId);
            payload.notification = new Notification().setAlert("亲爱的x5外卖用户，您的订单已经配货完毕，正在运送中..");

            payload.ResetOptionsTimeToLive(86400);
            payload.ResetOptionsApnsProduction(apnsProduction);
            string schedleTime = DateTime.Today.ToString("yyyy-MM-dd HH:mm:ss");
            MessageResult result = jpushClient.SendPush(payload);
            return result;
        }
    }
}
