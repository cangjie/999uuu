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
        //pArr = Product.GetHotProdByType(0);
        
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
                <p>&nbsp;</p>
            </div>
            <div class="content">
                <img src="images/meet.jpg" width="100%" />
            </div>
            <uc2:_tail ID="_tail1" runat="server" />
        </div>
    </form>
</body>
</html>
