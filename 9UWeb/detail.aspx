<%@ Page Language="C#" %>
<%@ Import Namespace="_9UCore" %>
<%@ Import Namespace="System.Data" %>
<%@ Register src="_head.ascx" tagname="_head" tagprefix="uc1" %>
<%@ Register src="_tail.ascx" tagname="_tail" tagprefix="uc2" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<script runat="server">

    /*http://www.aoyou.com/domesticgroup/PriceCalendar.ashx?productid=416&year=2013&month=8&s=Mon*/
    public Product p;

    public string title = "";
    public string keywd = "";
    public string descr = "";
    
    protected void Page_Load(object sender, EventArgs e)
    {
        int id = 203;
        try
        {
            id = int.Parse(Request["id"].Trim());
        }
        catch
        { 
        
        }
        if (id == 0)
        {
            Response.Write("参数错误");
            Response.End();
        }

        p = new Product(id);
/*
        foreach (DataColumn c in p._field.Table.Columns)
        {
            Response.Write(c.Caption.Trim() + ":<br/>" + p._field[c].ToString().Trim() + "<br><br><br>");
        }

        Response.End();
*/
        
        title = p._field["tar_title"].ToString().Trim() + " 中唐国旅-游走天下";
        keywd = p._field["tar_title"].ToString().Trim();
        descr = p._field["tar_title"].ToString().Trim() + " " + p._field["tar_intro"].ToString().Trim();
        
    }
</script>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <title><%=title %></title>
    <meta name="keywords" content="<%=keywd %>" />
    <meta name="description" content="<%=descr %>" />
	<link rel="stylesheet" type="text/css" href="jic/css/common.css" />	
	<link rel="stylesheet" type="text/css" href="jic/css/trips.css" />	
	<script type="text/javascript" src="jic/js/jquery-1.4.2.min.js" ></script>
	<link rel="stylesheet" type="text/css" href="jic/css/trips-pic.css" />
    <script type="text/javascript" language="javascript" >
        function getpricecalendar(productID, year, month)
        {
            $("#divloadingr").css("display", "block");
            $.get("p.ashx?id=" + productID + "&year=" + year + "&mon=" + month , function (data) { $("#tabPriceL").html(data); })
            $("#divloadingr").css("display", "none");
        }
        function changemonthclass(selfObj, year) {
            for (i = 0; j = document.getElementById("month" + i) ; i++) {
                j.parentNode.parentNode.className = "months";
                document.getElementById("year" + i).style.display = "none";
            }
            selfObj.parentNode.parentNode.className = "months_now";
            document.getElementById(year).style.display = "";
            hidePopup();
        }
        function hidePopup() {
            var popupdiv = document.getElementById('pricedetail');
            popupdiv.style.display = "none";
        }
        $(document).ready(function () {
            //alert("aa");
            var nowD = new Date();
            //alert(nowD + "!" + nowD.getMonth());
            getpricecalendar(<%=Request["id"]%>, nowD.getFullYear(), nowD.getMonth()+1);
        })
    </script>    
    <!--script type="text/javascript" src="jic/js/jq.js" tppabs="http://www.btgbj.com/jic/js/jq.js"></script--> 
	<!--script type="text/javascript" src="jic/jssrc/butbu_v1.0.js" tppabs="http://www.btgbj.com/jic/jssrc/butbu_v1.0.js"></script-->
    <style type="text/css">
        .auto-style1
        {
            width: 75px;
        }
        .auto-style2
        {
            width: 75px;
        }
        .auto-style3
        {
            width: 75px;
        }
        
