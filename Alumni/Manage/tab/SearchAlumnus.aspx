<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SearchAlumnus.aspx.cs" Inherits="Alumni.Manage.tag.SearchAlumnus" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <asp:Label ID="Label4" runat="server" Text="当前位置：查询校友"></asp:Label>
        <br />
    
        <asp:Label ID="Label1" runat="server" Text="请输入校友姓名："></asp:Label>
&nbsp;<asp:TextBox ID="TextBox1" runat="server" style="text-align: left"></asp:TextBox>
&nbsp;
        <asp:CheckBox ID="CheckBox1" runat="server" 
            oncheckedchanged="CheckBox1_CheckedChanged" AutoPostBack="True" />
&nbsp;<asp:Label ID="Label2" runat="server" Text="校友专业："></asp:Label>
&nbsp;<asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource3" 
            DataTextField="CategoryName" DataValueField="CategoryName" Enabled="False">
        </asp:DropDownList>
&nbsp;&nbsp;<asp:CheckBox ID="CheckBox2" runat="server" 
            oncheckedchanged="CheckBox2_CheckedChanged" AutoPostBack="True" />
&nbsp;<asp:Label ID="Label3" runat="server" Text="校友毕业时间："></asp:Label>
&nbsp;<asp:DropDownList ID="TimeDownList" runat="server" DataSourceID="SqlDataSource2" 
            DataTextField="EnrollYear" DataValueField="EnrollYear" 
            onselectedindexchanged="TimeDownList_SelectedIndexChanged" Enabled="False">
        </asp:DropDownList>
        &nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="SearchButton" runat="server" onclick="SearchButton_Click" 
            Text="确认查询" />
        <br />
        <asp:GridView ID="GridView1" runat="server" CellPadding="4" 
            EnableModelValidation="True" ForeColor="#333333" GridLines="None" 
            Width="100%" AutoGenerateColumns="False">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
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

        <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
            ConnectionString="<%$ ConnectionStrings:AlumniSNSConnectionString %>" 
            SelectCommand="SELECT DISTINCT [EnrollYear] FROM [User]">
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource3" runat="server" 
            ConnectionString="<%$ ConnectionStrings:AlumniSNSConnectionString %>" 
            SelectCommand="SELECT [CategoryName] FROM [EmployCategory]">
        </asp:SqlDataSource>
    
    </div>
    </form>
</body>
</html>
