<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="deleteArticle.aspx.cs" Inherits="Alumni.Manage.tab.deleteArticle" %>

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
    <asp:Label ID="Label11" runat="server" Text="当前位置：文章管理&gt;&gt;删除文章" 
            Font-Size="10pt"></asp:Label>
        <br />
        <asp:Image ID="Image5" runat="server" Height="1px" Width="97%" 
            BackColor="Blue" />
        <br />
        <br />
    </div>
    <div>
    <asp:GridView ID="GridView" runat="server" AutoGenerateColumns="False" 
        CellPadding="3" DataKeyNames="ArticleID" DataSourceID="SqlDataSource" 
        EnableModelValidation="True" GridLines="None" 
        AllowPaging="True" onrowdeleting="GridView_RowDeleting" BackColor="White" 
            BorderColor="White" BorderStyle="Ridge" BorderWidth="2px" CellSpacing="1" 
            Width="100%" PageSize="15">
        <Columns>
            
            <asp:TemplateField HeaderText="序号" InsertVisible="False">
                    <ItemStyle HorizontalAlign="Center" />
                        <HeaderStyle HorizontalAlign="Center" Width="5%" />
                    <ItemTemplate>
                     <asp:Label ID="Label12" runat="server" Text='<%# this.GridView.PageIndex * this.GridView.PageSize + this.GridView.Rows.Count + 1%>'/>
                    </ItemTemplate>
             </asp:TemplateField>
             <asp:BoundField DataField="Title" HeaderText="标题" SortExpression="Title" />
            <asp:BoundField DataField="PublishDate" HeaderText="发布时间"  DataFormatString="{0:yyyy-MM-dd}" 
                SortExpression="PublishDate" />
            <asp:BoundField DataField="VisitCount" HeaderText="访问数" 
                SortExpression="VisitCount" />
            <asp:CheckBoxField DataField="IsStickTop" HeaderText="是否置顶" 
                SortExpression="IsStickTop" />
            
            <asp:BoundField DataField="Keywords" HeaderText="关键字" 
                SortExpression="Keywords" />
            <asp:BoundField DataField="Source" HeaderText="图片来源" 
                SortExpression="Source" />
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
    <asp:SqlDataSource ID="SqlDataSource" runat="server" 
        ConnectionString="<%$ ConnectionStrings:AlumniConnectionString %>" 
        
        SelectCommand="SELECT * FROM [Articles]" 
        DeleteCommand="DELETE FROM [Articles] WHERE [ArticleID] = @ArticleID" 
        InsertCommand="INSERT INTO [Articles] ([ColumnID], [SubTemplateID], [PublishUserID], [PublishDate], [VisitCount], [IsStickTop], [Title], [PictureURL], [Keywords], [Source], [Content]) VALUES (@ColumnID, @SubTemplateID, @PublishUserID, @PublishDate, @VisitCount, @IsStickTop, @Title, @PictureURL, @Keywords, @Source, @Content)" 
        UpdateCommand="UPDATE [Articles] SET [ColumnID] = @ColumnID, [SubTemplateID] = @SubTemplateID, [PublishUserID] = @PublishUserID, [PublishDate] = @PublishDate, [VisitCount] = @VisitCount, [IsStickTop] = @IsStickTop, [Title] = @Title, [PictureURL] = @PictureURL, [Keywords] = @Keywords, [Source] = @Source, [Content] = @Content WHERE [ArticleID] = @ArticleID">
        <DeleteParameters>
            <asp:Parameter Name="ArticleID" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="ColumnID" Type="Int32" />
            <asp:Parameter Name="SubTemplateID" Type="Int32" />
            <asp:Parameter Name="PublishUserID" Type="Int32" />
            <asp:Parameter Name="PublishDate" Type="DateTime" />
            <asp:Parameter Name="VisitCount" Type="Int32" />
            <asp:Parameter Name="IsStickTop" Type="Boolean" />
            <asp:Parameter Name="Title" Type="String" />
            <asp:Parameter Name="PictureURL" Type="String" />
            <asp:Parameter Name="Keywords" Type="String" />
            <asp:Parameter Name="Source" Type="String" />
            <asp:Parameter Name="Content" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="ColumnID" Type="Int32" />
            <asp:Parameter Name="SubTemplateID" Type="Int32" />
            <asp:Parameter Name="PublishUserID" Type="Int32" />
            <asp:Parameter Name="PublishDate" Type="DateTime" />
            <asp:Parameter Name="VisitCount" Type="Int32" />
            <asp:Parameter Name="IsStickTop" Type="Boolean" />
            <asp:Parameter Name="Title" Type="String" />
            <asp:Parameter Name="PictureURL" Type="String" />
            <asp:Parameter Name="Keywords" Type="String" />
            <asp:Parameter Name="Source" Type="String" />
            <asp:Parameter Name="Content" Type="String" />
            <asp:Parameter Name="ArticleID" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:TextBox ID="TextBox3" runat="server" Visible="False"></asp:TextBox>
    </form>
    <script type="text/javascript" src="../bootstrap/js/jquery-2.1.3.min.js"></script>

    <script type="text/javascript" src="../bootstrap/js/bootstrap.min.js"></script>
</body>
</html>
