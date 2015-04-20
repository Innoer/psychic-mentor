<%@ Page Language="C#" ValidateRequest="false" AutoEventWireup="true" CodeBehind="ModifyAlumnus.aspx.cs" Inherits="Alumni.Manage.tab.ModifyAlumnus" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
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
        .style4
        {
            width: 161px;
            height: 25px;
        }
        .style5
        {
            width: 279px;
            height: 25px;
        }
        .style6
        {
            height: 25px;
        }
        .style7
        {
            width: 115px;
        }
        .style8
        {
            height: 25px;
            width: 115px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:Label ID="Label11" runat="server" Text="当前位置：修改校友"></asp:Label>
        <asp:GridView ID="GridView1" runat="server" 
            EnableModelValidation="True" Width="100%" 
            onselectedindexchanged="GridView1_SelectedIndexChanged" 
            DataKeyNames="UserID" CellPadding="4" ForeColor="#333333" GridLines="None" 
            AllowPaging="True" onpageindexchanging="GridView1_PageIndexChanging" 
            AutoGenerateColumns="False">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
            <asp:ButtonField CommandName="select" Text="编辑" ButtonType="Link" 
                                HeaderText="信息修改" >
                            <ItemStyle HorizontalAlign="Center" />
                            </asp:ButtonField>
                            <asp:BoundField DataField="UserID" HeaderText="用户编号" 
                    SortExpression="UserID" />
                <asp:BoundField DataField="UserName" HeaderText="用户名" 
                    SortExpression="UserName" />
                <asp:BoundField DataField="PassWord" HeaderText="密码" 
                    SortExpression="PassWord" />
                <asp:BoundField DataField="Name" HeaderText="校友名" SortExpression="Name" />
                <asp:BoundField DataField="Sex" HeaderText="性别" SortExpression="Sex" />
                <asp:BoundField DataField="BirthDate" DataFormatString="{0:yyyy-MM-dd}" HeaderText="生日" 
                    SortExpression="BirthDate" />
                <asp:BoundField DataField="ProvinceName" HeaderText="所在省" 
                    SortExpression="ProvinceName" />
                <asp:BoundField DataField="CityName" HeaderText="所在市" 
                    SortExpression="CityName" />
                <asp:BoundField DataField="CategoryName" HeaderText="从事专业" 
                    SortExpression="CategoryName" />
                <asp:BoundField DataField="NatureName" HeaderText="工作方向" 
                    SortExpression="NatureName" />
                <asp:BoundField DataField="WorkplaceName" HeaderText="公司名称" 
                    SortExpression="WorkplaceName" />
                <asp:BoundField DataField="WorkTitle" HeaderText="职务" 
                    SortExpression="WorkTitle" />
                <asp:BoundField DataField="MailingAddress" HeaderText="家庭住址" 
                    SortExpression="MailingAddress" />
                <asp:BoundField DataField="FixedPhone" HeaderText="传真号" 
                    SortExpression="FixedPhone" />
                <asp:BoundField DataField="MobilePhone" HeaderText="移动电话" 
                    SortExpression="MobilePhone" />
                <asp:BoundField DataField="EMail" HeaderText="EMail地址" SortExpression="EMail" />
                <asp:BoundField DataField="QQNo" HeaderText="QQ号" SortExpression="QQNo" />
                <asp:BoundField DataField="WeChatID" HeaderText="WeChatID" 
                    SortExpression="WeChatID" />
                <asp:BoundField DataField="ClassNo" HeaderText="班号" SortExpression="ClassNo" />
                <asp:BoundField DataField="StudentNo" HeaderText="学号" 
                    SortExpression="StudentNo" />
                <asp:BoundField DataField="EnrollYear" HeaderText="入学年份" 
                    SortExpression="EnrollYear" />
                <asp:BoundField DataField="ProgramName" HeaderText="所学专业" 
                    SortExpression="ProgramName" />
                <asp:BoundField DataField="SchoolName" HeaderText="学校" 
                    SortExpression="SchoolName" />
                            </Columns>
            <EditRowStyle BackColor="#2461BF" />
            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#EFF3FB" />
            <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
        </asp:GridView>
        <br />
        <table class="style1">
            <tr>
                <td class="style2">
                    <asp:Label ID="Label1" runat="server" Text="请输入用户名:"></asp:Label>
                </td>
                <td class="style3">
                    <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                        ControlToValidate="TextBox1" ErrorMessage="*"></asp:RequiredFieldValidator>
                </td>
                <td class="style7">
                    公司名称：</td>
                <td>
                    <asp:TextBox ID="TextBox6" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="style2">
                    <asp:Label ID="Label2" runat="server" Text="请输入密码："></asp:Label>
                </td>
                <td class="style3">
                    <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                        ControlToValidate="TextBox2" ErrorMessage="*"></asp:RequiredFieldValidator>
                </td>
                <td class="style7">
                    职务：</td>
                <td>
                    <asp:TextBox ID="TextBox7" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="style2">
                    <asp:Label ID="Label3" runat="server" Text="确认密码："></asp:Label>
                </td>
                <td class="style3">
                    <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
                    <asp:CompareValidator ID="CompareValidator1" runat="server" 
                        ControlToCompare="TextBox2" ControlToValidate="TextBox3" ErrorMessage="两次密码不相同"></asp:CompareValidator>
                </td>
                <td class="style7">
                    家庭住址:</td>
                <td>
                    <asp:TextBox ID="TextBox8" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="style2">
                    <asp:Label ID="Label4" runat="server" Text="姓名："></asp:Label>
                </td>
                <td class="style3">
                    <asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                        ControlToValidate="TextBox4" ErrorMessage="*"></asp:RequiredFieldValidator>
                </td>
                <td class="style7">
                    传真地址：</td>
                <td>
                    <asp:TextBox ID="TextBox9" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="style4">
                    <asp:Label ID="Label5" runat="server" Text="性别（1-男；2-女）："></asp:Label>
                </td>
                <td class="style5">
                    <asp:DropDownList ID="DropDownList6" runat="server">
                        <asp:ListItem Value="1">男</asp:ListItem>
                        <asp:ListItem Value="2">女</asp:ListItem>
                    </asp:DropDownList>
                </td>
                <td class="style8">
                    移动电话号码：</td>
                <td class="style6">
                    <asp:TextBox ID="TextBox10" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="style4" rowspan="5">
                    <asp:Label ID="Label6" runat="server" Text="出生日期："></asp:Label>
                </td>
                <td class="style5" rowspan="5">
                    <asp:Calendar ID="Calendar1" runat="server" Height="16px" Width="273px">
                    </asp:Calendar>
                </td>
                <td class="style8">
                    EMail地址：</td>
                <td class="style6">
                    <asp:TextBox ID="TextBox11" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="style8">
                    QQ号码：</td>
                <td class="style6">
                    <asp:TextBox ID="TextBox12" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="style8">
                    WetChatID:</td>
                <td class="style6">
                    <asp:TextBox ID="TextBox13" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="style8">
                    班号：</td>
                <td class="style6">
                    <asp:TextBox ID="TextBox14" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="style8">
                    学号：</td>
                <td class="style6">
                    <asp:TextBox ID="TextBox15" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="style2">
                    <asp:Label ID="Label7" runat="server" Text="所在省份："></asp:Label>
                </td>
                <td class="style3">
                    <asp:DropDownList ID="DropDownList1" runat="server" 
                        DataSourceID="SqlDataSource1" DataTextField="ProvinceName" 
                        DataValueField="ProvinceID" AutoPostBack="True">
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:AlumniSNSConnectionString %>" 
                        SelectCommand="SELECT * FROM [LiveProvince]"></asp:SqlDataSource>
                </td>
                <td class="style7">
                    入学年份:</td>
                <td>
                    <asp:TextBox ID="TextBox16" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="style2">
                    <asp:Label ID="Label8" runat="server" Text="所在城市："></asp:Label>
                </td>
                <td class="style3">
                    <asp:DropDownList ID="DropDownList2" runat="server" 
                        onselectedindexchanged="DropDownList2_SelectedIndexChanged">
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:AlumniSNSConnectionString %>" 
                        SelectCommand="SELECT * FROM [LiveCity]"></asp:SqlDataSource>
                </td>
                <td class="style7">
                    毕业时间：</td>
                <td>
                    <asp:TextBox ID="TextBox17" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="style2">
                    <asp:Label ID="Label9" runat="server" Text="从事专业："></asp:Label>
                </td>
                <td class="style3">
                    <asp:DropDownList ID="DropDownList3" runat="server" 
                        DataSourceID="SqlDataSource3" DataTextField="CategoryName" 
                        DataValueField="CategoryID">
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource3" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:AlumniSNSConnectionString %>" 
                        SelectCommand="SELECT * FROM [EmployCategory]"></asp:SqlDataSource>
                </td>
                <td class="style7">
                    所学专业:</td>
                <td>
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
                    <asp:Label ID="Label10" runat="server" Text="工作方向："></asp:Label>
                </td>
                <td class="style3">
                    <asp:DropDownList ID="DropDownList4" runat="server" 
                        DataSourceID="SqlDataSource4" DataTextField="NatureName" 
                        DataValueField="NatureID">
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource4" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:AlumniSNSConnectionString %>" 
                        SelectCommand="SELECT * FROM [WorkplaceNature]"></asp:SqlDataSource>
                </td>
                <td class="style7">
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
        </table>
    </div>
    <asp:Button ID="Button1" runat="server" onclick="Button1_Click" Text="确认添加" />
    <asp:TextBox ID="TextBox18" runat="server" Visible="False"></asp:TextBox>
    </form>
</body>
</html>
