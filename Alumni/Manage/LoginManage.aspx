<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LoginManage.aspx.cs" Inherits="Alumni.Manage.LoginManage" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>网站后台管理系统_管理员登录</title>
    <style type="text/css">
        body
        {
            margin-left: 0px;
            margin-top: 0px;
            margin-right: 0px;
            margin-bottom: 0px;
            
            overflow: hidden;
        }
        .STYLE1
        {
            color: #000000;
            font-size: 12px;
        }
        .style1
        {
            width: 326px;
        }
        .style2
        {
            width: 270px;
        }
        .style3
        {
            width: 57%;
        }
        .style4
        {
            width: 27%;
        }
        .style5
        {
            width: 56px;
        }
        .style6
        {
            width: 31%;
        }
        .style7
        {
            width: 358px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <table width="100%" height="100%" border="0" cellpadding="0" cellspacing="0">
        <tr>
            <td>
                <table border="0" align="center" cellpadding="0" cellspacing="0" 
                    style="width: 964px">
                    <tr>
                        <td height="235" >
                            &nbsp;<br />
                            <br />
                            <br />
                            <br />
                            <br />
                            <br />
                            <br />
                            <br />
                            <br />
                            <br />
                            <br />
                            <br />
                            <br />
                            <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <asp:Label ID="Label2" runat="server" Font-Size="25px" Text="后台管理系统"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td height="53">
                            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                <tr>
                                    <td height="53" class="style1">
                                        &nbsp;
                                    </td>
                                    <td  class="style2">
                                        <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                            <tr>
                                                <td height="25" class="style6">
                                                    <div align="right">
                                                        <span class="STYLE1">用户</span></div>
                                                </td>
                                                <td height="25" class="style3">
                                                    <div align="center">
                                                        &nbsp;<asp:TextBox ID="TextBox1" runat="server" Height="17px" Width="105px"></asp:TextBox>
                                                    </div>
                                                </td>
                                                <td height="25" class="style5">
                                                    &nbsp;
                                                </td>
                                            </tr>
                                            <tr>
                                                <td height="25" class="style6">
                                                    <div align="right">
                                                        <span class="STYLE1">密码</span></div>
                                                </td>
                                                <td height="25" class="style3">
                                                    <div align="center">
                                                        &nbsp;<asp:TextBox ID="TextBox2" runat="server" Height="17px" TextMode="Password"
                                                            Width="105px"></asp:TextBox>
                                                    </div>
                                                </td>
                                                <td height="25" class="style5">
                                                    <div align="left">
                                                        <asp:Button ID="Button1" runat="server" Text="登陆" BorderColor="White" OnClick="Button1_Click"
                                                            Style="margin-left: 0px; height: 21px;" Width="40px" />
                                                    </div>
                                                </td>
                                                <td height="25" class="style4">
                                                    <div align="left">
                                                        <asp:Button ID="Button2" runat="server" Text="重置" BorderColor="White" OnClick="Button2_Click"
                                                            Style="margin-left: 0px" />
                                                    </div>
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                    <td  class="style7">
                                        <asp:Label ID="Label1" runat="server" ForeColor="Red"></asp:Label>
                                        <asp:DropDownList ID="DropDownList1" runat="server" Visible="False">
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td height="213">
                            &nbsp;
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    </div>
    </form>
</body>
</html>
