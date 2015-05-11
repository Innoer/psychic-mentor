<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CommentManagement.aspx.cs" Inherits="Alumni.Manage.tag.CommentManagement" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>

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
    <div>
        <br />
    <asp:Label ID="Label11" runat="server" Text="当前位置：短消息管理&gt;&gt;用户与管理员" 
            Font-Size="10pt"></asp:Label>
        <br />
        <asp:Image ID="Image5" runat="server" Height="1px" Width="97%" 
            BackColor="Blue" />
        <br />
        <br />
    </div>
    <div>
    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
        AutoGenerateColumns="False" CellPadding="3" DataKeyNames="CommentID" 
        EnableModelValidation="True" 
        GridLines="None" onselectedindexchanged="GridView1_SelectedIndexChanged" 
        Width="100%" BackColor="White" BorderColor="White" BorderStyle="Ridge" 
        BorderWidth="2px" CellSpacing="1" PageSize="15" 
            onpageindexchanging="GridView1_PageIndexChanging">

        <Columns>
        
            
            <asp:BoundField DataField="CommentUserID" HeaderText="用户ID" 
                SortExpression="CommentUserID" />
            <asp:BoundField DataField="CommentDate" HeaderText="发送时间" 
                SortExpression="CommentDate" />
            <asp:BoundField DataField="AdminReplyDate" HeaderText="管理员回复时间" 
                SortExpression="AdminReplyDate" />
                <asp:ButtonField CommandName="select" Text="查看" ButtonType="Link" 
                                HeaderText="信息查看" >
                            <ItemStyle HorizontalAlign="Center" />
                            </asp:ButtonField>
        </Columns>
        <EditRowStyle HorizontalAlign="Center" />
        <FooterStyle BackColor="#C6C3C6" ForeColor="Black" HorizontalAlign="Center" />
        <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#E7E7FF" />
        <PagerStyle BackColor="#C6C3C6" ForeColor="Black" HorizontalAlign="Right" />
        <RowStyle BackColor="#DEDFDE" ForeColor="Black" HorizontalAlign="Center" />
        <SelectedRowStyle BackColor="#9471DE" Font-Bold="True" ForeColor="White" />
    </asp:GridView>
        <asp:Label ID="Label12" runat="server" Text="现在没有用户与管理员的短消息" Visible="False"></asp:Label>
    <asp:Label ID="Label5" runat="server" Text="Label" Visible="False"></asp:Label>
    </div>
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
    <script type="text/javascript" src="../bootstrap/js/jquery-2.1.3.min.js"></script>

    <script type="text/javascript" src="../bootstrap/js/bootstrap.min.js"></script>
</body>
</html>
