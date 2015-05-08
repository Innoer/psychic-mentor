<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="middel.aspx.cs" Inherits="admin_middel" %>

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
            height: 468px;
        }
        .style1
        {
            width: 20px;
        }
        .style2
        {
            width: 10px;
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
        
        style="table-layout: fixed; margin-left:-8px; margin-top: -12px; height: 100%; width: 100%; background-color: #FFFFFF;" 
        >
        <tr>
            <td width="171" id="frmTitle" nowrap name="fmTitle" align="center" valign="top">
                <table width="171" border="0" cellpadding="0" cellspacing="0" 
                    style="table-layout: fixed; height: 100%; background-color: #FFFFFF;">
                    <tr>
                        <td bgcolor="White" class="style2">
                            &nbsp;
                        </td>
                        <td width="165">
                            <iframe name="I1" height= 100% width="165" id="leftContainer" src="left1.aspx" border="0"
                                frameborder="0" style="background-color: #FFFFFF">浏览器不支持嵌入式框架，或被配置为不显示嵌入式框架。</iframe>
                        </td>
                    </tr>
                </table>
            </td>
            <td valign="middle" bgcolor="White" onclick="switchSysBar()" class="style1">
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
