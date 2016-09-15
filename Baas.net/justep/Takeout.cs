using System.IO;
using System.Net;
using System.Text;
using System.Web;
using com.justep.baas.action;
using Newtonsoft.Json.Linq;

namespace justep
{
    using JSONObject = JObject;
    public class Takeout
    {
        public static JSONObject queryAddr(JSONObject paramsObject, ActionContext context)
        {
            var response = (HttpResponse)(context.Get(ActionContext.RESPONSE));
            string x = "", y = "";
            if (paramsObject != null)
            {
                x = paramsObject["x"].ToString();
                y = paramsObject["y"].ToString();
            }
            if (x.Length == 0)
            {
                x = "39.8622934399999";
            }
            
            if (y.Length == 0)
            {
                y = "116.45764191999997";
            }
            string longitude = x;
            string latitude = y;
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