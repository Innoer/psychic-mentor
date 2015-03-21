using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.SessionState;
using System.Configuration;
using System.Web.Caching;
using System.IO;
using System.Text;
using System.Data.SqlClient;

namespace Alumni
{
    public static class SharedConfig
    {
        public static readonly int TopLevelParentID = 0;
        public static readonly int HomepageSubTemplateID = 1;
        public static readonly int ColumnDefaultSubTemplateID = 2;
        public static readonly int ArticleDefaultSubTemplateID = 3;
        public static readonly char[] KeywordSeparator = new char[] { '|' };

        public static String SubTemplateCacheKey
        {
            get { return ConfigurationManager.AppSettings["SubTemplateCacheKey"]; }
        }

        public static String ConnectionString
        {
            get { return ConfigurationManager.AppSettings["ConnectionString"]; }
        }
    }

    public class Global : System.Web.HttpApplication
    {

        protected void Application_Start(object sender, EventArgs e)
        {
            DotLiquid.Template.NamingConvention = new DotLiquid.NamingConventions.CSharpNamingConvention();
            DotLiquid.Template.FileSystem = new ExtendsFileSystem();
        }

        protected void Session_Start(object sender, EventArgs e)
        {

        }

        protected void Application_BeginRequest(object sender, EventArgs e)
        {

        }

        protected void Application_AuthenticateRequest(object sender, EventArgs e)
        {

        }

        protected void Application_Error(object sender, EventArgs e)
        {

        }

        protected void Session_End(object sender, EventArgs e)
        {

        }

        protected void Application_End(object sender, EventArgs e)
        {

        }
    }
}