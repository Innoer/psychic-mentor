<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DeleVideo.aspx.cs" Inherits="Alumni.Manage.tab.DeleVideo" %>

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
    <asp:Label ID="Label11" runat="server" Text="当前位置：视频管理&gt;&gt;删除视频" 
            Font-Size="10pt"></asp:Label>
        <br />
        <asp:Image ID="Image5" runat="server" Height="1px" Width="97%" 
            BackColor="Blue" />
        <br />
        <br />
    </div>
    <div>
        <asp:GridView ID="GridView1" runat="server" 
            onselectedindexchanged="GridView1_SelectedIndexChanged" 
            AutoGenerateColumns="False" DataKeyNames="VideoID" 
            EnableModelValidation="True" 
            AllowPaging="True" CellPadding="3" GridLines="None" 
            onpageindexchanging="GridView1_PageIndexChanging" Width="100%" 
            BackColor="White" BorderColor="White" BorderStyle="Ridge" BorderWidth="2px" 
            CellSpacing="1" PageSize="5">
            <Columns>
            
            <asp:BoundField DataField="VideoID" HeaderText="ID" 
                    SortExpression="VideoID" Visible="False" />
                    <asp:BoundField DataField="VideoTitle" HeaderText="标题" 
                    SortExpression="VideoTitle" />
                <asp:BoundField DataField="VideoIntroduction" HeaderText="介绍" 
                    SortExpression="VideoIntroduction" />
                <asp:BoundField DataField="UserName" HeaderText="视频主" 
                    SortExpression="UserName" />
                <asp:BoundField DataField="VideoUploadTime" HeaderText="上传时间" SortExpression="VideoUploadTime" />
                <asp:ButtonField CommandName="select" Text="删除" ButtonType="Link" 
                                HeaderText="删除" >
                            <ItemStyle HorizontalAlign="Center" />
                            </asp:ButtonField>
            </Columns>
            <FooterStyle BackColor="#C6C3C6" ForeColor="Black" />
            <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#E7E7FF" />
            <PagerStyle BackColor="#C6C3C6" ForeColor="Black" HorizontalAlign="Right" />
            <RowStyle BackColor="#DEDFDE" ForeColor="Black" HorizontalAlign="Center" />
            <SelectedRowStyle BackColor="#9471DE" Font-Bold="True" ForeColor="White" />
        </asp:GridView>
    
        <asp:Label ID="Label2" runat="server" Text="Label" Visible="False"></asp:Label>
    
        <br />
    
        <asp:Label ID="Label12" runat="server" Text="暂时没有可用视频" Visible="False"></asp:Label><br />
    
    </div>
    </form>
    <script type="text/javascript" src="../bootstrap/js/jquery-2.1.3.min.js"></script>

    <script type="text/javascript" src="../bootstrap/js/bootstrap.min.js"></script>
</body>
</html>
