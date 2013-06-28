<%@ Control Language="C#" ClassName="_treeview" %>
<%@ Import Namespace="_9UCore" %>
<script runat="server">

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["adminid"] == null || Session["adminid"].ToString().Trim().Equals(""))
        {
            Response.Redirect("login.aspx", true);
        }
    }

    protected void treeview_SelectedNodeChanged(object sender, EventArgs e)
    {
        ViewState["curloc"] = treeview.SelectedValue.Trim();
        ViewState["curprv"] = treeview.SelectedNode.Parent.Value.Trim();
    }
</script>
                    <asp:TreeView ID="treeview" runat="server" 
    ImageSet="Arrows" onselectednodechanged="treeview_SelectedNodeChanged" >
                        <ParentNodeStyle Font-Bold="False" />
                        <HoverNodeStyle Font-Underline="True" ForeColor="#5555DD" />
                        <SelectedNodeStyle Font-Underline="True" ForeColor="#5555DD" 
                            HorizontalPadding="0px" VerticalPadding="0px" />
                        <NodeStyle Font-Names="Tahoma" Font-Size="10pt" ForeColor="Black" 
                            HorizontalPadding="5px" NodeSpacing="0px" VerticalPadding="0px" />
                    </asp:TreeView>