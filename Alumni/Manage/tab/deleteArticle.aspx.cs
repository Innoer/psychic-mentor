using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Alumni.Manage.tab
{
    public partial class deleteArticle : System.Web.UI.Page
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

        protected void GridView_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            e.Cancel = true;

            int articleID = Convert.ToInt32(e.Keys[0]);
            TextBox3.Text = articleID.ToString();
            var ID = int.Parse(TextBox3.Text.ToString());
            DBDataContext context = new DBDataContext();
            var article = context.Articles.Single(item => item.ArticleID == ID);
            context.Articles.DeleteOnSubmit(article);

            context.SubmitChanges();
            GridView.DataBind();
        }
    }
}