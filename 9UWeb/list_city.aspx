<%@ Page Language="C#" %>
<%@ Import Namespace="_9UCore" %>
<%@ Import Namespace="System.Data" %>
<%@ Register src="_head.ascx" tagname="_head" tagprefix="uc1" %>

<%@ Register src="_nav.ascx" tagname="_nav" tagprefix="uc2" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<script runat="server">

    public Product[] pArr;
    
    public string city = "昆明大理丽江";

    public string title = "";
    public string keywd = "";
    
    
    protected void Page_Load(object sender, EventArgs e)
    {
        //string city = "昆明大理丽江";
        try
        {
            city = Server.UrlDecode(Request["city"].Trim()).Replace("'", "");
        }
        catch
        { 
        
        }
        pArr = Product.GetProductsByCity(city);
        try
        {
            title = city + " " + pArr[0]._field["tar_title"].ToString().Trim() + " 中唐国旅-游走天下";
            keywd = city+",";
            foreach (Product p in pArr)
            {
                keywd = keywd + p._field["tar_title"].ToString().Trim() + ",";
            }
        }
        catch
        { 
        
        }
        
    }
</script>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title><%=title %></title>
    <meta name="keywords" content="<%=keywd %>" />
    <meta name="description" content="<%=keywd %>" />
    <link rel="stylesheet" type="text/css" href="jic/css/common.css" />
	<link rel="stylesheet" type="text/css" href="jic/css/search_list.css" />
    <script src="jic/jssrc/jquery-1.4.2.min.js" type="text/javascript"></script>
    <!--script src="jic/jssrc/spin.js" type="text/javascript"></script>
    <script src="jic/jssrc/butbu_v1.0.js" type="text/javascript"></script>	
	<script type="text/javascript" src="jic/js/jq.js"></script>	
	<script type="text/javascript" src="jic/js/focus.js"></script-->	
</head>
<body>
    <form id="form1" runat="server">
    <div class="wrapper" >
        <uc1:_head ID="_head1" runat="server" />
        <br />
        <uc2:_nav ID="_nav1" runat="server" />
        <div class="sch-content">
  <div class="sch-content-left">
    <div class="sch-content-left1"> </div>
    <div class="sch-content-left2">
    <%
        int pageSize = 7;
        
        int curP = 0;
        
        try
        {
            curP = int.Parse(Request["curp"].Trim());
        }
        catch
        {
        
        }
        
        for (int i = 0; i < pageSize; i++)
        {
            int idx = curP * pageSize + i;
            if (idx < pArr.Length)
            {
                string a = pArr[idx].ImageUrl.Trim();
         %>
    
    
       <div class="xlsb">
        <div class="xlsb-top">
          <div class="xlsb-top-left">
            <dl>
              <dt><a target="_blank" href="detail.aspx?id=<%=pArr[idx]._field["tar_id"].ToString() %>"><img title="<%=pArr[idx]._field["tar_title"].ToString().Trim() %>" alt="<%=pArr[idx]._field["tar_title"].ToString().Trim() %>" src="<%=pArr[idx].ImageUrl.Trim() %>"></a></dt>
              <dd></dd>
              
            </dl>
          </div>
          <div class="xlsb-top-mid"> 
             
             
			<ul>
				<li><h2><a target="_blank" href="detail.aspx?id=<%=pArr[idx]._field["tar_id"].ToString() %>" title="<%=pArr[idx]._field["tar_title"].ToString().Trim() %>" ><%=((pArr[idx]._field["tar_title"].ToString().Trim().Length <=28)? pArr[idx]._field["tar_title"].ToString().Trim():pArr[idx]._field["tar_title"].ToString().Trim().Substring(0,28) + "……" )  %></a></h2></li>
				<li class="xc-tedian"><strong>行程特点：</strong><span><%=(pArr[idx].ShortMemo.Trim().Length <= 500 ? pArr[idx].ShortMemo.Trim() : pArr[idx].ShortMemo.Trim().Substring(0,500)) %></span></li>
				<br /><br />
                <li><strong>行程天数：</strong><%=pArr[idx]._field["tar_days"].ToString() %></li>
                <li><strong>交&nbsp;&nbsp;&nbsp; 通：</strong><%=pArr[idx]._field["tar_airline"].ToString() %></li>
				 <li class="cf-rq"><strong>价&nbsp;&nbsp;&nbsp; 格：</strong>
                     <b><font color="red" size="4" >
                     <%
                if (pArr[idx].RefPrice == 0)
                {
                    %>
                         电话详询
                         <%
                }
                else
                {
                          %>
                         <%=pArr[idx].RefPrice %>元<%= (pArr[idx].MultiPrice ? "起":"") %>
                         <%}
                              %>
                     </font></b>

				 </li>
				 <li style="height:22px;"></li>
			</ul>
          </div>

            <!--

          <div class="xlsb-top-right">
            <ul>
              <li>
                <h3>a</h3>
              </li>
              <li>b</li>
              <li>
                <h5>c</h5>
              </li>
              <li>d</li>
              <li>e</li>
              <li>f</li>
            </ul>
          </div>

            -->
        </div>
      </div>
      
      <%
        }
            else 
            { 
            
            }
        }
             %>

        </div>
        <%
            int pageCount = 0;
            if (pArr.Length / pageSize * pageSize == pArr.Length)
                pageCount = pArr.Length / pageSize;
            else
                pageCount = pArr.Length / pageSize + 1;
            if (pageCount > 1)
            {
             %>
    <ul class="paginator"><li class="home"><a href="?curp=0&city=<%=city.Trim() %>">首  页</a></li>
    <%
        for (int pidx = 0; pidx < pageCount; pidx++)
        {
                 %>
    <li   <%=((curP==pidx) ? "class=\"current\"" : "") %>   ><a href="?curp=<%=pidx.ToString() %>&city=<%=city.Trim() %>"><%=pidx+1 %></a></li>
    <%
        }
         %>
   <li class="moye"><a href="?curp=<%=pageCount-1 %>&city=<%=city.Trim() %>">末  页</a></li></ul>
    <%
            }
                 %>
  </div>
  <div class="sch-content-right">
    <div class="leftqa">
  <div class="leftqatitle">
    <h1>出境游常见问题</h1>
  </div>
  <div class="leftqapic"><img src="http://www.btgbj.com/template/201205/images/leftqapic.jpg" alt=""></div>
  <div class="leftqatext">
    <ul>
      <li>·<a href="/article.php?id=312" target="_blank" title="出境旅游预订须知">出境旅游预订须知</a></li>
      <li>·<a href="/article.php?id=313" target="_blank" title="中国出入境相关规定">中国出入境相关规定</a></li>
      <li>·<a href="/article.php?id=314" target="_blank" title="申请护照办理流程 ">申请护照办理流程 </a></li>
      <li>·<a href="/article.php?id=315" target="_blank" title="存款证明是什么？">存款证明是什么？</a></li>
      <li>·<a href="/article.php?id=316" target="_blank" title="拒签后签证费退还么">拒签后签证费退还么</a></li>
      <li>·<a href="/article.php?id=317" target="_blank" title="门市签约流程">门市签约流程</a> <!--<li>·<a target="_blank" href="#">中国出入境相关规定</a></li>      <li>·<a target="_blank" href="#">护照办理须知</a></li>--></li>
    </ul>
  </div>
