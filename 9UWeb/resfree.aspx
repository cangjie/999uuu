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
                        免责声明</font></td>
                </tr>
                <tr>
                    <td>
                        <br />
                        <br class="auto-style2" />
                        <span class="auto-style3">&nbsp;&nbsp;
                        <br />
                        &nbsp;&nbsp;北京市中国旅行社有限公司阜成门营业部，网上的言论并不代表本网站的观点，如果上面的言论对您造成伤害，我们将协助您及有关部门清除相关内容，但我们不承担任何责任。 
                        <br />
                        <br />
&nbsp;&nbsp; 本站所刊载的图片、视频、Flash、文章等均由本网站用户贡献，本站不享有版权，如果您发现有部分内容侵害了您的版权，请速与我们联系，我们将在第一时间删除，如果您未提出任何异义，将视为允许本站刊载您的作品。&nbsp; 
                        <br />
                        <br />
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