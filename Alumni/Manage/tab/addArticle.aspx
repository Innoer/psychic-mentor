<%@ Page Language="C#" ValidateRequest="false" AutoEventWireup="true" CodeBehind="addArticle.aspx.cs" Inherits="Alumni.Manage.tab.addArticle" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script type="text/javascript" src="/Template/Common/ckeditor/ckeditor.js"></script>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <asp:Panel runat="server" Visible="true">
        <asp:Label ID="Label1" runat="server" Text="当前位置：增加文章"></asp:Label>
        <br />
        * 类别:
        <asp:DropDownList ID="dropColumn" runat="server">
        </asp:DropDownList>
        <br />
        * 是否置顶:&nbsp;
        <asp:CheckBox ID="checkIsStickTop" runat="server" 
            oncheckedchanged="checkIsStickTop_CheckedChanged" Text="置顶" />
        <br />
        * 标题:
        <asp:TextBox ID="textTitle" runat="server" Width="576px"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
            ControlToValidate="textTitle" ErrorMessage="Required" SetFocusOnError="True"></asp:RequiredFieldValidator>
        <br />
        * 图片URL:
        <asp:TextBox ID="textPicURL" runat="server" Width="539px"></asp:TextBox>
        <br />
        * 关键字 (以 | 分割):
        <asp:TextBox ID="textKeywords" runat="server" style="margin-top: 0px" 
            Width="410px"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
            ControlToValidate="textKeywords" ErrorMessage="Required" SetFocusOnError="True"></asp:RequiredFieldValidator>
        &nbsp;<br /> * 来源:
        <asp:TextBox ID="textSource" runat="server" Width="391px"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
            ControlToValidate="textSource" ErrorMessage="Required" SetFocusOnError="True"></asp:RequiredFieldValidator>
        <br />
        * 内容:<br />
        <asp:TextBox ID="textContent" runat="server" CssClass="ckeditor" Rows="10" 
            TextMode="MultiLine"></asp:TextBox>
        <br />
        <asp:Button ID="Button1" runat="server" onclick="Button1_Click" Text="Button" />
    </asp:Panel>
    </div>
    </form>
</body>
</html>
