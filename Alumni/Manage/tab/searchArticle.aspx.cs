using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Alumni.Manage.tab
{
    public partial class searchArticle : System.Web.UI.Page
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
            if (!IsPostBack)
            {
                DBDataContext context = new DBDataContext();

                TextBox1.Text = "all";
                var cols2 = from item in context.Columns
                           where item.ParentColumnID != SharedConfig.TopLevelParentID
                           select new ListItem { Value = item.ColumnID.ToString(), Text = item.ColumnName };

                dropColumn.Items.AddRange(cols2.ToArray());
                dropColumn.ClearSelection();

                
                var cols = from item in context.Articles
                           join items in context.Columns on item.ColumnID equals items.ColumnID
                           select new { item.ArticleID, items.ColumnName, item.PublishUserID, item.PublishDate, item.VisitCount, item.Title };
                GridView1.DataSource = cols;
                GridView1.DataBind();
            }

        }

        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            if (TextBox1.Text == "all")
            {
                DBDataContext context = new DBDataContext();
                var cols = from item in context.Articles
                           join items in context.Columns on item.ColumnID equals items.ColumnID
                           select new { item.ArticleID, items.ColumnName, item.PublishUserID, item.PublishDate, item.VisitCount, item.Title };
                GridView1.DataSource = cols;
                GridView1.PageIndex = e.NewPageIndex;
                GridView1.DataBind();
            }
            else
            {
                if (dropColumn.SelectedIndex != -1)
                {
                    DBDataContext context = new DBDataContext();
                    var cols = from item in context.Articles
                               join items in context.Columns on item.ColumnID equals items.ColumnID
                               where item.ColumnID == Convert.ToInt32(dropColumn.SelectedValue)
                               select new { item.ArticleID, items.ColumnName, item.PublishUserID, item.PublishDate, item.VisitCount, item.Title };
                    GridView1.DataSource = cols;
                    GridView1.PageIndex = e.NewPageIndex;
                    GridView1.DataBind();
                }
            }
        }

        protected void GridView1_PageIndexChanged(object sender, EventArgs e)
        {
            
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            TextBox1.Text = "select";
            if (dropColumn.SelectedIndex != -1)
            {
                DBDataContext context = new DBDataContext();
                var cols = from item in context.Articles
                           join items in context.Columns on item.ColumnID equals items.ColumnID
                           where item.ColumnID == Convert.ToInt32(dropColumn.SelectedValue)
                           select new { item.ArticleID, items.ColumnName, item.PublishUserID, item.PublishDate, item.VisitCount, item.Title };
                GridView1.DataSource = cols;
                GridView1.DataBind();
            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            DBDataContext context = new DBDataContext();
            TextBox1.Text = "all";
            var cols = from item in context.Articles
                       join items in context.Columns on item.ColumnID equals items.ColumnID
                       select new { item.ArticleID, items.ColumnName, item.PublishUserID, item.PublishDate, item.VisitCount, item.Title };
            GridView1.DataSource = cols;
            GridView1.DataBind();
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            /*
            //panel1.Visible = true;
            DBDataContext context = new DBDataContext();
            int articleID = Convert.ToInt32(GridView1.SelectedValue);
            TextBox2.Text = articleID.ToString();
            var ID = int.Parse(TextBox2.Text.ToString());
            var article = context.Articles.First(ar => ar.ArticleID == ID);

            label10.Text = article.Columns.ColumnName.ToString();
            checkIsStickTop.Checked = article.IsStickTop;
            label11.Text = article.Title;
            label12.Text = article.PictureURL;
            label13.Text = article.Keywords;
            label14.Text = article.Source;
            label15.Text = article.Content;*/
            int ID = int.Parse(GridView1.SelectedValue.ToString());
            Response.Write("<script>window.open('/ShowArticle.aspx?ArticleID=" + ID + "','_blank')</script>");


        }
    }
}