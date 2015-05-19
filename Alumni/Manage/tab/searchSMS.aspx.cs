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
            try
            {
                if (Session["logged"].ToString() != "true")
                    Response.Write(" <script> parent.parent.window.location.href= 'overTime.htm' </script> ");
            }
            catch (Exception)
            {
                Response.Write(" <script> parent.parent.window.location.href= 'overTime.htm' </script> ");
            }
            SNSDataContext context = new SNSDataContext();
            var cols = from item in context.SMS
                       join item1 in context.User on item.SenderUserID equals item1.UserID
                       join item2 in context.User on item.ReceiverUserID equals item2.UserID
                       select new
                       {
                           SMSID=item.SMSID,
                           SenderUserID = item1.UserName,
                           ReceiverUserID = item2.UserName,
                           SMSDate = item.SMSDate,
                           SMSReaded = item.SMSReaded
                       };
            
            GridView1.DataSource = cols;
            GridView1.DataBind();
            if (cols.Count() == 0)
            {
                Label12.Visible = true;
            }
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

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            e.Cancel = true;

            int articleID = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Value);
            SNSDataContext context = new SNSDataContext();
            var article = context.SMS.Single(item => item.SMSID == articleID);
            context.SMS.DeleteOnSubmit(article);

            context.SubmitChanges();
            Response.Redirect("/Manage/tab/searchSMS.aspx", true);
        }

        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            SNSDataContext context = new SNSDataContext();
            var cols = from item in context.SMS
                       join item1 in context.User on item.SenderUserID equals item1.UserID
                       join item2 in context.User on item.ReceiverUserID equals item2.UserID
                       select new
                       {
                           SMSID = item.SMSID,
                           SenderUserID = item1.UserName,
                           ReceiverUserID = item2.UserName,
                           SMSDate = item.SMSDate,
                           SMSReaded = item.SMSReaded
                       };
            GridView1.DataSource = cols;
            GridView1.PageIndex = e.NewPageIndex;
            GridView1.DataBind();
        }
    }
}