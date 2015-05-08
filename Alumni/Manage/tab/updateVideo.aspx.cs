using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Alumni.Manage.tab
{
    public partial class updateVideo : System.Web.UI.Page
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
            Label7.Text = Session["UserName"].ToString();
            
            if (!IsPostBack)
            {
                DBDataContext context = new DBDataContext();
                var cols = from item in context.Videos
                           join items in context.Users on item.VideoUploaderID equals items.UserID
                           select new { item.VideoID, item.VideoTitle, items.UserName, item.VideoIntroduction, item.VideoUploadTime };
                GridView1.DataSource = cols;
                GridView1.DataBind();
                if (cols.Count() == 0)
                {
                    Label12.Visible = true;
                }
            }
        }
        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            DBDataContext context = new DBDataContext();
            var cols = from item in context.Videos
                       join items in context.Users on item.VideoUploaderID equals items.UserID
                       select new { item.VideoTitle, items.UserName, item.VideoIntroduction, item.VideoUploadTime };
            GridView1.DataSource = cols;
            GridView1.PageIndex = e.NewPageIndex;
            GridView1.DataBind();
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            Panel1.Visible = true;
            DBDataContext context = new DBDataContext();
            int articleID = Convert.ToInt32(GridView1.SelectedValue);
            Label10.Text = articleID.ToString();
            var ID = int.Parse(Label10.Text.ToString());
            var article = context.Videos.First(ar => ar.VideoID == ID);


            TextBox1.Text = article.VideoTitle;
            TextBox2.Text = article.VideoIntroduction;
            TextBox5.Text = article.VideoURL;
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
                var articleID = int.Parse(Label10.Text.ToString());
                var article = context.Videos.Single(item => item.VideoID == articleID);

                article.VideoTitle = TextBox1.Text;
                article.VideoIntroduction = TextBox2.Text;
                article.VideoUploadTime = DateTime.Now;
                article.VideoUploaderID = int.Parse(Label8.Text);
                article.VideoURL = TextBox5.Text;

                context.SubmitChanges();

                

                Response.Redirect("/Manage/tab/updateVideo.aspx", true);
            }
            else
            {
                Label9.Text = "请输入数据后进行下一步操作";
            }
            Panel1.Visible = false;
        }
    }
}