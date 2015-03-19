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

namespace Alumni
{
    public static class SharedConfig
    {
        private static class AppSettingsCache
        {
            private static String getCacheKey(String appSettingsKey)
            {
                StringBuilder sb = new StringBuilder();
                sb.AppendFormat("__ALUMNI_APPSETTINGS_{0}__", appSettingsKey);
                return sb.ToString();
            }

            public static String Get(String key)
            {
                String cacheKey = getCacheKey(key);
                object value = HttpContext.Current.Cache[cacheKey];
                if (value == null)
                {
                    value = ConfigurationManager.AppSettings[key];
                    
                    CacheDependency denpendency = new CacheDependency(Path.Combine(AppDomain.CurrentDomain.BaseDirectory, "web.config"));
                    HttpContext.Current.Cache.Add(cacheKey, value, denpendency, Cache.NoAbsoluteExpiration, Cache.NoSlidingExpiration, CacheItemPriority.Default, null);
                }
                return value as String;
            }
        }

        public static int TopLevelParentID
        {
            get { return int.Parse(AppSettingsCache.Get("TopLevelParentID")); }
        }

        public static int HomepageSubTemplateID
        {
            get { return int.Parse(AppSettingsCache.Get("HomepageSubTemplateID")); }
        }

        public static String SubTemplateCacheKey
        {
            get { return AppSettingsCache.Get("SubTemplateCacheKey"); }
        }
    }

    public class Global : System.Web.HttpApplication
    {

        protected void Application_Start(object sender, EventArgs e)
        {
            DotLiquid.Template.NamingConvention = new DotLiquid.NamingConventions.CSharpNamingConvention();
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