using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Alumni.Manage.tab
{
    public partial class addTitle : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                DropDownList1.Enabled = false;
                DropDownList3.Enabled = false;
                textContent.Enabled = false;
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            DBDataContext context = new DBDataContext();
            if (CheckBox2.Checked)
            {
                if (CheckBox4.Checked)
                {
                    if(DropDownList1.SelectedValue=="column")
                    {
                        var columns = new AlumniDB.Columns
                        {
                            ParentColumnID = 0,
                            SubTemplateID = 2,
                            ColumnName = textTitle.Text,
                            Visible = CheckBox1.Checked,
                            Deletable = CheckBox3.Checked,
                            IsSpecialCommand = CheckBox4.Checked,
                            SpecialCommandName = DropDownList1.SelectedValue,
                            SpecialCommandArgument = DropDownList3.SelectedValue
                        };
                        context.Columns.InsertOnSubmit(columns);
                        context.SubmitChanges();
                    }
                    else
                    {
                        var columns = new AlumniDB.Columns
                        {
                            ParentColumnID = 0,
                            SubTemplateID = 2,
                            ColumnName = textTitle.Text,
                            Visible = CheckBox1.Checked,
                            Deletable = CheckBox3.Checked,
                            IsSpecialCommand = CheckBox4.Checked,
                            SpecialCommandName = DropDownList1.SelectedValue,
                            SpecialCommandArgument = textContent.Text
                        };
                        context.Columns.InsertOnSubmit(columns);
                        context.SubmitChanges();
                    }
                }
                else
                {
                    
                    var columns = new AlumniDB.Columns
                    {
                        ParentColumnID = 0,
                        SubTemplateID = 2,
                        ColumnName = textTitle.Text,
                        Visible = CheckBox1.Checked,
                        Deletable = CheckBox3.Checked,
                        IsSpecialCommand = CheckBox4.Checked,
                        SpecialCommandName = null,
                        SpecialCommandArgument = null
                    };
                    context.Columns.InsertOnSubmit(columns);
                    context.SubmitChanges();
                   
                }
            }
            else
            {
                if (CheckBox4.Checked)
                {
                    if(DropDownList1.SelectedValue=="column")
                    {
                        var columns = new AlumniDB.Columns
                        {
                            ParentColumnID = int.Parse(DropDownList2.SelectedValue),
                            SubTemplateID = 2,
                            ColumnName = textTitle.Text,
                            Visible = CheckBox1.Checked,
                            Deletable = CheckBox3.Checked,
                            IsSpecialCommand = CheckBox4.Checked,
                            SpecialCommandName = DropDownList1.SelectedValue,
                            SpecialCommandArgument = DropDownList3.SelectedValue
                        };
                        context.Columns.InsertOnSubmit(columns);
                        context.SubmitChanges();
                    }
                    else
                    {
                         var columns = new AlumniDB.Columns
                        {
                            ParentColumnID = int.Parse(DropDownList2.SelectedValue),
                            SubTemplateID = 2,
                            ColumnName = textTitle.Text,
                            Visible = CheckBox1.Checked,
                            Deletable = CheckBox3.Checked,
                            IsSpecialCommand = CheckBox4.Checked,
                            SpecialCommandName = DropDownList1.SelectedValue,
                            SpecialCommandArgument = textContent.Text
                        };
                         context.Columns.InsertOnSubmit(columns);
                         context.SubmitChanges();
                    }
                }
                else
                {
                    var columns = new AlumniDB.Columns
                    {
                        ParentColumnID = int.Parse(DropDownList2.SelectedValue),
                        SubTemplateID = 2,
                        ColumnName = textTitle.Text,
                        Visible = CheckBox1.Checked,
                        Deletable = CheckBox3.Checked,
                        IsSpecialCommand = CheckBox4.Checked,
                        SpecialCommandName = null,
                        SpecialCommandArgument = null
                    };
                    context.Columns.InsertOnSubmit(columns);
                    context.SubmitChanges();
 
                }
            }
            
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

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (DropDownList1.SelectedValue == "column")
            {
                DropDownList3.Enabled = true;
                textContent.Enabled = false;
            }
            else if (DropDownList1.SelectedValue == "content")
            {
                DropDownList3.Enabled =false;
                textContent.Enabled = true;
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
    }
}