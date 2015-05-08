using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Alumni.Manage
{
    public partial class left1 : System.Web.UI.Page
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
            Label1.Text = "当前用户："+Session["UserName"].ToString() ;
        }
    }
}