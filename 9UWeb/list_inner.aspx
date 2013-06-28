<%@ Page Language="C#" %>
<%@ Import Namespace="_9UCore" %>
<%@ Register src="_head.ascx" tagname="_head" tagprefix="uc1" %>

<%@ Register src="_tail.ascx" tagname="_tail" tagprefix="uc2" %>

<%@ Register src="_leftmenu.ascx" tagname="_leftmenu" tagprefix="uc3" %>

<!DOCTYPE html>

<script runat="server">

    public Product[] pArr;
    
    protected void Page_Load(object sender, EventArgs e)
    {
        pArr = Product.GetHotProdByType(0);
        
    }
</script>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <link href="jic/css/common.css" type="text/css" rel="stylesheet" />
    <link href="jic/css/topic.css" type="text/css" rel="stylesheet" />
    <link href="images/style.css" type="text/css" rel="stylesheet" />
    <script type="text/javascript" src="jic/jssrc/jquery-1.4.2.min.js"></script>
</head>
<body>
    <form id="form1" runat="server">
        <div class="wrapper"  >
            <uc1:_head ID="_head1" runat="server" />
            <div class="channelnav">
                <p>当前位置：<a href="/">首页</a> &gt; <a href="#">国内游</a></p>
            </div>
            <div class="content">
                <uc3:_leftmenu ID="_leftmenu1" runat="server" />
                <div class="mainright" >
                    <table   border="0" style="width: 100%;" >
                        <tr>
                            <td><img src="images/map.jpg" border="0" /></td>
                        </tr>
                        <tr>
                            <td>




                                <table align="left" bgcolor="#D7D7D7" border="0" cellpadding="1" cellspacing="1" height="237" width="100%">
                                    <tbody>
                                        <tr bgcolor="#ffffff">
                                            <td height="26" valign="top">
                                                <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                                    <tbody>
                                                        <tr>
                                                            <td align="center" background="images/t1.jpg" height="26" width="21%"><span class="bai">国内旅游经典推荐</span></td>
                                                            <td background="images/t2.jpg" width="72%">&nbsp;</td>
                                                            <td align="center" background="images/t2.jpg" width="7%"><a href="gnxla.php">More</a></td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                            </td>
                                        </tr>
                                        <tr bgcolor="#ffffff">
                                            <td valign="top">
                                                <table border="0" cellpadding="2" cellspacing="2" width="100%">
                                                    <tbody>
                                                        <tr>
                                                            <td height="121" valign="top" width="50%">
                                                                <table border="0" cellspacing="0" width="100%">
                                                                    <tbody>
                                                                        <%
                                                                            for (int i = 0 ; i < 2 ; i++)
                                                                            {
                                                                             %>

                                                                        <tr>
                                                                            <td class="company" align="center" height="10">
                                                                                <table align="left" border="0" cellspacing="0" width="100%">
                                                                                    <tbody>
                                                                                        <tr>
                                                                                            <td>
                                                                                                <table border="0" cellpadding="0" cellspacing="0" width="19%">
                                                                                                    <tbody>
                                                                                                        <tr>
                                                                                                            <td align="left"><a href="detail.aspx?id=<%=pArr[i*2]._field["tar_id"].ToString().Trim() %>" class="xbt" title="<%=pArr[i*2]._field["tar_title"].ToString() %>"><img src="http://www.999uuu.cn/<%=pArr[i*2].ImageUrl.Trim() %>" align="absmiddle" border="0" height="65" width="153"></a></td>
                                                                                                        </tr>
                                                                                                        <tr>
                                                                                                            <td align="left" height="28"><a href="detail.aspx?id=<%=pArr[i*2]._field["tar_id"].ToString().Trim() %>" class="xbt" title="<%=pArr[i*2]._field["tar_title"].ToString() %>"><font color="#0000FF"><%=pArr[i*2].GetTitle(12) %></font></a>&nbsp;</td>
                                                                                                        </tr>
                                                                                                        <tr>
                                                                                                            <td align="left"><span class="hong" style="color:#ff0000" >报价：¥ <%=pArr[i*2].RefPrice.ToString()%>元<%=((pArr[i*2].MultiPrice)?"起":"") %></span></td>
                                                                                                        </tr>
                                                                                                    </tbody>
                                                                                                </table>
                                                                                            </td>
                                                                                            <td>
                                                                                                

                                                                                                <table border="0" cellpadding="0" cellspacing="0" width="19%">
                                                                                                    <tbody>
                                                                                                        <tr>
                                                                                                            <td align="left"><a href="detail.aspx?id=<%=pArr[i*2+1]._field["tar_id"].ToString().Trim() %>" class="xbt" title="<%=pArr[i*2+1]._field["tar_title"].ToString() %>"><img src="http://www.999uuu.cn/<%=pArr[i*2+1].ImageUrl.Trim() %>" align="absmiddle" border="0" height="65" width="153"></a></td>
                                                                                                        </tr>
                                                                                                        <tr>
                                                                                                            <td align="left" height="28"><a href="detail.aspx?id=<%=pArr[i*2+1]._field["tar_id"].ToString().Trim() %>" class="xbt" title="<%=pArr[i*2+1]._field["tar_title"].ToString() %>"><font color="#0000FF"><%=pArr[i*2+1].GetTitle(12) %></font></a>&nbsp;</td>
                                                                                                        </tr>
                                                                                                        <tr>
                                                                                                            <td align="left"><span class="hong" style="color:#ff0000" >报价：¥ <%=pArr[i*2+1].RefPrice.ToString()%>元<%=pArr[i*2+1].MultiPrice?"起":"" %></span></td>
                                                                                                        </tr>
                                                                                                    </tbody>
                                                                                                </table>



                                                                                            </td>
                                                                                        </tr>
                                                                                    </tbody>
                                                                                </table>
                                                                            </td>
                                                                        </tr>

                                                                        <%
                                                                        }
                                                                             %>







                                                                    </tbody>
                                                                </table>
                                                            </td>
                                                            <td valign="top">
                                                                <table border="0" cellpadding="2" cellspacing="2" width="100%">
                                                                    <tbody>
                                                                        <tr>
                                                                            <td valign="top" width="74%">
                                                                                <table border="0" cellspacing="0" width="100%">
                                                                                    <tbody>
                                                                                        <%
                                                                                            for (int i = 0 ; i < 8 ; i++)
                                                                                            {
                                                                                             %>
                                                                                        <tr>
                                                                                            <td class="company" align="center" height="10">
                                                                                                <table align="left" border="0" cellspacing="0" width="100%">
                                                                                                    <tbody>
                                                                                                        <tr>
                                                                                                            <td>
                                                                                                                <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                                                                                                    <tbody>
                                                                                                                        <tr>
                                                                                                                            <td align="left" height="21" width="270"><img src="images/icon.gif" align="absmiddle" height="15" width="15">&nbsp;<a href="detail.aspx?id=<%=pArr[i+4]._field["tar_id"].ToString() %>" class="xbt" title="<%=pArr[i+4]._field["tar_title"].ToString().Trim() %>"><font color="#000000"><%=pArr[i+4].GetTitle(20).Trim() %></font></a></td>
                                                                                                                            <td align="right" width="63"><span class="hong" style="color:#ff0000" >¥ <%=pArr[i+4].RefPrice.ToString() %>元<%=pArr[i+4].MultiPrice?"起":"" %></span></td>
                                                                                                                        </tr>
                                                                                                                    </tbody>
                                                                                                                </table>
                                                                                                            </td>
                                                                                                        </tr>
                                                                                                    </tbody>
                                                                                                </table>
                                                                                            </td>
                                                                                        </tr>
                                                                                        <%
                                                                                        }
                                                                                             %>
                                                                                
                                                                                    </tbody>
                                                                                </table>
                                                                            </td>
                                                                        </tr>
                                                                    </tbody>
                                                                </table>
                                                            </td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                            </td>
                                        </tr>
                                        <tr bgcolor="#ffffff">
                                            <td align="left" bgcolor="#EAEAEA" height="14" valign="top">&nbsp;</td>
                                        </tr>
                                    </tbody>
                                </table>
                            
                            
                            
                            
                            </td>
                        </tr>
                        <tr>
                            <td>



                                <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                    <tbody>
                                        <tr>
                                            <td align="center" valign="top">
                                                <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                                    <tbody>
                                                        <tr>
                                                            <td align="left" valign="top">
                                                                <table border="0" cellspacing="0" width="100%">
                                                                    <tbody>
                                                                        <tr>
                                                                            <td class="company" height="5">
                                                                                <table align="left" bgcolor="#D7D7D7" border="0" cellpadding="1" cellspacing="1" height="31" width="100%">
                                                                                    <tbody>
                                                                                        <tr bgcolor="#ffffff">
                                                                                            <td background="images/h2.gif" height="26" valign="top">
                                                                                                <table border="0" cellpadding="0" cellspacing="0" height="27" width="100%">
                                                                                                    <tbody>
                                                                                                        <tr>
                                                                                                            <td align="center" background="images/t1.jpg" height="24" width="21%"><span class="bai">当季经典线路推荐</span></td>
                                                                                                            <td width="67%">&nbsp;</td>
                                                                                                            <td align="right" width="11%">&nbsp;</td>
                                                                                                        </tr>
                                                                                                    </tbody>
                                                                                                </table>
                                                                                            </td>
                                                                                        </tr>
                                                                                    </tbody>
                                                                                </table>
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td class="company" height="5">
                                                                                <table align="left" border="0" cellspacing="0" width="100%">
                                                                                    <tbody>
                                                                                        <tr>
                                                                                            <%
                                                                                                for (int i = 0 ; i < 4 ; i++)
                                                                                                {
                                                                                                 %>
                                                                                            <td align="left" valign="top">
                                                                                                <table border="0" cellpadding="2" cellspacing="2" width="167">
                                                                                                    <tbody>
                                                                                                        <tr>
                                                                                                            <td>
                                                                                                                <table style="" onmouseover="this.style.backgroundColor='#FF6600';" onmouseout="this.style.backgroundColor=''" bgcolor="#F2F2F2" border="0" cellpadding="1" cellspacing="1" height="125" width="100%">
                                                                                                                    <tbody>
                                                                                                                        <tr>
                                                                                                                            <td align="center" bgcolor="#FFFFFF" height="123" valign="top">
                                                                                                                                <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                                                                                                                    <tbody>
                                                                                                                                        <tr>
                                                                                                                                            <td align="left" bgcolor="#E6E6E6" height="30"><strong>&nbsp;&nbsp;特价线路</strong></td>
                                                                                                                                        </tr>
                                                                                                                                        <tr>
                                                                                                                                            <td align="center"><a href="detail.aspx?id=<%=pArr[i+12]._field["tar_id"].ToString().Trim() %>" class="xbt" title="<%=pArr[i+12]._field["tar_title"].ToString() %>"><img src="http://www.999uuu.cn/<%=pArr[i+12].ImageUrl.Trim()%>" align="absmiddle" border="0" height="95" width="155"></a></td>
                                                                                                                                        </tr>
                                                                                                                                        <tr>
                                                                                                                                            <td align="left" height="40">
                                                                                                                                                <table border="0" cellpadding="2" cellspacing="2" width="100%">
                                                                                                                                                    <tbody>
                                                                                                                                                        <tr>
                                                                                                                                                            <td class="STYLE2" height="39" valign="top"><%=pArr[i+12].GetTitle(30) %></td>
                                                                                                                                                        </tr>
                                                                                                                                                    </tbody>
                                                                                                                                                </table>
                                                                                                                                            </td>
                                                                                                                                        </tr>
                                                                                                                                        <tr>
                                                                                                                                            <td align="left" height="16">
                                                                                                                                                <table border="0" cellpadding="2" cellspacing="2" width="100%">
                                                                                                                                                    <tbody>
                                                                                                                                                        <tr>
                                                                                                                                                            <td><strong>发团:天天发团 </strong></td>
                                                                                                                                                        </tr>
                                                                                                                                                    </tbody>
                                                                                                                                                </table>
                                                                                                                                            </td>
                                                                                                                                        </tr>
                                                                                                                                        <tr>
                                                                                                                                            <td align="left" height="32">
                                                                                                                                                <table border="0" cellpadding="2" cellspacing="2" width="100%">
                                                                                                                                                    <tbody>
                                                                                                                                                        <tr>
                                                                                                                                                            <td><strong>行程:<%=pArr[i+12]._field["tar_days"] %>天</strong></td>
                                                                                                                                                        </tr>
                                                                                                                                                    </tbody>
                                                                                                                                                </table>
                                                                                                                                            </td>
                                                                                                                                        </tr>
                                                                                                                                        <tr>
                                                                                                                                            <td align="left" height="16">
                                                                                                                                                <table border="0" cellpadding="2" cellspacing="2" width="100%">
                                                                                                                                                    <tbody>
                                                                                                                                                        <tr>
                                                                                                                                                            <td><strong>出发:<%=pArr[i+12]._field["tar_startcity"] %></strong></td>
                                                                                                                                                        </tr>
                                                                                                                                                    </tbody>
                                                                                                                                                </table>
                                                                                                                                            </td>
                                                                                                                                        </tr>
                                                                                                                                        <tr>
                                                                                                                                            <td align="left" height="16">
                                                                                                                                                <table border="0" cellpadding="2" cellspacing="2" width="100%">
                                                                                                                                                    <tbody>
                                                                                                                                                        <tr>
                                                                                                                                                            <td height="24"><h3><span class="hong" style="color:#ff0000" ><strong>￥<%=pArr[i+12].RefPrice.ToString() %></strong></span>/人<%=pArr[i+12].MultiPrice?"起":"" %></h3></td>
                                                                                                                                                        </tr>
                                                                                                                                                    </tbody>
                                                                                                                                                </table>
                                                                                                                                            </td>
                                                                                                                                        </tr>
                                                                                                                                    </tbody>
                                                                                                                                </table>
                                                                                                                            </td>
                                                                                                                        </tr>
                                                                                                                    </tbody>
                                                                                                                </table>
                                                                                                            </td>
                                                                                                        </tr>
                                                                                                    </tbody>
                                                                                                </table>
                                                                                            </td>
                                                                                            <%
                                                                                            }
                                                                                                 %>

                                                                                        </tr>
                                                                                            </tbody></table></td>
                                                                                          </tr>
                                                                                                                    </tbody></table></td>
                                                                                    </tr>
                                                                                </tbody></table></td>
                                                                                </tr>
                                                                            </tbody></table>



                            </td>
                        </tr>

                     

                        <tr>
                            <td>


                                

                                <table align="left" bgcolor="#D7D7D7" border="0" cellpadding="1" cellspacing="1" height="237" width="100%">
                                    <tbody>
                                        <tr bgcolor="#ffffff">
                                            <td height="26" valign="top">
                                                <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                                    <tbody>
                                                        <tr>
                                                            <td align="center" background="images/t1.jpg" height="26" width="21%"><span class="bai">国内旅游经典推荐</span></td>
                                                            <td background="images/t2.jpg" width="72%">&nbsp;</td>
                                                            <td align="center" background="http://www.vipzzy.com/images/t2.jpg" width="7%"><a href="gnxla.php">More</a></td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                            </td>
                                        </tr>
                                        <tr bgcolor="#ffffff">
                                            <td valign="top">
                                                <table border="0" cellpadding="2" cellspacing="2" width="100%">
                                                    <tbody>
                                                        <tr>
                                                            <td height="121" valign="top" width="50%">
                                                                <table border="0" cellspacing="0" width="100%">
                                                                    <tbody>
                                                                        <%
                                                                            for (int i = 0 ; i < 2 ; i++)
                                                                            {
                                                                             %>

                                                                        <tr>
                                                                            <td class="company" align="center" height="10">
                                                                                <table align="left" border="0" cellspacing="0" width="100%">
                                                                                    <tbody>
                                                                                        <tr>
                                                                                            <td>
                                                                                                <table border="0" cellpadding="0" cellspacing="0" width="19%">
                                                                                                    <tbody>
                                                                                                        <tr>
                                                                                                            <td align="left"><a href="detail.aspx?id=<%=pArr[i*2+16]._field["tar_id"].ToString().Trim() %>" class="xbt" title="<%=pArr[i*2+16]._field["tar_title"].ToString() %>"><img src="http://www.999uuu.cn/<%=pArr[i*2+16].ImageUrl.Trim() %>" align="absmiddle" border="0" height="65" width="153"></a></td>
                                                                                                        </tr>
                                                                                                        <tr>
                                                                                                            <td align="left" height="28"><a href="detail.aspx?id=<%=pArr[i*2+16]._field["tar_id"].ToString().Trim() %>" class="xbt" title="<%=pArr[i*2+16]._field["tar_title"].ToString() %>"><font color="#0000FF"><%=pArr[i*2+16].GetTitle(12) %></font></a>&nbsp;</td>
                                                                                                        </tr>
                                                                                                        <tr>
                                                                                                            <td align="left"><span class="hong">报价：¥ <%=pArr[i*2+16].RefPrice.ToString()%>元<%=((pArr[i*2+16].MultiPrice)?"起":"") %></span></td>
                                                                                                        </tr>
                                                                                                    </tbody>
                                                                                                </table>
                                                                                            </td>
                                                                                            <td>
                                                                                                

                                                                                                <table border="0" cellpadding="0" cellspacing="0" width="19%">
                                                                                                    <tbody>
                                                                                                        <tr>
                                                                                                            <td align="left"><a href="detail.aspx?id=<%=pArr[i*2+1+16]._field["tar_id"].ToString().Trim() %>" class="xbt" title="<%=pArr[i*2+1+16]._field["tar_title"].ToString() %>"><img src="http://www.999uuu.cn/<%=pArr[i*2+1+16].ImageUrl.Trim() %>" align="absmiddle" border="0" height="65" width="153"></a></td>
                                                                                                        </tr>
                                                                                                        <tr>
                                                                                                            <td align="left" height="28"><a href="detail.aspx?id=<%=pArr[i*2+1+16]._field["tar_id"].ToString().Trim() %>" class="xbt" title="<%=pArr[i*2+1+16]._field["tar_title"].ToString() %>"><font color="#0000FF"><%=pArr[i*2+1+16].GetTitle(12) %></font></a>&nbsp;</td>
                                                                                                        </tr>
                                                                                                        <tr>
                                                                                                            <td align="left"><span class="hong" style="color:#FF0000">报价：¥ <%=pArr[i*2+1+16].RefPrice.ToString()%>元<%=pArr[i*2+1+16].MultiPrice?"起":"" %></span></td>
                                                                                                        </tr>
                                                                                                    </tbody>
                                                                                                </table>



                                                                                            </td>
                                                                                        </tr>
                                                                                    </tbody>
                                                                                </table>
                                                                            </td>
                                                                        </tr>

                                                                        <%
                                                                        }
                                                                             %>







                                                                    </tbody>
                                                                </table>
                                                            </td>
                                                            <td valign="top">
                                                                <table border="0" cellpadding="2" cellspacing="2" width="100%">
                                                                    <tbody>
                                                                        <tr>
                                                                            <td valign="top" width="74%">
                                                                                <table border="0" cellspacing="0" width="100%">
                                                                                    <tbody>
                                                                                        <%
                                                                                            for (int i = 0 ; i < 8 ; i++)
                                                                                            {
                                                                                             %>
                                                                                        <tr>
                                                                                            <td class="company" align="center" height="10">
                                                                                                <table align="left" border="0" cellspacing="0" width="100%">
                                                                                                    <tbody>
                                                                                                        <tr>
                                                                                                            <td>
                                                                                                                <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                                                                                                    <tbody>
                                                                                                                        <tr>
                                                                                                                            <td align="left" height="21" width="270"><img src="images/icon.gif" align="absmiddle" height="15" width="15">&nbsp;<a href="detail.aspx?id=<%=pArr[i+4+16]._field["tar_id"].ToString() %>" class="xbt" title="<%=pArr[i+4+16]._field["tar_title"].ToString().Trim() %>"><font color="#000000"><%=pArr[i+4+16].GetTitle(20).Trim() %></font></a></td>
                                                                                                                            <td align="right" width="63"><span class="hong" style="color:#ff0000">¥ <%=pArr[i+4+16].RefPrice.ToString() %>元<%=pArr[i+4+16].MultiPrice?"起":"" %></span></td>
                                                                                                                        </tr>
                                                                                                                    </tbody>
                                                                                                                </table>
                                                                                                            </td>
                                                                                                        </tr>
                                                                                                    </tbody>
                                                                                                </table>
                                                                                            </td>
                                                                                        </tr>
                                                                                        <%
                                                                                        }
                                                                                             %>
                                                                                
                                                                                    </tbody>
                                                                                </table>
                                                                            </td>
                                                                        </tr>
                                                                    </tbody>
                                                                </table>
                                                            </td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                            </td>
                                        </tr>
                                        <tr bgcolor="#ffffff">
                                            <td align="left" bgcolor="#EAEAEA" height="14" valign="top">&nbsp;</td>
                                        </tr>
                                    </tbody>
                                </table>
                            
                            



                            </td>
                        </tr>



                            
                    </table>


                </div>
            </div>
            <uc2:_tail ID="_tail1" runat="server" />
        </div>
    </form>
</body>
</html>
