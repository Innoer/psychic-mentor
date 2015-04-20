using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Alumni.Manage.tag
{
    public partial class CommentManagement : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            panelView.Visible = true;
            SNSDataContext context = new SNSDataContext();
            int comID = Convert.ToInt32(GridView1.SelectedValue);
            var com = context.Comment.First(ar => ar.CommentID == comID);

            Label5.Text = comID.ToString();

            Label1.Text = com.CommentUserID.ToString();
            Label2.Text = com.CommentContent.ToString();
            Label3.Text = com.CommentDate.ToString();
            if (com.AdminReply != null)
            {
                TextBox1.Text = com.AdminReply.ToString();
            }
            Label4.Text = com.AdminReplyDate.ToString();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            SNSDataContext context = new SNSDataContext();
            var ID = int.Parse(Label5.Text);
            var com = context.Comment.Single(item => item.CommentID == ID);
            com.AdminReply = TextBox1.Text;
            com.AdminReplyDate = DateTime.Now.Date;
            context.SubmitChanges();
            GridView1.DataBind();
        }
    }
}