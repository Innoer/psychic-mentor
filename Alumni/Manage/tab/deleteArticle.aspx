<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="deleteArticle.aspx.cs" Inherits="Alumni.Manage.tab.deleteArticle" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:Label ID="Label1" runat="server" Text="当前位置：删除文章"></asp:Label>
    <asp:GridView ID="GridView" runat="server" AutoGenerateColumns="False" 
        CellPadding="4" DataKeyNames="ArticleID" DataSourceID="SqlDataSource" 
        EnableModelValidation="True" ForeColor="#333333" GridLines="None" 
        AllowPaging="True" onrowdeleting="GridView_RowDeleting">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:ButtonField CommandName="delete" Text="&lt;div id=&quot;de&quot; onclick=&quot;JavaScript:return confirm('确定删除吗？')&quot;&gt;删除&lt;/div&gt; "
                                HeaderText="删除信息" >
                            <ItemStyle HorizontalAlign="Center" />
                            </asp:ButtonField>
            <asp:BoundField DataField="ArticleID" HeaderText="文章编号" 
                InsertVisible="False" ReadOnly="True" SortExpression="ArticleID" />
            <asp:BoundField DataField="ColumnName" HeaderText="所属栏目" 
                SortExpression="ColumnName" />
            <asp:BoundField DataField="PublishDate" HeaderText="发布时间" 
                SortExpression="PublishDate" />
            <asp:BoundField DataField="VisitCount" HeaderText="访问数" 
                SortExpression="VisitCount" />
            <asp:CheckBoxField DataField="IsStickTop" HeaderText="是否置顶" 
                SortExpression="IsStickTop" />
            <asp:BoundField DataField="Title" HeaderText="标题" SortExpression="Title" />
            <asp:BoundField DataField="Keywords" HeaderText="关键字" 
                SortExpression="Keywords" />
            <asp:BoundField DataField="Source" HeaderText="图片来源" 
                SortExpression="Source" />
        </Columns>
        <EditRowStyle BackColor="#2461BF" />
        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#EFF3FB" />
        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
    </asp:GridView>
    </div>
    <asp:SqlDataSource ID="SqlDataSource" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
        
        SelectCommand="SELECT Articles.ArticleID, Columns.ColumnName, Users.UserName, Articles.PublishDate, Articles.VisitCount, Articles.IsStickTop, Articles.Title, Articles.Keywords, Articles.Source FROM Articles INNER JOIN Columns ON Articles.ColumnID = Columns.ColumnID INNER JOIN Users ON Articles.PublishUserID = Users.UserID ORDER BY Articles.IsStickTop DESC, Articles.PublishDate DESC">
    </asp:SqlDataSource>
    <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
    </form>
</body>
</html>
