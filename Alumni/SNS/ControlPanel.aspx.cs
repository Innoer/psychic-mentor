using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using Alumni.DBHelper;
using DotLiquid;

namespace Alumni
{
    public partial class ControlPanel : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            bool signedIn = true;
            if (Session["SNS_SignInUserName"] == null || string.IsNullOrEmpty(Session["SNS_SignInUserName"].ToString()))
                signedIn = false;

            DBDataContext context = new DBDataContext();

            Template template = TemplateHelper.GetTemplateByPath("/Template/SNS/ControlPanel.html");
            var dataToRender = Hash.FromAnonymousObject(
                new
                {
                    TopColumns = ColumnHelper.GetSubColumnsByID(context, SharedConfig.TopLevelParentID),
                    IsSignIn = signedIn
                });

            template.Render(Response.Output, new RenderParameters { LocalVariables = dataToRender });
            Response.End();
        }
    }
}