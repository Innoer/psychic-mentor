<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="searchSMS.aspx.cs" Inherits="Alumni.Manage.tab.searchSMS" %>

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
    <asp:Label ID="Label11" runat="server" Text="当前位置：短消息管理&gt;&gt;用户与用户" 
            Font-Size="10pt"></asp:Label>
        <br />
        <asp:Image ID="Image5" runat="server" Height="1px" Width="97%" 
            BackColor="Blue" />
        <br />
        <br />
    </div>
    <div>
    
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
            AutoGenerateColumns="False" DataKeyNames="SMSID"  
            EnableModelValidation="True" Width="100%"
            onselectedindexchanged="GridView1_SelectedIndexChanged" CellPadding="3" 
            GridLines="None" onrowdeleting="GridView1_RowDeleting" BackColor="White" 
            BorderColor="White" BorderStyle="Ridge" BorderWidth="2px" CellSpacing="1" 
            PageSize="5" onpageindexchanging="GridView1_PageIndexChanging">
            <Columns>

                <asp:BoundField DataField="SenderUserID" HeaderText="发送方ID" 
                    SortExpression="SenderUserID" />
                <asp:BoundField DataField="ReceiverUserID" HeaderText="接受方ID" 
                    SortExpression="ReceiverUserID" />
                <asp:BoundField DataField="SMSDate" HeaderText="发送时间" 
                    SortExpression="SMSDate" />
                <asp:CheckBoxField DataField="SMSReaded" HeaderText="是否已读" 
                    SortExpression="SMSReaded" />
                <asp:ButtonField CommandName="select" Text="查看" ButtonType="Link" 
                                HeaderText="具体信息" >
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
            ConnectionString="<%$ ConnectionStrings:AlumniSNSConnectionString %>" 
            DeleteCommand="DELETE FROM [SMS] WHERE [SMSID] = @SMSID" 
            InsertCommand="INSERT INTO [SMS] ([SenderUserID], [ReceiverUserID], [SMSContent], [SMSDate], [SMSReaded]) VALUES (@SenderUserID, @ReceiverUserID, @SMSContent, @SMSDate, @SMSReaded)" 
            SelectCommand="SELECT * FROM [SMS]" 
            UpdateCommand="UPDATE [SMS] SET [SenderUserID] = @SenderUserID, [ReceiverUserID] = @ReceiverUserID, [SMSContent] = @SMSContent, [SMSDate] = @SMSDate, [SMSReaded] = @SMSReaded WHERE [SMSID] = @SMSID">
            <DeleteParameters>
                <asp:Parameter Name="SMSID" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="SenderUserID" Type="Int32" />
                <asp:Parameter Name="ReceiverUserID" Type="Int32" />
                <asp:Parameter Name="SMSContent" Type="String" />
                <asp:Parameter Name="SMSDate" Type="DateTime" />
                <asp:Parameter Name="SMSReaded" Type="Boolean" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="SenderUserID" Type="Int32" />
                <asp:Parameter Name="ReceiverUserID" Type="Int32" />
                <asp:Parameter Name="SMSContent" Type="String" />
                <asp:Parameter Name="SMSDate" Type="DateTime" />
                <asp:Parameter Name="SMSReaded" Type="Boolean" />
                <asp:Parameter Name="SMSID" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <asp:Label ID="Label12" runat="server" Text="现在没有用户与用户的短消息" Visible="False"></asp:Label>
        <asp:Label ID="Label1" runat="server"></asp:Label>
        <asp:TextBox ID="TextBox1" runat="server" Visible="False"></asp:TextBox>
        <br />
    
    </div>
    </form>
    <script type="text/javascript" src="../bootstrap/js/jquery-2.1.3.min.js"></script>

    <script type="text/javascript" src="../bootstrap/js/bootstrap.min.js"></script>
</body>
</html>
