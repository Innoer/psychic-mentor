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
    /// AuthenticateUser 的摘要说明
    /// </summary>
    public class AuthenticateUser : IHttpHandler, IRequiresSessionState
    {
        private static int InvalidArgument = -2;
        private static int WrongUserNameOrPassWord = -1;
        private static int Success = 0;

        public void ProcessRequest(HttpContext context)
        {
            context.Response.ContentType = "text/plain";
            context.Response.ContentEncoding = Encoding.UTF8;

            SNSDataContext snsContext = new SNSDataContext();

            var userName = context.Request.Params["username"];
            var passWord = context.Request.Params["password"];

            if (string.IsNullOrEmpty(userName) || string.IsNullOrEmpty(passWord))
                goto err;

            // avoid XSS
            userName = HttpUtility.HtmlEncode(userName);
            var user = snsContext.User.Where(u => u.UserName == userName).SingleOrDefault();
            if (user == null || Utility.SaltedMD5(passWord) != user.PassWord) // not exist or wrong password
                goto wrong;

            context.Session["SNS_SignInUserName"] = userName;
            context.Response.Output.Write(Success);
            context.Response.End();

        err:
            context.Response.Output.Write(InvalidArgument);
            context.Response.End();

        wrong:
            context.Response.Output.Write(WrongUserNameOrPassWord);
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