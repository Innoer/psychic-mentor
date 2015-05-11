<%@ Page Language="C#" ValidateRequest="false" AutoEventWireup="true" CodeBehind="updateArticle.aspx.cs" Inherits="Alumni.Manage.tab.updateArticle" %>

<%@ Register assembly="CKEditor.NET" namespace="CKEditor.NET" tagprefix="CKEditor" %>
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
    <asp:Label ID="Label11" runat="server" Text="当前位置：文章管理&gt;&gt;修改文章" 
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
            EnableModelValidation="True" GridLines="None" Width="100%"
            AllowPaging="True" onpageindexchanged="GridView1_PageIndexChanged" 
            onpageindexchanging="GridView1_PageIndexChanging" 
            onselectedindexchanged="GridView1_SelectedIndexChanged" 
            DataKeyNames="ArticleID" AutoGenerateColumns="False" BackColor="White" 
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
                <asp:BoundField DataField="Title" HeaderText="标题" SortExpression="Title" />
                            <asp:BoundField DataField="ColumnName" HeaderText="栏目类别" 
                    SortExpression="ColumnName" />
                <asp:BoundField DataField="PublishUserID" HeaderText="父栏目" 
                    SortExpression="PublishUserID" />
                <asp:BoundField DataField="PublishDate" HeaderText="发布时间" DataFormatString="{0:yyyy-MM-dd}"
                    SortExpression="PublishDate" />
                <asp:BoundField DataField="VisitCount" HeaderText="访问次数" 
                    SortExpression="VisitCount" />
                
                <asp:ButtonField CommandName="select" Text="编辑" ButtonType="Link" 
                                HeaderText="信息修改" >
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
        <asp:Panel ID="Panel1" runat="server" Visible="false">
            * 类别:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:DropDownList ID="DropDownList1" runat="server">
        </asp:DropDownList>
        <br />
            * 置顶:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:CheckBox ID="checkIsStickTop" runat="server" />
        <br />
            * 标题:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="textTitle" runat="server" Width="520px"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
            ControlToValidate="textTitle" ErrorMessage="Required" SetFocusOnError="True"></asp:RequiredFieldValidator>
        <br />
        * 图片URL:
        <asp:TextBox ID="textPicURL" runat="server" Width="520px"></asp:TextBox>
        <br />
        * 关键字 (以 | 分割):
        <asp:TextBox ID="textKeywords" runat="server" style="margin-top: 0px" 
            Width="470px"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
            ControlToValidate="textKeywords" ErrorMessage="Required" SetFocusOnError="True"></asp:RequiredFieldValidator>
        &nbsp;<br /> * 来源:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="textSource" runat="server" Width="520px"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
            ControlToValidate="textSource" ErrorMessage="Required" SetFocusOnError="True"></asp:RequiredFieldValidator>
        <br />
        * 内容:<br />
        <CKEditor:CKEditorControl ID="textContent" runat="server">
        </CKEditor:CKEditorControl>
        
        <br />
        <asp:Button ID="Button3" runat="server" onclick="Button3_Click" Text="修改" />
    </asp:Panel>
    
    </div>
    </form>
    <script type="text/javascript" src="../bootstrap/js/jquery-2.1.3.min.js"></script>

    <script type="text/javascript" src="../bootstrap/js/bootstrap.min.js"></script>
</body>
</html>
