using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Alumni.Manage.tab
{
    public partial class addArticle : System.Web.UI.Page
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
                textSource.Text = "哈工大（威海）校友网";
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            DBDataContext context = new DBDataContext();
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

            Response.Redirect("/Manage/tab/addArticle.aspx", true);
        }

        protected void checkIsStickTop_CheckedChanged(object sender, EventArgs e)
        {

        }
    }
}