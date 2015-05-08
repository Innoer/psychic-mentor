<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="searchArticle.aspx.cs" Inherits="Alumni.Manage.tab.searchArticle" %>

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
    <asp:Label ID="Label2" runat="server" Text="当前位置：文章管理&gt;&gt;查询文章" 
            Font-Size="10pt"></asp:Label>
        <br />
        <asp:Image ID="Image5" runat="server" Height="1px" Width="97%" 
            BackColor="Blue" />
        <br />
        <br />
    </div>
    <div>
    
        
    
        <asp:Label ID="Label1" runat="server" Text="通过类别查询："></asp:Label>
&nbsp;
        <asp:DropDownList ID="dropColumn" runat="server">
        </asp:DropDownList>

        &nbsp;&nbsp;
        <asp:Button ID="Button1" runat="server" onclick="Button1_Click" Text="查询" />
        <br />
        <asp:Button ID="Button2" runat="server" onclick="Button2_Click" Text="全部信息" />

        <asp:GridView ID="GridView1" runat="server" CellPadding="3" 
            EnableModelValidation="True" GridLines="None" 
            AllowPaging="True" onpageindexchanged="GridView1_PageIndexChanged" 
            onpageindexchanging="GridView1_PageIndexChanging" 
            onselectedindexchanged="GridView1_SelectedIndexChanged" 
            Width="100%"
            DataKeyNames="ArticleID" AutoGenerateColumns="False" BackColor="White" 
            BorderColor="White" BorderStyle="Ridge" BorderWidth="2px" CellSpacing="1" 
            PageSize="5">
            <Columns>
                <asp:TemplateField HeaderText="序号" InsertVisible="False">
                    <ItemStyle HorizontalAlign="Center" />
                        <HeaderStyle HorizontalAlign="Center" Width="5%" />
                    <ItemTemplate>
                     <asp:Label ID="Label12" runat="server" Text='<%# this.GridView1.PageIndex * this.GridView1.PageSize + this.GridView1.Rows.Count + 1%>'/>
                    </ItemTemplate>
                </asp:TemplateField>
                            
                <asp:BoundField DataField="Title" HeaderText="标题" SortExpression="Title" />
                <asp:BoundField DataField="ColumnName" HeaderText="栏目类别" 
                    SortExpression="ColumnName" />
                <asp:BoundField DataField="PublishUserID" HeaderText="父栏目" 
                    SortExpression="PublishUserID" />
                <asp:BoundField DataField="PublishDate" HeaderText="发布时间"   DataFormatString="{0:yyyy-MM-dd}"
                    SortExpression="PublishDate" />
                <asp:BoundField DataField="VisitCount" HeaderText="访问次数" 
                    SortExpression="VisitCount" />
                
                <asp:ButtonField CommandName="select" Text="查看" ButtonType="Link" 
                                HeaderText="具体信息" >
                            <ItemStyle HorizontalAlign="Center" />
                            </asp:ButtonField>
                            </Columns>
            <FooterStyle BackColor="#C6C3C6" ForeColor="Black" />
            <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#E7E7FF" />
            <PagerStyle BackColor="#C6C3C6" ForeColor="Black" HorizontalAlign="Right" />
            <RowStyle BackColor="#DEDFDE" ForeColor="Black" HorizontalAlign="Center" />
            <SelectedRowStyle BackColor="#9471DE" Font-Bold="True" ForeColor="White" />
        </asp:GridView>
    
        <asp:TextBox ID="TextBox2" runat="server" Visible="False"></asp:TextBox>
    
        <asp:TextBox ID="TextBox1" runat="server" Visible="False"></asp:TextBox>
    
        <asp:TextBox ID="TextBox3" runat="server" Visible="False"></asp:TextBox>
    
        <br />
        <br />
        <asp:Panel ID="panel1" runat="server" Visible="false">
            * 类别:
            <asp:Label ID="label10" runat="server"></asp:Label>
            
        <br />
            * 置顶:&nbsp;
            <asp:CheckBox ID="checkIsStickTop" runat="server" />
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
    <script type="text/javascript" src="../bootstrap/js/jquery-2.1.3.min.js"></script>

    <script type="text/javascript" src="../bootstrap/js/bootstrap.min.js"></script>
</body>
</html>
