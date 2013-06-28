<%@ Page Language="C#" %>
<%@ Import Namespace="_9UCore" %>
<%@ Import Namespace="System.Data" %>
<%@ Register src="_head.ascx" tagname="_head" tagprefix="uc1" %>

<%@ Register src="_leftmenu.ascx" tagname="_leftmenu" tagprefix="uc2" %>

<%@ Register src="_tail.ascx" tagname="_tail" tagprefix="uc3" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<script runat="server">

    public string[] cityArr;
    public string prov;

    public string title = "";
    public string keywd = "";

    public string sType = "";
    
    //public string sProv = ""
    
    protected void Page_Load(object sender, EventArgs e)
    {
        switch (int.Parse(Request["type"].Trim()))
        { 
            case 0:
                sType = "国内游";
                break;
            case 1:
                sType = "出境游";
                break;
            case 2:
                sType = "周边游";
                break;
            case 4:
                sType = "海岛游";
                break;
            default:
                sType = "国内游";
                break;
        }
        
        prov = "东北";
        try
        {
            prov = Request["prov"].Trim();
        }
        catch
        { 
        
        }
        cityArr = Product.GetCity(prov.Trim(),int.Parse(Request["type"].Trim()));
	title = prov;
        keywd = "";
        foreach (string c in cityArr)
        {
            title = title + c.Trim() + " ";
            keywd = keywd + c.Trim() + ",";
            
        }
        title = title + " 等城市旅游路线-中唐国旅游走天下";
    }
</script>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title><%=title %></title>
    <meta name="keywords" content="<%=keywd%>" />
    <meta name="description" content="<%=title %>" />
    <link href="jic/css/common.css" type="text/css" rel="stylesheet" />
    <link href="jic/css/topic.css" type="text/css" rel="stylesheet" />
    <script type="text/javascript" src="jic/jssrc/jquery-1.4.2.min.js"></script>
    <!--script type="text/javascript" src="jic/jssrc/spin.js" />
    <script src="jic/jssrc/butbu_v1.0.js" type="text/javascript"></script>	
	<script type="text/javascript" src="jic/js/jq.js"></script>
	<script type="text/javascript" src="jic/js/focus.js"></script-->	
    
</head>
<body>
    <form id="form1" runat="server">
    <div class="wrapper"  >
        <uc1:_head ID="_head1" runat="server" />
        <div class="channelnav">
            <p>当前位置：<a href="/">首页</a> &gt; <a href="#"><%=sType %> </a>  &gt;  <a href="list_prov.aspx?prov=<%=Server.UrlEncode(prov) %>&type=<%=Request["type"].Trim() %>" ><%=prov %></a></p>
        </div>
        <div class="content">
  
            <uc2:_leftmenu ID="_leftmenu1" runat="server" />
            
  
  
  <div class="mainright"> 
    
    
<!--div class="rightbanner">
 <a href="/guonei/dongbei">
<img alt="" src="/jic/images/zhuanti/dongbei.jpg"></a> 
</div-->
    
<div class="rightcommend">
     
     
   <div class="rightcommendtitle">
    <h1>当季热卖</h1>
  </div>
  <div class="rightcommendlistall">
    <div class="rightcommendlist">
      <ul>
      <%
          Product[] pArr = Product.GetHotProd(prov.Trim(), int.Parse(Request["type"]));
          for (int i = 0; i < 4; i++)
          {
              if (i < pArr.Length)
              {
           %>
      
         <li>
          <div class="rightcommendpic"> <a target="_blank" href="detail.aspx?id=<%=pArr[i]._field["tar_id"].ToString() %>" ><img width="142" height="74" alt="<%=pArr[i]._field["tar_title"].ToString() %>" src="<%=pArr[i].ImageUrl %>"></a>  </div>
          <div class="rightcommendtext">
            <h1><a target="_blank" href="detail.aspx?id=<%=pArr[i]._field["tar_id"].ToString() %>"><%=pArr[i]._field["tar_title"].ToString().Trim() %></a></h1>
            <p title="<%=pArr[i].ShortMemo.Trim() %>"><%=pArr[i].ShortMemo.Trim() %></p>
            <!--h2><em>3880</em>元起</h2-->
          </div>
        </li>
        <%
          }
          }
               %>
        
       </ul>
    </div>
  </div>
   
   
</div>

<!--div class="rightsortnav">
  <h1>产品快速分类导航</h1>
  <p>点击分类查看下方产品变化</p>
