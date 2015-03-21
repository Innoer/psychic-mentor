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
            context.Log = Console.Out;

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
                Template template = TemplateHelper.GetSubTemplate(context, article.TemplateID);
                String html = template.Render(Hash.FromAnonymousObject(
                    new
                    {
                        TopColumns = ColumnHelper.GetSubColumnsByID(context, SharedConfig.TopLevelParentID),

                        Article = article,
                        RelatedArticleGetter = new TableGetter<ArticleType>(ArticleHelper.GetRelatedArticles(context, article))
                    }));

                Response.Write(html);
                Response.End();
            }
        }
    }
}
