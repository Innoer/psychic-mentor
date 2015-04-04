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
    public partial class FindMate : System.Web.UI.Page
    {
        private class UserType : Drop
        {
            public int UserID { get; set; }
            public String Name { get; set; }
            public String EmployCategory { get; set; }
            public String WorkTitle { get; set; }
            public String LivePlace { get; set; }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            DBDataContext context = new DBDataContext();
            SNSDataContext snsContext = new SNSDataContext();
            
            var today = DateTime.Today;
            var latestEnrollYear = today.Year;
            if (today.Month < 9) latestEnrollYear--;

            int selectedYear = latestEnrollYear;
            int selectedSchool = 1, selectedProgram = 1;
            int selectedCategory = 1;
            int selectedProvince = 1, selectedCity = 0;
            bool querySuccess = true; String queryStatus = "搜索条件不完整，请在左侧补充条件后重新搜索。";
            IQueryable<UserType> queryResult = null;

            // fuck sql injection
            if (!int.TryParse(Request.Params["enroll_year"], out selectedYear) || selectedYear < 1988 || selectedYear > latestEnrollYear) querySuccess = false;
            if (!int.TryParse(Request.Params["enroll_program"], out selectedProgram)) querySuccess = false;
            var _program = snsContext.EnrollProgram.FirstOrDefault(p => p.ProgramID == selectedProgram);
            if (_program == null) querySuccess = false;
            else selectedSchool = _program.SchoolID;

            if (!int.TryParse(Request.Params["employ_category"], out selectedCategory)) querySuccess = false;
            if (!int.TryParse(Request.Params["live_province"], out selectedProvince)) querySuccess = false;
            int.TryParse(Request.Params["live_city"], out selectedCity); // this one is optional
            if (selectedCity != 0) // but if not all the cities
            {
                var _city = snsContext.LiveCity.FirstOrDefault(c => c.CityID == selectedCity);
                if (_city == null) querySuccess = false;
                else selectedProvince = _city.ProvinceID;
            }

            if (querySuccess)
            {
                queryResult = from item in snsContext.User
                              where item.EnrollYear == selectedYear &&
                                    item.EnrollProgramID == selectedProgram &&
                                    item.EmployCategoryID == selectedCategory &&
                                    item.LiveProvinceID == selectedProvince &&
                                    (selectedCity != 0 ? item.LiveCityID == selectedCity : true)
                              select new UserType
                              {
                                  UserID = item.UserID,
                                  Name = item.Name,
                                  EmployCategory = item.EmployCategory.CategoryName,
                                  WorkTitle = item.WorkTitle,
                                  LivePlace = item.LiveProvince.ProvinceName + (item.LiveCityID.HasValue ? item.LiveCity.CityName : String.Empty),
                              };
            }

            var topColumns = ColumnHelper.GetSubColumnsByID(context, SharedConfig.TopLevelParentID);

            var enrollSchool = from item in snsContext.EnrollSchool
                               select new { ID = item.SchoolID, Name = item.SchoolName };

            var enrollProgram = from item in snsContext.EnrollProgram
                                select new { ID = item.ProgramID, Name = item.ProgramName, SchoolID = item.SchoolID };

            var employCategory = from item in snsContext.EmployCategory
                                 select new { ID = item.CategoryID, Name = item.CategoryName };

            var liveProvince = from item in snsContext.LiveProvince
                               select new { ID = item.ProvinceID, Name = item.ProvinceName };

            var liveCity = from item in snsContext.LiveCity
                           select new { ID = item.CityID, Name = item.CityName, ProvinceID = item.ProvinceID };

            Template template = TemplateHelper.GetTemplateByPath("/Template/SNS/FindMate.html");
            var dataToRender = Hash.FromAnonymousObject(
                new
                {
                    TopColumns = topColumns,

                    LatestEnrollYear = latestEnrollYear,
                    SelectedYear = selectedYear,

                    EnrollSchool = enrollSchool, 
                    EnrollProgram = enrollProgram,
                    SelectedSchool = selectedSchool, 
                    SelectedProgram = selectedProgram,

                    EmployCategory = employCategory, 
                    SelectedCategory = selectedCategory,

                    LiveProvince = liveProvince,
                    LiveCity = liveCity,
                    SelectedProvince = selectedProvince,
                    SelectedCity = selectedCity,

                    Query = new 
                    {
                        Success = querySuccess,
                        Status = queryStatus,

                        Count = queryResult != null ? queryResult.Count() : 0,
                        Result = queryResult,
                    }
                });

            template.Render(Response.Output, new RenderParameters { LocalVariables = dataToRender });
            Response.End();
        }
    }
}