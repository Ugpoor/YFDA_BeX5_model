using System.IO;
using System.Net;
using System.Text;
using System.Web;
using com.justep.baas.action;
using Newtonsoft.Json.Linq;

namespace bmap
{
    using JSONObject = JObject;

    public class Api
    {
        public static JSONObject convertLocation(JSONObject paramsObject, ActionContext context)
        {
            var response = (HttpResponse)context.Get(ActionContext.RESPONSE);
            var request = (HttpRequest)context.Get(ActionContext.REQUEST);
            string longitude = request.Params["longitude"];
            string latitude = request.Params["latitude"];
            string url = "http://api.map.baidu.com/geoconv/v1/?coords=" + longitude + "," + latitude + "&from=1&to=5&ak=xifH76TpyIL1cvnTzuEP0bpq";

            HttpWebRequest requestClient = (HttpWebRequest)WebRequest.Create(url);
            requestClient.Method = "GET";
            requestClient.ContentType = "text/html;charset=UTF-8";

            HttpWebResponse responseClient = (HttpWebResponse)requestClient.GetResponse();
            Stream myResponseStream = responseClient.GetResponseStream();
            if (myResponseStream != null)
            {
                StreamReader myStreamReader = new StreamReader(myResponseStream, Encoding.GetEncoding("utf-8"));
                string retString = myStreamReader.ReadToEnd();
                myStreamReader.Close();
                myResponseStream.Close();

                response.Write(retString);
            }

            return null;
        }
    }
}