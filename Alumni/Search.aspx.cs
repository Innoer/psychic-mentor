using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;

namespace Alumni
{
    public partial class Search : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            var queryString = Request["q"];
            StringBuilder sb = new StringBuilder();
            sb.AppendFormat("https://www.baidu.com/s?wd={0} site:hitwh.edu.cn", queryString);
            Response.Redirect(sb.ToString(), true);
        }
    }
}