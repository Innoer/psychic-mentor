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
    public class MessageType : DotLiquid.Drop
    {
        public int UserID { get; set; }
        public String Name { get; set; }
        public String Content { get; set; }
        public DateTime Date { get; set; }
    }

    public partial class SMS : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string userName;
            if (Session["SNS_SignInUserName"] == null || string.IsNullOrEmpty(userName = Session["SNS_SignInUserName"].ToString()))
            {
                Response.Redirect("/SNS/ControlPanel.aspx?ErrorID=1", true);
                return;
            }

            DBDataContext context = new DBDataContext(); 
            SNSDataContext snsContext = new SNSDataContext();
            Template template = TemplateHelper.GetTemplateByPath("/Template/SNS/SMS.html");

            String method = "Inbox";
            switch (Request["Method"])
            {
                case "Inbox":
                case "Outbox":
                case "Send":
                    method = Request["Method"];
                    break;

                default:
                    method = "Inbox";
                    break;
            }

            if (method == "Inbox" || method == "Outbox")
            {
                IQueryable<MessageType> message = null, comment = null;
                if (method == "Inbox")
                {
                    message = from item in snsContext.SMS
                              where item.User_Receiver.UserName == userName
                              select new MessageType
                              {
                                  UserID = item.SenderUserID,
                                  Name = HttpUtility.HtmlEncode(item.User_Sender.Name),
                                  Content = HttpUtility.HtmlEncode(item.SMSContent),
                                  Date = item.SMSDate,
                              };

                    comment = from item in snsContext.Comment
                              where item.User.UserName == userName && item.AdminReplyDate.HasValue
                              select new MessageType
                              {
                                  UserID = 0,
                                  Name = "管理员",
                                  Content = HttpUtility.HtmlEncode(item.AdminReply),
                                  Date = item.AdminReplyDate.Value
                              };
                }
                else // Outbox
                {
                    message = from item in snsContext.SMS
                              where item.User_Sender.UserName == userName
                              orderby item.SMSDate descending
                              select new MessageType
                              {
                                  UserID = item.ReceiverUserID,
                                  Name = HttpUtility.HtmlEncode(item.User_Receiver.Name),
                                  Content = HttpUtility.HtmlEncode(item.SMSContent),
                                  Date = item.SMSDate,
                              };

                    comment = from item in snsContext.Comment
                              where item.User.UserName == userName
                              select new MessageType
                              {
                                  UserID = 0,
                                  Name = "管理员",
                                  Content = HttpUtility.HtmlEncode(item.CommentContent),
                                  Date = item.CommentDate
                              };
                }

                List<MessageType> mergedMessage = message.ToList();
                mergedMessage.AddRange(comment.ToList());
                mergedMessage.Sort((lhs, rhs) => { return rhs.Date.CompareTo(lhs.Date); }); // orderby desc

                var dataToRender = Hash.FromAnonymousObject(
                new
                {
                    TopColumns = ColumnHelper.GetSubColumnsByID(context, SharedConfig.TopLevelParentID),
                    IsSignIn = true,
                    Method = method,

                    Message = new
                    {
                        Count = mergedMessage.Count,
                        Result = mergedMessage
                    }
                });

                template.Render(Response.Output, new RenderParameters { LocalVariables = dataToRender });
            }
            else  // Send
            {
                int userID;
                if (!int.TryParse(Request["UserID"], out userID))
                    userID = 0; // Admin

                var user = snsContext.User.Where(u => u.UserID == userID).SingleOrDefault();
                if (user == null && userID != 0) goto invalid; // FUCK IT.

                var dataToRender = Hash.FromAnonymousObject(
                new
                {
                    TopColumns = ColumnHelper.GetSubColumnsByID(context, SharedConfig.TopLevelParentID),
                    IsSignIn = true,
                    Method = method,

                    UserID = userID,
                    Name = userID == 0 ? "管理员" : user.Name
                });

                template.Render(Response.Output, new RenderParameters { LocalVariables = dataToRender });
                return;

            invalid:
                Response.Redirect("/SNS/SMS.aspx?Method=Outbox", true);
            }
            
            Response.End();
        }
    }
}