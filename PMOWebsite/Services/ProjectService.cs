using PMOWebsite.Models;
using PMOWebsite.Models.db;
using PMOWebsite.Models.db.List;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Linq.Dynamic;
using System.Reflection;
using System.Web;
using System.Web.Mvc;

namespace PMOWebsite.Services
{
    public class ProjectService
    {
        //private HSISProjectsTestEntities db = new HSISProjectsTestEntities();
        private HSISProjectsEntities db = new HSISProjectsEntities();

        public List<SelectListItem> getHSISPrimaryLead()
        {
            var list = db.tblHSISPrimaryLeads.Select(s => new SelectListItem()
            {
                Text = s.PrimaryLeadName,
                Value = s.PrimaryLeadID.ToString()
            }).ToList();
            return list;
        }
        public List<SelectListItem> geProjectRequestType()
        {
            var list = db.tblProjectRequestTypes.Select(s => new SelectListItem()
            {
                Text = s.ProjectRequestTypeName,
                Value = s.ProjectRequestTypeID.ToString()
            }).ToList();
            return list;
        }


        public List<SelectListItem> getProjectSize()
        {
            var list = db.tblProjectSizes.Select(s => new SelectListItem()
            {
                Text = s.ProjectSizeName,
                Value = s.ProjectSizeID.ToString()
            }).ToList();
            return list;
        }

        public List<SelectListItem> getProjectPriority()
        {
            var list = db.tblProjectPriorities.Select(s => new SelectListItem()
            {
                Text = s.PriorityName,
                Value = s.PriorityID.ToString()
            }).ToList();
            return list;
        }

        public List<SelectListItem> getProjectStatus()
        {
            var list = db.tblProjectStatus.Select(s => new SelectListItem()
            {
                Text = s.StatusName,
                Value = s.StatusID.ToString()
            }).ToList();
            return list;
        }

        public List<SelectListItem> getFilterList()
        {
            Type pListClass = typeof(ProjectList);
            PropertyInfo[] mInfo = pListClass.GetProperties();
            List<SelectListItem> list = new List<SelectListItem>();
            foreach (PropertyInfo item in mInfo)
            {
                try
                {
                    DisplayNameAttribute info = (DisplayNameAttribute)Attribute.GetCustomAttribute(item, typeof(DisplayNameAttribute));
                    if (new string[] { "Project Name", "Affected Cattegories", "Project Status", "Affected Facilities", "Desired Budget", "Scheduled Start Date", "Scheduled End Date" }.Contains(info.DisplayName))
                    {
                        SelectListItem newItem = new SelectListItem();
                        newItem.Text = info.DisplayName;
                        newItem.Value = info.DisplayName;
                        list.Add(newItem);
                    }
                }
                catch (Exception e)
                {

                }
            }
            return list;
        }

        public void filteredProjects(string FilterType, string SearchString, ref List<ProjectList> filterContent)
        {
            CustonContext d = new CustonContext();
            var tableName = filterTypeToTableName(FilterType);
            string where = tableName + ".Contains(" + SearchString + ")";
            //filterContent = filterContent.Where(where).Select(p => p).ToList();
        }

