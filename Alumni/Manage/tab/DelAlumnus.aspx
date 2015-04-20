<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DelAlumnus.aspx.cs" Inherits="Alumni.Manage.tag.DelAlumnus" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <asp:Label ID="Label1" runat="server" Text="当前位置：删除校友"></asp:Label>
    
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
            CellPadding="4" DataKeyNames="UserID" DataSourceID="SqlDataSource1" 
            EnableModelValidation="True" ForeColor="#333333" GridLines="None" 
            AllowPaging="True" Width="100%">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:CommandField ShowDeleteButton="True" />
                <asp:BoundField DataField="UserID" HeaderText="存根号" InsertVisible="False" 
                    ReadOnly="True" SortExpression="UserID" />
                <asp:BoundField DataField="UserName" HeaderText="校友姓名" 
                    SortExpression="UserName" />
            </Columns>
            <EditRowStyle BackColor="#2461BF" />
            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#EFF3FB" />
            <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:AlumniSNSConnectionString %>" 
            DeleteCommand="DELETE FROM [User] WHERE [UserID] = @UserID" 
            InsertCommand="INSERT INTO [User] ([UserName]) VALUES (@UserName)" 
            SelectCommand="SELECT [UserID], [UserName] FROM [User]" 
            UpdateCommand="UPDATE [User] SET [UserName] = @UserName WHERE [UserID] = @UserID">
            <DeleteParameters>
                <asp:Parameter Name="UserID" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="UserName" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="UserName" Type="String" />
                <asp:Parameter Name="UserID" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
    
    </div>
    </form>
</body>
</html>
