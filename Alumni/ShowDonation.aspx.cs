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
    public partial class ShowDonation : System.Web.UI.Page
    {
        private class DonationType : DotLiquid.Drop
        {
            public String Name { get; set; }
            public String Amount { get; set; }
        }

        private class PagerType : DotLiquid.Drop
        {
            public bool First { get; set; }
            public bool Previous { get; set; }
            public bool Next { get; set; }
            public bool Last { get; set; }

            public int CurrentPageID { get; set; }
            public int TotalPageCount { get; set; }
            public int TotalArticleCount { get; set; }

            public int ArticlesPerPage { get; set; }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            DBDataContext context = new DBDataContext();

            int pageID = 1;
            ColumnItem column = ColumnHelper.GetColumnByID(context, 30);

            if (column == null)
            {
                Response.Redirect("/Default.aspx", true);
                return;
            }
            else
            {
                int.TryParse(Request["PageID"], out pageID);

                var query = from item in context.Donations
                            orderby item.DonationId descending
                            select new DonationType
                            {
                                Name = item.Name,
                                Amount = item.Amount
                            };

                var subColumns = ColumnHelper.GetSubColumnsByID(context, column.ColumnID);
                if (subColumns.Count() == 0) // no sub col, so we fetch same level col
                    subColumns = ColumnHelper.GetSubColumnsByID(context, column.ParentColumnID);

                int articlesPerPage = new ConfigHelper(context).ArticlesPerPage;
                int totalPageCount = (int)Math.Ceiling(query.Count() / (double)articlesPerPage);
                if (totalPageCount == 0) totalPageCount++;

                if (pageID < 1) pageID = 1;
                else if (pageID > totalPageCount) pageID = totalPageCount;

                Template template = TemplateHelper.GetTemplateByPath("/Template/General/Donation.html");
                var dataToRender = Hash.FromAnonymousObject(
                    new
                    {
                        TopColumns = ColumnHelper.GetSubColumnsByID(context, SharedConfig.TopLevelParentID),

                        ThisColumn = column,
                        SubColumn = ColumnHelper.GetSubColumnsByID(context, column.ColumnID).ToDictionary(
                                    k => k.ColumnName, v => new
                                    {
                                        ColumnID = v.ColumnID,
                                        ArticleGetter = new TableGetter<ArticleType>(ArticleHelper.GetArticlesByColumnIDs(context, new int[] { v.ColumnID }))
                                    }),
                        SubColumnList = subColumns.ToList(),
                        DonationGetter = new TableGetter<DonationType>(query.Skip((pageID - 1) * articlesPerPage).Take(articlesPerPage)),

                        Pager = new PagerType
                        {
                            First = pageID > 1 ? true : false,
                            Previous = pageID - 1 >= 1 ? true : false,
                            Next = pageID + 1 <= totalPageCount ? true : false,
                            Last = pageID < totalPageCount ? true : false,
                            CurrentPageID = pageID,
                            TotalPageCount = totalPageCount,
                            TotalArticleCount = query.Count(),
                            ArticlesPerPage = articlesPerPage
                        }
                    });

                template.Render(Response.Output, new RenderParameters { LocalVariables = dataToRender });
                Response.End();
            }
        }
    }
}