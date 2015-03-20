using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.IO;
using System.Text;
using System.Web.Caching;

using DotLiquid;
using DotLiquid.FileSystems;

namespace Alumni
{
    public class ExtendsFileSystem : IFileSystem
    {
        private static String getCacheKey(string templateName)
        {
            StringBuilder sb = new StringBuilder();
            sb.AppendFormat(SharedConfig.SubTemplateCacheKey, templateName);
            return sb.ToString();
        }

        public string ReadTemplateFile(Context context, string templateName)
        {
            string cacheKey = getCacheKey(templateName);

            object result = HttpRuntime.Cache[cacheKey];
            if (result == null)
            {
                string path = HttpContext.Current.Server.MapPath(templateName);
                result = File.ReadAllText(path, Encoding.UTF8);

                CacheDependency dependency = new CacheDependency(path);
                HttpRuntime.Cache.Add(cacheKey, result, dependency, Cache.NoAbsoluteExpiration, Cache.NoSlidingExpiration, CacheItemPriority.Default, null);
            }
            return result.ToString();
        }
    }
}