<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DonationsManagement.aspx.cs" Inherits="Alumni.Manage.tag.DonationsManagement" %>

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
    <style type="text/css">
        .style1
        {
            width: 100%;
        }
        .style2
        {
            width: 152px;
        }
        .style4
        {
            width: 156px;
        }
        .style5
        {
            width: 185px;
        }
        .style6
        {
            width: 189px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <br />
    <asp:Label ID="Label11" runat="server" Text="当前位置：其他管理&gt;&gt;捐赠管理" 
            Font-Size="10pt"></asp:Label>
        <br />
        <asp:Image ID="Image5" runat="server" Height="1px" Width="97%" 
            BackColor="Blue" />
        <br />
        <br />
    </div>
    <div>
    
    
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
            CellPadding="3" DataSourceID="SqlDataSource1" EnableModelValidation="True" 
            GridLines="None" Width="100%" 
            onselectedindexchanged="GridView1_SelectedIndexChanged1" 
            onrowdeleted="GridView1_RowDeleted" BackColor="White" BorderColor="White" 
            BorderStyle="Ridge" BorderWidth="2px" CellSpacing="1" 
            DataKeyNames="DonationId" PageSize="15" AllowPaging="True" 
            onpageindexchanging="GridView1_PageIndexChanging">
            <Columns>
            
                <asp:TemplateField HeaderText="序号" InsertVisible="False">
                    <ItemStyle HorizontalAlign="Center" />
                        <HeaderStyle HorizontalAlign="Center" Width="5%" />
                    <ItemTemplate>
                     <asp:Label ID="Label12" runat="server" Text='<%# this.GridView1.PageIndex * this.GridView1.PageSize + this.GridView1.Rows.Count + 1%>'/>
                    </ItemTemplate>
             </asp:TemplateField>
                <asp:BoundField DataField="Name" HeaderText="捐款人" SortExpression="Name" />
                <asp:BoundField DataField="Amount" HeaderText="捐款数" 
                    SortExpression="Amount" />
                <asp:BoundField DataField="Date" HeaderText="捐款时间" DataFormatString="{0:yyyy-MM-dd}" SortExpression="Date" />
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
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:AlumniConnectionString %>" 
            SelectCommand="SELECT * FROM [Donations]"></asp:SqlDataSource>
                    <asp:Label ID="Label2" runat="server" Text="Label" Visible="False"></asp:Label>
        <br />
        <asp:Button ID="Button1" runat="server" Text="添加捐献记录" onclick="Button1_Click" />
        <br />
        <asp:Panel ID="panel1" runat="server" Visible="False">
        <table class="style1">
            <tr>
                <td class="style5">
                    捐献人或组织名称：</td>
                <td>
                    <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                        ControlToValidate="TextBox1" ErrorMessage="名称不能为空"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="style5">
                    捐献金额：</td>
                <td>
                    <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                        ControlToValidate="TextBox2" ErrorMessage="金额不能为空"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="style5">
                    捐赠时间：</td>
                <td>
                    <asp:TextBox ID="TextBox19" runat="server"></asp:TextBox>
                    <asp:RangeValidator ID="RangeValidator1" runat="server" 
                        ControlToValidate="TextBox19" ErrorMessage="RangeValidator" 
                        MaximumValue="2111/12/31" MinimumValue="1900/01/01" Type="Date"></asp:RangeValidator>
                    <br />
                    <asp:Button ID="Button2" runat="server" onclick="Button2_Click" Text="确认添加" />
                </td>
            </tr>
        </table>
        </asp:Panel>
    
        <br />
    <asp:Panel ID="panel2" runat="server" Visible="False">
        <table class="style1">
            <tr>
                <td class="style6">
                    捐献人或组织名称：</td>
                <td>
                    <asp:TextBox ID="TextBox3" runat="server" style="margin-left: 4px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="style6">
                    捐献金额：</td>
                <td>
                    <asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="style6">
                    当前捐献时间：</td>
                <td>
                    <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="style6">
                    <asp:CheckBox ID="CheckBox1" runat="server" AutoPostBack="True" 
                        oncheckedchanged="CheckBox1_CheckedChanged" />
                    是否选择新的捐献时间：</td>
                <td>
                    <asp:TextBox ID="TextBox5" runat="server" Enabled="False"></asp:TextBox>
                    <asp:RangeValidator ID="RangeValidator2" runat="server" 
                        ControlToValidate="TextBox5" ErrorMessage="RangeValidator" 
                        MaximumValue="2111/12/31" MinimumValue="1900/01/01" Type="Date"></asp:RangeValidator>
                    <br />
                    <asp:Button ID="Button3" runat="server" Text="确认修改" onclick="Button3_Click" />
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
