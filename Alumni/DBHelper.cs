using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Caching;
using System.Text;
using System.IO;

namespace Alumni
{
    namespace DBHelper
    {
        public class ConfigHelper
        {
            private Configs _Config;

            public ConfigHelper(DBDataContext context)
            {
                var configs = from item in context.Configs
                              select item;

                _Config = configs.ToList()[0];
            }

            public int GlobalTemplateID
            {
                get { return _Config.GlobalTemplateID; }
            }
        }

        public static class TemplateHelper
        {
            public static String GetSubTemplatePath(DBDataContext context, int subTemplateID)
            {
                int globalTemplateID = new ConfigHelper(context).GlobalTemplateID;

                var templates = from item in context.Templates
                                where (item.TemplateID == globalTemplateID || item.ParentTemplateID == globalTemplateID)
                                select item;

                var map = templates.ToDictionary(key => key.SubTemplateID, value => value.TemplatePath);
                return map[subTemplateID];
            }

            private static String getSubTemplateCacheKey(int subTemplateID)
            {
                StringBuilder sb = new StringBuilder();
                sb.AppendFormat(SharedConfig.SubTemplateCacheKey, subTemplateID);
                return sb.ToString();
            }

            public static DotLiquid.Template GetSubTemplate(DBDataContext context, int subTemplateID)
            {
                String cacheKey = getSubTemplateCacheKey(subTemplateID);
                DotLiquid.Template template = HttpContext.Current.Cache[cacheKey] as DotLiquid.Template;
                if (template == null)
                {
                    String path = HttpContext.Current.Server.MapPath(GetSubTemplatePath(context, subTemplateID));
                    template = DotLiquid.Template.Parse(File.ReadAllText(path, Encoding.UTF8));

                    CacheDependency dependency = new CacheDependency(path);
                    HttpContext.Current.Cache.Add(cacheKey, template, dependency, Cache.NoAbsoluteExpiration, Cache.NoSlidingExpiration, CacheItemPriority.Default, null);
                }
                return template;
            }
        }

        public class ColumnItem : DotLiquid.Drop
        {
            public List<SubColumnItem> SubColumns { get; set; }
        }

        public class SubColumnItem : ColumnItem, ICloneable
        {
            public int ColumnID { get; set; }
            public bool IsTopColumn { get; set; }
            public String TemplatePath { get; set; }
            public String ColumnName { get; set; }
            public bool IsExternalLink { get; set; }
            public String ExternalLinkURL { get; set; }

            public object Clone()
            {
                return MemberwiseClone();
            }
        }

        public static class ColumnHelper
        {
            private static void getSubColumns(DBDataContext context, ColumnItem col)
            {
                int baseColID = col is SubColumnItem ? (col as SubColumnItem).ColumnID : SharedConfig.TopLevelParentID;

                var childs = from item in context.Columns
                             where item.ParentColumnID == baseColID
                             select new SubColumnItem
                             {
                                 ColumnID = item.ColumnID,
                                 IsTopColumn = item.ParentColumnID == SharedConfig.TopLevelParentID ? true : false,
                                 TemplatePath = TemplateHelper.GetSubTemplatePath(context, item.SubTemplateID),
                                 ColumnName = item.ColumnName,
                                 IsExternalLink = item.IsExternalLink,
                                 ExternalLinkURL = item.ExternalLinkURL,
                             };

                col.SubColumns = new List<SubColumnItem>();
                if (childs.Count() > 0) // have sub columns
                {
                    col.SubColumns.AddRange(childs.ToList()); // deep copy
                    col.SubColumns.ForEach(item => getSubColumns(context, item));
                }
            }

            public static ColumnItem GetColumnRoot(DBDataContext context)
            {
                var root = new ColumnItem();
                getSubColumns(context, root);
                return root;
            }

