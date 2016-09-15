using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Common;
using System.Net.Http;
using System.Runtime.Remoting.Messaging;
using System.Web;
using com.justep.baas.action;
using com.justep.baas.Data;
using MySql.Data.MySqlClient;
using Newtonsoft.Json.Linq;

namespace justep
{
    using JSONObject = JObject;

    public class Dx
    {
        public static JSONObject DuanXinCheck(JSONObject paramObject, ActionContext context)
        {
            string fPhoneNumber = paramObject["fPhoneNumber"].ToString();
            
            var ro = new Random(899999);
            var tick = DateTime.Now.Ticks;
            var ran = new Random((int)(tick & 0xffffffffL) | (int)(tick >> 32));

            //生成6位数字的随机字符串
            int suiji = ro.Next(899999) + 100000;

            string backStr = suiji.ToString();
            // 将随机字符串通过jsonOBJ返回前台 
            JSONObject jsonObj = new JSONObject {{"CheckCode", backStr}};
            //       System.out.println("backStr==="+backStr);
            ((HttpResponse)context.Get(ActionContext.RESPONSE)).Write(jsonObj.ToString());

            HttpClient client = new HttpClient();
            //PostMethod post = new PostMethod("http://gbk.sms.webchinese.cn");
            //post.addRequestHeader("Content-Type", "application/x-www-form-urlencoded;charset=gbk");
            //在头文件中设置转码
            List<KeyValuePair<string, string>> data = new List<KeyValuePair<string, string>>
            {
                new KeyValuePair<string, string>("Uid", "sky198127"),
                new KeyValuePair<string, string>("Key", "7b6da72cf462854530fa"),
                new KeyValuePair<string, string>("smsMob", fPhoneNumber),
                new KeyValuePair<string, string>("smsText", "验证码：" + backStr + " (本信息由系统自动发出，不要回复）")
            };

            //这段Java代码是直接从他家demo拷贝下来的，只需要修改这句话，填写你在他家注册的用户名、短信密钥，参数中加要发送的手机号和验证码短信
            //post.setRequestBody(data);

            try
            {
                var postResult =
                    client.PostAsync("http://gbk.sms.webchinese.cn", new FormUrlEncodedContent(data)).Result;
                //client.Send(post);
                var headers = postResult.Headers;
                var statusCode = postResult.StatusCode;
                Console.Write("状态码:" + statusCode);
                foreach (var item in headers)
                {
                    Console.Write(item.ToString());
                }
                string result = postResult.ToString();
                //Content.ReadAsByteArrayAsync()getBytes("gbk"));
                Console.Write(result); //打印返回消息状态

            }
            catch (Exception e)
            {
                Console.Write(e.Message);
            }

            return null;
        }

        public static JSONObject login(JSONObject paramObject, ActionContext context)
        {
            var request = (HttpRequest)context.Get(ActionContext.REQUEST);
            // 获取参数
            var columns = request.Params["columns"];
            var limit = int.Parse(request.Params["limit"]);
            var offset = int.Parse(request.Params["offset"]);
            var search = request.Params["search"];

            var fPhoneNumber = request.Params["fPhoneNumber"];
            var fPassWord = request.Params["fPassWord"];
            //        System.out.println("fPhoneNumber="+fPhoneNumber+"#fPassWord="+fPassWord);



            ICollection<IDataParameter> sqlParams = new List<IDataParameter>();
            // 构造过滤条件
            var filters = new List<string>();
            if (!string.IsNullOrEmpty(search))
            {
                filters.Add(" fPhoneNumber = ?fPhoneNumber OR fPassWord = ?fPassWord ");
                // 多个问号参数的值
                //search = (search.IndexOf("%", StringComparison.Ordinal) != -1) ? search : "%" + search + "%";
                //for (int i = 0; i < 2; i++)
                //{
                //    sqlParams.Add(search);
                //}
            }

            sqlParams.Add(new MySqlParameter("?fPhoneNumber", fPhoneNumber));
            sqlParams.Add(new MySqlParameter("?fPassWord", fPassWord));

            var conn = new MySqlConnection("Server=localhost;Uid=root;Pwd=x5;Database=takeout;");

            var querysql = "select * from user_info u where u.fPhoneNumber=? and u.fPassWord=?";

            try
            {
                var table = Util.QueryData(conn, querysql, sqlParams, columns, offset, limit);
                ((HttpResponse)context.Get(ActionContext.RESPONSE)).Write(Transform.TableToJson(table).ToString());
            }
            finally
            {
                conn.Close();
            }

            return null;
        }
    }
}
