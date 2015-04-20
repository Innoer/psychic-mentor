using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Alumni.Manage.tag
{
    public partial class SearchAlumnus : System.Web.UI.Page
    {
        SNSDataContext context = new SNSDataContext();

     protected void Page_Load(object sender, EventArgs e)
     {
         
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
         GridView1.DataBind();
      }

        protected void TimeDownList_SelectedIndexChanged(object sender, EventArgs e)
        {
        }

        protected void SearchButton_Click(object sender, EventArgs e)
        {
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
            if (TextBox1.Text != "")
            {
                var col = from item in cols
                          where item.Name == TextBox1.Text
                          select item;
                cols = col;
            }
            if ((DropDownList1.SelectedIndex != -1) && (DropDownList1.Enabled == true))
            {
                var col = from item in cols
                          where item.CategoryName == DropDownList1.SelectedValue.ToString()
                          select item;
                cols = col;
            }
            if ((TimeDownList.SelectedIndex != -1)&& (TimeDownList.Enabled == true))
            {
                var col = from item in cols
                          where item.EnrollYear == Convert.ToInt32(TimeDownList.SelectedValue)
                          select item;
                cols = col;
            }
            
            GridView1.DataSource = cols;
            GridView1.DataBind();
        }

        protected void CheckBox1_CheckedChanged(object sender, EventArgs e)
        {
            if (CheckBox1.Checked == true)
            {
                DropDownList1.Enabled = true;
            }
            else
            {
                DropDownList1.Enabled = false;
            }
        }

        protected void CheckBox2_CheckedChanged(object sender, EventArgs e)
        {
            if (CheckBox2.Checked == true)
            {

                TimeDownList.Enabled = true;
            }
            else
            {
                TimeDownList.Enabled = false;
            }
        }
    }
}