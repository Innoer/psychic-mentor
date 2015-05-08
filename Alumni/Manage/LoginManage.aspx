<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LoginManage.aspx.cs" Inherits="Alumni.Manage.LoginManage" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">

    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>欢迎使用后台管理系统</title>
<link href="css/main_login.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="js/Jikey.js"></script>
<script type="text/javascript">
    window.onload = function () {
        J.onBlurText('uname');
        J.onBlurText('pwd');
    }
</script>

</head>
<body>
    <form id="form1" runat="server">
        
		<div id="main">
  <div id="wrapper">
   
      <div id="sys_name">校友会后台管理系统</div>
      <ul id="cont">
        <li>
          <label class="lb" for="uname">用户名</label>
          <input name="username" id="url1" type="text" class="ip" value="请输入用户名" runat="server" maxlength="18" onclick="this.value = ''" />
        </li>
        <li>
          <label class="lb" for="pwd">密码</label>
          <input name="password" id="url2" type="password" class="ip" value="密码" runat="server" maxlength="50" onclick="this.value = ''" />
        </li>
        <li><span>
            <asp:ImageButton ID="ImageButton1" runat="server" 
                ImageUrl="~/Manage/images/ente.png" onclick="ImageButton1_Click" />
            </span></li>
        </ul>
        <p id="copy">Version 2.0 Copyright<a href="../Default.aspx" /> 哈尔滨工业大学（威海）校友网</p>

        </div>
    </div>
    <div>
    <asp:Label ID="Label1" runat="server" ForeColor="Red"></asp:Label>
                                        <asp:DropDownList ID="DropDownList1" runat="server" Visible="False">
                                        </asp:DropDownList>
                                        </div>
    </form>
    
</body>
</html>
