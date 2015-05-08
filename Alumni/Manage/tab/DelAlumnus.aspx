<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DelAlumnus.aspx.cs" Inherits="Alumni.Manage.tag.DelAlumnus" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>

<!-- viewport的<meta>标签，这个标签可以修改在大部分的移动设备上面的显示，为了确保适当的绘制和触屏缩放。-->

<title></title>

<!--样式文件引用-->

<link href="../bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css">
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <br />
    <asp:Label ID="Label11" runat="server" Text="当前位置：校友管理&gt;&gt;删除校友" 
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
    
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
            CellPadding="3" DataKeyNames="UserID" 
            EnableModelValidation="True" GridLines="None" 
            AllowPaging="True" Width="100%" onrowdeleting="GridView1_RowDeleting" 
            BackColor="White" BorderColor="White" BorderStyle="Ridge" BorderWidth="2px" 
            CellSpacing="1" onselectedindexchanged="GridView1_SelectedIndexChanged" 
            PageSize="5" onpageindexchanging="GridView1_PageIndexChanging">
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
                    <asp:ButtonField CommandName="select" Text="&lt;div id=&quot;de&quot; onclick=&quot;JavaScript:return confirm('确定删除吗？')&quot;&gt;删除&lt;/div&gt; "
                                HeaderText="删除信息" >
                            <ItemStyle HorizontalAlign="Center" />
                            </asp:ButtonField>
            </Columns>
            <FooterStyle BackColor="#C6C3C6" ForeColor="Black" />
            <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#E7E7FF" />
            <PagerStyle BackColor="#C6C3C6" ForeColor="Black" HorizontalAlign="Right" />
            <RowStyle BackColor="#DEDFDE" ForeColor="Black" HorizontalAlign="Center" />
            <SelectedRowStyle BackColor="#9471DE" Font-Bold="True" ForeColor="White" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:AlumniSNSConnectionString %>" 
            DeleteCommand="DELETE FROM [User] WHERE [UserID] = @UserID" 
            InsertCommand="INSERT INTO [User] ([UserName], [StudentNo]) VALUES (@UserName, @StudentNo)" 
            SelectCommand="SELECT [UserID], [UserName], [StudentNo] FROM [User]" 
            
            UpdateCommand="UPDATE [User] SET [UserName] = @UserName, [StudentNo] = @StudentNo WHERE [UserID] = @UserID">
            <DeleteParameters>
                <asp:Parameter Name="UserID" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="UserName" Type="String" />
                <asp:Parameter Name="StudentNo" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="UserName" Type="String" />
                <asp:Parameter Name="StudentNo" Type="String" />
                <asp:Parameter Name="UserID" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
    
        <asp:Label ID="Label12" runat="server" Text="Label" Visible="False"></asp:Label>
    
    </div>
    </form>
    <script type="text/javascript" src="../bootstrap/js/jquery-2.1.3.min.js"></script>

    <script type="text/javascript" src="../bootstrap/js/bootstrap.min.js"></script>
</body>
</html>
