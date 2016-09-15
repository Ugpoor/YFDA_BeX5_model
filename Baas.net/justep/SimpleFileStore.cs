using System;
using System.IO;
using System.Text;
using System.Web;
using com.justep.baas.action;
using Newtonsoft.Json.Linq;

namespace justep
{
    using JSONObject = JObject;

    public class SimpleFileStore
    {
        static string docStorePath;

        static readonly string separator = "/";

        public static JSONObject service(JSONObject paramObject, ActionContext context)
        {
            String baasPath = Environment.CurrentDirectory + ".." + separator + "..";
            docStorePath = baasPath + separator + "data" + separator + "attachmentSimple";

            var request = (HttpRequest)context.Get(ActionContext.REQUEST);
            var response = (HttpResponse)context.Get(ActionContext.RESPONSE);
            if (request.HttpMethod == "GET")
            {
                DoGet(request, response);
            }
            else if (request.HttpMethod == "POST")
            {
                DoPost(request, response);
            }

            return null;
        }

        /// <summary>
        /// get为获取文件 浏览或者下载
        /// </summary>
        /// <param name="request">Http request</param>
        /// <param name="response">Http response</param>
        private static void DoGet(HttpRequest request, HttpResponse response)
        {

            string operateType = request.Params["operateType"];
            if ("copy" == operateType)
            {
                CopyFile(request, response);
            }
            else {

                GetFile(request, response);
            }
        }

        /// <summary>
        /// post为上传
        /// </summary>
        /// <param name="request"></param>
        /// <param name="response"></param>
        protected static void DoPost(HttpRequest request, HttpResponse response)
        {


            var contentType = request.ContentType;
            try
            {
                if ("application/octet-stream" == contentType)
                {
                    StoreOctStreamFile(request, response);
                }
                else if (!string.IsNullOrEmpty(contentType) && contentType.StartsWith("multipart/"))
                {

                    StoreFile(request, response);
                }
                else {
                    throw new Exception("not supported contentType");
                }
            }
            catch (Exception e)
            {
                throw new IOException("storeFile异常" + e.Message);
            }
            response.Write("");
        }

        private static void CopyFile(HttpRequest request, HttpResponse response)
        {

            var ownerId = request.Params["ownerID"];
            var targetOwnerId = request.Params["targetOwnerID"];
            var storeFileName = request.Params["storeFileName"];
            var file = docStorePath + separator + ownerId + separator + storeFileName;
            var targetFile = docStorePath + separator + targetOwnerId + separator + storeFileName;
            File.Copy(file, targetFile, false);
        }

        private static void GetFile(HttpRequest request, HttpResponse response)
        {
            int BUFFER_SIZE = 32768 * 8;

            var ownerId = request.Params["ownerID"];
            var realFileName = HttpUtility.UrlEncode(request.Params["realFileName"], Encoding.UTF8);
            var storeFileName = request.Params["storeFileName"];
            var operateType = request.Params["operateType"];
            /*String fileSize = request.getParameter("fileSize");*/

            var fis = new FileStream(docStorePath + separator + ownerId + separator + storeFileName, FileMode.Open);

            /*response.setContentType(mimeType);*/
            /*response.setHeader("Content-Length", String.valueOf(part.getSize()));*/
            response.Headers.Set("Cache-Control", "pre-check=0, post-check=0, max-age=0");

            var fileNameKey = "filename";
            /*UserAgent ua = com.justep.ui.util.NetUtils.getUserAgent(request);
            if(Browser.FIREFOX.equals(ua.getBrowser().getGroup())){
                fileNameKey = "filename*";
            }*/
            if ("download" == operateType)
            {
                response.Headers.Add("Content-Disposition", "attachment; " + fileNameKey + "=\"" + realFileName + "\"");
            }
            else {
                response.AddHeader("Content-Disposition", "inline; " + fileNameKey + "=\"" + realFileName + "\"");
            }

            var os = response.OutputStream;
            byte[] buffer = new byte[BUFFER_SIZE];
            try
            {
                int read;
                while ((read = fis.Read(buffer, 0, BUFFER_SIZE)) != -1)
                {
                    os.Write(buffer, 0, read);
                }
            }
            finally
            {
                fis.Close();
            }
        }

        private static void StoreOctStreamFile(HttpRequest request, HttpResponse response)
        {
            FileStream storeStream = null;
            Stream inputStream = null;
            try
            {
                var ownerId = request.Params["ownerID"];
                var storeFileName = request.Params["storeFileName"];
                inputStream = request.InputStream;
                var storePath = docStorePath + separator + ownerId;
                Directory.CreateDirectory(storePath);
                using (storeStream = new FileStream(storePath + separator + storeFileName, FileMode.OpenOrCreate))
                {
                    inputStream.CopyTo(storeStream);
                }
            }
            finally
            {
                inputStream?.Close();
                storeStream?.Close();
            }
        }

        private static void StoreFile(HttpRequest request, HttpResponse response)
        {
            var items = request.Files;
            
            var storePath = docStorePath + separator + request.Params["ownerID"];
            if (!Directory.Exists(storePath))
            {
                Directory.CreateDirectory(storePath);
            }

            foreach (HttpPostedFile iter in items)
            {
                iter.SaveAs(storePath + separator + iter.FileName);
            }
        }
    }
}
