using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Alumni.SNS
{
    public partial class SMSDelete : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            int messageID;
            string userName;

            if (Session["SNS_SignInUserName"] == null 
                || string.IsNullOrEmpty(userName = Session["SNS_SignInUserName"].ToString())
                || !int.TryParse(Request["MessageID"], out messageID) )
                goto fail;

            SNSDataContext snsContext = new SNSDataContext();
            var user = snsContext.User.Where(u => u.UserName == userName).Single(); // should exist, if not, just throw exception, :P

            var msg = snsContext.SMS.Where(s => s.SMSID == messageID).SingleOrDefault();
            if (msg == null) goto fail;

            // FIX: seems once one man delete, the another man cannot get this message.
            if (msg.ReceiverUserID != user.UserID && msg.SenderUserID != user.UserID) goto fail;
            snsContext.SMS.DeleteOnSubmit(msg);
            snsContext.SubmitChanges();

        fail:
            Response.Redirect("/SNS/SMS.aspx", true);
        }
    }
}