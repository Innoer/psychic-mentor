<%@ Page Language="C#" ValidateRequest="false" AutoEventWireup="true" CodeBehind="Article.aspx.cs" Inherits="Alumni.Manage.WebForm1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script type="text/javascript" src="/Template/Common/ckeditor/ckeditor.js"></script>
</head>
<body>
    <form id="form1" runat="server">
    Sorted by IsStickTop, Thenby PublishDate.<br />
    <asp:GridView ID="GridView" runat="server" AutoGenerateColumns="False" 
        CellPadding="4" DataKeyNames="ArticleID" DataSourceID="SqlDataSource" 
        EnableModelValidation="True" ForeColor="#333333" GridLines="None" 
        onselectedindexchanged="GridView_SelectedIndexChanged" 
        onrowdeleting="GridView_RowDeleting">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:TemplateField>
	            <ItemTemplate>
		            <asp:Button ID="editButton" runat="server" CommandName="Select" Text="Edit" />
	            </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField>
	            <ItemTemplate>
		            <asp:Button ID="deleteButton" runat="server" CommandName="Delete" Text="Delete" OnClientClick="return confirm('Are you sure you want to delete this item?');" />
	            </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="ArticleID" HeaderText="ArticleID" 
                InsertVisible="False" ReadOnly="True" SortExpression="ArticleID" />
            <asp:BoundField DataField="ColumnName" HeaderText="ColumnName" 
                SortExpression="ColumnName" />
            <asp:BoundField DataField="PublishDate" HeaderText="PublishDate" 
                SortExpression="PublishDate" />
            <asp:BoundField DataField="VisitCount" HeaderText="VisitCount" 
                SortExpression="VisitCount" />
            <asp:CheckBoxField DataField="IsStickTop" HeaderText="IsStickTop" 
                SortExpression="IsStickTop" />
            <asp:BoundField DataField="Title" HeaderText="Title" SortExpression="Title" />
            <asp:BoundField DataField="Keywords" HeaderText="Keywords" 
                SortExpression="Keywords" />
            <asp:BoundField DataField="Source" HeaderText="Source" 
                SortExpression="Source" />
        </Columns>
        <EditRowStyle BackColor="#2461BF" />
        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#EFF3FB" />
        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
    </asp:GridView>
    <br />
    <asp:Button ID="btnAdd" runat="server" onclick="btnAdd_Click" 
        Text="+ Add New" />
    <asp:Panel ID="panelView" runat="server" Visible="False">
        <asp:Button ID="btnSubmit" runat="server" CommandName="Submit" 
            oncommand="PanelView_Command" Text="Submit" />
        &nbsp;<asp:Button ID="btnCancel" runat="server" CommandName="Cancel" 
            oncommand="PanelView_Command" Text="Cancel" />
        <asp:HiddenField ID="fieldArticleID" runat="server" />
        <br />
        (* - Required)<br /> * ColumnName:
        <asp:DropDownList ID="dropColumn" runat="server">
        </asp:DropDownList>
        <br />
        * IsStickTop:&nbsp;
        <asp:CheckBox ID="checkIsStickTop" runat="server" />
        <br />
        * Title:
        <asp:TextBox ID="textTitle" runat="server" Width="576px"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
            ControlToValidate="textTitle" ErrorMessage="Required" SetFocusOnError="True"></asp:RequiredFieldValidator>
        <br />
        PictureURL:
        <asp:TextBox ID="textPicURL" runat="server" Width="539px"></asp:TextBox>
        <br />
        * Keywords (separated by |):
        <asp:TextBox ID="textKeywords" runat="server" style="margin-top: 0px" 
            Width="410px"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
            ControlToValidate="textKeywords" ErrorMessage="Required" SetFocusOnError="True"></asp:RequiredFieldValidator>
        &nbsp;<br /> * Source:
        <asp:TextBox ID="textSource" runat="server" Width="391px"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
            ControlToValidate="textSource" ErrorMessage="Required" SetFocusOnError="True"></asp:RequiredFieldValidator>
        <br />
        * Content:<br />
        <asp:TextBox ID="textContent" runat="server" CssClass="ckeditor" Rows="10" 
            TextMode="MultiLine"></asp:TextBox>
    </asp:Panel>
    <br />
    <asp:SqlDataSource ID="SqlDataSource" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
        
        SelectCommand="SELECT Articles.ArticleID, Columns.ColumnName, Users.UserName, Articles.PublishDate, Articles.VisitCount, Articles.IsStickTop, Articles.Title, Articles.Keywords, Articles.Source FROM Articles INNER JOIN Columns ON Articles.ColumnID = Columns.ColumnID INNER JOIN Users ON Articles.PublishUserID = Users.UserID ORDER BY Articles.IsStickTop DESC, Articles.PublishDate DESC">
    </asp:SqlDataSource>
    </form>
</body>
</html>
