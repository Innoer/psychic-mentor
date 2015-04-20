using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Alumni.Manage.tag
{
    public partial class DonationsManagement : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            DBDataContext context = new DBDataContext();
            var don = new AlumniDB.Donations
            {
                Name = TextBox1.Text,
                Amount = TextBox2.Text,
                Date = Calendar1.SelectedDate.Date
            };
            context.Donations.InsertOnSubmit(don);
            context.SubmitChanges();
            GridView1.DataBind();
        }

        protected void CheckBox1_CheckedChanged(object sender, EventArgs e)
        {
            if (CheckBox1.Checked == true)
            {
                Calendar2.Enabled = true;
            }
            else
            {
                Calendar2.Enabled = false;
            }
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            panel1.Visible = false;
            panel2.Visible = true;
            DBDataContext context = new DBDataContext();
            int donID = Convert.ToInt32(GridView1.SelectedValue);
            var don = context.Donations.First(ar => ar.DonationId == donID);

            Label2.Text = donID.ToString();

            TextBox3.Text = don.Name.ToString();
            TextBox4.Text = don.Amount.ToString();
            Label1.Text = don.Date.ToString();
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            DBDataContext context = new DBDataContext();
            var ID = int.Parse(Label2.Text);
            var don = context.Donations.Single(item => item.DonationId == ID);
            don.Name = TextBox3.Text;
            don.Amount = TextBox4.Text;
            if (CheckBox1.Checked == true)
            {
                don.Date = Calendar2.SelectedDate.Date;
            }
            else
            {
                don.Date = Convert.ToDateTime(Label1.Text.ToString());
            }
            context.SubmitChanges();
            GridView1.DataBind();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            panel1.Visible = true;
            panel2.Visible = false;
        }

        protected void GridView1_SelectedIndexChanged1(object sender, EventArgs e)
        {
            panel1.Visible = false;
            panel2.Visible = true;
            DBDataContext context = new DBDataContext();
            int donID = Convert.ToInt32(GridView1.SelectedValue);
            var don = context.Donations.First(ar => ar.DonationId == donID);

            Label1.Text = donID.ToString();
            TextBox3.Text = don.Name;
            TextBox4.Text = don.Amount;
            Label2.Text = don.Date.ToString();
        }

        protected void GridView1_RowDeleted(object sender, GridViewDeletedEventArgs e)
        {
            //e.Cancel = true;

            //int articleID = Convert.ToInt32(e.Keys[0]);

            //DBDataContext context = new DBDataContext();
            //var article = context.Articles.Single(item => item.ArticleID == articleID);
            //context.Articles.DeleteOnSubmit(article);

            //context.SubmitChanges();
            //GridView.DataBind();
        }
    }
}