using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Alumni.Manage.tag
{
    public partial class AddAlumnus : System.Web.UI.Page
    {
        
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (Session["logged"].ToString() != "true")
                    Response.Write(" <script> parent.parent.window.location.href= 'overTime.htm' </script> ");
                
                    //Response.Redirect("overTime.htm", true);
            }
            catch (Exception)
            {
                Response.Write(" <script> parent.parent.window.location.href= 'overTime.htm' </script> ");
                //Response.Write("<script>window.open('overTime.htm','_blank')</script>");
               
                //Response.Redirect("overTime.htm", true);
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
            var add = new AlumniSNSDB.User
            {
                UserName = TextBox1.Text,
                PassWord = TextBox2.Text,
                Name = TextBox4.Text,
                Sex = int.Parse(DropDownList6.SelectedValue.ToString()),
                BirthDate = Convert.ToDateTime(TextBox18.Text.ToString()),
                LiveProvinceID = int.Parse(DropDownList1.SelectedValue.ToString()),
                LiveCityID = int.Parse(DropDownList2.SelectedValue),
                EmployCategoryID = int.Parse(DropDownList3.SelectedValue.ToString()),
                WorkplaceNatureID = int.Parse(DropDownList4.SelectedValue.ToString()),
                WorkplaceName = TextBox6.Text,
                WorkTitle = TextBox7.Text,
                MailingAddress = TextBox8.Text,
                FixedPhone = TextBox9.Text,
                MobilePhone = TextBox10.Text,
                EMail = TextBox11.Text,
                QQNo = TextBox12.Text,
                WeChatID = TextBox13.Text,
                ClassNo = TextBox14.Text,
                StudentNo = TextBox15.Text,
                EnrollYear = int.Parse(TextBox16.Text.ToString()),
                EnrollProgramID = int.Parse(DropDownList5.SelectedValue.ToString()),
                GraduateYear = int.Parse(TextBox17.Text),
                IsApproved=true
            };
            context.User.InsertOnSubmit(add);
            context.SubmitChanges();
            Response.Redirect("/Manage/tab/AddAlumnus.aspx", true);
            
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

        
    }
}