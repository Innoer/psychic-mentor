<%@ Page Language="C#" AutoEventWireup="true" CodeFile="left.aspx.cs" Inherits="admin_left" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <script type="text/javascript">
        var he = document.body.clientHeight - 105
        document.write("<div id=tt style=height:" + he + ";overflow:hidden>")

        function redirectContent(targetStr) {
            var obj = parent.document.getElementById('mainContent');
            obj.src = targetStr;
        }
    </script>
    <table width="165" height="100%" border="0" cellpadding="0" cellspacing="0">
        <tr>
            <td height="28" >
                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                        <td width="19%">
                            &nbsp;<asp:Label 
                                ID="Label1" runat="server" Text=" "></asp:Label>
&nbsp;</td>
                        <td width="81%" height="20">
                            欢迎您</td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td height="28" >
                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                        <td width="19%">
                            &nbsp;
                        </td>
                        <td width="81%" height="20">
                            <span class="STYLE2">管理菜单</span>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td valign="top">
                <table width="151" border="0" align="center" cellpadding="0" cellspacing="0">
                    <tr>
                        <td>
                            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                <tr>
                                    <td height="23"  id="imgmenu1" class="style6"
                                        onmouseover="this.className='menu_title2';" onclick="showsubmenu(1)" 
                                        onmouseout="this.className='menu_title';">
                                        <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                            <tr>
                                                <td width="18%">
                                                    &nbsp;
                                                </td>
                                                <td width="82%" class="STYLE1">
                                                    栏目管理
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                                <tr>
                                    <td  id="submenu1" class="style7">
                                        <div class="sec_menu">
                                            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                <tr>
                                                    <td>
                                                        <table width="90%" border="0" align="center" cellpadding="0" cellspacing="0">
                                                            <tr>
                                                                <td width="16%" height="25">
                                                                    <div align="center">
                                                                        <asp:Image ID="Image1" runat="server" ImageUrl="~/Manage/images/button1.jpg" />
                                                                        </div>
                                                                </td>
                                                                <td width="84%" height="23">
                                                                    <table width="95%" border="0" cellspacing="0" cellpadding="0">
                                                                        <tr>
                                                                            <td onclick="redirectContent('tab/addTitle.aspx')"
                                                                                onmouseover="ShowNav()"
                                                                                onmouseout="HideNav()"
                                                                                <span class="style2">增加栏目</span>
                                                                            </td>
                                                                        </tr>
                                                                    </table>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td height="23">
                                                                    <div align="center">
                                                                        <asp:Image ID="Image2" runat="server" ImageUrl="~/Manage/images/button1.jpg" />
                                                                        </div>
                                                                </td>
                                                                <td height="23">
                                                                    <table width="95%" border="0" cellspacing="0" cellpadding="0">
                                                                        <tr>
                                                                            <td onclick="redirectContent('tab/deleteTitle.aspx')"
                                                                                onmouseover="this.style.borderStyle='solid';this.style.borderWidth='1';borderColor='#7bc4d3'; "
                                                                                onmouseout="this.style.borderStyle='none'" class="style3">
                                                                                <span class="STYLE3">删除栏目</span>
                                                                            </td>
                                                                        </tr>
                                                                    </table>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td width="16%" height="25">
                                                                    <div align="center">
                                                                        <asp:Image ID="Image3" runat="server" ImageUrl="~/Manage/images/button1.jpg" />
                                                                        </div>
                                                                </td>
                                                                <td width="84%" height="23">
                                                                    <table width="95%" border="0" cellspacing="0" cellpadding="0">
                                                                        <tr>
                                                                            <td onclick="redirectContent('tab/updateTitle.aspx')"
                                                                                onmouseover="ShowNav()"
                                                                                onmouseout="HideNav()"
                                                                                <span class="style2">修改栏目</span>
                                                                            </td>
                                                                        </tr>
                                                                    </table>
                                                                </td>
                                                            </tr>
                                                            
                                                           
                                                        </table>
                                                    </td>
                                                </tr>
                                            </table>
                                        </div>
                                    </td>
                                </tr>
                               
                                <tr>
                                    <td  id="Td4" class="style7">
                                        <div class="sec_menu">
                                            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                <tr>
                                                    <td>
                                                        
                                                    </td>
                                                </tr>
                                            </table>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
            <td valign="top">
                <table width="151" border="0" align="center" cellpadding="0" cellspacing="0">
                    <tr>
                        <td>
                            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                <tr>
                                    <td height="23"  id="Td1" class="style6"
                                        onmouseover="this.className='menu_title2';" onclick="showsubmenu(1)" 
                                        onmouseout="this.className='menu_title';">
                                        <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                            <tr>
                                                <td width="18%">
                                                    &nbsp;
                                                </td>
                                                <td width="82%" class="STYLE1">
                                                    文章管理
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                                <tr>
                                    <td  id="Td2" class="style7">
                                        <div class="sec_menu">
                                            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                <tr>
                                                    <td>
                                                        <table width="90%" border="0" align="center" cellpadding="0" cellspacing="0">
                                                            <tr>
                                                                <td width="16%" height="25">
                                                                    <div align="center">
                                                                        <asp:Image ID="Image4" runat="server" ImageUrl="~/Manage/images/button1.jpg" />
                                                                        </div>
                                                                </td>
                                                                <td width="84%" height="23">
                                                                    <table width="95%" border="0" cellspacing="0" cellpadding="0">
                                                                        <tr>
                                                                            <td onclick="redirectContent('tab/addArticle.aspx')"
                                                                                onmouseover="ShowNav()"
                                                                                onmouseout="HideNav()"
                                                                                <span class="style2">增加文章
                                                                            </td>
                                                                        </tr>
                                                                    </table>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td height="23">
                                                                    <div align="center">
                                                                        <asp:Image ID="Image5" runat="server" ImageUrl="~/Manage/images/button1.jpg" />
                                                                        </div>
                                                                </td>
                                                                <td height="23">
                                                                    <table width="95%" border="0" cellspacing="0" cellpadding="0">
                                                                        <tr>
                                                                            <td onclick="redirectContent('tab/deleteArticle.aspx')"
                                                                                onmouseover="this.style.borderStyle='solid';this.style.borderWidth='1';borderColor='#7bc4d3'; "
                                                                                onmouseout="this.style.borderStyle='none'" class="style3">
                                                                                <span class="STYLE3">删除文章</span>
                                                                            </td>
                                                                        </tr>
                                                                    </table>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td width="16%" height="25">
                                                                    <div align="center">
                                                                        <asp:Image ID="Image6" runat="server" ImageUrl="~/Manage/images/button1.jpg" />
                                                                        </div>
                                                                </td>
                                                                <td width="84%" height="23">
                                                                    <table width="95%" border="0" cellspacing="0" cellpadding="0">
                                                                        <tr>
                                                                            <td onclick="redirectContent('tab/updateArticle.aspx')"
                                                                                onmouseover="ShowNav()"
                                                                                onmouseout="HideNav()"
                                                                                <span class="style2">修改文章
                                                                            </td>
                                                                        </tr>
                                                                    </table>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td width="16%" height="25">
                                                                    <div align="center">
                                                                        <asp:Image ID="Image7" runat="server" ImageUrl="~/Manage/images/button1.jpg" />
                                                                        </div>
                                                                </td>
                                                                <td width="84%" height="23">
                                                                    <table width="95%" border="0" cellspacing="0" cellpadding="0">
                                                                        <tr>
                                                                            <td onclick="redirectContent('tab/searchArticle.aspx')"
                                                                                onmouseover="ShowNav()"
                                                                                onmouseout="HideNav()"
                                                                                <span class="style2">查询文章</td>
                                                                        </tr>
                                                                    </table>
                                                                </td>
                                                            </tr>
                                                           
                                                        </table>
                                                    </td>
                                                </tr>
                                            </table>
                                        </div>
                                    </td>
                                </tr>
                               
                                <tr>
                                    <td  id="Td3" class="style7">
                                        <div class="sec_menu">
                                            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                <tr>
                                                    <td>
                                                        
                                                    </td>
                                                </tr>
                                            </table>
                                        </div>
                                    </td>
                                </tr>
                                
                                <tr>
            <td valign="top">
                <table width="151" border="0" align="center" cellpadding="0" cellspacing="0">
                    <tr>
                        <td>
                            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                <tr>
                                    <td height="23"  id="Td7" class="style6"
                                        onmouseover="this.className='menu_title2';" onclick="showsubmenu(1)" 
                                        onmouseout="this.className='menu_title';">
                                        <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                            <tr>
                                                <td width="18%">
                                                    &nbsp;
                                                </td>
                                                <td width="82%" class="STYLE1">
                                                    短消息管理
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                                <tr>
                                    <td  id="Td8" class="style7">
                                        <div class="sec_menu">
                                            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                <tr>
                                                    <td>
                                                        <table width="90%" border="0" align="center" cellpadding="0" cellspacing="0">
                                                            
                                                            <tr>
                                                                <td width="16%" height="25">
                                                                    <div align="center">
                                                                        <asp:Image ID="Image8" runat="server" ImageUrl="~/Manage/images/button1.jpg" />
                                                                        </div>
                                                                </td>
                                                                <td width="84%" height="23">
                                                                    <table width="95%" border="0" cellspacing="0" cellpadding="0">
                                                                        <tr>
                                                                            <td onclick="redirectContent('tab/searchSMS.aspx')"
                                                                                onmouseover="ShowNav()"
                                                                                onmouseout="HideNav()"
                                                                                <span class="style2">用户间短消息</td>
                                                                        </tr>
                                                                    </table>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td width="16%" height="25">
                                                                    <div align="center">
                                                                        <asp:Image ID="Image9" runat="server" ImageUrl="~/Manage/images/button1.jpg" />
                                                                        </div>
                                                                </td>
                                                                <td width="84%" height="23">
                                                                    <table width="95%" border="0" cellspacing="0" cellpadding="0">
                                                                        <tr>
                                                                            <td onclick="redirectContent('tab/CommentManagement.aspx')"
                                                                                onmouseover="ShowNav()"
                                                                                onmouseout="HideNav()"
                                                                                <span class="style2">用户与管理员短消息</td>
                                                                        </tr>
                                                                    </table>
                                                                </td>
                                                            </tr>
                                                           
                                                                    </table>
                                                                </td>
                                                            </tr>
                                                           
                                                        </table>
                                                    </td>
                                                </tr>
                                            </table>
                                        </div>
                                    </td>
                                </tr>
                               
                                <tr>
                                    <td  id="Td9" class="style7">
                                        <div class="sec_menu">
                                            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                <tr>
                                                    <td>
                                                        
                                                    </td>
                                                </tr>
                                            </table>
                                        </div>
                                    </td>
                                </tr>

                                <tr>
                                <td valign="top">
                <table width="151" border="0" align="center" cellpadding="0" cellspacing="0">
                    <tr>
                        <td>
                            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                <tr>
                                    <td height="23"  id="Td5" class="style6"
                                        onmouseover="this.className='menu_title2';" onclick="showsubmenu(1)" 
                                        onmouseout="this.className='menu_title';">
                                        <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                            <tr>
                                                <td width="18%">
                                                    &nbsp;
                                                </td>
                                                <td width="82%" class="STYLE1">
                                                    用户管理
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                                <tr>
                                    <td  id="Td6" class="style7">
                                        <div class="sec_menu">
                                            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                <tr>
                                                    <td>
                                                        <table width="90%" border="0" align="center" cellpadding="0" cellspacing="0">
                                                            <tr>
                                                                <td width="16%" height="25">
                                                                    <div align="center">
                                                                        <asp:Image ID="Image10" runat="server" ImageUrl="~/Manage/images/button1.jpg" />
                                                                        </div>
                                                                </td>
                                                                <td width="84%" height="23">
                                                                    <table width="95%" border="0" cellspacing="0" cellpadding="0">
                                                                        <tr>
                                                                            <td onclick="redirectContent('tab/UserManagement.aspx')"
                                                                                onmouseover="ShowNav()"
                                                                                onmouseout="HideNav()"
                                                                                <span class="style2">用户管理</td>
                                                                        </tr>
                                                                    </table>
                                                                </td>
                                                            </tr>
                                                           
                                                                    </table>
                                                                </td>
                                                            </tr>
                                                           
                                                        </table>
                                                    </td>
                                                </tr>
                                            </table>
                                        </div>
                                    </td>
                                </tr>
                               
                                <tr>
                                    <td  id="Td13" class="style7">
                                        <div class="sec_menu">
                                            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                <tr>
                                                    <td>
                                                        
                                                    </td>
                                                </tr>
                                            </table>
                                        </div>
                                    </td>
                                </tr>

                                <tr>

            <td valign="top">
                <table width="151" border="0" align="center" cellpadding="0" cellspacing="0">
                    <tr>
                        <td>
                            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                <tr>
                                    <td height="23"  id="Td10" class="style6"
                                        onmouseover="this.className='menu_title2';" onclick="showsubmenu(1)" 
                                        onmouseout="this.className='menu_title';">
                                        <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                            <tr>
                                                <td width="18%">
                                                    &nbsp;
                                                </td>
                                                <td width="82%" class="STYLE1">
                                                    校友管理
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                                <tr>
                                    <td  id="Td11" class="style7">
                                        <div class="sec_menu">
                                            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                <tr>
                                                    <td>
                                                        <table width="90%" border="0" align="center" cellpadding="0" cellspacing="0">
                                                            <tr>
                                                                <td width="16%" height="25">
                                                                    <div align="center">
                                                                        <asp:Image ID="Image11" runat="server" ImageUrl="~/Manage/images/button1.jpg" />
                                                                        </div>
                                                                </td>
                                                                <td width="84%" height="23">
                                                                    <table width="95%" border="0" cellspacing="0" cellpadding="0">
                                                                        <tr>
                                                                            <td onclick="redirectContent('tab/AddAlumnus.aspx')"
                                                                                onmouseover="ShowNav()"
                                                                                onmouseout="HideNav()"
                                                                                <span class="style2">增加校友
                                                                            </td>
                                                                        </tr>
                                                                    </table>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td height="23">
                                                                    <div align="center">
                                                                        <asp:Image ID="Image13" runat="server" ImageUrl="~/Manage/images/button1.jpg" />
                                                                        </div>
                                                                </td>
                                                                <td height="23">
                                                                    <table width="95%" border="0" cellspacing="0" cellpadding="0">
                                                                        <tr>
                                                                            <td onclick="redirectContent('tab/DelAlumnus.aspx')"
                                                                                onmouseover="this.style.borderStyle='solid';this.style.borderWidth='1';borderColor='#7bc4d3'; "
                                                                                onmouseout="this.style.borderStyle='none'" class="style3">
                                                                                <span class="STYLE3">删除校友</span>
                                                                            </td>
                                                                        </tr>
                                                                    </table>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td width="16%" height="25">
                                                                    <div align="center">
                                                                        <asp:Image ID="Image12" runat="server" ImageUrl="~/Manage/images/button1.jpg" />
                                                                        </div>
                                                                </td>
                                                                <td width="84%" height="23">
                                                                    <table width="95%" border="0" cellspacing="0" cellpadding="0">
                                                                        <tr>
                                                                            <td onclick="redirectContent('tab/ModifyAlumnus.aspx')"
                                                                                onmouseover="ShowNav()"
                                                                                onmouseout="HideNav()"
                                                                                <span class="style2">修改校友
                                                                            </td>
                                                                        </tr>
                                                                    </table>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td width="16%" height="25">
                                                                    <div align="center">
                                                                        <asp:Image ID="Image14" runat="server" ImageUrl="~/Manage/images/button1.jpg" />
                                                                        </div>
                                                                </td>
                                                                <td width="84%" height="23">
                                                                    <table width="95%" border="0" cellspacing="0" cellpadding="0">
                                                                        <tr>
                                                                            <td onclick="redirectContent('tab/SearchAlumnus.aspx')"
                                                                                onmouseover="ShowNav()"
                                                                                onmouseout="HideNav()"
                                                                                <span class="style2">查询校友
                                                                            </td>
                                                                        </tr>
                                                                    </table>
                                                                </td>
                                                            </tr>
                                                           
                                                        </table>
                                                    </td>
                                                </tr>
                                            </table>
                                        </div>
                                    </td>
                                </tr>
                               
                                <tr>
                                    <td  id="Td12" class="style7">
                                        <div class="sec_menu">
                                            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                <tr>
                                                    <td>
                                                        
                                                    </td>
                                                </tr>
                                            </table>
                                        </div>
                                    </td>
                                </tr>
                                <td valign="top">
                <table width="151" border="0" align="center" cellpadding="0" cellspacing="0">
                    <tr>
                        <td>
                            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                <tr>
                                    <td height="23"  id="Td14" class="style6"
                                        onmouseover="this.className='menu_title2';" onclick="showsubmenu(1)" 
                                        onmouseout="this.className='menu_title';">
                                        <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                            <tr>
                                                <td width="18%">
                                                    &nbsp;
                                                </td>
                                                <td width="82%" class="STYLE1">
                                                    其他管理
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                                <tr>
                                    <td  id="Td15" class="style7">
                                        <div class="sec_menu">
                                            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                <tr>
                                                    <td>
                                                        <table width="90%" border="0" align="center" cellpadding="0" cellspacing="0">
                                                            <tr>
                                                                <td width="16%" height="25">
                                                                    <div align="center">
                                                                        <asp:Image ID="Image15" runat="server" ImageUrl="~/Manage/images/button1.jpg" />
                                                                        </div>
                                                                </td>
                                                                <td width="84%" height="23">
                                                                    <table width="95%" border="0" cellspacing="0" cellpadding="0">
                                                                        <tr>
                                                                            <td onclick="redirectContent('tab/DonationsManagement.aspx')"
                                                                                onmouseover="ShowNav()"
                                                                                onmouseout="HideNav()"
                                                                                <span class="style2">捐献管理</td>
                                                                        </tr>
                                                                    </table>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td width="16%" height="25">
                                                                    <div align="center">
                                                                        <asp:Image ID="Image16" runat="server" ImageUrl="~/Manage/images/button1.jpg" />
                                                                        </div>
                                                                </td>
                                                                <td width="84%" height="23">
                                                                    <table width="95%" border="0" cellspacing="0" cellpadding="0">
                                                                        <tr>
                                                                            <td onclick="redirectContent('tab/OrganizationManagement.aspx')"
                                                                                onmouseover="ShowNav()"
                                                                                onmouseout="HideNav()"
                                                                                <span class="style2">校友会管理</td>
                                                                        </tr>
                                                                    </table>
                                                                </td>
                                                            </tr>
                                                            
                                                           
                                                                    </table>
                                                                </td>
                                                            </tr>
                                                           
                                                        </table>
                                                    </td>
                                                </tr>
                                            </table>
                                        </div>
                                    </td>
                                </tr>
                               
                                <tr>
                                    <td  id="Td16" class="style7">
                                        <div class="sec_menu">
                                            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                <tr>
                                                    <td>
                                                        
                                                    </td>
                                                </tr>
                                            </table>
                                        </div>
                                    </td>
                                </tr>

        <tr>
            <td height="28" >
                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                        <td width="19%">
                            &nbsp;
                        </td>
                        <td width="84%" height="23">
                                <table width="95%" border="0" cellspacing="0" cellpadding="0">
                                        <tr>
                                        <td>
                                            <asp:HyperLink ID="HyperLink1" runat="server" 
                                                NavigateUrl="~/Manage/LoginManage.aspx">回到主页</asp:HyperLink>
                                            </td>
                                        </tr>
                                </table>
                        </td>
                    </tr>
    </table>
    
                               
                                <tr>
                                    <td  id="Td19" class="style7">
                                        <div class="sec_menu">
                                            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                <tr>
                                                    <td>
                                                        
                                                    </td>
                                                </tr>
                                            </table>
                                        </div>
                                    </td>
                                </tr>

                                <tr>

            <td valign="top">
                <table width="151" border="0" align="center" cellpadding="0" cellspacing="0">
                    <tr>
                        <td>
                            &nbsp;


    </form>


</body>
</html>
<style type="text/css">
        *{
        margin-left: 0px;
        margin-right: 0px;
        margin-top: 0px;
    }
        <!-- body
        {
            margin-left: 0px;
            margin-top: 0px;
            margin-right: 0px;
            margin-bottom: 0px;
        }
        .STYLE1
        {
            font-size: 15px;
            color: #033d61;
        }
        .STYLE2
        {
            font-size: 18px;
            color: #033d61;
        }
        .STYLE3
        {
            font-size: 12px;
            color: #033d61;
        }
        -- ></style>
<style type="text/css">
    .menu_title SPAN
    {
        font-weight: bold;
        left: 3px;
        color: #ffffff;
        position: relative;
        top: 2px;
    }
    .menu_title2 SPAN
    {
        font-weight: bold;
        left: 3px;
        color: #FFCC00;
        position: relative;
        top: 2px;
    }
    .style2
    {
        font-size: 12px;
        color: #033d61;
        cursor: hand;
        height: 21px;
    }
    .style3
    {
        cursor: hand;
        height: 20px;
    }
    .style6
    {
        cursor: hand;
        width: 151px;
    }
    .style7
    {
        width: 151px;
    }
</style>
