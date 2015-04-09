using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using Alumni.DBHelper;
using DotLiquid;

namespace Alumni.SNS
{
    public partial class SignUp : System.Web.UI.Page
    {
        private const int AllCitys = 0;

        protected void Page_Load(object sender, EventArgs e)
        {
            SNSDataContext snsContext = new SNSDataContext();
            Template template = TemplateHelper.GetTemplateByPath("/Template/SNS/SignUp.html");

            int step;
            if (!int.TryParse(Request.Params["Step"], out step)) step = 1;

            var today = DateTime.Today;
            var latestEnrollYear = today.Year;
            if (today.Month < 9) latestEnrollYear--;
            var latestGraduateYear = latestEnrollYear + 4;

            var enrollProgram = from item in snsContext.EnrollProgram
                                select new { ID = item.ProgramID, Name = item.ProgramName, SchoolID = item.SchoolID };

            var employCategory = from item in snsContext.EmployCategory
                                 select new { ID = item.CategoryID, Name = item.CategoryName };

            switch (step)
            {
                case 1:
                    {
                        var dataToRender = Hash.FromAnonymousObject(
                           new
                           {
                               Step = step,
                               LatestEnrollYear = latestEnrollYear,
                               EnrollProgram = enrollProgram,
                               EmployCategory = employCategory,
                           });

                        template.Render(Response.Output, new RenderParameters { LocalVariables = dataToRender });
                        Response.End();
                        break;
                    }

                case 2:
                    {
                        String userName = String.Empty;
                        if (Session["RegisterUserName"] == null || string.IsNullOrEmpty(userName = Session["RegisterUserName"].ToString()))
                            goto invalid;

                        var user = snsContext.User.Where(u => u.UserName == userName).SingleOrDefault();
                        if (user == null) // WHAT THE FUCK!!
                            goto invalid;

                        int selectedSchool = snsContext.EnrollProgram.Where(p => p.ProgramID == user.EnrollProgramID).Single().SchoolID;

                        var workplaceNature = from item in snsContext.WorkplaceNature
                                              select new { ID = item.NatureID, Name = item.NatureName };

                        var enrollSchool = from item in snsContext.EnrollSchool
                                           select new { ID = item.SchoolID, Name = item.SchoolName };

                        var liveProvince = from item in snsContext.LiveProvince
                                           select new { ID = item.ProvinceID, Name = item.ProvinceName };

                        var liveCity = from item in snsContext.LiveCity
                                       select new { ID = item.CityID, Name = item.CityName, ProvinceID = item.ProvinceID };

                        var dataToRender = Hash.FromAnonymousObject(
                           new
                           {
                               Step = step,

                               Name = user.Name,
                               LatestEnrollYear = latestEnrollYear,
                               SelectedYear = user.EnrollYear,
                               LatestGraduateYear = latestGraduateYear,

                               EnrollSchool = enrollSchool,
                               EnrollProgram = enrollProgram,
                               SelectedSchool = selectedSchool,
                               SelectedProgram = user.EnrollProgramID,

                               LiveProvince = liveProvince,
                               LiveCity = liveCity,

                               EmployCategory = employCategory,
                               SelectedCategory = user.EmployCategoryID,

                               WorkplaceNature = workplaceNature,
                           });

                        template.Render(Response.Output, new RenderParameters { LocalVariables = dataToRender });
                        Response.End();

                    invalid:
                        Response.Write("Invalid call!");
                        Response.End();
                        break;
                    }
            }
        }
    }
}