<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="searchSMS.aspx.cs" Inherits="Alumni.Manage.tab.searchSMS" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <asp:Label ID="Label2" runat="server" Text="当前位置：用户间短消息"></asp:Label>
    
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
            AutoGenerateColumns="False" DataKeyNames="SMSID" DataSourceID="SqlDataSource1" 
            EnableModelValidation="True" 
            onselectedindexchanged="GridView1_SelectedIndexChanged" CellPadding="4" 
            ForeColor="#333333" GridLines="None">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:CommandField ShowDeleteButton="True" />
                <asp:ButtonField CommandName="select" Text="查看" ButtonType="Link" 
                                HeaderText="具体信息" >
                            <ItemStyle HorizontalAlign="Center" />
                            </asp:ButtonField>
                <asp:BoundField DataField="SMSID" HeaderText="存根号" InsertVisible="False" 
                    ReadOnly="True" SortExpression="SMSID" />
                <asp:BoundField DataField="SenderUserID" HeaderText="发送方ID" 
                    SortExpression="SenderUserID" />
                <asp:BoundField DataField="ReceiverUserID" HeaderText="接受方ID" 
                    SortExpression="ReceiverUserID" />
                <asp:BoundField DataField="SMSDate" HeaderText="发送时间" 
                    SortExpression="SMSDate" />
                <asp:CheckBoxField DataField="SMSReaded" HeaderText="是否已读" 
                    SortExpression="SMSReaded" />
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
        <asp:Label ID="Label1" runat="server"></asp:Label>
        <asp:TextBox ID="TextBox1" runat="server" Visible="False"></asp:TextBox>
        <br />
    
    </div>
    </form>
</body>
</html>
