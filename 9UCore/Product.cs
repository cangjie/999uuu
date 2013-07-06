using System;
using System.Collections.Generic;
using System.Text;
using System.Data;
using System.Data.SqlClient;

namespace _9UCore
{
    public class Product
    {
        public DataRow _field;

        public Product()
        { 
        
        }

        public Product(int id)
        {
            SqlDataAdapter da = new SqlDataAdapter(" select * from tar where tar_id = " + id.ToString(), Util.ConnectingString);
            DataTable dt = new DataTable();
            da.Fill(dt);
            if (dt.Rows.Count >0)
                _field = dt.Rows[0];
            da.Dispose();
        }

        public double RefPrice
        {
            get
            {
                double p1 = double.Parse(_field["tar_price"].ToString());
                double p2 = double.Parse(_field["tar_price2"].ToString());
                double p3 = double.Parse(_field["tar_price3"].ToString());
                double p4 = double.Parse(_field["tar_price4"].ToString());
                p1 = ((p1 == 0) ? double.MaxValue : p1);
                p2 = ((p2 == 0) ? double.MaxValue : p2);
                p3 = ((p3 == 0) ? double.MaxValue : p3);
                p4 = ((p4 == 0) ? double.MaxValue : p4);
                double ret = Math.Min(Math.Min(p1, p2), Math.Min(p3, p4));
                if (ret == double.MaxValue)
                {
                    SqlDataAdapter da = new SqlDataAdapter(" select min(datelist_price) from datelist where datelist_price > 0 and datelist_tid = " + _field["tar_id"].ToString(), Util.ConnectingString);
                    DataTable dt = new DataTable();
                    da.Fill(dt);
                    da.Dispose();
                    if (dt.Rows.Count == 1)
                        try
                        {
                            ret = double.Parse(dt.Rows[0][0].ToString());
                        }
                        catch
                        { 
                        
                        }
                    dt.Dispose();
                    da.Dispose();
                }
                if (ret == double.MaxValue)
                    ret = 0;
                return ret;
            }
        }

        public bool MultiPrice
        {
            get
            {
                double p1 = double.Parse(_field["tar_price"].ToString());
                double p2 = double.Parse(_field["tar_price2"].ToString());
                double p3 = double.Parse(_field["tar_price3"].ToString());
                double p4 = double.Parse(_field["tar_price4"].ToString());
                bool mul = false;
                int gtZeroTimes = 0;
                if (p1 > 0)
                    gtZeroTimes++;
                if (p2 > 0)
                    gtZeroTimes++;
                if (p3 > 0)
                    gtZeroTimes++;
                if (p4 > 0)
                    gtZeroTimes++;
                if (gtZeroTimes == 0)
                {
                    //double ret = 0;
                    SqlDataAdapter da = new SqlDataAdapter(" select min(datelist_price) from datelist where datelist_price > 0 and datelist_tid = " + _field["tar_id"].ToString(), Util.ConnectingString);
                    DataTable dt = new DataTable();
                    da.Fill(dt);
                    da.Dispose();
                    if (dt.Rows.Count == 1)
                        try
                        {
                            if (double.Parse(dt.Rows[0][0].ToString()) > 0)
                                gtZeroTimes++;
                        }
                        catch
                        {

                        }
                    dt.Dispose();
                    da.Dispose();
                }
                if (gtZeroTimes > 1)
                    mul = true;
                else
                    mul = false;
                return mul;
            }
        }

