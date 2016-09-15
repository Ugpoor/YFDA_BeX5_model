using System.Text;
using System.Web;
using com.justep.baas.action;
using com.justep.Sample.WeiXin.Comm;
using Newtonsoft.Json.Linq;
using Senparc.Weixin.Open.QRConnect;

namespace weixin
{
    using JSONObject = JObject;

    public class UserInfo
    {
        public static JSONObject service(JSONObject paramJObject, ActionContext context)
        {
            var request = (HttpRequest) context.Get(ActionContext.REQUEST);
            var response = (HttpResponse) context.Get(ActionContext.RESPONSE);
            byte[] byts = new byte[request.InputStream.Length];
            request.InputStream.Read(byts, 0, byts.Length);
            string req = Encoding.Default.GetString(byts);
            req = HttpUtility.UrlDecode(req);
            var paramObject = string.IsNullOrEmpty(req) ? null : JObject.Parse(req);
            if (paramObject != null)
            {
                var code = paramObject["code"].ToString();

                if (string.IsNullOrEmpty(code))
                {
                    return null;
                }

                var accessToken = QRConnectAPI.GetAccessToken(ConfigHelper.AppConfig["appId"],
                    ConfigHelper.AppConfig["appSecret"], code);
                HttpContext.Current.Session["weixinOauth2AccessToken"] = accessToken;
                HttpContext.Current.Session.Timeout = 2;
                var userInfo = QRConnectAPI.GetUserInfo(accessToken.access_token, accessToken.openid);
                var result = new JObject();
                result.Add("openid", accessToken.openid);
                result.Add("nickname", userInfo.nickname);
                result.Add("country", userInfo.country);
                result.Add("province", userInfo.province);
                result.Add("city", userInfo.city);
                result.Add("headimgurl", userInfo.headimgurl);

                response.Write(result.ToString());
            }

            response.End();
            return null;
        }
    }
}