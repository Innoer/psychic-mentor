using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Alumni.Manage.tab
{
    public partial class addVideo : System.Web.UI.Page
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
            Label7.Text=Session["UserName"].ToString();
            
            
        }

       

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            TextBox1.Text = "";
            TextBox2.Text = "";
            TextBox5.Text = "";
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if (TextBox1.Text != "" && TextBox2.Text != "" && TextBox5.Text != "")
            {
                Label9.Text = "";
                DBDataContext context2 = new DBDataContext();
                Label8.Text = ((from x in context2.Users where x.UserName == Label7.Text.ToString() select x.UserID).First()).ToString();

                DBDataContext context = new DBDataContext();
                var article = new AlumniDB.Videos
                {
                    VideoTitle = TextBox1.Text,
                    VideoIntroduction = TextBox2.Text,
                    VideoUploadTime = DateTime.Now,
                    VideoUploaderID = int.Parse(Label8.Text),
                    VideoURL = TextBox5.Text,
                };

                context.Videos.InsertOnSubmit(article);
                context.SubmitChanges();

                Response.Redirect("/Manage/tab/addVideo.aspx", true);
            }
            else
            {
                Label9.Text = "请输入数据后进行下一步操作";
            }
        }
    }
}