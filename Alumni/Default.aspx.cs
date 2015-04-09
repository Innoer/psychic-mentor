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
            SNSDataContext snsContext = new SNSDataContext();

            var topColumns = ColumnHelper.GetSubColumnsByID(context, SharedConfig.TopLevelParentID);

            var links = from item in context.Links
                        select new LinkType
                        {
                            LinkName = item.LinkName,
                            LinkURL = item.LinkURL
                        };

            var donations = from item in context.Donations
                            orderby item.DonationId descending
                            select new DonationType
                            {
                                Name = item.Name,
                                Amount = item.Amount
                            };

            var today = DateTime.Today;
            var latestEnrollYear = today.Year;
            if (today.Month < 9) latestEnrollYear--;

            var enrollPrograms = from item in snsContext.EnrollProgram
                                 select new { ID = item.ProgramID, Name = item.ProgramName };

            var employCategory = from item in snsContext.EmployCategory
                                 select new { ID = item.CategoryID, Name = item.CategoryName };

            var liveProvince = from item in snsContext.LiveProvince
                               select new { ID = item.ProvinceID, Name = item.ProvinceName };

            Template template = TemplateHelper.GetSubTemplate(context, SharedConfig.HomepageSubTemplateID);
            var dataToRender = Hash.FromAnonymousObject(
                new
                {
                    TopColumns = topColumns,

                    Column = ColumnHelper.GetAllColumns(context).ToDictionary(k => k.ColumnName, v =>
                    {
                        var articles = ArticleHelper.GetArticlesByColumnIDs(context,
                                        new int[] { v.ColumnID }.Concat(v.SubColumns.Select(col => col.ColumnID)).ToArray());

                        var topArticle = articles.FirstOrDefault(item => item.PictureURL != String.Empty);
                        if (topArticle == null) topArticle = articles.FirstOrDefault();

                        return new
                        {
                            ColumnID = v.ColumnID,
                            TopArticle = topArticle,
                            ArticleGetter = new TableGetter<ArticleType>(articles.Where(item => topArticle != null ? item.ArticleID != topArticle.ArticleID : true))
                        };
                    }), 

                    LatestEnrollYear = latestEnrollYear,
                    EnrollPrograms = enrollPrograms.ToList(),
                    EmployCategory = employCategory.ToList(),
                    LiveProvince = liveProvince.ToList(),

                    LinkGetter = new TableGetter<LinkType>(links),
                    DonationGetter = new TableGetter<DonationType>(donations)
                });

            template.Render(Response.Output, new RenderParameters { LocalVariables = dataToRender });
            Response.End();
        }
    }
}