@charset "utf-8";
html {
}
body, p, ul, li, h1, h2, h3, h4, form, input, textarea, label, dd {
    margin: 0;
    padding: 0;
}
body {
    font: 12px/1.5 Arial,Helvetica,sans-serif;
    word-break: break-all;
    word-wrap: break-word;
}
li {
    list-style: none outside none;
}
img {
    border: 0 none;
}
em {
    font-style: normal;
}
textarea {
    font-family: Arial,Geneva,sans-serif;
    overflow-x: hidden;
    overflow-y: auto;
    resize: none;
}
input:focus, textarea:focus {
    outline: medium none;
}
.hidden {
    display: none !important;
}
.blur-txt {
    color: #999999 !important;
}
.search-txt {
    color: #FF0000 !important;
}
a {
    text-decoration: none;
}
a:hover {
    text-decoration: underline;
}
body, h1, h2, h3, h4, ul, li, span, a, img, p {
    border: 0 none;
    margin: 0;
    padding: 0;
}
a {
    color: #666666;
    text-decoration: none;
}
a:hover {
    color: #FF6600;
    text-decoration: underline;
}
ul, li {
    list-style: none outside none;
}
body {
    color: #333333;
    font-family: "宋体",Arial,Helvetica,sans-serif;
}
.clear {
    clear: both;
}
.ff6600 {
    color: #FF6600;
}
.f333 {
    color: #333333;
}
.f666 {
    color: #666666;
}
.ccc {
    color: #CCCCCC;
}
.ffffff {
    color: #FFFFFF;
}
.ff2a00 {
    color: #FF2A00;
}
.ff3300 {
    color: #FF3300;
}
.fontsize12 {
    font-size: 12px;
}
.fontsize14 {
    font-size: 14px;
}
.fontsize16 {
    font-size: 16px;
}
.fontsize18 {
    font-size: 18px;
}
.fontsize20 {
    font-size: 20px;
}
.fontsize22 {
    font-size: 22px;
}
.fontblod {
    font-weight: bold;
}
.fontlighter {
    font-weight: lighter;
}
.overthrough {
    text-decoration: line-through;
}
.mar_top_14 {
    margin-top: 14px;
}
.mar_top_4 {
    margin-top: 4px;
}
.mar_top_10 {
    margin-top: 10px;
}
.mar_top18 {
    margin-top: 18px;
}
.mar_top8 {
    margin-top: 8px;
}
.mar_bottom10 {
    margin-bottom: 10px;
}
.mar_bottom10f {
    margin-bottom: -10px;
}
.pad_top_8 {
    padding-top: 8px;
}
.pad_top_5 {
    padding-top: 5px;
}
.pad_right_50 {
    padding-right: 50px;
}
.pad_bottom_5 {
    padding-bottom: 5px;
}
.pad_left10 {
    padding-left: 10px;
}
.pad_bottom_10 {
    padding-bottom: 10px;
}
.pad_right_10 {
    padding-right: 10px;
}
.pad_top_10f {
}
.pad_top_15f {
}
.song {
    font-family: "宋体";
}
.heiti {
    font-family: "黑体";
}
.weiruan {
    font-family: "微软雅黑","宋体",Arial,Helvetica,sans-serif;
}
.ar {
    font-family: Arial,Helvetica,sans-serif;
}
.flotleft {
    float: left;
}
.flotright {
    float: right;
}
.textright {
    text-align: right;
}
.line_height22 {
    line-height: 22px;
}
.aoyounotice {
    background-color: #EEEEEE;
    font-family: "微软雅黑","宋体";
    height: 25px;
    line-height: 25px;
    overflow: hidden;
    z-index: 200;
}
.aoyounotice2 {
    font-family: "微软雅黑","宋体";
    height: 25px;
    line-height: 25px;
    overflow: hidden;
    z-index: 200;
}
.aoyounotice_down {
    -moz-border-bottom-colors: none;
    -moz-border-left-colors: none;
    -moz-border-right-colors: none;
    -moz-border-top-colors: none;
    background-color: #FFFFFF;
    border-color: #E4E4E4 #E4E4E4 -moz-use-text-color;
    border-image: none;
    border-style: solid solid none;
    border-width: 1px 1px medium;
    color: #333333;
    float: left;
    height: 24px;
    margin-right: 2px;
    text-align: center;
    width: 88px;
}
.aoyounotice_up {
    background: none repeat scroll 0 0 #F1F1F1;
    color: #666666;
    cursor: pointer;
    float: left;
    height: 24px;
    margin-right: 2px;
    text-align: center;
    width: 88px;
}
.aoyounotice_tit {
    float: left;
    padding-left: 15px;
}
.aoyounotice_block {
    border: 1px solid #E4E4E4;
    height: 165px;
    margin-bottom: 10px;
    margin-top: -1px;
    z-index: 2;
}
.aoyounotice_block_more {
    float: right;
    font-family: "宋体";
    font-size: 12px;
    padding-right: 5px;
    text-align: right;
}
.aoyounotice_block ul {
    background: url("http://images1.aoyou.cc/Images/index_2011_img3.gif") no-repeat scroll center bottom transparent;
    font-size: 12px;
    line-height: 22px;
    margin: 0 auto;
    padding: 12px 0 10px;
    width: 212px;
}
.aoyounotice_block ul li {
    height: 22px;
}
.aoyounotice_block a {
    color: #666666;
}
.aoyounotice_block a:hover {
    color: #FF6600;
}
.aoyounotice_block_fx {
    background-position: -345px 0;
    font-size: 12px;
    height: 42px;
    padding-left: 5px;
    padding-top: 10px;
    width: 215px;
}
.aoyounotice_block_fx a {
    color: #666666;
}
.aoyouqyh {
    background: url("http://images1.aoyou.cc/Images/index_2011_img16.jpg") no-repeat scroll 0 0 transparent;
    height: 162px;
    margin-bottom: 10px;
    overflow: hidden;
    padding: 7px 8px 0 12px;
    width: 220px;
}
.aoyouqyh a.qglink {
    color: #0055AA;
    display: block;
    font-size: 12px;
    height: 48px;
    line-height: 20px;
    width: 180px;
}
.aoyouqyh_img {
    float: left;
    height: 96px;
    width: 128px;
}
.aoyouqyh_txt {
    float: right;
    line-height: 22px;
    width: 78px;
}
.aoyouqyh_txt a.qg {
    background-position: -579px 0;
    display: block;
    height: 33px;
    width: 78px;
}
.excitactiviti {
    border: 1px solid #E4E4E4;
    margin-bottom: 10px;
    padding-bottom: 10px;
}
.excitactiviti_img {
    margin: auto;
    padding: 6px 0;
    width: 215px;
}
.excitactiviti_img a {
    color: #666666;
    display: block;
    font-size: 12px;
    line-height: 22px;
}
.excitactiviti_img a:hover {
    color: #FF6600;
    display: block;
    font-size: 12px;
    line-height: 22px;
}
.themetravel {
    background-position: -167px -214px;
    font-size: 12px;
    height: 31px;
    line-height: 31px;
    overflow: hidden;
    padding-left: 12px;
    width: 546px;
    z-index: 500;
}
.themetravel_icon {
    background-position: -305px 0;
    float: left;
    height: 30px;
    width: 32px;
}
.header_icon1, .header_mobile_icon2, .meun_tit, .meun_txt li, .cytswindows a, .search, .search_help, .search_btn a, .search_btn a:hover, .hotline, .featuredProduct, .themetravel_icon, .aoyounotice_block_fx, .aoyouqyh_txt a, .themetravel {
    background-image: url("http://images1.aoyou.cc/Images/index_2011_allpic.jpg");
}
.hotpage {
    border: 1px solid #E4E4E4;
    margin-bottom: 10px;
    padding-bottom: 5px;
}
.hotpage ul {
    padding: 10px;
}
.hotpage ul li {
    clear: both;
    font-size: 12px;
    height: 22px;
    line-height: 22px;
}
.hotpage ul li a {
    color: #666666;
    display: block;
    float: left;
}
.hotpage ul li a:hover {
    color: #FF6600;
    display: block;
    float: left;
}
.hotpage ul li p {
    color: #999999;
    float: right;
}
.post-box .post-title {
    background-position: 0 0;
}
.post-box .share-btn {
    background-position: 0 -80px;
}
.post-box .share-btn:hover {
    background-position: -104px -80px;
}
.post-box .share-btn-disable {
    background-position: -208px -80px;
    cursor: default;
}
.post-box .share-btn-disable:hover {
    background-position: -208px -80px;
    cursor: default;
}
.addfollow-btn, .followed-btn, .post-box .post-title, .post-box .share-btn, .post-box .share-btn:hover, .post-box .share-btn-disable {
    background: url("http://images1.aoyou.cc/groupdetail/skin_bg.png") no-repeat scroll 0 0 transparent;
}
.post-box .share-btn {
    cursor: pointer;
    height: 29px;
    outline: medium none;
    position: absolute;
    right: 0;
    text-indent: -9999px;
    top: 115px;
    width: 86px;
}
.ico-female, .ico-male, .ico-post-weibo, .ico-change, .ico-mic, .ico-face, .ico-pic, .ico-video, .ico-video-url, .ico-music, .ico-music-url, .ico-topic, .ico-piup, .ico-src, .ico-turnleft, .ico-turnright, .ico-yes, .ico-close-btn, .ico-reply, .ico-del, .more-opera, .out140, .ico-ask, .ico-load-fail, .tips-ok, .tips-wrong, .tips-normal, .ico-verify, .tips-help, .close-ico, .ico-blacklist, .ico-weibo, .ico-share, .ico-join, .ico-fav, .ico-follow, .ico-remind, .ico-invite, .ico-del-pic, .user-head .operated-box .followed-btn {
    background: url("http://t.aoyou.com/css/default/bgimg/ico_bg.png") no-repeat scroll 0 0 transparent;
}
.all-bg, .icon-ask, .icon-alert, .icon-success, .icon-tips, .icon-face-choose, .top10 .r-1, .top10 .r-2, .top10 .r-3, .icon-each-follow, .video-view, .win-e-prev, .win-e-next, .prev-disabled, .next-disabled, .arrow-l-s1, .arrow-l-s1-disabled, .arrow-r-s1, .arrow-r-s1-disabled, .arrow-l-s2, .arrow-l-s2-disabled, .arrow-r-s2, .arrow-r-s2-disabled, .win-pop .arrow, .v-verified, .bulicity, .user-menu a, .search-box, .search-btn, .search-box-focus, .hot-total, .arrow-b .arrow {
    background: url("bgimg/all_bg.png") no-repeat scroll 0 0 transparent;
}
.bind-btn-bg {
    background: url("http://t.aoyou.com/css/default/bgimg/btn_bind.png") no-repeat scroll 0 0 transparent;
}
.search-area .search-block .s-btn, .btn-login, .btn-launch-event, .btn-ffirm, .select-user .click-btn, .search-host {
    background: url("bgimg/skin_btn.png") no-repeat scroll 0 0 transparent;
}
.post-btn, .post-btn a, .title-tab .tab-current, .title-tab .tab-link, .title-tab .tab-current span, .title-tab .tab-link span, .tags-btn, .tags-btn span, .btn-s1, .btn-s1 span, .btn-s1-light, .btn-s1-light span, .btn-s1-disabled, .btn-s1-disabled span, .btn-s2, .btn-s2 span, .btn-s3, .btn-s3 span {
    background: url("bgimg/btn_bg.png") no-repeat scroll 0 0 transparent;
}
.tab-s1 .current, .tab-s1 .current span, .tab-s2, .tab-s2 span, .tab-s2 span span, .tab-s2 .current, .tab-s2 .current span, .tab-s3, .tab-s3 span, .tab-s3 span span, .tab-s3 .current, .tab-s3 .current span, .tab-s5, .tab-s5 .current, .tab-s5 .current a {
    background: url("bgimg/tab_bg.png") repeat scroll 0 0 transparent;
}
.title-box .talk-tab, .title-box h3, .tit-s1 {
    background: url("bgimg/pub_bg_x.png") repeat-x scroll 0 0 transparent;
}
.post-box .post-textarea, .post-box .post-textarea .inner, .post-box .post-focus, .post-box .post-focus .inner {
    background: url("http://images1.aoyou.cc/groupdetail/post_box_bg.png") no-repeat scroll 0 0 transparent;
}
.box-style .box-t, .box-style .box-t span, .box-style .box-b, .box-style .box-b span, .box-style .box-arrow, .search-block, .search-block .search-inner {
    background: url("bgimg/tab_bg_x.png") no-repeat scroll 0 0 transparent;
}
.feed-list li, .user-list li, .user-list-wrap .user-item, .user-list-mode .result, .top10 li, .index-default .no-mblog, .comment-list li, .message-list li, .local-list .column-item, .blacklist, .tags-title, .new-tips-fixed h4, .bottom-line, .add-comment-dash, .setting-box strong, .recent-event .bd li {
    background: url("bgimg/bottom_line.gif") repeat-x scroll center bottom transparent;
}
.post-box {
    background-color: #FFFFFF;
    height: 115px;
    padding: 35px 0 20px;
    position: relative;
}
.post-box .post-title {
    height: 28px;
    left: 0;
    position: absolute;
    text-indent: -9999px;
    top: 0;
    width: 230px;
}
.post-box .key-tips {
    color: #999999;
    height: 30px;
    line-height: 30px;
    position: absolute;
    right: 0;
    top: 0;
}
.post-box .key-tips span {
    font-family: "Constantia",Times,serif;
    font-size: 26px;
}
.post-box .key-tips.out140 {
    background-position: -2px -532px;
    color: #FF0000;
    padding-left: 20px;
}
.post-box .post-textarea, .post-box .post-focus {
    height: 75px;
    padding-left: 7px;
}
.post-box .post-textarea .inner, .post-box .post-focus .inner {
    height: 55px;
    padding: 10px 7px 10px 3px;
}
.post-box .post-textarea .inner textarea, .post-box .post-focus .inner textarea {
    border: 0 none;
    font-size: 14px;
    height: 55px;
    line-height: 18px;
    overflow-x: hidden;
    width: 100%;
}
.post-box .post-textarea {
    background-position: 0 -32px;
    width: 560px;
}
.post-box .post-textarea .inner {
    background-position: right -112px;
}
.post-box .post-focus {
    background-position: 0 -192px;
}
.post-box .post-focus .inner {
    background-position: right -272px;
}
.post-box .add-area {
    left: 0;
    position: absolute;
    top: 115px;
}
.post-box .add-area span {
    margin-right: 10px;
}
.post-box .add-area a.ico-close-btn {
    margin: 0 0 0 5px;
    padding-left: 0;
    vertical-align: middle;
}
.post-box .share-btn {
    cursor: pointer;
    height: 29px;
    outline: medium none;
    position: absolute;
    right: 0;
    text-indent: -9999px;
    top: 115px;
    width: 86px;
}
.post-box .post-success {
    color: #438B13;
    font-family: "Microsoft Yahei",simhei,"宋体";
    font-size: 2.4em;
    height: 45px;
    left: 190px;
    position: absolute;
    top: 50px;
    width: 220px;
}
.post-box .post-success .icon-success {
    margin-right: 10px;
}
.post-box .account-notbind {
    left: 100px;
    position: absolute;
    top: 65px;
    width: 380px;
}
.post-box .load-fail {
    background-position: -2px -103px;
    height: 20px;
}
.post-box .post-verify {
    font-size: 14px;
    left: 215px;
    padding-left: 25px;
    position: absolute;
    top: 62px;
    width: 115px;
}
.post-box .ico-verify {
    background-position: 0 -636px;
}
.login-tips {
    background: url("bgimg/login_tips.png") no-repeat scroll 0 0 transparent;
    height: 126px;
    margin: 0 0 15px;
    position: relative;
    width: 560px;
}
.login-tips .btn-sina-bind-s, .login-tips .btn-sina-login, .login-tips .btn-login {
    left: 20px;
    position: absolute;
    top: 32px;
}
.login-tips .guide-reg {
    color: #FFFFFF;
    left: 26px;
    position: absolute;
    top: 75px;
}
.login-tips .guide-reg a, .login-tips .guide-reg a:visited {
    color: #FFFFFF;
    text-decoration: underline;
}
.login-tips .tips-txt {
    left: 240px;
    position: absolute;
    top: 70px;
    width: 300px;
}
#bind-account #container {
    background: none repeat scroll 0 0 #FFFFFF !important;
    border: 0 none;
    height: 500px;
}
#weibo_login #container {
    background: none repeat scroll 0 0 #FFFFFF !important;
    padding-top: 70px;
}
.weibo-login-area a, .weibo-login-area a:visited {
    color: #000000;
}
.weibo-login-area a:hover {
    color: #000000;
    text-decoration: none;
}
.weibo-login-area span {
    margin-left: 5px;
}
.weibo-login-area span a, .weibo-login-area span a:visited {
    color: #6EAFD5;
}
.weibo-login-area span a:hover {
    color: #6EAFD5;
    text-decoration: underline;
}
.weibo-login-area .tips {
    color: #808080;
    font-size: 12px;
    margin-top: 30px;
}
.win-pop {
    z-index: 10003;
}
.win-pop .win-t, .win-pop .win-t div, .win-pop .win-b, .win-pop .win-b div {
    background: url("http://images1.aoyou.cc/groupdetail/win_bg.png") no-repeat scroll 0 0 transparent;
}
.win-pop .win-t, .win-pop .win-b, .win-pop .win-con .win-con-bg {
    opacity: 0.1;
}
.win-pop .win-t {
    background-position: left 0;
    height: 5px;
}
.win-pop .win-t div {
    background-position: right -5px;
    height: 5px;
    margin-left: 6px;
}
.win-pop .win-b {
    background-position: left -10px;
    height: 5px;
}
.win-pop .win-b div {
    background-position: right -15px;
    height: 5px;
    margin-left: 6px;
}
.win-pop .win-con {
    overflow: hidden;
    position: relative;
}
.win-pop .win-con .win-con-in {
    background-color: #FFFFFF;
    border: 1px solid #666666;
    margin: 1px 6px;
}
.win-pop .win-con .win-con-bg {
    background: none repeat scroll 0 0 #000000;
    height: 100%;
    left: 0;
    position: absolute;
    top: 0;
    width: 100%;
    z-index: -1;
}
.win-pop .win-tit {
    background: url("bgimg/x_bg.png") repeat scroll 0 0 transparent;
    font-size: 12px;
    height: 26px;
    line-height: 26px;
    margin: 1px 1px 0;
    text-indent: 6px;
}
.win-pop .arrow {
    background-position: -63px -128px;
    height: 8px;
    left: 25px;
    position: absolute;
    top: -1px;
    width: 15px;
}
.arrow-b .arrow {
    background-position: -64px -152px;
    bottom: -1px;
    left: 25px;
    top: auto;
}
.win-pop .ico-close-btn {
    position: absolute;
    right: 15px;
    top: 15px;
}
.win-pop .btn-area {
    float: right;
    margin-top: 10px;
}
.win-pop .btn-area a {
    margin-left: 8px;
}
.win-fixed {
    left: 50%;
    position: fixed;
    top: 50%;
}
.win-post .post-box .post-textarea {
    background-position: 0 -32px;
}
.win-post .post-box .post-textarea .inner {
    background-position: right -112px;
}
.win-post .post-box .post-focus {
    background-position: 0 -192px;
}
.win-post .post-box .post-focus .inner {
    background-position: right -272px;
}
.win-bind-login .win-con-in {
    background: url("http://t.aoyou.com/css/default/bgimg/bind_login_bg.png") no-repeat scroll 0 0 transparent;
}
.shade-div {
    background-color: #000000;
    display: none;
    height: 500px;
    left: 0;
    opacity: 0.15;
    position: fixed;
    top: 0;
    width: 100%;
}
.win-bind-login {
    margin-left: -218px;
    margin-top: -130px;
    width: 436px;
}
.win-bind-login .win-box {
    overflow: hidden;
}
.win-bind-login .win-box .login-area {
    overflow: hidden;
    padding: 75px 70px 30px 85px;
}
.win-bind-login .win-box .login-area a {
    color: #000000;
}
.win-bind-login .win-box .login-area a:hover {
    color: #000000;
    text-decoration: none;
}
.win-bind-login .win-box .login-area span {
    float: right;
    margin-left: 5px;
    margin-top: 15px;
}
.win-bind-login .win-box .login-area span a {
    color: #6EAFD5;
}
.win-bind-login .win-box .login-area span a:hover {
    color: #6EAFD5;
    text-decoration: underline;
}
.win-bind-login .win-box .bind-tips {
    background-color: #E9F5FF;
    border-radius: 3px 3px 3px 3px;
    color: #757B80;
    height: 25px;
    line-height: 25px;
    margin: 0 auto 10px;
    overflow: hidden;
    padding-left: 8px;
    width: 405px;
}
.btn-web-account, .btn-sina-account, .btn-sina-bind-l, .btn-sina-bind-s, .btn-sina-login {
    background: url("http://t.aoyou.com/css/default/bgimg/btn_bind.png") no-repeat scroll 0 0 transparent;
    outline: medium none;
}
.btn-web-account, .btn-sina-account {
    color: #000000;
    display: inline-block;
    font-size: 14px;
    height: 32px;
    line-height: 32px;
    margin: 10px 0;
    outline: medium none;
    padding: 0 5px 0 40px;
    width: 163px;
}
.btn-web-account {
    background-position: 0 0;
}
.btn-web-account:hover {
    background-position: -228px 0;
}
.btn-sina-account {
    background-position: 0 -52px;
}
.btn-sina-account:hover {
    background-position: -228px -52px;
}
.btn-sina-bind-l {
    background-position: 0 -104px;
    float: left;
    height: 41px;
    width: 201px;
}
.btn-sina-bind-l:hover {
    background-position: -221px -104px;
}
.btn-sina-bind-s {
    background-position: 0 -165px;
    float: left;
    height: 33px;
    width: 174px;
}
.btn-sina-bind-s:hover {
    background-position: -194px -165px;
}
.btn-sina-login {
    background-position: 0 -218px;
    float: left;
    height: 33px;
    width: 174px;
}
.btn-sina-login:hover {
    background-position: -194px -218px;
}
.content {
    clear: both;
    margin: auto;
    overflow: hidden;
    width: 1002px;
}
body {
    font-family: "宋体";
    font-size: 12px;
}

