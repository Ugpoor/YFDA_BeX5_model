using System;
using System.Collections.Generic;
using System.Text;
using System.Web;
using com.justep.baas.action;
using upacp_sdk_net.com.unionpay.sdk;

namespace unionpay
{
    using JSONObject = Newtonsoft.Json.Linq.JObject;

    public class AppConsume
    {
        private static string merId = "898110253110715";

        public static string Version = "5.0.0";

        public static void getTN(JSONObject paramJObject, ActionContext context)
        {
            var orderId = ((HttpRequest)context.Get(ActionContext.REQUEST)).Params["orderId"];
            var data = new Dictionary<string, string>();
            // 版本号
            data.Add("version", "5.0.0");
            // 字符集编码 默认"UTF-8"
            data.Add("encoding", "UTF-8");
            // 签名方法 01 RSA
            data.Add("signMethod", "01");
            // 交易类型 01-消费
            data.Add("txnType", "01");
            // 交易子类型 01:自助消费 02:订购 03:分期付款
            data.Add("txnSubType", "01");
            // 业务类型
            data.Add("bizType", "000201");
            // 渠道类型，07-PC，08-手机
            data.Add("channelType", "08");
            // 前台通知地址 ，控件接入方式无作用
            data.Add("frontUrl", "");
            // 后台通知地址 必传项
            data.Add("backUrl", "http://www.wex5.com");
            // 接入类型，商户接入填0 0- 商户 ， 1： 收单， 2：平台商户
            data.Add("accessType", "0");
            // 商户号码，请改成自己的商户号
            data.Add("merId", merId);
            // 商户订单号，8-40位数字字母
            data.Add("orderId", orderId);
            // 订单发送时间，取系统时间
            data.Add("txnTime", DateTime.Today.ToString("yyyyMMddHHmmss"));
            // 交易金额，单位分
            data.Add("txnAmt", "10");
            // 交易币种
            data.Add("currencyCode", "156");
            // 请求方保留域，透传字段，查询、通知、对账文件中均会原样出现
            // data.put("reqReserved", "透传信息");
            // 订单描述，可不上送，上送时控件中会显示该信息
            // data.put("orderDesc", "订单描述");
            data = SignData(data);
            // 交易请求url 从配置文件读取
            string requestAppUrl = SDKConfig.AppRequestUrl;
            var resmap = SubmitUrl(data, requestAppUrl);
            string tn = resmap["tn"];
            var map = new JSONObject();
            map.Add("tn", tn);
            ((HttpResponse)context.Get(ActionContext.RESPONSE)).Write(map.ToString());
        }
        
        /// <summary>
        /// java main方法 数据提交 　　 对数据进行签名
        /// </summary>
        /// <param name="contentData">交易数据</param>
        /// <returns>签名后的map对象</returns>
        public static Dictionary<string, string> SignData(Dictionary<string, string> contentData)
        {
            var submitFromData = new Dictionary<string, string>();
            foreach (var item in contentData)
            {
                if (!string.IsNullOrEmpty(item.Value))
                {
                    submitFromData.Add(item.Key, item.Value);
                }
            }
            /**
             * 签名
             */
            SDKUtil.Sign(submitFromData, Encoding.UTF8);

            return submitFromData;
        }

        /**
	 * java main方法 数据提交 提交到后台
	 * 
	 * @param contentData
	 * @return 返回报文 map
	 */
        public static Dictionary<string, string> SubmitUrl(Dictionary<string, string> submitFromData, string requestUrl)
        {
            string resultString = "";
            /**
             * 发送
             */
            HttpClient hc = new HttpClient(requestUrl);
            try
            {
                int status = hc.Send(submitFromData, Encoding.UTF8);
                if (200 == status)
                {
                    resultString = hc.Result;
                }
            }
            catch (Exception e)
            {
                Console.WriteLine(e.Message);
            }

            var resData = new Dictionary<string, string>();
            /**
             * 验证签名
             */
            if (!string.IsNullOrEmpty(resultString))
            {
                // 将返回结果转换为map
                resData = SDKUtil.CoverStringToDictionary(resultString);
                /*if (SDKUtil.validate(resData, encoding)) {
                    //logger.info("验证签名成功");

                } else {
                    //logger.info("验证签名失败");
                }*/
                // 打印返回报文
                //logger.info("打印返回报文：" + resultString);
            }
            return resData;
        }
    }
}
