<%@ Page Language="C#" %>
<%@ Import Namespace="_9UCore" %>
<%@ Import Namespace="System.Data"  %>
<%@ Register src="_treeview.ascx" tagname="_treeview" tagprefix="uc1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<script runat="server">

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

            dg.DataSource = GetData();
            dg.DataBind();

            string city = "";
            if (Request["city"] != null)
            {
                city = Request["city"].Trim();
                try
                {
                    int type = int.Parse(city.Substring(0, 1));
                    city = city.Remove(0, 1);
                    treeview.CollapseAll();
                    treeview.Nodes[type].ExpandAll();
                    bool find = false;
                    foreach (TreeNode tn in treeview.Nodes[type].ChildNodes)
                    {
                        
                        foreach (TreeNode subTn in tn.ChildNodes)
                        {
                            if (subTn.Text.Trim().Equals(city))
                            {
                                find = true;
                                subTn.Select();
                                break;
                            }
                        }
                        if (find)
                            break;
                    }
                }
                catch
                { 
                
                }

                dg.DataSource = GetData();
                dg.DataBind();
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
            //return;
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

        dg.DataSource = GetData();
        dg.DataBind();
        
    }

    public DataTable GetData()
    {
        DataTable dt = new DataTable();
        dt.Columns.Add("ID");
        dt.Columns.Add("标题");
        dt.Columns.Add("出发地");
        dt.Columns.Add("航线");
        dt.Columns.Add("天数");
        dt.Columns.Add("景点");

        try
        {
            int type = int.Parse(treeview.SelectedValue.Trim().Substring(0, 1));
            string city = treeview.SelectedValue.Trim().Remove(0, 1);

            Product[] prodArr = Product.GetProductsByCity(city, type);

            for (int i = 0; i < prodArr.Length; i++)
            {
                DataRow dr = dt.NewRow();
                dr["ID"] = prodArr[i]._field["tar_id"].ToString().Trim();
                dr["标题"] = "<a href=\"detail.aspx?id=" + prodArr[i]._field["tar_id"].ToString().Trim() + "\"  >" 
                    + prodArr[i]._field["tar_title"].ToString().Trim() + "</a>";
                dr["出发地"] = prodArr[i]._field["tar_startcity"].ToString().Trim();
                dr["航线"] = prodArr[i]._field["tar_airline"].ToString().Trim();
                dr["天数"] = prodArr[i]._field["tar_days"].ToString().Trim();
                dr["景点"] = prodArr[i]._field["tar_sights"].ToString().Trim();
                dt.Rows.Add(dr);
            }
        }
        catch
        { 
        
        }
        return dt;
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        Response.Redirect("detail.aspx", true);
    }

    protected void dg_DeleteCommand(object source, DataGridCommandEventArgs e)
    {
        string sKey = dg.DataKeys[e.Item.ItemIndex].ToString().Trim();
        string sql = "delete tar where tar_id = '" + sKey.Trim().Replace("'","") + "'  ";
        System.Data.SqlClient.SqlConnection conn = new System.Data.SqlClient.SqlConnection(Util.ConnectingString);
        System.Data.SqlClient.SqlCommand cmd = new System.Data.SqlClient.SqlCommand(sql, conn);
        conn.Open();
        cmd.ExecuteNonQuery();
        conn.Close();
        cmd.Dispose();
        conn.Dispose();
        dg.DataSource = GetData();
        dg.DataBind();
        
    }

    protected void dg_ItemDataBound(object sender, DataGridItemEventArgs e)
    {
        switch (e.Item.ItemType)
        {
            case ListItemType.Item:
            case ListItemType.EditItem:
            case ListItemType.AlternatingItem:
                ((LinkButton)e.Item.Cells[0].Controls[0]).Attributes.Add("onclick", "return confirm('你真的要删除第" + (e.Item.ItemIndex + 1).ToString() + "行吗？');");
                break;
        }
    }
</script>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Untitled Page</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <table width="100%" border="1" >
            <tr>
                <td width="100" align="left" valign="top" >
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
                <td  align="left" valign="top"  >
                    <table width="100%" border="1" >
                        <tr>
                            <td>
                                <asp:Label ID="LblCurLoc" runat="server" Font-Bold="True"></asp:Label>
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <asp:Button ID="Button1" runat="server" onclick="Button1_Click" Text="添  加" />
                            </td>
                        </tr>
                        <tr>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td><asp:DataGrid ID="dg" runat="server" Width="100%" AutoGenerateColumns="False" 
                                    BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" 
                                    CellPadding="3" Font-Size="Small" GridLines="Vertical" DataKeyField="ID" OnDeleteCommand="dg_DeleteCommand" OnItemDataBound="dg_ItemDataBound" >
                                <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
                                <SelectedItemStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
                                <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" 
                                    Mode="NumericPages" />
                                <AlternatingItemStyle BackColor="#DCDCDC" />
                                <ItemStyle BackColor="#EEEEEE" ForeColor="Black" />
                                <Columns>
                                    <asp:ButtonColumn CommandName="Delete" Text="删除"></asp:ButtonColumn>
                                    <asp:BoundColumn DataField="ID" HeaderText="ID"></asp:BoundColumn>
                                    <asp:BoundColumn DataField="标题" HeaderText="标题"></asp:BoundColumn>
                                    <asp:BoundColumn DataField="出发地" HeaderText="出发地"></asp:BoundColumn>
                                    <asp:BoundColumn DataField="天数" HeaderText="天数"></asp:BoundColumn>
                                    <asp:BoundColumn DataField="航线" HeaderText="航线"></asp:BoundColumn>
                                    <asp:BoundColumn DataField="景点" HeaderText="景点"></asp:BoundColumn>
                                </Columns>
                                <HeaderStyle BackColor="#000084" Font-Bold="True" ForeColor="White" />
                                </asp:DataGrid></td>
                        </tr>
                    </table>  
                </td>
            </tr>
        </table>
    </div>
    </form>
</body>
</html>
