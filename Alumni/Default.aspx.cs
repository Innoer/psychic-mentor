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
        protected void Page_Load(object sender, EventArgs e)
        {
            Response.ContentEncoding = Encoding.UTF8;

            DBDataContext context = new DBDataContext();

            var links = from item in context.Links
                        select new
                        {
                            LinkName = item.LinkName,
                            LinkURL = item.LinkURL
                        };

            var cols = from item in context.Columns
                       select new
                       {
                           ColumnID = item.ColumnID,
                           ColumnName = item.ColumnName
                       };

            var donations = from item in context.Donations
                            select new
                            {
                                Name = item.Name,
                                Amount = item.Amount
                            };

            Template template = TemplateHelper.GetSubTemplate(context, SharedConfig.HomepageSubTemplateID);
            String html = template.Render(Hash.FromAnonymousObject(
                new
                {
                    TopColumns = ColumnHelper.GetColumnRoot(context).SubColumns,

                    ColumnArticleGetter = cols.ToDictionary(k => k.ColumnName, 
                        v => new ColumnArticleGetter(ArticleHelper.GetArticlesByColumnID(context, v.ColumnID))),
                    
                    Links = links.ToList(),
                    Donations = donations.ToList()
                }));

            Response.Write(html);
            Response.End();
        }
    }
}
