<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UserManagement.aspx.cs" Inherits="Alumni.Manage.tag.UserManagement" %>

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
        .style2
        {
            width: 100%;
        }
        .style6
        {
            width: 101px;
        }
        .style8
        {
            width: 22px;
        }
        .style9
        {
            width: 151px;
        }
        .style10
        {
            width: 33px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <br />
    <asp:Label ID="Label11" runat="server" Text="当前位置：其他管理&gt;&gt;用户管理" 
            Font-Size="10pt"></asp:Label>
        <br />
        <asp:Image ID="Image5" runat="server" Height="1px" Width="97%" 
            BackColor="Blue" />
        <br />
        <br />
    </div>

    <asp:GridView ID="UsersGridView" runat="server" DataSourceID="SqlDataSource" 
            AllowPaging="True" AutoGenerateColumns="False" DataKeyNames="UserID" 
            EnableModelValidation="True" CellPadding="3" 
            GridLines="None" Width="100%" 
        onselectedindexchanged="UsersGridView_SelectedIndexChanged" 
        onrowdeleting="UsersGridView_RowDeleting" BackColor="White" 
        BorderColor="White" BorderStyle="Ridge" BorderWidth="2px" CellSpacing="1" 
        PageSize="15">
            <Columns>
            
            
                <asp:TemplateField HeaderText="序号" InsertVisible="False">
                    <ItemStyle HorizontalAlign="Center" />
                        <HeaderStyle HorizontalAlign="Center" Width="5%" />
                    <ItemTemplate>
                     <asp:Label ID="Label12" runat="server" Text='<%# this.UsersGridView.PageIndex * this.UsersGridView.PageSize + this.UsersGridView.Rows.Count + 1%>'/>
                    </ItemTemplate>
             </asp:TemplateField>
                <asp:BoundField DataField="UserName" HeaderText="用户名" 
                    SortExpression="UserName" />
                <asp:BoundField DataField="PassWord" HeaderText="密码" 
                    SortExpression="PassWord" />
                <asp:BoundField DataField="Level" HeaderText="用户等级" SortExpression="Level" />
                <asp:ButtonField CommandName="select" Text="编辑" ButtonType="Link" 
                                HeaderText="信息修改" >
                            <ItemStyle HorizontalAlign="Center" />
                            </asp:ButtonField>
                <asp:ButtonField CommandName="delete" Text="&lt;div id=&quot;de&quot; onclick=&quot;JavaScript:return confirm('确定删除吗？')&quot;&gt;删除&lt;/div&gt; "
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
        

        
    
    <asp:SqlDataSource ID="SqlDataSource" runat="server" 
        ConnectionString="<%$ ConnectionStrings:AlumniConnectionString %>" 
        
        
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
    <asp:Button ID="AButton" runat="server" Text="添加用户信息" onclick="AButton_Click" />
     <asp:Label ID="Label1" runat="server" Text="Label" Visible="False"></asp:Label>
     <asp:Panel ID="panel1" runat="server" Visible="True">
    <table class="style2">

        <tr>
            <td class="style10">
                用户名：</td>
            <td class="style6">
                <asp:TextBox ID="NameTextBox" 
            runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator 
            ID="RequiredFieldValidator1" runat="server" ControlToValidate="NameTextBox" 
            ErrorMessage="请输入用户名"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="style10">
                密码：</td>
            <td class="style6">
                <asp:TextBox ID="PassWordTextBox" 
            runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator 
            ID="RequiredFieldValidator2" runat="server" ControlToValidate="PassWordTextBox" 
            ErrorMessage="请输入密码"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="style10">
                确认密码：</td>
            <td class="style6">
                <asp:TextBox ID="TestTextBox" 
            runat="server"></asp:TextBox>
                <asp:CompareValidator 
            ID="CompareValidator1" runat="server" ControlToCompare="TestTextBox" 
            ControlToValidate="PassWordTextBox" ErrorMessage="两次输入密码不相同"></asp:CompareValidator>
            </td>
        </tr>
        <tr>
            <td class="style10">
                用户等级：</td>
            <td class="style6">
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
            <td class="style10">
                &nbsp;</td>
            <td class="style6">
                <asp:Button ID="RewriteButton" runat="server" onclick="Button1_Click" 
            Text="重新填写" />
        &nbsp;&nbsp; <asp:Button ID="AddButton" runat="server" onclick="AddButton_Click" 
            Text="确认添加"/>
            </td>
        </tr>
        
    </table>
    </asp:Panel>
    
    <asp:Panel ID="panelView" runat="server" Visible="False">
        <table class="style2">
            <tr>
                <td class="style9">
                    <asp:Label ID="Label2" runat="server" Text="修改用户信息"></asp:Label>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style9">
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
                <td class="style9">
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
                <td class="style9">
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
                <td class="style9">
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
                <td class="style9">
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
    <script type="text/javascript" src="../bootstrap/js/jquery-2.1.3.min.js"></script>

    <script type="text/javascript" src="../bootstrap/js/bootstrap.min.js"></script>
</body>
</html>