</div>
 
<div class="leftqa">
  <div class="leftqatitle">
    <h1>国内游常见问题</h1>
  </div>
  <div class="leftqapic"><img src="/jic/images/guonei_help.jpg" alt=""></div>
  <div class="leftqatext">
    <ul>
     <li>·<a href="/article.php?id=367" target="_blank">国内旅游预订须知 </a></li>

    <li>·<a href="/article.php?id=366" target="_blank">国内退款、退团政策</a></li>

    <li>·<a href="/article.php?id=349" target="_blank">国内航班的相关规定 </a></li>

    </ul>
  </div>
</div>
 
    <div class="leftarticle">
  <div class="leftarticletitle">
    <h1>热门目的地资讯</h1>
  </div>
  <div class="leftarticlepic">
    <ul>
      <li><a href="/channel_list.php?zone=yunnan" target="_blank" title="云南"><img src="http://www.btgbj.com/template/201205/images/yn.jpg" alt="云南"></a>
        <p><a href="/channel_list.php?zone=yunnan" target="_blank" title="云南">云南</a></p>
      </li>
      <li><a href="/channel_list.php?zone=hanguo" target="_blank" title="韩国"><img src="http://www.btgbj.com/template/201205/images/youdongjing.jpg" alt="韩国"></a>
        <p><a href="/channel_list.php?zone=hanguo" target="_blank" title="韩国">韩国</a></p>
      </li>
      <li><a href="/channel_list.php?zone=Bali" target="_blank" title="巴厘岛"><img src="http://www.btgbj.com/template/201205/images/youxila.jpg" alt="巴厘岛"></a>
        <p><a href="/channel_list.php?zone=Bali" target="_blank" title="巴厘岛">巴厘岛</a></p>
      </li>
    </ul>
  </div>
  <div class="leftarticletext">
    <ul>
       
            <li><a target="_blank" href="/travelnote.php?id=106">快乐的旅行&mdash;&mdash;土耳其</a></li>
            <li><a target="_blank" href="/travelnote.php?id=105">西藏  另一个天堂</a></li>
            <li><a target="_blank" href="/travelnote.php?id=104">没有目的地的旅游 只有我和她</a></li>
            <li><a target="_blank" href="/travelnote.php?id=103">我心中的八达岭一日游</a></li>
            <li><a target="_blank" href="/travelnote.php?id=102">搭乘“海洋神话号”邮轮浪漫经历</a></li>
            <li><a target="_blank" href="/travelnote.php?id=101">海洋天堂马尔代夫满月岛出游手记</a></li>
            <li><a target="_blank" href="/travelnote.php?id=100">阿亨湖--奥地利最俊美的山水风光</a></li>
            <li><a target="_blank" href="/travelnote.php?id=99">最古老的购物中心--罕哈利利市场</a></li>
            <li><a target="_blank" href="/travelnote.php?id=98">科尔马--最具德国血统的法国小镇</a></li>
            <li><a target="_blank" href="/travelnote.php?id=97">悠游纳米比亚用心聆听沙海交响曲</a></li>
          </ul>
  </div>
</div>
 
  </div>
</div>
    </div>
    </form>
</body>
</html>
