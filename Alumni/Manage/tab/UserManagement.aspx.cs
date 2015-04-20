﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Alumni.Manage.tag
{
    public partial class UserManagement : System.Web.UI.Page
    {
        public String userIDtemp;
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void AddButton_Click(object sender, EventArgs e)
        {
            DBDataContext context = new DBDataContext();
            var users = new AlumniDB.Users
            {
                UserName = NameTextBox.Text,
                PassWord = PassWordTextBox.Text,
                Level = int.Parse(LevelTextBox.Text)
            };
            context.Users.InsertOnSubmit(users);
            context.SubmitChanges();
            UsersGridView.DataBind();
        }

        protected void UsersGridView_SelectedIndexChanged(object sender, EventArgs e)
        {
            // hide edit & delete & add new;
            panel1.Visible = false;
            panelView.Visible = true;
            DBDataContext context = new DBDataContext();
            int usersID = Convert.ToInt32(UsersGridView.SelectedValue);
            var users = context.Users.First(ar => ar.UserID == usersID);

            userIDtemp = usersID.ToString();
            Label1.Text = userIDtemp.ToString();
            NameTextBox0.Text = users.UserName.ToString();
            PassWordTextBox0.Text = users.PassWord.ToString();
            TestTextBox0.Text = users.PassWord.ToString();
            LevelTextBox0.Text = users.Level.ToString();
            panelView.Visible = true;
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            NameTextBox.Text = "";
            PassWordTextBox.Text = "";
            TestTextBox.Text = "";
            LevelTextBox.Text = "";
        }

        protected void UpdateButton_Click(object sender, EventArgs e)
        {
            DBDataContext context = new DBDataContext();
            var ID = int.Parse(Label1.Text);
            var users = context.Users.Single(item => item.UserID == ID);
            users.UserName = NameTextBox0.Text;
            users.PassWord = PassWordTextBox0.Text;
            users.Level = int.Parse(LevelTextBox0.Text);
            context.SubmitChanges();
            UsersGridView.DataBind();
            
        }

        protected void AButton_Click(object sender, EventArgs e)
        {
            NameTextBox.Text = "";
            PassWordTextBox.Text = "";
            TestTextBox.Text = "";
            LevelTextBox.Text = "";
            panel1.Visible = true;
            panelView.Visible = false;
        }
            
    }
}