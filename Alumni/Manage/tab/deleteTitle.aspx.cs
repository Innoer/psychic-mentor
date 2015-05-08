using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Alumni.Manage.tab
{
    public partial class deleteTitle : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (Session["logged"].ToString() != "true")
                    Response.Write(" <script> parent.parent.window.location.href= 'overTime.htm' </script> ");
            }
            catch (Exception)
            {
                Response.Write(" <script> parent.parent.window.location.href= 'overTime.htm' </script> ");
            }
        }

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            e.Cancel = true;

            int articleID = Convert.ToInt32(e.Keys[0]);
            DBDataContext context = new DBDataContext();
            var article = context.Columns.Single(item => item.ColumnID == articleID);
            context.Columns.DeleteOnSubmit(article);

            context.SubmitChanges();
            Response.Redirect("/Manage/tab/deleteTitle.aspx", true);
        }
    }
}