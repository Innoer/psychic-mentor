<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="deleteTitle.aspx.cs" Inherits="Alumni.Manage.tab.deleteTitle" %>

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
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <br />
    <asp:Label ID="Label11" runat="server" Text="当前位置：栏目管理&gt;&gt;删除栏目" 
            Font-Size="10pt"></asp:Label>
        <br />
        <asp:Image ID="Image5" runat="server" Height="1px" Width="97%" 
            BackColor="Blue" />
        <br />
        <br />
    </div>
    <div>
  
        <asp:GridView ID="GridView1" runat="server" DataSourceID="SqlDataSource1" 
            AllowPaging="True" AutoGenerateColumns="False" 
            DataKeyNames="ColumnID" EnableModelValidation="True" CellPadding="3" 
            GridLines="None" Width="100%" 
            onrowdeleting="GridView1_RowDeleting" BackColor="White" 
            BorderColor="White" BorderStyle="Ridge" BorderWidth="2px" CellSpacing="1" 
            PageSize="5">
            <Columns>
            
                <asp:BoundField DataField="ColumnName" HeaderText="栏目名" 
                    SortExpression="ColumnName" />
                <asp:CheckBoxField DataField="Visible" HeaderText="可见性" 
                    SortExpression="Visible" />
                <asp:CheckBoxField DataField="Deletable" HeaderText="可删除性" 
                    SortExpression="Deletable" />
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
    
    </div>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:AlumniConnectionString %>" 
        SelectCommand="SELECT * FROM [Columns]" 
        DeleteCommand="DELETE FROM [Columns] WHERE [ColumnID] = @ColumnID" 
        InsertCommand="INSERT INTO [Columns] ([ParentColumnID], [SubTemplateID], [ColumnName], [Visible], [Deletable], [IsSpecialCommand], [SpecialCommandName], [SpecialCommandArgument]) VALUES (@ParentColumnID, @SubTemplateID, @ColumnName, @Visible, @Deletable, @IsSpecialCommand, @SpecialCommandName, @SpecialCommandArgument)" 
        UpdateCommand="UPDATE [Columns] SET [ParentColumnID] = @ParentColumnID, [SubTemplateID] = @SubTemplateID, [ColumnName] = @ColumnName, [Visible] = @Visible, [Deletable] = @Deletable, [IsSpecialCommand] = @IsSpecialCommand, [SpecialCommandName] = @SpecialCommandName, [SpecialCommandArgument] = @SpecialCommandArgument WHERE [ColumnID] = @ColumnID">
        <DeleteParameters>
            <asp:Parameter Name="ColumnID" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="ParentColumnID" Type="Int32" />
            <asp:Parameter Name="SubTemplateID" Type="Int32" />
            <asp:Parameter Name="ColumnName" Type="String" />
            <asp:Parameter Name="Visible" Type="Boolean" />
            <asp:Parameter Name="Deletable" Type="Boolean" />
            <asp:Parameter Name="IsSpecialCommand" Type="Boolean" />
            <asp:Parameter Name="SpecialCommandName" Type="String" />
            <asp:Parameter Name="SpecialCommandArgument" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="ParentColumnID" Type="Int32" />
            <asp:Parameter Name="SubTemplateID" Type="Int32" />
            <asp:Parameter Name="ColumnName" Type="String" />
            <asp:Parameter Name="Visible" Type="Boolean" />
            <asp:Parameter Name="Deletable" Type="Boolean" />
            <asp:Parameter Name="IsSpecialCommand" Type="Boolean" />
            <asp:Parameter Name="SpecialCommandName" Type="String" />
            <asp:Parameter Name="SpecialCommandArgument" Type="String" />
            <asp:Parameter Name="ColumnID" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
    </form>
    <script type="text/javascript" src="../bootstrap/js/jquery-2.1.3.min.js"></script>

    <script type="text/javascript" src="../bootstrap/js/bootstrap.min.js"></script>
</body>
</html>
