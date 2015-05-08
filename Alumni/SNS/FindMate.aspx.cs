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
        private class PagerType : DotLiquid.Drop
        {
            public bool First { get; set; }
            public bool Previous { get; set; }
            public bool Next { get; set; }
            public bool Last { get; set; }

            public int CurrentPageID { get; set; }
            public int CurrentCountStart { get; set; }
            public int CurrentCountStop { get; set; }
            public int TotalPageCount { get; set; }
            public int TotalArticleCount { get; set; }

            public int ArticlesPerPage { get; set; }
        }

        private class UserType : Drop
        {
            public int UserID { get; set; }
            public String Name { get; set; }
            public String EmployCategory { get; set; }
            public String WorkTitle { get; set; }
            public String LivePlace { get; set; }
        }

        private const int All = 0;

        protected void Page_Load(object sender, EventArgs e)
        {
            string userName;
            if (Session["SNS_SignInUserName"] == null || string.IsNullOrEmpty(userName = Session["SNS_SignInUserName"].ToString()))
            {
                Response.Redirect("/SNS/ControlPanel.aspx?ErrorID=1");
                return;
            }

            DBDataContext context = new DBDataContext();
            SNSDataContext snsContext = new SNSDataContext();

            var user = snsContext.User.Where(u => u.UserName == userName).Single(); // should exist, if not, just throw exception, :P
            if (!user.IsApproved) // only avaliable to approved users
            {
                Response.Redirect("/SNS/ControlPanel.aspx?ErrorID=2");
                return;
            }

            int pageID = 1, articlesPerPage = 0, totalPageCount = 0;
            
            var today = DateTime.Today;
            var latestEnrollYear = today.Year;
            if (today.Month < 9) latestEnrollYear--;

            int selectedYear = All;
            int selectedSchool = All, selectedProgram = All;
            int selectedCategory = All;
            int selectedProvince = All, selectedCity = All;
            bool querySuccess = true; String queryStatus = "搜索条件不完整，请在左侧补充条件后重新搜索。";
            IQueryable<UserType> queryResult = null;

            // fuck sql injection
            if (!int.TryParse(Request.Params["enroll_year"], out selectedYear)) querySuccess = false;
            if (selectedYear != All && (selectedYear < 1988 || selectedYear > latestEnrollYear)) querySuccess = false;
            
            int.TryParse(Request.Params["enroll_school"], out selectedSchool); // this one is optional
            if (selectedSchool != All) // but if not all the school
            {
                var _school = snsContext.EnrollSchool.FirstOrDefault(s => s.SchoolID == selectedSchool);
                if (_school == null) { selectedSchool = All; querySuccess = false; }
            }
            if (!int.TryParse(Request.Params["enroll_program"], out selectedProgram)) querySuccess = false;
            if (selectedProgram != All)
            {
                var _program = snsContext.EnrollProgram.FirstOrDefault(p => p.ProgramID == selectedProgram);
                if (_program == null) { selectedSchool = All; selectedProgram = All; querySuccess = false; }
                else selectedSchool = _program.SchoolID;
            }

            if (!int.TryParse(Request.Params["employ_category"], out selectedCategory)) querySuccess = false;
            if (!int.TryParse(Request.Params["live_province"], out selectedProvince)) querySuccess = false;
            int.TryParse(Request.Params["live_city"], out selectedCity); // this one is optional
            if (selectedCity != All) // but if not all the cities
            {
                var _city = snsContext.LiveCity.FirstOrDefault(c => c.CityID == selectedCity);
                if (_city == null) { selectedProvince = 1; selectedCity = All; querySuccess = false; }
                else selectedProvince = _city.ProvinceID;
            }

            if (querySuccess)
            {
                int.TryParse(Request["PageID"], out pageID);

                queryResult = from item in snsContext.User
                              where (selectedYear != All ? item.EnrollYear == selectedYear : true) &&
                                    (selectedSchool != All ? item.EnrollProgram.SchoolID == selectedSchool : true) &&
                                    (selectedProgram != All ? item.EnrollProgramID == selectedProgram : true) &&
                                    (selectedCategory != All ? item.EmployCategoryID == selectedCategory : true) &&
                                    (selectedProvince != All ? item.LiveProvinceID == selectedProvince : true) &&
                                    (selectedCity != All ? item.LiveCityID == selectedCity : true)
                              select new UserType
                              {
                                  UserID = item.UserID,
                                  Name = HttpUtility.HtmlEncode(item.Name),
                                  EmployCategory = HttpUtility.HtmlEncode(item.EmployCategory.CategoryName),
                                  WorkTitle = HttpUtility.HtmlEncode(item.WorkTitle),
                                  LivePlace = item.LiveProvince.ProvinceName + (item.LiveCityID.HasValue ? item.LiveCity.CityName : String.Empty),
                              };

                articlesPerPage = new ConfigHelper(context).ArticlesPerPage;
                totalPageCount = (int)Math.Ceiling(queryResult.Count() / (double)articlesPerPage);
                if (totalPageCount == 0) totalPageCount++;

                if (pageID < 1) pageID = 1;
                else if (pageID > totalPageCount) pageID = totalPageCount;
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
                    IsSignIn = true,
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

                        Count = querySuccess ? queryResult.Count() : 0,
                        Result = new TableGetter<UserType>(queryResult.Skip((pageID - 1) * articlesPerPage).Take(articlesPerPage)),
                    },

                    Pager = new PagerType
                    {
                        First = pageID > 1 ? true : false,
                        Previous = pageID - 1 >= 1 ? true : false,
                        Next = pageID + 1 <= totalPageCount ? true : false,
                        Last = pageID < totalPageCount ? true : false,
                        CurrentPageID = pageID, 
                        CurrentCountStart = (pageID - 1) * articlesPerPage + 1, CurrentCountStop = pageID * articlesPerPage,
                        TotalPageCount = totalPageCount,
                        TotalArticleCount = querySuccess ? queryResult.Count() : 0,
                        ArticlesPerPage = articlesPerPage
                    }
                });

            template.Render(Response.Output, new RenderParameters { LocalVariables = dataToRender });
            Response.End();
        }
    }
}