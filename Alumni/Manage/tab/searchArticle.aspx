<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="searchArticle.aspx.cs" Inherits="Alumni.Manage.tab.searchArticle" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <asp:Label ID="Label16" runat="server" Text="当前位置：查询文章"></asp:Label>
        <br />
    
        <asp:Label ID="Label1" runat="server" Text="通过类别查询："></asp:Label>
&nbsp;
        <asp:DropDownList ID="dropColumn" runat="server">
        </asp:DropDownList>

        &nbsp;&nbsp;
        <asp:Button ID="Button1" runat="server" onclick="Button1_Click" Text="查询" />
        <br />
        <asp:Button ID="Button2" runat="server" onclick="Button2_Click" Text="全部信息" />

        <asp:GridView ID="GridView1" runat="server" CellPadding="4" 
            EnableModelValidation="True" ForeColor="#333333" GridLines="None" 
            AllowPaging="True" onpageindexchanged="GridView1_PageIndexChanged" 
            onpageindexchanging="GridView1_PageIndexChanging" 
            onselectedindexchanged="GridView1_SelectedIndexChanged" 
            DataKeyNames="ArticleID" AutoGenerateColumns="False">
            <Columns>
            <asp:ButtonField CommandName="select" Text="查看" ButtonType="Link" 
                                HeaderText="具体信息" >
                            <ItemStyle HorizontalAlign="Center" />
                            </asp:ButtonField>
                            <asp:BoundField DataField="ArticleID" HeaderText="文章编号" 
                    SortExpression="ArticleID" />
                <asp:BoundField DataField="ColumnName" HeaderText="栏目类别" 
                    SortExpression="ColumnName" />
                <asp:BoundField DataField="PublishUserID" HeaderText="父栏目" 
                    SortExpression="PublishUserID" />
                <asp:BoundField DataField="PublishDate" HeaderText="发布时间" 
                    SortExpression="PublishDate" />
                <asp:BoundField DataField="VisitCount" HeaderText="访问次数" 
                    SortExpression="VisitCount" />
                <asp:BoundField DataField="Title" HeaderText="标题" SortExpression="Title" />
                            </Columns>
            <AlternatingRowStyle BackColor="White" />
            <EditRowStyle BackColor="#2461BF" />
            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#EFF3FB" />
            <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
        </asp:GridView>
    
        <asp:TextBox ID="TextBox2" runat="server" Visible="False"></asp:TextBox>
    
        <asp:TextBox ID="TextBox1" runat="server" Visible="False"></asp:TextBox>
    
        <asp:TextBox ID="TextBox3" runat="server" Visible="False"></asp:TextBox>
    
        <br />
        <br />
        <asp:Panel ID="Panel1" runat="server" Visible="true">
            * 类别:
            <asp:Label ID="label10" runat="server"></asp:Label>
            
        <br />
            * 是否置顶:&nbsp;
            <asp:CheckBox ID="checkIsStickTop" runat="server" 
                 Text="置顶" />
        <br />
            * 标题:
            <asp:Label ID="label11" runat="server"></asp:Label>
        <br />
            * 图片URL:
            <asp:Label ID="label12" runat="server"></asp:Label>
        <br />
            * 关键字 (以 | 分割):
            <asp:Label ID="label13" runat="server"></asp:Label>
            
            &nbsp;<br /> * 来源:
            <asp:Label ID="label14" runat="server"></asp:Label>
        <br />
            * 内容:<br />
            <asp:Label ID="label15" runat="server"></asp:Label>
        <br />
        </asp:Panel>
    
    </div>
    </form>
</body>
</html>
