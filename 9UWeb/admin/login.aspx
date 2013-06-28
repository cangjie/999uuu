<%@ Page Language="C#" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<script runat="server">

    protected void Button1_Click(object sender, EventArgs e)
    {
        if ((TxtUsn.Text.Trim() + ":" + TxtPwd.Text.Trim()).Equals("admin:nimda"))
        {
            Session["adminid"] = TxtUsn.Text.Trim();
            Response.Redirect("main.aspx", true);
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
        <table width="100%" >
            <tr>
                <td></td>
                <td></td>
            </tr>

            <tr>
                <td style="text-align: right">用户名：</td>
                <td>
                    <asp:TextBox ID="TxtUsn" runat="server"></asp:TextBox>
                </td>
            </tr>

            <tr>
                <td style="text-align: right">密 码：</td>
                <td>
                    <asp:TextBox ID="TxtPwd" runat="server" TextMode="Password"></asp:TextBox>
                </td>
            </tr>

            <tr>
                <td>&nbsp;</td>
                <td>
                    <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="登  录" />
                </td>
            </tr>

        </table>
    </div>
    </form>
</body>
</html>
