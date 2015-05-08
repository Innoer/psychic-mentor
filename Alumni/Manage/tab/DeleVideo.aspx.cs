using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Alumni.Manage.tab
{
    public partial class DeleVideo : System.Web.UI.Page
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
            if (!IsPostBack)
            {
                DBDataContext context = new DBDataContext();
                var video = from item in context.Videos
                            join itemuser in context.Users on item.VideoUploaderID equals itemuser.UserID
                            select new
                            {
                                item.VideoID,
                                item.VideoTitle,
                                item.VideoIntroduction,
                                itemuser.UserName,
                                item.VideoUploadTime,
                            };
                GridView1.DataSource = video;
                GridView1.DataBind();
                if (video.Count() == 0)
                {
                    Label12.Visible = true;
                }
            }
            
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            DBDataContext context = new DBDataContext();
            int videoid = Convert.ToInt32(GridView1.SelectedValue);
            
            var vid = context.Videos.Single(item => item.VideoID == videoid);
            context.Videos.DeleteOnSubmit(vid);

            context.SubmitChanges();
            GridView1.DataBind();
            Response.Redirect("/Manage/tab/DeleVideo.aspx", true);
        }

        protected void GridView1_RowDeleted(object sender, GridViewDeletedEventArgs e)
        {
            
        }


        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
        }

    }
}