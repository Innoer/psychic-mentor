using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Alumni.Manage.tab
{
    public partial class SearchVideo : System.Web.UI.Page
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
            panel1.Visible = true;
            DBDataContext context = new DBDataContext();
            int videoID = Convert.ToInt32(GridView1.SelectedValue);
            Label3.Text = videoID.ToString();
            var ID = int.Parse(Label3.Text.ToString());
            var vid = context.Videos.First(ar => ar.VideoID == ID);
            HyperLink1.Text = vid.VideoURL;
            HyperLink1.NavigateUrl = vid.VideoURL;
        }

        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
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
            GridView1.PageIndex = e.NewPageIndex;
            GridView1.DataBind();
        }
    }
}