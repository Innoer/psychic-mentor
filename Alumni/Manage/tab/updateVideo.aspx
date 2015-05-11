<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="updateVideo.aspx.cs" Inherits="Alumni.Manage.tab.updateVideo" %>

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
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <br />
    <asp:Label ID="Label11" runat="server" Text="当前位置：视频管理&gt;&gt;修改视频" 
            Font-Size="10pt"></asp:Label>
        <br />
        <asp:Image ID="Image5" runat="server" Height="1px" Width="97%" 
            BackColor="Blue" />
        <br />
        <br />
    </div>
    <div>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
            EnableModelValidation="True" AllowPaging="True" Width="100%"
            onpageindexchanging="GridView1_PageIndexChanging" 
            onselectedindexchanged="GridView1_SelectedIndexChanged" CellPadding="3" 
            DataKeyNames="VideoID" GridLines="None" BackColor="White" 
            BorderColor="White" BorderStyle="Ridge" BorderWidth="2px" CellSpacing="1" 
            PageSize="15">
            <Columns>
            
                <asp:BoundField DataField="VideoTitle" HeaderText="标题" 
                    SortExpression="VideoTitle" />
                <asp:BoundField DataField="VideoIntroduction" HeaderText="介绍" 
                    SortExpression="VideoIntroduction" />
                <asp:BoundField DataField="VideoUploadTime" HeaderText="上传时间" 
                    SortExpression="VideoUploadTime" />
                <asp:BoundField DataField="UserName" HeaderText="视频主" SortExpression="UserName" />
                <asp:ButtonField CommandName="select" Text="修改" ButtonType="Link" 
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
        <br />
        <asp:Label ID="Label12" runat="server" Text="暂时没有可用视频" Visible="False"></asp:Label>
    <asp:Panel ID="Panel1" runat="server" Visible="false">
        <asp:Label ID="Label2" runat="server" Text="视频标题："></asp:Label>
&nbsp;<asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
        <br />
        <br />
        <asp:Label ID="Label3" runat="server" Text="视频简介："></asp:Label>
&nbsp;<asp:TextBox ID="TextBox2" runat="server" Rows="10" TextMode="MultiLine" 
            Width="543px"></asp:TextBox>
        <br />
        <br />
        <asp:Label ID="Label6" runat="server" Text="URL："></asp:Label>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="TextBox5" runat="server" Width="539px"></asp:TextBox>
        <br />
        <asp:Label ID="Label7" runat="server" Text="Label" Visible="False"></asp:Label>
        <asp:Label ID="Label8" runat="server" Text="Label" Visible="False"></asp:Label>
        <asp:Label ID="Label9" runat="server"></asp:Label>
        <asp:Label ID="Label10" runat="server" Text="Label" Visible="False"></asp:Label>
        <br />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="Button1" runat="server" onclick="Button1_Click" Text="修改" />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="Button2" runat="server" onclick="Button2_Click" Text="清空" />
    </asp:Panel>
    </div>
    </form>
    <script type="text/javascript" src="../bootstrap/js/jquery-2.1.3.min.js"></script>

    <script type="text/javascript" src="../bootstrap/js/bootstrap.min.js"></script>
</body>
</html>