            public static SubColumnItem GetSubColumnByID(DBDataContext context, int columnID)
            {
                var col = from item in context.Columns
                          where item.ColumnID == columnID
                          select new SubColumnItem
                          {
                              ColumnID = item.ColumnID,
                              IsTopColumn = item.ParentColumnID == SharedConfig.TopLevelParentID ? true : false,
                              TemplatePath = TemplateHelper.GetSubTemplatePath(context, item.SubTemplateID),
                              ColumnName = item.ColumnName,
                              IsExternalLink = item.IsExternalLink,
                              ExternalLinkURL = item.ExternalLinkURL,
                          };

                if (col.Count() == 0) 
                    return null;
                else
                    return col.ToList()[0].Clone() as SubColumnItem; // TODO: check if clone works
            }
        }

        public class Article : DotLiquid.Drop
        {
            public int ArticleID { get; set; }
            public String ColumnName { get; set; }
            public String TemplatePath { get; set; }
            public String PublishUserName { get; set; }
            public System.DateTime PublishDate { get; set; }
            public int VisitCount { get; set; }
            public String Title { get; set; }
            public String PictureURL { get; set; }
            public String Content { get; set; }
        }

        public static class ArticleHelper
        {
            public static IQueryable<Article> GetArticlesByColumnID(DBDataContext context, int columnID)
            {
                var articles = from item in context.Articles
                               where item.ColumnID == columnID
                               select new Article
                               {
                                   ArticleID = item.ArticleID,
                                   ColumnName = item.Columns.ColumnName,
                                   TemplatePath = TemplateHelper.GetSubTemplatePath(context, item.SubTemplateID),
                                   PublishUserName = item.Users.UserName,
                                   PublishDate = item.PublishDate,
                                   VisitCount = item.VisitCount,
                                   Title = item.Title,
                                   PictureURL = item.PictureURL,
                                   Content = item.Content
                               };

                return articles;
            }
        }

        public class ColumnArticleGetter : DotLiquid.Drop
        {
            protected IQueryable<Article> articles;

            public ColumnArticleGetter(IQueryable<Article> articles)
            {
                this.articles = articles;
                this.Skip = new ColumnArticleSkipper(articles);
                this.Take = new ColumnArticleTaker(articles);
            }

            public ColumnArticleSkipper Skip { get; set; }
            public ColumnArticleTaker Take { get; set; }

            public List<Article> Result
            {
                get
                {
                    List<Article> ret = new List<Article>();
                    ret.AddRange(articles.ToList()); // deep copy
                    return ret;
                }
                set { }
            }
        }

        public class ColumnArticleOperator : DotLiquid.IIndexable, DotLiquid.ILiquidizable
        {
            protected IQueryable<Article> articles;

            public ColumnArticleOperator(IQueryable<Article> articles)
            {
                this.articles = articles;
            }

            public bool ContainsKey(object key)
            {
                int id = Convert.ToInt32(key);
                if (id < 0 || id > articles.Count() - 1)
                    return false;
                else
                    return true;
            }

            public object ToLiquid()
            {
                return this;
            }

            public virtual object this[object key]
            {
                get { return GetNewGetter(Convert.ToInt32(key)); }
            }

            public virtual ColumnArticleGetter GetNewGetter(int operateCount)
            {
                return null;
            }
        }

        public class ColumnArticleSkipper : ColumnArticleOperator
        {
            public ColumnArticleSkipper(IQueryable<Article> articles) : base(articles) { }

            public override ColumnArticleGetter GetNewGetter(int skipCount)
            {
                ColumnArticleGetter ret = new ColumnArticleGetter(articles.Skip(skipCount));
                ret.Skip = new ColumnArticleSkipper(articles.Skip(skipCount));
                ret.Take = new ColumnArticleTaker(articles.Skip(skipCount));
                return ret;
            }
        }

        public class ColumnArticleTaker : ColumnArticleOperator
        {
            public ColumnArticleTaker(IQueryable<Article> articles) : base(articles) { }

            public override ColumnArticleGetter GetNewGetter(int takeCount)
            {
                ColumnArticleGetter ret = new ColumnArticleGetter(articles.Take(takeCount));
                ret.Skip = new ColumnArticleSkipper(articles.Take(takeCount));
                ret.Take = new ColumnArticleTaker(articles.Take(takeCount));
                return ret;
            }
        }
    }
}
