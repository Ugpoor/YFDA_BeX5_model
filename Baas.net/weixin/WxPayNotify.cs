using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using com.justep.baas.action;
using Newtonsoft.Json.Linq;

namespace weixin
{
    using JSONObject = JObject;
    public class WxPayNotify
    {
        public static JSONObject service(JSONObject paramObject, ActionContext context)
        {
            HttpRequest req = (HttpRequest)context.Get(ActionContext.REQUEST);
            HttpResponse resp = (HttpResponse)context.Get(ActionContext.RESPONSE);
            DoNotify(req, resp);
            return null;
        }

        private static void DoNotify(HttpRequest req, HttpResponse resp)
        {
            resp.ContentType = "text/xml;charset=utf-8";
            resp.ContentEncoding = new UTF8Encoding();
            string resultCode = req.Params["return_code"];
            if ("SUCCESS" == resultCode)
            {
                resultCode = req.Params["result_code"];
                if (resultCode == "FAIL")
                {
                    string err_code = req.Params["err_code"];
                    string err_code_des = req.Params["err_code_des"];
                    string out_trade_no = req.Params["out_trade_no"];
                    //log.info("有一个交易失败[" + err_code + "]:" + err_code_des + "out_trade_no:" + out_trade_no);
                }
                else if (resultCode == "SUCCESS")
                {
                    string out_trade_no = req.Params["out_trade_no"];
                    /**
                 TODO 最好数据库里面有单独的订单支付模块
                        首先检查对应业务数据的状态，判断该通知是否已经处理过，
                        如果没有处理过再进行处理，如果处理过直接返回结果成功。
                        在对业务数据进行状态检查和处理之前，要采用数据锁进行并发控制，以避免函数重入造成的数据混乱。
                 * 
                 */
                    //log.info("订单:" + out_trade_no + ",交易成功");
                }
            }
            else if ("FAIL" == resultCode)
            {
                string returnMsg = req.Params["return_msg"];
                //log.error("有失败交易需要关注:" + returnMsg);
            }
            else
            {
                resp.ContentType = "text/html;charset=utf-8";
                resp.Write("不要闹！");
                return;
            }
            resp.Write(
                "<xml><return_code><![CDATA[SUCCESS]]></return_code><return_msg><![CDATA[OK]]></return_msg></xml>");

        }
    }
}