using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Newtonsoft.Json.Linq;

namespace weixin
{
    using com.justep.baas.action;
    using JSONObject = JObject;
    public class Service
    {
        public static JSONObject service(JSONObject paramsObject, ActionContext context)
        {

            HttpRequest request = (HttpRequest)context.Get(ActionContext.REQUEST);
            HttpResponse response = (HttpResponse)context.Get(ActionContext.RESPONSE);
            WxMpServiceInstance.GetInstance().DoResponse(request, response);
            return null;
        }
    }
}