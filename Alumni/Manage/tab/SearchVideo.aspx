<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SearchVideo.aspx.cs" Inherits="Alumni.Manage.tab.SearchVideo" %>

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
    <asp:Label ID="Label11" runat="server" Text="当前位置：视频管理&gt;&gt;查看视频" 
            Font-Size="10pt"></asp:Label>
        <br />
        <asp:Image ID="Image5" runat="server" Height="1px" Width="97%" 
            BackColor="Blue" />
        <br />
        <br />
    </div>
    <div>

        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
            DataKeyNames="VideoID" 
            onselectedindexchanged="GridView1_SelectedIndexChanged" AllowPaging="True" 
            CellPadding="3" EnableModelValidation="True" 
            GridLines="None" onpageindexchanging="GridView1_PageIndexChanging" 
            Width="100%" BackColor="White" BorderColor="White" BorderStyle="Ridge" 
            BorderWidth="2px" CellSpacing="1" PageSize="15">
            <Columns>
            
                    <asp:BoundField DataField="VideoTitle" HeaderText="标题" 
                    SortExpression="VideoTitle" />
                <asp:BoundField DataField="VideoIntroduction" HeaderText="介绍" 
                    SortExpression="VideoIntroduction" />
                <asp:BoundField DataField="UserName" HeaderText="视频主" 
                    SortExpression="UserName" />
                <asp:BoundField DataField="VideoUploadTime" HeaderText="上传时间" SortExpression="VideoUploadTime" />
                <asp:ButtonField CommandName="select" Text="查看链接" ButtonType="Link" 
                                HeaderText="查看链接" >
                            <ItemStyle HorizontalAlign="Center" />
                            </asp:ButtonField>
            </Columns>
            <FooterStyle BackColor="#C6C3C6" ForeColor="Black" />
            <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#E7E7FF" />
            <PagerStyle BackColor="#C6C3C6" ForeColor="Black" HorizontalAlign="Right" />
            <RowStyle BackColor="#DEDFDE" ForeColor="Black" HorizontalAlign="Center" />
            <SelectedRowStyle BackColor="#9471DE" Font-Bold="True" ForeColor="White" />
        </asp:GridView>
        <asp:Panel ID="panel1" runat="server" Visible="False">
        <asp:Label ID="Label2" runat="server" Text="视频链接地址："></asp:Label>
        <asp:HyperLink ID="HyperLink1" runat="server">  </asp:HyperLink>
        </asp:Panel>
        <asp:Label ID="Label3" runat="server" Visible="False"></asp:Label>

        <br />

        <asp:Label ID="Label12" runat="server" Text="暂时没有可用视频" Visible="False"></asp:Label>
    </div>
    </form>
    <script type="text/javascript" src="../bootstrap/js/jquery-2.1.3.min.js"></script>

    <script type="text/javascript" src="../bootstrap/js/bootstrap.min.js"></script>
</body>
</html>
