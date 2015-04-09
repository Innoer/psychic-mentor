using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.SessionState;
using System.Text;
using System.Text.RegularExpressions;
using System.Security.Cryptography;

namespace Alumni.SNS
{
    /// <summary>
    /// CheckUser 的摘要说明
    /// </summary>
    public class CheckUser : IHttpHandler, IRequiresSessionState
    {
        private static int InvalidArgument = -2;
        private static int UsernameExist = -1;
        private static int Success = 0;

        private static string SaltBegin = "__ALUMNI SNS BEGIN__";
        private static string SaltEnd = "__ALUMNI SNS END__";

        private static string SaltedMD5(string input)
        {
	        MD5CryptoServiceProvider md5Hasher = new MD5CryptoServiceProvider();
	        byte[] data = md5Hasher.ComputeHash(Encoding.UTF8.GetBytes(SaltBegin + input + SaltEnd));

	        StringBuilder sb = new StringBuilder();
	        foreach (var c in data)
                sb.Append(c.ToString("x2"));
	        return sb.ToString();
        }

        public void ProcessRequest(HttpContext context)
        {
            context.Response.ContentType = "text/plain";
            context.Response.ContentEncoding = Encoding.UTF8;

            SNSDataContext snsContext = new SNSDataContext();

            int enrollYear, enrollProgram, employCategory;
            var userName = context.Request.Params["username"];
            var passWord = context.Request.Params["password"];
            var name = context.Request.Params["name"];

            if (string.IsNullOrEmpty(userName) || string.IsNullOrEmpty(passWord) || string.IsNullOrEmpty(name)
                || !Regex.IsMatch(userName, @"^[0-9a-zA-Z_]{5,20}$")
                || !Regex.IsMatch(name, @"^([\u4E00-\uFA29]|[\uE7C7-\uE7F3]|[a-zA-Z ]){3,40}$")
                || !int.TryParse(context.Request.Params["enroll_year"], out enrollYear) 
                || !int.TryParse(context.Request.Params["enroll_program"], out enrollProgram)
                || !int.TryParse(context.Request.Params["employ_category"], out employCategory))
                goto err;

            if (snsContext.User.Where(u => u.UserName == userName).Count() > 0) // exist
                goto exist;

            var user = new AlumniSNSDB.User
            {
                UserName = userName,
                PassWord = SaltedMD5(passWord),
                Name = name,
                LiveProvinceID = 1,
                EmployCategoryID = employCategory,
                EnrollYear = enrollYear,
                EnrollProgramID = enrollProgram
            };
            snsContext.User.InsertOnSubmit(user);
            snsContext.SubmitChanges();

            context.Session["RegisterUserName"] = userName;
            context.Response.Output.Write(Success);
            context.Response.End();

        err:
            context.Response.Output.Write(InvalidArgument);
            context.Response.End();

        exist:
            context.Response.Output.Write(UsernameExist);
            context.Response.End();
        }

        public bool IsReusable
        {
            get
            {
                return false;
            }
        }
    }
}