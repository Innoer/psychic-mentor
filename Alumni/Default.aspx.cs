using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;

using Alumni.DBHelper;
using DotLiquid;

namespace Alumni
{
    public partial class _Default : System.Web.UI.Page
    {
        private class LinkType : DotLiquid.Drop 
        { 
            public String LinkName { get;set; }
            public String LinkURL { get; set; }
        }
        private class DonationType : DotLiquid.Drop
        {
            public String Name { get; set; }
            public String Amount { get; set; }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            DBDataContext context = new DBDataContext();

            var topColumns = ColumnHelper.GetSubColumnsByID(context, SharedConfig.TopLevelParentID);

            var cols = from item in context.Columns
                       select new
                       {
                           ColumnID = item.ColumnID,
                           ColumnName = item.ColumnName
                       };

            var links = from item in context.Links
                        select new LinkType
                        {
                            LinkName = item.LinkName,
                            LinkURL = item.LinkURL
                        };

            var donations = from item in context.Donations
                            select new DonationType
                            {
                                Name = item.Name,
                                Amount = item.Amount
                            };

            Template template = TemplateHelper.GetSubTemplate(context, SharedConfig.HomepageSubTemplateID);
            String html = template.Render(Hash.FromAnonymousObject(
                new
                {
                    TopColumns = topColumns,

                    Column = topColumns.ToDictionary(k => k.ColumnName, v =>
                    {
                        var articles = ArticleHelper.GetArticlesByColumnIDs(context,
                                        new int[] { v.ColumnID }.Concat(v.SubColumns.Select(col => col.ColumnID)).ToArray());

                        var topArticle = articles.FirstOrDefault(item => item.PictureURL != String.Empty);
                        if (topArticle == null) topArticle = articles.FirstOrDefault();

                        return new
                        {
                            TopArticle = topArticle,
                            ArticleGetter = new TableGetter<ArticleType>(articles)
                        };
                    }), 

                    LinkGetter = new TableGetter<LinkType>(links),
                    DonationGetter = new TableGetter<DonationType>(donations)
                }));

            Response.Write(html);
            Response.End();
        }
    }
}
