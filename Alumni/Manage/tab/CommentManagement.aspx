<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CommentManagement.aspx.cs" Inherits="Alumni.Manage.tag.CommentManagement" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .style1
        {
            width: 100%;
        }
        .style2
        {
            width: 198px;
        }
        .style3
        {
            width: 198px;
            height: 18px;
        }
        .style4
        {
            height: 18px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <asp:Label ID="Label6" runat="server" Text="当前位置：用户与管理员短消息"></asp:Label>
    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
        AutoGenerateColumns="False" CellPadding="4" DataKeyNames="CommentID" 
        DataSourceID="SqlDataSource1" EnableModelValidation="True" ForeColor="#333333" 
        GridLines="None" onselectedindexchanged="GridView1_SelectedIndexChanged" 
        Width="100%">
        <AlternatingRowStyle BackColor="White" />

        <Columns>
        <asp:TemplateField>
	            <ItemTemplate>
		            <asp:Button ID="editButton" runat="server" CommandName="Select" Text="查看信息" />
	            </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="CommentID" HeaderText="消息编号" 
                InsertVisible="False" ReadOnly="True" SortExpression="CommentID" />
            <asp:BoundField DataField="CommentUserID" HeaderText="用户ID" 
                SortExpression="CommentUserID" />
            <asp:BoundField DataField="CommentDate" HeaderText="发送时间" 
                SortExpression="CommentDate" />
            <asp:BoundField DataField="AdminReplyDate" HeaderText="管理员回复时间" 
                SortExpression="AdminReplyDate" />
        </Columns>
        <EditRowStyle BackColor="#2461BF" />
        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#EFF3FB" />
        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:AlumniSNSConnectionString %>" 
        SelectCommand="SELECT [CommentID], [CommentUserID], [CommentDate], [AdminReplyDate] FROM [Comment]">
    </asp:SqlDataSource>
    <asp:Label ID="Label5" runat="server" Text="Label" Visible="False"></asp:Label>
    <div>
    

       <asp:Panel ID="panelView" runat="server" Visible="False">
        <table class="style1">
            <tr>
                <td class="style3">
                    发送短消息的信息用户ID：</td>
                <td class="style4">
                    <asp:Label ID="Label1" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="style2">
                    短消息内容：</td>
                <td>
                    <asp:Label ID="Label2" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
            <td>发送时间：</td>
            <td>
                <asp:Label ID="Label3" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="style2">
                    管理员回复内容：</td>
                <td>
                    <asp:TextBox ID="TextBox1" runat="server" Height="187px" TextMode="MultiLine" 
                        Width="267px"></asp:TextBox>
                </td>
            </tr>
            <tr>
            <td>管理员回复时间：</td>
            <td>
                <asp:Label ID="Label4" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="style2">
                    &nbsp;</td>
                <td>
                    <asp:Button ID="Button1" runat="server" Text="回复" onclick="Button1_Click" />
                </td>
            </tr>
        </table>
    </asp:Panel>

    
    </div>
    </form>
</body>
</html>
