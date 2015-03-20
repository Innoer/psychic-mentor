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
    public partial class ShowColumn : System.Web.UI.Page
    {
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

            int columnID, pageID = 1;
            ColumnItem column = null;

            if (int.TryParse(Request["ColumnID"], out columnID))
                column = ColumnHelper.GetColumnByID(context, columnID);

            if (column == null)
            {
                Response.Redirect("/Default.aspx", true);
                return;
            }
            else
            {
                int.TryParse(Request["PageID"], out pageID);

                var colIDs = new int[] { column.ColumnID }.Concat(column.SubColumns.Select(col => col.ColumnID)).ToArray();
                var query = ArticleHelper.GetArticlesByColumnIDs(context, colIDs);

                var picArticle = query.FirstOrDefault(item => item.PictureURL != String.Empty);
                if (picArticle == null) picArticle = query.FirstOrDefault();

                int articlesPerPage = new ConfigHelper(context).ArticlesPerPage;
                int totalPageCount = (int) Math.Ceiling(query.Count() / (double) articlesPerPage);
                if (totalPageCount == 0) totalPageCount++;

                if (pageID < 1) pageID = 1;
                else if (pageID > totalPageCount) pageID = totalPageCount;
                
                Template template = TemplateHelper.GetSubTemplate(context, column.TemplateID);
                String html = template.Render(Hash.FromAnonymousObject(
                    new
                    {
                        TopColumns = ColumnHelper.GetSubColumnsByID(context, SharedConfig.TopLevelParentID),
 
                        Column = column,
                        PictureArticle = picArticle,
                        ArticleGetter = new TableGetter<ArticleType>(query.Skip((pageID - 1) * articlesPerPage).Take(articlesPerPage)),

                        Pager = new PagerType
                        {
                            First = pageID > 1 ? true : false, Previous = pageID - 1 >= 1 ? true : false, 
                            Next = pageID + 1 <= totalPageCount ? true : false, Last = pageID < totalPageCount ? true : false,
                            CurrentPageID = pageID, TotalPageCount = totalPageCount,
                            TotalArticleCount = query.Count(), ArticlesPerPage = articlesPerPage
                        }
                    }));

                Response.Write(html);
                Response.End();
            }
        }
    }
}