        public List<ProjectList> fillProjectList()
        {
            var projects = (from pList in db.tblProjectInformations
                            join r in db.tblProjectRequesters on pList.ProjectRequesterID equals r.ProjectRequesterID into rp
                            from arequester in rp.DefaultIfEmpty()
                            join p in db.tblProjectPurposes on pList.ProjectID equals p.ProjectID into purp
                            from purpose in purp.DefaultIfEmpty()
                            join b in db.tblProjectBudgets on pList.ProjectID equals b.ProjectID into bud
                            from budget in bud.DefaultIfEmpty()
                            join d in db.tblProjectDates on pList.ProjectID equals d.ProjectID into adate
                            from dates in adate.DefaultIfEmpty()
                            join rt in db.tblProjectRequestTypes on pList.ProjectRequestTypeID equals rt.ProjectRequestTypeID into re
                            from request in re.DefaultIfEmpty()
                            join pr in db.tblHSISPrimaryLeads on pList.HSISPrimaryLeadID equals pr.PrimaryLeadID into prime
                            from primary in prime.DefaultIfEmpty()
                            join sec in db.tblHSISSecondaryLeads on pList.HSISSecondaryLeadID equals sec.SecondaryLeadID into second
                            from secondary in second.DefaultIfEmpty()
                            join s in db.tblProjectSizes on pList.ProjectSizeID equals s.ProjectSizeID into sizes
                            from size in sizes.DefaultIfEmpty()
                            join pri in db.tblProjectPriorities on pList.ProjectPriorityID equals pri.PriorityID into priorities
                            from proporty in priorities.DefaultIfEmpty()
                            join stat in db.tblProjectStatus on pList.ProjectStatusID equals stat.StatusID into statuses
                            from status in statuses.DefaultIfEmpty()
                            where status.StatusName != "Archived"
                            select new ProjectList
                            {
                                projectID = pList.ProjectID,
                                projectName = pList.ProjectName,
                                departmentOFRequest = pList.DepartmentOfRequest,
                                projectSubmitter = pList.ProjectSubmitter,
                                ranking = pList.ProjectRankingScore,
                                laborHr = pList.ProjectLaborHours,
                                currentState = purpose.Comments,
                                futureState = purpose.FutureState,
                                actualBudget = budget.ProjectActualBudget,
                                desiredBudget = budget.ProjectDesiredBudget,
                                actualEndDate = dates.ActualEndDate,
                                actualStartDate = dates.ActualStartDate,
                                archiveDate = dates.ArchiveDate,
                                contactedDate = dates.ContactedDate,
                                scheduledEndDate = dates.ScheduledEndDate,
                                scheduledStartDate = dates.ScheduledStartDate,
                                requestedDate = dates.RequestedDate,
                                mostResentuUpdate = (db.tblProjectStatusUpdates.Where(s => s.ProjectID == pList.ProjectID).OrderByDescending(d => d.ProjectStatusUpdateDate).Select(s => s.ProjectStatusUpdate)).FirstOrDefault(),
                                projectRequestType = (from r in re
                                                      select new ProjectRequestType
                                                      {
                                                          id = r.ProjectRequestTypeID,
                                                          name = r.ProjectRequestTypeName
                                                      }).FirstOrDefault(),
                                hsisPrimaryLead = (from p in prime
                                                   select new ProjectHSISp
                                                   {
                                                       id = p.PrimaryLeadID,
                                                       name = p.PrimaryLeadName
                                                   }).FirstOrDefault(),
                                hsisSecondaryLead = (from s in second
                                                     select new ProjectHSISs
                                                     {
                                                         id = s.SecondaryLeadID,
                                                         name = s.SecondaryLeadName
                                                     }).FirstOrDefault(),
                                projectSize = (from s in sizes
                                               select new ProjectSize
                                               {
                                                   id = s.ProjectSizeID,
                                                   name = s.ProjectSizeName
                                               }).FirstOrDefault(),
                                projectPriority = (from p in priorities
                                                   select new ProjectPriority
                                                   {
                                                       id = p.PriorityID,
                                                       name = p.PriorityName
                                                   }).FirstOrDefault(),
                                projectStatus = (from s in statuses
                                                 select new ProjectStatus
                                                 {
                                                     id = s.StatusID,
                                                     name = s.StatusName
                                                 }).FirstOrDefault(),
                                requester = (from p in db.tblProjectInformations
                                             join r in db.tblProjectRequesters on p.ProjectRequesterID equals r.ProjectRequesterID
                                             where r.ProjectRequesterID == arequester.ProjectRequesterID
                                             select new Requester
                                             {
                                                 id = r.ProjectRequesterID,
                                                 name = r.ProjectRequesterName,
                                                 phone = r.ProjectRequesterPhone,
                                                 email = r.ProjectRequesterEmail
                                             }).FirstOrDefault(),
                                AvaliableCategories = (from categories in db.tblCategories
                                                       select new Category
                                                       {
                                                           id = categories.CategoryID,
                                                           name = categories.CategoryName
                                                       }).DefaultIfEmpty().ToList(),
                                AvaliableFacilities = (from facilities in db.tblFacilities
                                                       select new Facility
                                                       {
                                                           id = facilities.FacitityID,
                                                           name = facilities.FacitityName
                                                       }).DefaultIfEmpty().ToList(),
                                SelectedCategories = (from c in db.tblCategories
                                                      join bridge in db.tblProjectCategories on c.CategoryID equals bridge.CategoryID
                                                      where bridge.ProjectID == pList.ProjectID
                                                      select new Category
                                                      {
                                                          id = c.CategoryID,
                                                          name = c.CategoryName
                                                      }).ToList(),
                                SelectedFacilities = (from f in db.tblFacilities
                                                      join bridge in db.tblProjectFacilities on f.FacitityID equals bridge.FacilityID
                                                      where bridge.ProjectID == pList.ProjectID
                                                      select new Facility
                                                      {
                                                          id = f.FacitityID,
                                                          name = f.FacitityName
                                                      }).ToList(),
                                statusUpdates = (from su in db.tblProjectStatusUpdates
                                                 where su.ProjectID == pList.ProjectID
                                                 select new StatusUpdate
                                                 {
                                                     update = su.ProjectStatusUpdate,
                                                     date = su.ProjectStatusUpdateDate
                                                 }).ToList()
                            }).ToList();
            return projects;
        }
        public ProjectList queryToProjectList(IEnumerable<ProjectList> input)
        {
            var output = (from project in input
                          select new ProjectList
                          {
                              projectID = project.projectID,
                              requester = project.requester,
                              projectName = project.projectName,
                              departmentOFRequest = project.departmentOFRequest,
                              projectSubmitter = project.projectSubmitter,
                              projectResouces = project.projectResouces,
                              ranking = project.ranking,
                              laborHr = project.laborHr,
                              currentState = project.currentState,
                              futureState = project.futureState,
                              actualBudget = project.actualBudget,
                              desiredBudget = project.desiredBudget,
                              projectRequestType = project.projectRequestType,
                              hsisPrimaryLead = project.hsisPrimaryLead,
                              hsisSecondaryLead = project.hsisSecondaryLead,
                              projectSize = project.projectSize,
                              projectPriority = project.projectPriority,
                              projectStatus = project.projectStatus,
                              actualEndDate = project.actualEndDate,
                              actualStartDate = project.actualStartDate,
                              archiveDate = project.archiveDate,
                              contactedDate = project.contactedDate,
                              scheduledEndDate = project.scheduledEndDate,
                              scheduledStartDate = project.scheduledStartDate,
                              requestedDate = project.requestedDate,
                              mostResentuUpdate = project.mostResentuUpdate,
                              AvaliableCategories = project.AvaliableCategories,
                              AvaliableFacilities = project.AvaliableFacilities,
                              SelectedCategories = project.SelectedCategories,
                              SelectedFacilities = project.SelectedFacilities,
                              statusUpdates = project.statusUpdates
                          }).Single();
            return output;
        }

        private string filterTypeToTableName(string selectedFilter)
        {
            Type pListClass = typeof(ProjectList);
            PropertyInfo[] mInfo = pListClass.GetProperties();
            string list = null;
            foreach (PropertyInfo item in mInfo)
            {
                try
                {
                    DisplayNameAttribute info = (DisplayNameAttribute)Attribute.GetCustomAttribute(item, typeof(DisplayNameAttribute));
                    if (selectedFilter == info.DisplayName)
                    {
                        list = item.Name;
                    }
                }
                catch (Exception e)
                {

                }
            }
            return list;
        }
    }
}