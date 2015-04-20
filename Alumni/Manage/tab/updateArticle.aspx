<%@ Page Language="C#" ValidateRequest="false" AutoEventWireup="true" CodeBehind="updateArticle.aspx.cs" Inherits="Alumni.Manage.tab.updateArticle" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script type="text/javascript" src="/Template/Common/ckeditor/ckeditor.js"></script>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:Label ID="Label2" runat="server" Text="当前位置：修改文章"></asp:Label>
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
            <AlternatingRowStyle BackColor="White" />
            <Columns>
            <asp:ButtonField CommandName="select" Text="编辑" ButtonType="Link" 
                                HeaderText="信息修改" >
                            <ItemStyle HorizontalAlign="Center" />
                            </asp:ButtonField>
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
        <asp:DropDownList ID="DropDownList1" runat="server">
        </asp:DropDownList>
        <br />
        * 是否置顶:&nbsp;
        <asp:CheckBox ID="checkIsStickTop" runat="server" 
             Text="置顶" />
        <br />
        * 标题:
        <asp:TextBox ID="textTitle" runat="server" Width="576px"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
            ControlToValidate="textTitle" ErrorMessage="Required" SetFocusOnError="True"></asp:RequiredFieldValidator>
        <br />
        * 图片URL:
        <asp:TextBox ID="textPicURL" runat="server" Width="539px"></asp:TextBox>
        <br />
        * 关键字 (以 | 分割):
        <asp:TextBox ID="textKeywords" runat="server" style="margin-top: 0px" 
            Width="410px"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
            ControlToValidate="textKeywords" ErrorMessage="Required" SetFocusOnError="True"></asp:RequiredFieldValidator>
        &nbsp;<br /> * 来源:
        <asp:TextBox ID="textSource" runat="server" Width="391px"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
            ControlToValidate="textSource" ErrorMessage="Required" SetFocusOnError="True"></asp:RequiredFieldValidator>
        <br />
        * 内容:<br />
        <asp:TextBox ID="textContent" runat="server" CssClass="ckeditor" Rows="10" 
            TextMode="MultiLine"></asp:TextBox>
        <br />
        <asp:Button ID="Button3" runat="server" onclick="Button3_Click" Text="Button" />
    </asp:Panel>
    
    </div>
    </form>
</body>
</html>
