using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;
using System.Text.RegularExpressions;

using Alumni.DBHelper;
using DotLiquid;

namespace Alumni
{
    public partial class ModifyPassword : System.Web.UI.Page
    {
        private static int InvalidArgument = -2;
        private static int WrongPassword = -1;
        private static int Success = 0;

        protected void Page_Load(object sender, EventArgs e)
        {
            string userName;
            if (Session["SNS_SignInUserName"] == null || string.IsNullOrEmpty(userName = Session["SNS_SignInUserName"].ToString()))
            {
                Response.Redirect("/SNS/ControlPanel.aspx");
                return;
            }

            DBDataContext context = new DBDataContext();
            SNSDataContext snsContext = new SNSDataContext();

            var user = snsContext.User.Where(u => u.UserName == userName).Single(); // should exist, if not, just throw exception, :P

            bool requestModify = false, modifySuccess = false;
            int doModify = 0, errorNumber = 0;
            if (!int.TryParse(Request.Params["DoModify"], out doModify))
                requestModify = false;

            if (doModify == 1) // we'll submit changes
            {
                requestModify = true;

                var oldPassword = Request.Params["old_password"];
                var newPassword = Request.Params["new_password"];

                if (string.IsNullOrEmpty(oldPassword) || string.IsNullOrEmpty(newPassword))
                {
                    modifySuccess = false;
                    errorNumber = InvalidArgument;
                }
                else
                {
                    if (Utility.SaltedMD5(oldPassword) != user.PassWord)
                    {
                        modifySuccess = false;
                        errorNumber = WrongPassword;
                    }
                    else
                    {
                        user.PassWord = Utility.SaltedMD5(newPassword);
                        snsContext.SubmitChanges();

                        modifySuccess = true;
                        errorNumber = Success;
                    }
                }    
            }

            var dataToRender = Hash.FromAnonymousObject(
               new
               {
                   IsSignIn = true,
                   TopColumns = ColumnHelper.GetSubColumnsByID(context, SharedConfig.TopLevelParentID),

                   RequestModify = requestModify,
                   ModifySuccess = modifySuccess,
                   ErrorNumber = errorNumber,
               });

            Template template = TemplateHelper.GetTemplateByPath("/Template/SNS/ModifyPassword.html");
            template.Render(Response.Output, new RenderParameters { LocalVariables = dataToRender });

            Response.End();
        }
    }
}