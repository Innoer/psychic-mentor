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
        private Dictionary<int, Pair> ErrorList = new Dictionary<int, Pair>()
        {
            { 0, new Pair("个人中心", "请您选择左侧菜单中的链接，以执行您期望的操作。") },
            { 1, new Pair("请先登录", "请您点击右上角的“<font color=\"#485b8f\">登录校友网</font>”，以登录至哈尔滨工业大学（威海）校友网。") },
            { 2, new Pair("出错啦", "您尚未通过审核，请耐心等待管理员审核！") }
        };

        protected void Page_Load(object sender, EventArgs e)
        {
            bool signedIn = true;
            if (Session["SNS_SignInUserName"] == null || string.IsNullOrEmpty(Session["SNS_SignInUserName"].ToString()))
                signedIn = false;

            int errorID = signedIn ? 0 : 1;
            if (!int.TryParse(Request["ErrorID"], out errorID) || !ErrorList.ContainsKey(errorID))
                errorID = signedIn ? 0 : 1;

            DBDataContext context = new DBDataContext();

            Template template = TemplateHelper.GetTemplateByPath("/Template/SNS/ControlPanel.html");
            var dataToRender = Hash.FromAnonymousObject(
                new
                {
                    TopColumns = ColumnHelper.GetSubColumnsByID(context, SharedConfig.TopLevelParentID),
                    IsSignIn = signedIn,

                    ErrorTitle = ErrorList[errorID].First.ToString(),
                    ErrorText = ErrorList[errorID].Second.ToString()
                });

            template.Render(Response.Output, new RenderParameters { LocalVariables = dataToRender });
            Response.End();
        }
    }
}