        public int Update()
        {
            string sqlStr = " update tar set "
                + " tar_prov = @prov , "
                + " tar_city = @city , "
                + " tar_prov2 = @prov2 , "
                + " tar_city2 = @city2 , "
                + " tar_prov3 = @prov3 , "
                + " tar_city3 = @city3 , "
                + " tar_price = @price , "
                + " tar_price2 = @price2 , "
                + " tar_price3 = @price3 , "
                + " tar_price4 = @price4 , "
                + " tar_title = @title , "
                + " tar_abroad = @type , "
                + " tar_abroad2 = @type2 , "
                + " tar_abroad3 = @type3 , "
                + " tar_startcity = @startcity  , "
                + " tar_days = @days , "
                + " tar_airline = @airline  , "
                + " tar_sights = @sights  , "
                + " tar_intro = @intro , "
                + " tar_triplist = @triplist  , "
                + " tar_level = @level  , "
                + " tar_shopping = @shopping , "
                + " tar_fee = @fee , "
                + " tar_memo  = @memo , "
                + " tar_img = @img  where tar_id = @id ";
            SqlConnection conn = new SqlConnection(Util.ConnectingString);
            SqlCommand cmd = new SqlCommand(sqlStr, conn);
            cmd.Parameters.Add("@prov", _field["tar_prov"].ToString().Trim());
            cmd.Parameters.Add("@city", _field["tar_city"].ToString().Trim());
            cmd.Parameters.Add("@prov2", _field["tar_prov2"].ToString().Trim());
            cmd.Parameters.Add("@city2", _field["tar_city2"].ToString().Trim());
            cmd.Parameters.Add("@prov3", _field["tar_prov3"].ToString().Trim());
            cmd.Parameters.Add("@city3", _field["tar_city3"].ToString().Trim());
            cmd.Parameters.Add("@price", _field["tar_price"].ToString().Trim());
            cmd.Parameters.Add("@price2", _field["tar_price2"].ToString().Trim());
            cmd.Parameters.Add("@price3", _field["tar_price3"].ToString().Trim());
            cmd.Parameters.Add("@price4", _field["tar_price4"].ToString().Trim());
            cmd.Parameters.Add("@title", _field["tar_title"].ToString().Trim());
            cmd.Parameters.Add("@type", _field["tar_abroad"].ToString().Trim());
            cmd.Parameters.Add("@type2", _field["tar_abroad2"].ToString().Trim());
            cmd.Parameters.Add("@type3", _field["tar_abroad3"].ToString().Trim());
            cmd.Parameters.Add("@startcity", _field["tar_startcity"].ToString().Trim());
            cmd.Parameters.Add("@days", _field["tar_days"].ToString().Trim());
            cmd.Parameters.Add("@airline", _field["tar_airline"].ToString().Trim());
            cmd.Parameters.Add("@sights", _field["tar_sights"].ToString().Trim());
            cmd.Parameters.Add("@intro", _field["tar_intro"].ToString().Trim());
            cmd.Parameters.Add("@triplist", _field["tar_triplist"].ToString().Trim());
            cmd.Parameters.Add("@level", _field["tar_level"].ToString().Trim());
            cmd.Parameters.Add("@shopping", _field["tar_shopping"].ToString().Trim());
            cmd.Parameters.Add("@fee", _field["tar_fee"].ToString().Trim());
            cmd.Parameters.Add("@memo", _field["tar_memo"].ToString().Trim());
            cmd.Parameters.Add("@img", _field["tar_img"].ToString().Trim());
            cmd.Parameters.Add("@id", _field["tar_id"].ToString().Trim());
            conn.Open();
            int i = cmd.ExecuteNonQuery();
            conn.Close();
            cmd.Parameters.Clear();
            cmd.Dispose();
            conn.Dispose();
            return i;
        }

        public string ClassName
        {
            get
            {
                string n = "";
                switch (int.Parse(_field["tar_abroad"].ToString().Trim()))
                { 
                    case 0:
                        n = "国内游";
                        break;
                    case 1:
                        n = "出境游";
                        break;
                    case 2:
                        n = "周边游";
                        break;
                    case 3:
                        n = "海岛游";
                        break;
                    default:
                        break;
                }
                return n;
            }
        }

