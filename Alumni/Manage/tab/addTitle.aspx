<%@ Page Language="C#" ValidateRequest="false" AutoEventWireup="true" CodeBehind="addTitle.aspx.cs" Inherits="Alumni.Manage.tab.addTitle" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script type="text/javascript" src="/Template/Common/ckeditor/ckeditor.js"></script>
     
    <style type="text/css">
        .style1
        {
            width: 756px;
        }
        .ckeditor
        {}
        .style2
        {
            height: 24px;
        }
        .style3
        {
            width: 756px;
            height: 24px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div align="left">
        <asp:Label ID="Label1" runat="server" Text="当前位置：增加栏目"></asp:Label>
        <br />
        <table>
            <tr>
                <td>
                    <asp:CheckBox ID="CheckBox2" runat="server" Text="一级标题" 
                        
                        oncheckedchanged="CheckBox2_CheckedChanged" AutoPostBack="True" />
                </td>
                <td class="style1">
                &nbsp;
                    <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="SqlDataSource1"
                        DataTextField="ColumnName" DataValueField="ColumnID">
                    </asp:DropDownList>
                    &nbsp;&nbsp;&nbsp;
                    <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    标题名：
                </td>
                <td class="style1">
                    &nbsp;
                   <asp:TextBox ID="textTitle" runat="server" Width="220px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    可见性：
                </td>
                <td class="style1">
                    &nbsp;
                    <asp:CheckBox ID="CheckBox1" runat="server" Text="可见"  />
                </td>
            </tr>
            <tr>
                <td class="style2">
                    可否删除：
                </td>
                <td class="style3">
                    &nbsp;
                    <asp:CheckBox ID="CheckBox3" runat="server" Text="可删除"  />
                </td>
            </tr>
            <tr>
                <td class="style2">
                    是否有特殊跳转：
                </td>
                <td class="style3">
                    &nbsp;
                    <asp:CheckBox ID="CheckBox4" runat="server" Text="是" AutoPostBack="True" 
                        oncheckedchanged="CheckBox4_CheckedChanged"  />
                </td>
            </tr>
            <tr>
                <td>
                    特殊跳转类别：
                </td>
                <td class="style1">
                    &nbsp;
                     <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" 
                        onselectedindexchanged="DropDownList1_SelectedIndexChanged">
                         <asp:ListItem Value="column">可跳转</asp:ListItem>
                         <asp:ListItem Value="content">有内容</asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td>
                    跳转位置：
                </td>
                <td class="style1">
                    &nbsp;
                     <asp:DropDownList ID="DropDownList3" runat="server" DataSourceID="SqlDataSource2"
                        DataTextField="ColumnName" DataValueField="ColumnID">
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td>
                    内容：
                </td>
                <td class="style1">
                    &nbsp;
                    <asp:TextBox ID="textContent" runat="server" CssClass="ckeditor" Rows="10" 
            TextMode="MultiLine" Width="100%"></asp:TextBox></td>
            </tr>
            <tr>
                <td>
                </td>
                <td class="style1">
                    &nbsp;
                    <asp:Button ID="Button1" runat="server" Text="确认添加" OnClick="Button1_Click" />
                </td>
            </tr>
        </table>
    </div>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:AlumniConnectionString %>" 
        
        SelectCommand="SELECT [ColumnName], [ColumnID] FROM [Columns] WHERE (ParentColumnID = 0)">
        <SelectParameters>
            <asp:Parameter DefaultValue="0" Name="ParentColumnID" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
        ConnectionString="<%$ ConnectionStrings:AlumniConnectionString %>" 
        SelectCommand="SELECT [ColumnID], [ColumnName] FROM [Columns]">
    </asp:SqlDataSource>
    </form>
</body>
</html>
