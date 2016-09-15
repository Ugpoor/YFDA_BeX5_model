using System;
using System.Collections.Generic;
using System.Web;
using System.Xml.Linq;
using com.justep.baas.action;
using com.justep.Sample.WeiXin.Comm;
using Newtonsoft.Json;
using Newtonsoft.Json.Linq;
using Senparc.Weixin.MP;
using Senparc.Weixin.MP.AdvancedAPIs;
using Senparc.Weixin.MP.CommonAPIs;
using Senparc.Weixin.MP.TenPayLibV3;
using Senparc.Weixin.Open.QRConnect;

namespace weixin
{
    using JSONObject = JObject;
    public class WxMpJsApi
    {
        public static JSONObject service(JSONObject paramObject, ActionContext context)
        {
            var action = ((HttpRequest)context.Get(ActionContext.REQUEST)).Params["action"];
            if (!string.IsNullOrEmpty(action))
            {
                if (action == "getTicket")
                {
                    JsApiHandle(HttpContext.Current);
                }
                else if (action == "chooseWXPay")
                {
                    ChooseWXPay(HttpContext.Current);
                }
            }

            return null;
        }

        private static void JsApiHandle(HttpContext context)
        {
            var ticket = AccessTokenContainer.TryGetJsApiTicket(ConfigHelper.AppConfig["appId"], ConfigHelper.AppConfig["appSecret"]);

            context.Response.Write(ticket);
        }

        private static void ChooseWXPay(HttpContext context)
        {
            var timeStamp = TenPayV3Util.GetTimestamp();
            var nonceStr = TenPayV3Util.GetNoncestr();

            var prepayId = GetPrepayOrder(context.Request);
            var paySignReqHandler = new Dictionary<string, string>()
            {
                {"appId", ConfigHelper.AppConfig["appId"]},
                {"timeStamp", timeStamp},
                {"nonceStr", nonceStr},
                {"package", "prepay_id=" + prepayId},
                {"signType", "MD5"}
            };
            var paySign = paySignReqHandler.CreateMd5Sign("key", ConfigHelper.AppConfig["appKey"], context.Request.ContentEncoding.BodyName);
            paySignReqHandler.Remove("appId");
            paySignReqHandler.Add("paySign", paySign);

            context.Response.Write(JsonConvert.SerializeObject(paySignReqHandler));
        }

        private static string GetPrepayOrder(HttpRequest req)
        {
            var nonceStr = TenPayV3Util.GetNoncestr();
            var unifiedOrder = new RequestHandler(null);
            unifiedOrder.Init();

            QRConnectAccessTokenResult oauth2AccessToken =
                (QRConnectAccessTokenResult)HttpContext.Current.Session["weixinOauth2AccessToken"];
            if (oauth2AccessToken == null)
            {
                throw new SystemException("请先通过微信Oauth2对x5外面授权,然后才能发起支付");
            }

            unifiedOrder.SetParameter("openid", oauth2AccessToken.openid);
            unifiedOrder.SetParameter("appid", ConfigHelper.AppConfig["appId"]);
            unifiedOrder.SetParameter("body", req.Params["body"]);
            unifiedOrder.SetParameter("mch_id", req.Params["mchId"]);
            unifiedOrder.SetParameter("notify_url", req.Params["notifyUrl"]);
            unifiedOrder.SetParameter("out_trade_no", req.Params["outTradeNo"]);
            unifiedOrder.SetParameter("spbill_create_ip", req.UserHostAddress);
            unifiedOrder.SetParameter("total_fee", req.Params["totalFee"]);
            unifiedOrder.SetParameter("nonce_str", nonceStr);
            unifiedOrder.SetParameter("trade_type", TenPayV3Type.JSAPI.ToString());


            var sign = unifiedOrder.CreateMd5Sign("key", ConfigHelper.AppConfig["appKey"]);
            unifiedOrder.SetParameter("sign", sign);

            var data = unifiedOrder.ParseXML();
            var result = TenPayV3.Unifiedorder(data);

            var xElement = XDocument.Parse(result).Element("xml");
            var element = xElement?.Element("prepay_id");
            return element?.Value;
        }
    }
}