using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
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
            private AlumniDB.Configs _Config;

            public ConfigHelper(DBDataContext context)
            {
                var configs = from item in context.Configs
                              select item;

                _Config = configs.Single();
            }

            public int GlobalTemplateID
            {
                get { return _Config.GlobalTemplateID; }
            }

            public int ArticlesPerPage
            {
                get { return _Config.ArticlesPerPage; }
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

            private static String getTemplateCacheKey(String path)
            {
                StringBuilder sb = new StringBuilder();
                sb.AppendFormat(SharedConfig.SubTemplateCacheKey, path);
                return sb.ToString();
            }

            public static DotLiquid.Template GetSubTemplate(DBDataContext context, int subTemplateID)
            {
                String cacheKey = getSubTemplateCacheKey(subTemplateID);
                DotLiquid.Template template =  HttpRuntime.Cache[cacheKey] as DotLiquid.Template;
                if (template == null)
                {
                    String path = HttpContext.Current.Server.MapPath(GetSubTemplatePath(context, subTemplateID));
                    template = DotLiquid.Template.Parse(File.ReadAllText(path, Encoding.UTF8));

                    CacheDependency dependency = new CacheDependency(path);
                    HttpRuntime.Cache.Add(cacheKey, template, dependency, Cache.NoAbsoluteExpiration, Cache.NoSlidingExpiration, CacheItemPriority.Default, null);
                }
                return template;
            }

            public static DotLiquid.Template GetTemplateByPath(String relativePath)
            {
                String cacheKey = getTemplateCacheKey(relativePath);
                DotLiquid.Template template = HttpRuntime.Cache[cacheKey] as DotLiquid.Template;
                if (template == null)
                {
                    String path = HttpContext.Current.Server.MapPath(relativePath);
                    template = DotLiquid.Template.Parse(File.ReadAllText(path, Encoding.UTF8));

                    CacheDependency dependency = new CacheDependency(path);
                    HttpRuntime.Cache.Add(cacheKey, template, dependency, Cache.NoAbsoluteExpiration, Cache.NoSlidingExpiration, CacheItemPriority.Default, null);
                }
                return template;
            }
        }

        public class ColumnItem : DotLiquid.Drop
        {
            public int ColumnID { get; set; }
            public int ParentColumnID { get; set; }
            public int TemplateID { get; set; }
            public String ColumnName { get; set; }
            public bool Visible { get; set; }
            public bool IsSpecialCommand { get; set; }
            public String SpecialCommandName { get; set; }
            public String SpecialCommandArgument { get; set; }

            public IQueryable<ColumnItem> SubColumns 
            {
                get
                {
                    DBDataContext context = new DBDataContext();
                    return ColumnHelper.GetSubColumnsByID(context, ColumnID);
                }
            }
        }

        public static class ColumnHelper
        {
            public static ColumnItem GetColumnByRawColumn(AlumniDB.Columns col)
            {
                return new ColumnItem
                {
                    ColumnID = col.ColumnID,
                    ParentColumnID = col.ParentColumnID,
                    TemplateID = col.SubTemplateID,
                    ColumnName = col.ColumnName,
                    Visible = col.Visible,
                    IsSpecialCommand = col.IsSpecialCommand,
                    SpecialCommandName = col.SpecialCommandName,
                    SpecialCommandArgument = col.SpecialCommandArgument,
                };
            }

            public static IQueryable<ColumnItem> GetAllColumns(DBDataContext context)
            {
                var childs = from item in context.Columns
                             select new ColumnItem
                             {
                                 ColumnID = item.ColumnID,
                                 TemplateID = item.SubTemplateID,
                                 ParentColumnID = item.ParentColumnID,
                                 ColumnName = item.ColumnName,
                                 Visible = item.Visible,
                                 IsSpecialCommand = item.IsSpecialCommand,
                                 SpecialCommandName = item.SpecialCommandName,
                                 SpecialCommandArgument = item.SpecialCommandArgument,
                             };

                return childs;
            }

            public static IQueryable<ColumnItem> GetSubColumnsByID(DBDataContext context, int columnID)
            {
                var childs = from item in context.Columns
                             where item.ParentColumnID == columnID
                             select new ColumnItem
                             {
                                 ColumnID = item.ColumnID,
                                 TemplateID = item.SubTemplateID,
                                 ParentColumnID = item.ParentColumnID,
                                 ColumnName = item.ColumnName,
                                 Visible = item.Visible,
                                 IsSpecialCommand = item.IsSpecialCommand,
                                 SpecialCommandName = item.SpecialCommandName,
                                 SpecialCommandArgument = item.SpecialCommandArgument,
                             };

                return childs;
            }

            public static ColumnItem GetColumnByID(DBDataContext context, int columnID)
            {
                var col = from item in context.Columns
                          where item.ColumnID == columnID
                          select new ColumnItem
                          {
                              ColumnID = item.ColumnID,
                              ParentColumnID = item.ParentColumnID,
                              TemplateID = item.SubTemplateID,
                              ColumnName = item.ColumnName,
                              Visible = item.Visible,
                              IsSpecialCommand = item.IsSpecialCommand,
                              SpecialCommandName = item.SpecialCommandName,
                              SpecialCommandArgument = item.SpecialCommandArgument,
                          };
                
                return col.SingleOrDefault();
            }

            public static ColumnItem GetColumnByName(DBDataContext context, string name)
            {
                var col = from item in context.Columns
                          where item.ColumnName == name
                          select new ColumnItem
                          {
                              ColumnID = item.ColumnID,
                              ParentColumnID = item.ParentColumnID,
                              TemplateID = item.SubTemplateID,
                              ColumnName = item.ColumnName,
                              Visible = item.Visible,
                              IsSpecialCommand = item.IsSpecialCommand,
                              SpecialCommandName = item.SpecialCommandName,
                              SpecialCommandArgument = item.SpecialCommandArgument,
                          };

                return col.SingleOrDefault();
            }
        }

        public class ArticleType : DotLiquid.Drop
        {
            public int ArticleID { get; set; }
            public ColumnItem Column { get; set; }
            public int TemplateID { get; set; }
            public String PublishUserName { get; set; }
            public System.DateTime PublishDate { get; set; }
            public int VisitCount { get; set; }
            public String Title { get; set; }
            public String PictureURL { get; set; }
            public String[] Keywords { get; set; }
            public String Source { get; set; }
            public String Content { get; set; }
        }

        public static class ArticleHelper
        {
            public static ArticleType GetArticleByRawArticle(AlumniDB.Articles article)
            {
                return new ArticleType
                {
                    ArticleID = article.ArticleID,
                    Column = ColumnHelper.GetColumnByRawColumn(article.Columns),
                    TemplateID = article.SubTemplateID,
                    PublishUserName = article.Users.UserName,
                    PublishDate = article.PublishDate,
                    VisitCount = article.VisitCount,
                    Title = article.Title,
                    PictureURL = article.PictureURL != String.Empty ? article.PictureURL : null,
                    Keywords = article.Keywords.Split(SharedConfig.KeywordSeparator),
                    Source = article.Source,
                    Content = article.Content
                };
            }

            public static ArticleType GetArticleByID(DBDataContext context, int articleID)
            {
                var query = from item in context.Articles
                            where item.ArticleID == articleID
                            select new ArticleType
                            {
                                ArticleID = item.ArticleID,
                                Column = ColumnHelper.GetColumnByRawColumn(item.Columns),
                                TemplateID = item.SubTemplateID,
                                PublishUserName = item.Users.UserName,
                                PublishDate = item.PublishDate,
                                VisitCount = item.VisitCount,
                                Title = item.Title,
                                PictureURL = item.PictureURL != String.Empty ? item.PictureURL : null,
                                Keywords = item.Keywords.Split(SharedConfig.KeywordSeparator),
                                Source = item.Source,
                                Content = item.Content
                            };

                return query.SingleOrDefault();
            }

            public static IQueryable<ArticleType> GetRelatedArticles(DBDataContext context, ArticleType article)
            {
                var predicate = PredicateBuilder.False<AlumniDB.Articles>();
                article.Keywords.ToList().ForEach(keyword => 
                    predicate = predicate.Or(item => item.Keywords.Contains(keyword)));

                var articles = from item in context.Articles.Where(predicate)
                               where item.ArticleID != article.ArticleID
                               orderby item.IsStickTop descending, item.PublishDate descending
                               select new ArticleType
                               {
                                   ArticleID = item.ArticleID,
                                   Column = ColumnHelper.GetColumnByRawColumn(item.Columns),
                                   TemplateID = item.SubTemplateID,
                                   PublishUserName = item.Users.UserName,
                                   PublishDate = item.PublishDate,
                                   VisitCount = item.VisitCount,
                                   Title = item.Title,
                                   PictureURL = item.PictureURL != String.Empty ? item.PictureURL : null,
                                   Keywords = item.Keywords.Split(SharedConfig.KeywordSeparator),
                                   Source = item.Source,
                                   Content = item.Content
                               };

                return articles;
            }

            public static IQueryable<ArticleType> GetArticlesByColumnIDs(DBDataContext context, int[] colIDs)
            {
                var articles = from item in context.Articles
                               where colIDs.Contains(item.ColumnID)
                               orderby item.IsStickTop descending, item.PublishDate descending
                               select new ArticleType
                               {
                                   ArticleID = item.ArticleID,
                                   Column = ColumnHelper.GetColumnByRawColumn(item.Columns),
                                   TemplateID = item.SubTemplateID,
                                   PublishUserName = item.Users.UserName,
                                   PublishDate = item.PublishDate,
                                   VisitCount = item.VisitCount,
                                   Title = item.Title,
                                   PictureURL = item.PictureURL != String.Empty ? item.PictureURL : null,
                                   Keywords = item.Keywords.Split(SharedConfig.KeywordSeparator),
                                   Source = item.Source,
                                   Content = item.Content
                               };

                return articles;
            }
        }

        public class TableGetter<T> : DotLiquid.Drop
        {
            protected IQueryable<T> collections;

            public TableGetter(IQueryable<T> collections)
            {
                this.collections = collections;
                this.Skip = new TableSkipper<T>(collections);
                this.Take = new TableTaker<T>(collections);
            }

            public TableSkipper<T> Skip { get; set; }
            public TableTaker<T> Take { get; set; }

            public IQueryable<T> Result
            {
                get { return collections; }
            }

            public List<T> ResultList
            {
                get { return collections.ToList(); }
            }
        }

        public class TableOperator<T> : DotLiquid.IIndexable, DotLiquid.ILiquidizable
        {
            protected IQueryable<T> collections;

            public TableOperator(IQueryable<T> collections)
            {
                this.collections = collections;
            }

            public bool ContainsKey(object key)
            {
                return true; // must always true, fuck dotLiquid
            }

            public object ToLiquid()
            {
                return this;
            }

            public virtual object this[object key]
            {
                get { return GetNewGetter(Convert.ToInt32(key)); }
            }

            public virtual TableGetter<T> GetNewGetter(int operateCount)
            {
                return null;
            }
        }

        public class TableSkipper<T> : TableOperator<T>
        {
            public TableSkipper(IQueryable<T> collections) : base(collections) { }

            public override TableGetter<T> GetNewGetter(int skipCount)
            {
                TableGetter<T> ret = new TableGetter<T>(collections.Skip(skipCount));
                ret.Skip = new TableSkipper<T>(collections.Skip(skipCount));
                ret.Take = new TableTaker<T>(collections.Skip(skipCount));
                return ret;
            }
        }

        public class TableTaker<T> : TableOperator<T>
        {
            public TableTaker(IQueryable<T> collections) : base(collections) { }

            public override TableGetter<T> GetNewGetter(int takeCount)
            {
                TableGetter<T> ret = new TableGetter<T>(collections.Take(takeCount));
                ret.Skip = new TableSkipper<T>(collections.Take(takeCount));
                ret.Take = new TableTaker<T>(collections.Take(takeCount));
                return ret;
            }
        }
    }
}
