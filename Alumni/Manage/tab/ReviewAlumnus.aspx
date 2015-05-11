<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ReviewAlumnus.aspx.cs" Inherits="Alumni.Manage.tab.ReviewAlumnus" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>

<!-- viewport的<meta>标签，这个标签可以修改在大部分的移动设备上面的显示，为了确保适当的绘制和触屏缩放。-->

<title></title>

<!--样式文件引用-->
<style type="text/css">
        .style1
        {
            width: 100%;
        }
        .style2
        {
            width: 20%;
            height: 25px;
        }
        .style3
        {
            width: 30%;
            height: 25px;
        }
        </style>
<link href="../bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css">
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <br />
    <asp:Label ID="Label11" runat="server" Text="当前位置：校友管理&gt;&gt;审核校友" 
            Font-Size="10pt"></asp:Label>
        <br />
        <asp:Image ID="Image5" runat="server" Height="1px" Width="97%" 
            BackColor="Blue" />
        <br />
        <br />
    </div>
    <div>
    
        
    
        <asp:Label ID="Label1" runat="server" Text="请输入校友姓名："></asp:Label>
&nbsp;<asp:TextBox ID="TextBox1" runat="server" style="text-align: left"></asp:TextBox>
&nbsp;
        &nbsp;<asp:Label ID="Label2" runat="server" Text="校友专业："></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:DropDownList ID="DropDownList1" 
            runat="server" >
        </asp:DropDownList>
&nbsp;&nbsp;&nbsp;<asp:Label ID="Label3" runat="server" Text="校友入学时间："></asp:Label>
&nbsp;<asp:DropDownList ID="TimeDownList" runat="server">
        </asp:DropDownList>
        &nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="SearchButton" runat="server" onclick="SearchButton_Click" 
            Text="确认查询" />
        <br />
        <asp:GridView ID="GridView1" runat="server" CellPadding="3" 
            EnableModelValidation="True" GridLines="None" 
            Width="100%" AutoGenerateColumns="False" BackColor="White" 
            BorderColor="White" BorderStyle="Ridge" BorderWidth="2px" CellSpacing="1" 
            DataKeyNames="UserID" 
            onselectedindexchanged="GridView1_SelectedIndexChanged" 
            onrowdeleting="GridView1_RowDeleting" PageSize="15" AllowPaging="True" 
            onpageindexchanging="GridView1_PageIndexChanging">
            <Columns>
                
                <asp:BoundField DataField="Name" HeaderText="校友名" SortExpression="Name" />
                <asp:BoundField DataField="Sex" HeaderText="性别" SortExpression="Sex" />
                <asp:BoundField DataField="BirthDate" DataFormatString="{0:yyyy-MM-dd}" HeaderText="生日" 
                    SortExpression="BirthDate" />
                <asp:BoundField DataField="ProvinceName" HeaderText="所在省" 
                    SortExpression="ProvinceName" />
                <asp:BoundField DataField="CityName" HeaderText="所在市" 
                    SortExpression="CityName" />
                <asp:BoundField DataField="ClassNo" HeaderText="班号" SortExpression="ClassNo" />
                <asp:BoundField DataField="StudentNo" HeaderText="学号" 
                    SortExpression="StudentNo" />
                <asp:BoundField DataField="EnrollYear" HeaderText="入学年份" 
                    SortExpression="EnrollYear" />
                <asp:BoundField DataField="SchoolName" HeaderText="入学院系" 
                    SortExpression="SchoolName" />
                <asp:ButtonField CommandName="select" Text="查看" ButtonType="Link" 
                                HeaderText="具体信息" >
                            <ItemStyle HorizontalAlign="Center" />
                            </asp:ButtonField>
                
            </Columns>
            <FooterStyle BackColor="#C6C3C6" ForeColor="Black" />
            <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#E7E7FF" />
            <PagerStyle BackColor="#C6C3C6" ForeColor="Black" HorizontalAlign="Right" />
            <RowStyle BackColor="#DEDFDE" ForeColor="Black" HorizontalAlign="Center" />
            <SelectedRowStyle BackColor="#9471DE" Font-Bold="True" ForeColor="White" />
        </asp:GridView>
        <br />

    </div>
    <asp:Panel ID="panel1" runat="server" Visible="false">
    <table class="style1">
            <tr>
                <td class="style2">
                    请输入用户名:</td>
                <td class="style3">
                    <asp:Label ID="Label18" runat="server"></asp:Label>
                </td>
                <td class="style2">
                    家庭住址:</td>
                <td class="style3">
                    <asp:Label ID="Label25" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="style2">
                    请输入密码：</td>
                <td class="style3">
                    <asp:Label ID="Label19" runat="server"></asp:Label>
                </td>
                <td class="style2">
                    传真地址：</td>
                <td class="style3">
                    <asp:Label ID="Label26" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="style2">
                    姓名：</td>
                <td class="style3">
                    <asp:Label ID="Label20" runat="server"></asp:Label>
                </td>
                <td class="style2">
                    移动电话号码：</td>
                <td class="style3">
                    <asp:Label ID="Label27" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="style2">
                    从事行业：</td>
                <td class="style3">
                    <asp:Label ID="Label21" runat="server"></asp:Label>
                </td>
                <td class="style2">
                    EMail地址：</td>
                <td class="style3">
                    <asp:Label ID="Label28" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="style2">
                    工作方向：</td>
                <td class="style3">
                    <asp:Label ID="Label22" runat="server"></asp:Label>
                </td>
                <td class="style2">
                    QQ号码：</td>
                <td class="style3">
                    <asp:Label ID="Label29" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="style2" >
                    公司名称：</td>
                <td class="style3">
                    <asp:Label ID="Label23" runat="server"></asp:Label>
                    <br />
                </td>
                <td class="style2">
                    WetChatID:</td>
                <td class="style3">
                    <asp:Label ID="Label30" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="style2">
                    职务：</td>
                <td class="style3">
                    <asp:Label ID="Label24" runat="server"></asp:Label>
                </td>
                <td class="style2">
                    所学专业:</td>
                <td class="style3">
                    <asp:Label ID="Label31" runat="server"></asp:Label>
                </td>
            </tr>
            
        </table>
        <table class="style1">
        <tr>
            <td align="center">
                <asp:Button ID="Button1" runat="server" onclick="Button1_Click" Text="审核通过" />
            </td>
            <td align="center">
                <asp:Button ID="Button2" runat="server" onclick="Button2_Click" Text="审核未通过" />
            </td>
        </tr>
    </table>
    </asp:Panel>
    <asp:TextBox ID="TextBox2" runat="server" Visible="False"></asp:TextBox>
    <br />
    
    </form>
    <script type="text/javascript" src="../bootstrap/js/jquery-2.1.3.min.js"></script>

    <script type="text/javascript" src="../bootstrap/js/bootstrap.min.js"></script>
</body>
</html>
