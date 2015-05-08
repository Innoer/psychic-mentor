using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Alumni.Manage.tab
{
    public partial class updateArticle : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            CKFinder.FileBrowser _FileBrowser = new CKFinder.FileBrowser();
            _FileBrowser.BasePath = "../../ckfinder/";
            _FileBrowser.SetupCKEditor(textContent);

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


                DropDownList1.Items.AddRange(cols2.ToArray());
                DropDownList1.ClearSelection();


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
            Panel1.Visible = true;
            DBDataContext context = new DBDataContext();
            int articleID = Convert.ToInt32(GridView1.SelectedValue);
            TextBox2.Text = articleID.ToString();
            var ID = int.Parse(TextBox2.Text.ToString());
            var article = context.Articles.First(ar => ar.ArticleID == ID);


            DropDownList1.ClearSelection();
            DropDownList1.Items.FindByValue(article.Columns.ColumnID.ToString()).Selected = true;
            checkIsStickTop.Checked = article.IsStickTop;
            textTitle.Text = article.Title;
            textPicURL.Text = article.PictureURL;
            textKeywords.Text = article.Keywords;
            textSource.Text = article.Source;
            textContent.Text = article.Content;


        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            Panel1.Visible = false;
            DBDataContext context = new DBDataContext();
            var articleID = int.Parse(TextBox2.Text.ToString());
            var article = context.Articles.Single(item => item.ArticleID == articleID);

            article.ColumnID = int.Parse(DropDownList1.SelectedValue);
            article.IsStickTop = checkIsStickTop.Checked;
            article.Title = textTitle.Text;
            article.PictureURL = textPicURL.Text;
            article.Keywords = textKeywords.Text;
            article.Source = textSource.Text;
            article.Content = textContent.Text;

            context.SubmitChanges();
        }
    }
}