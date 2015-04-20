<%@ Page Language="C#" ValidateRequest="false" AutoEventWireup="true" CodeBehind="updateTitle.aspx.cs" Inherits="Alumni.Manage.tab.updateTitle" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script type="text/javascript" src="/Template/Common/ckeditor/ckeditor.js"></script>
    <style type="text/css">
        .style1
        {
            height: 24px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:Label ID="Label1" runat="server" Text="当前位置：修改栏目"></asp:Label>
        <br />
    <table>
            <tr>
                <td>
                    
                </td>
                <td>
                    <asp:TextBox ID="TextBox1" runat="server" Visible="False"></asp:TextBox>
                    
                </td>
            </tr>
            <tr>
                <td class="style1">
                </td>
                <td colspan="2" class="style1">
                    <asp:GridView ID="newsGridView" runat="server" AutoGenerateColumns="False" 
                        DataKeyNames="ColumnID" DataSourceID="SqlDataSource1" 
        EnableModelValidation="True" 
        onselectedindexchanged="newsGridView_SelectedIndexChanged" 
         AllowPaging="True" CellPadding="4" ForeColor="#333333" GridLines="None">
                        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:ButtonField CommandName="select" Text="编辑" ButtonType="Link" 
                                HeaderText="编辑标题" >
                            <ItemStyle HorizontalAlign="Center" />
                            </asp:ButtonField>
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
               
        </Columns>
                        <EditRowStyle BackColor="#2461BF" />
                        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                        <RowStyle BackColor="#EFF3FB" />
                        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
    </asp:GridView>
                    <br />
                </td>
            </tr>
            <tr>
                <td>
                    <asp:CheckBox ID="CheckBox2" runat="server" Text="一级标题" 
                        AutoPostBack="True" 
                        oncheckedchanged="CheckBox2_CheckedChanged" />
                </td>
                <td class="style1">
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
                <td class="style1">
                    &nbsp;
                   <asp:TextBox ID="textTitle" runat="server" Width="220px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="style1">
                    可见性：
                </td>
                <td class="style1">
                    &nbsp;
                    <asp:CheckBox ID="CheckBox1" runat="server" Text="可见"  />
                </td>
            </tr>
            <tr>
                <td>
                    可否删除：
                </td>
                <td class="style1">
                    &nbsp;
                    <asp:CheckBox ID="CheckBox3" runat="server" Text="可删除"  />
                </td>
            </tr>
            <tr>
                <td>
                    是否有特殊跳转：
                </td>
                <td class="style1">
                    &nbsp;
                    <asp:CheckBox ID="CheckBox4" runat="server" Text="是" 
                        oncheckedchanged="CheckBox4_CheckedChanged" AutoPostBack="True"  />
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
                     <asp:DropDownList ID="DropDownList3" runat="server" DataSourceID="SqlDataSource3"
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
                    <asp:Button ID="Button1" runat="server" Text="确认修改" OnClick="Button1_Click" />
                </td>
            </tr>
        </table>
    
    
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
</body>
</html>
