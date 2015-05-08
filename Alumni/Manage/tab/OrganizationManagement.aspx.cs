using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Alumni.Manage.tag
{
    public partial class OrganizationManagement : System.Web.UI.Page
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

        protected void Button1_Click(object sender, EventArgs e)
        {
            DBDataContext context = new DBDataContext();
            var orga = new AlumniDB.Organizations
            {
                OrganizationName = TextBox1.Text,
                OrganizationURL = TextBox2.Text
            };
            context.Organizations.InsertOnSubmit(orga);
            context.SubmitChanges();
            GridView1.DataBind();
            Response.Redirect("/Manage/tab/ModifyAlumnus.aspx", true);
        }

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            e.Cancel = true;

            int articleID = Convert.ToInt32(e.Keys[0]);
            DBDataContext context = new DBDataContext();
            var article = context.Organizations.Single(item => item.OrganizationID == articleID);
            context.Organizations.DeleteOnSubmit(article);

            context.SubmitChanges();
            Response.Redirect("/Manage/tab/OrganizationManagement.aspx", true);
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            Panel1.Visible = false;
            Panel2.Visible = true;
            DBDataContext context = new DBDataContext();
            int articleID = Convert.ToInt32(GridView1.SelectedValue);
            TextBox3.Text = articleID.ToString();
            var ID = int.Parse(TextBox3.Text.ToString());
            var article = context.Organizations.First(ar => ar.OrganizationID == ID);

            TextBox4.Text = article.OrganizationName;
            TextBox5.Text = article.OrganizationURL;

        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Panel2.Visible = false;
            Panel1.Visible = true;
            DBDataContext context = new DBDataContext();
            var articleID = int.Parse(TextBox3.Text.ToString());
            var article = context.Organizations.Single(item => item.OrganizationID == articleID);

            article.OrganizationName = TextBox4.Text;
            article.OrganizationURL = TextBox5.Text;

            context.SubmitChanges();
            Response.Redirect("/Manage/tab/OrganizationManagement.aspx", true);
            
        }
    }
}