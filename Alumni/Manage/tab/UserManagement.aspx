<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UserManagement.aspx.cs" Inherits="Alumni.Manage.tag.UserManagement" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .style2
        {
            width: 100%;
        }
        .style3
        {
            width: 119px;
        }
        .style4
        {
            width: 412px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <asp:Label ID="Label3" runat="server" Text="当前位置：用户管理"></asp:Label>
    <br />
    <asp:GridView ID="UsersGridView" runat="server" DataSourceID="SqlDataSource" 
            AllowPaging="True" AutoGenerateColumns="False" DataKeyNames="UserID" 
            EnableModelValidation="True" CellPadding="4" ForeColor="#333333" 
            GridLines="None" Width="100%" 
        onselectedindexchanged="UsersGridView_SelectedIndexChanged">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
            <asp:TemplateField>
	            <ItemTemplate>
		            <asp:Button ID="editButton" runat="server" CommandName="Select" Text="修改用户信息" />
	            </ItemTemplate>
            </asp:TemplateField>
                <asp:CommandField ShowDeleteButton="True" />
                <asp:BoundField DataField="UserID" HeaderText="用户编号" InsertVisible="False" 
                    ReadOnly="True" SortExpression="UserID" />
                <asp:BoundField DataField="UserName" HeaderText="用户名" 
                    SortExpression="UserName" />
                <asp:BoundField DataField="PassWord" HeaderText="密码" 
                    SortExpression="PassWord" />
                <asp:BoundField DataField="Level" HeaderText="用户等级" SortExpression="Level" />
            </Columns>
            <EditRowStyle BackColor="#2461BF" />
            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#EFF3FB" />
            <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
        </asp:GridView>
        

        
    
    <asp:SqlDataSource ID="SqlDataSource" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
        
        
        SelectCommand="SELECT [UserID], [UserName], [PassWord], [Level] FROM [Users]" 
        DeleteCommand="DELETE FROM [Users] WHERE [UserID] = @UserID" 
        InsertCommand="INSERT INTO [Users] ([UserName], [PassWord], [Level]) VALUES (@UserName, @PassWord, @Level)" 
        UpdateCommand="UPDATE [Users] SET [UserName] = @UserName, [PassWord] = @PassWord, [Level] = @Level WHERE [UserID] = @UserID">
        <DeleteParameters>
            <asp:Parameter Name="UserID" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="UserName" Type="String" />
            <asp:Parameter Name="PassWord" Type="String" />
            <asp:Parameter Name="Level" Type="Int32" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="UserName" Type="String" />
            <asp:Parameter Name="PassWord" Type="String" />
            <asp:Parameter Name="Level" Type="Int32" />
            <asp:Parameter Name="UserID" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <br />
    <table class="style2">
        <tr>
            <td class="style3">
    <asp:Button ID="AButton" runat="server" Text="添加用户信息" onclick="AButton_Click" />
            </td>
            <td class="style4">
        <asp:Label ID="Label1" runat="server" Text="Label" Visible="False"></asp:Label>
            </td>
        </tr>
         <asp:Panel ID="panel1" runat="server" Visible="False">
        <tr>
            <td class="style3">
                <asp:Label ID="Name" runat="server" 
            Text="用户名："></asp:Label>
            </td>
            <td class="style4">
                <asp:TextBox ID="NameTextBox" 
            runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator 
            ID="RequiredFieldValidator1" runat="server" ControlToValidate="NameTextBox" 
            ErrorMessage="请输入用户名"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="style3">
                <asp:Label ID="PassWord" runat="server" 
            Text="密码："></asp:Label>
            </td>
            <td class="style4">
                <asp:TextBox ID="PassWordTextBox" 
            runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator 
            ID="RequiredFieldValidator2" runat="server" ControlToValidate="PassWordTextBox" 
            ErrorMessage="请输入密码"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="style3">
                <asp:Label ID="Test" runat="server" 
            Text="确认密码："></asp:Label>
            </td>
            <td class="style4">
                <asp:TextBox ID="TestTextBox" 
            runat="server"></asp:TextBox>
                <asp:CompareValidator 
            ID="CompareValidator1" runat="server" ControlToCompare="TestTextBox" 
            ControlToValidate="PassWordTextBox" ErrorMessage="两次输入密码不相同"></asp:CompareValidator>
            </td>
        </tr>
        <tr>
            <td class="style3">
                <asp:Label ID="Level" runat="server" 
            Text="用户等级："></asp:Label>
            </td>
            <td class="style4">
                <asp:TextBox ID="LevelTextBox" 
            runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator 
            ID="RequiredFieldValidator3" runat="server" ControlToValidate="LevelTextBox" 
            ErrorMessage="*"></asp:RequiredFieldValidator>
        <asp:RangeValidator ID="RangeValidator1" runat="server" 
            ControlToValidate="LevelTextBox" ErrorMessage="请输入正确的用户等级（数字1-5）" 
            MaximumValue="5" MinimumValue="1" Type="Integer"></asp:RangeValidator>
            </td>
        </tr>
        <tr>
            <td class="style3">
                &nbsp;</td>
            <td class="style4">
                <asp:Button ID="RewriteButton" runat="server" onclick="Button1_Click" 
            Text="重新填写" />
        &nbsp;&nbsp; <asp:Button ID="AddButton" runat="server" onclick="AddButton_Click" 
            Text="确认添加"/>
            </td>
        </tr>
        </asp:Panel>
    </table>
    <asp:Panel ID="panelView" runat="server" Visible="False">
        <table class="style2">
            <tr>
                <td>
                    <asp:Label ID="Label2" runat="server" Text="修改用户信息"></asp:Label>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Name0" runat="server" 
            Text="用户名："></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="NameTextBox0" 
            runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator 
            ID="RequiredFieldValidator4" runat="server" ControlToValidate="NameTextBox0" 
            ErrorMessage="请输入用户名"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="PassWord0" runat="server" 
            Text="密码："></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="PassWordTextBox0" 
            runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator 
            ID="RequiredFieldValidator5" runat="server" ControlToValidate="PassWordTextBox0" 
            ErrorMessage="请输入密码"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Test0" runat="server" 
            Text="确认密码："></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="TestTextBox0" 
            runat="server"></asp:TextBox>
                    <asp:CompareValidator 
            ID="CompareValidator2" runat="server" ControlToCompare="TestTextBox0" 
            ControlToValidate="PassWordTextBox0" ErrorMessage="两次输入密码不相同"></asp:CompareValidator>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Level0" runat="server" 
            Text="用户等级："></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="LevelTextBox0" 
            runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator 
            ID="RequiredFieldValidator6" runat="server" ControlToValidate="LevelTextBox0" 
            ErrorMessage="*"></asp:RequiredFieldValidator>
                    <asp:RangeValidator ID="RangeValidator2" runat="server" 
            ControlToValidate="LevelTextBox0" ErrorMessage="请输入正确的用户等级（数字1-5）" 
            MaximumValue="5" MinimumValue="1" Type="Integer"></asp:RangeValidator>
                </td>
            </tr>
            <tr>
                <td>
                    &nbsp;</td>
                <td>
                    <asp:Button ID="UpdateButton" runat="server" onclick="UpdateButton_Click" 
        Text="确认修改" />
                </td>
            </tr>
        </table>
    </asp:Panel>
        &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; 
        &nbsp;&nbsp;<p>
    
    </p>
    </form>
</body>
</html>
