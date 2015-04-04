using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using Alumni.DBHelper;
using DotLiquid;

namespace Alumni.SNS
{
    public partial class SignIn : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Template template = TemplateHelper.GetTemplateByPath("/Template/SNS/SignIn.html");
            template.Render(Response.Output, new RenderParameters());
            Response.End();
        }
    }
}