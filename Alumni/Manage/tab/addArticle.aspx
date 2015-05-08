<%@ Page Language="C#" ValidateRequest="false" AutoEventWireup="true" CodeBehind="addArticle.aspx.cs" Inherits="Alumni.Manage.tab.addArticle" %>

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
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <br />
    <asp:Label ID="Label11" runat="server" Text="当前位置：文章管理&gt;&gt;增加文章" 
            Font-Size="10pt"></asp:Label>
        <br />
        <asp:Image ID="Image5" runat="server" Height="1px" Width="97%" 
            BackColor="Blue" />
        <br />
        <br />
    </div>
    <div>
    <asp:Panel runat="server" Visible="true">
        
        * 类别:&nbsp;
        <asp:DropDownList ID="dropColumn" runat="server">
        </asp:DropDownList>
        <br />
        * 置顶:&nbsp;
        <asp:CheckBox ID="checkIsStickTop" runat="server" 
            oncheckedchanged="checkIsStickTop_CheckedChanged" />
        <br />
        * 标题:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="textTitle" runat="server" Width="520px"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
            ControlToValidate="textTitle" ErrorMessage="Required" SetFocusOnError="True"></asp:RequiredFieldValidator>
        <br />
        * 图片URL:
        <asp:TextBox ID="textPicURL" runat="server" Width="518px"></asp:TextBox>
        <br />
        * 关键字 (以 | 分割):
        <asp:TextBox ID="textKeywords" runat="server" style="margin-top: 0px" 
            Width="470px"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
            ControlToValidate="textKeywords" ErrorMessage="Required" SetFocusOnError="True"></asp:RequiredFieldValidator>
        &nbsp;<br /> * 来源:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="textSource" runat="server" Width="520px"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
            ControlToValidate="textSource" ErrorMessage="Required" SetFocusOnError="True"></asp:RequiredFieldValidator>
        <br />
        * 内容:<br />
        <CKEditor:CKEditorControl ID="textContent" runat="server">
        </CKEditor:CKEditorControl>
        
        <br />
        <asp:Button ID="Button1" runat="server" onclick="Button1_Click" Text="添加" />
    </asp:Panel>
    </div>
    </form>
    <script type="text/javascript" src="../bootstrap/js/jquery-2.1.3.min.js"></script>

    <script type="text/javascript" src="../bootstrap/js/bootstrap.min.js"></script>
</body>
</html>
