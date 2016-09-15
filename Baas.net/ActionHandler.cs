using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Reflection;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.SessionState;
using System.Xml;
using com.justep.baas.action;
using com.justep.baas.Comm;
using com.justep.baas.Data;
using Newtonsoft.Json.Linq;

namespace baas
{
    public class ActionHandler : IHttpHandler, IRequiresSessionState
    {
        private const string MethodPost = "POST";
        private const string MultipartContentType = "multipart/form-data";
        private static string accessControlAllowOrigin = "*";
        private static string effectivePrefixPath = string.Empty;
        private static Object thisLock = new Object();

        /// <summary>
        /// You will need to configure this handler in the Web.config file of your 
        /// web and register it with IIS before being able to use it. For more information
        /// see the following link: http://go.microsoft.com/?linkid=8101007
        /// </summary>
        #region IHttpHandler Members

        public bool IsReusable => true;

        public void ProcessRequest(HttpContext context)
        {
            //try
            //{
                var request = context.Request;
                var response = context.Response;

                switch (request.HttpMethod)
                {
                    case "POST":
                    case "GET":
                        ExecService(request, response, Assembly.GetExecutingAssembly());
                        break;

                    // 设置跨域访问支持
                    case "OPTIONS":
                        if (!string.IsNullOrEmpty(accessControlAllowOrigin))
                        {
                            response.AddHeader("P3P", "CP=CAO PSA OUR");
                            response.AddHeader("Access-Control-Allow-Origin", accessControlAllowOrigin);
                            response.AddHeader("Access-Control-Allow-Credentials", "true");
                            response.AddHeader("Access-Control-Allow-Methods",
                                request.Headers["Access-Control-Request-Method"]);
                            response.AddHeader("Access-Control-Allow-Headers",
                                request.Headers["Access-Control-Request-Headers"]);
                        }
                        return;

                    default:
                        return;
                }
            //}
            //catch (Exception e)
            //{
            //    Console.Write(e.StackTrace);
            //}
        }

        

        public static void ExecService(HttpRequest request, HttpResponse response, Assembly assembly)
        {
            var reg = request;
            JObject paramObject = GetParams(reg);

            var effectivePath = GetEffectivePath(reg.Path);
            try
            {
                //response.Write(effectivePath);
                JObject ret = Engine.ExecAction(effectivePath, paramObject, assembly);
                if (null != ret)
                {
                    //设置跨域访问
                    if (!string.IsNullOrEmpty(accessControlAllowOrigin))
                    {
                        response.AddHeader("P3P", "CP=CAO PSA OUR");
                        response.AddHeader("Access-Control-Allow-Origin", accessControlAllowOrigin);
                        response.AddHeader("Access-Control-Allow-Credentials", "true");
                    }
                    Util.WriteJsonToResponse(response, ret);
                }
            }
            catch (com.justep.baas.data.sql.SQLException e)
            {
                throw new ActionException("执行Action：" + effectivePath + "失败，" + e.Message, e);
            }
            catch (com.justep.baas.action.ActionException e)
            {
                throw new ActionException("执行Action：" + effectivePath + "失败，" + e.Message, e);
            }
            catch (Exception e)
            {
                throw new ActionException("执行Action：" + effectivePath + "失败，" + e.Message, e);
            }
        }

        private static String GetRequestContentType(HttpRequest request)
        {
            return request.ContentType;
        }

        private static bool IsRequestMultipart(String type)
        {
            return !string.IsNullOrEmpty(type) && -1 < type.IndexOf(MultipartContentType, StringComparison.Ordinal);
        }

        private static bool IsRequestMultipart(HttpRequest request)
        {
            return IsRequestMultipart(GetRequestContentType(request));
        }