.innerwrapper {
    margin: 0 auto;
    overflow: hidden;
    text-align: left;
    width: 1002px;
}
.packagenav {
    background: url("http://images1.aoyou.cc/bookprocess/bookprocess_img2.jpg") repeat scroll 0 0 transparent;
    color: #666666;
    height: 31px;
    line-height: 31px;
    margin: auto;
    padding-left: 13px;
    width: 931px;
}
.packagenav a {
    color: #666666;
    text-decoration: none;
}
.packagenav a:hover {
    color: #666666;
    text-decoration: underline;
}
.packagetop {
    height: 77px;
    margin: auto;
    width: 944px;
}
span.fontsize13 {
    font-size: 13px;
    font-weight: bold;
}
.ec651a {
    color: #EC651A;
}
.top {
    height: 77px;
    margin: auto;
    width: 944px;
}
.top_icon, .top_Steps, .content_content_tit_icon, .content_content_subtit_icon, .content_content_subtit_icon2, .content_content_subtit_icon3, .content_content_subtit_icon4, .content_content_btn, .content_contentNew_btn, .content_content_subtit_icon5, .content_content_subtit_icon6, .top_steps_step1, .top_Steps_step2, .top_icon2, .top_Steps_step3, .content_content_bookok_btn, .content_content_subtit_btn, .content_content_xz_footer_Promotions, .top_Steps_step4, .content_content_Payment_block_b3, .top_Steps_step5, .content_content_bookoktit, .content_content_btn a.b1:hover, .download a {
    background-image: url("http://images1.aoyou.cc/bookprocess/bookprocess_img100.jpg");
}
.top_icon {
    background-position: 0 0;
    float: left;
    height: 77px;
    width: 78px;
}
.top_icon2 {
    background-position: -432px 0;
    float: left;
    height: 77px;
    width: 78px;
}
.top_productname {
    float: left;
    width: 365px;
}
.top_productname_tit {
    font-size: 18px;
    font-weight: bold;
    padding-top: 19px;
    width: 80px;
}
.top_productname_bookoktit {
    float: left;
    overflow: hidden;
    padding-top: 16px;
    width: 373px;
}
.top_productname h1 {
    float: left;
    padding-top: 10px;
    width: 365px;
}
.top_productname h1 a {
    font-size: 14px;
    font-weight: lighter;
    line-height: 20px;
    text-decoration: none;
}
.top_productname h1 a:hover {
    font-size: 14px;
    font-weight: lighter;
    line-height: 20px;
    text-decoration: underline;
}
.top_Steps {
    background-position: 0 -263px;
    float: right;
    height: 74px;
    width: 501px;
}
.top_steps_step1 {
    background-position: 0 -400px;
    float: right;
    height: 74px;
    width: 501px;
}
.top_Steps_step2 {
    background-position: 0 -480px;
    float: right;
    height: 74px;
    width: 501px;
}
.top_Steps_step3 {
    background-position: 0 -730px;
    float: right;
    height: 74px;
    width: 501px;
}
.top_Steps_step4 {
    background-position: 0 -811px;
    float: right;
    height: 74px;
    width: 501px;
}
.top_Steps_step5 {
    background-image: url("http://images1.aoyou.cc/bookprocess/bookprocess_img100.jpg");
    background-position: 0 -891px;
    float: right;
    height: 74px;
    width: 501px;
}
span.f3366cc {
    color: #3366CC;
    font-weight: bold;
}
span.f000 {
    color: #000000;
    font-weight: bold;
}
.f333 {
    color: #333333;
}
.path .packagenav {
    background: none repeat scroll 0 0 transparent;
    float: left;
    width: auto;
}
.productname {
    clear: both;
}
.proname_icon, .proname_tt span, .prozf_btn a, .pro_cal .months_pre, .pro_cal .months_num, .months_now, .xx_price a.nums_minus, .xx_price a.nums_plus, .xx_btn a, #slides a.next, #slides a.next:hover, #slides a.prev, #slides a.prev:hover, .pf_tl, .pf_tr, .pf_bl, .pf_br, .lipre, .tishi_icon, .download a, .share_left, .share_right, .print_left, .print_right, .xingcheng_days h3, .juli_icon, .sider_bar_cont ul li a, .sider_bar_cont ul li a:hover, .gototop span a, .proZf_btn_soldout a {
    background-image: url("http://images1.aoyou.cc/groupdetail/g.png");
    background-repeat: no-repeat;
}
.proname_icon {
    background-position: -62px 0;
    float: left;
    height: 66px;
    margin-right: 15px;
    width: 57px;
}
.proname_tt {
    float: left;
    font-size: 14px;
    line-height: 34px;
    width: 930px;
}
.proname_tt h1 {
    float: left;
}
.proname_tt span {
    background-position: -368px 0;
    display: block;
    float: left;
    font-size: 12px;
    font-weight: normal;
    height: 19px;
    line-height: 19px;
    margin-left: 10px;
    width: 33px;
}
.proname_tt span {
    margin-left: 5px;
}
.proname_tt span.tehui {
    background-position: -401px 0;
}
.proname_tt .h1_tt {
    background: none repeat scroll 0 0 transparent;
    float: left;
    font-size: 16px;
    font-weight: bold;
    height: auto;
    margin: 0;
    width: auto;
}
.proname_desc {
    clear: both;
    margin-top: 2px;
}
.proname_discount {
    background-image: url("http://images1.aoyou.cc/Images/index_2011_radio.gif");
    background-repeat: no-repeat;
    color: #FF6600;
    float: left;
    font-size: 12px;
    height: 31px;
    line-height: 31px;
    padding-left: 20px;
    position: relative;
}
.productzhifu {
    clear: both;
}
.productzhifu ul li {
    display: inline;
}
.prozf_price {
    float: left;
    font-size: 14px;
    padding-left: 10px;
}
.prozf_price li {
    margin: 0 9px;
}
.prozf_price li.qijia {
    margin: 0;
}
.prozf_zf {
    float: right;
    line-height: 46px;
    padding-right: 20px;
}
.prozf_zf li {
    margin: 0 3px;
}
.prozf_zfprice {
    background-color: #FFFAF2;
    border: 1px solid #FFCC99;
    float: left;
    height: 46px;
    line-height: 40px;
    width: 870px;
}
.prozf_price li span span {
    font-family: Arial;
    font-size: 26px;
}
.prozf_btn a {
    background-position: -480px 0;
    display: block;
    float: right;
    height: 46px;
    width: 121px;
}
.prozf_btn a:hover {
    background-position: -480px -46px;
    display: block;
    height: 46px;
    width: 121px;
}
.prozf_btn_soldout a {
    background-image: url("http://images1.aoyou.cc/groupdetail/g.png");
    background-position: 0 -229px;
    background-repeat: no-repeat;
    display: block;
    float: right;
    height: 47px;
    width: 121px;
}
.prozf_price_soldout {
    line-height: 46px;
    margin-left: 9px;
}
.prozf_zfprice .prozf_price_soldout a {
    font-size: 14px;
}
.xq_xingqi {
    background-color: #B7B6B6;
    color: #FFFFFF;
    font-weight: bold;
    line-height: 28px;
}
.pro_cal .cal {
    border: 2px solid #B7B6B6;
    border-collapse: collapse;
    width: 432px;
}
.xq_day td {
    color: #666666;
    font-weight: bold;
    height: 59px;
    line-height: 20px;
    padding-left: 5px;
    text-align: left;
    vertical-align: top;
}
.xq_day {
    border-left: 1px solid #B7B6B6;
}
.closeimg img {
    cursor: pointer;
}
.pro_cal td {
    border: 1px solid #CCCCCC;
}
.xq_xingqi td {
    background-color: #B7B6B6;
    border: 1px solid #B7B6B6;
    text-align: center;
}
.xq_xingqi td:hover {
    background-color: #B7B6B6;
    cursor: default;
}
td.monthsTd a {
    color: #333333;
    text-decoration: none;
}
td.monthsTd a:hover {
    text-decoration: none;
}
.pro_cal .months_pre {
    background-position: 0 -92px;
    float: left;
    height: 33px;
    width: 7px;
}
.pro_cal .months_num {
    background-position: right -92px;
    float: left;
    height: 33px;
    line-height: 33px;
    margin-right: 3px;
    padding: 0 10px 0 3px;
}
.months_num a span {
}
.pro_cal .months_now .months_pre {
    background-position: 0 -184px;
}
.pro_cal .months_now .months_num {
    background-position: right -184px;
    color: #FFFFFF;
    font-weight: bold;
}
.pro_cal .months_now a {
    color: #FFFFFF;
    font-weight: bold;
}
.pro_cal .monthsTd {
    border: medium none;
    color: #666666;
    line-height: 32px;
    text-align: right;
}
.monthsTd span.ff6600 {
    font-weight: bold;
}
td.today {
    background-color: #EAEAEA;
    padding-left: 5px;
}
.tdHolidays {
    color: #993300;
    font-weight: normal;
}
.tdStat {
    color: #FFFFFF;
    display: block;
    font-weight: normal;
    height: 20px;
    margin-right: 5px;
    text-align: right;
}
.tdStat span {
    background-color: #929292;
    padding: 3px 0;
}
.tdStat .erci {
    background-color: #2D9AD1;
}
.tdPrice {
    font-weight: normal;
    margin-left: -5px;
    text-align: center;
}
.tdNow {
    background-color: #F3E09B;
    cursor: pointer;
}
.kucun {
    color: #666666;
    font-weight: normal;
    margin-right: 5px;
    text-align: right;
}
.pro_slide {
    float: left;
    margin-top: 17px;
}
.pro_cal {
    float: right;
    margin-top: 17px;
}
.productShow {
}
.popup {
    cursor: default;
    display: block;
    font-weight: normal;
    position: relative;
}
.popup_price {
    background-color: #F3E09B;
    border: 1px solid #C5BB64;
    display: block;
    height: 118px;
    position: absolute;
    top: 0;
    width: 118px;
    z-index: 999;
}
.popup_xx {
    background-color: #EFF9FD;
    border: 1px solid #3399FF;
    display: block;
    left: 120px;
    overflow: hidden;
    position: absolute;
    top: 0;
    width: 308px;
    z-index: 999;
}
.inner_popup_price {
    color: #996633;
    font-size: 14px;
    font-weight: normal;
    line-height: 24px;
    margin: 15px;
    text-align: right;
}
.inner_popup_price span {
    display: block;
    float: left;
    font-family: Arial;
    font-size: 28px;
}
.inner_price_num span {
    color: #FF2A00;
    font-family: Arial;
    font-size: 20px;
}
.inner_price_num {
    color: #333333;
    font-size: 18px;
    font-weight: normal;
    margin: 50px 0 auto 15px;
}
.chengtuan {
    background-color: #4FB9E7;
    color: #FFFFFF;
    display: block;
    float: left;
    font-size: 12px;
    line-height: 20px;
    margin-top: 5px;
    padding: 0 5px;
}
.kc {
    float: left;
    margin-right: 15px;
}
.youhui {
    clear: both;
}
.kc span.ff6600 {
    font-weight: bold;
}
.xx_desc {
    background-color: #EFF9FD;
    color: #333333;
    font-size: 14px;
    line-height: 30px;
    padding: 10px 18px 5px;
}
.xx_price ul li {
    background-color: #FFFFFF;
    border-bottom: 1px solid #EAEAEA;
    display: block;
    float: left;
    font-size: 14px;
    line-height: 22px;
    padding: 5px 0;
}
.xx_price ul {
    background-color: #FFFFFF;
    float: left;
}
.xx_price {
    background-color: #FFFFFF;
    clear: both;
}
.xx_price a.nums_minus {
    background-position: -238px -21px;
    display: block;
    float: left;
    height: 21px;
    margin-top: 1px;
    width: 19px;
}
.xx_price a.nums_minus:hover {
    background-position: -238px 0;
    display: block;
    float: left;
    height: 21px;
    width: 19px;
}
.xx_price a.nums_plus {
    background-position: -257px -21px;
    display: block;
    float: left;
    height: 21px;
    margin-right: 5px;
    margin-top: 1px;
    width: 19px;
}
.xx_price a.nums_plus:hover {
    background-position: -257px 0;
    display: block;
    float: left;
    height: 21px;
    width: 19px;
}
.xx_price input {
    background-color: #FFFF90;
    border: 1px solid #FF9933;
    color: #666666;
    display: block;
    float: left;
    font-size: 15px;
    height: 20px;
    line-height: 20px;
    text-align: center;
    width: 30px;
}
.price_type {
    color: #666666;
    float: left;
    padding-left: 19px;
    width: 120px;
}
.prices {
    float: left;
    font-family: Arial;
    font-size: 16px;
    width: 70px;
}
.nums {
    color: #666666;
    float: left;
}
.xx_btn {
    background-color: #EFF9FD;
    float: left;
    padding: 15px 80px;
}
.xx_btn a {
    background-position: -453px -278px;
    color: #333333;
    display: block;
    font-size: 18px;
    font-weight: bold;
    height: 44px;
    line-height: 44px;
    padding-left: 55px;
    text-decoration: none;
    width: 86px;
}
.xx_btn a:hover {
    background-position: -453px -234px;
    display: block;
    text-decoration: none;
}
.closeimg {
    height: 12px;
    left: 405px;
    position: absolute;
    top: 5px;
    width: 12px;
    z-index: 1000;
}
#example {
    height: 420px;
    position: relative;
    width: 560px;
}
#slides {
    position: absolute;
    z-index: 100;
}
#slides .slide {
    width: 560px;
}
#slides .next, #slides .prev {
    display: block;
    height: 31px;
    left: 10px;
    position: absolute;
    top: 203px;
    width: 31px;
    z-index: 101;
}
.slides_container {
    height: 420px;
    overflow: hidden;
    position: relative;
    width: 560px;
}
#frame {
    height: 341px;
    left: -80px;
    position: absolute;
    top: -3px;
    width: 739px;
    z-index: 0;
}
#slides a.next {
    background-position: -31px 0;
    display: block;
    height: 31px;
    left: 519px;
    width: 31px;
}
#slides a.next:hover {
    background-position: -31px -31px;
    display: block;
    height: 31px;
    width: 31px;
}
#slides a.prev {
    background-position: 0 0;
    display: block;
    height: 31px;
    width: 31px;
}
#slides a.prev:hover {
    background-position: 0 -31px;
    display: block;
    height: 31px;
    width: 31px;
}
.pagination {
    display: none;
    margin: 26px auto 0;
    width: 100px;
}
.productfeauture {
    clear: both;
    margin-bottom: 15px;
    width: 878px;
}
.pf_tl, .pf_tr, .pf_bl, .pf_br {
    float: left;
    height: 7px;
    overflow: hidden;
    width: 7px;
}
.pf_mm {
    background-color: #FFFBF2;
    border-left: 1px solid #FFCC99;
    border-right: 1px solid #FFCC99;
    clear: both;
    float: left;
    overflow: hidden;
    width: 875px;
}
.pf_mm a {
    color: #136EC2;
    text-decoration: underline;
}
.others_info a {
    color: #136EC2;
    text-decoration: underline;
}
.pf_tm {
    background-image: url("http://images1.aoyou.cc/groupdetail/bgtop_03.gif");
    background-repeat: no-repeat;
    float: left;
    height: 7px;
    width: 877px;
}
.pf_bm {
    background-image: url("http://images1.aoyou.cc/groupdetail/bgbot.gif");
    background-repeat: no-repeat;
    float: left;
    height: 7px;
    width: 877px;
}
.pf_tl {
    background-position: -586px -160px;
}
.pf_tr {
    background-position: -593px -160px;
}
.pf_bl {
    background-position: -586px -167px;
    width: 6px;
}
.pf_br {
    background-position: -593px -167px;
}
.pf_mm ul {
    padding: 15px 40px 15px 20px;
}
.pf_mm ul li {
    margin: 0;
    padding: 0;
}
.pf_mm ul li ul {
    margin: 0;
    padding: 0;
}
.pf_mm ul li ol {
    margin: 0;
    padding: 0;
}
.pf_mm ul li ol li {
    margin: 0;
    padding: 0;
}
.productfeauture ul li {
    clear: both;
    color: #1D89AF;
    font-size: 14px;
    font-weight: bold;
    line-height: 22px;
    list-style-position: outside;
}
.productfeauture ul li ul li {
    color: #333333;
    font-size: 12px;
    font-weight: normal;
    list-style-type: none;
}
.productfeauture ul li ol {
    margin-left: 19px;
    padding: 0;
}
.productfeauture ul li ol li {
    color: #333333;
    font-size: 12px;
    font-weight: normal;
    list-style-position: outside;
    list-style-type: decimal;
}
.lipre {
    background-position: -148px 0;
    float: left;
    height: 20px;
    margin-right: 3px;
    margin-top: 3px;
    width: 16px;
}
.linext {
    float: left;
    width: 788px;
}
.tishi {
    float: left;
    margin-bottom: 12px;
}
.main {
    margin-top: 15px;
    width: 877px;
}
.tishi_icon {
    background-position: -119px 0;
    float: left;
    height: 31px;
    width: 29px;
}
.tishi_wx {
    float: left;
    line-height: 31px;
    margin: 0 20px;
    padding-top: 15px;
    width: 277px;
}
.tishi_dowload div, .tishi_wx div {
    float: left;
}
.tishi_download {
    line-height: 3px;
    padding-top: 15px;
}
.download {
    float: left;
    line-height: 23px;
    text-align: center;
    width: 72px;
}
.download a {
    background-position: 0 -279px;
    color: #333333;
    display: block;
    height: 23px;
    text-decoration: none;
    width: 72px;
}
.download a:hover {
    background-position: 0 -302px;
    height: 23px;
    text-decoration: none;
    width: 72px;
}
.tishi_cont {
    clear: left;
    line-height: 20px;
    width: 277px;
}
.tishi_dowload {
    float: left;
    line-height: 31px;
    margin: 0 10px;
    padding-top: 15px;
    width: 277px;
}
.tishi_tt {
    margin: 0 10px;
}
.xingcheng_topic {
    clear: both;
    height: 31px;
}
.xc_topic_left {
    float: left;
    width: 150px;
}
.xc_topic_right {
    float: left;
    height: 31px;
    width: 15px;
}
.xc_topic_mid {
    background-color: #3DB2D9;
    float: left;
    height: 31px;
    overflow: hidden;
    width: 700px;
}
.xingcheng {
    clear: both;
}
.share_right {
    background-position: -203px -229px;
    float: left;
    width: 143px;
}
.share_left, .print_left {
    background-position: -293px -129px;
    float: left;
    height: 22px;
    width: 12px;
}
.print_right {
    background-position: -357px -229px;
    float: left;
    width: 87px;
}
.xc_topic_share, .xc_topic_print {
    float: right;
    line-height: 23px;
    margin: 4px 5px;
}
.xc_topic_left {
    color: #FFFFFF;
    font-family: 微软雅黑;
    font-size: 18px;
    font-weight: normal;
    line-height: 31px;
}
.xingcheng_days li {
    background-image: url("http://images1.aoyou.cc/groupdetail/bg_10.gif");
    background-repeat: repeat-x;
    clear: both;
    margin-top: 15px;
}
li.firstday {
    background: none repeat scroll 0 0 transparent;
    margin-top: -40px;
}
.xingcheng_days h3 {
    background-position: -164px 0;
    color: #FF6600;
    float: left;
    font-size: 16px;
    height: 40px;
    line-height: 40px;
    margin: 25px 20px auto;
    padding-left: 7px;
    width: 68px;
}
.xingcheng_days_tt {
    float: left;
    line-height: 30px;
    margin-top: 30px;
}
.xingcheng_days_tt h4, .xingcheng_days_tt span {
    float: left;
}
.xingcheng_days_tt h4 {
    color: #333333;
    font-size: 16px;
    font-weight: bold;
}
.xingcheng_days_tt span {
    color: #666666;
    font-size: 14px;
    font-weight: normal;
}
.days_cont {
    clear: both;
    line-height: 20px;
    margin-left: 114px;
    width: 740px;
}
.days_cont_img {
    float: left;
    margin: 5px 0 10px;
}
.days_cont_img .imgs {
    color: #996633;
    float: left;
    line-height: 25px;
    margin-right: 10px;
    text-align: center;
    width: 360px;
}
.days_cont_main {
    clear: both;
}
.days_cont_main a {
    color: #136EC2;
    text-decoration: underline;
}
.days_cont_intro {
    background-color: #FFFAF2;
    border: 1px solid #FFCC99;
    color: #666666;
    float: left;
    line-height: 32px;
    margin: 10px 0;
    padding-left: 5px;
    width: 732px;
}
.days_cont_intro span {
    color: #666666;
    font-weight: bold;
}
.xingcheng_days ul {
    border: 1px solid #A1C4E4;
    margin-bottom: 15px;
    padding-bottom: 20px;
}
.days_cont_intro div {
    display: block;
    float: left;
    padding: 0 10px;
}
.others_info {
    border: 1px solid #E4E4E4;
    clear: both;
    margin-bottom: 14px;
}
.others_info ul {
    color: #1D89AF;
    font-size: 14px;
    font-weight: bold;
}
.others_info ul ol {
    color: #666666;
    font-size: 12px;
    font-weight: bold;
    line-height: 22px;
    margin: 15px 0;
}
.others_info ul ol li {
    color: #333333;
    font-size: 12px;
    font-weight: normal;
    line-height: 20px;
    list-style-position: outside;
    list-style-type: decimal;
    margin-left: 20px;
}
.others_info ol {
    padding-left: 20px;
    padding-right: 20px;
}
.others_info h4 {
    background-color: #EEEEEE;
    line-height: 30px;
    padding-left: 20px;
}
.others_info ol.gouwudian li {
    list-style-position: outside;
    list-style-type: none;
    margin: 0;
    padding: 0;
}
.print_icon {
    background-image: url("http://images1.aoyou.cc/bookprocess/bookprocess_img20.jpg");
    background-position: center center;
    float: left;
    height: 20px;
    margin-right: 4px;
    width: 20px;
}
.share_icon {
    background-image: url("http://images1.aoyou.cc/Images/index_2011_allpic.jpg");
    background-position: -416px -3px;
    float: left;
    height: 20px;
    margin-right: 4px;
    width: 26px;
}
.others_info ul ol.QTXX li {
    list-style-position: outside;
    list-style-type: none;
    margin: 0;
    padding: 0;
}
.xc_topic_right {
    background-image: url("http://images1.aoyou.cc/Images/index_2011_allpic.jpg");
    background-position: -712px -214px;
}
.xingcheng_days_every {
    color: #666666;
    padding: 15px 20px;
    text-align: right;
}
.xingcheng_days_tt span.fly_icon {
    color: #3DB2D9;
    margin-left: 20px;
}
.juli_icon {
    background-position: -295px 0;
    float: left;
    height: 17px;
    margin: 7px 5px auto 20px;
    width: 17px;
}
.zixun_img {
    float: left;
    padding: 0 0 0 19px;
}
.zixun_info {
    float: left;
    width: 345px;
}
.zixun_info_tt {
    font-weight: bold;
    margin-bottom: 7px;
    padding-left: 20px;
}
.zixun {
    padding-top: 21px;
}
.zixun_link ul {
    float: left;
    margin-left: 55px;
    width: 260px;
}
.zixun_link ul li {
    list-style-type: none;
}
.excitactiviti {
    float: left;
    padding-bottom: 19px;
    width: 875px;
}
.erro_tuijian_tt {
    background-image: url("http://images1.aoyou.cc/groupdetail/erro_03.gif");
    background-position: 0 5px;
    background-repeat: no-repeat;
    color: #333333;
    font-family: "微软雅黑";
    font-size: 18px;
    margin: -5px auto 10px 0;
    padding-left: 40px;
    position: relative;
}
.erro_tuijian_more {
    font-size: 14px;
    position: absolute;
    right: 10px;
    top: 5px;
}
.total_product {
    background: url("http://images1.aoyou.cc/Images/index_2011_img3.gif") repeat-x scroll center bottom transparent;
    color: #333333;
    float: left;
    padding: 10px 0;
}
.last_product {
    background: none repeat scroll 0 0 transparent;
}
.erro_list {
    border: 1px solid #D6E8EE;
    float: left;
    padding: 0 20px;
}
.content_content_allinformation {
    background-color: #FFFAF2;
    border: 1px solid #FFCC99;
    margin-top: 10px;
    overflow: hidden;
    padding: 12px 10px;
}
.erro_yd_tt {
    color: #666666;
    display: block;
    font-size: 16px;
    margin: 18px 0;
}
.content_content_allinformation_tt {
    color: #333333;
}
.erro_tuijian {
    height: 250px;
    min-height: 220px;
}
.erro_tuijian a {
    color: #0055AA;
    text-decoration: none;
}
.erro_tuijian a:hover {
    color: #FF6600;
    text-decoration: underline;
}
.zixun_info_cont {
    padding-left: 20px;
}
.zixun_info_cont a {
    color: #0055AA;
    text-decoration: none;
}
.zixun_info_cont a:hover {
    color: #FF6600;
    text-decoration: underline;
}
.zixun_link {
    color: #666666;
    line-height: 22px;
}
.xingcheng_days_tt span {
    font-weight: bold;
}
.sider_bar_tt {
    background-image: url("http://images1.aoyou.cc/groupdetail/nav_03.gif");
    font-family: "微软雅黑";
    font-size: 14px;
    height: 34px;
    line-height: 34px;
    text-align: center;
    width: 120px;
}
.sider_bar {
    display: inline-block;
    margin-left: 885px;
    margin-top: 0;
    padding: 0;
    position: fixed;
    top: 0;
    width: 120px;
    z-index: 100;
}
.sider_bar1 {
    display: inline-block;
    margin-left: 885px;
    padding: 0;
    position: absolute;
    top: 842px;
    width: 120px;
}
.sider_bar_cont ul li.ck a {
    background-color: #81CDE7;
    background-position: -405px -159px;
    color: #FFFFFF;
    display: block;
    font-weight: bold;
    line-height: 24px;
    padding-left: 30px;
    text-decoration: none;
}
.sider_bar_cont ul {
    background-image: url("http://images1.aoyou.cc/groupdetail/nav_06.gif");
    background-repeat: repeat-x;
}
.sider_bar_cont ul li {
    height: 30px;
}
.sider_bar_cont ul li a {
    background-position: -154px -145px;
    color: #333333;
    display: block;
    line-height: 24px;
    padding-left: 30px;
}
.ck .sider_bar_cont ul li a:hover {
    background-position: -164px -153px;
    display: block;
    line-height: 24px;
    padding-left: 30px;
}
.sider_bar_cont ul li a:hover {
    background-color: #81CDE7;
    background-position: -405px -159px;
    color: #FFFFFF;
    display: block;
    font-weight: bold;
    line-height: 24px;
    padding-left: 30px;
    text-decoration: none;
}
.gototop span a {
    background-position: 0 -150px;
    display: block;
    float: left;
    height: 28px;
    margin: 5px 2px auto 20px;
    width: 22px;
}
.gototop a {
    color: #864E17;
    line-height: 28px;
    text-decoration: none;
}
.gototop a:hover {
    color: #864E17;
    line-height: 28px;
    text-decoration: underline;
}
.kefu a {
    background-image: url("http://images1.aoyou.cc/groupdetail/kefu2_03.gif");
    display: block;
    height: 113px;
    width: 120px;
}
.kefu {
    float: right;
    height: 113px;
    margin-top: 13px;
    width: 120px;
}
.prozf_zfprice a {
    color: #0055AA;
    font-size: 12px;
    text-decoration: none;
}
.prozf_zfprice a:hover {
    color: #FF6600;
    text-decoration: underline;
}
.publish_wrapper {
    background-color: #FFFFFF;
    padding: 25px;
}
.publish_wrapper .post-box {
    height: auto;
}
.sharediv {
    margin-left: -302px;
    margin-top: -250px;
    width: 605px;
}
.jietu {
    margin-top: 10px;
    padding: 10px 10px 10px 0;
    text-align: center;
    width: 171px;
}
.jietu_top {
    background-image: url("http://images1.aoyou.cc/groupdetail/pop_10.gif");
    background-position: center center;
    background-repeat: no-repeat;
    height: 8px;
    width: 171px;
}
.jietu .imgwrapper {
    -moz-border-bottom-colors: none;
    -moz-border-left-colors: none;
    -moz-border-right-colors: none;
    -moz-border-top-colors: none;
    border-color: -moz-use-text-color #C9C9C9 #C9C9C9;
    border-image: none;
    border-right: 1px solid #C9C9C9;
    border-style: none solid solid;
    border-width: medium 1px 1px;
    padding-bottom: 18px;
    padding-top: 10px;
}
.post-box .post-textarea {
    width: 550px;
}
.publish_wrapper {
    padding-bottom: 0;
}
.post-box .post-title {
    background-position: 0 0;
}
.post-box .share-btn {
    background-position: 0 -80px;
}
.post-box .share-btn:hover {
    background-position: -104px -80px;
}
.post-box .share-btn-disable {
    background-position: -208px -80px;
    cursor: default;
}
.post-box .share-btn-disable:hover {
    background-position: -208px -80px;
    cursor: default;
}
.post-box .share-btn {
    cursor: pointer;
    height: 29px;
    outline: medium none;
    position: absolute;
    right: 0;
    text-indent: -9999px;
    top: 115px;
    width: 86px;
}
.ico-close-btn {
    background-image: url("http://images1.aoyou.cc//OutBoundGroup/close.gif");
}
.ico-close-btn {
    background-position: 0 0;
    height: 12px;
    width: 12px;
}
.ico-close-btn:hover {
    background-position: 0 0;
    height: 12px;
    width: 12px;
}
.win-pop .ico-close-btn {
    position: absolute;
    right: 5px;
    top: 5px;
}
.xingcheng .win-pop .ico-close-btn {
    position: absolute;
    right: 12px;
    top: 7px;
}
.win-pop .win-con .win-con-bg {
    background: none repeat scroll 0 0 #000000;
    height: 100%;
    left: 0;
    opacity: 0;
    position: absolute;
    top: 0;
    width: 100%;
    z-index: -1;
}
.xc_topic_mid a {
    color: #0055AA;
    margin-left: 32px;
}
.xc_topic_mid a:hover {
    color: #FF6600;
}
.tishi_cont {
    color: #666666;
}
.aoyounotice_tit {
    font-size: 14px;
    padding-left: 20px;
}
.productfeauture ul li.teshuyouhui {
    padding: 5px 0 10px;
}
.aoyounotice_block_more {
    padding-right: 15px;
}
.xingcheng_days h3 span {
    display: block;
    float: left;
    font-size: 16px;
    font-weight: normal;
    text-align: center;
    width: 18px;
}
.sider_bar_cont {
    -moz-border-bottom-colors: none;
    -moz-border-left-colors: none;
    -moz-border-right-colors: none;
    -moz-border-top-colors: none;
    border-color: -moz-use-text-color #D5D5D5;
    border-image: none;
    border-left: 1px solid #D5D5D5;
    border-right: 1px solid #D5D5D5;
    border-style: none solid;
    border-width: medium 1px;
}
.gototop {
    background-image: url("http://images1.aoyou.cc/groupdetail/nav_09.gif");
    background-repeat: no-repeat;
    height: 29px;
    width: 120px;
}
.tdprice_qi {
    color: #333333;
}
.mbnav {
    font-size: 12px;
    height: 31px;
    line-height: 31px;
    margin: auto;
    padding-left: 18px;
    width: 984px;
}
.mbnav a {
    color: #666666;
    text-decoration: none;
}
.mbnav a:hover {
    color: #FF6600;
    text-decoration: underline;
}
.f666666 {
    color: #666666;
}
.f3366cc {
    color: #3366CC;
}
.f0055aa {
    color: #0055AA;
}
.f333333 {
    color: #333333;
}
.ff6600 {
    color: #FF6600;
}
.tip360 {
    background: none repeat scroll 0 0 #FFFFFF;
    border: 1px solid #3398FF;
    color: #333333;
    font-size: 12px;
    margin-left: -198px;
    margin-top: -200px;
    overflow: hidden;
    position: absolute;
    width: 386px;
    z-index: 20002;
}
.tip360 img {
    border: medium none;
}
.tip_title {
    background: none repeat scroll 0 0 #D3E9FF;
    border: 1px solid #FFFFFF;
    font-weight: bold;
    height: 26px;
    line-height: 26px;
}
.inner_tip_title {
    margin: 0 8px auto 20px;
}
.tip_title span {
    cursor: pointer;
    float: right;
    margin-top: 6px;
}
.tip_submit {
    border-top: 1px solid #E1E1E1;
    height: 61px;
    margin: 16px 20px auto;
    text-align: center;
}
span.specialborder {
    background-color: #E3E3DF;
    border: 1px solid #CCCCCC;
    color: #2D2B2B;
    display: block;
    height: 29px;
    margin: 16px auto;
    width: 106px;
}
span.specialborder input {
    background: none repeat scroll 0 0 transparent;
    border: 0 none;
    height: 29px;
    padding: 0;
    text-align: center;
    width: 106px;
}
th {
    font-weight: 400;
}
.tip_content {
    line-height: 21px;
    margin: 10px 24px;
}
.lc_left {
    background-image: url("http://images1.aoyou.cc/Bookprocess/fq_05.gif");
    background-position: 0 0;
    background-repeat: no-repeat;
    display: block;
    float: left;
    height: 23px;
    line-height: 23px;
    width: 3px;
}
.lc_right {
    background-image: url("http://images1.aoyou.cc/Bookprocess/fq_05.gif");
    background-position: -3px 0;
    background-repeat: no-repeat;
    display: block;
    float: left;
    height: 23px;
    line-height: 23px;
    width: 3px;
}
.lc_center {
    background-color: #EBE8C9;
    display: block;
    float: left;
    height: 23px;
    line-height: 23px;
}
.lc {
    display: block;
    float: left;
    height: 23px;
    line-height: 23px;
}
.aa {
    padding: 0 7px;
}
.riqi {
    padding-bottom: 10px;
}
.riqi_chufa {
    float: left;
}
.riqi_chufa span {
    float: left;
    margin-right: 15px;
}
.riqi_chufa input {
    border: 1px solid #B3C3DD;
    float: left;
    height: 21px;
    line-height: 20px;
    margin-left: 5px;
}
.riqi_huicheng {
    float: right;
}
.tip360 .xx_price ul {
    background-color: #FFFFFF;
    float: left;
    margin: 10px 0;
}
.tip360 .xx_btn {
    background-color: #EFF9FD;
    clear: both;
    float: none;
    padding: 15px 80px;
}
.xx_btn a {
    background-position: -453px -278px;
    color: #333333;
    display: block;
    font-size: 18px;
    font-weight: bold;
    height: 44px;
    line-height: 44px;
    margin: 0 auto;
    padding-left: 55px;
    text-decoration: none;
    width: 86px;
}
.xx_btn a:hover {
    background-position: -453px -234px;
    display: block;
    text-decoration: none;
}
.closeimg {
    height: 12px;
    left: 405px;
    position: absolute;
    top: 5px;
    width: 12px;
    z-index: 1000;
}
.jieri_icon, .icon_1, .icon_2, .icon_3, .icon_4, .icon_5 {
    float: left;
}
.jieri_icon span, .icon_1 span, .icon_2 span, .icon_3 span, .icon_4 span, .icon_5 span {
    background-image: url("http://images1.aoyou.cc/groupdetail/icon_02.gif");
    background-repeat: no-repeat;
    display: block;
    height: 19px;
}
span.icon_left {
    width: 5px;
}
span.icon_right {
    height: 1%;
    margin: 0;
    padding-right: 5px;
    width: auto;
}
.jieri_icon span.icon_left {
    background-position: 0 0;
}
.jieri_icon span.icon_right {
    background-position: right 0;
}
.icon_1 span.icon_left {
    background-position: 0 -19px;
}
.icon_1 span.icon_right {
    background-position: right -19px;
}
.icon_2 span.icon_left {
    background-position: 0 -38px;
}
.icon_2 span.icon_right {
    background-position: right -38px;
}
.icon_3 span.icon_left {
    background-position: 0 -57px;
}
.icon_3 span.icon_right {
    background-position: right -57px;
}
.icon_4 span.icon_left {
    background-position: 0 -76px;
}
.icon_4 span.icon_right {
    background-position: right -76px;
}
.icon_5 span.icon_left {
    background-position: 0 -95px;
}
.icon_5 span.icon_right {
    background-position: right -95px;
}

    </style>
