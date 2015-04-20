using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Alumni.Manage.tab
{
    public partial class ModifyAlumnus : System.Web.UI.Page
    {
        
        protected void Page_Load(object sender, EventArgs e)
        {
            SNSDataContext context = new SNSDataContext();
            var cols = from item in context.User
                       join itemcity in context.LiveCity on item.LiveCityID equals itemcity.CityID
                       join itemprovince in context.LiveProvince on item.LiveProvinceID equals itemprovince.ProvinceID
                       join itemprogram in context.EnrollProgram on item.EnrollProgramID equals itemprogram.ProgramID
                       join itemcategory in context.EmployCategory on item.EmployCategoryID equals itemcategory.CategoryID
                       join itemnature in context.WorkplaceNature on item.WorkplaceNatureID equals itemnature.NatureID
                       join itemschool in context.EnrollSchool on itemprogram.SchoolID equals itemschool.SchoolID
                       select new
                       {
                           item.UserID,
                           item.UserName,
                           item.PassWord,
                           item.Name,
                           item.Sex,
                           item.BirthDate,
                           itemprovince.ProvinceName,
                           itemcity.CityName,
                           itemcategory.CategoryName,
                           item.WorkplaceName,
                           itemnature.NatureName,
                           item.WorkTitle,
                           item.MailingAddress,
                           item.FixedPhone,
                           item.MobilePhone,
                           item.EMail,
                           item.QQNo,
                           item.WeChatID,
                           item.ClassNo,
                           item.StudentNo,
                           item.EnrollYear,
                           itemprogram.ProgramName,
                           itemschool.SchoolName
                       };
            if (!IsPostBack)
            {
                GridView1.DataSource = cols;
                GridView1.DataBind();

                SNSDataContext context2 = new SNSDataContext();

                var cols2 = from item in context2.LiveCity
                            select new ListItem { Value = item.CityID.ToString(), Text = item.CityName };

                DropDownList2.Items.AddRange(cols2.ToArray());
                DropDownList2.ClearSelection();
            }
        }
        protected void DropDownList2_SelectedIndexChanged(object sender, EventArgs e)
        {
            //Label8.Text = DropDownList1.SelectedValue.ToString();
            //var city = from item in context.LiveCity
            //            where item.ProvinceID == int.Parse(DropDownList1.SelectedValue.ToString())
            //            select item.CityName;
            //DropDownList2.DataSource = city;
            //DropDownList2.DataBind();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            SNSDataContext context = new SNSDataContext();
            var articleID = int.Parse(TextBox18.Text.ToString());
            var article = context.User.Single(item => item.UserID == articleID);

            article.UserName=TextBox1.Text;
            article.PassWord=TextBox2.Text;
            article.PassWord=TextBox3.Text;
             article.Name=TextBox4.Text;
             article.Sex = int.Parse(DropDownList6.SelectedValue);
            article.LiveProvinceID=int.Parse(DropDownList1.SelectedValue);
           article.BirthDate=Calendar1.SelectedDate.Date;
           article.LiveCityID = int.Parse(DropDownList2.SelectedValue);
           article.EmployCategoryID = int.Parse(DropDownList3.SelectedValue);
           article.WorkplaceNatureID = int.Parse(DropDownList4.SelectedValue);
           article.EnrollProgramID = int.Parse(DropDownList5.SelectedValue);

             article.WorkplaceName=TextBox6.Text;
             article.WorkTitle=TextBox7.Text;
             article.MailingAddress=TextBox8.Text;
             article.FixedPhone=TextBox9.Text;
             article.MobilePhone=TextBox10.Text;
             article.EMail=TextBox11.Text;
             article.QQNo=TextBox12.Text;
             article.WeChatID=TextBox13.Text;
             article.ClassNo=TextBox14.Text;
             article.StudentNo=TextBox15.Text;
             article.EnrollYear=int.Parse(TextBox16.Text);

             article.GraduateYear=int.Parse(TextBox17.Text);


            context.SubmitChanges();
            Response.Redirect("/Manage/tab/ModifyAlumnus.aspx", true);
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            SNSDataContext context = new SNSDataContext();
            int articleID = Convert.ToInt32(GridView1.SelectedValue);
            TextBox18.Text = articleID.ToString();
            var ID = int.Parse(TextBox18.Text.ToString());
            var article = context.User.First(ar => ar.UserID == ID);

            TextBox1.Text = article.UserName;
            TextBox2.Text = article.PassWord;
            TextBox3.Text = article.PassWord;
            TextBox4.Text = article.Name;
            DropDownList6.ClearSelection();
            DropDownList6.Items.FindByValue(article.Sex.ToString()).Selected = true;

            DropDownList1.ClearSelection();
            DropDownList1.Items.FindByValue(article.LiveProvinceID.ToString()).Selected = true;

            Calendar1.SelectedDate = article.BirthDate.Value.Date;


            DropDownList2.ClearSelection();
            DropDownList2.Items.FindByValue(article.LiveCityID.ToString()).Selected = true;
            DropDownList3.ClearSelection();
            DropDownList3.Items.FindByValue(article.EmployCategoryID.ToString()).Selected = true;
            DropDownList4.ClearSelection();
            DropDownList4.Items.FindByValue(article.WorkplaceNatureID.ToString()).Selected = true;
            if (article.WorkplaceName == null)
            {
                TextBox6.Text = "";
            }
            else
            {
                TextBox6.Text = article.WorkplaceName.ToString();
            }
            if (article.WorkTitle == null)
            {
                TextBox7.Text = "";
            }
            else
            {
                TextBox7.Text = article.WorkTitle.ToString();
            }
            if (article.MailingAddress == null)
            {
                TextBox8.Text = "";
            }
            else
            {
                TextBox8.Text = article.MailingAddress.ToString();
            }
            if (article.FixedPhone == null)
            {
                TextBox9.Text = "";
            }
            else
            {
                TextBox9.Text = article.FixedPhone.ToString();
            }
            if (article.MobilePhone == null)
            {
                TextBox10.Text = "";
            }
            else
            {
                TextBox10.Text = article.MobilePhone.ToString();
            }
            if (article.EMail == null)
            {
                TextBox11.Text = "";
            }
            else
            {
                TextBox11.Text = article.EMail.ToString();
            }
            if (article.QQNo == null)
            {
                TextBox12.Text = "";
            }
            else
            {
                TextBox12.Text = article.QQNo.ToString();
            }
            if (article.WeChatID == null)
            {
                TextBox13.Text = "";
            }
            else
            {
                TextBox13.Text = article.WeChatID.ToString();
            }
            if (article.ClassNo == null)
            {
                TextBox14.Text = "";
            }
            else
            {
                TextBox14.Text = article.ClassNo.ToString();
            }
            if (article.StudentNo == null)
            {
                TextBox15.Text = "";
            }
            else
            {
                TextBox15.Text = article.StudentNo.ToString();
            }
 
                TextBox16.Text = article.EnrollYear.ToString();

            DropDownList5.ClearSelection();
            DropDownList5.Items.FindByValue(article.EnrollProgramID.ToString()).Selected = true;
            if (article.GraduateYear == null)
            {
                TextBox17.Text = "";
            }
            else
            {
                TextBox17.Text = article.GraduateYear.ToString();
            }
        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            SNSDataContext context2 = new SNSDataContext();

            var cols2 = from item in context2.LiveCity
                        where item.ProvinceID == int.Parse(DropDownList1.SelectedValue)
                        select new ListItem { Value = item.CityID.ToString(), Text = item.CityName };
            DropDownList2.Items.Clear();
            DropDownList2.Items.AddRange(cols2.ToArray());
            DropDownList2.ClearSelection();
        }

        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            SNSDataContext context = new SNSDataContext();
            var cols = from item in context.User
                       join itemcity in context.LiveCity on item.LiveCityID equals itemcity.CityID
                       join itemprovince in context.LiveProvince on item.LiveProvinceID equals itemprovince.ProvinceID
                       join itemprogram in context.EnrollProgram on item.EnrollProgramID equals itemprogram.ProgramID
                       join itemcategory in context.EmployCategory on item.EmployCategoryID equals itemcategory.CategoryID
                       join itemnature in context.WorkplaceNature on item.WorkplaceNatureID equals itemnature.NatureID
                       join itemschool in context.EnrollSchool on itemprogram.SchoolID equals itemschool.SchoolID
                       select new
                       {
                           item.UserID,
                           item.UserName,
                           item.PassWord,
                           item.Name,
                           item.Sex,
                           item.BirthDate,
                           itemprovince.ProvinceName,
                           itemcity.CityName,
                           itemcategory.CategoryName,
                           item.WorkplaceName,
                           itemnature.NatureName,
                           item.WorkTitle,
                           item.MailingAddress,
                           item.FixedPhone,
                           item.MobilePhone,
                           item.EMail,
                           item.QQNo,
                           item.WeChatID,
                           item.ClassNo,
                           item.StudentNo,
                           item.EnrollYear,
                           itemprogram.ProgramName,
                           itemschool.SchoolName
                       };
            GridView1.DataSource = cols;
            GridView1.PageIndex = e.NewPageIndex;
            GridView1.DataBind();
        }
    }
}