<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="OrganizationManagement.aspx.cs" Inherits="Alumni.Manage.tag.OrganizationManagement" %>

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
            width: 151px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <br />
    <asp:Label ID="Label11" runat="server" Text="当前位置：其他管理&gt;&gt;校友会管理" 
            Font-Size="10pt"></asp:Label>
        <br />
        <asp:Image ID="Image5" runat="server" Height="1px" Width="97%" 
            BackColor="Blue" />
        <br />
        <br />
    </div>
    <div>
    
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
            AutoGenerateColumns="False" CellPadding="3" DataKeyNames="OrganizationID" 
            DataSourceID="SqlDataSource1" EnableModelValidation="True" 
            GridLines="None" Width="100%" onrowdeleting="GridView1_RowDeleting" 
            onselectedindexchanged="GridView1_SelectedIndexChanged" BackColor="White" 
            BorderColor="White" BorderStyle="Ridge" BorderWidth="2px" CellSpacing="1" 
            PageSize="15">
            <Columns>
               
                
                <asp:TemplateField HeaderText="序号" InsertVisible="False">
                    <ItemStyle HorizontalAlign="Center" />
                        <HeaderStyle HorizontalAlign="Center" Width="5%" />
                    <ItemTemplate>
                     <asp:Label ID="Label12" runat="server" Text='<%# this.GridView1.PageIndex * this.GridView1.PageSize + this.GridView1.Rows.Count + 1%>'/>
                    </ItemTemplate>
             </asp:TemplateField>
                <asp:BoundField DataField="OrganizationName" HeaderText="组织名" 
                    SortExpression="OrganizationName" />
                <asp:BoundField DataField="OrganizationURL" HeaderText="链接地址" 
                    SortExpression="OrganizationURL" />
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
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:AlumniConnectionString %>" 
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
        <asp:TextBox ID="TextBox3" runat="server" Visible="False"></asp:TextBox>
        <br />
        <asp:Panel ID="Panel1" runat="server" Visible="true">
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
    </asp:Panel>

    <asp:Panel ID="Panel2" runat="server" Visible="false">
        <asp:Button ID="Button2" runat="server" onclick="Button2_Click" Text="确认修改" />
        <br />
        <table class="style1">
            <tr>
                <td class="style2">
                    校友会组织名称：</td>
                <td>
                    <asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                        ControlToValidate="TextBox4" ErrorMessage="请输入组织名称"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="style2">
                    组织链接地址:</td>
                <td>
                    <asp:TextBox ID="TextBox5" runat="server" Width="387px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                        ControlToValidate="TextBox5" ErrorMessage="请输入网站链接地址"></asp:RequiredFieldValidator>
                </td>
            </tr>
        </table>
    </asp:Panel>
    </div>
    </form>
    <script type="text/javascript" src="../bootstrap/js/jquery-2.1.3.min.js"></script>

    <script type="text/javascript" src="../bootstrap/js/bootstrap.min.js"></script>
</body>
</html>
