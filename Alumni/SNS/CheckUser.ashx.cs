using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.SessionState;
using System.Text;
using System.Text.RegularExpressions;

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
                || !Regex.IsMatch(name, @"^([\u4E00-\uFA29]|[\uE7C7-\uE7F3]|[a-zA-Z ]){2,40}$")
                || !int.TryParse(context.Request.Params["enroll_year"], out enrollYear) 
                || !int.TryParse(context.Request.Params["enroll_program"], out enrollProgram)
                || !int.TryParse(context.Request.Params["employ_category"], out employCategory))
                goto err;

            // avoid XSS
            userName = HttpUtility.HtmlEncode(userName);
            name = HttpUtility.HtmlEncode(name);

            if (snsContext.User.Where(u => u.UserName == userName).Count() > 0) // exist
                goto exist;

            var user = new AlumniSNSDB.User
            {
                UserName = userName,
                PassWord = Utility.SaltedMD5(passWord),
                Name = name,
                Sex = 0,
                LiveProvinceID = 1,
                EmployCategoryID = employCategory,
                WorkplaceNatureID = 1,
                EnrollYear = enrollYear,
                EnrollProgramID = enrollProgram,
                GraduateYear = enrollYear + 4
            };
            snsContext.User.InsertOnSubmit(user);
            snsContext.SubmitChanges();

            context.Session["SNS_RegisterUserName"] = userName;
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