using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Alumni.SNS
{
    public partial class SMSSend : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string userName, content;
            int recvUserID;

            if (Session["SNS_SignInUserName"] == null 
                || string.IsNullOrEmpty(userName = Session["SNS_SignInUserName"].ToString())
                || string.IsNullOrEmpty(content = Request.Params["content"])
                || !int.TryParse(Request.Params["userid"], out recvUserID))
                goto fail;

            SNSDataContext snsContext = new SNSDataContext();
            var user = snsContext.User.Where(u => u.UserName == userName).Single(); // should exist, if not, just throw exception, :P

            content = Utility.Truncate(HttpUtility.HtmlEncode(content), 200);
            if (recvUserID == 0) // admin
            {
                var comment = new AlumniSNSDB.Comment
                {
                     CommentUserID = user.UserID,
                     CommentDate = DateTime.Now,
                     CommentContent = content,
                };

                snsContext.Comment.InsertOnSubmit(comment);
                snsContext.SubmitChanges();
            }
            else
            {
                var receiver = snsContext.User.Where(u => u.UserID == recvUserID).SingleOrDefault();
                if (receiver == null) goto fail; // motherfucker, must be injection try.

                var sms = new AlumniSNSDB.SMS
                {
                    SenderUserID = user.UserID,
                    ReceiverUserID = recvUserID,
                    SMSContent = content,
                    SMSDate = DateTime.Now,
                    SMSReaded = false
                };

                snsContext.SMS.InsertOnSubmit(sms);
                snsContext.SubmitChanges();
            }

        fail:
            Response.Redirect("/SNS/SMS.aspx?Method=Outbox", true);
        }
    }
}