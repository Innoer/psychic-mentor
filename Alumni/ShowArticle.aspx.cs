﻿using System;
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
            ArticleType article = ArticleHelper.ErrorArticle;

            if (int.TryParse(Request["ArticleID"], out articleID))
                article = ArticleHelper.GetArticleByID(context, articleID);

            if (article.Equals(ArticleHelper.ErrorArticle))
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

                        Article = article
                    }));

                Response.Write(html);
                Response.End();
            }
        }
    }
}