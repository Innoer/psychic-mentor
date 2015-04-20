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

            bool signedIn = true;
            if (Session["SNS_SignInUserName"] == null || string.IsNullOrEmpty(Session["SNS_SignInUserName"].ToString()))
                signedIn = false;

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
                if (!column.Visible) // not visible, just jump
                {
                    Response.Redirect("/Default.aspx", true);
                    return;
                }

                int.TryParse(Request["PageID"], out pageID);

                var colIDs = new int[] { column.ColumnID }.Concat(column.SubColumns.Select(col => col.ColumnID)).ToArray();
                var query = ArticleHelper.GetArticlesByColumnIDs(context, colIDs);

                var subColumns = ColumnHelper.GetSubColumnsByID(context, column.ColumnID);
                if (subColumns.Count() == 0) // no sub col, so we fetch same level col
                    subColumns = ColumnHelper.GetSubColumnsByID(context, column.ParentColumnID);

                var picArticle = query.FirstOrDefault(item => item.PictureURL != String.Empty);

                int articlesPerPage = new ConfigHelper(context).ArticlesPerPage;
                int totalPageCount = (int) Math.Ceiling(query.Count() / (double) articlesPerPage);
                if (totalPageCount == 0) totalPageCount++;

                if (pageID < 1) pageID = 1;
                else if (pageID > totalPageCount) pageID = totalPageCount;

                Template template = TemplateHelper.GetSubTemplate(context, column.TemplateID);
                var dataToRender = Hash.FromAnonymousObject(
                    new
                    {
                        IsSignIn = signedIn,
                        TopColumns = ColumnHelper.GetSubColumnsByID(context, SharedConfig.TopLevelParentID),
 
                        ThisColumn = column,
                        PictureArticle = picArticle,
                        SubColumn = ColumnHelper.GetSubColumnsByID(context, column.ColumnID).ToDictionary(
                                    k => k.ColumnName, v => new
                                    {
                                        ColumnID = v.ColumnID,
                                        ArticleGetter = new TableGetter<ArticleType>(ArticleHelper.GetArticlesByColumnIDs(context, new int[] { v.ColumnID }))
                                    }),
                        SubColumnList = subColumns.ToList(),
                        UnionArticleGetter = new TableGetter<ArticleType>(query.Skip((pageID - 1) * articlesPerPage).Take(articlesPerPage)),

                        Pager = new PagerType
                        {
                            First = pageID > 1 ? true : false, Previous = pageID - 1 >= 1 ? true : false, 
                            Next = pageID + 1 <= totalPageCount ? true : false, Last = pageID < totalPageCount ? true : false,
                            CurrentPageID = pageID, TotalPageCount = totalPageCount,
                            TotalArticleCount = query.Count(), ArticlesPerPage = articlesPerPage
                        }
                    });

                template.Render(Response.Output, new RenderParameters { LocalVariables = dataToRender });
                Response.End();
            }
        }
    }
}