        public string ImageUrl
        {
            get
            {
                string r = "";
                string ori = _field["tar_img"].ToString().Trim();
                try
                {
                    r = ori.Substring(ori.IndexOf("src"), ori.Length - ori.IndexOf("src")).Trim();
                    r = r.Substring(0, r.IndexOf(" ")).Trim();
                    r = r.Replace("src=", "").Replace("\"", "").Trim();
                }
                catch
                { 
                
                }
                return r;
            }
        }

        public string ShortMemo
        {
            get
            {
                return Util.GetRidOfHtmlMark(_field["tar_intro"].ToString().Trim());
                //string r = ori.Replace("<p>", "").Replace("</p>", "").Replace("<div>", "").Replace("</div>", "").Replace("<br>", "").Replace("</br>", "").Trim();
                //if (r.Length > 20)
                //    r = r.Substring(0, 20);
                //return ori;
            }
        }

        public DataTable DateList
        {
            get
            {
                SqlDataAdapter da = new SqlDataAdapter(" select datelist_id as id , datelist_date as 日期 , datelist_price as 价格   from datelist where datelist_tid = " + _field["tar_id"].ToString() + "   order by datelist_date  ", Util.ConnectingString.Trim());
                DataTable dt = new DataTable();
                da.Fill(dt);
                da.Dispose();
                return dt;
            }
            set
            {
                try
                {
                    DataTable dt = value;
                    SqlConnection conn = new SqlConnection(Util.ConnectingString);
                    SqlCommand cmd = new SqlCommand(" delete datelist where datelist_tid = " + _field["tar_id"].ToString(), conn);
                    conn.Open();
                    cmd.ExecuteNonQuery();
                    conn.Close();
                    cmd.CommandText = " insert into datelist (  datelist_date , datelist_price , datelist_tid )  values ( @date , @price , " + _field["tar_id"].ToString() + " ) ";
                    cmd.Parameters.Add("@date", SqlDbType.DateTime);
                    cmd.Parameters.Add("@price", SqlDbType.Float);
                    conn.Open();
                    foreach (DataRow dr in dt.Rows)
                    {
                        cmd.Parameters["@date"].Value = DateTime.Parse(dr["日期"].ToString().Trim());
                        cmd.Parameters["@price"].Value = double.Parse(dr["价格"].ToString().Trim());
                        cmd.ExecuteNonQuery();
                    }
                    conn.Close();
                    cmd.Parameters.Clear();
                    cmd.Dispose();
                    conn.Dispose();
                }
                catch
                { 
                
                }
            }
        }

        public string GetTitle(int len)
        {
            string ret = _field["tar_title"].ToString().Trim();
            return ((ret.Length <= len) ? ret : ret.Substring(0, len - 1) + "…");
        }

        public static Product[] GetProductsByCity(string City,int type)
        {
            SqlDataAdapter da = new SqlDataAdapter(" select * from tar where  tar_abroad = " + type.ToString() + " and (  tar_city = '" + City.Replace("'", "").Trim() + "' or tar_city2 = '" + City.Replace("'", "").Trim() + "' or   tar_city3 = '" + City.Replace("'", "").Trim() + "'  )    order by tar_id desc  ", Util.ConnectingString);
            DataTable dt = new DataTable();
            da.Fill(dt);
            da.Dispose();
            Product[] pArr = new Product[dt.Rows.Count];
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                pArr[i] = new Product();
                pArr[i]._field = dt.Rows[i];
            }
            return pArr;
        }