</div-->
<div class="rightsort">
  <ul>
  <%
      for (int i = 0; i < cityArr.Length; i++)
      {
       %>
        <li class="current1">
      <!--<h1><%=i+1 %>F</h1>-->
      <p><a href="#da<%=i %>"><b><%=cityArr[i].Trim()%></b></a> </p>
    </li>
    <%
      }
       %>
   
      </ul>
</div>
<div class="linewrap">

<%
   
    for (int i = 0; i < cityArr.Length; i++ )
    {
     %>
 
    <div id="da<%=i.ToString() %>" class="linelisttitle"> <a name="da<%=i.ToString() %>"></a>
    <h2><%=i+1 %>F</h2>
    <h1 class="nav_main_title" style="color:#4c8910">【<%=cityArr[i].Trim() %>】</h1>
    <p><span></span>    <i class="nav_sec_title">
        </i>
    </p>
  </div>
  <div class="linesortinfo">
    <ul>
      <li class="w1">编号</li>
      <li class="w2">线路</li>
      <li class="w3">天数</li>
      <!--li class="w4">团期</li-->
      <li class="w5">价格</li>
    </ul>
  </div>
  
  
  <div class="linelist">
    <ul>
       
         <%
             Product[] pArrr = Product.GetProductsByCity(cityArr[i]);
             for (int j = 0; j < pArrr.Length; j++)
             {
         %>   
        
      
       <li id="line_<%=j %>">
        <div class="linenumber">
          <p><%= pArrr[j]._field["tar_id"].ToString().PadLeft(5,'0')%></p>
        </div>
        <div class="linename">
          <h1><a target="_blank" href="detail.aspx?id=<%=pArrr[j]._field["tar_id"].ToString() %>" title="<%=pArrr[j]._field["tar_title"].ToString().Trim() %>"><%=((pArrr[j]._field["tar_title"].ToString().Trim().Length > 33) ? (pArrr[j]._field["tar_title"].ToString().Trim().Substring(0, 33) + "……") : pArrr[j]._field["tar_title"].ToString().Trim())%></a> </h1>
          <p><%=(pArrr[j].ShortMemo.Trim().Length <= 40 ? pArrr[j].ShortMemo.Trim() : pArrr[j].ShortMemo.Trim().Substring(0,40)) %></p>
        </div>
        <div class="lineday">
          <p><%= pArrr[j]._field["tar_days"].ToString().Trim()%></p>
        </div>
        <!--div class="linetime">
          <p><span></span><a onclick="gettq('11085')" id="l_11085" href="javascript:void(0)">团期</a></p>
        </div-->
        <div class="lineprice">
            <%
                 if (pArrr[j].RefPrice == 0)
                 {
                     %>
            <p>电话详询</p>
            <%
                 }
                 else
                 {
                 %>
          <p>￥<%=pArrr[j].RefPrice.ToString() %>元<%= (pArrr[j].MultiPrice? "起":"") %></p>
            <%
            } %>
        </div>
        <div id='load<%=pArrr[j]._field["tar_id"].ToString() %>'></div>
      </li>
      <%
             }
             %>

                </ul>
  </div>
  
  
  
  
  
  <%
    }
         %>
   
</div>
<!--
<script>
    function gettq(id) {
        $("#load"+id).spin("small");
        if ($("#tq"+id).html()) {
            $("#load"+id).spin(false);
            $("#tq"+id).remove();
        } else {
            $.get('/ajax/order.php?action=tuanqi&amp;id='+id , function(msg){
                $("#load"+id).spin(false);
                var addHtml = "";
                if (msg.length&gt;0) {				
                    for(var i = 0;i &lt; msg.length;i++){
                        addHtml += "&lt;a href=\"/trips/"+id+"\" target=\"_blank\"&gt;&lt;strong&gt;出团时间：&lt;/strong&gt; " + msg[i].s_time + "&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&lt;strong&gt;价格：&lt;/strong&gt;"+msg[i].sp_adult+" 元 &amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&lt;strong&gt;位置：&lt;/strong&gt; "+msg[i].now_number+" &lt;/a&gt;&lt;br&gt;";
                        &#12288;&#12288;		 }	
                    $("#line_"+id).after('&lt;li id="tq'+id+'" class="tuanqi"&gt;'+addHtml+'&lt;/li&gt;');
                }
            },"json");
        }
    }
</script>
-->
  </div>
</div>
        <uc3:_tail ID="_tail1" runat="server" />
    </div>

    </form>
</body>
</html>
