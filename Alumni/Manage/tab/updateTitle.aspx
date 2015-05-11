<%@ Page Language="C#" ValidateRequest="false" AutoEventWireup="true" CodeBehind="updateTitle.aspx.cs" Inherits="Alumni.Manage.tab.updateTitle" %>

<%@ Register assembly="CKEditor.NET" namespace="CKEditor.NET" tagprefix="CKEditor" %>
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
            height: 24px;
        }
        .style2
        {
            height: 24px;
            width: 755px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <br />
    <asp:Label ID="Label11" runat="server" Text="当前位置：栏目管理&gt;&gt;修改栏目" 
            Font-Size="10pt"></asp:Label>
        <br />
        <asp:Image ID="Image5" runat="server" Height="1px" Width="97%" 
            BackColor="Blue" />
        <br />
        <br />
    </div>
    <div>
        <asp:TextBox ID="TextBox1" runat="server" Visible="False"></asp:TextBox>
        <br />
    
                    <asp:GridView ID="newsGridView" runat="server" AutoGenerateColumns="False" 
                        DataKeyNames="ColumnID" DataSourceID="SqlDataSource1" 
        EnableModelValidation="True" Width="100%"
        onselectedindexchanged="newsGridView_SelectedIndexChanged" 
         AllowPaging="True" CellPadding="3" GridLines="None" BackColor="White" BorderColor="White" 
                        BorderStyle="Ridge" BorderWidth="2px" CellSpacing="1" 
            PageSize="15">
        <Columns>
           
            <asp:BoundField DataField="ColumnID" HeaderText="栏目编号" 
                InsertVisible="False" ReadOnly="True" SortExpression="ColumnID" />
            <asp:BoundField DataField="ParentColumnID" HeaderText="父栏目编号" 
                SortExpression="ParentColumnID" />
            <asp:BoundField DataField="SubTemplateID" HeaderText="样板ID" 
                SortExpression="SubTemplateID" />
            <asp:BoundField DataField="ColumnName" HeaderText="栏目名" 
                SortExpression="ColumnName" />
            <asp:CheckBoxField DataField="Visible" HeaderText="可见性" 
                SortExpression="Visible" />
            <asp:BoundField DataField="Deletable" HeaderText="可删性" SortExpression="Deletable" />
            <asp:BoundField DataField="IsSpecialCommand" HeaderText="是否有特殊跳转" 
                SortExpression="IsSpecialCommand" />
            <asp:BoundField DataField="SpecialCommandName" HeaderText="特殊跳转类别" 
                SortExpression="SpecialCommandName" />
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
   
   <asp:Panel ID="panel1" runat="server" Visible="true">
            <table>
            <tr>
                <td>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:CheckBox ID="CheckBox2" runat="server" Text="一级标题" 
                        AutoPostBack="True" 
                        oncheckedchanged="CheckBox2_CheckedChanged" />
                </td>
                <td class="style2">
                &nbsp;
                    <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="SqlDataSource2"
                        DataTextField="ColumnName" DataValueField="ColumnID">
                    </asp:DropDownList>
                    &nbsp;&nbsp;&nbsp;
                </td>
            </tr>
            <tr>
                <td>
                    标题名：
                </td>
                <td class="style2">
                    &nbsp;
                   <asp:TextBox ID="textTitle" runat="server" Width="220px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="style1">
                    可见：
                </td>
                <td class="style2">
                    <asp:CheckBox ID="CheckBox1" runat="server"  />
                </td>
            </tr>
            <tr>
                <td>
                    可删除：
                </td>
                <td class="style2">
                    <asp:CheckBox ID="CheckBox3" runat="server"  />
                </td>
            </tr>
            <tr>
                <td>
                    有特殊跳转：
                </td>
                <td class="style2">
                    <asp:CheckBox ID="CheckBox4" runat="server" 
                        oncheckedchanged="CheckBox4_CheckedChanged" AutoPostBack="True"  />
                </td>
            </tr>
            <tr>
                <td>
                    特殊跳转类别：
                </td>
                <td class="style2">
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
                <td class="style2">
                    &nbsp;
                     <asp:DropDownList ID="DropDownList3" runat="server" DataSourceID="SqlDataSource3"
                        DataTextField="ColumnName" DataValueField="ColumnID">
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td>
                    内容：
                </td>
                <td class="style2">
                    &nbsp;
                    <CKEditor:CKEditorControl ID="textContent" runat="server">
        </CKEditor:CKEditorControl>
                    
            </tr>
            <tr>
                <td>
                </td>
                <td class="style2">
                    &nbsp;
                    <asp:Button ID="Button1" runat="server" Text="确认修改" OnClick="Button1_Click" />
                </td>
            </tr>
        </table>
    </asp:Panel>
    
    </div>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:AlumniConnectionString %>" 
        SelectCommand="SELECT * FROM [Columns]"></asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
        ConnectionString="<%$ ConnectionStrings:AlumniConnectionString %>" 
        
        SelectCommand="SELECT [ColumnName], [ColumnID] FROM [Columns] WHERE (ParentColumnID = 0)">
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource3" runat="server" 
        ConnectionString="<%$ ConnectionStrings:AlumniConnectionString %>" 
        SelectCommand="SELECT [ColumnID], [ColumnName] FROM [Columns]">
    </asp:SqlDataSource>
    </form>
    <script type="text/javascript" src="../bootstrap/js/jquery-2.1.3.min.js"></script>

    <script type="text/javascript" src="../bootstrap/js/bootstrap.min.js"></script>
</body>
</html>
