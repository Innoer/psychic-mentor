<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DonationsManagement.aspx.cs" Inherits="Alumni.Manage.tag.DonationsManagement" %>

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
            width: 152px;
        }
        .style3
        {
            width: 235px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <asp:Label ID="Label3" runat="server" Text="当前位置：捐献管理"></asp:Label>
    
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
            CellPadding="4" DataSourceID="SqlDataSource1" EnableModelValidation="True" 
            ForeColor="#333333" GridLines="None" Width="100%" 
            DataKeyNames="DonationId" 
            onselectedindexchanged="GridView1_SelectedIndexChanged1" 
            onrowdeleted="GridView1_RowDeleted">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
            <asp:TemplateField>
	            <ItemTemplate>
		            <asp:Button ID="editButton" runat="server" CommandName="Select" Text="修改捐献信息" />
	            </ItemTemplate>
            </asp:TemplateField>
                <asp:BoundField DataField="DonationId" HeaderText="存根号" 
                    InsertVisible="False" ReadOnly="True" SortExpression="DonationId" />
                <asp:BoundField DataField="Name" HeaderText="捐款人" SortExpression="Name" />
                <asp:BoundField DataField="Amount" HeaderText="捐款数" 
                    SortExpression="Amount" />
                <asp:BoundField DataField="Date" HeaderText="捐款时间" SortExpression="Date" />
            </Columns>
            <EditRowStyle BackColor="#2461BF" />
            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#EFF3FB" />
            <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
            SelectCommand="SELECT * FROM [Donations]"></asp:SqlDataSource>
        <br />
        <asp:Button ID="Button1" runat="server" Text="添加捐献记录" onclick="Button1_Click" />
        <br />
        <asp:Panel ID="panel1" runat="server" Visible="False">
        <table class="style1">
            <tr>
                <td class="style2">
                    捐献人或组织名称：</td>
                <td>
                    <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                        ControlToValidate="TextBox1" ErrorMessage="名称不能为空"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="style2">
                    捐献金额：</td>
                <td>
                    <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                        ControlToValidate="TextBox2" ErrorMessage="金额不能为空"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="style2">
                    捐赠时间：</td>
                <td>
                    <asp:Calendar ID="Calendar1" runat="server" BackColor="White" 
                        BorderColor="Black" BorderStyle="Solid" CellSpacing="1" Font-Names="Verdana" 
                        Font-Size="9pt" ForeColor="Black" Height="250px" NextPrevFormat="ShortMonth" 
                        Width="330px">
                        <DayHeaderStyle Font-Bold="True" Font-Size="8pt" ForeColor="#333333" 
                            Height="8pt" />
                        <DayStyle BackColor="#CCCCCC" />
                        <NextPrevStyle Font-Bold="True" Font-Size="8pt" ForeColor="White" />
                        <OtherMonthDayStyle ForeColor="#999999" />
                        <SelectedDayStyle BackColor="#333399" ForeColor="White" />
                        <TitleStyle BackColor="#333399" BorderStyle="Solid" Font-Bold="True" 
                            Font-Size="12pt" ForeColor="White" Height="12pt" />
                        <TodayDayStyle BackColor="#999999" ForeColor="White" />
                    </asp:Calendar>
                    <asp:Button ID="Button2" runat="server" onclick="Button2_Click" Text="确认添加" />
                </td>
            </tr>
        </table>
        </asp:Panel>
    
        <br />
    <asp:Panel ID="panel2" runat="server" Visible="False">
        <table class="style1">
            <tr>
                <td class="style3">
                    捐献人或组织名称：</td>
                <td>
                    <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="style3">
                    捐献金额：</td>
                <td>
                    <asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="style3">
                    当前捐献时间：</td>
                <td>
                    <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
                    <asp:Label ID="Label2" runat="server" Text="Label" Visible="False"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="style3">
                    <asp:CheckBox ID="CheckBox1" runat="server" AutoPostBack="True" 
                        oncheckedchanged="CheckBox1_CheckedChanged" />
                    是否选择新的捐献时间：</td>
                <td>
                    <asp:Calendar ID="Calendar2" runat="server" Enabled="False" BackColor="White" 
                        BorderColor="Black" BorderStyle="Solid" CellSpacing="1" Font-Names="Verdana" 
                        Font-Size="9pt" ForeColor="Black" Height="250px" NextPrevFormat="ShortMonth" 
                        Width="430px">
                        <DayHeaderStyle Font-Bold="True" Font-Size="8pt" ForeColor="#333333" 
                            Height="8pt" />
                        <DayStyle BackColor="#CCCCCC" />
                        <NextPrevStyle Font-Bold="True" Font-Size="8pt" ForeColor="White" />
                        <OtherMonthDayStyle ForeColor="#999999" />
                        <SelectedDayStyle BackColor="#333399" ForeColor="White" />
                        <TitleStyle BackColor="#333399" BorderStyle="Solid" Font-Bold="True" 
                            Font-Size="12pt" ForeColor="White" Height="12pt" />
                        <TodayDayStyle BackColor="#999999" ForeColor="White" />
                    </asp:Calendar>
                    <asp:Button ID="Button3" runat="server" Text="确认修改" onclick="Button3_Click" />
                </td>
            </tr>
        </table>
    </asp:Panel>
    </div>
    </form>
</body>
</html>
