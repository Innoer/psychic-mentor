<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="left.aspx.cs" Inherits="admin_left" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <meta charset="utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>

    <!-- viewport的<meta>标签，这个标签可以修改在大部分的移动设备上面的显示，为了确保适当的绘制和触屏缩放。-->

    <title></title>
    
    <!--样式文件引用-->

    <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css">

    <script type="text/javascript" src="js/jquery.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
             $(".div2").click(function () {
                 $(this).next("div").slideToggle("slow")
			    .siblings(".div3:visible").slideUp("slow");
            });
        });
    </script>
<style>
body{ margin:0;font-family:微软雅黑;}
.left{ width:164px; 
height:100%; border-right:1px solid #CCCCCC;#FFFFFF; color:#000000; font-size:14px; text-align:center;
    }
.div1{text-align:center; width:165px; padding-top:10px;}
.div2{height:40px; line-height:40px;cursor: pointer; font-size:13px; position:relative;border-bottom:#ccc 1px dotted;
        top: 0px;
        left: 0px;
    }
.lm {position: absolute; height: 20px; width: 20px; left: 20px; top: 10px; background:url(images/8.png);}
.wz {position: absolute; height: 20px; width: 20px; left: 20px; top: 10px; background:url(images/8.png);}
.sp {position: absolute; height: 20px; width: 20px; left: 20px; top: 10px; background:url(images/4.png);}
.xy {position: absolute; height: 20px; width: 20px; left: 20px; top: 10px; background:url(images/2.png);}
.dxx {position: absolute; height: 20px; width: 20px; left: 20px; top: 10px; background:url(images/8.png);}
.oth {position: absolute; height: 20px; width: 20px; left: 20px; top: 10px; background:url(images/1.png);}
.div3{display: none;cursor:pointer; font-size:13px;}
.div3 ul{margin:0;padding:0;}
.div3 li{ height:30px; line-height:30px; list-style:none; border-bottom:#ccc 1px dotted; text-align:center;}
</style>

</head>
<body  style="background-color: #FFFFFF;" >
    <form id="form1" runat="server">
    <script type="text/javascript">
        var he = document.body.clientHeight - 105
        document.write("<div id=tt style=height:" + he + ";overflow:hidden>")

        function redirectContent(targetStr) {
            var obj = parent.document.getElementById('mainContent');
            obj.src = targetStr;
        }
    </script>
    <div class="left">
        <div class="div1" style="background-color: #FFFFFF">
            <div class="left_top">&nbsp;</div>
  <div class="div2"><div class="lm"> </div>栏目管理</div>
      <div class="div3">
<ul>
		<li onclick="redirectContent('tab/addTitle.aspx')" onmouseover="ShowNav()" onmouseout="HideNav()"> 增加栏目</li>
        <li onclick="redirectContent('tab/updateTitle.aspx')"> 修改栏目</li>
		<li onclick="redirectContent('tab/deleteTitle.aspx')"> 删除栏目</li>  
</ul>
  </div>
    <div class="div2"><div class="wz"> </div>文章管理</div>
      <div class="div3">
      <ul>
        <li onclick="redirectContent('tab/searchArticle.aspx')"> 查询文章</li>
		<li onclick="redirectContent('tab/addArticle.aspx')"> 增加文章</li>
		<li onclick="redirectContent('tab/updateArticle.aspx')"> 修改文章</li>
        <li onclick="redirectContent('tab/deleteArticle.aspx')"> 删除文章</li>
        </ul>
 </div>
  <div class="div2"><div class="sp"> </div> 视频管理</div>
      <div class="div3">
      <ul>
        <li onclick="redirectContent('tab/SearchVideo.aspx')"> 查询视频</li>
		<li onclick="redirectContent('tab/addVideo.aspx')"> 增加视频</li>
		<li onclick="redirectContent('tab/updateVideo.aspx')"> 修改视频</li>
        <li onclick="redirectContent('tab/DeleVideo.aspx')"> 删除视频</li>
         </ul>
  </div>
  <div class="div2"><div class="xy"> </div> 校友管理</div>
      <div class="div3">
      <ul>
        <li onclick="redirectContent('tab/SearchAlumnus.aspx')"> 查询校友</li>
		<li onclick="redirectContent('tab/AddAlumnus.aspx')"> 增加校友</li>
        <li onclick="redirectContent('tab/ModifyAlumnus.aspx')"> 修改校友</li>
        <li onclick="redirectContent('tab/DelAlumnus.aspx')"> 删除校友</li>
         </ul>
  </div>
    <div class="div2"><div class="dxx"> </div> 短消息管理</div>
      <div class="div3">
      <ul>
		<li onclick="redirectContent('tab/searchSMS.aspx')"> 用户与用户</li>
		<li onclick="redirectContent('tab/CommentManagement.aspx')"> 用户与管理员</li>
         </ul>
  </div>
  <div class="div2"><div class="oth"> </div> 其他管理</div>
      <div class="div3">
      <ul>
		<li onclick="redirectContent('tab/DonationsManagement.aspx')"> 捐献管理</li>
		<li onclick="redirectContent('tab/OrganizationManagement.aspx')"> 校友会管理</li>
        <li onclick="redirectContent('tab/UserManagement.aspx')"> 用户管理</li>
         </ul>
  </div>
  <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Default.aspx" Target="_parent">回到主页</asp:HyperLink>
</div>



    </form>
    <script type="text/javascript" src="bootstrap/js/jquery-2.1.3.min.js"></script>

    <script type="text/javascript" src="bootstrap/js/bootstrap.min.js"></script>


</body>
</html>

