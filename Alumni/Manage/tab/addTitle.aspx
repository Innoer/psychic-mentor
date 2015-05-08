<%@ Page Language="C#" ValidateRequest="false" AutoEventWireup="true" CodeBehind="addTitle.aspx.cs" Inherits="Alumni.Manage.tab.addTitle" %>

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
    <div>
        <br />
    <asp:Label ID="Label11" runat="server" Text="当前位置：栏目管理&gt;&gt;增加栏目" 
            Font-Size="10pt"></asp:Label>
        <br />
        <asp:Image ID="Image5" runat="server" Height="1px" Width="97%" 
            BackColor="Blue" />
        <br />
        <br />
    </div>
    <div align="left">
        
        <table>
            <tr>
                <td>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:CheckBox ID="CheckBox2" runat="server" Text="一级标题" 
                        
                        oncheckedchanged="CheckBox2_CheckedChanged" AutoPostBack="True" />
                </td>
                <td class="style1">
                &nbsp;
                    <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="SqlDataSource1"
                        DataTextField="ColumnName" DataValueField="ColumnID">
                    </asp:DropDownList>
                    &nbsp;&nbsp;&nbsp;
                    <asp:TextBox ID="TextBox1" runat="server" Visible="False"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    标题名：
                </td>
                <td class="style1">
                    &nbsp;
                   <asp:TextBox ID="textTitle" runat="server" Width="219px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    可见：
                </td>
                <td class="style1">
                    <asp:CheckBox ID="CheckBox1" runat="server"  />
                </td>
            </tr>
            <tr>
                <td class="style2">
                    可删除：
                </td>
                <td class="style3">
                    <asp:CheckBox ID="CheckBox3" runat="server"  />
                </td>
            </tr>
            <tr>
                <td class="style2">
                    有特殊跳转：
                </td>
                <td class="style3">
                    <asp:CheckBox ID="CheckBox4" runat="server" AutoPostBack="True" 
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
                    <CKEditor:CKEditorControl ID="textContent" runat="server">
        </CKEditor:CKEditorControl>
                    
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
    <script type="text/javascript" src="../bootstrap/js/jquery-2.1.3.min.js"></script>

    <script type="text/javascript" src="../bootstrap/js/bootstrap.min.js"></script>
</body>
</html>
