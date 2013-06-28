<%@ Page Language="C#" %>

<%@ Register src="_head.ascx" tagname="_head" tagprefix="uc1" %>
<%@ Register src="_tail.ascx" tagname="_tail" tagprefix="uc2" %>

<!DOCTYPE html>

<script runat="server">

</script>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <title></title>
	<link rel="stylesheet" type="text/css" href="jic/css/common.css"  />	
	<link rel="stylesheet" type="text/css" href="jic/css/index.css"  />	
	<script type="text/javascript" src="jic/js/jquery-1.4.2.min.js" ></script>
    <style type="text/css">
        .auto-style1
        {
            text-align: center;
        }
        
        .auto-style2
        {
            font-size: medium;
        }
        .auto-style3
        {
            font-size: large;
        }
        
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div class="wrapper" >
        <uc1:_head ID="_head1" runat="server" />
        <div class="content">
            <table border="0" width="100%"  >
                <tr>
                    <td class="auto-style1"><font size="15" >
                        <br />
                        联系我们</font></td>
                </tr>
                <tr>
                    <td>
                        <br />
                        <br class="auto-style2" />
                        <span class="auto-style3">&nbsp;&nbsp;
                        <br />
&nbsp;&nbsp;&nbsp; 门市地址：北京市朝阳区望京广顺南大街东亚望京中心A座3308室 邮编：100102
                        <br />
&nbsp;&nbsp;&nbsp;
                        <br />
                        <br />
                        <br />
&nbsp;&nbsp;&nbsp; 服务电话：010-57161081、57161082 传真：010-84786357<br />
                        <br />
                        <br />
                        </span>

                    </td>
                </tr>
                <tr>
                    <td></td>
                </tr>
            </table>
            
            <br />
            
        </div>
        <uc2:_tail ID="_tail1" runat="server" />
    </div>
    </form>
</body>
</html>