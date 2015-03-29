using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Alumni.DBHelper;
using DotLiquid;

namespace Alumni
{
    public partial class ShowArticle : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            DBDataContext context = new DBDataContext();

            int articleID;
            ArticleType article = null;

            if (int.TryParse(Request["ArticleID"], out articleID))
                article = ArticleHelper.GetArticleByID(context, articleID);

            if (article == null)
            {
                Response.Write("Article not found.");
                Response.End();
            }
            else
            {
                // execute sql command manually, to ensure it's atomic.
                context.ExecuteCommand("UPDATE Articles SET VisitCount = VisitCount + 1 WHERE ArticleID = {0}", article.ArticleID);
                article = ArticleHelper.GetArticleByID(context, articleID);

                Template template = TemplateHelper.GetSubTemplate(context, article.TemplateID);
                var dataToRender = Hash.FromAnonymousObject(
                    new
                    {
                        TopColumns = ColumnHelper.GetSubColumnsByID(context, SharedConfig.TopLevelParentID),

                        Article = article,
                        RelatedArticleGetter = new TableGetter<ArticleType>(ArticleHelper.GetRelatedArticles(context, article))
                    });

                template.Render(Response.Output, new RenderParameters { LocalVariables = dataToRender });
                Response.End();
            }
        }
    }
}
