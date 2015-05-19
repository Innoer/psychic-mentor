using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Alumni.Manage
{
    public partial class LoginManage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
            Session.Timeout = 60;
            if (Session["message"] != null)
            {
                Response.Write("<script>alert('账号和密码错误，请重新输入')</script>"); 
                Label1.Text = Session["message"].ToString();
            }
            Session["message"] = null;
            //TextBox1.Focus();
            
        }

        protected void Button1_Click(object sender, EventArgs e)
        {

            string name = url1.Value.ToString();
            string password = url2.Value.ToString();
            string temp = "";

            if (this.url1.Value.ToString() != null && this.url2.Value.ToString() != null)
            {
                DBDataContext context = new DBDataContext();
                var cols = from item in context.Users
                           where item.UserName == name
                           select new ListItem { Value = item.PassWord.ToString(), Text = item.UserName };
                
                DropDownList1.Items.AddRange(cols.ToArray());
                if (DropDownList1.SelectedIndex == -1)
                {
                    temp = "";
                }
                else
                {
                    temp = DropDownList1.SelectedValue.ToString();
                }

                
                if (temp!="")
                {
                    if (this.url2.Value.ToString().Equals(temp))
                    {
                        Session["logged"] = "true";
                        Session["UserName"] = name;
                        Session["message"] = null;
                        Response.Redirect("main.aspx", false);
                    }
                    else
                    {
                        Session["message"] = "密码错误";
                        Response.Redirect("LoginManage.aspx");
                    }
                }
                else
                {
                    Session["message"] = "没有此账号";
                    Response.Redirect("LoginManage.aspx");
                }
            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            url1.Value = "";
            url2.Value = "";
        }

        protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
        {
            string name = url1.Value.ToString();
            string password = url2.Value.ToString();
            string temp = "";

            if (this.url1.Value.ToString() != null && this.url2.Value.ToString() != null)
            {
                DBDataContext context = new DBDataContext();
                var cols = from item in context.Users
                           where item.UserName == name
                           select new ListItem { Value = item.PassWord.ToString(), Text = item.UserName };

                DropDownList1.Items.AddRange(cols.ToArray());
                if (DropDownList1.SelectedIndex == -1)
                {
                    temp = "";
                }
                else
                {
                    temp = DropDownList1.SelectedValue.ToString();
                }


                if (temp != "")
                {
                    if (this.url2.Value.ToString().Equals(temp))
                    {
                        Session["logged"] = "true";
                        Session["UserName"] = name;
                        Response.Redirect("main.aspx", false);
                    }
                    else
                    {
                        Session["message"] = "密码错误";
                        Response.Redirect("LoginManage.aspx");
                    }
                }
                else
                {
                    Session["message"] = "没有此账号";
                    Response.Redirect("LoginManage.aspx");
                }
            }
            
        }
    }
}