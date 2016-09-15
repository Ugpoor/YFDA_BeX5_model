using System.Data.Common;
using System.Web;
using com.justep.baas.action;
using com.justep.baas.Data;
using Newtonsoft.Json.Linq;

namespace justep
{
    using JSONObject = JObject;

    public class Demo
    {
        public static JSONObject getOrderCount(JSONObject paramObject, ActionContext context)
        {
            using (var conn = context.Connection("takeout"))
            {
                const string sql = "SELECT COUNT(ord.fID) AS orderCount "
                                   + " FROM takeout_order ord ";
                JSONObject ret = new JSONObject();
                int count = int.Parse(Util.GetValueBySql((DbConnection)conn, sql, null).ToString());
                ret.Add("orderCount", count);
                ((HttpResponse)context.Get(ActionContext.RESPONSE)).Write(ret.ToString());
            }

            return null;
        }
    }
}
