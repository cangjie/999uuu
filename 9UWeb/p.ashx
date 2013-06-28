<%@ WebHandler Language="C#" Class="PriceCalendar" %>

using System;
using System.Web;
using _9UCore;
using System.Data;

public class PriceCalendar : IHttpHandler {
    
    public void ProcessRequest (HttpContext context) {
        string ret = "";
        int id = int.Parse(context.Request["id"]);
        Product p = new Product(id);
        DataTable dt = p.DateList;
        int year = int.Parse(context.Request["year"]);
        int month = int.Parse(context.Request["mon"]);
        ret = "<tr class=\"xq_xingqi\"><td width=\"70\">星期日</td><td width=\"70\">星期一</td><td width=\"70\">星期二</td><td width=\"70\">星期三</td><td width=\"70\">星期四</td><td width=\"70\">星期五</td><td width=\"70\">星期六</td></tr>\r\n";
        DateTime s = DateTime.Parse(year.ToString() + "-" + month.ToString() + "-1");
        DateTime e = s.AddMonths(1).AddDays(-1);
        DateTime curD = s;
        int idx = 1;
        for (int i = 0; i < 6 && curD <= e; i++)
        {
            ret = ret + "<tr class=\"xq_day\">\r\n";
            for (DayOfWeek  j = DayOfWeek.Sunday ; j <= DayOfWeek.Saturday ; j++)
            {
                string clsName = "dateshow";

                switch (j)
                { 
                    case DayOfWeek.Sunday:
                        clsName = "today";
                        break;
                    case DayOfWeek.Saturday:
                        clsName = "today";
                        break;
                    default :
                        break;
                }
                if (curD == DateTime.Parse(DateTime.Now.ToShortDateString()))
                    clsName = "today";

                DataRow[] drArr = dt.Select(" 日期 = '" + curD.ToString() + "' ");

                if (drArr.Length > 0)
                {
                    clsName = "tdNow";
                }
                
                ret = ret + "<td class=\"" + clsName + "\">\r\n<div id=\"blankTagDateL" + idx.ToString() + "\">";
                
                if (curD.DayOfWeek == j && curD.Month == month )
                {
                    ret = ret + curD.Day.ToString();
                    curD = curD.AddDays(1);
                }
                ret = ret + "</div>\r\n";
                if (clsName.Trim().Equals("tdNow"))
                {
                    ret = ret + "<div id=\"blankTagValueL" + idx.ToString() + "\" ><div class=\"kucun\" ><span>&nbsp;<br/></span></div><div class=\"tdPrice ff2a00 ar\" >¥"+drArr[0]["价格"].ToString() + "</div></div>";
                }


                idx++;
            }
            ret = ret + "</tr>\r\n";
        }
        context.Response.ContentType = "text/plain";
        context.Response.Write(ret);
    }
 
    public bool IsReusable {
        get {
            return false;
        }
    }

}