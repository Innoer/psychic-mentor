using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Alumni.Manage
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                DBDataContext context = new DBDataContext();
                var cols = from item in context.Columns
                           where item.ParentColumnID != SharedConfig.TopLevelParentID
                           select new ListItem { Value = item.ColumnID.ToString(), Text = item.ColumnName };

                dropColumn.Items.AddRange(cols.ToArray());
                dropColumn.ClearSelection();
            }
        }

        protected void GridView_SelectedIndexChanged(object sender, EventArgs e)
        {
            // hide edit & delete & add new
            GridView.Columns[0].Visible = false;
            GridView.Columns[1].Visible = false;
            btnAdd.Visible = false;

            DBDataContext context = new DBDataContext();
            int articleID = Convert.ToInt32(GridView.SelectedValue);
            var article = context.Articles.First(ar => ar.ArticleID == articleID);

            fieldArticleID.Value = articleID.ToString();
            dropColumn.ClearSelection();
            dropColumn.Items.FindByValue(article.Columns.ColumnID.ToString()).Selected = true;
            checkIsStickTop.Checked = article.IsStickTop;
            textTitle.Text = article.Title;
            textPicURL.Text = article.PictureURL;
            textKeywords.Text = article.Keywords;
            textSource.Text = article.Source;
            textContent.Text = article.Content;

            btnSubmit.CommandArgument = "Update";
            panelView.Visible = true;
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            // hide edit & delete & add new
            GridView.Columns[0].Visible = false;
            GridView.Columns[1].Visible = false;
            btnAdd.Visible = false;

            // reset
            dropColumn.ClearSelection();
            checkIsStickTop.Checked = false;
            textTitle.Text = textPicURL.Text = textKeywords.Text = textContent.Text = String.Empty;
            textSource.Text = "哈工大（威海）校友网";

            btnSubmit.CommandArgument = "Insert";
            panelView.Visible = true;
        }

        protected void GridView_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            e.Cancel = true;

            int articleID = Convert.ToInt32(e.Keys[0]);

            DBDataContext context = new DBDataContext();
            var article = context.Articles.Single(item => item.ArticleID == articleID);
            context.Articles.DeleteOnSubmit(article);

            context.SubmitChanges();
            GridView.DataBind();
        }

        protected void PanelView_Command(object sender, CommandEventArgs e)
        {
            DBDataContext context = new DBDataContext();

            if (e.CommandName == "Submit")
            {
                switch (e.CommandArgument as String)
                {
                    case "Insert":
                        {
                            var article = new AlumniDB.Articles
                            {
                                ColumnID = int.Parse(dropColumn.SelectedValue),
                                SubTemplateID = 3,
                                PublishUserID = 1,
                                PublishDate = DateTime.Now,
                                VisitCount = 0,
                                IsStickTop = checkIsStickTop.Checked,
                                Title = textTitle.Text,
                                PictureURL = textPicURL.Text,
                                Keywords = textKeywords.Text,
                                Source = textSource.Text,
                                Content = textContent.Text
                            };
                            
                            context.Articles.InsertOnSubmit(article);
                            context.SubmitChanges();
                            break;
                        }
                        
                    case "Update":
                        {
                            var articleID = int.Parse(fieldArticleID.Value);
                            var article = context.Articles.Single(item => item.ArticleID == articleID);

                            article.ColumnID = int.Parse(dropColumn.SelectedValue);
                            article.IsStickTop = checkIsStickTop.Checked;
                            article.Title = textTitle.Text;
                            article.PictureURL = textPicURL.Text;
                            article.Keywords = textKeywords.Text;
                            article.Source = textSource.Text;
                            article.Content = textContent.Text;

                            context.SubmitChanges();
                            break;
                        }
                    
                    default:
                        break;
                }
            }

            // show edit & delete & add new
            GridView.Columns[0].Visible = true;
            GridView.Columns[1].Visible = true;
            btnAdd.Visible = true;

            // some reset works
            GridView.SelectedIndex = -1;
            panelView.Visible = false;

            // transfer
            Response.Redirect("/Manage/Article.aspx", true);
        }
    }
}