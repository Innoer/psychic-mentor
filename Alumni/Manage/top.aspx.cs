﻿using System;
using System.Collections.Generic;

using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_top : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            if (Session["logged"].ToString() != "true")
               
            Response.Write(" <script> parent.window.location.href= 'tab/overTime.htm' </script> ");
        }
        catch (Exception)
        {
            Response.Write(" <script> parent.window.location.href= 'tab/overTime.htm' </script> ");
        }
       
       
    }
    //protected void Unnamed1_Click1(object sender, ImageClickEventArgs e)
    //{
    //    //Response.Write("<script>var flag = confirm('确认退出？'); if(flag == true) window.close();</script>");
    //    Response.Write("<script>window.close();</script>");
    //}
}
