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
                Label1.Text = Session["message"].ToString();
            }
            Session["message"] = "";
            TextBox1.Focus();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string name = TextBox1.Text;
            string password = TextBox2.Text;
            string temp = "";

            if (this.TextBox1.Text.ToString() != null && this.TextBox2.Text.ToString() != null)
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
                    if (this.TextBox2.Text.ToString().Equals(temp))
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

        protected void Button2_Click(object sender, EventArgs e)
        {
            TextBox1.Text = "";
            TextBox2.Text = "";
        }
    }
}