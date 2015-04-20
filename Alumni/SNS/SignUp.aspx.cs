using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;
using System.Text.RegularExpressions;

using Alumni.DBHelper;
using DotLiquid;

namespace Alumni.SNS
{
    public partial class SignUp : System.Web.UI.Page
    {
        private const int AllCitys = 0;

        private bool ParseDateTime(String paramName, out DateTime result)
        {
            return DateTime.TryParse(Request.Params[paramName], out result);
        }

        private DateTime? ParseDateTime(String paramName)
        {
            DateTime result;
            if (!DateTime.TryParse(Request.Params[paramName], out result))
                return null;
            else
                return result;
        }

        private bool ParseInt(String paramName, out int result)
        {
            return int.TryParse(Request.Params[paramName], out result);
        }

        private int ParseInt(String paramName, int defaultValue)
        {
            int result;
            if (!int.TryParse(Request.Params[paramName], out result))
                return defaultValue;
            else
                return result;
        }

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
                        if (Session["SNS_RegisterUserName"] == null || string.IsNullOrEmpty(userName = Session["SNS_RegisterUserName"].ToString()))
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
                        break;

                    invalid:
                        Response.Write("Invalid call!");
                        Response.End();
                        break;
                    }

                case 3:
                    {
                        String userName = String.Empty;
                        if (Session["SNS_RegisterUserName"] == null || string.IsNullOrEmpty(userName = Session["SNS_RegisterUserName"].ToString()))
                            goto invalid;

                        var user = snsContext.User.Where(u => u.UserName == userName).SingleOrDefault();
                        if (user == null) // WHAT THE FUCK!!
                            goto invalid;

                        var name = Request.Params["name"];
                        int sex, selectedLiveProvince, selectedLiveCity;
                        int selectedEmployCategory;
                        int selectedEnrollYear;
                        int selectedEnrollProgram;

                        if (string.IsNullOrEmpty(name) || !Regex.IsMatch(name, @"^([\u4E00-\uFA29]|[\uE7C7-\uE7F3]|[a-zA-Z ]){2,40}$")
                            || !ParseInt("sex", out sex)
                            || !ParseInt("live_province", out selectedLiveProvince)
                            || !ParseInt("live_city", out selectedLiveCity)
                            || !ParseInt("employ_category", out selectedEmployCategory)
                            || !ParseInt("enroll_year", out selectedEnrollYear)
                            || !ParseInt("enroll_program", out selectedEnrollProgram))
                            goto invalid;

                        user.Name = HttpUtility.HtmlEncode(name);
                        user.Sex = sex;
                        user.BirthDate = ParseDateTime("birth_date");
                        user.LiveProvinceID = selectedLiveProvince;
                        if (selectedLiveCity == AllCitys) user.LiveCityID = null;
                        else user.LiveCityID = selectedLiveCity;
                        user.EmployCategoryID = selectedEmployCategory;
                        user.WorkplaceNatureID = ParseInt("workplace_nature", 1);
                        user.WorkplaceName = Utility.Truncate(HttpUtility.HtmlEncode(Request.Params["workplace_name"]), 90);
                        user.WorkTitle = Utility.Truncate(HttpUtility.HtmlEncode(Request.Params["worktitle"]), 40);
                        user.MailingAddress = Utility.Truncate(HttpUtility.HtmlEncode(Request.Params["mailing_address"]), 100);
                        user.FixedPhone = Utility.Truncate(HttpUtility.HtmlEncode(Request.Params["fixed_phone"]), 20);
                        user.MobilePhone = Utility.Truncate(HttpUtility.HtmlEncode(Request.Params["mobile_phone"]), 20);
                        user.EMail = Utility.Truncate(HttpUtility.HtmlEncode(Request.Params["email"]), 90);
                        user.QQNo = Utility.Truncate(HttpUtility.HtmlEncode(Request.Params["qqno"]), 20);
                        user.WeChatID = Utility.Truncate(HttpUtility.HtmlEncode(Request.Params["wechatid"]), 40);
                        user.ClassNo = Utility.Truncate(HttpUtility.HtmlEncode(Request.Params["classno"]), 15);
                        user.StudentNo = Utility.Truncate(HttpUtility.HtmlEncode(Request.Params["studentno"]), 25);
                        user.EnrollYear = selectedEnrollYear;
                        user.EnrollProgramID = selectedEnrollProgram;
                        user.GraduateYear = ParseInt("graduate_year", user.EnrollYear + 4);
                        snsContext.SubmitChanges();

                        Session["SNS_SignInUserName"] = Session["SNS_RegisterUserName"];
                        Session.Remove("SNS_RegisterUserName");
                        Response.Write("<script language='javascript' type='text/javascript'>parent.location.reload();</script>");
                        Response.End();
                        break;

                    invalid:
                        Response.Write("Invalid call!");
                        Response.End();
                        break;
                    }

                default: 
                    Response.Write("Invalid call!");
                    Response.End();
                    break;
            }
        }
    }
}