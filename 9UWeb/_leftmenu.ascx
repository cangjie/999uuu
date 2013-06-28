<%@ Control Language="C#" ClassName="_leftmenu" %>
<%@ Import Namespace="_9UCore" %>
<script runat="server">

</script>
        
        
 
    <div id="leftnav" class="sidenav">
                        <div class="sidenavtop">
                            <h1>热门目的地</h1>
                        </div> 
                        <% 
                            for (int i = 0; i < 5; i++)
                            {
                                string type = "";
                                switch (i)
                                { 
                                    case 0:
                                        type = "国内游";
                                        break;
                                    case 1:
                                        type = "出境游";
                                        break;
                                    case 2:
                                        type = "周边游";
                                        break;
                                    case 3:
                                        type = "自助游";
                                        break;
                                    case 4:
                                        type = "海岛游";
                                        break;
                                    default:
                                        break;
                                    
                                }
                                if (i != 3)
                                {
                                %>
                                
                         <div class="sidenavtitle">
                            <h1><%=type%></h1>
                        </div>
                        <div class="area">
                            <ul>
                            <!--*****************************************添加内容  开始***************************************************************-->
                            
                            
                            <!--*****************************************添加内容  结束***************************************************************-->
                            <%
                            string[] strArrProv = Product.GetProvince(i);
                            foreach (string prov in strArrProv)
                            {
                                 %>
                                <li>
                                    <table style="width:auto;border:hidden;padding:0px" >
                                        <tr>
                                        <td width="60" align="right" valign="top">
                                        <h1><a style="font-size:12px;color:#454545;" href="list_prov.aspx?prov=<%=Server.UrlEncode(prov) %>&type=<%=i%>" target="_blank"><%=prov%></a></h1>
                                        </td>
                                        <td>
<%
                            string[] strArrCity = Product.GetCity(prov, i);
                                     %>
                                        <!--div class="areashortlist"--><%
                            foreach (string sCity in strArrCity)
                            {
                                if (!sCity.Trim().Equals(""))
                                {
                                     %><p style="padding:1px"><a href="list_city.aspx?city=<%=Server.UrlEncode(sCity) %>" target="_blank"><%=sCity%></a>&nbsp;&nbsp;</p><%
                                                                                                                                                    }
                                               
                            }
                                         %><!--/div-->
                                         </td>
                                         </tr>
                                        </table>
                                    </table>
                                </li>
<%
                            }
                               
                                     %>

							  
             <!--li>
                                    <div class="areatitle">
                                        <h1><a target="_blank" href="list_prov.aspx?prov=%e5%8d%b0%e5%ba%a6%e6%b4%8b&amp;type=4">印度洋</a></h1>

                                        <div class="areashortlist">
                                            <p><a target="_blank" href="list_city.aspx?city=%e9%a9%ac%e5%b0%94%e4%bb%a3%e5%a4%ab">马尔代夫</a></p>
                                            <p><a target="_blank" href="list_city.aspx?city=%e6%af%9b%e9%87%8c%e6%b1%82%e6%96%af">毛里求斯</a></p>
                                            <p><a target="_blank" href="list_city.aspx?city=%e9%a9%ac%e5%b0%94%e4%bb%a3%e5%a4%ab">马尔代夫</a></p>
                                            <p><a target="_blank" href="list_city.aspx?city=%e6%af%9b%e9%87%8c%e6%b1%82%e6%96%af">毛里求斯</a></p>
                                        </div>
                                    </div>
                                </li-->

                                           
                         
       
				
                            </ul>
                        </div>
                                
                                <%
                                    }
                            }
                            %>
                      
                        <!--div style="border-top: 1px solid #C9E1F0; height:10px;width:100%">&nbsp;</!--div-->

					</div> 

  
  
  
  