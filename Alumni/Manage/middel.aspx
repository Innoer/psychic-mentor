<%@ Page Language="C#" AutoEventWireup="true" CodeFile="middel.aspx.cs" Inherits="admin_middel" %>

<!doctype HTML public "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <title>无标题文档</title>
    <style type="text/css">
        .body
        {
            margin-left: 0px;
            margin-top: 0px;
            margin-right: 0px;
            margin-bottom: 0px;
        }
    </style>
    <style type="text/css">
        .navPoint
        {
            color: white;
            cursor: hand;
            font-family: Webdings;
            font-size: 9pt;
        }
        #leftContainer
        {
            height: 458px;
        }
    </style>

    <script type="text/javascript">
        function switchSysBar() {
            var locate = location.href.replace('middel.html', '');
            var ssrc = document.all("img1").src.replace(locate, '');
            if (ssrc == "images/main_55.gif") {
                document.all("img1").src = "images/main_55_1.gif";
                document.all("frmTitle").style.display = "none"
            }
            else {
                document.all("img1").src = "images/main_55.gif";
                document.all("frmTitle").style.display = ""
            }
        } 
    </script>

</head>
<body style="overflow: hidden">
    <table border="0" cellpadding="0" cellspacing="0" 
        
        style="table-layout: fixed; margin-left:-8px; margin-top: -12px; height: 100%; width: 100%;" 
        bgcolor="#E6EDF8">
        <tr>
            <td width="171" id="frmTitle" nowrap name="fmTitle" align="center" valign="top">
                <table width="171" border="0" cellpadding="0" cellspacing="0" 
                    style="table-layout: fixed; height: 465px;">
                    <tr>
                        <td bgcolor="#1873aa" style="width: 6px;">
                            &nbsp;
                        </td>
                        <td width="165">
                            <iframe name="I1" width="165" height="100%" id="leftContainer" src="left.aspx" border="0"
                                frameborder="0"  height="5000">浏览器不支持嵌入式框架，或被配置为不显示嵌入式框架。</iframe>
                        </td>
                    </tr>
                </table>
            </td>
            <td width="6" style="width: 6px;" valign="middle" bgcolor="1873aa" onclick="switchSysBar()">
                <span class="navPoint" id="switchPoint" title="关闭/打开左栏">
                   </span>
            </td>
            <td width="100%" align="center" valign="top">
                <iframe id="mainContent" name="I2" height="100%" width="100%" border="0" frameborder="0"
                    src="come.htm">浏览器不支持嵌入式框架，或被配置为不显示嵌入式框架。</iframe>
            </td>
        </tr>
    </table>
</body>
</html>
