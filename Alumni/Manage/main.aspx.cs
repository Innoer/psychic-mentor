using System;
using System.Collections.Generic;

using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_main : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            if (Session["logged"].ToString() != "true")
                Response.Redirect("tab/overTime.htm", true);
        }
        catch (Exception)
        {
            Response.Redirect("tab/overTime.htm", true);
        }
    }
}
