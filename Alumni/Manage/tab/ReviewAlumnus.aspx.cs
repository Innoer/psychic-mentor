using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Alumni.Manage.tab
{
    public partial class ReviewAlumnus : System.Web.UI.Page
    {
        SNSDataContext context = new SNSDataContext();
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
                SNSDataContext context2 = new SNSDataContext();
                var cols2 = from item in context2.EmployCategory

                            select new ListItem { Value = item.CategoryName.ToString(), Text = item.CategoryName };

                DropDownList1.Items.AddRange(cols2.ToArray());
                DropDownList1.Items.Insert(0, new ListItem("全部", "-1"));
                DropDownList1.ClearSelection();


                SNSDataContext context3 = new SNSDataContext();
                var cols3 = (from item in context3.User

                             select new ListItem { Value = item.EnrollYear.ToString(), Text = item.EnrollYear.ToString() }).Distinct();

                TimeDownList.Items.AddRange(cols3.ToArray());
                TimeDownList.Items.Insert(0, new ListItem("全部", "-1"));
                TimeDownList.ClearSelection();

                var cols = from item in context.User
                           where item.IsApproved == false
                           select new
                           {
                               UserID = item.UserID,
                               UserName = item.UserName,
                               PassWord = item.PassWord,
                               Name = item.Name,
                               Sex = item.Sex == 0 ? "保密" : (item.Sex == 1 ? "男" : "女"),
                               BirthDate = item.BirthDate,
                               ProvinceName = item.LiveProvince.ProvinceName,
                               CityName = item.LiveCity.CityName,
                               CategoryName = item.EmployCategory.CategoryName,
                               WorkplaceName = item.WorkplaceName,
                               NatureName = item.WorkplaceNature.NatureName,
                               WorkTitle = item.WorkTitle,
                               MailingAddress = item.MailingAddress,
                               FixedPhone = item.FixedPhone,
                               MobilePhone = item.MobilePhone,
                               EMail = item.EMail,
                               QQNo = item.QQNo,
                               WeChatID = item.WeChatID,
                               ClassNo = item.ClassNo,
                               StudentNo = item.StudentNo,
                               EnrollYear = item.EnrollYear,
                               ProgramName = item.EnrollProgram.ProgramName,
                               SchoolName = item.EnrollProgram.EnrollSchool.SchoolName
                           };

                GridView1.DataSource = cols;
                GridView1.DataBind();
            }
        }

        protected void TimeDownList_SelectedIndexChanged(object sender, EventArgs e)
        {
        }
        protected void SearchButton_Click(object sender, EventArgs e)
        {

            var cols = from item in context.User
                       where item.IsApproved == false
                       select new
                       {
                           UserID = item.UserID,
                           UserName = item.UserName,
                           PassWord = item.PassWord,
                           Name = item.Name,
                           Sex = item.Sex == 0 ? "保密" : (item.Sex == 1 ? "男" : "女"),
                           BirthDate = item.BirthDate,
                           ProvinceName = item.LiveProvince.ProvinceName,
                           CityName = item.LiveCity.CityName,
                           CategoryName = item.EmployCategory.CategoryName,
                           WorkplaceName = item.WorkplaceName,
                           NatureName = item.WorkplaceNature.NatureName,
                           WorkTitle = item.WorkTitle,
                           MailingAddress = item.MailingAddress,
                           FixedPhone = item.FixedPhone,
                           MobilePhone = item.MobilePhone,
                           EMail = item.EMail,
                           QQNo = item.QQNo,
                           WeChatID = item.WeChatID,
                           ClassNo = item.ClassNo,
                           StudentNo = item.StudentNo,
                           EnrollYear = item.EnrollYear,
                           ProgramName = item.EnrollProgram.ProgramName,
                           SchoolName = item.EnrollProgram.EnrollSchool.SchoolName
                       };
            if (TextBox1.Text != "")
            {
                var col = from item in cols
                          where item.Name == TextBox1.Text
                          select item;
                cols = col;
            }
            if ((DropDownList1.SelectedValue.ToString() != "-1") && DropDownList1.SelectedIndex != -1)
            {
                var col = from item in cols
                          where item.CategoryName == DropDownList1.SelectedValue.ToString()
                          select item;
                cols = col;
            }
            if ((TimeDownList.SelectedIndex != -1) && (TimeDownList.SelectedValue.ToString() != "-1"))
            {
                var col = from item in cols
                          where item.EnrollYear == Convert.ToInt32(TimeDownList.SelectedValue)
                          select item;
                cols = col;
            }

            GridView1.DataSource = cols;
            GridView1.DataBind();
        }



        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {

            var cols1 = from item in context.User
                        where item.IsApproved == false
                        select new
                        {
                            UserID = item.UserID,
                            UserName = item.UserName,
                            PassWord = item.PassWord,
                            Name = item.Name,
                            Sex = item.Sex == 0 ? "保密" : (item.Sex == 1 ? "男" : "女"),
                            BirthDate = item.BirthDate,
                            ProvinceName = item.LiveProvince.ProvinceName,
                            CityName = item.LiveCity.CityName,
                            CategoryName = item.EmployCategory.CategoryName,
                            WorkplaceName = item.WorkplaceName,
                            NatureName = item.WorkplaceNature.NatureName,
                            WorkTitle = item.WorkTitle,
                            MailingAddress = item.MailingAddress,
                            FixedPhone = item.FixedPhone,
                            MobilePhone = item.MobilePhone,
                            EMail = item.EMail,
                            QQNo = item.QQNo,
                            WeChatID = item.WeChatID,
                            ClassNo = item.ClassNo,
                            StudentNo = item.StudentNo,
                            EnrollYear = item.EnrollYear,
                            ProgramName = item.EnrollProgram.ProgramName,
                            SchoolName = item.EnrollProgram.EnrollSchool.SchoolName
                        };
            panel1.Visible = true;
            int articleID = Convert.ToInt32(GridView1.SelectedValue);
            TextBox2.Text = articleID.ToString();
            var ID = int.Parse(TextBox2.Text.ToString());
            var article = cols1.First(ar => ar.UserID == ID);
            Label18.Text = article.UserName;
            Label19.Text = article.PassWord;
            Label20.Text = article.Name;
            Label21.Text = article.CategoryName;
            Label22.Text = article.NatureName;
            Label23.Text = article.WorkplaceName;
            Label24.Text = article.WorkTitle;
            Label25.Text = article.MailingAddress;
            Label26.Text = article.FixedPhone;
            Label27.Text = article.MobilePhone;
            Label28.Text = article.EMail;
            Label29.Text = article.QQNo;
            Label30.Text = article.WeChatID;
            Label31.Text = article.ProgramName;
        }

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            SNSDataContext context = new SNSDataContext();
            var articleID = int.Parse(TextBox2.Text.ToString());
            var article = context.User.Single(item => item.UserID == articleID);
            article.IsApproved = true;
            context.SubmitChanges();
            Response.Redirect("/Manage/tab/ReviewAlumnus.aspx", true);
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            SNSDataContext context = new SNSDataContext();

            var ID = int.Parse(TextBox2.Text.ToString());
            var article = context.User.First(ar => ar.UserID == ID);
            context.User.DeleteOnSubmit(article);

            context.SubmitChanges();
            Response.Redirect("/Manage/tab/ReviewAlumnus.aspx", true);
        }

        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            var cols = from item in context.User
                       where item.IsApproved == false
                       select new
                       {
                           UserID = item.UserID,
                           UserName = item.UserName,
                           PassWord = item.PassWord,
                           Name = item.Name,
                           Sex = item.Sex == 0 ? "保密" : (item.Sex == 1 ? "男" : "女"),
                           BirthDate = item.BirthDate,
                           ProvinceName = item.LiveProvince.ProvinceName,
                           CityName = item.LiveCity.CityName,
                           CategoryName = item.EmployCategory.CategoryName,
                           WorkplaceName = item.WorkplaceName,
                           NatureName = item.WorkplaceNature.NatureName,
                           WorkTitle = item.WorkTitle,
                           MailingAddress = item.MailingAddress,
                           FixedPhone = item.FixedPhone,
                           MobilePhone = item.MobilePhone,
                           EMail = item.EMail,
                           QQNo = item.QQNo,
                           WeChatID = item.WeChatID,
                           ClassNo = item.ClassNo,
                           StudentNo = item.StudentNo,
                           EnrollYear = item.EnrollYear,
                           ProgramName = item.EnrollProgram.ProgramName,
                           SchoolName = item.EnrollProgram.EnrollSchool.SchoolName
                       };
            if (TextBox1.Text != "")
            {
                var col = from item in cols
                          where item.Name == TextBox1.Text
                          select item;
                cols = col;
            }
            if ((DropDownList1.SelectedValue.ToString() != "-1") && DropDownList1.SelectedIndex != -1)
            {
                var col = from item in cols
                          where item.CategoryName == DropDownList1.SelectedValue.ToString()
                          select item;
                cols = col;
            }
            if ((TimeDownList.SelectedIndex != -1) && (TimeDownList.SelectedValue.ToString() != "-1"))
            {
                var col = from item in cols
                          where item.EnrollYear == Convert.ToInt32(TimeDownList.SelectedValue)
                          select item;
                cols = col;
            }

            GridView1.DataSource = cols;
            GridView1.PageIndex = e.NewPageIndex;
            GridView1.DataBind();
        }
    }
}