        private static JObject GetParams(Stream inputStream)
        {
            byte[] buffer = StreamToBytes(inputStream);
            var bodyData = StringHelperClass.NewString(buffer.ToArray(), "UTF-8");

            if (bodyData.Length > 0 && bodyData[0] != '{' && bodyData[0] != '<')
            {
                var resultObject = new JObject();
                var paramList = bodyData.Split('&');
                foreach (var item in paramList)
                {
                    var nameValue = item.Split('=');
                    if (nameValue.Length == 2)
                    {
                        resultObject[nameValue[0]] = string.IsNullOrEmpty(nameValue[1]) ? null : HttpUtility.UrlDecode(nameValue[1]);
                    }
                }

                return resultObject;
            }

            try
            {
                return inputStream.Length == 0 ? JObject.Parse("{}") : JObject.Parse(bodyData);
            }
            catch (Exception)
            {
                XmlDocument doc = new XmlDocument();
                doc.LoadXml(bodyData);
                var jsonString = Newtonsoft.Json.JsonConvert.SerializeXmlNode(doc);
                return inputStream.Length == 0 ? JObject.Parse("{}") : JObject.Parse(jsonString);
            }
        }
        public static byte[] StreamToBytes(Stream stream)
        {
            byte[] bytes = new byte[stream.Length];
            stream.Read(bytes, 0, bytes.Length);
            // 设置当前流的位置为流的开始   
            stream.Seek(0, SeekOrigin.Begin);
            return bytes;
        }

        private static JObject GetParams(HttpRequest request)
        {
            String method = request.HttpMethod;
            JObject paramObject;
            if (IsRequestMultipart(request))
            {
                paramObject = new JObject();
                return paramObject;
            }

            if (MethodPost == method)
            {
                return GetParams(request.InputStream);
            }

            paramObject = new JObject();
            foreach (var k in request.Params.AllKeys)
            {
                var key = k;
                paramObject.Add(key, request.Params[key]);
            }
            return paramObject;
        }

        private static string GetEffectivePath(string realPath)
        {
            var prefix = "";
            if (effectivePrefixPath == string.Empty)
            {
                lock(thisLock)
                {
                    effectivePrefixPath = GetFilterPath();
                }
            }

            prefix = effectivePrefixPath;
            if (realPath.IndexOf(prefix, StringComparison.Ordinal) == 0)
            {
                return realPath.Replace(prefix, "/baas/");
            }

            return realPath;
        }

        private static string GetFilterPath()
        {
            var xmlDoc = new XmlDocument();
            string sPath = System.AppDomain.CurrentDomain.BaseDirectory;
            if (!File.Exists(sPath + "Web.config"))
            {
                return "/baas/";
            }

            xmlDoc.Load(sPath + "Web.config");
            var selectSingleNode = xmlDoc.SelectSingleNode("configuration");
            if (selectSingleNode != null)
            {
                var nodeList = selectSingleNode.SelectNodes("system.webServer");
                if (nodeList != null)
                    foreach (XmlNode item in nodeList)
                    {
                        var handlersNodeList = item.SelectNodes("handlers");
                        if (handlersNodeList != null)
                            foreach (XmlElement handlerNode in handlersNodeList)
                            {
                                var infoList = XmlToDictionary(handlerNode.InnerXml);
                                if (infoList.ContainsKey("type") && infoList.ContainsKey("path"))
                                {
                                    var tmpValue = infoList["type"];
                                    if (tmpValue.IndexOf("X5BaasService") != 0)
                                    {
                                        tmpValue = infoList["path"];
                                        if (tmpValue.IndexOf('*') != 0)
                                        {
                                            tmpValue = tmpValue.Substring(0, tmpValue.Length - 1);
                                        }

                                        return tmpValue;
                                    }
                                }
                            }
                    }
            }

            return string.Empty;
        }

        private static Dictionary<string, string> XmlToDictionary(string xmlText)
        {
            var result = new Dictionary<string,string>();
            //var tmpDoc = xmlText.Split(new [] {'\"',' '});
            string[] tmpDoc = Regex.Split(xmlText, "\" ", RegexOptions.IgnoreCase);

            foreach (var item in tmpDoc)
            {
                var tmp = item.Split('=');

                if (tmp.Length == 2)
                {
                    if (tmp[0][0] == '<')
                    {
                        tmp[0] = tmp[0].Substring(tmp[0].IndexOf(' ') + 1);
                    }

                    result[tmp[0]] = tmp[1].Substring(1,tmp[1].Length-1);
                    Console.WriteLine(result[tmp[0]]);
                }
                else if (tmp.Length > 2)
                {
                    result[tmp[0]] = item.Substring(item.IndexOf('"') + 1);
                }

            }
            return result;
        }

        #endregion
    }
}
