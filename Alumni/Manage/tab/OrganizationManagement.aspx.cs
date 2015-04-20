using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Alumni.Manage.tag
{
    public partial class OrganizationManagement : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            DBDataContext context = new DBDataContext();
            var orga = new AlumniDB.Organizations
            {
                OrganizationName = TextBox1.Text,
                OrganizationURL = TextBox2.Text
            };
            context.Organizations.InsertOnSubmit(orga);
            context.SubmitChanges();
            GridView1.DataBind();
        }
    }
}