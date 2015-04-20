using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Alumni.Manage.tab
{
    public partial class updateTitle : System.Web.UI.Page
    {
        
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Button1.Enabled = false;
                CheckBox1.Enabled = true;
                CheckBox2.Enabled = true;
                CheckBox3.Enabled = true;
                CheckBox4.Enabled = true;
                DropDownList1.Enabled = false;
                DropDownList2.Enabled = true;
                DropDownList3.Enabled = false;
                textTitle.Enabled = true;
                textContent.Enabled = false;

            }
        }

        protected void newsGridView_SelectedIndexChanged(object sender, EventArgs e)
        {

            Button1.Enabled = true;
            DBDataContext context = new DBDataContext();
            //nt columnID = int.Parse(newsGridView.DataKeys[e.NewSelectedIndex].Value.ToString());
            int columnID = Convert.ToInt32(newsGridView.SelectedValue);
            TextBox1.Text = columnID.ToString();
            var ID = int.Parse(TextBox1.Text.ToString());
            var article = context.Columns.First(ar => ar.ColumnID == ID);

            if (article.ParentColumnID == 0)
            {
                if (article.IsSpecialCommand == true)
                {
                    if (article.SpecialCommandName == "column")
                    {
                        //DropDownList2.Enabled = false;
                        CheckBox2.Checked = true;
                        CheckBox1.Checked = article.Visible;
                        CheckBox3.Checked = article.Deletable;
                        CheckBox4.Checked = article.IsSpecialCommand;
                        textTitle.Text = article.ColumnName;
                        //DropDownList1.Enabled = true;
                        DropDownList1.ClearSelection();
                        DropDownList1.Items.FindByValue(article.SpecialCommandName.ToString()).Selected = true;
                        //DropDownList3.Enabled = true;
                        DropDownList3.ClearSelection();
                        DropDownList3.Items.FindByValue(article.SpecialCommandArgument.ToString()).Selected = true;
                        //textContent.Enabled = false;
                    }
                    else
                    {
                        //DropDownList2.Enabled = false;
                        CheckBox2.Checked = true;
                        CheckBox1.Checked = article.Visible;
                        CheckBox3.Checked = article.Deletable;
                        CheckBox4.Checked = article.IsSpecialCommand;
                        textTitle.Text = article.ColumnName;
                        //DropDownList1.Enabled = true;
                        DropDownList1.ClearSelection();
                        DropDownList1.Items.FindByValue(article.SpecialCommandName.ToString()).Selected = true;
                        //DropDownList3.Enabled=false;
                        //textContent.Enabled = true;
                        textContent.Text = article.SpecialCommandArgument;
                    }
                }
                else
                {
                    //DropDownList2.Enabled = false;
                    CheckBox2.Checked = true;
                    CheckBox1.Checked = article.Visible;
                    CheckBox3.Checked = article.Deletable;
                    CheckBox4.Checked = article.IsSpecialCommand;
                    textTitle.Text = article.ColumnName;
                    //DropDownList1.Enabled = false;
                    //DropDownList3.Enabled = false;
                    //textContent.Enabled = false;
                }
            }
            else
            {
                if (article.IsSpecialCommand == true)
                {
                    if (article.SpecialCommandName == "column")
                    {
                        //DropDownList2.Enabled = true;
                        DropDownList2.ClearSelection();
                        DropDownList2.Items.FindByValue(article.ParentColumnID.ToString()).Selected = true;
                        CheckBox2.Checked = false;
                        CheckBox1.Checked = article.Visible;
                        CheckBox3.Checked = article.Deletable;
                        CheckBox4.Checked = article.IsSpecialCommand;
                        textTitle.Text = article.ColumnName;
                       //DropDownList1.Enabled = true;
                        DropDownList1.ClearSelection();
                        DropDownList1.Items.FindByValue(article.SpecialCommandName.ToString()).Selected = true;
                        //DropDownList3.Enabled = true;
                        DropDownList3.ClearSelection();
                        DropDownList3.Items.FindByValue(article.SpecialCommandArgument.ToString()).Selected = true;
                        //textContent.Enabled = false;
                    }
                    else
                    {
                        //DropDownList2.Enabled = true;
                        DropDownList2.ClearSelection();
                        DropDownList2.Items.FindByValue(article.ParentColumnID.ToString()).Selected = true;
                        CheckBox2.Checked = false;
                        CheckBox1.Checked = article.Visible;
                        CheckBox3.Checked = article.Deletable;
                        CheckBox4.Checked = article.IsSpecialCommand;
                        textTitle.Text = article.ColumnName;
                        //DropDownList1.Enabled = true;
                        DropDownList1.ClearSelection();
                        DropDownList1.Items.FindByValue(article.SpecialCommandName.ToString()).Selected = true;
                        //DropDownList3.Enabled =false;
                        //textContent.Enabled = true;
                        textContent.Text = article.SpecialCommandArgument;
                    }
                }
                else
                {
                    //DropDownList2.Enabled = true;
                    DropDownList2.ClearSelection();
                    DropDownList2.Items.FindByValue(article.ParentColumnID.ToString()).Selected = true;
                    CheckBox2.Checked = false;
                    CheckBox1.Checked = article.Visible;
                    CheckBox3.Checked = article.Deletable;
                    CheckBox4.Checked = article.IsSpecialCommand;
                    textTitle.Text = article.ColumnName;
                    //DropDownList1.Enabled = false;
                    //DropDownList3.Enabled = false;
                    //textContent.Enabled = false;
                }
               
            }
        }

        

        protected void ChangeButton_Click(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            DBDataContext context = new DBDataContext();
            if (CheckBox2.Checked)
            {
                if (CheckBox4.Checked)
                {
                    if (DropDownList1.SelectedValue == "column")
                    {
                        var articleID = int.Parse(TextBox1.Text.ToString());
                        var article = context.Columns.Single(item => item.ColumnID == articleID);

                        article.ParentColumnID = 0;
                        article.SubTemplateID = 2;
                        article.ColumnName = textTitle.Text;
                        article.Visible = CheckBox1.Checked;
                        article.Deletable = CheckBox3.Checked;
                        article.IsSpecialCommand = CheckBox4.Checked;
                        article.SpecialCommandName = "column";
                        article.SpecialCommandArgument = DropDownList3.SelectedValue;

                        context.SubmitChanges();
                    }
                    else
                    {
                        var articleID = int.Parse(TextBox1.Text.ToString());
                        var article = context.Columns.Single(item => item.ColumnID == articleID);

                        article.ParentColumnID = 0;
                        article.SubTemplateID = 2;
                        article.ColumnName = textTitle.Text;
                        article.Visible = CheckBox1.Checked;
                        article.Deletable = CheckBox3.Checked;
                        article.IsSpecialCommand = CheckBox4.Checked;
                        article.SpecialCommandName = "content";
                        article.SpecialCommandArgument = textContent.Text;

                        context.SubmitChanges();

                    }
                }
                else
                {
                    var articleID = int.Parse(TextBox1.Text.ToString());
                    var article = context.Columns.Single(item => item.ColumnID == articleID);

                    article.ParentColumnID = 0;
                    article.SubTemplateID = 2;
                    article.ColumnName = textTitle.Text;
                    article.Visible = CheckBox1.Checked;
                    article.Deletable = CheckBox3.Checked;
                    article.IsSpecialCommand = CheckBox4.Checked;
                    article.SpecialCommandName = null;
                    article.SpecialCommandArgument = null;

                    context.SubmitChanges();
                }
            }
            else
            {
                if (CheckBox4.Checked)
                {
                    if (DropDownList1.SelectedValue == "column")
                    {
                        var articleID = int.Parse(TextBox1.Text.ToString());
                        var article = context.Columns.Single(item => item.ColumnID == articleID);

                        article.ParentColumnID = int.Parse(DropDownList2.SelectedValue);
                        article.SubTemplateID = 2;
                        article.ColumnName = textTitle.Text;
                        article.Visible = CheckBox1.Checked;
                        article.Deletable = CheckBox3.Checked;
                        article.IsSpecialCommand = CheckBox4.Checked;
                        article.SpecialCommandName = "column";
                        article.SpecialCommandArgument = DropDownList3.SelectedValue;

                        context.SubmitChanges();
                    }
                    else
                    {
                        var articleID = int.Parse(TextBox1.Text.ToString());
                        var article = context.Columns.Single(item => item.ColumnID == articleID);

                        article.ParentColumnID = int.Parse(DropDownList2.SelectedValue);
                        article.SubTemplateID = 2;
                        article.ColumnName = textTitle.Text;
                        article.Visible = CheckBox1.Checked;
                        article.Deletable = CheckBox3.Checked;
                        article.IsSpecialCommand = CheckBox4.Checked;
                        article.SpecialCommandName = "content";
                        article.SpecialCommandArgument = textContent.Text;

                        context.SubmitChanges();
                    }
                }
                else
                {
                    var articleID = int.Parse(TextBox1.Text.ToString());
                    var article = context.Columns.Single(item => item.ColumnID == articleID);

                    article.ParentColumnID = int.Parse(DropDownList2.SelectedValue);
                    article.SubTemplateID = 2;
                    article.ColumnName = textTitle.Text;
                    article.Visible = CheckBox1.Checked;
                    article.Deletable = CheckBox3.Checked;
                    article.IsSpecialCommand = CheckBox4.Checked;
                    article.SpecialCommandName = null;
                    article.SpecialCommandArgument = null;

                    context.SubmitChanges();
                }
            }

            Response.Redirect("/Manage/tab/updateTitle.aspx", true);
        }

        protected void CheckBox2_CheckedChanged(object sender, EventArgs e)
        {
            if (CheckBox2.Checked == true)
            {
                DropDownList2.Enabled = false;
            }
            else
            {
                DropDownList2.Enabled = true;
            }
        }

        protected void CheckBox4_CheckedChanged(object sender, EventArgs e)
        {
            if (CheckBox4.Checked == true)
            {
                DropDownList1.Enabled = true;

            }
            else
            {
                DropDownList1.Enabled = false;
            }
        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (DropDownList1.SelectedValue == "column")
            {
                DropDownList3.Enabled = true;
                textContent.Enabled = false;
            }
            else if (DropDownList1.SelectedValue == "content")
            {
                DropDownList3.Enabled = false;
                textContent.Enabled = true;
            }
        }
    }
}