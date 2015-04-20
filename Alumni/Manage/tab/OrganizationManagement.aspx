<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="OrganizationManagement.aspx.cs" Inherits="Alumni.Manage.tag.OrganizationManagement" %>

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
            width: 151px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <asp:Label ID="Label1" runat="server" Text="当前位置：校友会管理"></asp:Label>
    
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
            AutoGenerateColumns="False" CellPadding="4" DataKeyNames="OrganizationID" 
            DataSourceID="SqlDataSource1" EnableModelValidation="True" ForeColor="#333333" 
            GridLines="None" Width="100%">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                <asp:BoundField DataField="OrganizationID" HeaderText="组织编号" 
                    InsertVisible="False" ReadOnly="True" SortExpression="OrganizationID" />
                <asp:BoundField DataField="OrganizationName" HeaderText="组织名" 
                    SortExpression="OrganizationName" />
                <asp:BoundField DataField="OrganizationURL" HeaderText="链接地址" 
                    SortExpression="OrganizationURL" />
            </Columns>
            <EditRowStyle BackColor="#2461BF" />
            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#EFF3FB" />
            <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
            DeleteCommand="DELETE FROM [Organizations] WHERE [OrganizationID] = @OrganizationID" 
            InsertCommand="INSERT INTO [Organizations] ([OrganizationName], [OrganizationURL]) VALUES (@OrganizationName, @OrganizationURL)" 
            SelectCommand="SELECT * FROM [Organizations]" 
            UpdateCommand="UPDATE [Organizations] SET [OrganizationName] = @OrganizationName, [OrganizationURL] = @OrganizationURL WHERE [OrganizationID] = @OrganizationID">
            <DeleteParameters>
                <asp:Parameter Name="OrganizationID" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="OrganizationName" Type="String" />
                <asp:Parameter Name="OrganizationURL" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="OrganizationName" Type="String" />
                <asp:Parameter Name="OrganizationURL" Type="String" />
                <asp:Parameter Name="OrganizationID" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <br />
        <asp:Button ID="Button1" runat="server" onclick="Button1_Click" Text="确认添加" />
        <br />
        <table class="style1">
            <tr>
                <td class="style2">
                    校友会组织名称：</td>
                <td>
                    <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                        ControlToValidate="TextBox1" ErrorMessage="请输入组织名称"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="style2">
                    组织链接地址:</td>
                <td>
                    <asp:TextBox ID="TextBox2" runat="server" Width="387px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                        ControlToValidate="TextBox2" ErrorMessage="请输入网站链接地址"></asp:RequiredFieldValidator>
                </td>
            </tr>
        </table>
    
    </div>
    </form>
</body>
</html>