</head>
<body>
   <form id="form1" runat="server">
    <!--div id="pagemasker"></div><div id="dialog"></div-->
    <div class="wrapper" >
        <uc1:_head ID="_head1" runat="server" />
        <div class="content">
            <div class="linenumber_detail">
				<span style="float:left; display:block;margin-top:8px">您的位置：<a href="#" title="<%=p.ClassName.Trim() %>"><%=p.ClassName.Trim() %></a> => <a href="#" title="<%=p._field["tar_prov"].ToString().Trim()%>"><%=p._field["tar_prov"].ToString().Trim()%></a> => <a href="#" title="<%=p._field["tar_city"].ToString().Trim()%>"><%=p._field["tar_city"].ToString().Trim()%></a></span>
				
			</div>
            <div class="linename_detail">
				<span><%=p._field["tar_title"].ToString().Trim() %></span>
			</div>
			<div class="con1">

				<div class="con1-left">
					<div class="focus_pic">
                        <img src="<%=p.ImageUrl %>" width="480" height="270"  />
                    </div>
                    <div id="dtl_info" style="background:#f6fcfc; width:92%; padding:10px" >
                        <table width="100%" border="0" cellpadding = "5" cellspacing ="5">
                            <tr>
                                <td align="right" class="auto-style2" style="font-family: 微软雅黑; font-size:small ; color: #5FB6E1;"><strong>出发城市：</strong></td>
                                <td align="left"  style="font-family: 微软雅黑; font-size:small ; color: #5FB6E1;text-wrap:none"  ><%=p._field["tar_startcity"].ToString().Trim() %></td>
                                <td align="right" class="auto-style3" style="font-family: 微软雅黑; font-size:small ; color: #5FB6E1;" ><strong>旅行天数：</strong></td>
                                <td align="left" style="font-family: 微软雅黑; font-size:small ; color: #5FB6E1;"  ><%=p._field["tar_days"].ToString().Trim() %></td>
                            </tr>
                            <tr>
                                <td align="right" valign="top" class="auto-style2" style="font-family: 微软雅黑; font-size:small ; color: #5FB6E1;" ><strong>交通安排：</strong></td>
                                <td align="left" valign="top"  style="font-family: 微软雅黑; font-size:small ; color: #5FB6E1;text-wrap:none;"  ><%=p._field["tar_airline"].ToString().Trim() %></td>
                                <td align="right" valign="top" class="auto-style3" style="font-family: 微软雅黑; font-size:small ; color: #5FB6E1;" ><strong>线路性质：</strong></td>
                                <td align="left" valign="top" style="font-family: 微软雅黑; font-size:small ; color: #5FB6E1;"  >品质游</td>
                            </tr>
                            <tr>
                                <td colspan="4" style="font-family: 微软雅黑; font-size:medium ; color: #5FB6E1;">&nbsp;&nbsp;<strong>预计价格</strong>&nbsp;&nbsp;&nbsp;&nbsp;<%if (p._field["tar_abroad"].ToString().Equals("0")) 
                                      {
                                          
                            int i = 0;
              if (int.Parse(p._field["tar_price"].ToString().Trim()) > 0)
            { %>
            <font style="font-family: 微软雅黑; font-size:medium ; color: #5FB6E1;"  >双飞：</font><font color="red" style="font-family: 微软雅黑; font-size:medium ; "  ><b><%=p._field["tar_price"].ToString().Trim()%></b></font><font style="font-family: 微软雅黑; color: #5FB6E1;" >元</font> &nbsp;
            <%
                i++;
            } %>
            <%if (int.Parse(p._field["tar_price2"].ToString().Trim()) > 0)
              { %>
            <font style="font-family: 微软雅黑; font-size:medium ; color: #5FB6E1;"  >飞卧：</font><font color="red" style="font-family: 微软雅黑; font-size:medium ;"  ><b><%=p._field["tar_price2"].ToString().Trim()%></b></font><font style="font-family: 微软雅黑; color: #5FB6E1;" >元</font> &nbsp;
            <%
                  i++;
            }
                            //if (i == 1)
                              //  Response.Write("<br/>");
            %>
            <%if (int.Parse(p._field["tar_price3"].ToString().Trim()) > 0)
              { %>
            <font style="font-family: 微软雅黑; font-size:medium ; color: #5FB6E1;"  >卧飞：</font><font color="red" style="font-family: 微软雅黑; font-size:medium ; "  ><b><%=p._field["tar_price3"].ToString().Trim()%></b></font><font style="font-family: 微软雅黑; color: #5FB6E1;" >元</font> &nbsp;
            <%
                  i++;
            }
                            //if (i == 1)
                            //    Response.Write("<br/>");
             %>
            <%if (int.Parse(p._field["tar_price4"].ToString().Trim()) > 0)
              { %>
            <font style="font-family: 微软雅黑; font-size:medium ; color: #5FB6E1;"  >双卧：</font><font color="red" style="font-family: 微软雅黑; font-size:medium ; "  ><b><%=p._field["tar_price4"].ToString().Trim()%></b></font><font style="font-family: 微软雅黑; color: #5FB6E1;" >元</font> &nbsp;
            <%
                  i++;
            } 
                                    }
                                    else
                                    {
                                      %>
                                    <font color="red" style="font-family: 微软雅黑; font-size:medium ; "  ><b><%=p.RefPrice.ToString() %></b></font><font style="font-family: 微软雅黑; font-size:medium ; color: #5FB6E1;"  >元<%=(p.MultiPrice?"起":"") %></font>
                                    <%
                                      }
                                         %></td>
                            </tr>
                            <!--tr>
                                <td colspan="4" >
                                    <%if (p._field["tar_abroad"].ToString().Equals("0")) 
                                      {
                                          
                            int i = 0;
              if (int.Parse(p._field["tar_price"].ToString().Trim()) > 0)
            { %>
            <font style="font-family: 微软雅黑; font-size:medium ; color: #5FB6E1;"  >双飞：</font><font color="red" style="font-family: 微软雅黑; font-size:medium ; "  ><b><%=p._field["tar_price"].ToString().Trim()%></b></font><font style="font-family: 微软雅黑; color: #5FB6E1;" >元</font> &nbsp;
            <%
                i++;
            } %>
            <%if (int.Parse(p._field["tar_price2"].ToString().Trim()) > 0)
              { %>
            <font style="font-family: 微软雅黑; font-size:medium ; color: #5FB6E1;"  >飞卧：</font><font color="red" style="font-family: 微软雅黑; font-size:medium ;"  ><b><%=p._field["tar_price2"].ToString().Trim()%></b></font><font style="font-family: 微软雅黑; color: #5FB6E1;" >元</font> &nbsp;
            <%
                  i++;
            }
                            //if (i == 1)
                              //  Response.Write("<br/>");
            %>
            <%if (int.Parse(p._field["tar_price3"].ToString().Trim()) > 0)
              { %>
            <font style="font-family: 微软雅黑; font-size:medium ; color: #5FB6E1;"  >卧飞：</font><font color="red" style="font-family: 微软雅黑; font-size:medium ; "  ><b><%=p._field["tar_price3"].ToString().Trim()%></b></font><font style="font-family: 微软雅黑; color: #5FB6E1;" >元</font> &nbsp;
            <%
                  i++;
            }
                            //if (i == 1)
                            //    Response.Write("<br/>");
             %>
            <%if (int.Parse(p._field["tar_price4"].ToString().Trim()) > 0)
              { %>
            <font style="font-family: 微软雅黑; font-size:medium ; color: #5FB6E1;"  >双卧：</font><font color="red" style="font-family: 微软雅黑; font-size:medium ; "  ><b><%=p._field["tar_price4"].ToString().Trim()%></b></font><font style="font-family: 微软雅黑; color: #5FB6E1;" >元</font> &nbsp;
            <%
                  i++;
            } 
                                    }
                                    else
                                    {
                                      %>
                                    <font color="red" style="font-family: 微软雅黑; font-size:medium ; "  ><b><%=p.RefPrice.ToString() %></b></font><font style="font-family: 微软雅黑; font-size:medium ; color: #5FB6E1;"  >元<%=(p.MultiPrice?"起":"") %></font>
                                    <%
                                      }
                                         %>
                                </td>
                            <tr-->
                        </table>
                    </div>
				</div>
				<div class="con1-right">





                    <div class="pro_cal">
                        <table width="432" cellspacing="0" cellpadding="0" border="0">
                            <tbody>
                                <tr>
                                    <td class="monthsTd" colspan="7">
                                        <%
                                            DateTime nowDate = DateTime.Now;
                                            int monthId = 0;
                                             %>
                                        <div class="months_now"   >
                                            <div class="months_pre"></div>
                                            <div class="months_num"><a onclick="getpricecalendar(<%=Request["id"].Trim() %>,<%=nowDate.Year.ToString() %>,<%=nowDate.Month.ToString() %>); changemonthclass(this,'year<%=monthId %>');" href="javascript:void(0)" id="month<%=monthId %>"><span style="display" id="year<%=monthId %>"><%=nowDate.Year.ToString() %>年</span><span><%=nowDate.Month.ToString() %></span>月</a></div>
                                        </div>
                                        <%
                                            monthId++;
                                            nowDate = nowDate.AddMonths(1);
                                             %>
                                        <div class="months"  >
                                            <div class="months_pre"></div>
                                            <div class="months_num"><a onclick="getpricecalendar(<%=Request["id"].Trim() %>,<%=nowDate.Year.ToString() %>,<%=nowDate.Month.ToString() %>);changemonthclass(this,'year<%=monthId %>');" href="javascript:void(0)" id="month<%=monthId %>"><span style="display:none" id="year<%=monthId %>">2013年</span><span><%=nowDate.Month.ToString() %></span>月</a></div>
                                        </div>
                                        <%
                                            if (p._field["tar_abroad"].ToString().Trim().Equals("1"))
                                            {
                                            monthId++;
                                            nowDate = nowDate.AddMonths(1);
                                             %>
                                        <div class="months" >
                                            <div class="months_pre"></div>
                                            <div class="months_num"><a onclick="getpricecalendar(<%=Request["id"].Trim() %>,<%=nowDate.Year.ToString() %>,<%=nowDate.Month.ToString() %>);changemonthclass(this,'year<%=monthId %>');" href="javascript:void(0)" id="month<%=monthId %>"><span style="display:none" id="year<%=monthId %>">2013年</span><span><%=nowDate.Month.ToString() %></span>月</a></div>
                                        </div>
                                        <%
                                            monthId++;
                                            nowDate = nowDate.AddMonths(1);
                                             %>
                                        <div class="months" >
                                            <div class="months_pre"></div>
                                            <div class="months_num"><a onclick="getpricecalendar(<%=Request["id"].Trim() %>,<%=nowDate.Year.ToString() %>,<%=nowDate.Month.ToString() %>);changemonthclass(this,'year<%=monthId %>');" href="javascript:void(0)" id="month<%=monthId %>"><span style="display:none" id="year<%=monthId %>">2013年</span><span><%=nowDate.Month.ToString() %></span>月</a></div>
                                        </div>
                                        <%} %>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                        <div style="vertical-align: middle; text-align: center; width: 380px; position: absolute; height: 386px; background: url(http://images1.aoyou.cc/Images/loading1.gif) no-repeat scroll center center rgb(255, 255, 255); border: 1px solid rgb(255, 204, 0); line-height: 50px; font-size: 14px; padding-left: 50px; display: none;" id="divloadingr">
                            正在载入价格日历请稍候 ...
                        </div>
                        <div style="display: none" class="popup" id="pricedetailblock">
                            <div style="vertical-align: middle; text-align: center; width: 68px;
                                position: absolute; height: 120px; background: url(http://images1.aoyou.cc/Images/loading1.gif) no-repeat #FFF;
                                background-position: center; border: 1px solid #FC0; line-height: 50px; font-size: 14px;
                                padding-left: 50px; display: block" class="popup_price">
                                正在载入价格信息 ...
                            </div>
                            <div style="vertical-align: middle; text-align: center; width: 260px;
                                height: 386px; position: absolute; background: url(http://images1.aoyou.cc/Images/loading1.gif) no-repeat #FFF;
                                background-position: center; border: 1px solid #FC0; line-height: 50px; font-size: 14px;
                                padding-left: 50px; display: block" class="popup_xx">
                                正在载入价格信息 ...
                            </div>
                        </div>
                        <div class="popup" id="pricedetail"></div>
                        <table cellspacing="0" cellpadding="0" border="0" id="tabPriceL" class="cal">
                            <tbody>
                                <tr class="xq_xingqi">
                                    <td width="70">星期日</td>
                                    <td width="70">星期一</td>
                                    <td width="70">星期二</td>
                                    <td width="70">星期三</td>
                                    <td width="70">星期四</td>
                                    <td width="70">星期五</td>
                                    <td width="70">星期六</td>
                                </tr>
                                <tr class="xq_day">
                                    <td class="today">
                                        <div id="blankTagDateL1"></div>
                                        <div id="blankTagValueL1"></div>
                                    </td>
                                    <td class="dateshow">
                                        <div id="blankTagDateL2">1</div>
                                    </td>
                                    <td class="dateshow">
                                        <div id="blankTagDateL3">2</div>
                                    </td>
                                    <td class="dateshow">
                                        <div id="blankTagDateL4">3</div>
                                    </td>
                                    <td class="dateshow">
                                        <div id="blankTagDateL5">4</div>
                                    </td>
                                    <td class="dateshow">
                                        <div id="blankTagDateL6">5</div>
                                    </td>
                                    <td class="today">
                                        <div id="blankTagDateL7">6</div>
                                    </td>
                                </tr>
                                <tr class="xq_day">
                                    <td class="today">
                                        <div id="blankTagDateL8">7</div>
                                    </td>
                                    <td class="dateshow">
                                        <div id="blankTagDateL9">8</div>
                                    </td>
                                    <td class="dateshow">
                                        <div id="blankTagDateL10">9</div>
                                    </td>
                                    <td class="dateshow">
                                        <div id="blankTagDateL11">10</div>
                                    </td>
                                    <td class="dateshow">
                                        <div id="blankTagDateL12">11</div>
                                    </td>
                                    <td class="dateshow">
                                        <div id="blankTagDateL13">12</div>
                                    </td>
                                    <td class="tdNow" style="background-color: rgb(243, 224, 155);">
                                        <div id="blankTagDateL14">13</div>
                                        <div id="blankTagValueL14"><div class="kucun"><span>&lt;9个</span></div><div class="tdPrice ff2a00 ar">¥10980</div></div>
                                    </td>
                                </tr>
                                <tr class="xq_day">
                                    <td class="today">
                                        <div id="blankTagDateL15">14</div>
                                    </td>
                                    <td class="dateshow">
                                        <div id="blankTagDateL16">15</div>
                                    </td>
                                    <td class="dateshow">
                                        <div id="blankTagDateL17">16</div>
                                    </td>
                                    <td class="dateshow">
                                        <div id="blankTagDateL18">17</div>
                                    </td>
                                    <td class="dateshow">
                                        <div id="blankTagDateL19">18</div>
                                    </td>
                                    <td class="dateshow">
                                        <div id="blankTagDateL20">19</div>
                                    </td>
                                    <td class="today">
                                        <div id="blankTagDateL21">20</div>
                                    </td>
                                </tr>
                                <tr class="xq_day">
                                    <td class="today">
                                        <div id="blankTagDateL22">21</div>
                                    </td>
                                    <td class="dateshow">
                                        <div id="blankTagDateL23">22</div>
                                    </td>
                                    <td class="dateshow">
                                        <div id="blankTagDateL24">23</div>
                                    </td>
                                    <td class="dateshow">
                                        <div id="blankTagDateL25">24</div>
                                    </td>
                                    <td class="dateshow">
                                        <div id="blankTagDateL26">25</div>
                                    </td>
                                    <td class="dateshow">
                                        <div id="blankTagDateL27">26</div>
                                    </td>
                                    <td class="today">
                                        <div id="blankTagDateL28">27</div>
                                        <div id="blankTagValueL28"><div style="line-height:16px" class="tdStat"><span>已售罄</span></div><div style="color:#666666" class="tdPrice ff2a00 ar">¥10980</div></div>
                                    </td>
                                </tr>
                                <tr class="xq_day">
                                    <td class="today">
                                        <div id="blankTagDateL29">28</div>
                                    </td>
                                    <td class="dateshow">
                                        <div id="blankTagDateL30">29</div>
                                    </td>
                                    <td class="dateshow">
                                        <div id="blankTagDateL31">30</div>
                                    </td>
                                    <td class="dateshow">
                                        <div id="blankTagDateL32">31</div>
                                    </td>
                                    <td class="dateshow">
                                        <div id="blankTagDateL33"></div>
                                        <div id="blankTagValueL33"></div>
                                    </td>
                                    <td class="dateshow">
                                        <div id="blankTagDateL34"></div>
                                        <div id="blankTagValueL34"></div>
                                    </td>
                                    <td class="today">
                                        <div id="blankTagDateL35"></div>
                                        <div id="blankTagValueL35"></div>
                                    </td>
                                </tr>
                                <tr class="xq_day">
                                    <td class="today">
                                        <div id="blankTagDateL36"></div>
                                        <div id="blankTagValueL36"></div>
                                    </td>
                                    <td class="dateshow">
                                        <div id="blankTagDateL37"></div>
                                        <div id="blankTagValueL37"></div>
                                    </td>
                                    <td class="dateshow">
                                        <div id="blankTagDateL38"></div>
                                        <div id="blankTagValueL38"></div>
                                    </td>
                                    <td class="dateshow">
                                        <div id="blankTagDateL39"></div>
                                        <div id="blankTagValueL39"></div>
                                    </td>
                                    <td class="dateshow">
                                        <div id="blankTagDateL40"></div>
                                        <div id="blankTagValueL40"></div>
                                    </td>
                                    <td class="dateshow">
                                        <div id="blankTagDateL41"></div>
                                        <div id="blankTagValueL41"></div>
                                    </td>
                                    <td class="today">
                                        <div id="blankTagDateL42"></div>
                                        <div id="blankTagValueL42"></div>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                    <!--div  style="width:100%" ><br />
                        <div style="background-color: #FFFF99; border-width:medium; height:50px; padding:10px; border-color: #F7B453; width:90%"><font color="red" ><strong>景点：</strong></font><font color="#AA5222" ><%=p._field["tar_sights"].ToString().Trim() %></font></div>
                    </div-->
				</div>
			</div>
			<a name="xingchengtop"></a>
			<h5 class="xctese"><img src="jic/img/pub/tese.gif" alt=""></h5>
			<ul class="baozhang">				
				<li><%=p._field["tar_intro"].ToString().Trim().Replace("：", "：<br>").Replace("！", "！<br>").Replace("。", "。<br>")%></li>
			</ul>
			
			<div style="margin-top: 10px;" id="line_trip_man">
 
			<div id="line_pay" name="line_trip" class="fysm">
				<h2>行程安排</h2>
                <p><%=p._field["tar_triplist"].ToString().Trim() %></p>
            </div>
            
            <div id="Div2" name="line_trip" class="fysm">
				<h2>服务标准</h2>
                <p><%=p._field["tar_level"].ToString().Trim() %></p>
            </div>
            
            <div id="Div3" name="line_trip" class="fysm">
				<h2>自费项目</h2>
                <p><%=p._field["tar_fee"].ToString().Trim() %></p>
            </div>
            
            <div id="Div4" name="line_trip" class="fysm">
				<h2>购物</h2>
                <p><%=p._field["tar_shopping"].ToString().Trim() %></p>
            </div>
            
            <div id="Div5" name="line_trip" class="fysm">
				<h2>友情提示</h2>
                <p><%=p._field["tar_memo"].ToString().Trim() %></p>
            </div>
      
	</div>
		</div>
    </div>
	 <uc2:_tail ID="_tail1" runat="server" />
    </form>
</body>
</html>