        public static Product[] GetProductsByCity(string City)
        {
            SqlDataAdapter da = new SqlDataAdapter(" select * from tar where   (  tar_city = '" + City.Replace("'", "").Trim() + "' or tar_city2 = '" + City.Replace("'", "").Trim() + "'  or tar_city3 = '" + City.Replace("'", "").Trim() + "')    order by tar_id desc ", Util.ConnectingString);
            DataTable dt = new DataTable();
            da.Fill(dt);
            da.Dispose();
            Product[] pArr = new Product[dt.Rows.Count];
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                pArr[i] = new Product();
                pArr[i]._field = dt.Rows[i];
            }
            return pArr;
        }

        public static DataTable AddProv(DataTable dt,string name)
        {
            bool exists = false;
            foreach (DataRow dr in dt.Rows)
            {
                if (dr[0].ToString().Equals(name.Trim()))
                {
                    exists = true;
                    break;
                }
            }
            if (!exists)
            {
                DataRow drWest = dt.NewRow();
                drWest[0] = name;
                dt.Rows.Add(drWest);
            }
            return dt;
        }

        public static string[] GetProvince(int type)
        {
            SqlDataAdapter da = new SqlDataAdapter(" select distinct tar_prov from tar where tar_abroad = " + type.ToString() + "    ", Util.ConnectingString);
            DataTable dt = new DataTable();
            da.Fill(dt);
            da.Dispose();

            if (type == 0)
            {
                dt = AddProv(dt, "华东");
                dt = AddProv(dt, "江西");
                dt = AddProv(dt, "海南");
                dt = AddProv(dt, "贵州");
                dt = AddProv(dt, "内蒙古");
                dt = AddProv(dt, "广深珠");
                dt = AddProv(dt, "湖北");
            }
            if (type == 1)
            {
                dt = AddProv(dt, "非洲");
                dt = AddProv(dt, "VIP");
            }
            if (type == 2)
            {
                dt = AddProv(dt, "京郊");
                dt = AddProv(dt, "河北");
                dt = AddProv(dt, "河南");
                dt = AddProv(dt, "山西");
                dt = AddProv(dt, "山东");
            }
            string[] sArr = new string[dt.Rows.Count];
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                sArr[i] = dt.Rows[i][0].ToString().Trim();
            }
            da.Dispose();

            


            return sArr;
        }


        public static string[] GetCity(string Prov, int type)
        {
            SqlDataAdapter da = new SqlDataAdapter(" select distinct tar_city from tar where tar_abroad = " + type.ToString() + "  and tar_prov = '" + Prov.Trim() + "'  ", Util.ConnectingString);
            DataTable dt = new DataTable();
            da.Fill(dt);
            da.Dispose();

            if (type == 0 && Prov.Trim().Equals("东北"))
            {
                dt = AddProv(dt, "黑龙江");
                
            }
            if (type == 0 && Prov.Trim().Equals("湖南"))
            {
                dt = AddProv(dt, "凤凰");

            }
            if (type == 0 && Prov.Trim().Equals("湖南"))
            {
                dt = AddProv(dt, "长沙");

            }
            if (type == 0 && Prov.Trim().Equals("华东"))
            {
                dt = AddProv(dt, "黄山");
                dt = AddProv(dt, "南京");
                dt = AddProv(dt, "苏杭");
                dt = AddProv(dt, "上海");
                dt = AddProv(dt, "九华山");
                dt = AddProv(dt, "水乡");

            }
            if (type == 0 && Prov.Trim().Equals("江西"))
            {
                dt = AddProv(dt, "井冈山");
                dt = AddProv(dt, "庐山");
                dt = AddProv(dt, "婺源");
                dt = AddProv(dt, "南昌");
            }
            if (type == 0 && Prov.Trim().Equals("海南"))
            {
                dt = AddProv(dt, "三亚");
                dt = AddProv(dt, "海口");
                dt = AddProv(dt, "蜈支洲");
            }
            if (type == 0 && Prov.Trim().Equals("四川"))
            {
                dt = AddProv(dt, "九寨沟");
                dt = AddProv(dt, "峨眉山");
                dt = AddProv(dt, "乐山");
                dt = AddProv(dt, "稻城亚丁");
            }
            if (type == 0 && Prov.Trim().Equals("贵州"))
            {
                dt = AddProv(dt, "黄果树");
                dt = AddProv(dt, "荔波");
                dt = AddProv(dt, "西江");
                dt = AddProv(dt, "遵义");
                dt = AddProv(dt, "梵净山");
            }
            if (type == 0 && Prov.Trim().Equals("内蒙古"))
            {
                dt = AddProv(dt, "呼伦贝尔");
                dt = AddProv(dt, "希拉穆仁");
                dt = AddProv(dt, "锡林郭勒");
            }
            if (type == 0 && Prov.Trim().Equals("广深珠"))
            {
                dt = AddProv(dt, "广州");
                dt = AddProv(dt, "韶关");
                dt = AddProv(dt, "肇庆");
                dt = AddProv(dt, "珠海");
            }
            if (type == 0 && Prov.Trim().Equals("云南"))
            {
                dt = AddProv(dt, "香格里拉");
            }
            if (type == 0 && Prov.Trim().Equals("湖北"))
            {
                dt = AddProv(dt, "游轮");
                dt = AddProv(dt, "三峡");
                dt = AddProv(dt, "武当山");
                dt = AddProv(dt, "恩施");
                dt = AddProv(dt, "神农架");
                dt = AddProv(dt, "香格里拉");
                dt = AddProv(dt, "香格里拉");

            }
            if (type == 0 && Prov.Trim().Equals("广西"))
            {
                dt = AddProv(dt, "北海");
                dt = AddProv(dt, "涠洲岛");

            }
            if (type == 0 && Prov.Trim().Equals("福建"))
            {
                dt = AddProv(dt, "厦门");
                dt = AddProv(dt, "鼓浪屿");
            }
            if (type == 0 && Prov.Trim().Equals("陕西"))
            {
                dt = AddProv(dt, "华山");
                dt = AddProv(dt, "壶口");
                dt = AddProv(dt, "延安");
            }
            if (type == 1 && Prov.Trim().Equals("中东非"))
            {
                dt = AddProv(dt, "埃及");
                dt = AddProv(dt, "迪拜");
                dt = AddProv(dt, "南非");
                dt = AddProv(dt, "突尼斯");
                dt = AddProv(dt, "塞舌尔");
            }
            if (type == 1 && Prov.Trim().Equals("非洲"))
            {
                dt = AddProv(dt, "肯尼亚");
                dt = AddProv(dt, "赞比亚");
                dt = AddProv(dt, "津巴布韦");
                
            }
            if (type == 1 && Prov.Trim().Equals("大洋洲"))
            {
                dt = AddProv(dt, "斐济");
                dt = AddProv(dt, "帕劳");
            }
            if (type == 1 && Prov.Trim().Equals("东南亚"))
            {
                dt = AddProv(dt, "缅甸");
                dt = AddProv(dt, "越柬");
                dt = AddProv(dt, "菲律宾");
                dt = AddProv(dt, "新马泰");
            }
            if (type == 1 && Prov.Trim().Equals("南亚"))
            {
                dt = AddProv(dt, "印度");
                dt = AddProv(dt, "马尔代夫");
                dt = AddProv(dt, "巴基斯坦");
                dt = AddProv(dt, "斯里兰卡");
            }
            if (type == 1 && Prov.Trim().Equals("西亚"))
            {
                dt = AddProv(dt, "伊朗");
                dt = AddProv(dt, "巴勒斯坦");
                
            }
            if (type == 1 && Prov.Trim().Equals("亚洲"))
            {
                dt = AddProv(dt, "朝鲜");
                dt = AddProv(dt, "蒙古");
            }
            if (type == 1 && Prov.Trim().Equals("美洲"))
            {
                dt = AddProv(dt, "加拿大");
                dt = AddProv(dt, "巴西");
                dt = AddProv(dt, "墨西哥");
                dt = AddProv(dt, "古巴");
            }
            if (type == 1 && Prov.Trim().Equals("欧洲"))
            {
                dt = AddProv(dt, "希腊");
                dt = AddProv(dt, "法国");
                
            }
            if (type == 1 && Prov.Trim().Equals("VIP"))
            {
                dt = AddProv(dt, "南北极");
                dt = AddProv(dt, "打猎");
                dt = AddProv(dt, "高尔夫");
                dt = AddProv(dt, "探险");

            }
            if (type == 2 && Prov.Trim().Equals("京郊"))
            {
                dt = AddProv(dt, "延庆");
                dt = AddProv(dt, "平谷");
                dt = AddProv(dt, "怀柔");
                dt = AddProv(dt, "密云");

            }
            if (type == 2 && Prov.Trim().Equals("河北"))
            {
                dt = AddProv(dt, "坝上草原");
                dt = AddProv(dt, "木兰围场");
                dt = AddProv(dt, "南北戴河");
                

            }
            if (type == 2 && Prov.Trim().Equals("河南"))
            {
                dt = AddProv(dt, "焦作");
                dt = AddProv(dt, "郑州");
                dt = AddProv(dt, "开封");
                dt = AddProv(dt, "安阳");

            }
            if (type == 2 && Prov.Trim().Equals("山西"))
            {
                dt = AddProv(dt, "五台山");
                dt = AddProv(dt, "平遥");
                dt = AddProv(dt, "绵山");
                dt = AddProv(dt, "太原");
                dt = AddProv(dt, "大同");

            }
            if (type == 2 && Prov.Trim().Equals("山东"))
            {
                dt = AddProv(dt, "泰山");
                dt = AddProv(dt, "青岛");
                dt = AddProv(dt, "大连");
                dt = AddProv(dt, "日照");
                dt = AddProv(dt, "威海");

            }
            /*
            if (type == 0 && Prov.Trim().Equals("云南"))
            {
                dt.Rows.Clear();
                bool exist = false;
                foreach (DataRow dr in dt.Rows)
                {
                    if (dr[0].ToString().Equals("大理"))
                    {
                        exist = true;
                        break;
                    }
                }
                if (!exist)
                {
                    DataRow drAdd = dt.NewRow();
                    drAdd[0] = "大理";
                    dt.Rows.Add(drAdd);
                }
                exist = false;
                foreach (DataRow dr in dt.Rows)
                {
                    if (dr[0].ToString().Equals("丽江"))
                    {
                        exist = true;
                        break;
                    }
                }
                if (!exist)
                {
                    DataRow drAdd = dt.NewRow();
                    drAdd[0] = "丽江";
                    dt.Rows.Add(drAdd);
                }
                exist = false;
                foreach (DataRow dr in dt.Rows)
                {
                    if (dr[0].ToString().Equals("腾冲"))
                    {
                        exist = true;
                        break;
                    }
                }
                if (!exist)
                {
                    DataRow drAdd = dt.NewRow();
                    drAdd[0] = "腾冲";
                    dt.Rows.Add(drAdd);
                }
                exist = false;
                foreach (DataRow dr in dt.Rows)
                {
                    if (dr[0].ToString().Equals("瑞丽"))
                    {
                        exist = true;
                        break;
                    }
                }
                if (!exist)
                {
                    DataRow drAdd = dt.NewRow();
                    drAdd[0] = "瑞丽";
                    dt.Rows.Add(drAdd);
                }
                exist = false;
                foreach (DataRow dr in dt.Rows)
                {
                    if (dr[0].ToString().Equals("香格里拉"))
                    {
                        exist = true;
                        break;
                    }
                }
                if (!exist)
                {
                    DataRow drAdd = dt.NewRow();
                    drAdd[0] = "香格里拉";
                    dt.Rows.Add(drAdd);
                }
            }
            */
            string[] sArr = new string[dt.Rows.Count];
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                sArr[i] = dt.Rows[i][0].ToString().Trim();
            }
            da.Dispose();
            return sArr;
        }

        public static Product[] GetHotProd(string Prov, int type)
        {
            SqlDataAdapter da = new SqlDataAdapter(" select * from tar where tar_prov = '" + Prov.Trim() + "' and tar_abroad = " + type.ToString() , Util.ConnectingString.Trim());
            DataTable dt = new DataTable();
            da.Fill(dt);
            da.Dispose();
            Product[] pArr = new Product[dt.Rows.Count];
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                pArr[i] = new Product();
                pArr[i]._field = dt.Rows[i];
            }
            return pArr;
        }

        public static Product[] GetHotProdByType(int type)
        {
            SqlDataAdapter da = new SqlDataAdapter(" select * from tar where  tar_abroad = " + type.ToString() + "   order by tar_id desc  ", Util.ConnectingString.Trim());
            DataTable dt = new DataTable();
            da.Fill(dt);
            da.Dispose();
            Product[] pArr = new Product[dt.Rows.Count];
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                pArr[i] = new Product();
                pArr[i]._field = dt.Rows[i];
            }
            return pArr;
        }

        public static int AddNew(double price,double price2,double price3,double price4, int type, string prov, string city, string title, string startcity, string days, string airline, string sights, string intro,
            string triplist, string level, string shopping, string fee, string memo, string img)
        {
            int ret = 0;
            string sqlStr = " insert into tar ( "
                + " tar_prov, "
                + " tar_city , "
                + " tar_price , "
                + " tar_price2 , "
                + " tar_price3 , "
                + " tar_price4 , "
                + " tar_title , "
                + " tar_abroad , "
                + " tar_startcity , "
                + " tar_days , "
                + " tar_airline , "
                + " tar_sights , "
                + " tar_intro , "
                + " tar_triplist , "
                + " tar_level , "
                + " tar_shopping , "
                + " tar_fee , "
                + " tar_memo , "
                + " tar_img ) "
                + " values ( "
                + " @prov , "
                + " @city , "
                + " @price , "
                + " @price2 , "
                + " @price3 , "
                + " @price4 , "
                + " @title , "
                + " @type , "
                + " @startcity , "
                + " @days , "
                + " @ariline , "
                + " @sights , "
                + " @intro , "
                + " @triplist , "
                + " @level , "
                + " @shopping , "
                + " @fee , "
                + " @memo , "
                + " @img ) ";
            SqlConnection conn = new SqlConnection(Util.ConnectingString);
            SqlCommand cmd = new SqlCommand(sqlStr, conn);
            cmd.Parameters.Add("@prov",prov);
            cmd.Parameters.Add("@city",city);
            cmd.Parameters.Add("@price", price);
            cmd.Parameters.Add("@price2", price2);
            cmd.Parameters.Add("@price3", price3);
            cmd.Parameters.Add("@price4", price4);
            cmd.Parameters.Add("@title",title);
            cmd.Parameters.Add("@type",type);
            cmd.Parameters.Add("@startcity",startcity);
            cmd.Parameters.Add("@days",days);
            cmd.Parameters.Add("@ariline",airline);
            cmd.Parameters.Add("@sights",sights);
            cmd.Parameters.Add("@intro",intro);
            cmd.Parameters.Add("@triplist",triplist);
            cmd.Parameters.Add("@level",level);
            cmd.Parameters.Add("@shopping",shopping);
            cmd.Parameters.Add("@fee",fee);
            cmd.Parameters.Add("@memo",memo);
            cmd.Parameters.Add("@img",img);
            conn.Open();
            int i = cmd.ExecuteNonQuery();
            conn.Close();
            if (i == 1)
            {
                cmd.Parameters.Clear();
                cmd.CommandText = " select max(tar_id) from tar ";
                conn.Open();
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.Read())
                    ret = dr.GetInt32(0);
                dr.Close();
                conn.Close();

            }
            cmd.Dispose();
            conn.Dispose();
            return ret;
              
        }
    }
}