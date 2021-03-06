﻿<%@ Page Language="C#" ValidateRequest="false" AutoEventWireup="true" CodeBehind="ModifyAlumnus.aspx.cs" Inherits="Alumni.Manage.tab.ModifyAlumnus" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

<!-- viewport的<meta>标签，这个标签可以修改在大部分的移动设备上面的显示，为了确保适当的绘制和触屏缩放。-->

<title></title>

<!--样式文件引用-->

<link href="../bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css">
    <style type="text/css">
        .style1
        {
            width: 100%;
        }
        .style2
        {
            width: 161px;
        }
        .style3
        {
            width: 279px;
        }
        </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <br />
    <asp:Label ID="Label12" runat="server" Text="当前位置：校友管理&gt;&gt;修改校友" 
            Font-Size="10pt"></asp:Label>
        <br />
        <asp:Image ID="Image5" runat="server" Height="1px" Width="97%" 
            BackColor="Blue" />
        <br />
        <br />
    </div>
    <div>
        
        <asp:GridView ID="GridView1" runat="server" 
            EnableModelValidation="True" Width="100%" 
            onselectedindexchanged="GridView1_SelectedIndexChanged" 
            DataKeyNames="UserID" CellPadding="3" GridLines="None" 
            AllowPaging="True" onpageindexchanging="GridView1_PageIndexChanging" 
            AutoGenerateColumns="False" BackColor="White" BorderColor="White" 
            BorderStyle="Ridge" BorderWidth="2px" CellSpacing="1" PageSize="15">
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
                    <asp:ButtonField CommandName="select" Text="编辑" ButtonType="Link" 
                                HeaderText="信息修改" >
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
        
        <table class="style1">
            <tr>
                <td class="style2">
                    请输入用户名:</td>
                <td class="style3">
                    <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                        ControlToValidate="TextBox1" ErrorMessage="*"></asp:RequiredFieldValidator>
                </td>
                <td class="style2">
                    公司名称：</td>
                <td class="style3">
                    <asp:TextBox ID="TextBox6" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="style2">
                    请输入密码：</td>
                <td class="style3">
                    <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                        ControlToValidate="TextBox2" ErrorMessage="*"></asp:RequiredFieldValidator>
                </td>
                <td class="style2">
                    职务：</td>
                <td class="style3">
                    <asp:TextBox ID="TextBox7" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="style2">
                    确认密码：</td>
                <td class="style3">
                    <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
                    <asp:CompareValidator ID="CompareValidator1" runat="server" 
                        ControlToCompare="TextBox2" ControlToValidate="TextBox3" 
                        ErrorMessage="密码不相同"></asp:CompareValidator>
                </td>
                <td class="style2">
                    家庭住址:</td>
                <td class="style3">
                    <asp:TextBox ID="TextBox8" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="style2">
                    姓名：</td>
                <td class="style3">
                    <asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                        ControlToValidate="TextBox4" ErrorMessage="*"></asp:RequiredFieldValidator>
                </td>
                <td class="style2">
                    传真地址：</td>
                <td class="style3">
                    <asp:TextBox ID="TextBox9" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="style2">
                    性别：</td>
                <td class="style3">
                    <asp:DropDownList ID="DropDownList6" runat="server">
                        <asp:ListItem Value="1">男</asp:ListItem>
                        <asp:ListItem Value="2">女</asp:ListItem>
                    </asp:DropDownList>
                </td>
                <td class="style2">
                    移动电话号码：</td>
                <td class="style3">
                    <asp:TextBox ID="TextBox10" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="style2" >
                    出生日期：<asp:Label ID="Label13" 
                        runat="server" Text="(形如：19xx/xx/xx):"></asp:Label>
                </td>
                <td class="style3">
                    <asp:TextBox ID="TextBox19" runat="server" CausesValidation="True"></asp:TextBox>
                    <asp:RangeValidator ID="RangeValidator1" runat="server" 
                        ControlToValidate="TextBox18" ErrorMessage="输入错误" 
                        MaximumValue="2111/12/31" MinimumValue="1900/01/01" Type="Date"></asp:RangeValidator>
                    <br />
                </td>
                <td class="style2">
                    EMail地址：</td>
                <td class="style3">
                    <asp:TextBox ID="TextBox11" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="style2">
                    班号：</td>
                <td class="style3">
                    <asp:TextBox ID="TextBox14" runat="server"></asp:TextBox>
                </td>
                <td class="style2">
                    QQ号码：</td>
                <td class="style3">
                    <asp:TextBox ID="TextBox12" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="style2">
                    学号：</td>
                <td class="style3">
                    <asp:TextBox ID="TextBox15" runat="server"></asp:TextBox>
                </td>
                <td class="style2">
                    WetChatID:</td>
                <td class="style3">
                    <asp:TextBox ID="TextBox13" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="style2">
                    所在省份：</td>
                <td class="style3">
                    <asp:DropDownList ID="DropDownList1" runat="server" 
                        DataSourceID="SqlDataSource1" DataTextField="ProvinceName" 
                        DataValueField="ProvinceID" AutoPostBack="True" 
                        onselectedindexchanged="DropDownList1_SelectedIndexChanged">
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:AlumniSNSConnectionString %>" 
                        SelectCommand="SELECT * FROM [LiveProvince]"></asp:SqlDataSource>
                </td>
                <td class="style2">
                    入学年份:</td>
                <td class="style3">
                    <asp:TextBox ID="TextBox16" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="style2">
                    所在城市：</td>
                <td class="style3">
                    <asp:DropDownList ID="DropDownList2" runat="server" 
                        onselectedindexchanged="DropDownList2_SelectedIndexChanged">
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:AlumniSNSConnectionString %>" 
                        SelectCommand="SELECT * FROM [LiveCity]"></asp:SqlDataSource>
                </td>
                <td class="style2">
                    毕业时间：</td>
                <td class="style3">
                    <asp:TextBox ID="TextBox17" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="style2">
                    从事专业：</td>
                <td class="style3">
                    <asp:DropDownList ID="DropDownList3" runat="server" 
                        DataSourceID="SqlDataSource3" DataTextField="CategoryName" 
                        DataValueField="CategoryID">
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource3" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:AlumniSNSConnectionString %>" 
                        SelectCommand="SELECT * FROM [EmployCategory]"></asp:SqlDataSource>
                </td>
                <td class="style2">
                    所学专业:</td>
                <td class="style3">
                    <asp:DropDownList ID="DropDownList5" runat="server" 
                        DataSourceID="SqlDataSource5" DataTextField="ProgramName" 
                        DataValueField="ProgramID">
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource5" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:AlumniSNSConnectionString %>" 
                        SelectCommand="SELECT * FROM [EnrollProgram]"></asp:SqlDataSource>
                </td>
            </tr>
            <tr>
                <td class="style2">
                    工作方向：</td>
                <td class="style3">
                    <asp:DropDownList ID="DropDownList4" runat="server" 
                        DataSourceID="SqlDataSource4" DataTextField="NatureName" 
                        DataValueField="NatureID">
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource4" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:AlumniSNSConnectionString %>" 
                        SelectCommand="SELECT * FROM [WorkplaceNature]"></asp:SqlDataSource>
                </td>
                <td class="style2">
                    &nbsp;</td>
                <td class="style3">
                    &nbsp;</td>
            </tr>
        </table>
        
    
    <asp:Button ID="Button1" runat="server" onclick="Button1_Click" Text="确认添加" />
    <asp:TextBox ID="TextBox18" runat="server" Visible="False"></asp:TextBox>
    
    </div>
    </form>
    <script type="text/javascript" src="../bootstrap/js/jquery-2.1.3.min.js"></script>

    <script type="text/javascript" src="../bootstrap/js/bootstrap.min.js"></script>
</body>
</html>
