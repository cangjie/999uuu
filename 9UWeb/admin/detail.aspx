<%@ Page Language="C#"  validateRequest="false" %>
<%@ Import Namespace="_9UCore" %>
<%@ Import Namespace="System.Data" %>
<%@ Register assembly="FreeTextBox" namespace="FreeTextBoxControls" tagprefix="FTB" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<script runat="server">

    public int ID = 0;
    public bool SUC = false;
    
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["adminid"] == null || Session["adminid"].ToString().Trim().Equals(""))
        {
            Response.Redirect("login.aspx", true);
        }
        if (!IsPostBack)
        {

            treeview.Nodes.Clear();
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
                TreeNode tnType = new TreeNode(type, i.ToString());

                string[] strArrProv = Product.GetProvince(i);
                foreach (string sProv in strArrProv)
                {
                    TreeNode tnProv = new TreeNode(sProv, sProv);

                    string[] strArrCity = Product.GetCity(sProv, i);
                    foreach (string sCity in strArrCity)
                    {
                        TreeNode tnCity = new TreeNode(sCity, i.ToString() + sCity);
                        tnProv.ChildNodes.Add(tnCity);
                    }



                    tnType.ChildNodes.Add(tnProv);
                }
                treeview.Nodes.Add(tnType);
            }
            treeview.CollapseAll();

            int id = 0;
            if (Request["id"] != null)
            {
                try
                {
                    id = int.Parse(Request["id"].Trim());
                }
                catch
                {

                }
            }
            if (id > 0)
            {
                Button1.Text = "修  改";
            }
            else
            {
                Button1.Text = "添  加";
            }

            if (id > 0)
            {
                Product prod = new Product(id);
                int type = int.Parse(prod._field["tar_abroad"].ToString().Trim());
                //treeview.Nodes[type]
                treeview.Nodes[type].ExpandAll();
                foreach (TreeNode tn in treeview.Nodes[type].ChildNodes)
                {
                    if (tn.Value.Trim().Equals((prod._field["tar_prov"].ToString().Trim())))
                    {
                        foreach (TreeNode subTn in tn.ChildNodes)
                        {
                            if (subTn.Text.Trim().Equals(prod._field["tar_city"].ToString().Trim()))
                            {
                                subTn.Select();
                                break;
                            }
                            
                        }
                        break;
                    }
                }

                if (int.Parse(prod._field["tar_abroad2"].ToString()) == -1)
                {
                    DrpAbroad2.SelectedValue = prod._field["tar_abroad"].ToString();
                }
                else
                {
                    DrpAbroad2.SelectedValue = prod._field["tar_abroad2"].ToString();
                }
                

                FillProv(int.Parse(DrpAbroad2.SelectedValue.Trim()), DrpProv2);
                if (prod._field["tar_prov2"].ToString().Trim().Equals(""))
                {
                    DrpProv2.SelectedValue = prod._field["tar_prov"].ToString().Trim();
                    DrpProv2_SelectedIndexChanged(sender, e);
                    DrpCity2.SelectedValue = prod._field["tar_city"].ToString().Trim();
                }
                else
                {
                    DrpProv2.SelectedValue = prod._field["tar_prov2"].ToString().Trim();
                    DrpProv2_SelectedIndexChanged(sender, e);
                    DrpCity2.SelectedValue = prod._field["tar_city2"].ToString().Trim();
                }
                if (int.Parse(prod._field["tar_abroad3"].ToString()) == -1)
                {
                    DrpAbroad3.SelectedValue = prod._field["tar_abroad"].ToString();
                }
                else
                {
                    DrpAbroad3.SelectedValue = prod._field["tar_abroad3"].ToString();
                }
                FillProv(int.Parse(DrpAbroad3.SelectedValue.Trim()), DrpProv3);
                if (prod._field["tar_prov3"].ToString().Trim().Equals(""))
                {
                    DrpProv3.SelectedValue = prod._field["tar_prov"].ToString().Trim();
                    DrpProv3_SelectedIndexChanged(sender, e);
                    DrpCity3.SelectedValue = prod._field["tar_city"].ToString().Trim();
                }
                else
                {
                    DrpProv3.SelectedValue = prod._field["tar_prov3"].ToString().Trim();
                    DrpProv3_SelectedIndexChanged(sender, e);
                    DrpCity3.SelectedValue = prod._field["tar_city3"].ToString().Trim();
                }
                
                TxtTitle.Text = prod._field["tar_title"].ToString().Trim();
                TxtPrice.Text = prod._field["tar_price"].ToString().Trim();
                TxtPrice2.Text = prod._field["tar_price2"].ToString().Trim();
                TxtPrice3.Text = prod._field["tar_price3"].ToString().Trim();
                TxtPrice4.Text = prod._field["tar_price4"].ToString().Trim();
                TxtStartCity.Text = prod._field["tar_startcity"].ToString().Trim();
                DrpDays.SelectedValue = prod._field["tar_days"].ToString().Trim().Replace("天", "");
                TxtAir.Text = prod._field["tar_airline"].ToString().Trim();
                TxtSight.Text = prod._field["tar_sights"].ToString().Trim();
                ftbIntro.Text = prod._field["tar_intro"].ToString().Trim();
                ftpTripList.Text = prod._field["tar_triplist"].ToString().Trim();
                ftpService.Text = prod._field["tar_level"].ToString().Trim();
                ftpShopping.Text = prod._field["tar_shopping"].ToString().Trim();
                ftbFee.Text = prod._field["tar_fee"].ToString().Trim();
                ftbMemo.Text = prod._field["tar_memo"].ToString().Trim();
                Image1.ImageUrl =  (prod.ImageUrl.StartsWith("http://")  ? prod.ImageUrl :    "../" + prod.ImageUrl.Trim());
                DataTable dt = prod.DateList;
                dg.DataSource = dt;
                dg.DataBind();
                ViewState["dt"] = dt;
            }
            else
            {
                DataTable dt = new DataTable();
                dt.Columns.Add("id");
                dt.Columns.Add("日期");
                dt.Columns.Add("价格");
                dg.DataSource = dt;
                dg.DataBind();
                ViewState["dt"] = dt;
            }
            
        }
    }

    protected void treeview_SelectedNodeChanged(object sender, EventArgs e)
    {
        treeview.SelectedNode.ExpandAll();
        if (treeview.SelectedNode.ChildNodes.Count > 0)
        {
            if (treeview.SelectedNode.ChildNodes[0].ChildNodes.Count > 0)
            {
                treeview.SelectedNode.ChildNodes[0].ChildNodes[0].Select();
            }
            else
            {
                treeview.SelectedNode.ChildNodes[0].Select();
            }
        }
        
        
        string curLoc = treeview.SelectedValue.Trim();
        int type = int.Parse(curLoc.Substring(0, 1));
        string abd = "";
        switch (type)
        {
            case 0:
                abd = "国内游";
                break;
            case 1:
                abd = "出境游";
                break;
            case 2:
                abd = "周边游";
                break;
            case 3:
                abd = "自助游";
                break;
            case 4:
                abd = "海岛游";
                break;
            default:
                break;
        }
   
        LblCurLoc.Text = abd + ">>" + treeview.SelectedNode.Parent.Value.Trim() + ">>" + curLoc.Remove(0, 1);
        DrpAbroad2.SelectedValue = type.ToString();
        FillProv(type, DrpProv2);
        DrpProv2.SelectedValue = treeview.SelectedNode.Parent.Value.Trim();
        DrpProv2_SelectedIndexChanged(sender, e);
        DrpCity2.SelectedValue = curLoc.Remove(0, 1);
        DrpAbroad3.SelectedValue = type.ToString();
        FillProv(type, DrpProv3);
        DrpProv3.SelectedValue = treeview.SelectedNode.Parent.Value.Trim();
        DrpProv3_SelectedIndexChanged(sender, e);
        DrpCity3.SelectedValue = curLoc.Remove(0, 1);
    }

    protected void FillProv(int type,DropDownList drp)
    {
        drp.Items.Clear();
        string[] strArr = Product.GetProvince(type);
        foreach (string s in strArr)
        {
            drp.Items.Add(s);
        }
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        if (Request["id"] == null)
        {
            insert();
        }
        else
        {
            update();
        }
    }
    
    protected void  dg_CancelCommand(object source, DataGridCommandEventArgs e)
    {
        DataTable dt = (DataTable)ViewState["dt"];
        dg.DataSource = dt;
        dg.EditItemIndex = -1;
        dg.DataBind();
    }

    protected void dg_UpdateCommand(object sender, EventArgs e)
    {
        int id = 0;
        if (Request["id"] != null)
        {
            try
            {
                id = int.Parse(Request["id"].Trim());
            }
            catch
            {
            
            }
        }
        DataTable dt = (DataTable)ViewState["dt"];
        dt.Rows[dg.EditItemIndex]["日期"] = DateTime.Parse(((TextBox)dg.Items[dg.EditItemIndex].Cells[2].Controls[0]).Text.Trim()).ToShortDateString();
        dt.Rows[dg.EditItemIndex]["价格"] = double.Parse(((TextBox)dg.Items[dg.EditItemIndex].Cells[3].Controls[0]).Text.Trim()).ToString();
        if (id>0)
        {
            Product p = new Product(id);
            p.DateList = dt;
        }
        dg.DataSource = dt;
        dg.EditItemIndex = -1;
        dg.DataBind();
        ViewState["dt"] = dt;
    }
    
    protected void Button4_Click(object sender, EventArgs e)
    {
        int id = 0;
        if (Request["id"] != null)
        {
            try
            {
                id = int.Parse(Request["id"].Trim());
            }
            catch
            {
            
            }
        }
        if (id == 0)
        {
            DataTable dt = (DataTable)ViewState["dt"];
            DataRow dr = dt.NewRow();
            dt.Rows.Add(dr);
            dg.DataSource = dt;
            dg.EditItemIndex = dt.Rows.Count - 1;
            dg.DataBind();
            

        }
        else
        {
            Product p = new Product(id);
            DataTable dt = p.DateList;
            DataRow dr = dt.NewRow();
            dt.Rows.Add(dr);
            dg.DataSource = dt;
            dg.EditItemIndex = dt.Rows.Count - 1;
            dg.DataBind();
            ViewState["dt"] = dt;
        }
    }
    
    protected void  dg_DeleteCommand(object source, DataGridCommandEventArgs e)
    {
        DataTable dt = (DataTable)ViewState["dt"];
        dt.Rows.RemoveAt(e.Item.ItemIndex);
        ViewState["dt"] = dt;
        int id = 0;
        if (Request["id"] != null)
        {
            try
            {
                id = int.Parse(Request["id"].Trim());
            }
            catch
            {
            
            }
        }
        if (id > 0)
        {
            Product p = new Product(id);
            p.DateList = dt;
        }
        dg.DataSource = dt;
        dg.DataBind();
    }

    public void insert()
    {
        string strVali = vali();
        if (strVali.Trim().Equals(""))
        {
            string fileName = DateTime.Now.Year.ToString() + DateTime.Now.Month.ToString().PadLeft(2, '0')
                + DateTime.Now.Day.ToString().PadLeft(2, '0') + DateTime.Now.Hour.ToString().PadLeft(2, '0')
                + DateTime.Now.Minute.ToString().PadLeft(2, '0') + DateTime.Now.Second.ToString().PadLeft(2, '0')
                + DateTime.Now.Millisecond.ToString().PadLeft(3, '0') + "." 
                + FileUpload1.FileName.Split('.')[FileUpload1.FileName.Split('.').Length - 1].Trim();
            FileUpload1.SaveAs(Server.MapPath("../images/upload/" + fileName));

            int type = int.Parse(treeview.SelectedNode.Value.Substring(0, 1));
            string prov = treeview.SelectedNode.Parent.Value.Trim();
            string city = treeview.SelectedNode.Value.Remove(0, 1);
            int i = Product.AddNew(double.Parse(TxtPrice.Text.Trim()),double.Parse(TxtPrice2.Text.Trim()),double.Parse(TxtPrice3.Text.Trim()),double.Parse(TxtPrice4.Text.Trim()),type, prov, city, TxtTitle.Text.Trim(), TxtStartCity.Text.Trim(), DrpDays.SelectedValue.Trim() + "天", TxtAir.Text.Trim(),
                TxtSight.Text.Trim(), ftbIntro.Text.Trim(), ftpTripList.Text.Trim(), ftpService.Text.Trim(), ftpShopping.Text.Trim(), ftbFee.Text.Trim(),
                ftbMemo.Text.Trim(), "<img src=\"images/upload/" + fileName.Trim() + "\"  >");
            if (i > 0)
            {
                Product p = new Product(i);
                p.DateList = (DataTable)ViewState["dt"];
                p._field["tar_abroad2"] = DrpAbroad2.SelectedValue.Trim();
                p._field["tar_prov2"] = DrpProv2.SelectedValue.Trim();
                p._field["tar_city2"] = DrpCity2.SelectedValue.Trim();
                p._field["tar_abroad3"] = DrpAbroad3.SelectedValue.Trim();
                p._field["tar_prov3"] = DrpProv3.SelectedValue.Trim();
                p._field["tar_city3"] = DrpCity3.SelectedValue.Trim();
                p.Update();
                ID = i;
                SUC = true;
            }
                
        }
        else
        {
            LblCurLoc.Text = LblCurLoc.Text + "&nbsp;&nbsp;<font color=red >" + strVali + "</font>";
        }
    }

    public string vali()
    {
        string msg = "";
        if (treeview.SelectedNode == null || treeview.SelectedNode.ChildNodes.Count > 0)
        {
            msg = "请正确选择目的地";
            
        }
        if (TxtTitle.Text.Trim().Equals(""))
        {
            msg = "请填写标题";
            
        }
        if (TxtStartCity.Text.Trim().Equals(""))
        {
            msg = "请填写出发地";
            
        }

        try
        {
            double.Parse(TxtPrice.Text.Trim());
        }
        catch
        {
            msg = "请填写正确的价格";
        }
        
        try
        {
            double.Parse(TxtPrice2.Text.Trim());
        }
        catch
        {
            msg = "请填写正确的价格";
        }
        
        try
        {
            double.Parse(TxtPrice3.Text.Trim());
        }
        catch
        {
            msg = "请填写正确的价格";
        }
        
        try
        {
            double.Parse(TxtPrice4.Text.Trim());
        }
        catch
        {
            msg = "请填写正确的价格";
        }
        
        if (DrpDays.SelectedValue.Trim().Equals("0"))
        {
            msg = "请选择天数";
            
        }
        if (TxtAir.Text.Trim().Equals(""))
        {
            msg = "请填写航班";
            
        }
        if (TxtSight.Text.Trim().Equals(""))
        {
            msg = "请填写景点";
            
        }
        if (!FileUpload1.FileName.ToLower().EndsWith(".jpg") && !FileUpload1.FileName.ToLower().EndsWith(".gif") && !FileUpload1.FileName.ToLower().EndsWith(".bmp") && !FileUpload1.FileName.ToLower().EndsWith(".png"))
        {
            msg = "请上传正确的图片";
            
        }
        return msg;
    }

    public void update()
    {
        int id = 0;
        if (Request["id"] != null)
        {
            try
            {
                id = int.Parse(Request["id"].Trim());
            }
            catch
            {

            }
        }
        Product prod = new Product(id);
        int type = int.Parse(treeview.SelectedNode.Value.Substring(0, 1));
        string prov = treeview.SelectedNode.Parent.Value.Trim();
        string city = treeview.SelectedNode.Value.Remove(0, 1);
        prod._field["tar_abroad"] = type.ToString();
        prod._field["tar_prov"] = prov.Trim();
        prod._field["tar_city"] = city.Trim();
        prod._field["tar_title"] = TxtTitle.Text.Trim();
        prod._field["tar_startcity"] = TxtStartCity.Text.Trim();
        prod._field["tar_days"] = DrpDays.SelectedValue.Trim()+"天";
        prod._field["tar_airline"] = TxtAir.Text.Trim();
        prod._field["tar_sights"] = TxtSight.Text.Trim();
        prod._field["tar_intro"] = ftbIntro.Text.Trim();
        prod._field["tar_triplist"] = ftpTripList.Text.Trim();
        prod._field["tar_level"] = ftpService.Text.Trim();
        prod._field["tar_shopping"] = ftpShopping.Text.Trim();
        prod._field["tar_fee"] = ftbFee.Text.Trim();
        prod._field["tar_memo"] = ftbMemo.Text.Trim();
        prod._field["tar_price"] = TxtPrice.Text.Trim();
        prod._field["tar_price2"] = TxtPrice2.Text.Trim();
        prod._field["tar_price3"] = TxtPrice3.Text.Trim();
        prod._field["tar_price4"] = TxtPrice4.Text.Trim();
        prod._field["tar_abroad2"] = DrpAbroad2.SelectedValue.Trim();
        prod._field["tar_prov2"] = DrpProv2.SelectedValue.Trim();
        prod._field["tar_city2"] = DrpCity2.SelectedValue.Trim();
        prod._field["tar_abroad3"] = DrpAbroad3.SelectedValue.Trim();
        prod._field["tar_prov3"] = DrpProv3.SelectedValue.Trim();
        prod._field["tar_city3"] = DrpCity3.SelectedValue.Trim();
        //prod._field["tar_startcity"] = TxtStartCity.Text.Trim();
        if (FileUpload1.FileBytes.Length != 0)
        {
            string fileName = DateTime.Now.Year.ToString() + DateTime.Now.Month.ToString().PadLeft(2, '0')
                + DateTime.Now.Day.ToString().PadLeft(2, '0') + DateTime.Now.Hour.ToString().PadLeft(2, '0')
                + DateTime.Now.Minute.ToString().PadLeft(2, '0') + DateTime.Now.Second.ToString().PadLeft(2, '0')
                + DateTime.Now.Millisecond.ToString().PadLeft(3, '0') + "."
                + FileUpload1.FileName.Split('.')[FileUpload1.FileName.Split('.').Length - 1].Trim();
            FileUpload1.SaveAs(Server.MapPath("../images/upload/" + fileName));
            prod._field["tar_img"] = "<img src=\"images/upload/" + fileName.Trim() + "\"  >";
            Image1.ImageUrl = (prod.ImageUrl.StartsWith("http://") ? prod.ImageUrl : "../" + prod.ImageUrl.Trim());
        }
        prod.Update();
        LblCurLoc.Text = LblCurLoc.Text + " <font color=red >更新成功！</font>";
    }
    
    protected void  Button3_Click(object sender, EventArgs e)
    {
        Response.Redirect("main.aspx?city=" + Server.UrlEncode(treeview.SelectedNode.Value.Trim()), true);
    }

    protected void dg_EditCommand(object source, DataGridCommandEventArgs e)
    {

        DataTable dt = (DataTable)ViewState["dt"];
        dg.DataSource = dt;
        dg.EditItemIndex = e.Item.ItemIndex;
        dg.DataBind();
    }

    protected void DrpProv2_SelectedIndexChanged(object sender, EventArgs e)
    {
        DrpCity2.Items.Clear();
        string[] cityArr = Product.GetCity(DrpProv2.SelectedValue.Trim(),int.Parse(treeview.SelectedNode.Value.Trim().Substring(0,1)));
        foreach (string s in cityArr)
        {
            DrpCity2.Items.Add(s);
        }
    }

    protected void DrpProv3_SelectedIndexChanged(object sender, EventArgs e)
    {
        DrpCity3.Items.Clear();
        string[] cityArr = Product.GetCity(DrpProv3.SelectedValue.Trim(), int.Parse(treeview.SelectedNode.Value.Trim().Substring(0, 1)));
        foreach (string s in cityArr)
        {
            DrpCity3.Items.Add(s);
        }
    }

    protected void DrpAbroad2_SelectedIndexChanged(object sender, EventArgs e)
    {
        FillProv(int.Parse(DrpAbroad2.SelectedValue.Trim()), DrpProv2);
    }

    protected void DrpAbroad3_SelectedIndexChanged(object sender, EventArgs e)
    {
        FillProv(int.Parse(DrpAbroad3.SelectedValue.Trim()), DrpProv3);
    }
