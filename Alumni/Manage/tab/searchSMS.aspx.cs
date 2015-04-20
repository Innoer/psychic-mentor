using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Alumni.Manage.tab
{
    public partial class searchSMS : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            SNSDataContext context = new SNSDataContext();
            int articleID = Convert.ToInt32(GridView1.SelectedValue);
            TextBox1.Text = articleID.ToString();
            var ID = int.Parse(TextBox1.Text.ToString());
            var article = context.SMS.First(ar => ar.SMSID == ID);

            Label1.Text = article.SMSContent.ToString();
            
        }
    }
}