</script>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Untitled Page</title>
    <style type="text/css">
        .style1
        {
            font-size: small;
        }
    </style>
    <%
    if (SUC)
    {
         %>
    <script language="javascript" >
    
        alert("添加成功!");
        window.location.href = "?id=<%=ID %>";
    </script>
    <%
    }
         %>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <table width="100%" border="1" >
            <tr>
                <td width="100" align="left" valign="top"  >
                    <asp:TreeView ID="treeview" runat="server" 
                        ImageSet="Arrows" onselectednodechanged="treeview_SelectedNodeChanged" >
                        <ParentNodeStyle Font-Bold="False" />
                        <HoverNodeStyle Font-Underline="True" ForeColor="#5555DD" />
                        <SelectedNodeStyle Font-Underline="True" ForeColor="#5555DD" 
                            HorizontalPadding="0px" VerticalPadding="0px" />
                        <NodeStyle Font-Names="Tahoma" Font-Size="10pt" ForeColor="Black" 
                            HorizontalPadding="5px" NodeSpacing="0px" VerticalPadding="0px" />
                    </asp:TreeView>
                </td>
                <td align="left" valign="top"  >
                    <table width="100%" border="1" >
                        <tr>
                            <td colspan="2" >
                                <asp:Label ID="LblCurLoc" runat="server" Font-Bold="True"></asp:Label>
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <asp:Button ID="Button3" runat="server" onclick="Button3_Click" Text="返  回" />
                            </td>
                        </tr>
                        <tr>
                            <td width="100" align="right" valign="top" class="style1" >标题：</td>
                            <td align="left" valign="top" >
                                <asp:TextBox ID="TxtTitle" runat="server" Width="830px"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td width="100" align="right" valign="top" class="style1" >第二分类：</td>
                            <td align="left" valign="top" >
                                &nbsp;<asp:DropDownList ID="DrpAbroad2" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DrpAbroad2_SelectedIndexChanged">
                                    <asp:ListItem Value="0">国内游</asp:ListItem>
                                    <asp:ListItem Value="1">出境游</asp:ListItem>
                                    <asp:ListItem Value="2">周边游</asp:ListItem>
                                    <asp:ListItem Value="4">海岛游</asp:ListItem>
                                </asp:DropDownList>
&nbsp; <asp:DropDownList ID="DrpProv2" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DrpProv2_SelectedIndexChanged">
                                </asp:DropDownList>
&nbsp;
                                <asp:DropDownList ID="DrpCity2" runat="server">
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td width="100" align="right" valign="top" class="style1" >第三分类：</td>
                            <td align="left" valign="top" >
                                &nbsp;<asp:DropDownList ID="DrpAbroad3" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DrpAbroad3_SelectedIndexChanged">
                                    <asp:ListItem Value="0">国内游</asp:ListItem>
                                    <asp:ListItem Value="1">出境游</asp:ListItem>
                                    <asp:ListItem Value="2">周边游</asp:ListItem>
                                    <asp:ListItem Value="4">海岛游</asp:ListItem>
                                </asp:DropDownList>
&nbsp; <asp:DropDownList ID="DrpProv3" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DrpProv3_SelectedIndexChanged">
                                </asp:DropDownList>
&nbsp;
                                <asp:DropDownList ID="DrpCity3" runat="server">
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td width="100" align="right" valign="top" class="style1" >出发地：</td>
                            <td align="left" valign="top" >
                                <asp:TextBox ID="TxtStartCity" runat="server"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td width="100" align="right" valign="top" class="style1" >天数：</td>
                            <td align="left" valign="top" >
                                <asp:DropDownList ID="DrpDays" runat="server">
                                    <asp:ListItem>0</asp:ListItem>
                                    <asp:ListItem>1</asp:ListItem>
                                    <asp:ListItem>2</asp:ListItem>
                                    <asp:ListItem>3</asp:ListItem>
                                    <asp:ListItem>4</asp:ListItem>
                                    <asp:ListItem>5</asp:ListItem>
                                    <asp:ListItem>6</asp:ListItem>
                                    <asp:ListItem>7</asp:ListItem>
                                    <asp:ListItem>8</asp:ListItem>
                                    <asp:ListItem>9</asp:ListItem>
                                    <asp:ListItem>10</asp:ListItem>
                                    <asp:ListItem>11</asp:ListItem>
                                    <asp:ListItem>12</asp:ListItem>
                                    <asp:ListItem>13</asp:ListItem>
                                    <asp:ListItem>14</asp:ListItem>
                                    <asp:ListItem>15</asp:ListItem>
                                    <asp:ListItem>16</asp:ListItem>
                                    <asp:ListItem>17</asp:ListItem>
                                    <asp:ListItem>18</asp:ListItem>
                                    <asp:ListItem>19</asp:ListItem>
                                    <asp:ListItem>20</asp:ListItem>
                                    <asp:ListItem>21</asp:ListItem>
                                    <asp:ListItem>22</asp:ListItem>
                                    <asp:ListItem>23</asp:ListItem>
                                    <asp:ListItem>24</asp:ListItem>
                                    <asp:ListItem>25</asp:ListItem>
                                    <asp:ListItem>26</asp:ListItem>
                                    <asp:ListItem>27</asp:ListItem>
                                    <asp:ListItem>28</asp:ListItem>
                                    <asp:ListItem>29</asp:ListItem>
                                    <asp:ListItem>30</asp:ListItem>
                                    <asp:ListItem>31</asp:ListItem>
                                    <asp:ListItem>32</asp:ListItem>
                                    <asp:ListItem>33</asp:ListItem>
                                    <asp:ListItem>34</asp:ListItem>
                                    <asp:ListItem>35</asp:ListItem>
                                    <asp:ListItem>36</asp:ListItem>
                                    <asp:ListItem>37</asp:ListItem>
                                    <asp:ListItem>38</asp:ListItem>
                                    <asp:ListItem>39</asp:ListItem>
                                    <asp:ListItem>40</asp:ListItem>
                                </asp:DropDownList>
                                <span class="style1">天</span></td>
                        </tr>
                        <tr>
                            <td width="100" align="right" valign="top" class="style1" >航班：</td>
                            <td align="left" valign="top" >
                                <asp:TextBox ID="TxtAir" runat="server"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td width="100" align="right" valign="top" class="style1" >景点：</td>
                            <td align="left" valign="top" >
                                <asp:TextBox ID="TxtSight" runat="server" Width="830px"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td width="100" align="right" valign="top" class="style1" >价格：</td>
                            <td align="left" valign="top" >
                                双飞：<asp:TextBox ID="TxtPrice" Text="0" runat="server" Width="50px"></asp:TextBox>&nbsp;
                                飞卧：<asp:TextBox ID="TxtPrice2" Text="0" runat="server" Width="50px"></asp:TextBox>&nbsp;
                                卧飞：<asp:TextBox ID="TxtPrice3" Text="0" runat="server" Width="50px"></asp:TextBox>&nbsp;
                                双卧：<asp:TextBox ID="TxtPrice4" Text="0" runat="server" Width="50px"></asp:TextBox>&nbsp;
                            </td>
                        </tr>
                        <tr>
                            <td   width="100" align="right" valign="top" class="style1" >团期：</td>
                            <td>
                                <asp:Button ID="Button4" runat="server" Text="添  加" onclick="Button4_Click" /><br />
                                <asp:DataGrid ID="dg" runat="server" AutoGenerateColumns="False" 
                                    BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" 
                                    CellPadding="3" Font-Size="Small" GridLines="Vertical" 
                                    oncancelcommand="dg_CancelCommand" ondeletecommand="dg_DeleteCommand" 
                                    onupdatecommand="dg_UpdateCommand" oneditcommand="dg_EditCommand" >
                                    <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
                                    <SelectedItemStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
                                    <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" 
                                        Mode="NumericPages" />
                                    <AlternatingItemStyle BackColor="#DCDCDC" />
                                    <ItemStyle BackColor="#EEEEEE" ForeColor="Black" />
                                    <Columns>
                                        <asp:ButtonColumn CommandName="Delete" Text="Delete"></asp:ButtonColumn>
                                        <asp:EditCommandColumn CancelText="Cancel" EditText="Edit" UpdateText="Update">
                                        </asp:EditCommandColumn>
                                        <asp:BoundColumn DataField="日期" HeaderText="日期"></asp:BoundColumn>
                                        <asp:BoundColumn DataField="价格" HeaderText="价格"></asp:BoundColumn>
                                        <asp:BoundColumn DataField="id" HeaderText="id" Visible="False">
                                        </asp:BoundColumn>
                                    </Columns>
                                    <HeaderStyle BackColor="#000084" Font-Bold="True" ForeColor="White" />
                                </asp:DataGrid>
                            </td>
                        </tr>
                        <tr>
                            <td width="100" align="right" valign="top" class="style1" >简介：</td>
                            <td align="left" valign="top" >
                                <FTB:FreeTextBox ID="ftbIntro" runat="server" ButtonSet="NotSet" 
                                    ImageGalleryPath="" ShowTagPath="False" ButtonPath="../images/upload" 
                                    Width="100%">
                                </FTB:FreeTextBox>
                            </td>
                        </tr>
                        <tr>
                            <td width="100" align="right" valign="top" class="style1" >行程列表：</td>
                            <td align="left" valign="top" >
                                <FTB:FreeTextBox ID="ftpTripList" runat="server" ButtonSet="NotSet" 
                                    ImageGalleryPath="" ShowTagPath="False" ButtonPath="../images/upload" 
                                    Width="100%">
                                </FTB:FreeTextBox>
                            </td>
                        </tr>
                        <tr>
                            <td width="100" align="right" valign="top" class="style1" >服务级别：</td>
                            <td align="left" valign="top" >
                                <FTB:FreeTextBox ID="ftpService" runat="server" ButtonSet="NotSet" 
                                    ImageGalleryPath="" ShowTagPath="False" ButtonPath="../images/upload" 
                                    Width="100%">
                                </FTB:FreeTextBox>
                            </td>
                        </tr>
                        <tr>
                            <td width="100" align="right" valign="top" class="style1" >购物说明：</td>
                            <td align="left" valign="top" >
                                <FTB:FreeTextBox ID="ftpShopping" runat="server" ButtonSet="NotSet" 
                                    ImageGalleryPath="" ShowTagPath="False" ButtonPath="../images/upload" 
                                    Width="100%">
                                </FTB:FreeTextBox>
                            </td>
                        </tr>
                        <tr>
                            <td width="100" align="right" valign="top" class="style1" >自费项目：</td>
                            <td align="left" valign="top" >
                                <FTB:FreeTextBox ID="ftbFee" runat="server" ButtonSet="NotSet" 
                                    ImageGalleryPath="" ShowTagPath="False" ButtonPath="../images/upload" 
                                    Width="100%">
                                </FTB:FreeTextBox>
                            </td>
                        </tr>
                        <tr>
                            <td width="100" align="right" valign="top" class="style1" >其他说明：</td>
                            <td align="left" valign="top" >
                                <FTB:FreeTextBox ID="ftbMemo" runat="server" ButtonSet="NotSet" 
                                    ImageGalleryPath="" ShowTagPath="False" ButtonPath="../images/upload" 
                                    Width="100%">
                                </FTB:FreeTextBox>
                            </td>
                        </tr>
                        <tr>
                            <td width="100" align="right" valign="top" class="style1" >图片：</td>
                            <td align="left" valign="top" >
                                <asp:Image ID="Image1" runat="server" />
                                <br />
                                <asp:FileUpload ID="FileUpload1" runat="server" />
                            </td>
                        </tr>
                        <tr>
                            <td width="100" align="right" valign="top" ></td>
                            <td align="left" valign="top" >
                                <asp:Button ID="Button1" runat="server" Text="添  加" onclick="Button1_Click" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <asp:Button ID="Button2" runat="server" Text="返  回" />
                            </td>
                        </tr>
                        <tr>
                            <td width="100" align="right" valign="top" ></td>
                            <td align="left" valign="top" ></td>
                        </tr>
                        <tr>
                            <td width="100" align="right" valign="top" ></td>
                            <td align="left" valign="top" ></td>
                        </tr>
                        <tr>
                            <td width="100" align="right" valign="top" ></td>
                            <td align="left" valign="top" ></td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
    </div>
    </form>
</body>
</html>
